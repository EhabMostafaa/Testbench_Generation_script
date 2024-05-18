import random
import ast
import All_Parsers
def evaluate_verilog_logic(logic, input_values):
    # Parse the logic expression into an AST
    ast_node = ast.parse(logic, mode='eval')

    # Define a recursive function to evaluate the AST
    def evaluate_ast(node):
        if isinstance(node, ast.Name):
            # If the node is a variable, return its corresponding input value
            return input_values[node.id]
        elif isinstance(node, ast.Num):
            # If the node is a number, return its value
            return node.n
        elif isinstance(node, ast.BinOp):
            # If the node is a binary operator, evaluate the left and right operands recursively
            left_val = evaluate_ast(node.left)
            right_val = evaluate_ast(node.right)
            # Evaluate the operator and return the result
            if isinstance(node.op, ast.Add):
                return left_val + right_val
            elif isinstance(node.op, ast.Sub):
                return left_val - right_val
            elif isinstance(node.op, ast.Mult):
                return left_val * right_val
            elif isinstance(node.op, ast.Div):
                return left_val / right_val
            elif isinstance(node.op, ast.Mod):
                return left_val % right_val
            elif isinstance(node.op, ast.BitAnd):
                return left_val & right_val
            elif isinstance(node.op, ast.BitOr):
                return left_val | right_val
            elif isinstance(node.op, ast.BitXor):
                return left_val ^ right_val
            elif isinstance(node.op, ast.LShift):
                return left_val << right_val
            elif isinstance(node.op, ast.RShift):
                return left_val >> right_val
            else:
                raise ValueError(f"Unsupported operator: {node.op}")
        elif isinstance(node, ast.Compare):
            # If the node is a comparison operator, evaluate the left and right operands recursively
            left_val = evaluate_ast(node.left)
            right_val = evaluate_ast(node.comparators[0])
            # Evaluate the operator and return the result
            if isinstance(node.ops[0], ast.Eq):
                return left_val == right_val
            elif isinstance(node.ops[0], ast.NotEq):
                return left_val != right_val
            elif isinstance(node.ops[0], ast.Lt):
                return left_val < right_val
            elif isinstance(node.ops[0], ast.LtE):
                return left_val <= right_val
            elif isinstance(node.ops[0], ast.Gt):
                return left_val > right_val
            elif isinstance(node.ops[0], ast.GtE):
                return left_val >= right_val
            else:
                raise ValueError(f"Unsupported operator: {node.ops[0]}")
        elif isinstance(node, ast.IfExp):
            # If the node is a ternary operator, evaluate the condition, true value, and false value recursively
            cond_val = evaluate_ast(node.test)
            true_val = evaluate_ast(node.body)
            false_val = evaluate_ast(node.orelse)
            # Return the true value if the condition is true, and the false value otherwise
            return true_val if cond_val else false_val
        else:
            raise ValueError(f"Unsupported node type: {type(node)}")

    # Evaluate the AST and return the result
    return evaluate_ast(ast_node.body)

def generate_test_cases(design_info, num_cases):
    input_signals = design_info['input_signals']
    output_signals = design_info['output_signals']

    test_cases = []
    for i in range(num_cases):
        # Generate random input values for the input signals
        input_values = {}
        for signal in input_signals:
            value = None
            # if signal['data_type'] == 'int':
            value = random.randint(*signal['range'])
            # elif signal['data_type'] == 'float':
            #     value = random.uniform(*signal['range'])
            # Add more data types as needed
            input_values[signal['name']] = value

        # Compute the expected output values for the output signals
        expected_output_values = {}
        for signal in output_signals:
            # Evaluate the Verilog module's logic using the input values to compute the expected output value
            expected_output_values[signal['name']] = evaluate_verilog_logic(signal['logic'], input_values)

        # Add the input and expected output values to the test case list
        test_cases.append((input_values, expected_output_values))
    return test_cases

