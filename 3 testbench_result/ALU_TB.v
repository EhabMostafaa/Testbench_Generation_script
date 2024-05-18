`timescale 1ns/1ps

module ALU_TB;



localparam       WIDTH = 16,
                 CLK_PERIOD =  10;


 //CLOCK AND RESET

 reg CLK_TB;
 reg RST_TB;

reg [WIDTH-1:0] A_TB;
reg [WIDTH-1:0] B_TB;
reg [1:0] ALU_FUN_TB;



wire [WIDTH:0]  ALU_OUT_TB;



// Stimulus and checking 
initial begin


 INIT();
 RESET();



  $monitor("A_TB = %d  ,B_TB = %d  ,ALU_FUN_TB = %d  , ALU_OUT_TB = %d  ",A_TB,B_TB,ALU_FUN_TB, ALU_OUT_TB);
  // TEST CASE 1
  A_TB = 'b11;
  B_TB = 'b10100101;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 2
  A_TB = 'b10110000;
  B_TB = 'b110011;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 3
  A_TB = 'b11100110;
  B_TB = 'b11011;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 4
  A_TB = 'b10110;
  B_TB = 'b11001010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 5
  A_TB = 'b110001;
  B_TB = 'b110011;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 6
  A_TB = 'b11001111;
  B_TB = 'b10000010;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 7
  A_TB = 'b1010111;
  B_TB = 'b10001110;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 8
  A_TB = 'b11001001;
  B_TB = 'b110111;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 9
  A_TB = 'b110100;
  B_TB = 'b11110000;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 10
  A_TB = 'b10000100;
  B_TB = 'b111000;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 11
  A_TB = 'b110111;
  B_TB = 'b10110101;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 12
  A_TB = 'b10010011;
  B_TB = 'b10001001;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 13
  A_TB = 'b10001000;
  B_TB = 'b100111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 14
  A_TB = 'b10100;
  B_TB = 'b10100100;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 15
  A_TB = 'b11101101;
  B_TB = 'b101001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 16
  A_TB = 'b1000100;
  B_TB = 'b11011110;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 17
  A_TB = 'b1010010;
  B_TB = 'b1100110;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 18
  A_TB = 'b1000;
  B_TB = 'b1011011;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 19
  A_TB = 'b10100110;
  B_TB = 'b10000110;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 20
  A_TB = 'b11100000;
  B_TB = 'b11010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 21
  A_TB = 'b1010011;
  B_TB = 'b10010010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 22
  A_TB = 'b1000101;
  B_TB = 'b1000101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 23
  A_TB = 'b11000001;
  B_TB = 'b1001000;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 24
  A_TB = 'b1111001;
  B_TB = 'b100101;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 25
  A_TB = 'b100;
  B_TB = 'b11111;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 26
  A_TB = 'b10111011;
  B_TB = 'b10101111;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 27
  A_TB = 'b10100110;
  B_TB = 'b1110000;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 28
  A_TB = 'b10100110;
  B_TB = 'b10110001;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 29
  A_TB = 'b111110;
  B_TB = 'b1101;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 30
  A_TB = 'b1001001;
  B_TB = 'b100101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 31
  A_TB = 'b100100;
  B_TB = 'b11011110;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 32
  A_TB = 'b11111101;
  B_TB = 'b1011110;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 33
  A_TB = 'b1111010;
  B_TB = 'b1100000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 34
  A_TB = 'b10111110;
  B_TB = 'b11010101;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 35
  A_TB = 'b1000010;
  B_TB = 'b1;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 36
  A_TB = 'b1001011;
  B_TB = 'b110000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 37
  A_TB = 'b10;
  B_TB = 'b1100110;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 38
  A_TB = 'b11100000;
  B_TB = 'b11111001;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 39
  A_TB = 'b10101;
  B_TB = 'b11001001;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 40
  A_TB = 'b11010101;
  B_TB = 'b101001;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 41
  A_TB = 'b11000010;
  B_TB = 'b1101010;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 42
  A_TB = 'b1101;
  B_TB = 'b11101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 43
  A_TB = 'b10;
  B_TB = 'b1111011;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 44
  A_TB = 'b11011100;
  B_TB = 'b10001101;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 45
  A_TB = 'b10011010;
  B_TB = 'b110001;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 46
  A_TB = 'b10000110;
  B_TB = 'b11101001;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 47
  A_TB = 'b10001101;
  B_TB = 'b10000101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 48
  A_TB = 'b11110;
  B_TB = 'b1101010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 49
  A_TB = 'b10100;
  B_TB = 'b11000001;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 50
  A_TB = 'b10011100;
  B_TB = 'b10100100;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 51
  A_TB = 'b100;
  B_TB = 'b100110;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 52
  A_TB = 'b10010100;
  B_TB = 'b11101010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 53
  A_TB = 'b1101000;
  B_TB = 'b10001011;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 54
  A_TB = 'b10111;
  B_TB = 'b10000111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 55
  A_TB = 'b10111110;
  B_TB = 'b10001001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 56
  A_TB = 'b10001101;
  B_TB = 'b1110010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 57
  A_TB = 'b11000;
  B_TB = 'b10110000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 58
  A_TB = 'b10;
  B_TB = 'b10100110;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 59
  A_TB = 'b10101010;
  B_TB = 'b1111000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 60
  A_TB = 'b10100110;
  B_TB = 'b1000;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 61
  A_TB = 'b10111010;
  B_TB = 'b11011111;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 62
  A_TB = 'b10000010;
  B_TB = 'b11100001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 63
  A_TB = 'b11110111;
  B_TB = 'b11100101;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 64
  A_TB = 'b11100100;
  B_TB = 'b10010;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 65
  A_TB = 'b10000110;
  B_TB = 'b1011100;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 66
  A_TB = 'b11101100;
  B_TB = 'b11111001;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 67
  A_TB = 'b11111;
  B_TB = 'b10100010;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 68
  A_TB = 'b10010100;
  B_TB = 'b11100;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 69
  A_TB = 'b10100101;
  B_TB = 'b1010;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 70
  A_TB = 'b10011010;
  B_TB = 'b10001011;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 71
  A_TB = 'b1000111;
  B_TB = 'b110101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 72
  A_TB = 'b10000001;
  B_TB = 'b100101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 73
  A_TB = 'b1010101;
  B_TB = 'b10100010;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 74
  A_TB = 'b10100011;
  B_TB = 'b1010110;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 75
  A_TB = 'b10101001;
  B_TB = 'b1011010;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 76
  A_TB = 'b1110000;
  B_TB = 'b10100001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 77
  A_TB = 'b10000101;
  B_TB = 'b10011101;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 78
  A_TB = 'b10010001;
  B_TB = 'b100001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 79
  A_TB = 'b111110;
  B_TB = 'b10010100;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 80
  A_TB = 'b1011000;
  B_TB = 'b11101100;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 81
  A_TB = 'b10001;
  B_TB = 'b10000001;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 82
  A_TB = 'b10101011;
  B_TB = 'b111011;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 83
  A_TB = 'b11000111;
  B_TB = 'b11110111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 84
  A_TB = 'b1110101;
  B_TB = 'b1111010;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 85
  A_TB = 'b10110;
  B_TB = 'b1110110;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 86
  A_TB = 'b10101100;
  B_TB = 'b10111111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 87
  A_TB = 'b1111111;
  B_TB = 'b11101010;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 88
  A_TB = 'b111101;
  B_TB = 'b11011001;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 89
  A_TB = 'b1000111;
  B_TB = 'b11000110;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 90
  A_TB = 'b10001010;
  B_TB = 'b10101111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 91
  A_TB = 'b11011111;
  B_TB = 'b1011101;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 92
  A_TB = 'b1011110;
  B_TB = 'b11011;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 93
  A_TB = 'b1100010;
  B_TB = 'b1000000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 94
  A_TB = 'b1110110;
  B_TB = 'b111111;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 95
  A_TB = 'b10001101;
  B_TB = 'b11011010;
  ALU_FUN_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 96
  A_TB = 'b1001111;
  B_TB = 'b11000000;
  ALU_FUN_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 97
  A_TB = 'b10010110;
  B_TB = 'b11001011;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 98
  A_TB = 'b11011110;
  B_TB = 'b10100111;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 99
  A_TB = 'b1100111;
  B_TB = 'b1011110;
  ALU_FUN_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 100
  A_TB = 'b11010001;
  B_TB = 'b11011000;
  ALU_FUN_TB = 'b0;

  #CLK_PERIOD
$stop;
end
// Reset
task RESET;
begin
 RST_TB = 1;
#CLK_PERIOD //REMEBER THAT THIS VALUE IS TAKEN FROM GUI 
 RST_TB = 0;
#CLK_PERIOD
 RST_TB = 1;
end
endtask

// INITIALIZATION
task INIT;
begin

CLK_TB = 0;
A_TB = 'b0;
B_TB = 'b0;
ALU_FUN_TB = 'b0;

end
endtask


//CLOCK      
always #(CLK_PERIOD/2) CLK_TB = ~CLK_TB;




ALU #( .WIDTH(WIDTH)) DUT(
 .CLK(CLK_TB),
 .RST(RST_TB),
 .A(A_TB),
 .B(B_TB),
 .ALU_FUN(ALU_FUN_TB),
 . ALU_OUT( ALU_OUT_TB)
);

endmodule
