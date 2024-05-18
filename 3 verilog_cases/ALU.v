module ALU #(
    parameter WIDTH = 16
) 
(
    input wire [WIDTH-1:0]  A, 
    input  [WIDTH-1:0]  B,
    input wire [1:0]        ALU_FUN,
    input               CLK,
    input wire              RST,
    output reg [WIDTH:0]  ALU_OUT
 
);
  

always @(posedge CLK or negedge RST)
begin
    if(!RST) begin
        ALU_OUT <= 'b0;
    end
    case(ALU_FUN) 
    2'b00:   ALU_OUT <= A+B   ;
    2'b01:   ALU_OUT <= A-B   ;
    2'b10:   ALU_OUT <= A & B ;
    2'b11:   ALU_OUT <= A | B ;
    default: ALU_OUT <= 16'b0 ;
    endcase
end


endmodule