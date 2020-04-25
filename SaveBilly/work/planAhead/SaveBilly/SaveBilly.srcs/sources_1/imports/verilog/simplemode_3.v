/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module simplemode_3 (
    input clk,
    input rst,
    input buttonadd,
    input buttonsub,
    input buttonmul,
    input buttondiv,
    input buttona,
    input buttonb,
    input buttonc,
    input [15:0] aluout,
    output reg [15:0] motherpos,
    output reg [15:0] billypos,
    output reg [15:0] a_out,
    output reg [15:0] b_out,
    output reg [15:0] c_out,
    output reg [15:0] d_out,
    output reg [5:0] operator_sig,
    output reg gameend,
    output reg [15:0] alua,
    output reg [15:0] alub,
    output reg [5:0] alualufn
  );
  
  
  
  localparam IDLE_state = 4'd0;
  localparam COUNTDOWN_state = 4'd1;
  localparam GEN_QN_state = 4'd2;
  localparam WAITINPUT_state = 4'd3;
  localparam CHECKINPUT_state = 4'd4;
  localparam CHECKINPUT2_state = 4'd5;
  localparam CHECKMOTHERPOS_state = 4'd6;
  localparam CHECKBILLYPOS_state = 4'd7;
  localparam DELAY_state = 4'd8;
  localparam LOSE_state = 4'd9;
  localparam WIN_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  reg [1:0] M_counter_d, M_counter_q = 1'h0;
  wire [1-1:0] M_ctr_value;
  counter_28 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [32-1:0] M_pn_gen_num;
  reg [1-1:0] M_pn_gen_next;
  reg [32-1:0] M_pn_gen_seed;
  pn_gen_29 pn_gen (
    .clk(clk),
    .rst(rst),
    .next(M_pn_gen_next),
    .seed(M_pn_gen_seed),
    .num(M_pn_gen_num)
  );
  wire [16-1:0] M_mother_pos;
  reg [2-1:0] M_mother_difficulty;
  reg [1-1:0] M_mother_writeenable;
  reg [16-1:0] M_mother_writevalue;
  mother_30 mother (
    .clk(clk),
    .rst(rst),
    .difficulty(M_mother_difficulty),
    .writeenable(M_mother_writeenable),
    .writevalue(M_mother_writevalue),
    .pos(M_mother_pos)
  );
  wire [16-1:0] M_billy_pos;
  reg [1-1:0] M_billy_writeenable;
  reg [16-1:0] M_billy_writevalue;
  billy_31 billy (
    .clk(clk),
    .rst(rst),
    .writeenable(M_billy_writeenable),
    .writevalue(M_billy_writevalue),
    .pos(M_billy_pos)
  );
  wire [16-1:0] M_a_readvalue;
  reg [1-1:0] M_a_writeenable;
  reg [16-1:0] M_a_writevalue;
  registers_32 a (
    .clk(clk),
    .rst(rst),
    .writeenable(M_a_writeenable),
    .writevalue(M_a_writevalue),
    .readvalue(M_a_readvalue)
  );
  wire [16-1:0] M_b_readvalue;
  reg [1-1:0] M_b_writeenable;
  reg [16-1:0] M_b_writevalue;
  registers_32 b (
    .clk(clk),
    .rst(rst),
    .writeenable(M_b_writeenable),
    .writevalue(M_b_writevalue),
    .readvalue(M_b_readvalue)
  );
  wire [16-1:0] M_c_readvalue;
  reg [1-1:0] M_c_writeenable;
  reg [16-1:0] M_c_writevalue;
  registers_32 c (
    .clk(clk),
    .rst(rst),
    .writeenable(M_c_writeenable),
    .writevalue(M_c_writevalue),
    .readvalue(M_c_readvalue)
  );
  wire [16-1:0] M_temp_readvalue;
  reg [1-1:0] M_temp_writeenable;
  reg [16-1:0] M_temp_writevalue;
  registers_32 temp (
    .clk(clk),
    .rst(rst),
    .writeenable(M_temp_writeenable),
    .writevalue(M_temp_writevalue),
    .readvalue(M_temp_readvalue)
  );
  wire [6-1:0] M_operator_readvalue;
  reg [1-1:0] M_operator_writeenable;
  reg [6-1:0] M_operator_writevalue;
  registers_36 operator (
    .clk(clk),
    .rst(rst),
    .writeenable(M_operator_writeenable),
    .writevalue(M_operator_writevalue),
    .readvalue(M_operator_readvalue)
  );
  wire [16-1:0] M_divoutput_readvalue;
  reg [1-1:0] M_divoutput_writeenable;
  reg [16-1:0] M_divoutput_writevalue;
  registers_32 divoutput (
    .clk(clk),
    .rst(rst),
    .writeenable(M_divoutput_writeenable),
    .writevalue(M_divoutput_writevalue),
    .readvalue(M_divoutput_readvalue)
  );
  
  wire [16-1:0] M_questiongenerator_a;
  wire [16-1:0] M_questiongenerator_b;
  wire [16-1:0] M_questiongenerator_c;
  reg [6-1:0] M_questiongenerator_randomnumber;
  generatequestion_simple_38 questiongenerator (
    .randomnumber(M_questiongenerator_randomnumber),
    .a(M_questiongenerator_a),
    .b(M_questiongenerator_b),
    .c(M_questiongenerator_c)
  );
  
  reg [3:0] buttoninput;
  
  reg [2:0] buttonoperatorinput;
  
  localparam ADD = 6'h00;
  
  localparam SUB = 6'h01;
  
  localparam MUL = 6'h02;
  
  localparam DIV = 6'h22;
  
  localparam CMPEQ = 6'h33;
  
  localparam WINCON = 4'h8;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    M_counter_d = M_counter_q;
    
    gameend = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_pn_gen_seed = 11'h539;
    M_pn_gen_next = 1'h0;
    M_questiongenerator_randomnumber = M_pn_gen_num;
    M_divoutput_writevalue = M_a_readvalue / M_b_readvalue;
    M_divoutput_writeenable = 1'h1;
    alualufn = 6'h00;
    alua = 16'h0000;
    alub = 16'h0000;
    M_mother_difficulty = 2'h2;
    motherpos = M_mother_pos;
    billypos = M_billy_pos - 2'h2;
    a_out = 5'h14;
    b_out = M_a_readvalue;
    c_out = M_b_readvalue;
    d_out = M_c_readvalue;
    M_mother_writeenable = 1'h0;
    M_billy_writeenable = 1'h0;
    M_a_writeenable = 1'h0;
    M_b_writeenable = 1'h0;
    M_c_writeenable = 1'h0;
    M_temp_writeenable = 1'h0;
    M_mother_writevalue = M_mother_pos;
    M_billy_writevalue = M_billy_pos;
    M_a_writevalue = M_questiongenerator_a;
    M_b_writevalue = M_questiongenerator_b;
    M_c_writevalue = M_questiongenerator_c;
    M_temp_writevalue = 1'h0;
    operator_sig = M_operator_readvalue;
    M_operator_writeenable = 1'h1;
    M_operator_writevalue = 6'h3f;
    M_counter_d = M_counter_q;
    buttoninput = {buttondiv, buttonmul, buttonsub, buttonadd};
    buttonoperatorinput = {buttona, buttonb, buttonc};
    if ((&buttoninput)) begin
      gameend = 1'h1;
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        M_mother_writevalue = 1'h0;
        M_operator_writeenable = 1'h1;
        M_operator_writevalue = 6'h3f;
        M_mother_difficulty = 2'h3;
        M_billy_writeenable = 1'h1;
        M_billy_writevalue = 2'h2;
        a_out = 4'hb;
        b_out = 4'hd;
        c_out = 3'h5;
        d_out = 4'hf;
        if (((|buttoninput)) || ((|buttonoperatorinput))) begin
          M_timer_d = 1'h0;
          M_counter_d = 2'h3;
          M_state_d = COUNTDOWN_state;
        end
      end
      COUNTDOWN_state: begin
        M_timer_d = M_timer_q + 1'h1;
        d_out = 5'h14;
        
        case (M_counter_q)
          2'h3: begin
            a_out = M_counter_q;
            b_out = 5'h14;
            c_out = 5'h14;
          end
          2'h2: begin
            a_out = 5'h14;
            b_out = M_counter_q;
            c_out = 5'h14;
          end
          1'h1: begin
            a_out = 5'h14;
            b_out = 5'h14;
            c_out = M_counter_q;
          end
          default: begin
            a_out = 5'h14;
            b_out = 5'h14;
            c_out = 5'h14;
          end
        endcase
        M_mother_writeenable = 1'h1;
        M_mother_writevalue = 1'h0;
        M_operator_writeenable = 1'h1;
        M_operator_writevalue = 6'h3f;
        M_mother_difficulty = 2'h3;
        if (M_timer_q == 26'h2faf080) begin
          M_timer_d = 1'h0;
          M_counter_d = M_counter_q - 1'h1;
        end
        if (M_counter_q == 1'h0) begin
          M_counter_d = 1'h0;
          M_state_d = GEN_QN_state;
        end
      end
      GEN_QN_state: begin
        M_timer_d = 1'h0;
        M_mother_writeenable = 1'h1;
        M_operator_writevalue = 6'h3f;
        if (M_billy_pos >= 1'h0) begin
          M_pn_gen_next = 1'h1;
          M_a_writeenable = 1'h1;
          M_b_writeenable = 1'h1;
          M_c_writeenable = 1'h1;
          M_temp_writeenable = 1'h1;
          M_state_d = WAITINPUT_state;
        end
        if (M_billy_pos == 4'h8) begin
          M_state_d = WIN_state;
        end
      end
      WAITINPUT_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_operator_writevalue = 6'h3f;
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = CHECKMOTHERPOS_state;
        end
        if ((^buttoninput)) begin
          M_operator_writeenable = 1'h1;
          
          case (buttoninput)
            4'h1: begin
              M_operator_writevalue = 6'h00;
            end
            4'h2: begin
              M_operator_writevalue = 6'h01;
            end
            4'h4: begin
              M_operator_writevalue = 6'h02;
            end
            4'h8: begin
              M_operator_writevalue = 6'h22;
            end
          endcase
          M_timer_d = 1'h0;
          M_state_d = CHECKINPUT_state;
        end
      end
      CHECKINPUT_state: begin
        M_mother_writeenable = 1'h1;
        M_timer_d = M_timer_q + 1'h1;
        alua = M_a_readvalue;
        alub = M_b_readvalue;
        alualufn = M_operator_readvalue;
        M_temp_writeenable = 1'h1;
        
        case (M_operator_readvalue)
          6'h22: begin
            M_temp_writevalue = M_divoutput_readvalue;
          end
          default: begin
            M_temp_writevalue = aluout;
          end
        endcase
        M_state_d = CHECKINPUT2_state;
      end
      CHECKINPUT2_state: begin
        M_mother_writeenable = 1'h1;
        M_timer_d = 1'h0;
        alualufn = 6'h33;
        alua = M_temp_readvalue;
        alub = M_c_readvalue;
        if (aluout == 1'h1) begin
          M_state_d = CHECKBILLYPOS_state;
        end else begin
          M_state_d = CHECKMOTHERPOS_state;
        end
      end
      CHECKBILLYPOS_state: begin
        M_timer_d = 1'h0;
        M_mother_writeenable = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q == 1'h1) begin
          M_counter_d = 1'h0;
          M_billy_writeenable = 1'h1;
          M_billy_writevalue = M_billy_pos + 1'h1;
        end
        if (M_billy_pos == 4'h8) begin
          M_state_d = WIN_state;
        end else begin
          M_state_d = DELAY_state;
        end
      end
      DELAY_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        M_mother_difficulty = 2'h3;
        a_out = 5'h13;
        b_out = 1'h1;
        c_out = 5'h15;
        d_out = 4'hb;
        if (M_timer_q == 25'h1312d00) begin
          M_timer_d = 1'h0;
          M_state_d = GEN_QN_state;
        end
      end
      CHECKMOTHERPOS_state: begin
        M_timer_d = M_timer_q + 1'h1;
        if (M_ctr_value == 1'h1) begin
          a_out = 5'h14;
          b_out = 5'h14;
          c_out = 5'h14;
          d_out = 5'h14;
          operator_sig = 6'h3f;
        end
        if (M_timer_q == 25'h1312d00) begin
          M_timer_d = 1'h0;
          M_operator_writeenable = 1'h1;
          M_operator_writevalue = 6'h3f;
          M_state_d = WAITINPUT_state;
        end
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = LOSE_state;
        end
      end
      WIN_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        a_out = 4'hc;
        b_out = 4'hd;
        c_out = 3'h5;
        d_out = 3'h5;
        if (M_timer_q == 28'h8f0d180) begin
          gameend = 1'h1;
          M_state_d = IDLE_state;
        end
      end
      LOSE_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        a_out = 4'ha;
        b_out = 1'h0;
        c_out = 3'h5;
        d_out = 4'hb;
        if (M_timer_q == 28'h8f0d180) begin
          gameend = 1'h1;
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_timer_q <= 1'h0;
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_timer_q <= M_timer_d;
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule