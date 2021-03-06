/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_63 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] add,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [16:0] sum;
  
  reg [15:0] xb;
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        sum = a + b;
        xb = b;
      end
      2'h1: begin
        sum = a - b;
        xb = ~b + 1'h1;
      end
      default: begin
        sum = a - b;
        xb = ~b + 1'h1;
      end
    endcase
    add = sum[0+15-:16];
    z = (~|sum);
    n = sum[15+0-:1];
    v = (((a[15+0-:1]) & (xb[15+0-:1]) & (~sum[15+0-:1])) | ((~a[15+0-:1]) & (~xb[15+0-:1]) & (sum[15+0-:1])));
  end
endmodule
