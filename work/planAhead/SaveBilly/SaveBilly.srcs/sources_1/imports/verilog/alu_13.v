/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_13 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_shifter_shift;
  reg [6-1:0] M_shifter_alufn;
  reg [16-1:0] M_shifter_a;
  reg [16-1:0] M_shifter_b;
  shifter_56 shifter (
    .alufn(M_shifter_alufn),
    .a(M_shifter_a),
    .b(M_shifter_b),
    .shift(M_shifter_shift)
  );
  
  wire [16-1:0] M_compare_comp;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  reg [6-1:0] M_compare_alufn;
  compare_57 compare (
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .alufn(M_compare_alufn),
    .comp(M_compare_comp)
  );
  
  wire [16-1:0] M_boolean_boole;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_alufn;
  boolean_58 boolean (
    .a(M_boolean_a),
    .b(M_boolean_b),
    .alufn(M_boolean_alufn),
    .boole(M_boolean_boole)
  );
  
  wire [16-1:0] M_adder_add;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [6-1:0] M_adder_alufn;
  adder_59 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .add(M_adder_add),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_multiply_mul;
  reg [16-1:0] M_multiply_a;
  reg [16-1:0] M_multiply_b;
  multiply_60 multiply (
    .a(M_multiply_a),
    .b(M_multiply_b),
    .mul(M_multiply_mul)
  );
  
  wire [16-1:0] M_division_div;
  reg [16-1:0] M_division_a;
  reg [16-1:0] M_division_b;
  division_61 division (
    .a(M_division_a),
    .b(M_division_b),
    .div(M_division_div)
  );
  
  always @* begin
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = alufn;
    M_shifter_a = a;
    M_shifter_b = b;
    M_shifter_alufn = alufn;
    M_compare_v = M_adder_v;
    M_compare_z = M_adder_z;
    M_compare_n = M_adder_n;
    M_compare_alufn = alufn;
    M_boolean_a = a;
    M_boolean_b = b;
    M_boolean_alufn = alufn;
    M_multiply_a = a;
    M_multiply_b = b;
    M_division_a = a;
    M_division_b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        
        case (alufn[0+1-:2])
          2'h2: begin
            s = M_multiply_mul;
          end
          default: begin
            s = M_adder_add;
          end
        endcase
      end
      2'h1: begin
        s = M_boolean_boole;
      end
      2'h2: begin
        
        case (alufn[0+1-:2])
          2'h2: begin
            s = M_division_div;
          end
          default: begin
            s = M_shifter_shift;
          end
        endcase
      end
      2'h3: begin
        s = M_compare_comp;
      end
      default: begin
        s = 16'h0000;
      end
    endcase
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
  end
endmodule
