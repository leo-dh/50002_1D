/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input buttona,
    input buttonb,
    input buttonc,
    input buttonadd,
    input buttonsub,
    input buttonmul,
    input buttondiv,
    output reg [3:0] operator1,
    output reg [3:0] operator2,
    output reg [6:0] sevenseg_a,
    output reg [6:0] sevenseg_b,
    output reg [6:0] sevenseg_c,
    output reg [6:0] sevenseg_d,
    output reg equalled,
    output reg [7:0] motherled,
    output reg [6:0] billyled
  );
  
  
  
  reg rst;
  
  reg gameend;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_button_cond_buttonaout;
  wire [1-1:0] M_button_cond_buttonbout;
  wire [1-1:0] M_button_cond_buttoncout;
  wire [1-1:0] M_button_cond_buttonaddout;
  wire [1-1:0] M_button_cond_buttonsubout;
  wire [1-1:0] M_button_cond_buttonmulout;
  wire [1-1:0] M_button_cond_buttondivout;
  reg [1-1:0] M_button_cond_buttona;
  reg [1-1:0] M_button_cond_buttonb;
  reg [1-1:0] M_button_cond_buttonc;
  reg [1-1:0] M_button_cond_buttonadd;
  reg [1-1:0] M_button_cond_buttonsub;
  reg [1-1:0] M_button_cond_buttonmul;
  reg [1-1:0] M_button_cond_buttondiv;
  button_cond_2 button_cond (
    .clk(clk),
    .buttona(M_button_cond_buttona),
    .buttonb(M_button_cond_buttonb),
    .buttonc(M_button_cond_buttonc),
    .buttonadd(M_button_cond_buttonadd),
    .buttonsub(M_button_cond_buttonsub),
    .buttonmul(M_button_cond_buttonmul),
    .buttondiv(M_button_cond_buttondiv),
    .buttonaout(M_button_cond_buttonaout),
    .buttonbout(M_button_cond_buttonbout),
    .buttoncout(M_button_cond_buttoncout),
    .buttonaddout(M_button_cond_buttonaddout),
    .buttonsubout(M_button_cond_buttonsubout),
    .buttonmulout(M_button_cond_buttonmulout),
    .buttondivout(M_button_cond_buttondivout)
  );
  reg [27:0] M_counter_d, M_counter_q = 1'h0;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  localparam IDLE_state = 2'd0;
  localparam SIMPLEMODE_state = 2'd1;
  localparam HARDMODE_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  wire [16-1:0] M_simplemode_motherpos;
  wire [16-1:0] M_simplemode_billypos;
  wire [16-1:0] M_simplemode_a_out;
  wire [16-1:0] M_simplemode_b_out;
  wire [16-1:0] M_simplemode_c_out;
  wire [16-1:0] M_simplemode_d_out;
  wire [6-1:0] M_simplemode_operator_sig;
  wire [1-1:0] M_simplemode_gameend;
  wire [16-1:0] M_simplemode_alua;
  wire [16-1:0] M_simplemode_alub;
  wire [6-1:0] M_simplemode_alualufn;
  reg [1-1:0] M_simplemode_buttonadd;
  reg [1-1:0] M_simplemode_buttonsub;
  reg [1-1:0] M_simplemode_buttonmul;
  reg [1-1:0] M_simplemode_buttondiv;
  reg [1-1:0] M_simplemode_buttona;
  reg [1-1:0] M_simplemode_buttonb;
  reg [1-1:0] M_simplemode_buttonc;
  reg [16-1:0] M_simplemode_aluout;
  simplemode_3 simplemode (
    .clk(clk),
    .rst(rst),
    .buttonadd(M_simplemode_buttonadd),
    .buttonsub(M_simplemode_buttonsub),
    .buttonmul(M_simplemode_buttonmul),
    .buttondiv(M_simplemode_buttondiv),
    .buttona(M_simplemode_buttona),
    .buttonb(M_simplemode_buttonb),
    .buttonc(M_simplemode_buttonc),
    .aluout(M_simplemode_aluout),
    .motherpos(M_simplemode_motherpos),
    .billypos(M_simplemode_billypos),
    .a_out(M_simplemode_a_out),
    .b_out(M_simplemode_b_out),
    .c_out(M_simplemode_c_out),
    .d_out(M_simplemode_d_out),
    .operator_sig(M_simplemode_operator_sig),
    .gameend(M_simplemode_gameend),
    .alua(M_simplemode_alua),
    .alub(M_simplemode_alub),
    .alualufn(M_simplemode_alualufn)
  );
  wire [16-1:0] M_hardmode_motherpos;
  wire [16-1:0] M_hardmode_billypos;
  wire [16-1:0] M_hardmode_a_out;
  wire [16-1:0] M_hardmode_b_out;
  wire [16-1:0] M_hardmode_c_out;
  wire [16-1:0] M_hardmode_d_out;
  wire [6-1:0] M_hardmode_operator1_out;
  wire [6-1:0] M_hardmode_operator2_out;
  wire [1-1:0] M_hardmode_gameend;
  wire [16-1:0] M_hardmode_alua;
  wire [16-1:0] M_hardmode_alub;
  wire [6-1:0] M_hardmode_alualufn;
  reg [1-1:0] M_hardmode_buttonadd;
  reg [1-1:0] M_hardmode_buttonsub;
  reg [1-1:0] M_hardmode_buttonmul;
  reg [1-1:0] M_hardmode_buttondiv;
  reg [1-1:0] M_hardmode_buttona;
  reg [1-1:0] M_hardmode_buttonb;
  reg [1-1:0] M_hardmode_buttonc;
  reg [16-1:0] M_hardmode_aluout;
  hardmode_4 hardmode (
    .clk(clk),
    .rst(rst),
    .buttonadd(M_hardmode_buttonadd),
    .buttonsub(M_hardmode_buttonsub),
    .buttonmul(M_hardmode_buttonmul),
    .buttondiv(M_hardmode_buttondiv),
    .buttona(M_hardmode_buttona),
    .buttonb(M_hardmode_buttonb),
    .buttonc(M_hardmode_buttonc),
    .aluout(M_hardmode_aluout),
    .motherpos(M_hardmode_motherpos),
    .billypos(M_hardmode_billypos),
    .a_out(M_hardmode_a_out),
    .b_out(M_hardmode_b_out),
    .c_out(M_hardmode_c_out),
    .d_out(M_hardmode_d_out),
    .operator1_out(M_hardmode_operator1_out),
    .operator2_out(M_hardmode_operator2_out),
    .gameend(M_hardmode_gameend),
    .alua(M_hardmode_alua),
    .alub(M_hardmode_alub),
    .alualufn(M_hardmode_alualufn)
  );
  
  wire [7-1:0] M_seven_seg_a_seg;
  reg [5-1:0] M_seven_seg_a_char;
  seven_seg_5 seven_seg_a (
    .char(M_seven_seg_a_char),
    .seg(M_seven_seg_a_seg)
  );
  
  wire [7-1:0] M_seven_seg_b_seg;
  reg [5-1:0] M_seven_seg_b_char;
  seven_seg_5 seven_seg_b (
    .char(M_seven_seg_b_char),
    .seg(M_seven_seg_b_seg)
  );
  
  wire [7-1:0] M_seven_seg_c_seg;
  reg [5-1:0] M_seven_seg_c_char;
  seven_seg_5 seven_seg_c (
    .char(M_seven_seg_c_char),
    .seg(M_seven_seg_c_seg)
  );
  
  wire [7-1:0] M_seven_seg_d_seg;
  reg [5-1:0] M_seven_seg_d_char;
  seven_seg_5 seven_seg_d (
    .char(M_seven_seg_d_char),
    .seg(M_seven_seg_d_seg)
  );
  
  wire [4-1:0] M_operator1led_led;
  reg [6-1:0] M_operator1led_opcode;
  operatorled_9 operator1led (
    .opcode(M_operator1led_opcode),
    .led(M_operator1led_led)
  );
  
  wire [4-1:0] M_operator2led_led;
  reg [6-1:0] M_operator2led_opcode;
  operatorled_9 operator2led (
    .opcode(M_operator2led_opcode),
    .led(M_operator2led_led)
  );
  
  wire [8-1:0] M_motherposled_led;
  reg [16-1:0] M_motherposled_position;
  motherposled_11 motherposled (
    .position(M_motherposled_position),
    .led(M_motherposled_led)
  );
  
  wire [7-1:0] M_billyposled_led;
  reg [16-1:0] M_billyposled_position;
  billyposled_12 billyposled (
    .position(M_billyposled_position),
    .led(M_billyposled_led)
  );
  
  wire [16-1:0] M_alu_s;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_13 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .s(M_alu_s),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_operator1led_opcode = 6'h3f;
    M_operator2led_opcode = 6'h3f;
    operator1 = M_operator1led_led;
    operator2 = M_operator2led_led;
    equalled = 1'h0;
    gameend = 1'h0;
    M_seven_seg_a_char = 5'h14;
    M_seven_seg_b_char = 5'h14;
    M_seven_seg_c_char = 5'h14;
    M_seven_seg_d_char = 5'h14;
    sevenseg_a = M_seven_seg_a_seg;
    sevenseg_b = M_seven_seg_b_seg;
    sevenseg_c = M_seven_seg_c_seg;
    sevenseg_d = M_seven_seg_d_seg;
    M_motherposled_position = 4'h9;
    M_billyposled_position = 1'h0;
    M_button_cond_buttona = buttona;
    M_button_cond_buttonb = buttonb;
    M_button_cond_buttonc = buttonc;
    M_button_cond_buttonadd = buttonadd;
    M_button_cond_buttonsub = buttonsub;
    M_button_cond_buttonmul = buttonmul;
    M_button_cond_buttondiv = buttondiv;
    motherled = M_motherposled_led;
    billyled = M_billyposled_led;
    M_simplemode_buttona = 1'h0;
    M_simplemode_buttonadd = 1'h0;
    M_simplemode_buttonsub = 1'h0;
    M_simplemode_buttonmul = 1'h0;
    M_simplemode_buttondiv = 1'h0;
    M_simplemode_aluout = 1'h0;
    M_simplemode_buttonb = 1'h0;
    M_simplemode_buttonc = 1'h0;
    M_hardmode_buttona = 1'h0;
    M_hardmode_buttonb = 1'h0;
    M_hardmode_buttonc = 1'h0;
    M_hardmode_buttonadd = 1'h0;
    M_hardmode_buttonsub = 1'h0;
    M_hardmode_buttondiv = 1'h0;
    M_hardmode_buttonmul = 1'h0;
    M_hardmode_aluout = 1'h0;
    M_counter_d = M_counter_q;
    M_timer_d = M_timer_q + 1'h1;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 6'h00;
    
    case (M_state_q)
      IDLE_state: begin
        if (M_timer_q == 27'h5f5e100) begin
          M_counter_d = M_counter_q + 1'h1;
          M_timer_d = 1'h0;
        end
        if (M_counter_q == 4'ha) begin
          M_counter_d = 1'h0;
        end
        M_seven_seg_a_char = M_counter_q;
        M_seven_seg_b_char = M_counter_q;
        M_seven_seg_c_char = M_counter_q;
        M_seven_seg_d_char = M_counter_q;
        if (M_button_cond_buttonaout == 1'h1) begin
          M_state_d = SIMPLEMODE_state;
        end
        if (M_button_cond_buttoncout == 1'h1) begin
          M_state_d = HARDMODE_state;
        end
      end
      SIMPLEMODE_state: begin
        M_simplemode_buttona = M_button_cond_buttonaout;
        M_simplemode_buttonb = M_button_cond_buttonbout;
        M_simplemode_buttonc = M_button_cond_buttoncout;
        M_simplemode_buttonadd = M_button_cond_buttonaddout;
        M_simplemode_buttonsub = M_button_cond_buttonsubout;
        M_simplemode_buttonmul = M_button_cond_buttonmulout;
        M_simplemode_buttondiv = M_button_cond_buttondivout;
        M_simplemode_aluout = M_alu_s;
        M_alu_a = M_simplemode_alua;
        M_alu_b = M_simplemode_alub;
        M_alu_alufn = M_simplemode_alualufn;
        gameend = M_simplemode_gameend;
        M_motherposled_position = M_simplemode_motherpos;
        M_billyposled_position = M_simplemode_billypos;
        M_seven_seg_a_char = M_simplemode_a_out;
        M_seven_seg_b_char = M_simplemode_b_out;
        M_seven_seg_c_char = M_simplemode_c_out;
        M_seven_seg_d_char = M_simplemode_d_out;
        M_operator1led_opcode = M_simplemode_operator_sig;
        equalled = 1'h1;
        if (gameend == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
      HARDMODE_state: begin
        M_hardmode_buttona = M_button_cond_buttonaout;
        M_hardmode_buttonb = M_button_cond_buttonbout;
        M_hardmode_buttonc = M_button_cond_buttoncout;
        M_hardmode_buttonadd = M_button_cond_buttonaddout;
        M_hardmode_buttonsub = M_button_cond_buttonsubout;
        M_hardmode_buttondiv = M_button_cond_buttondivout;
        M_hardmode_buttonmul = M_button_cond_buttonmulout;
        M_hardmode_aluout = M_alu_s;
        M_alu_a = M_hardmode_alua;
        M_alu_b = M_hardmode_alub;
        M_alu_alufn = M_hardmode_alualufn;
        gameend = M_hardmode_gameend;
        M_motherposled_position = M_hardmode_motherpos;
        M_billyposled_position = M_hardmode_billypos;
        M_seven_seg_a_char = M_hardmode_a_out;
        M_seven_seg_b_char = M_hardmode_b_out;
        M_seven_seg_c_char = M_hardmode_c_out;
        M_seven_seg_d_char = M_hardmode_d_out;
        M_operator1led_opcode = M_hardmode_operator1_out;
        M_operator2led_opcode = M_hardmode_operator2_out;
        equalled = 1'h1;
        if (gameend == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_counter_q <= M_counter_d;
    M_timer_q <= M_timer_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule