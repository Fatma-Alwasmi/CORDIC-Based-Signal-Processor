// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// bundle8
// 0x0 : Control signals
//       bit 0  - ap_start (Read/Write/COH)
//       bit 1  - ap_done (Read/COR)
//       bit 2  - ap_idle (Read)
//       bit 3  - ap_ready (Read/COR)
//       bit 7  - auto_restart (Read/Write)
//       bit 9  - interrupt (Read)
//       others - reserved
// 0x4 : Global Interrupt Enable Register
//       bit 0  - Global Interrupt Enable (Read/Write)
//       others - reserved
// 0x8 : IP Interrupt Enable Register (Read/Write)
//       bit 0 - enable ap_done interrupt (Read/Write)
//       bit 1 - enable ap_ready interrupt (Read/Write)
//       others - reserved
// 0xc : IP Interrupt Status Register (Read/TOW)
//       bit 0 - ap_done (Read/TOW)
//       bit 1 - ap_ready (Read/TOW)
//       others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTOP_FPGA417_BUNDLE8_ADDR_AP_CTRL 0x0
#define XTOP_FPGA417_BUNDLE8_ADDR_GIE     0x4
#define XTOP_FPGA417_BUNDLE8_ADDR_IER     0x8
#define XTOP_FPGA417_BUNDLE8_ADDR_ISR     0xc

// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of input_real
//        bit 31~0 - input_real[31:0] (Read/Write)
// 0x14 : Data signal of input_real
//        bit 31~0 - input_real[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of input_img
//        bit 31~0 - input_img[31:0] (Read/Write)
// 0x20 : Data signal of input_img
//        bit 31~0 - input_img[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of kernel_real
//        bit 31~0 - kernel_real[31:0] (Read/Write)
// 0x2c : Data signal of kernel_real
//        bit 31~0 - kernel_real[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of kernel_img
//        bit 31~0 - kernel_img[31:0] (Read/Write)
// 0x38 : Data signal of kernel_img
//        bit 31~0 - kernel_img[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of output_mag
//        bit 31~0 - output_mag[31:0] (Read/Write)
// 0x44 : Data signal of output_mag
//        bit 31~0 - output_mag[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of output_theta
//        bit 31~0 - output_theta[31:0] (Read/Write)
// 0x50 : Data signal of output_theta
//        bit 31~0 - output_theta[63:32] (Read/Write)
// 0x54 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTOP_FPGA417_CONTROL_ADDR_INPUT_REAL_DATA   0x10
#define XTOP_FPGA417_CONTROL_BITS_INPUT_REAL_DATA   64
#define XTOP_FPGA417_CONTROL_ADDR_INPUT_IMG_DATA    0x1c
#define XTOP_FPGA417_CONTROL_BITS_INPUT_IMG_DATA    64
#define XTOP_FPGA417_CONTROL_ADDR_KERNEL_REAL_DATA  0x28
#define XTOP_FPGA417_CONTROL_BITS_KERNEL_REAL_DATA  64
#define XTOP_FPGA417_CONTROL_ADDR_KERNEL_IMG_DATA   0x34
#define XTOP_FPGA417_CONTROL_BITS_KERNEL_IMG_DATA   64
#define XTOP_FPGA417_CONTROL_ADDR_OUTPUT_MAG_DATA   0x40
#define XTOP_FPGA417_CONTROL_BITS_OUTPUT_MAG_DATA   64
#define XTOP_FPGA417_CONTROL_ADDR_OUTPUT_THETA_DATA 0x4c
#define XTOP_FPGA417_CONTROL_BITS_OUTPUT_THETA_DATA 64

