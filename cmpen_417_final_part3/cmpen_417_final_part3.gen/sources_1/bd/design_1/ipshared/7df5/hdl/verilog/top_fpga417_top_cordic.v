// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_fpga417_top_cordic (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        img_stream2_dout,
        img_stream2_num_data_valid,
        img_stream2_fifo_cap,
        img_stream2_empty_n,
        img_stream2_read,
        real_stream3_dout,
        real_stream3_num_data_valid,
        real_stream3_fifo_cap,
        real_stream3_empty_n,
        real_stream3_read,
        m_axi_bundle5_AWVALID,
        m_axi_bundle5_AWREADY,
        m_axi_bundle5_AWADDR,
        m_axi_bundle5_AWID,
        m_axi_bundle5_AWLEN,
        m_axi_bundle5_AWSIZE,
        m_axi_bundle5_AWBURST,
        m_axi_bundle5_AWLOCK,
        m_axi_bundle5_AWCACHE,
        m_axi_bundle5_AWPROT,
        m_axi_bundle5_AWQOS,
        m_axi_bundle5_AWREGION,
        m_axi_bundle5_AWUSER,
        m_axi_bundle5_WVALID,
        m_axi_bundle5_WREADY,
        m_axi_bundle5_WDATA,
        m_axi_bundle5_WSTRB,
        m_axi_bundle5_WLAST,
        m_axi_bundle5_WID,
        m_axi_bundle5_WUSER,
        m_axi_bundle5_ARVALID,
        m_axi_bundle5_ARREADY,
        m_axi_bundle5_ARADDR,
        m_axi_bundle5_ARID,
        m_axi_bundle5_ARLEN,
        m_axi_bundle5_ARSIZE,
        m_axi_bundle5_ARBURST,
        m_axi_bundle5_ARLOCK,
        m_axi_bundle5_ARCACHE,
        m_axi_bundle5_ARPROT,
        m_axi_bundle5_ARQOS,
        m_axi_bundle5_ARREGION,
        m_axi_bundle5_ARUSER,
        m_axi_bundle5_RVALID,
        m_axi_bundle5_RREADY,
        m_axi_bundle5_RDATA,
        m_axi_bundle5_RLAST,
        m_axi_bundle5_RID,
        m_axi_bundle5_RFIFONUM,
        m_axi_bundle5_RUSER,
        m_axi_bundle5_RRESP,
        m_axi_bundle5_BVALID,
        m_axi_bundle5_BREADY,
        m_axi_bundle5_BRESP,
        m_axi_bundle5_BID,
        m_axi_bundle5_BUSER,
        output_mag_dout,
        output_mag_num_data_valid,
        output_mag_fifo_cap,
        output_mag_empty_n,
        output_mag_read,
        m_axi_bundle6_AWVALID,
        m_axi_bundle6_AWREADY,
        m_axi_bundle6_AWADDR,
        m_axi_bundle6_AWID,
        m_axi_bundle6_AWLEN,
        m_axi_bundle6_AWSIZE,
        m_axi_bundle6_AWBURST,
        m_axi_bundle6_AWLOCK,
        m_axi_bundle6_AWCACHE,
        m_axi_bundle6_AWPROT,
        m_axi_bundle6_AWQOS,
        m_axi_bundle6_AWREGION,
        m_axi_bundle6_AWUSER,
        m_axi_bundle6_WVALID,
        m_axi_bundle6_WREADY,
        m_axi_bundle6_WDATA,
        m_axi_bundle6_WSTRB,
        m_axi_bundle6_WLAST,
        m_axi_bundle6_WID,
        m_axi_bundle6_WUSER,
        m_axi_bundle6_ARVALID,
        m_axi_bundle6_ARREADY,
        m_axi_bundle6_ARADDR,
        m_axi_bundle6_ARID,
        m_axi_bundle6_ARLEN,
        m_axi_bundle6_ARSIZE,
        m_axi_bundle6_ARBURST,
        m_axi_bundle6_ARLOCK,
        m_axi_bundle6_ARCACHE,
        m_axi_bundle6_ARPROT,
        m_axi_bundle6_ARQOS,
        m_axi_bundle6_ARREGION,
        m_axi_bundle6_ARUSER,
        m_axi_bundle6_RVALID,
        m_axi_bundle6_RREADY,
        m_axi_bundle6_RDATA,
        m_axi_bundle6_RLAST,
        m_axi_bundle6_RID,
        m_axi_bundle6_RFIFONUM,
        m_axi_bundle6_RUSER,
        m_axi_bundle6_RRESP,
        m_axi_bundle6_BVALID,
        m_axi_bundle6_BREADY,
        m_axi_bundle6_BRESP,
        m_axi_bundle6_BID,
        m_axi_bundle6_BUSER,
        output_theta_dout,
        output_theta_num_data_valid,
        output_theta_fifo_cap,
        output_theta_empty_n,
        output_theta_read,
        input_length_dout,
        input_length_num_data_valid,
        input_length_fifo_cap,
        input_length_empty_n,
        input_length_read
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] img_stream2_dout;
input  [1:0] img_stream2_num_data_valid;
input  [1:0] img_stream2_fifo_cap;
input   img_stream2_empty_n;
output   img_stream2_read;
input  [31:0] real_stream3_dout;
input  [1:0] real_stream3_num_data_valid;
input  [1:0] real_stream3_fifo_cap;
input   real_stream3_empty_n;
output   real_stream3_read;
output   m_axi_bundle5_AWVALID;
input   m_axi_bundle5_AWREADY;
output  [63:0] m_axi_bundle5_AWADDR;
output  [0:0] m_axi_bundle5_AWID;
output  [31:0] m_axi_bundle5_AWLEN;
output  [2:0] m_axi_bundle5_AWSIZE;
output  [1:0] m_axi_bundle5_AWBURST;
output  [1:0] m_axi_bundle5_AWLOCK;
output  [3:0] m_axi_bundle5_AWCACHE;
output  [2:0] m_axi_bundle5_AWPROT;
output  [3:0] m_axi_bundle5_AWQOS;
output  [3:0] m_axi_bundle5_AWREGION;
output  [0:0] m_axi_bundle5_AWUSER;
output   m_axi_bundle5_WVALID;
input   m_axi_bundle5_WREADY;
output  [31:0] m_axi_bundle5_WDATA;
output  [3:0] m_axi_bundle5_WSTRB;
output   m_axi_bundle5_WLAST;
output  [0:0] m_axi_bundle5_WID;
output  [0:0] m_axi_bundle5_WUSER;
output   m_axi_bundle5_ARVALID;
input   m_axi_bundle5_ARREADY;
output  [63:0] m_axi_bundle5_ARADDR;
output  [0:0] m_axi_bundle5_ARID;
output  [31:0] m_axi_bundle5_ARLEN;
output  [2:0] m_axi_bundle5_ARSIZE;
output  [1:0] m_axi_bundle5_ARBURST;
output  [1:0] m_axi_bundle5_ARLOCK;
output  [3:0] m_axi_bundle5_ARCACHE;
output  [2:0] m_axi_bundle5_ARPROT;
output  [3:0] m_axi_bundle5_ARQOS;
output  [3:0] m_axi_bundle5_ARREGION;
output  [0:0] m_axi_bundle5_ARUSER;
input   m_axi_bundle5_RVALID;
output   m_axi_bundle5_RREADY;
input  [31:0] m_axi_bundle5_RDATA;
input   m_axi_bundle5_RLAST;
input  [0:0] m_axi_bundle5_RID;
input  [8:0] m_axi_bundle5_RFIFONUM;
input  [0:0] m_axi_bundle5_RUSER;
input  [1:0] m_axi_bundle5_RRESP;
input   m_axi_bundle5_BVALID;
output   m_axi_bundle5_BREADY;
input  [1:0] m_axi_bundle5_BRESP;
input  [0:0] m_axi_bundle5_BID;
input  [0:0] m_axi_bundle5_BUSER;
input  [63:0] output_mag_dout;
input  [2:0] output_mag_num_data_valid;
input  [2:0] output_mag_fifo_cap;
input   output_mag_empty_n;
output   output_mag_read;
output   m_axi_bundle6_AWVALID;
input   m_axi_bundle6_AWREADY;
output  [63:0] m_axi_bundle6_AWADDR;
output  [0:0] m_axi_bundle6_AWID;
output  [31:0] m_axi_bundle6_AWLEN;
output  [2:0] m_axi_bundle6_AWSIZE;
output  [1:0] m_axi_bundle6_AWBURST;
output  [1:0] m_axi_bundle6_AWLOCK;
output  [3:0] m_axi_bundle6_AWCACHE;
output  [2:0] m_axi_bundle6_AWPROT;
output  [3:0] m_axi_bundle6_AWQOS;
output  [3:0] m_axi_bundle6_AWREGION;
output  [0:0] m_axi_bundle6_AWUSER;
output   m_axi_bundle6_WVALID;
input   m_axi_bundle6_WREADY;
output  [31:0] m_axi_bundle6_WDATA;
output  [3:0] m_axi_bundle6_WSTRB;
output   m_axi_bundle6_WLAST;
output  [0:0] m_axi_bundle6_WID;
output  [0:0] m_axi_bundle6_WUSER;
output   m_axi_bundle6_ARVALID;
input   m_axi_bundle6_ARREADY;
output  [63:0] m_axi_bundle6_ARADDR;
output  [0:0] m_axi_bundle6_ARID;
output  [31:0] m_axi_bundle6_ARLEN;
output  [2:0] m_axi_bundle6_ARSIZE;
output  [1:0] m_axi_bundle6_ARBURST;
output  [1:0] m_axi_bundle6_ARLOCK;
output  [3:0] m_axi_bundle6_ARCACHE;
output  [2:0] m_axi_bundle6_ARPROT;
output  [3:0] m_axi_bundle6_ARQOS;
output  [3:0] m_axi_bundle6_ARREGION;
output  [0:0] m_axi_bundle6_ARUSER;
input   m_axi_bundle6_RVALID;
output   m_axi_bundle6_RREADY;
input  [31:0] m_axi_bundle6_RDATA;
input   m_axi_bundle6_RLAST;
input  [0:0] m_axi_bundle6_RID;
input  [8:0] m_axi_bundle6_RFIFONUM;
input  [0:0] m_axi_bundle6_RUSER;
input  [1:0] m_axi_bundle6_RRESP;
input   m_axi_bundle6_BVALID;
output   m_axi_bundle6_BREADY;
input  [1:0] m_axi_bundle6_BRESP;
input  [0:0] m_axi_bundle6_BID;
input  [0:0] m_axi_bundle6_BUSER;
input  [63:0] output_theta_dout;
input  [2:0] output_theta_num_data_valid;
input  [2:0] output_theta_fifo_cap;
input   output_theta_empty_n;
output   output_theta_read;
input  [31:0] input_length_dout;
input  [1:0] input_length_num_data_valid;
input  [1:0] input_length_fifo_cap;
input   input_length_empty_n;
output   input_length_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg img_stream2_read;
reg real_stream3_read;
reg m_axi_bundle5_AWVALID;
reg m_axi_bundle5_WVALID;
reg m_axi_bundle5_BREADY;
reg output_mag_read;
reg m_axi_bundle6_AWVALID;
reg m_axi_bundle6_WVALID;
reg m_axi_bundle6_BREADY;
reg output_theta_read;
reg input_length_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    img_stream2_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln167_fu_126_p2;
reg    real_stream3_blk_n;
reg    output_mag_blk_n;
reg    output_theta_blk_n;
reg    input_length_blk_n;
reg   [31:0] input_length_read_reg_179;
reg   [63:0] output_theta_read_reg_184;
reg   [63:0] output_mag_read_reg_189;
wire   [16:0] trunc_ln214_fu_137_p1;
reg   [16:0] trunc_ln214_reg_197;
wire   [16:0] trunc_ln214_1_fu_141_p1;
reg   [16:0] trunc_ln214_1_reg_202;
wire   [63:0] add_ln176_fu_157_p2;
reg   [63:0] add_ln176_reg_207;
wire   [63:0] add_ln176_1_fu_162_p2;
reg   [63:0] add_ln176_1_reg_212;
wire    grp_cordic_fu_100_ap_start;
wire    grp_cordic_fu_100_ap_done;
wire    grp_cordic_fu_100_ap_idle;
wire    grp_cordic_fu_100_ap_ready;
wire    grp_cordic_fu_100_m_axi_bundle5_AWVALID;
wire   [63:0] grp_cordic_fu_100_m_axi_bundle5_AWADDR;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_AWID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle5_AWLEN;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle5_AWSIZE;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle5_AWBURST;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle5_AWLOCK;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_AWCACHE;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle5_AWPROT;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_AWQOS;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_AWREGION;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_AWUSER;
wire    grp_cordic_fu_100_m_axi_bundle5_WVALID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle5_WDATA;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_WSTRB;
wire    grp_cordic_fu_100_m_axi_bundle5_WLAST;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_WID;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_WUSER;
wire    grp_cordic_fu_100_m_axi_bundle5_ARVALID;
wire   [63:0] grp_cordic_fu_100_m_axi_bundle5_ARADDR;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_ARID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle5_ARLEN;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle5_ARSIZE;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle5_ARBURST;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle5_ARLOCK;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_ARCACHE;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle5_ARPROT;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_ARQOS;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle5_ARREGION;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle5_ARUSER;
wire    grp_cordic_fu_100_m_axi_bundle5_RREADY;
wire    grp_cordic_fu_100_m_axi_bundle5_BREADY;
wire    grp_cordic_fu_100_m_axi_bundle6_AWVALID;
wire   [63:0] grp_cordic_fu_100_m_axi_bundle6_AWADDR;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_AWID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle6_AWLEN;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle6_AWSIZE;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle6_AWBURST;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle6_AWLOCK;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_AWCACHE;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle6_AWPROT;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_AWQOS;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_AWREGION;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_AWUSER;
wire    grp_cordic_fu_100_m_axi_bundle6_WVALID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle6_WDATA;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_WSTRB;
wire    grp_cordic_fu_100_m_axi_bundle6_WLAST;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_WID;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_WUSER;
wire    grp_cordic_fu_100_m_axi_bundle6_ARVALID;
wire   [63:0] grp_cordic_fu_100_m_axi_bundle6_ARADDR;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_ARID;
wire   [31:0] grp_cordic_fu_100_m_axi_bundle6_ARLEN;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle6_ARSIZE;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle6_ARBURST;
wire   [1:0] grp_cordic_fu_100_m_axi_bundle6_ARLOCK;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_ARCACHE;
wire   [2:0] grp_cordic_fu_100_m_axi_bundle6_ARPROT;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_ARQOS;
wire   [3:0] grp_cordic_fu_100_m_axi_bundle6_ARREGION;
wire   [0:0] grp_cordic_fu_100_m_axi_bundle6_ARUSER;
wire    grp_cordic_fu_100_m_axi_bundle6_RREADY;
wire    grp_cordic_fu_100_m_axi_bundle6_BREADY;
reg    grp_cordic_fu_100_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [30:0] i_fu_66;
wire   [30:0] add_ln167_fu_131_p2;
reg    ap_block_state2;
reg    ap_block_state1;
wire   [31:0] zext_ln167_fu_122_p1;
wire   [32:0] shl_ln_fu_145_p3;
wire   [63:0] zext_ln176_fu_153_p1;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_cordic_fu_100_ap_start_reg = 1'b0;
end

