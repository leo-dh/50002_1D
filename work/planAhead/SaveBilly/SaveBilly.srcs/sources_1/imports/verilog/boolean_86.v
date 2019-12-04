/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_86 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] boole
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h8: begin
        boole = a & b;
      end
      4'he: begin
        boole = a | b;
      end
      4'h6: begin
        boole = a ^ b;
      end
      4'ha: begin
        boole = a;
      end
      4'h7: begin
        boole = ~(a & b);
      end
      4'h1: begin
        boole = ~(a | b);
      end
      4'h9: begin
        boole = ~(a ^ b);
      end
      4'h5: begin
        boole = b;
      end
      default: begin
        boole = 16'h0000;
      end
    endcase
  end
endmodule