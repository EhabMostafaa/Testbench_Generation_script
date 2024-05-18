module Shift #(
    parameter WIDTH = 8
) 
(
    input               CLK,
    input   wire        RST,
    input        [WIDTH-1:0]  A, 
    input        [WIDTH-1:0]  B,
    output reg [WIDTH:0]      OUT1,
    output reg [WIDTH:0]      OUT2,
    output reg [WIDTH:0]      OUT3
 
);
  
always @(posedge CLK or negedge RST)
begin
    if(!RST) begin
        OUT1 <= 'b0;
    end
    else begin
        OUT1 <= A>>2;
    end
end
always @(posedge CLK or negedge RST)
begin
    if(!RST) begin
        OUT2 <= 'b0;
    end
    else begin

        OUT2 <= B<<2;


    end
end
always @(posedge CLK or negedge RST)
begin
    if(!RST) begin
        OUT3 <= 'b0;


    end
    else begin

        OUT3 <= A+B;

    end
end


endmodule