/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module hardmode_4 (
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
    output reg [5:0] operator1_out,
    output reg [5:0] operator2_out,
    output reg gameend,
    output reg [15:0] alua,
    output reg [15:0] alub,
    output reg [5:0] alualufn
  );
  
  
  
  localparam IDLE_state = 4'd0;
  localparam COUNTDOWN_state = 4'd1;
  localparam GEN_QN_state = 4'd2;
  localparam WAITINPUT_state = 4'd3;
  localparam SWAPPEDINPUT1_state = 4'd4;
  localparam SWAPPEDINPUT2_state = 4'd5;
  localparam CALCULATE1_state = 4'd6;
  localparam CALCULATE2_state = 4'd7;
  localparam CALCULATE3_state = 4'd8;
  localparam CHECKRESULT_state = 4'd9;
  localparam CHECKMOTHERPOS_state = 4'd10;
  localparam CHECKBILLYPOS_state = 4'd11;
  localparam DELAY_state = 4'd12;
  localparam LOSE_state = 4'd13;
  localparam WIN_state = 4'd14;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg [29:0] M_timer_d, M_timer_q = 1'h0;
  reg [1:0] M_counter_d, M_counter_q = 1'h0;
  wire [1-1:0] M_ctr_value;
  counter_39 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [1-1:0] M_ctr2_value;
  counter_28 ctr2 (
    .clk(clk),
    .rst(rst),
    .value(M_ctr2_value)
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
  wire [16-1:0] M_d_readvalue;
  reg [1-1:0] M_d_writeenable;
  reg [16-1:0] M_d_writevalue;
  registers_32 d (
    .clk(clk),
    .rst(rst),
    .writeenable(M_d_writeenable),
    .writevalue(M_d_writevalue),
    .readvalue(M_d_readvalue)
  );
  wire [16-1:0] M_tempa_readvalue;
  reg [1-1:0] M_tempa_writeenable;
  reg [16-1:0] M_tempa_writevalue;
  registers_32 tempa (
    .clk(clk),
    .rst(rst),
    .writeenable(M_tempa_writeenable),
    .writevalue(M_tempa_writevalue),
    .readvalue(M_tempa_readvalue)
  );
  wire [16-1:0] M_tempb_readvalue;
  reg [1-1:0] M_tempb_writeenable;
  reg [16-1:0] M_tempb_writevalue;
  registers_32 tempb (
    .clk(clk),
    .rst(rst),
    .writeenable(M_tempb_writeenable),
    .writevalue(M_tempb_writevalue),
    .readvalue(M_tempb_readvalue)
  );
  wire [16-1:0] M_tempc_readvalue;
  reg [1-1:0] M_tempc_writeenable;
  reg [16-1:0] M_tempc_writevalue;
  registers_32 tempc (
    .clk(clk),
    .rst(rst),
    .writeenable(M_tempc_writeenable),
    .writevalue(M_tempc_writevalue),
    .readvalue(M_tempc_readvalue)
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
  wire [6-1:0] M_operator1_readvalue;
  reg [1-1:0] M_operator1_writeenable;
  reg [6-1:0] M_operator1_writevalue;
  registers_36 operator1 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_operator1_writeenable),
    .writevalue(M_operator1_writevalue),
    .readvalue(M_operator1_readvalue)
  );
  wire [6-1:0] M_operator2_readvalue;
  reg [1-1:0] M_operator2_writeenable;
  reg [6-1:0] M_operator2_writevalue;
  registers_36 operator2 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_operator2_writeenable),
    .writevalue(M_operator2_writevalue),
    .readvalue(M_operator2_readvalue)
  );
  wire [3-1:0] M_storedoperand_readvalue;
  reg [1-1:0] M_storedoperand_writeenable;
  reg [3-1:0] M_storedoperand_writevalue;
  registers_54 storedoperand (
    .clk(clk),
    .rst(rst),
    .writeenable(M_storedoperand_writeenable),
    .writevalue(M_storedoperand_writevalue),
    .readvalue(M_storedoperand_readvalue)
  );
  wire [16-1:0] M_divoutput1_readvalue;
  reg [1-1:0] M_divoutput1_writeenable;
  reg [16-1:0] M_divoutput1_writevalue;
  registers_32 divoutput1 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_divoutput1_writeenable),
    .writevalue(M_divoutput1_writevalue),
    .readvalue(M_divoutput1_readvalue)
  );
  wire [16-1:0] M_divoutput2_readvalue;
  reg [1-1:0] M_divoutput2_writeenable;
  reg [16-1:0] M_divoutput2_writevalue;
  registers_32 divoutput2 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_divoutput2_writeenable),
    .writevalue(M_divoutput2_writevalue),
    .readvalue(M_divoutput2_readvalue)
  );
  wire [16-1:0] M_divoutput3_readvalue;
  reg [1-1:0] M_divoutput3_writeenable;
  reg [16-1:0] M_divoutput3_writevalue;
  registers_32 divoutput3 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_divoutput3_writeenable),
    .writevalue(M_divoutput3_writevalue),
    .readvalue(M_divoutput3_readvalue)
  );
  wire [16-1:0] M_divoutput4_readvalue;
  reg [1-1:0] M_divoutput4_writeenable;
  reg [16-1:0] M_divoutput4_writevalue;
  registers_32 divoutput4 (
    .clk(clk),
    .rst(rst),
    .writeenable(M_divoutput4_writeenable),
    .writevalue(M_divoutput4_writevalue),
    .readvalue(M_divoutput4_readvalue)
  );
  
  wire [16-1:0] M_questiongenerator_a;
  wire [16-1:0] M_questiongenerator_b;
  wire [16-1:0] M_questiongenerator_c;
  wire [16-1:0] M_questiongenerator_d;
  reg [6-1:0] M_questiongenerator_randomnumber;
  generatequestion_hard_59 questiongenerator (
    .randomnumber(M_questiongenerator_randomnumber),
    .a(M_questiongenerator_a),
    .b(M_questiongenerator_b),
    .c(M_questiongenerator_c),
    .d(M_questiongenerator_d)
  );
  
  reg [3:0] buttonoperatorinput;
  
  reg [2:0] buttonoperandinput;
  
  localparam ADD = 6'h00;
  
  localparam SUB = 6'h01;
  
  localparam MUL = 6'h02;
  
  localparam DIV = 6'h22;
  
  localparam CMPEQ = 6'h33;
  
  localparam WINCON = 3'h7;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    M_counter_d = M_counter_q;
    
    gameend = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_pn_gen_seed = 11'h539;
    M_pn_gen_next = 1'h0;
    M_questiongenerator_randomnumber = M_pn_gen_num;
    M_counter_d = M_counter_q;
    alua = 16'h0000;
    alub = 16'h0000;
    alualufn = 6'h00;
    buttonoperatorinput = {buttondiv, buttonmul, buttonsub, buttonadd};
    buttonoperandinput = {buttona, buttonb, buttonc};
    M_divoutput1_writeenable = 1'h1;
    M_divoutput2_writeenable = 1'h1;
    M_divoutput3_writeenable = 1'h1;
    M_divoutput4_writeenable = 1'h1;
    M_divoutput1_writevalue = M_a_readvalue / M_b_readvalue;
    M_divoutput2_writevalue = M_b_readvalue / M_c_readvalue;
    M_divoutput3_writevalue = M_a_readvalue / M_b_readvalue / M_c_readvalue;
    M_divoutput4_writevalue = M_a_readvalue * M_b_readvalue / M_c_readvalue;
    M_mother_difficulty = 2'h1;
    motherpos = M_mother_pos;
    billypos = M_billy_pos - 2'h2;
    a_out = M_a_readvalue;
    b_out = M_b_readvalue;
    c_out = M_c_readvalue;
    d_out = M_d_readvalue;
    operator1_out = M_operator1_readvalue;
    operator2_out = M_operator2_readvalue;
    M_mother_writeenable = 1'h0;
    M_billy_writeenable = 1'h0;
    M_a_writeenable = 1'h0;
    M_b_writeenable = 1'h0;
    M_c_writeenable = 1'h0;
    M_d_writeenable = 1'h0;
    M_temp_writeenable = 1'h0;
    M_operator1_writeenable = 1'h0;
    M_operator2_writeenable = 1'h0;
    M_storedoperand_writeenable = 1'h0;
    M_tempa_writeenable = 1'h0;
    M_tempb_writeenable = 1'h0;
    M_tempc_writeenable = 1'h0;
    M_mother_writevalue = M_mother_pos;
    M_billy_writevalue = M_billy_pos;
    M_a_writevalue = M_questiongenerator_a;
    M_b_writevalue = M_questiongenerator_b;
    M_c_writevalue = M_questiongenerator_c;
    M_d_writevalue = M_questiongenerator_d;
    M_temp_writevalue = M_temp_readvalue;
    M_operator1_writevalue = 6'h3f;
    M_operator2_writevalue = 6'h3f;
    M_storedoperand_writevalue = M_storedoperand_readvalue;
    M_tempa_writevalue = M_a_readvalue;
    M_tempb_writevalue = M_b_readvalue;
    M_tempc_writevalue = M_c_readvalue;
    if ((&buttonoperandinput)) begin
      gameend = 1'h1;
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        M_mother_difficulty = 2'h3;
        M_mother_writevalue = 1'h0;
        M_billy_writeenable = 1'h1;
        M_billy_writevalue = 2'h2;
        a_out = 5'h10;
        b_out = 4'hd;
        c_out = 5'h11;
        d_out = 5'h12;
        if (((|buttonoperandinput)) || ((|buttonoperatorinput))) begin
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
        if (M_billy_pos >= 1'h0) begin
          M_pn_gen_next = 1'h1;
          M_a_writeenable = 1'h1;
          M_b_writeenable = 1'h1;
          M_c_writeenable = 1'h1;
          M_d_writeenable = 1'h1;
          M_a_writevalue = M_questiongenerator_a;
          M_b_writevalue = M_questiongenerator_b;
          M_c_writevalue = M_questiongenerator_c;
          M_d_writevalue = M_questiongenerator_d;
        end
        if (!((|buttonoperatorinput))) begin
          M_operator1_writeenable = 1'h1;
          M_operator1_writevalue = 6'h3f;
          M_operator2_writeenable = 1'h1;
          M_operator2_writevalue = 6'h3f;
          M_state_d = WAITINPUT_state;
        end
      end
      WAITINPUT_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_a_writeenable = 1'h1;
        M_b_writeenable = 1'h1;
        M_c_writeenable = 1'h1;
        M_d_writeenable = 1'h1;
        M_tempa_writeenable = 1'h1;
        M_tempb_writeenable = 1'h1;
        M_tempc_writeenable = 1'h1;
        M_tempa_writevalue = M_questiongenerator_a;
        M_tempb_writevalue = M_questiongenerator_b;
        M_tempc_writevalue = M_questiongenerator_c;
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = CHECKMOTHERPOS_state;
        end
        if ((^buttonoperandinput)) begin
          M_storedoperand_writeenable = 1'h1;
          M_storedoperand_writevalue = buttonoperandinput;
          M_state_d = SWAPPEDINPUT1_state;
        end
        if ((^buttonoperatorinput)) begin
          M_operator1_writeenable = 1'h1;
          M_operator2_writeenable = 1'h1;
          
          case (buttonoperatorinput)
            4'h8: begin
              M_operator1_writevalue = 6'h22;
            end
            4'h4: begin
              M_operator1_writevalue = 6'h02;
            end
            4'h2: begin
              M_operator1_writevalue = 6'h01;
            end
            4'h1: begin
              M_operator1_writevalue = 6'h00;
            end
            default: begin
              M_operator1_writevalue = 6'h3f;
            end
          endcase
          M_state_d = CALCULATE1_state;
        end
      end
      SWAPPEDINPUT1_state: begin
        M_timer_d = M_timer_q + 1'h1;
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = CHECKMOTHERPOS_state;
        end
        if (M_ctr_value == 1'h1) begin
          
          case (M_storedoperand_readvalue)
            3'h1: begin
              c_out = 5'h14;
            end
            3'h2: begin
              b_out = 5'h14;
            end
            3'h4: begin
              a_out = 5'h14;
            end
          endcase
        end
        if ((^buttonoperandinput)) begin
          alua = buttonoperandinput;
          alub = M_storedoperand_readvalue;
          alualufn = 6'h16;
          
          case (aluout)
            3'h0: begin
              M_state_d = WAITINPUT_state;
            end
            3'h6: begin
              M_a_writevalue = M_tempb_readvalue;
              M_a_writeenable = 1'h1;
              M_b_writevalue = M_tempa_readvalue;
              M_b_writeenable = 1'h1;
            end
            3'h3: begin
              M_b_writevalue = M_tempc_readvalue;
              M_b_writeenable = 1'h1;
              M_c_writevalue = M_tempb_readvalue;
              M_c_writeenable = 1'h1;
            end
            3'h5: begin
              M_a_writevalue = M_tempc_readvalue;
              M_a_writeenable = 1'h1;
              M_c_writevalue = M_tempa_readvalue;
              M_c_writeenable = 1'h1;
            end
          endcase
          M_storedoperand_writevalue = 3'h0;
          M_storedoperand_writeenable = 1'h1;
          M_state_d = SWAPPEDINPUT2_state;
        end
      end
      SWAPPEDINPUT2_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_storedoperand_writeenable = 1'h1;
        M_storedoperand_writevalue = 3'h0;
        M_tempa_writeenable = 1'h1;
        M_tempb_writeenable = 1'h1;
        M_tempc_writeenable = 1'h1;
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = CHECKMOTHERPOS_state;
        end
        if ((^buttonoperandinput)) begin
          M_storedoperand_writevalue = buttonoperandinput;
          M_state_d = SWAPPEDINPUT1_state;
        end
        if ((^buttonoperatorinput)) begin
          M_operator1_writeenable = 1'h1;
          
          case (buttonoperatorinput)
            4'h8: begin
              M_operator1_writevalue = 6'h22;
            end
            4'h4: begin
              M_operator1_writevalue = 6'h02;
            end
            4'h2: begin
              M_operator1_writevalue = 6'h01;
            end
            4'h1: begin
              M_operator1_writevalue = 6'h00;
            end
            default: begin
              M_operator1_writevalue = 6'h3f;
            end
          endcase
          M_state_d = CALCULATE1_state;
        end
      end
      CALCULATE1_state: begin
        M_timer_d = M_timer_q + 1'h1;
        if (M_mother_pos == M_billy_pos) begin
          M_state_d = CHECKMOTHERPOS_state;
        end
        if ((^buttonoperatorinput)) begin
          M_operator2_writeenable = 1'h1;
          
          case (buttonoperatorinput)
            4'h8: begin
              M_operator2_writevalue = 6'h22;
            end
            4'h4: begin
              M_operator2_writevalue = 6'h02;
            end
            4'h2: begin
              M_operator2_writevalue = 6'h01;
            end
            4'h1: begin
              M_operator2_writevalue = 6'h00;
            end
            default: begin
              M_operator2_writevalue = 6'h3f;
            end
          endcase
          M_state_d = CALCULATE2_state;
        end
      end
      CALCULATE2_state: begin
        M_timer_d = M_timer_q;
        M_mother_writeenable = 1'h1;
        M_temp_writeenable = 1'h1;
        
        case (M_operator1_readvalue)
          6'h02: begin
            alua = M_a_readvalue;
            alub = M_b_readvalue;
            alualufn = M_operator1_readvalue;
            M_temp_writevalue = aluout;
          end
          6'h22: begin
            alua = M_a_readvalue;
            alub = M_b_readvalue;
            alualufn = M_operator1_readvalue;
            M_temp_writevalue = M_divoutput1_readvalue;
          end
          default: begin
            
            case (M_operator2_readvalue)
              6'h02: begin
                alua = M_b_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
              6'h22: begin
                alua = M_b_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = M_divoutput2_readvalue;
              end
              default: begin
                alua = M_a_readvalue;
                alub = M_b_readvalue;
                alualufn = M_operator1_readvalue;
                M_temp_writevalue = aluout;
              end
            endcase
          end
        endcase
        M_state_d = CALCULATE3_state;
      end
      CALCULATE3_state: begin
        M_timer_d = M_timer_q;
        M_mother_writeenable = 1'h1;
        M_temp_writeenable = 1'h1;
        
        case (M_operator1_readvalue)
          6'h02: begin
            
            case (M_operator2_readvalue)
              6'h02: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
              6'h22: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = M_divoutput4_readvalue;
              end
              default: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
            endcase
          end
          6'h22: begin
            
            case (M_operator2_readvalue)
              6'h02: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
              6'h22: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = M_divoutput3_readvalue;
              end
              default: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
            endcase
          end
          default: begin
            
            case (M_operator2_readvalue)
              6'h02: begin
                alua = M_temp_readvalue;
                alub = M_a_readvalue;
                alualufn = M_operator1_readvalue;
                M_temp_writevalue = aluout;
              end
              6'h22: begin
                alua = M_temp_readvalue;
                alub = M_a_readvalue;
                alualufn = M_operator1_readvalue;
                M_temp_writevalue = aluout;
              end
              default: begin
                alua = M_temp_readvalue;
                alub = M_c_readvalue;
                alualufn = M_operator2_readvalue;
                M_temp_writevalue = aluout;
              end
            endcase
          end
        endcase
        M_state_d = CHECKRESULT_state;
      end
      CHECKRESULT_state: begin
        M_timer_d = M_timer_q;
        alua = M_temp_readvalue;
        alub = M_d_readvalue;
        M_mother_writeenable = 1'h1;
        alualufn = 6'h33;
        if (aluout == 1'h1) begin
          M_state_d = CHECKBILLYPOS_state;
        end else begin
          M_timer_d = 1'h0;
          M_state_d = CHECKMOTHERPOS_state;
        end
      end
      CHECKBILLYPOS_state: begin
        M_timer_d = 1'h0;
        M_mother_writeenable = 1'h1;
        M_billy_writeenable = 1'h1;
        M_billy_writevalue = M_billy_pos + 1'h1;
        if (M_billy_pos == 3'h7) begin
          M_state_d = WIN_state;
        end else begin
          M_state_d = DELAY_state;
        end
      end
      DELAY_state: begin
        M_timer_d = M_timer_q + 1'h1;
        M_mother_writeenable = 1'h1;
        M_mother_difficulty = 2'h3;
        M_operator1_writeenable = 1'h1;
        M_operator1_writevalue = 6'h3f;
        M_operator2_writeenable = 1'h1;
        M_operator2_writevalue = 6'h3f;
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
        if (M_ctr2_value == 1'h1) begin
          a_out = 5'h14;
          b_out = 5'h14;
          c_out = 5'h14;
          d_out = 5'h14;
          operator1_out = 6'h3f;
          operator2_out = 6'h3f;
        end
        if (M_timer_q == 25'h1312d00) begin
          M_timer_d = 1'h0;
          M_operator1_writeenable = 1'h1;
          M_operator1_writevalue = 6'h3f;
          M_operator2_writeenable = 1'h1;
          M_operator2_writevalue = 6'h3f;
          M_state_d = SWAPPEDINPUT2_state;
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
        if (M_timer_q == 28'hbebc200) begin
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
        if (M_timer_q == 28'hbebc200) begin
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
