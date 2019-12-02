/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module division_61 (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] div
  );
  
  
  
  reg [15:0] divisor;
  
  reg [15:0] dividend;
  
  reg [15:0] quo;
  
  always @* begin
    divisor = b;
    dividend = a;
    if ((divisor == 16'h0000) || (dividend == 16'h0000)) begin
      quo = 16'h0000;
    end else begin
      if ((divisor[15+0-:1] == 1'h1) ^ (dividend[15+0-:1] == 1'h1)) begin
        quo = dividend / divisor;
        quo = ~quo + 1'h1;
      end else begin
        if ((divisor[15+0-:1] == 1'h1) & (dividend[15+0-:1] == 1'h1)) begin
          divisor = ~b + 1'h1;
          dividend = ~a + 1'h1;
          quo = dividend / divisor;
        end else begin
          quo = dividend / divisor;
        end
      end
    end
    div = quo;
  end
endmodule
