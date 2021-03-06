// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir_fir,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu5p-flva2104-1-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.772000,HLS_SYN_LAT=44,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=133,HLS_SYN_LUT=257,HLS_VERSION=2020_2}" *)

module fir (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        y,
        y_ap_vld,
        x
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] y;
output   y_ap_vld;
input  [31:0] x;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg y_ap_vld;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] shift_reg_address0;
reg    shift_reg_ce0;
reg    shift_reg_we0;
reg   [31:0] shift_reg_d0;
wire  signed [31:0] shift_reg_q0;
wire   [3:0] c_address0;
reg    c_ce0;
wire  signed [9:0] c_q0;
wire   [63:0] zext_ln10_fu_149_p1;
reg   [63:0] zext_ln10_reg_224;
wire    ap_CS_fsm_state2;
wire   [3:0] add_ln10_fu_159_p2;
reg   [3:0] add_ln10_reg_232;
wire   [0:0] icmp_ln10_fu_153_p2;
wire   [4:0] add_ln17_fu_184_p2;
reg   [4:0] add_ln17_reg_245;
wire    ap_CS_fsm_state4;
wire   [0:0] tmp_fu_176_p3;
wire   [31:0] acc_3_fu_212_p2;
wire    ap_CS_fsm_state5;
reg   [3:0] i_reg_115;
wire    ap_CS_fsm_state3;
reg   [4:0] i_1_reg_126;
reg   [31:0] acc_reg_137;
wire   [63:0] zext_ln11_fu_165_p1;
wire   [63:0] zext_ln17_fu_170_p1;
wire   [6:0] mul_ln27_fu_190_p1;
wire   [31:0] mul_ln27_fu_190_p2;
wire   [31:0] mul_ln18_fu_206_p2;
reg   [4:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
end

fir_shift_reg #(
    .DataWidth( 32 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
shift_reg_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_address0),
    .ce0(shift_reg_ce0),
    .we0(shift_reg_we0),
    .d0(shift_reg_d0),
    .q0(shift_reg_q0)
);

fir_c #(
    .DataWidth( 10 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(c_address0),
    .ce0(c_ce0),
    .q0(c_q0)
);

fir_mul_32s_7ns_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 7 ),
    .dout_WIDTH( 32 ))
mul_32s_7ns_32_1_1_U1(
    .din0(x),
    .din1(mul_ln27_fu_190_p1),
    .dout(mul_ln27_fu_190_p2)
);

fir_mul_10s_32s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mul_10s_32s_32_1_1_U2(
    .din0(c_q0),
    .din1(shift_reg_q0),
    .dout(mul_ln18_fu_206_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        acc_reg_137 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        acc_reg_137 <= acc_3_fu_212_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_1_reg_126 <= 5'd10;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        i_1_reg_126 <= add_ln17_reg_245;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_115 <= 4'd10;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        i_reg_115 <= add_ln10_reg_232;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln10_fu_153_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        add_ln10_reg_232 <= add_ln10_fu_159_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_176_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        add_ln17_reg_245 <= add_ln17_fu_184_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        zext_ln10_reg_224[3 : 0] <= zext_ln10_fu_149_p1[3 : 0];
    end
end

always @ (*) begin
    if (((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        c_ce0 = 1'b1;
    end else begin
        c_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_176_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        shift_reg_address0 = zext_ln17_fu_170_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_address0 = zext_ln10_reg_224;
    end else if ((((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4)))) begin
        shift_reg_address0 = 4'd0;
    end else if (((icmp_ln10_fu_153_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = zext_ln11_fu_165_p1;
    end else begin
        shift_reg_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_176_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) | ((icmp_ln10_fu_153_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4)))) begin
        shift_reg_ce0 = 1'b1;
    end else begin
        shift_reg_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_d0 = shift_reg_q0;
    end else if ((((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4)))) begin
        shift_reg_d0 = x;
    end else begin
        shift_reg_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4)))) begin
        shift_reg_we0 = 1'b1;
    end else begin
        shift_reg_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        y_ap_vld = 1'b1;
    end else begin
        y_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln10_fu_153_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state4 : begin
            if (((tmp_fu_176_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_3_fu_212_p2 = (mul_ln18_fu_206_p2 + acc_reg_137);

assign add_ln10_fu_159_p2 = ($signed(i_reg_115) + $signed(4'd15));

assign add_ln17_fu_184_p2 = ($signed(i_1_reg_126) + $signed(5'd31));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign c_address0 = zext_ln17_fu_170_p1;

assign icmp_ln10_fu_153_p2 = ((i_reg_115 == 4'd0) ? 1'b1 : 1'b0);

assign mul_ln27_fu_190_p1 = 32'd53;

assign tmp_fu_176_p3 = i_1_reg_126[32'd4];

assign y = (acc_reg_137 + mul_ln27_fu_190_p2);

assign zext_ln10_fu_149_p1 = i_reg_115;

assign zext_ln11_fu_165_p1 = add_ln10_fu_159_p2;

assign zext_ln17_fu_170_p1 = i_1_reg_126;

always @ (posedge ap_clk) begin
    zext_ln10_reg_224[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
end

endmodule //fir
