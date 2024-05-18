`timescale 1ns/1ps

module MUX_TB;



localparam       WIDTH = 8,
                 CLK_PERIOD =  10;


 //CLOCK AND RESET

 reg CLK_TB;
 reg RST_TB;

reg [WIDTH-1:0] A_TB;
reg [WIDTH-1:0] B_TB;
reg  in_data_TB;
reg  add_TB;
reg  sub_TB;
reg  sel_TB;



wire [WIDTH:0]  result_TB;



// Stimulus and checking 
initial begin


 INIT();
 RESET();



  $monitor("A_TB = %d  ,B_TB = %d  ,in_data_TB = %d  ,add_TB = %d  ,sub_TB = %d  ,sel_TB = %d  ,result_TB = %d  ",A_TB,B_TB,in_data_TB,add_TB,sub_TB,sel_TB,result_TB);
  // TEST CASE 1
  A_TB = 'b10001001;
  B_TB = 'b1011000;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 2
  A_TB = 'b1110110;
  B_TB = 'b10000;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 3
  A_TB = 'b1011001;
  B_TB = 'b11000001;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 4
  A_TB = 'b11000;
  B_TB = 'b11000011;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 5
  A_TB = 'b10010100;
  B_TB = 'b1011000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 6
  A_TB = 'b101001;
  B_TB = 'b11001010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 7
  A_TB = 'b10100;
  B_TB = 'b10000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 8
  A_TB = 'b111011;
  B_TB = 'b1101010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 9
  A_TB = 'b10000111;
  B_TB = 'b11011010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 10
  A_TB = 'b11000110;
  B_TB = 'b10011001;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 11
  A_TB = 'b11110101;
  B_TB = 'b10100000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 12
  A_TB = 'b1111011;
  B_TB = 'b1110101;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 13
  A_TB = 'b11000010;
  B_TB = 'b11001100;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 14
  A_TB = 'b11010101;
  B_TB = 'b10100010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 15
  A_TB = 'b1111011;
  B_TB = 'b10000000;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 16
  A_TB = 'b10111101;
  B_TB = 'b11001010;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 17
  A_TB = 'b10000011;
  B_TB = 'b10000101;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 18
  A_TB = 'b11101010;
  B_TB = 'b101111;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 19
  A_TB = 'b1001100;
  B_TB = 'b10110010;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 20
  A_TB = 'b1100001;
  B_TB = 'b10010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 21
  A_TB = 'b11000111;
  B_TB = 'b10010011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 22
  A_TB = 'b11100111;
  B_TB = 'b11011010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 23
  A_TB = 'b11010001;
  B_TB = 'b10101100;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 24
  A_TB = 'b10100101;
  B_TB = 'b111001;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 25
  A_TB = 'b11110000;
  B_TB = 'b10001001;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 26
  A_TB = 'b110011;
  B_TB = 'b11011111;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 27
  A_TB = 'b11110011;
  B_TB = 'b11111011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 28
  A_TB = 'b11001100;
  B_TB = 'b11001100;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 29
  A_TB = 'b11010100;
  B_TB = 'b11011000;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 30
  A_TB = 'b10011100;
  B_TB = 'b11;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 31
  A_TB = 'b1110010;
  B_TB = 'b100100;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 32
  A_TB = 'b10001010;
  B_TB = 'b11000000;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 33
  A_TB = 'b1011000;
  B_TB = 'b101110;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 34
  A_TB = 'b1111000;
  B_TB = 'b100000;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 35
  A_TB = 'b10101100;
  B_TB = 'b1100101;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 36
  A_TB = 'b10000011;
  B_TB = 'b1011010;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 37
  A_TB = 'b10010011;
  B_TB = 'b11111001;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 38
  A_TB = 'b11101011;
  B_TB = 'b10000000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 39
  A_TB = 'b10111111;
  B_TB = 'b1001010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 40
  A_TB = 'b10100010;
  B_TB = 'b11100011;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 41
  A_TB = 'b101110;
  B_TB = 'b100011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 42
  A_TB = 'b11110111;
  B_TB = 'b1000010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 43
  A_TB = 'b100001;
  B_TB = 'b10011010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 44
  A_TB = 'b10000100;
  B_TB = 'b11011001;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 45
  A_TB = 'b11111001;
  B_TB = 'b11100101;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 46
  A_TB = 'b10100000;
  B_TB = 'b1111000;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 47
  A_TB = 'b1110;
  B_TB = 'b11011100;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 48
  A_TB = 'b10010100;
  B_TB = 'b101110;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 49
  A_TB = 'b10100101;
  B_TB = 'b10100010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 50
  A_TB = 'b1011101;
  B_TB = 'b11010100;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 51
  A_TB = 'b10001000;
  B_TB = 'b11100011;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 52
  A_TB = 'b10100011;
  B_TB = 'b110010;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 53
  A_TB = 'b10001101;
  B_TB = 'b10101101;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 54
  A_TB = 'b11011011;
  B_TB = 'b11001100;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 55
  A_TB = 'b10000101;
  B_TB = 'b1011010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 56
  A_TB = 'b110010;
  B_TB = 'b10011010;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 57
  A_TB = 'b1000011;
  B_TB = 'b11101;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 58
  A_TB = 'b1001100;
  B_TB = 'b11110000;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 59
  A_TB = 'b10100110;
  B_TB = 'b11001100;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 60
  A_TB = 'b111001;
  B_TB = 'b1101001;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 61
  A_TB = 'b10011000;
  B_TB = 'b11110000;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 62
  A_TB = 'b10011011;
  B_TB = 'b10100011;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 63
  A_TB = 'b1010000;
  B_TB = 'b10001100;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 64
  A_TB = 'b10101101;
  B_TB = 'b11011000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 65
  A_TB = 'b111110;
  B_TB = 'b1001000;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 66
  A_TB = 'b10011011;
  B_TB = 'b11101100;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 67
  A_TB = 'b10000010;
  B_TB = 'b1101;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 68
  A_TB = 'b10100;
  B_TB = 'b1100100;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 69
  A_TB = 'b10111101;
  B_TB = 'b1110000;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 70
  A_TB = 'b10010101;
  B_TB = 'b11010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 71
  A_TB = 'b1101000;
  B_TB = 'b10011011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 72
  A_TB = 'b1001100;
  B_TB = 'b100100;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 73
  A_TB = 'b110;
  B_TB = 'b10111010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 74
  A_TB = 'b11100000;
  B_TB = 'b11110101;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 75
  A_TB = 'b10101100;
  B_TB = 'b110000;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 76
  A_TB = 'b10101101;
  B_TB = 'b1111001;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 77
  A_TB = 'b11011010;
  B_TB = 'b11100001;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 78
  A_TB = 'b1000011;
  B_TB = 'b11010111;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 79
  A_TB = 'b11;
  B_TB = 'b10001110;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 80
  A_TB = 'b11001000;
  B_TB = 'b100010;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 81
  A_TB = 'b1111000;
  B_TB = 'b110000;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 82
  A_TB = 'b1000000;
  B_TB = 'b11001100;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 83
  A_TB = 'b10111001;
  B_TB = 'b10111111;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 84
  A_TB = 'b1110101;
  B_TB = 'b10011111;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 85
  A_TB = 'b10000010;
  B_TB = 'b101001;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 86
  A_TB = 'b11001001;
  B_TB = 'b1100111;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 87
  A_TB = 'b11111100;
  B_TB = 'b101010;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 88
  A_TB = 'b10000110;
  B_TB = 'b11011111;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 89
  A_TB = 'b10111011;
  B_TB = 'b10011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 90
  A_TB = 'b1100000;
  B_TB = 'b10010011;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 91
  A_TB = 'b111111;
  B_TB = 'b110110;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 92
  A_TB = 'b11101010;
  B_TB = 'b11010101;
  in_data_TB = 'b1;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 93
  A_TB = 'b10110;
  B_TB = 'b110100;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 94
  A_TB = 'b111101;
  B_TB = 'b1010111;
  in_data_TB = 'b0;
  add_TB = 'b0;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 95
  A_TB = 'b10000101;
  B_TB = 'b1001101;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 96
  A_TB = 'b11000011;
  B_TB = 'b11100011;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b1;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 97
  A_TB = 'b1100011;
  B_TB = 'b11100101;
  in_data_TB = 'b0;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 98
  A_TB = 'b1001011;
  B_TB = 'b1100010;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b0;

  #CLK_PERIOD
  // TEST CASE 99
  A_TB = 'b1100;
  B_TB = 'b10001111;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

  #CLK_PERIOD
  // TEST CASE 100
  A_TB = 'b11111110;
  B_TB = 'b1101111;
  in_data_TB = 'b1;
  add_TB = 'b1;
  sub_TB = 'b0;
  sel_TB = 'b1;

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
in_data_TB = 'b0;
add_TB = 'b0;
sub_TB = 'b0;
sel_TB = 'b0;

end
endtask


//CLOCK      
always #(CLK_PERIOD/2) CLK_TB = ~CLK_TB;




MUX #( .WIDTH(WIDTH)) DUT(
 .CLK(CLK_TB),
 .RST(RST_TB),
 .A(A_TB),
 .B(B_TB),
 .in_data(in_data_TB),
 .add(add_TB),
 .sub(sub_TB),
 .sel(sel_TB),
 .result(result_TB)
);

endmodule
