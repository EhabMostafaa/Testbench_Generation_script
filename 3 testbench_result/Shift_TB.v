`timescale 1ns/1ps

module Shift_TB;



localparam       WIDTH = 8,
                 CLK_PERIOD =  10;


 //CLOCK AND RESET

 reg CLK_TB;
 reg RST_TB;

reg [WIDTH-1:0] A_TB;
reg [WIDTH-1:0] B_TB;



wire [WIDTH:0] OUT1_TB;
wire [WIDTH:0] OUT2_TB;
wire [WIDTH:0] OUT3_TB;



// Stimulus and checking 
initial begin


 INIT();
 RESET();



  $monitor("A_TB = %d  ,B_TB = %d  ,OUT1_TB = %d  ,OUT2_TB = %d  ,OUT3_TB = %d  ",A_TB,B_TB,OUT1_TB,OUT2_TB,OUT3_TB);
  // TEST CASE 1
  A_TB = 'b10010100;
  B_TB = 'b11011110;

  #CLK_PERIOD
  // TEST CASE 2
  A_TB = 'b111010;
  B_TB = 'b1101111;

  #CLK_PERIOD
  // TEST CASE 3
  A_TB = 'b10100;
  B_TB = 'b10010110;

  #CLK_PERIOD
  // TEST CASE 4
  A_TB = 'b11110011;
  B_TB = 'b110111;

  #CLK_PERIOD
  // TEST CASE 5
  A_TB = 'b111111;
  B_TB = 'b10111;

  #CLK_PERIOD
  // TEST CASE 6
  A_TB = 'b10010111;
  B_TB = 'b11100000;

  #CLK_PERIOD
  // TEST CASE 7
  A_TB = 'b11010001;
  B_TB = 'b10110110;

  #CLK_PERIOD
  // TEST CASE 8
  A_TB = 'b11111010;
  B_TB = 'b101001;

  #CLK_PERIOD
  // TEST CASE 9
  A_TB = 'b11111010;
  B_TB = 'b1100011;

  #CLK_PERIOD
  // TEST CASE 10
  A_TB = 'b0;
  B_TB = 'b1000100;

  #CLK_PERIOD
  // TEST CASE 11
  A_TB = 'b10100000;
  B_TB = 'b10100010;

  #CLK_PERIOD
  // TEST CASE 12
  A_TB = 'b11101001;
  B_TB = 'b11111101;

  #CLK_PERIOD
  // TEST CASE 13
  A_TB = 'b1101101;
  B_TB = 'b11111010;

  #CLK_PERIOD
  // TEST CASE 14
  A_TB = 'b1110110;
  B_TB = 'b1100111;

  #CLK_PERIOD
  // TEST CASE 15
  A_TB = 'b10001100;
  B_TB = 'b10001101;

  #CLK_PERIOD
  // TEST CASE 16
  A_TB = 'b11000011;
  B_TB = 'b11111011;

  #CLK_PERIOD
  // TEST CASE 17
  A_TB = 'b11010001;
  B_TB = 'b101100;

  #CLK_PERIOD
  // TEST CASE 18
  A_TB = 'b10010110;
  B_TB = 'b11110011;

  #CLK_PERIOD
  // TEST CASE 19
  A_TB = 'b10010;
  B_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 20
  A_TB = 'b1111010;
  B_TB = 'b1010010;

  #CLK_PERIOD
  // TEST CASE 21
  A_TB = 'b10011101;
  B_TB = 'b10010111;

  #CLK_PERIOD
  // TEST CASE 22
  A_TB = 'b1001011;
  B_TB = 'b1110000;

  #CLK_PERIOD
  // TEST CASE 23
  A_TB = 'b10100011;
  B_TB = 'b1000100;

  #CLK_PERIOD
  // TEST CASE 24
  A_TB = 'b100;
  B_TB = 'b11111101;

  #CLK_PERIOD
  // TEST CASE 25
  A_TB = 'b101;
  B_TB = 'b1101100;

  #CLK_PERIOD
  // TEST CASE 26
  A_TB = 'b1110111;
  B_TB = 'b10101000;

  #CLK_PERIOD
  // TEST CASE 27
  A_TB = 'b11101011;
  B_TB = 'b11101000;

  #CLK_PERIOD
  // TEST CASE 28
  A_TB = 'b11101111;
  B_TB = 'b111011;

  #CLK_PERIOD
  // TEST CASE 29
  A_TB = 'b11101;
  B_TB = 'b10;

  #CLK_PERIOD
  // TEST CASE 30
  A_TB = 'b11111111;
  B_TB = 'b11011;

  #CLK_PERIOD
  // TEST CASE 31
  A_TB = 'b10100100;
  B_TB = 'b11101011;

  #CLK_PERIOD
  // TEST CASE 32
  A_TB = 'b1000110;
  B_TB = 'b10100;

  #CLK_PERIOD
  // TEST CASE 33
  A_TB = 'b101000;
  B_TB = 'b10100110;

  #CLK_PERIOD
  // TEST CASE 34
  A_TB = 'b1010111;
  B_TB = 'b1100100;

  #CLK_PERIOD
  // TEST CASE 35
  A_TB = 'b10101111;
  B_TB = 'b11101101;

  #CLK_PERIOD
  // TEST CASE 36
  A_TB = 'b11100110;
  B_TB = 'b1010110;

  #CLK_PERIOD
  // TEST CASE 37
  A_TB = 'b1011000;
  B_TB = 'b110010;

  #CLK_PERIOD
  // TEST CASE 38
  A_TB = 'b11011100;
  B_TB = 'b100110;

  #CLK_PERIOD
  // TEST CASE 39
  A_TB = 'b1110101;
  B_TB = 'b111110;

  #CLK_PERIOD
  // TEST CASE 40
  A_TB = 'b110101;
  B_TB = 'b10100010;

  #CLK_PERIOD
  // TEST CASE 41
  A_TB = 'b1010101;
  B_TB = 'b11110011;

  #CLK_PERIOD
  // TEST CASE 42
  A_TB = 'b1010010;
  B_TB = 'b10111101;

  #CLK_PERIOD
  // TEST CASE 43
  A_TB = 'b11111001;
  B_TB = 'b10111;

  #CLK_PERIOD
  // TEST CASE 44
  A_TB = 'b1100001;
  B_TB = 'b1111000;

  #CLK_PERIOD
  // TEST CASE 45
  A_TB = 'b1101;
  B_TB = 'b110101;

  #CLK_PERIOD
  // TEST CASE 46
  A_TB = 'b1000000;
  B_TB = 'b10001;

  #CLK_PERIOD
  // TEST CASE 47
  A_TB = 'b10111001;
  B_TB = 'b11110111;

  #CLK_PERIOD
  // TEST CASE 48
  A_TB = 'b1011000;
  B_TB = 'b10001100;

  #CLK_PERIOD
  // TEST CASE 49
  A_TB = 'b11101000;
  B_TB = 'b1000000;

  #CLK_PERIOD
  // TEST CASE 50
  A_TB = 'b10010010;
  B_TB = 'b11011011;

  #CLK_PERIOD
  // TEST CASE 51
  A_TB = 'b110111;
  B_TB = 'b111100;

  #CLK_PERIOD
  // TEST CASE 52
  A_TB = 'b1001011;
  B_TB = 'b10011011;

  #CLK_PERIOD
  // TEST CASE 53
  A_TB = 'b10110111;
  B_TB = 'b11001001;

  #CLK_PERIOD
  // TEST CASE 54
  A_TB = 'b111000;
  B_TB = 'b1001011;

  #CLK_PERIOD
  // TEST CASE 55
  A_TB = 'b1011010;
  B_TB = 'b11001000;

  #CLK_PERIOD
  // TEST CASE 56
  A_TB = 'b10001000;
  B_TB = 'b1010010;

  #CLK_PERIOD
  // TEST CASE 57
  A_TB = 'b10010111;
  B_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 58
  A_TB = 'b11001011;
  B_TB = 'b11100101;

  #CLK_PERIOD
  // TEST CASE 59
  A_TB = 'b11110101;
  B_TB = 'b110101;

  #CLK_PERIOD
  // TEST CASE 60
  A_TB = 'b1110010;
  B_TB = 'b11011011;

  #CLK_PERIOD
  // TEST CASE 61
  A_TB = 'b1010010;
  B_TB = 'b10000110;

  #CLK_PERIOD
  // TEST CASE 62
  A_TB = 'b11011010;
  B_TB = 'b110001;

  #CLK_PERIOD
  // TEST CASE 63
  A_TB = 'b10111011;
  B_TB = 'b10100000;

  #CLK_PERIOD
  // TEST CASE 64
  A_TB = 'b10110000;
  B_TB = 'b1000101;

  #CLK_PERIOD
  // TEST CASE 65
  A_TB = 'b1110011;
  B_TB = 'b10011110;

  #CLK_PERIOD
  // TEST CASE 66
  A_TB = 'b11110000;
  B_TB = 'b1101111;

  #CLK_PERIOD
  // TEST CASE 67
  A_TB = 'b100110;
  B_TB = 'b11000111;

  #CLK_PERIOD
  // TEST CASE 68
  A_TB = 'b10000111;
  B_TB = 'b1111;

  #CLK_PERIOD
  // TEST CASE 69
  A_TB = 'b1100111;
  B_TB = 'b10010;

  #CLK_PERIOD
  // TEST CASE 70
  A_TB = 'b110010;
  B_TB = 'b110001;

  #CLK_PERIOD
  // TEST CASE 71
  A_TB = 'b11111000;
  B_TB = 'b10101001;

  #CLK_PERIOD
  // TEST CASE 72
  A_TB = 'b10110011;
  B_TB = 'b1110000;

  #CLK_PERIOD
  // TEST CASE 73
  A_TB = 'b11011;
  B_TB = 'b10110;

  #CLK_PERIOD
  // TEST CASE 74
  A_TB = 'b10100100;
  B_TB = 'b1010100;

  #CLK_PERIOD
  // TEST CASE 75
  A_TB = 'b1010001;
  B_TB = 'b1010000;

  #CLK_PERIOD
  // TEST CASE 76
  A_TB = 'b1110000;
  B_TB = 'b11110110;

  #CLK_PERIOD
  // TEST CASE 77
  A_TB = 'b11100011;
  B_TB = 'b11101;

  #CLK_PERIOD
  // TEST CASE 78
  A_TB = 'b1010010;
  B_TB = 'b1001;

  #CLK_PERIOD
  // TEST CASE 79
  A_TB = 'b11011100;
  B_TB = 'b10100100;

  #CLK_PERIOD
  // TEST CASE 80
  A_TB = 'b110100;
  B_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 81
  A_TB = 'b10101100;
  B_TB = 'b10111011;

  #CLK_PERIOD
  // TEST CASE 82
  A_TB = 'b10111101;
  B_TB = 'b111011;

  #CLK_PERIOD
  // TEST CASE 83
  A_TB = 'b11110010;
  B_TB = 'b100010;

  #CLK_PERIOD
  // TEST CASE 84
  A_TB = 'b11110011;
  B_TB = 'b110010;

  #CLK_PERIOD
  // TEST CASE 85
  A_TB = 'b1101100;
  B_TB = 'b1011010;

  #CLK_PERIOD
  // TEST CASE 86
  A_TB = 'b1011011;
  B_TB = 'b1101;

  #CLK_PERIOD
  // TEST CASE 87
  A_TB = 'b10101001;
  B_TB = 'b10110100;

  #CLK_PERIOD
  // TEST CASE 88
  A_TB = 'b11010001;
  B_TB = 'b1001011;

  #CLK_PERIOD
  // TEST CASE 89
  A_TB = 'b10101111;
  B_TB = 'b1011101;

  #CLK_PERIOD
  // TEST CASE 90
  A_TB = 'b10000100;
  B_TB = 'b10010100;

  #CLK_PERIOD
  // TEST CASE 91
  A_TB = 'b1011101;
  B_TB = 'b10110001;

  #CLK_PERIOD
  // TEST CASE 92
  A_TB = 'b11110000;
  B_TB = 'b1101111;

  #CLK_PERIOD
  // TEST CASE 93
  A_TB = 'b10010110;
  B_TB = 'b110101;

  #CLK_PERIOD
  // TEST CASE 94
  A_TB = 'b11111100;
  B_TB = 'b1000;

  #CLK_PERIOD
  // TEST CASE 95
  A_TB = 'b1000100;
  B_TB = 'b11;

  #CLK_PERIOD
  // TEST CASE 96
  A_TB = 'b11001111;
  B_TB = 'b10010111;

  #CLK_PERIOD
  // TEST CASE 97
  A_TB = 'b11000;
  B_TB = 'b11011000;

  #CLK_PERIOD
  // TEST CASE 98
  A_TB = 'b1111111;
  B_TB = 'b11100111;

  #CLK_PERIOD
  // TEST CASE 99
  A_TB = 'b11011011;
  B_TB = 'b1100111;

  #CLK_PERIOD
  // TEST CASE 100
  A_TB = 'b111111;
  B_TB = 'b1001101;

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

end
endtask


//CLOCK      
always #(CLK_PERIOD/2) CLK_TB = ~CLK_TB;




Shift #( .WIDTH(WIDTH)) DUT(
 .CLK(CLK_TB),
 .RST(RST_TB),
 .A(A_TB),
 .B(B_TB),
 .OUT1(OUT1_TB),
 .OUT2(OUT2_TB),
 .OUT3(OUT3_TB)
);

endmodule