top_fpga417_cordic grp_cordic_fu_100(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_cordic_fu_100_ap_start),
    .ap_done(grp_cordic_fu_100_ap_done),
    .ap_idle(grp_cordic_fu_100_ap_idle),
    .ap_ready(grp_cordic_fu_100_ap_ready),
    .cos(trunc_ln214_reg_197),
    .sin(trunc_ln214_1_reg_202),
    .m_axi_bundle5_AWVALID(grp_cordic_fu_100_m_axi_bundle5_AWVALID),
    .m_axi_bundle5_AWREADY(m_axi_bundle5_AWREADY),
    .m_axi_bundle5_AWADDR(grp_cordic_fu_100_m_axi_bundle5_AWADDR),
    .m_axi_bundle5_AWID(grp_cordic_fu_100_m_axi_bundle5_AWID),
    .m_axi_bundle5_AWLEN(grp_cordic_fu_100_m_axi_bundle5_AWLEN),
    .m_axi_bundle5_AWSIZE(grp_cordic_fu_100_m_axi_bundle5_AWSIZE),
    .m_axi_bundle5_AWBURST(grp_cordic_fu_100_m_axi_bundle5_AWBURST),
    .m_axi_bundle5_AWLOCK(grp_cordic_fu_100_m_axi_bundle5_AWLOCK),
    .m_axi_bundle5_AWCACHE(grp_cordic_fu_100_m_axi_bundle5_AWCACHE),
    .m_axi_bundle5_AWPROT(grp_cordic_fu_100_m_axi_bundle5_AWPROT),
    .m_axi_bundle5_AWQOS(grp_cordic_fu_100_m_axi_bundle5_AWQOS),
    .m_axi_bundle5_AWREGION(grp_cordic_fu_100_m_axi_bundle5_AWREGION),
    .m_axi_bundle5_AWUSER(grp_cordic_fu_100_m_axi_bundle5_AWUSER),
    .m_axi_bundle5_WVALID(grp_cordic_fu_100_m_axi_bundle5_WVALID),
    .m_axi_bundle5_WREADY(m_axi_bundle5_WREADY),
    .m_axi_bundle5_WDATA(grp_cordic_fu_100_m_axi_bundle5_WDATA),
    .m_axi_bundle5_WSTRB(grp_cordic_fu_100_m_axi_bundle5_WSTRB),
    .m_axi_bundle5_WLAST(grp_cordic_fu_100_m_axi_bundle5_WLAST),
    .m_axi_bundle5_WID(grp_cordic_fu_100_m_axi_bundle5_WID),
    .m_axi_bundle5_WUSER(grp_cordic_fu_100_m_axi_bundle5_WUSER),
    .m_axi_bundle5_ARVALID(grp_cordic_fu_100_m_axi_bundle5_ARVALID),
    .m_axi_bundle5_ARREADY(1'b0),
    .m_axi_bundle5_ARADDR(grp_cordic_fu_100_m_axi_bundle5_ARADDR),
    .m_axi_bundle5_ARID(grp_cordic_fu_100_m_axi_bundle5_ARID),
    .m_axi_bundle5_ARLEN(grp_cordic_fu_100_m_axi_bundle5_ARLEN),
    .m_axi_bundle5_ARSIZE(grp_cordic_fu_100_m_axi_bundle5_ARSIZE),
    .m_axi_bundle5_ARBURST(grp_cordic_fu_100_m_axi_bundle5_ARBURST),
    .m_axi_bundle5_ARLOCK(grp_cordic_fu_100_m_axi_bundle5_ARLOCK),
    .m_axi_bundle5_ARCACHE(grp_cordic_fu_100_m_axi_bundle5_ARCACHE),
    .m_axi_bundle5_ARPROT(grp_cordic_fu_100_m_axi_bundle5_ARPROT),
    .m_axi_bundle5_ARQOS(grp_cordic_fu_100_m_axi_bundle5_ARQOS),
    .m_axi_bundle5_ARREGION(grp_cordic_fu_100_m_axi_bundle5_ARREGION),
    .m_axi_bundle5_ARUSER(grp_cordic_fu_100_m_axi_bundle5_ARUSER),
    .m_axi_bundle5_RVALID(1'b0),
    .m_axi_bundle5_RREADY(grp_cordic_fu_100_m_axi_bundle5_RREADY),
    .m_axi_bundle5_RDATA(32'd0),
    .m_axi_bundle5_RLAST(1'b0),
    .m_axi_bundle5_RID(1'd0),
    .m_axi_bundle5_RFIFONUM(9'd0),
    .m_axi_bundle5_RUSER(1'd0),
    .m_axi_bundle5_RRESP(2'd0),
    .m_axi_bundle5_BVALID(m_axi_bundle5_BVALID),
    .m_axi_bundle5_BREADY(grp_cordic_fu_100_m_axi_bundle5_BREADY),
    .m_axi_bundle5_BRESP(m_axi_bundle5_BRESP),
    .m_axi_bundle5_BID(m_axi_bundle5_BID),
    .m_axi_bundle5_BUSER(m_axi_bundle5_BUSER),
    .mag(add_ln176_reg_207),
    .m_axi_bundle6_AWVALID(grp_cordic_fu_100_m_axi_bundle6_AWVALID),
    .m_axi_bundle6_AWREADY(m_axi_bundle6_AWREADY),
    .m_axi_bundle6_AWADDR(grp_cordic_fu_100_m_axi_bundle6_AWADDR),
    .m_axi_bundle6_AWID(grp_cordic_fu_100_m_axi_bundle6_AWID),
    .m_axi_bundle6_AWLEN(grp_cordic_fu_100_m_axi_bundle6_AWLEN),
    .m_axi_bundle6_AWSIZE(grp_cordic_fu_100_m_axi_bundle6_AWSIZE),
    .m_axi_bundle6_AWBURST(grp_cordic_fu_100_m_axi_bundle6_AWBURST),
    .m_axi_bundle6_AWLOCK(grp_cordic_fu_100_m_axi_bundle6_AWLOCK),
    .m_axi_bundle6_AWCACHE(grp_cordic_fu_100_m_axi_bundle6_AWCACHE),
    .m_axi_bundle6_AWPROT(grp_cordic_fu_100_m_axi_bundle6_AWPROT),
    .m_axi_bundle6_AWQOS(grp_cordic_fu_100_m_axi_bundle6_AWQOS),
    .m_axi_bundle6_AWREGION(grp_cordic_fu_100_m_axi_bundle6_AWREGION),
    .m_axi_bundle6_AWUSER(grp_cordic_fu_100_m_axi_bundle6_AWUSER),
    .m_axi_bundle6_WVALID(grp_cordic_fu_100_m_axi_bundle6_WVALID),
    .m_axi_bundle6_WREADY(m_axi_bundle6_WREADY),
    .m_axi_bundle6_WDATA(grp_cordic_fu_100_m_axi_bundle6_WDATA),
    .m_axi_bundle6_WSTRB(grp_cordic_fu_100_m_axi_bundle6_WSTRB),
    .m_axi_bundle6_WLAST(grp_cordic_fu_100_m_axi_bundle6_WLAST),
    .m_axi_bundle6_WID(grp_cordic_fu_100_m_axi_bundle6_WID),
    .m_axi_bundle6_WUSER(grp_cordic_fu_100_m_axi_bundle6_WUSER),
    .m_axi_bundle6_ARVALID(grp_cordic_fu_100_m_axi_bundle6_ARVALID),
    .m_axi_bundle6_ARREADY(1'b0),
    .m_axi_bundle6_ARADDR(grp_cordic_fu_100_m_axi_bundle6_ARADDR),
    .m_axi_bundle6_ARID(grp_cordic_fu_100_m_axi_bundle6_ARID),
    .m_axi_bundle6_ARLEN(grp_cordic_fu_100_m_axi_bundle6_ARLEN),
    .m_axi_bundle6_ARSIZE(grp_cordic_fu_100_m_axi_bundle6_ARSIZE),
    .m_axi_bundle6_ARBURST(grp_cordic_fu_100_m_axi_bundle6_ARBURST),
    .m_axi_bundle6_ARLOCK(grp_cordic_fu_100_m_axi_bundle6_ARLOCK),
    .m_axi_bundle6_ARCACHE(grp_cordic_fu_100_m_axi_bundle6_ARCACHE),
    .m_axi_bundle6_ARPROT(grp_cordic_fu_100_m_axi_bundle6_ARPROT),
    .m_axi_bundle6_ARQOS(grp_cordic_fu_100_m_axi_bundle6_ARQOS),
    .m_axi_bundle6_ARREGION(grp_cordic_fu_100_m_axi_bundle6_ARREGION),
    .m_axi_bundle6_ARUSER(grp_cordic_fu_100_m_axi_bundle6_ARUSER),
    .m_axi_bundle6_RVALID(1'b0),
    .m_axi_bundle6_RREADY(grp_cordic_fu_100_m_axi_bundle6_RREADY),
    .m_axi_bundle6_RDATA(32'd0),
    .m_axi_bundle6_RLAST(1'b0),
    .m_axi_bundle6_RID(1'd0),
    .m_axi_bundle6_RFIFONUM(9'd0),
    .m_axi_bundle6_RUSER(1'd0),
    .m_axi_bundle6_RRESP(2'd0),
    .m_axi_bundle6_BVALID(m_axi_bundle6_BVALID),
    .m_axi_bundle6_BREADY(grp_cordic_fu_100_m_axi_bundle6_BREADY),
    .m_axi_bundle6_BRESP(m_axi_bundle6_BRESP),
    .m_axi_bundle6_BID(m_axi_bundle6_BID),
    .m_axi_bundle6_BUSER(m_axi_bundle6_BUSER),
    .theta(add_ln176_1_reg_212)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_cordic_fu_100_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_cordic_fu_100_ap_start_reg <= 1'b1;
        end else if ((grp_cordic_fu_100_ap_ready == 1'b1)) begin
            grp_cordic_fu_100_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_66 <= 31'd0;
    end else if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        i_fu_66 <= add_ln167_fu_131_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        add_ln176_1_reg_212 <= add_ln176_1_fu_162_p2;
        add_ln176_reg_207 <= add_ln176_fu_157_p2;
        trunc_ln214_1_reg_202 <= trunc_ln214_1_fu_141_p1;
        trunc_ln214_reg_197 <= trunc_ln214_fu_137_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        input_length_read_reg_179 <= input_length_dout;
        output_mag_read_reg_189 <= output_mag_dout;
        output_theta_read_reg_184 <= output_theta_dout;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_cordic_fu_100_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        img_stream2_blk_n = img_stream2_empty_n;
    end else begin
        img_stream2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        img_stream2_read = 1'b1;
    end else begin
        img_stream2_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_length_blk_n = input_length_empty_n;
    end else begin
        input_length_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_length_read = 1'b1;
    end else begin
        input_length_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle5_AWVALID = grp_cordic_fu_100_m_axi_bundle5_AWVALID;
    end else begin
        m_axi_bundle5_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle5_BREADY = grp_cordic_fu_100_m_axi_bundle5_BREADY;
    end else begin
        m_axi_bundle5_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle5_WVALID = grp_cordic_fu_100_m_axi_bundle5_WVALID;
    end else begin
        m_axi_bundle5_WVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle6_AWVALID = grp_cordic_fu_100_m_axi_bundle6_AWVALID;
    end else begin
        m_axi_bundle6_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle6_BREADY = grp_cordic_fu_100_m_axi_bundle6_BREADY;
    end else begin
        m_axi_bundle6_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_bundle6_WVALID = grp_cordic_fu_100_m_axi_bundle6_WVALID;
    end else begin
        m_axi_bundle6_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_mag_blk_n = output_mag_empty_n;
    end else begin
        output_mag_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_mag_read = 1'b1;
    end else begin
        output_mag_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_theta_blk_n = output_theta_empty_n;
    end else begin
        output_theta_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_theta_read = 1'b1;
    end else begin
        output_theta_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        real_stream3_blk_n = real_stream3_empty_n;
    end else begin
        real_stream3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
        real_stream3_read = 1'b1;
    end else begin
        real_stream3_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~(((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1))) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln167_fu_126_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_cordic_fu_100_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln167_fu_131_p2 = (i_fu_66 + 31'd1);

assign add_ln176_1_fu_162_p2 = (output_theta_read_reg_184 + zext_ln176_fu_153_p1);

assign add_ln176_fu_157_p2 = (output_mag_read_reg_189 + zext_ln176_fu_153_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (output_mag_empty_n == 1'b0) | (input_length_empty_n == 1'b0) | (output_theta_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = (((real_stream3_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)) | ((img_stream2_empty_n == 1'b0) & (icmp_ln167_fu_126_p2 == 1'd1)));
end

assign grp_cordic_fu_100_ap_start = grp_cordic_fu_100_ap_start_reg;

assign icmp_ln167_fu_126_p2 = (($signed(zext_ln167_fu_122_p1) < $signed(input_length_read_reg_179)) ? 1'b1 : 1'b0);

assign m_axi_bundle5_ARADDR = 64'd0;

assign m_axi_bundle5_ARBURST = 2'd0;

assign m_axi_bundle5_ARCACHE = 4'd0;

assign m_axi_bundle5_ARID = 1'd0;

assign m_axi_bundle5_ARLEN = 32'd0;

assign m_axi_bundle5_ARLOCK = 2'd0;

assign m_axi_bundle5_ARPROT = 3'd0;

assign m_axi_bundle5_ARQOS = 4'd0;

assign m_axi_bundle5_ARREGION = 4'd0;

assign m_axi_bundle5_ARSIZE = 3'd0;

assign m_axi_bundle5_ARUSER = 1'd0;

assign m_axi_bundle5_ARVALID = 1'b0;

assign m_axi_bundle5_AWADDR = grp_cordic_fu_100_m_axi_bundle5_AWADDR;

assign m_axi_bundle5_AWBURST = grp_cordic_fu_100_m_axi_bundle5_AWBURST;

assign m_axi_bundle5_AWCACHE = grp_cordic_fu_100_m_axi_bundle5_AWCACHE;

assign m_axi_bundle5_AWID = grp_cordic_fu_100_m_axi_bundle5_AWID;

assign m_axi_bundle5_AWLEN = grp_cordic_fu_100_m_axi_bundle5_AWLEN;

assign m_axi_bundle5_AWLOCK = grp_cordic_fu_100_m_axi_bundle5_AWLOCK;

assign m_axi_bundle5_AWPROT = grp_cordic_fu_100_m_axi_bundle5_AWPROT;

assign m_axi_bundle5_AWQOS = grp_cordic_fu_100_m_axi_bundle5_AWQOS;

assign m_axi_bundle5_AWREGION = grp_cordic_fu_100_m_axi_bundle5_AWREGION;

assign m_axi_bundle5_AWSIZE = grp_cordic_fu_100_m_axi_bundle5_AWSIZE;

assign m_axi_bundle5_AWUSER = grp_cordic_fu_100_m_axi_bundle5_AWUSER;

assign m_axi_bundle5_RREADY = 1'b0;

assign m_axi_bundle5_WDATA = grp_cordic_fu_100_m_axi_bundle5_WDATA;

assign m_axi_bundle5_WID = grp_cordic_fu_100_m_axi_bundle5_WID;

assign m_axi_bundle5_WLAST = grp_cordic_fu_100_m_axi_bundle5_WLAST;

assign m_axi_bundle5_WSTRB = grp_cordic_fu_100_m_axi_bundle5_WSTRB;

assign m_axi_bundle5_WUSER = grp_cordic_fu_100_m_axi_bundle5_WUSER;

assign m_axi_bundle6_ARADDR = 64'd0;

assign m_axi_bundle6_ARBURST = 2'd0;

assign m_axi_bundle6_ARCACHE = 4'd0;

assign m_axi_bundle6_ARID = 1'd0;

assign m_axi_bundle6_ARLEN = 32'd0;

assign m_axi_bundle6_ARLOCK = 2'd0;

assign m_axi_bundle6_ARPROT = 3'd0;

assign m_axi_bundle6_ARQOS = 4'd0;

assign m_axi_bundle6_ARREGION = 4'd0;

assign m_axi_bundle6_ARSIZE = 3'd0;

assign m_axi_bundle6_ARUSER = 1'd0;

assign m_axi_bundle6_ARVALID = 1'b0;

assign m_axi_bundle6_AWADDR = grp_cordic_fu_100_m_axi_bundle6_AWADDR;

assign m_axi_bundle6_AWBURST = grp_cordic_fu_100_m_axi_bundle6_AWBURST;

assign m_axi_bundle6_AWCACHE = grp_cordic_fu_100_m_axi_bundle6_AWCACHE;

assign m_axi_bundle6_AWID = grp_cordic_fu_100_m_axi_bundle6_AWID;

assign m_axi_bundle6_AWLEN = grp_cordic_fu_100_m_axi_bundle6_AWLEN;

assign m_axi_bundle6_AWLOCK = grp_cordic_fu_100_m_axi_bundle6_AWLOCK;

assign m_axi_bundle6_AWPROT = grp_cordic_fu_100_m_axi_bundle6_AWPROT;

assign m_axi_bundle6_AWQOS = grp_cordic_fu_100_m_axi_bundle6_AWQOS;

assign m_axi_bundle6_AWREGION = grp_cordic_fu_100_m_axi_bundle6_AWREGION;

assign m_axi_bundle6_AWSIZE = grp_cordic_fu_100_m_axi_bundle6_AWSIZE;

assign m_axi_bundle6_AWUSER = grp_cordic_fu_100_m_axi_bundle6_AWUSER;

assign m_axi_bundle6_RREADY = 1'b0;

assign m_axi_bundle6_WDATA = grp_cordic_fu_100_m_axi_bundle6_WDATA;

assign m_axi_bundle6_WID = grp_cordic_fu_100_m_axi_bundle6_WID;

assign m_axi_bundle6_WLAST = grp_cordic_fu_100_m_axi_bundle6_WLAST;

assign m_axi_bundle6_WSTRB = grp_cordic_fu_100_m_axi_bundle6_WSTRB;

assign m_axi_bundle6_WUSER = grp_cordic_fu_100_m_axi_bundle6_WUSER;

assign shl_ln_fu_145_p3 = {{i_fu_66}, {2'd0}};

assign trunc_ln214_1_fu_141_p1 = real_stream3_dout[16:0];

assign trunc_ln214_fu_137_p1 = img_stream2_dout[16:0];

assign zext_ln167_fu_122_p1 = i_fu_66;

assign zext_ln176_fu_153_p1 = shl_ln_fu_145_p3;

endmodule //top_fpga417_top_cordic