def generate_test_bench(design_info, test_cases):
    input_signals = design_info['input_signals']
    output_signals = design_info['output_signals']
    input_ports = design_info['input_ports']
    output_ports = design_info['output_ports']
    parameters = design_info.get("parameter", {})
    CLK_PERIOD = 10
    reset_init = 0 if design_info["reset"][1] == 'negedge' else 1
    inputs=('\n'.join( f"reg {input_ports[signal]} {signal}_TB;" for signal in input_ports))
    outputs=('\n'.join( f"wire {output_ports[signal]} {signal}_TB;" for signal in output_ports))
    monitor = (','.join( f"{signal['name']}_TB = %d  " for signal in input_signals +output_signals ))
    monitor_signal = (','.join( f"{signal['name']}_TB" for signal in input_signals +output_signals ))
    # Generate the module header
    test_bench = "`timescale 1ns/1ps\n\n"
    test_bench += f"module {design_info['module_name']}_TB;\n"
    test_bench += f"\n\n\nlocalparam       "
    test_bench += ('\n              '.join( f"{signal} = {parameters[signal]}," for signal in parameters))
    test_bench += f"\n                 CLK_PERIOD =  {CLK_PERIOD};\n"
    test_bench +=f"""\n
 //CLOCK AND RESET\n
 reg {design_info["clock"]}_TB;
 reg {design_info["reset"][0]}_TB;\n\n"""

    test_bench += f"""{inputs}\n\n\n\n"""

    test_bench += f"""{outputs}\n\n\n\n"""


    test_bench +=f"""// Stimulus and checking 
initial begin\n\n
 INIT();
 RESET();



"""
    # Generate the test bench test cases
    test_bench += f"  $monitor(\""
    test_bench += monitor
    test_bench += f"\","
    test_bench += monitor_signal
    test_bench += f");\n"

    for i, test_case in enumerate(test_cases):
        # Unpack the input and expected output values from the test case tuple
        input_values, expected_output_values = test_case

        # Generate the test bench stimulus for the input signals
        test_bench += f"  // TEST CASE {i+1}\n"
        for signal in input_signals:
            test_bench += f"  {signal['name']}_TB = '{bin(input_values[signal['name']])[1:]};\n"
        test_bench += "\n"
        # Generate the test bench expected output checks
        # for signal in output_signals:
        #     test_bench += f"""  if($signed({signal['name']}_TB) == {int(expected_output_values[signal['name']])})"""
        #     test_bench += f""" $display("TEST CASE {i+1} For Output {signal['name']} SUCEEDED");\n"""
        #     test_bench += f""" else $display("Test Case{i+1} For Output {signal['name']} FAILED");\n"""
        test_bench += f"""  #CLK_PERIOD"""
        test_bench += "\n"
    test_bench +="$stop;\n"

    test_bench += "end\n"


    test_bench +=f"""// Reset
task RESET;
begin
 {design_info["reset"][0]}_TB = { int(not reset_init)};
#CLK_PERIOD //REMEBER THAT THIS VALUE IS TAKEN FROM GUI 
 {design_info["reset"][0]}_TB = {reset_init};
#CLK_PERIOD
 {design_info["reset"][0]}_TB = { int(not reset_init)};
end
endtask\n\n"""

    test_bench +=f"""// INITIALIZATION
task INIT;
begin\n
{design_info["clock"]}_TB = 0;"""
    for signal in input_signals:
        test_bench += f"\n{signal['name']}_TB = 'b0;"
    test_bench += "\n"

    test_bench +=f"""
end
endtask\n\n"""

    test_bench +=f"""
//CLOCK      
always #(CLK_PERIOD/2) {design_info["clock"]}_TB = ~{design_info["clock"]}_TB;\n\n\n\n\n"""

    # Generate the test bench instance of the Verilog module
    test_bench += f"{design_info['module_name']} #( "
    test_bench +=  (','.join( f".{signal}({signal})" for signal in parameters))
    test_bench += f") DUT(\n"
    test_bench += f" .{design_info['clock']}({design_info['clock']}_TB),\n .{design_info['reset'][0]}({design_info['reset'][0]}_TB),\n"
    test_bench += ('\n'.join( f" .{signal['name']}({signal['name']}_TB)," for signal in input_signals))
    test_bench += (','.join( f"\n .{signal['name']}({signal['name']}_TB)" for signal in output_signals))
    test_bench += "\n);\n\n"
    # Generate the test bench footer
    test_bench += "endmodule\n"

    return test_bench

# Example usage:
# design_info = {
#     "module_name": "ALU",
#     "input_ports": {"A": "[WIDTH-1:0]", "B":"[WIDTH-1:0]","ALU_FUN":"[1:0]"},
#     "output_ports": {" ALU_OUT": "[WIDTH:0]"},
#     "parameter":{"WIDTH": 16},
#     "clock": "CLK",
#     "reset": ("RST","negedge"),
#     'input_signals': [
#         {'name': 'A','range': (0, 255)},
#         {'name': 'B','range': (0, 255)},
#         {'name': 'ALU_FUN','range': (0, 3)},
#     ],
#     'output_signals': [
#         {'name': ' ALU_OUT','logic': 'A+B if ALU_FUN == 0 else A-B if ALU_FUN ==1 else A&B if ALU_FUN==2 else A|B if ALU_FUN==3 else 0'},
             
#     ]
# }
# reading the verilog file
# with open('shift.v', 'r') as file:
#    verilog_code = file.read()
# #print(verilog_code)
design_info=All_Parsers.output_dict
# print(design_info)


# design_info = {
#     "module_name": "Shift",
#     "input_ports": {"A": "[WIDTH-1:0]", "B":"[WIDTH-1:0]"},
#     "output_ports": {"OUT1": "[WIDTH:0]","OUT2": "[WIDTH:0]","OUT3": "[WIDTH:0]"},
#     "parameter":{"WIDTH": 8},
#     "clock": "CLK",
#     "reset": ("RST","negedge"),
#     'input_signals': [
#         {'name': 'A','range': (0, 255)},
#         {'name': 'B','range': (0, 255)},
#     ],
#     'output_signals': [
#         {'name': 'OUT1','logic':'A>>2'},
#         {'name': 'OUT2','logic':'B<<2'},
#         {'name': 'OUT3','logic':'A+B'},
             
#     ]
# }


# design_info = {
#     "module_name": "MUX",
#     "input_ports": {"A": "[WIDTH-1:0]", "B":"[WIDTH-1:0]","in_data":"","add":"","sub":"","sel":""},
#     "output_ports": {" result": "[WIDTH:0]"},
#     "parameter":{"WIDTH": 8},
#     "clock": "CLK",
#     "reset": ("RST","negedge"),
#     'input_signals': [
#         {'name': 'A','range': (0, 255)},
#         {'name': 'B','range': (0, 255)},
#         {'name': 'in_data','range': (0, 1)},
#         {'name': 'add','range': (0, 1)},
#         {'name': 'sub','range': (0, 1)}, 
#         {'name': 'sel','range': (0, 1)},
#     ],
#     'output_signals': [
#         {'name': 'result','logic': 'A if in_data==1 else B if sel==1 else A+B if add==1 else A-B if sub==1 else 0'},
             
#     ]
# }
# test_bench = generate_test_bench(design_info)
test_cases = generate_test_cases(design_info, num_cases=100)
test_bench = generate_test_bench(design_info, test_cases)

# print(test_bench)
# print(test_bench)

with open(f'''{design_info["module_name"]}_TB.v''', 'w') as f:
    f.write(test_bench)
    f.close()