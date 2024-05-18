module MUX #(
    parameter WIDTH = 8
) 
(
    input wire [WIDTH-1:0]  A, 
    input wire [WIDTH-1:0]  B,
    input wire              sel,
    input wire              add,
    input wire              sub,
    input wire              in_data,
    input wire              CLK,
    input wire              RST,
    output reg [WIDTH:0]    result
 
);

always @(posedge CLK or negedge RST) 
begin
    if(!RST) begin
        result <= 'b0;
    end 
    if(in_data) begin
        result <= A;
    end 
    else if (sel) begin
        result <= B;
    end 
    else if (add) begin
        result <= A+B;
    end 
    else if (sub) begin
        result <= A-B;
    end 
    else begin
        result <= 0;
    end
end


endmodule