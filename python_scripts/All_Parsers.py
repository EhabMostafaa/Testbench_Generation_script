import re
import json

# reading the verilog file
with open('verilog_code_name.v', 'r') as file:
    verilog_code = file.read()
#print(verilog_code)


# Define regular expressions for module, parameter, input, and output declarations
module_re = re.compile(r"module\s+(\w+)\s*(#\s*\((.*?)\))?\s*\((.*?)\);", re.DOTALL)
parameter_re = re.compile(r"parameter\s+(\w+)\s*=\s*([\w']+)")
input_re = re.compile(r"input\s+(?:wire|\s)\s*(\[.*?\])?\s*([\w']+)\s*(,|$)")
output_re = re.compile(r"output\s+(?:reg|wire|\s)\s*(\[.*?\])?\s*([\w']+)\s*(,|.|$)")
assign_re = re.compile(r"assign\s+(.*?)\s*=\s*(.*?);")

if_else_regex = r"\s*if\s*\((.?)\)\s*begin\s(.?)\s*end\s(else\s*if\s*\((.?)\)\s*begin\s(.?)\s*end\s)(else\s*begin\s(.*?)\s*end)?"
if_else_blocks = re.findall(if_else_regex, verilog_code, re.DOTALL)

clock_signal = None

clock_re = re.compile(r"input\s+(?:wire|\s)+(?:clk|clock|CLK|\s)\s*(\[.*?\])?\s*([\w']+)\s*(,|$)")
match = clock_re.search(verilog_code)
if(match):
    clock_signal = match.group(1)

# define a dictionary to hold the always block information
always_dict = {}
sensitivity_dict={}
always_count = 0

# iterate through the code line by line
current_block = None
if_else_flag = None
sensitive_block = {}

# initialize case flag and dictionary
case_flag = False
case_dict = {}


# Extract the module name and parameters
match = module_re.search(verilog_code)
if match:
    module_name = match.group(1)
    parameter_string = match.group(3)

    # Extract parameter names and values
    parameters = {}
    for match in parameter_re.finditer(parameter_string):
        parameter_name = match.group(1)
        parameter_value = match.group(2)
        # If the parameter value contains a parameter name, replace it with the actual value
        if parameter_value in parameters:
            parameter_value = parameters[parameter_value]
        elif parameter_value.isdigit():
            parameter_value = int(parameter_value)
        parameters[parameter_name] = parameter_value

    # Replace parameter values in input and output declarations
    verilog_code = parameter_re.sub("", verilog_code)  # Remove parameter declarations from code
    inputs = []
    input_signals = []
    input_temp = {}
    for match in input_re.finditer(verilog_code):
        input_declaration = match.group(0)
        input_name = match.group(2)
        input_width = match.group(1)
        if "[" in input_declaration:  # Extract the width if it's a vector
            input_width2 = match.group(1)
            if "-" in input_width2:  # Replace parameter names with values in the width declaration
                input_width2 = input_width2.replace("[", "").replace("]", "")
                input_width2 = input_width2.split("-")
                input_width2[0] = input_width2[0].replace(list(parameters.keys())[0], str(list(parameters.values())[0]))
                #input_width[1] = input_width[1].replace(list(parameters.keys())[0], str(list(parameters.values())[0]))
                input_width2 = int(input_width2[0])
            else:  # Otherwise, the width is constant
                #input_width = int(input_width.strip("[]"))
                input_width2 = [int(i) for i in match.group(1).strip("[]").split(":")]
                input_width2 = input_width2[0] - input_width2[1] + 1
        else:  # If the input is not a vector, the width is 1
            input_width2 = 1
        
        if(input_width == None):
            input_width = ""
       
        input_temp = {"name":input_name, "range":(0, (2**int(input_width2))-1)}
        if input_name != "CLK" and input_name != "RST":
            input_signals.append(input_temp)
            inputs.append((input_name, input_width))

    outputs = []
    output_signals = []
    input_temp = {}
    for match in output_re.finditer(verilog_code):
        output_declaration = match.group(0)
        output_name = match.group(2)
        output_width = match.group(1)
        
        if(output_width == None):
            output_width = ""

        outputs.append((output_name, output_width))

    # Extract continuous assignments
    assignments = assign_re.findall(verilog_code)
else:
    print("Module declaration not found")


###################################################################
########################    ALWAYS BLOCKS #########################

for line in verilog_code.split("\n"):
    # check for sequential always block
    if "always @(" in line and ("posedge" in line or "negedge" in line):
        always_count += 1
        sensitive_block = []
        sensitivity_list = re.findall(r"(posedge|negedge)\s+(\w+)", line)
        if sensitivity_list:
            for sensitivity in sensitivity_list:
                edge_type = sensitivity[0]
                signal_name = sensitivity[1]
                sensitivity_dict = {"signal_name": signal_name, "edge_type": edge_type}
                sensitive_block.append(sensitivity_dict)
                #edge_type = "posedge" if "posedge" in line else "negedge"
        always_dict[f"always_{always_count}"] = {"sequential": True, "sensitivity":sensitive_block, "if": [], "else if": [], "else": [], "case statement":[]}
        current_block = always_dict[f"always_{always_count}"]
        if_else_flag = None
            # check for combinational always block
    elif "always @(*)" in line:
        always_count += 1
        always_dict[f"always_{always_count}"] = {"sequential": False, "if": [], "else if": [], "else": [], "case statement":[]}
        current_block = always_dict[f"always_{always_count}"]
        if_else_flag = None
    # check for else if statement inside always block
    elif always_count > 0 and "else if" in line:
        if_dict = {"condition": "", "statements": []}
        current_block["else if"].append(if_dict)
        if_line = line.replace("else if", "").replace("begin", "").strip()
        if_dict["condition"] = if_line
        if_else_flag = "else if"
    # check for if statement inside always block
    elif always_count > 0 and "if" in line:
        if_dict = {"condition": "", "statements": []}
        output_signals_dict = {"name": "", "logic": ""}
        current_block["if"].append(if_dict)
        if_line = line.replace("if", "").replace("begin", "").strip()
        if_dict["condition"] = if_line
        if_else_flag = "if"

    # check for else statement inside always block
    elif always_count > 0 and "else" in line:
        else_dict = {"statements": []}
        current_block["else"].append(else_dict)
        if_else_flag = "else"
    # add line to the last if or else statement
    elif always_count > 0 and "case" in line:
        case_flag = True
        output_signals_dict = {"name": "", "logic": ""}
        case_condition = line.replace("case", "").replace("begin", "").strip()
        case_dict[case_condition] = {}
    # check for case conditions and statements
    elif always_count > 0 and case_flag and "endcase" not in line:
        if ":" in line:
            case, statement = line.strip().split(":")
            output,statement = statement.replace(";","").replace("<","").split('=')
            output_signals_dict["name"] = output.strip()
            if "default" in line:
                output_signals_dict["logic"] += statement.strip() 
            else:
                output_signals_dict["logic"] += statement.strip() + " if " + case_condition + " == " + case + " else "
            #print(output_signals_dict)
            found = False
            for i in range(len(output_signals)):
                if output_signals[i]['name'] == output_signals_dict['name']:
                    output_signals[i] = output_signals_dict
                    found = True
                    break
                
            if not found:
                output_signals.append(output_signals_dict)
            case_dict[case_condition][case.strip()] = statement.strip()
            #current_block["if"][-1]["statements"].append(line.strip()) 
        else:
            
            current_block["case statement"].append(case_dict) ######### zyada now
            case_flag = False
    
    elif always_count > 0 and if_else_flag == "if":
        if line.strip() != "end":
            if "=" in line and ";" in line:
                output,statement = line.replace(";","").replace("<","").split('=')
            output_signals_dict["name"] = output.strip()
            if if_dict["condition"] != "(!RST)" :
                output_signals_dict["logic"] = statement.strip() + " if " + if_dict["condition"].replace("(","").replace(")","")
            #print(if_dict["condition"])
            current_block["if"][-1]["statements"].append(line.strip())
            #current_block["else"][-1]["statements"] = list(filter(None, current_block["else"][-1]["statements"]))
    elif always_count > 0 and if_else_flag == "else if":
        if line.strip() != "end":
            output,statement = line.replace(";","").replace("<","").split('=')
            if if_dict["condition"] != "(!RST)" :
                output_signals_dict["logic"] +=  statement.strip() + " if " + if_dict["condition"].replace("(","").replace(")"," ")
            else:
                output_signals_dict["logic"] += " else " + statement.strip() + " if " + if_dict["condition"].replace("(","").replace(")"," ")
                
            current_block["else if"][-1]["statements"].append(line.strip())
            current_block["else if"][-1]["statements"] = list(filter(None, current_block["else if"][-1]["statements"]))
    elif always_count > 0 and if_else_flag == "else":
        if line.strip() != "end":
            if "=" in line and ";" in line:
                output,statement = line.replace(";","").replace("<","").split('=')
                if if_dict["condition"] != "(!RST)" :
                    output_signals_dict["logic"] += " else " + statement.strip() 
                else:    
                    output_signals_dict["logic"] += statement.strip() 
            #print(output_signals_dict)
            found = False
            for i in range(len(output_signals)):
                if output_signals[i]['name'] == output_signals_dict['name']:
                    output_signals[i] = output_signals_dict
                    found = True
                    break
                
            if not found:
                output_signals.append(output_signals_dict)
            current_block["else"][-1]["statements"].append(line.strip())
            current_block["else"][-1]["statements"] = list(filter(None, current_block["else"][-1]["statements"]))

######################################################################################################
################################## ADD OUTPUTS TO A SINGLE DICT ######################################


# Define an empty dictionary to store the output
output_dict = {}

# Add the module name to the dictionary
output_dict["module_name"] = module_name

# Add the parameters to the dictionary
parameters_dict = {}
for name, value in parameters.items():
    parameters_dict[name] = value
output_dict["parameters"] = parameters_dict

# Add the inputs to the dictionary
inputs_dict = {}
for name, width in inputs:
    inputs_dict[name] = width
output_dict["input_ports"] = inputs_dict

# Add the outputs to the dictionary
outputs_dict = {}
for name, width in outputs:
    outputs_dict[name] = width
output_dict["output_ports"] = outputs_dict

if always_dict[f"always_{always_count}"]["sequential"] == True:
    output_dict["clock"] = sensitive_block[0]
    output_dict["reset"] = sensitive_block[1]

# Add the Assignments to the dictionary
assign_dict = {}
for lhs, rhs in assignments:
    assign_dict[lhs] = rhs.strip()


output_dict["input_signals"] = input_signals
output_dict["output_signals"] = output_signals

#output_dict["assign statement"] = assign_dict

######################################################################################################
#################################### PRINTING OUTPUT DICTIONARY ######################################

#print(output_dict)
#print("design_info = {")
#for key, value in output_dict.items():
#    if key in ['input_signals', 'output_signals']:
#        print(f"    '{key}': [")
#        for item in value:
#            print(f"        {item},")
#        print("    ],")
#    else:
#        print(f"    '{key}': '{value}',")
#print("}")


# Loop through the keys of output_dict
#for key in output_dict:
#    # Get the value of the current key
#    value = output_dict[key]
#    
#    # If the value is a string, evaluate it with eval()
#    if isinstance(value, str) and value != module_name:
#        output_dict[key] = eval(value)

print(output_dict)

print("design_info = {")
for key, value in output_dict.items():
    if key in ['input_signals', 'output_signals']:
        print(f"    '{key}': [")
        for item in value:
            print(f"        {item},")
        print("    ],")
    else:
        print(f"    '{key}': '{value}',")
print("}")


#always_dict = always_dict.replace("end","")
#del always_dict['always_1']['case statement'][0]['end']
for key, value in always_dict.items():
    print(f"{key}:")
    if isinstance(value, dict):
        for inner_key, inner_value in value.items():
            if isinstance(inner_value, list):
                print(f"    {inner_key}:")
                for inner_item in inner_value:
                    print(f"        {inner_item}")
            else:
                print(f"    {inner_key}: {inner_value}")
    else:
        print(f"    {value}")
#
#print(always_dict)
#
#print("\n")
#print(output_dict)
