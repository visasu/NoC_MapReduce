////////////////////////////////
// top level for NoC and sram //
////////////////////////////////

`ifdef TOP_LEVEL
`else
`define TOP_LEVEL
`endif

`include "custom_params.v"

module top_level (
    CLK,
    RST_N,
    //sram
    data_words,
    //noc
    result_output
);

localparam dest_bits = $clog2(`NUM_USER_RECV_PORTS);
localparam vc_bits = (`NUM_VCS > 1) ? $clog2(`NUM_VCS) : 1;
localparam flit_port_width = 2 /*valid and tail bits*/+ `FLIT_DATA_WIDTH + dest_bits + vc_bits;

// mkNetwork ports

input CLK;
input RST_N;

// sram (input arb) ports
input [`DATA_WIDTH-1:0] data_words;
wire [`DATA_WIDTH-1:0] data;
wire                   tail;
wire [`ADDR_WIDTH-1:0] address;
wire [vc_bits:0] arb_get_credit;
wire arb_rdy_get_credit;

// noc ports
wire [flit_port_width-1:0] flit;
wire [flit_port_width-1:0] flit_in_mapper0; // from NoC to mapper input
wire [flit_port_width-1:0] flit_out_mapper0; // from NoC to mapper input
wire en_flit_in_mapper0;

// top level ports
output result_output;

// mapper ports
wire [31:0] value_out_mapper0;
wire [5*`DATA_WIDTH-1:0] key_out_mapper0;
wire [vc_bits:0] mapper0_put_credit;
wire en_mapper0_put_credit;
wire [vc_bits:0] mapper0_get_credit;
wire mapper0_rdy_get_credit;

//reducer ports
wire [flit_port_width-1:0] flit_in_reducer;
wire [vc_bits:0] reducer_put_credit;
wire en_reducer_put_credit;

// action method send_ports_0_putFlit
wire  [70 : 0] send_ports_0_putFlit_flit_in;
wire  EN_send_ports_0_putFlit;

// actionvalue method send_ports_0_getCredits
wire  EN_send_ports_0_getCredits;
wire [1 : 0] send_ports_0_getCredits;

// action method send_ports_1_putFlit
wire  [70 : 0] send_ports_1_putFlit_flit_in;
wire  EN_send_ports_1_putFlit;

// actionvalue method send_ports_1_getCredits
wire  EN_send_ports_1_getCredits;
wire [1 : 0] send_ports_1_getCredits;

// action method send_ports_2_putFlit
wire  [70 : 0] send_ports_2_putFlit_flit_in;
wire  EN_send_ports_2_putFlit;

// actionvalue method send_ports_2_getCredits
wire  EN_send_ports_2_getCredits;
wire [1 : 0] send_ports_2_getCredits;

// action method send_ports_3_putFlit
wire  [70 : 0] send_ports_3_putFlit_flit_in;
wire  EN_send_ports_3_putFlit;

// actionvalue method send_ports_3_getCredits
wire  EN_send_ports_3_getCredits;
wire [1 : 0] send_ports_3_getCredits;

// action method send_ports_4_putFlit
wire  [70 : 0] send_ports_4_putFlit_flit_in;
wire  EN_send_ports_4_putFlit;

// actionvalue method send_ports_4_getCredits
wire  EN_send_ports_4_getCredits;
wire [1 : 0] send_ports_4_getCredits;

// action method send_ports_5_putFlit
wire  [70 : 0] send_ports_5_putFlit_flit_in;
wire  EN_send_ports_5_putFlit;

// actionvalue method send_ports_5_getCredits
wire  EN_send_ports_5_getCredits;
wire [1 : 0] send_ports_5_getCredits;

// action method send_ports_6_putFlit
wire  [70 : 0] send_ports_6_putFlit_flit_in;
wire  EN_send_ports_6_putFlit;

// actionvalue method send_ports_6_getCredits
wire  EN_send_ports_6_getCredits;
wire [1 : 0] send_ports_6_getCredits;

// action method send_ports_7_putFlit
wire  [70 : 0] send_ports_7_putFlit_flit_in;
wire  EN_send_ports_7_putFlit;

// actionvalue method send_ports_7_getCredits
wire  EN_send_ports_7_getCredits;
wire [1 : 0] send_ports_7_getCredits;

// action method send_ports_8_putFlit
wire  [70 : 0] send_ports_8_putFlit_flit_in;
wire  EN_send_ports_8_putFlit;

// actionvalue method send_ports_8_getCredits
wire  EN_send_ports_8_getCredits;
wire [1 : 0] send_ports_8_getCredits;

// action method send_ports_9_putFlit
wire  [70 : 0] send_ports_9_putFlit_flit_in;
wire  EN_send_ports_9_putFlit;

// actionvalue method send_ports_9_getCredits
wire  EN_send_ports_9_getCredits;
wire [1 : 0] send_ports_9_getCredits;

// action method send_ports_10_putFlit
wire  [70 : 0] send_ports_10_putFlit_flit_in;
wire  EN_send_ports_10_putFlit;

// actionvalue method send_ports_10_getCredits
wire  EN_send_ports_10_getCredits;
wire [1 : 0] send_ports_10_getCredits;

// action method send_ports_11_putFlit
wire  [70 : 0] send_ports_11_putFlit_flit_in;
wire  EN_send_ports_11_putFlit;

// actionvalue method send_ports_11_getCredits
wire  EN_send_ports_11_getCredits;
wire [1 : 0] send_ports_11_getCredits;

// action method send_ports_12_putFlit
wire  [70 : 0] send_ports_12_putFlit_flit_in;
wire  EN_send_ports_12_putFlit;

// actionvalue method send_ports_12_getCredits
wire  EN_send_ports_12_getCredits;
wire [1 : 0] send_ports_12_getCredits;

// action method send_ports_13_putFlit
wire  [70 : 0] send_ports_13_putFlit_flit_in;
wire  EN_send_ports_13_putFlit;

// actionvalue method send_ports_13_getCredits
wire  EN_send_ports_13_getCredits;
wire [1 : 0] send_ports_13_getCredits;

// action method send_ports_14_putFlit
wire  [70 : 0] send_ports_14_putFlit_flit_in;
wire  EN_send_ports_14_putFlit;

// actionvalue method send_ports_14_getCredits
wire  EN_send_ports_14_getCredits;
wire [1 : 0] send_ports_14_getCredits;

// action method send_ports_15_putFlit
wire  [70 : 0] send_ports_15_putFlit_flit_in;
wire  EN_send_ports_15_putFlit;

// actionvalue method send_ports_15_getCredits
wire  EN_send_ports_15_getCredits;
wire [1 : 0] send_ports_15_getCredits;

// actionvalue method recv_ports_0_getFlit
wire  EN_recv_ports_0_getFlit;
wire [70 : 0] recv_ports_0_getFlit;

// action method recv_ports_0_putCredits
wire  [1 : 0] recv_ports_0_putCredits_cr_in;
wire  EN_recv_ports_0_putCredits;

// actionvalue method recv_ports_1_getFlit
wire  EN_recv_ports_1_getFlit;
wire [70 : 0] recv_ports_1_getFlit;

// action method recv_ports_1_putCredits
wire  [1 : 0] recv_ports_1_putCredits_cr_in;
wire  EN_recv_ports_1_putCredits;

// actionvalue method recv_ports_2_getFlit
wire  EN_recv_ports_2_getFlit;
wire [70 : 0] recv_ports_2_getFlit;

// action method recv_ports_2_putCredits
wire  [1 : 0] recv_ports_2_putCredits_cr_in;
wire  EN_recv_ports_2_putCredits;

// actionvalue method recv_ports_3_getFlit
wire  EN_recv_ports_3_getFlit;
wire [70 : 0] recv_ports_3_getFlit;

// action method recv_ports_3_putCredits
wire  [1 : 0] recv_ports_3_putCredits_cr_in;
wire  EN_recv_ports_3_putCredits;

// actionvalue method recv_ports_4_getFlit
wire  EN_recv_ports_4_getFlit;
wire [70 : 0] recv_ports_4_getFlit;

// action method recv_ports_4_putCredits
wire  [1 : 0] recv_ports_4_putCredits_cr_in;
wire  EN_recv_ports_4_putCredits;

// actionvalue method recv_ports_5_getFlit
wire  EN_recv_ports_5_getFlit;
wire [70 : 0] recv_ports_5_getFlit;

// action method recv_ports_5_putCredits
wire  [1 : 0] recv_ports_5_putCredits_cr_in;
wire  EN_recv_ports_5_putCredits;

// actionvalue method recv_ports_6_getFlit
wire  EN_recv_ports_6_getFlit;
wire [70 : 0] recv_ports_6_getFlit;

// action method recv_ports_6_putCredits
wire  [1 : 0] recv_ports_6_putCredits_cr_in;
wire  EN_recv_ports_6_putCredits;

// actionvalue method recv_ports_7_getFlit
wire  EN_recv_ports_7_getFlit;
wire [70 : 0] recv_ports_7_getFlit;

// action method recv_ports_7_putCredits
wire  [1 : 0] recv_ports_7_putCredits_cr_in;
wire  EN_recv_ports_7_putCredits;

// actionvalue method recv_ports_8_getFlit
wire  EN_recv_ports_8_getFlit;
wire [70 : 0] recv_ports_8_getFlit;

// action method recv_ports_8_putCredits
wire  [1 : 0] recv_ports_8_putCredits_cr_in;
wire  EN_recv_ports_8_putCredits;

// actionvalue method recv_ports_9_getFlit
wire  EN_recv_ports_9_getFlit;
wire [70 : 0] recv_ports_9_getFlit;

// action method recv_ports_9_putCredits
wire  [1 : 0] recv_ports_9_putCredits_cr_in;
wire  EN_recv_ports_9_putCredits;

// actionvalue method recv_ports_10_getFlit
wire  EN_recv_ports_10_getFlit;
wire [70 : 0] recv_ports_10_getFlit;

// action method recv_ports_10_putCredits
wire  [1 : 0] recv_ports_10_putCredits_cr_in;
wire  EN_recv_ports_10_putCredits;

// actionvalue method recv_ports_11_getFlit
wire  EN_recv_ports_11_getFlit;
wire [70 : 0] recv_ports_11_getFlit;

// action method recv_ports_11_putCredits
wire  [1 : 0] recv_ports_11_putCredits_cr_in;
wire  EN_recv_ports_11_putCredits;

// actionvalue method recv_ports_12_getFlit
wire  EN_recv_ports_12_getFlit;
wire [70 : 0] recv_ports_12_getFlit;

// action method recv_ports_12_putCredits
wire  [1 : 0] recv_ports_12_putCredits_cr_in;
wire  EN_recv_ports_12_putCredits;

// actionvalue method recv_ports_13_getFlit
wire  EN_recv_ports_13_getFlit;
wire [70 : 0] recv_ports_13_getFlit;

// action method recv_ports_13_putCredits
wire  [1 : 0] recv_ports_13_putCredits_cr_in;
wire  EN_recv_ports_13_putCredits;

// actionvalue method recv_ports_14_getFlit
wire  EN_recv_ports_14_getFlit;
wire [70 : 0] recv_ports_14_getFlit;

// action method recv_ports_14_putCredits
wire  [1 : 0] recv_ports_14_putCredits_cr_in;
wire  EN_recv_ports_14_putCredits;

// actionvalue method recv_ports_15_getFlit
wire  EN_recv_ports_15_getFlit;
wire [70 : 0] recv_ports_15_getFlit;

// action method recv_ports_15_putCredits
wire  [1 : 0] recv_ports_15_putCredits_cr_in;
wire  EN_recv_ports_15_putCredits;

// value method recv_ports_info_0_getRecvPortID
wire [3 : 0] recv_ports_info_0_getRecvPortID;

// value method recv_ports_info_1_getRecvPortID
wire [3 : 0] recv_ports_info_1_getRecvPortID;

// value method recv_ports_info_2_getRecvPortID
wire [3 : 0] recv_ports_info_2_getRecvPortID;

// value method recv_ports_info_3_getRecvPortID
wire [3 : 0] recv_ports_info_3_getRecvPortID;

// value method recv_ports_info_4_getRecvPortID
wire [3 : 0] recv_ports_info_4_getRecvPortID;

// value method recv_ports_info_5_getRecvPortID
wire [3 : 0] recv_ports_info_5_getRecvPortID;

// value method recv_ports_info_6_getRecvPortID
wire [3 : 0] recv_ports_info_6_getRecvPortID;

// value method recv_ports_info_7_getRecvPortID
wire [3 : 0] recv_ports_info_7_getRecvPortID;

// value method recv_ports_info_8_getRecvPortID
wire [3 : 0] recv_ports_info_8_getRecvPortID;

// value method recv_ports_info_9_getRecvPortID
wire [3 : 0] recv_ports_info_9_getRecvPortID;

// value method recv_ports_info_10_getRecvPortID
wire [3 : 0] recv_ports_info_10_getRecvPortID;

// value method recv_ports_info_11_getRecvPortID
wire [3 : 0] recv_ports_info_11_getRecvPortID;

// value method recv_ports_info_12_getRecvPortID
wire [3 : 0] recv_ports_info_12_getRecvPortID;

// value method recv_ports_info_13_getRecvPortID
wire [3 : 0] recv_ports_info_13_getRecvPortID;

// value method recv_ports_info_14_getRecvPortID
wire [3 : 0] recv_ports_info_14_getRecvPortID;

// value method recv_ports_info_15_getRecvPortID
wire [3 : 0] recv_ports_info_15_getRecvPortID;


mkNetwork i_mkNetwork(
    .CLK(CLK),
    .RST_N(RST_N),

    .send_ports_0_putFlit_flit_in(flit), // port 0 is input arb
    .EN_send_ports_0_putFlit(flit[flit_port_width-1]), // valid bit

    .EN_send_ports_0_getCredits(arb_rdy_get_credit),
    .send_ports_0_getCredits(arb_get_credit),

    .send_ports_1_putFlit_flit_in(flit_out_mapper0), // port 1 is mapper0
    .EN_send_ports_1_putFlit(flit_out_mapper0[flit_port_width-1]),

    .EN_send_ports_1_getCredits(mapper0_rdy_get_credit),
    .send_ports_1_getCredits(mapper0_get_credit),

    .send_ports_2_putFlit_flit_in(1'b0),
    .EN_send_ports_2_putFlit(1'b0),

    .EN_send_ports_2_getCredits(1'b0),
    .send_ports_2_getCredits(1'b0),

    .send_ports_3_putFlit_flit_in(1'b0),
    .EN_send_ports_3_putFlit(1'b0),

    .EN_send_ports_3_getCredits(1'b0),
    .send_ports_3_getCredits(1'b0),

    .send_ports_4_putFlit_flit_in(1'b0),
    .EN_send_ports_4_putFlit(1'b0),

    .EN_send_ports_4_getCredits(1'b0),
    .send_ports_4_getCredits(1'b0),

    .send_ports_5_putFlit_flit_in(1'b0),
    .EN_send_ports_5_putFlit(1'b0),

    .EN_send_ports_5_getCredits(1'b0),
    .send_ports_5_getCredits(1'b0),

    .send_ports_6_putFlit_flit_in(1'b0),
    .EN_send_ports_6_putFlit(1'b0),

    .EN_send_ports_6_getCredits(1'b0),
    .send_ports_6_getCredits(1'b0),

    .send_ports_7_putFlit_flit_in(1'b0),
    .EN_send_ports_7_putFlit(1'b0),

    .EN_send_ports_7_getCredits(1'b0),
    .send_ports_7_getCredits(1'b0),

    .send_ports_8_putFlit_flit_in(1'b0),
    .EN_send_ports_8_putFlit(1'b0),

    .EN_send_ports_8_getCredits(1'b0),
    .send_ports_8_getCredits(1'b0),

    .send_ports_9_putFlit_flit_in(1'b0),
    .EN_send_ports_9_putFlit(1'b0),

    .EN_send_ports_9_getCredits(1'b0),
    .send_ports_9_getCredits(1'b0),

    .send_ports_10_putFlit_flit_in(1'b0),
    .EN_send_ports_10_putFlit(1'b0),

    .EN_send_ports_10_getCredits(1'b0),
    .send_ports_10_getCredits(1'b0),

    .send_ports_11_putFlit_flit_in(1'b0),
    .EN_send_ports_11_putFlit(1'b0),

    .EN_send_ports_11_getCredits(1'b0),
    .send_ports_11_getCredits(1'b0),

    .send_ports_12_putFlit_flit_in(1'b0),
    .EN_send_ports_12_putFlit(1'b0),

    .EN_send_ports_12_getCredits(1'b0),
    .send_ports_12_getCredits(1'b0),

    .send_ports_13_putFlit_flit_in(1'b0),
    .EN_send_ports_13_putFlit(1'b0),

    .EN_send_ports_13_getCredits(1'b0),
    .send_ports_13_getCredits(1'b0),

    .send_ports_14_putFlit_flit_in(1'b0),
    .EN_send_ports_14_putFlit(1'b0),

    .EN_send_ports_14_getCredits(1'b0),
    .send_ports_14_getCredits(1'b0),

    .send_ports_15_putFlit_flit_in(1'b0),
    .EN_send_ports_15_putFlit(1'b0),

    .EN_send_ports_15_getCredits(1'b0),
    .send_ports_15_getCredits(1'b0),

    .EN_recv_ports_0_getFlit(1'b0),
    .recv_ports_0_getFlit(1'b0),

    .recv_ports_0_putCredits_cr_in(1'b0),
    .EN_recv_ports_0_putCredits(1'b0),

//    .EN_recv_ports_1_getFlit(flit_in_mapper0[flit_port_width-1]),
    .EN_recv_ports_1_getFlit(1'b1), // port 1 is mapper0
    .recv_ports_1_getFlit(flit_in_mapper0),

    .recv_ports_1_putCredits_cr_in(mapper0_put_credit),
    .EN_recv_ports_1_putCredits(en_mapper0_put_credit),

    .EN_recv_ports_2_getFlit(1'b0),
    .recv_ports_2_getFlit(1'b0),

    .recv_ports_2_putCredits_cr_in(1'b0),
    .EN_recv_ports_2_putCredits(1'b0),

    .EN_recv_ports_3_getFlit(1'b0),
    .recv_ports_3_getFlit(1'b0),

    .recv_ports_3_putCredits_cr_in(1'b0),
    .EN_recv_ports_3_putCredits(1'b0),

    .EN_recv_ports_4_getFlit(1'b0),
    .recv_ports_4_getFlit(1'b0),

    .recv_ports_4_putCredits_cr_in(1'b0),
    .EN_recv_ports_4_putCredits(1'b0),

    .EN_recv_ports_5_getFlit(1'b1), // port 5 is reducer
    .recv_ports_5_getFlit(flit_in_reducer),

    .recv_ports_5_putCredits_cr_in(reducer_put_credit),
    .EN_recv_ports_5_putCredits(en_reducer_put_credit),

    .EN_recv_ports_6_getFlit(1'b0),
    .recv_ports_6_getFlit(1'b0),

    .recv_ports_6_putCredits_cr_in(1'b0),
    .EN_recv_ports_6_putCredits(1'b0),

    .EN_recv_ports_7_getFlit(1'b0),
    .recv_ports_7_getFlit(1'b0),

    .recv_ports_7_putCredits_cr_in(1'b0),
    .EN_recv_ports_7_putCredits(1'b0),

    .EN_recv_ports_8_getFlit(1'b0),
    .recv_ports_8_getFlit(1'b0),

    .recv_ports_8_putCredits_cr_in(1'b0),
    .EN_recv_ports_8_putCredits(1'b0),

    .EN_recv_ports_9_getFlit(1'b0),
    .recv_ports_9_getFlit(1'b0),

    .recv_ports_9_putCredits_cr_in(1'b0),
    .EN_recv_ports_9_putCredits(1'b0),

    .EN_recv_ports_10_getFlit(1'b0),
    .recv_ports_10_getFlit(1'b0),

    .recv_ports_10_putCredits_cr_in(1'b0),
    .EN_recv_ports_10_putCredits(1'b0),

    .EN_recv_ports_11_getFlit(1'b0),
    .recv_ports_11_getFlit(1'b0),

    .recv_ports_11_putCredits_cr_in(1'b0),
    .EN_recv_ports_11_putCredits(1'b0),

    .EN_recv_ports_12_getFlit(1'b0),
    .recv_ports_12_getFlit(1'b0),

    .recv_ports_12_putCredits_cr_in(1'b0),
    .EN_recv_ports_12_putCredits(1'b0),

    .EN_recv_ports_13_getFlit(1'b0),
    .recv_ports_13_getFlit(1'b0),

    .recv_ports_13_putCredits_cr_in(1'b0),
    .EN_recv_ports_13_putCredits(1'b0),

    .EN_recv_ports_14_getFlit(1'b0),
    .recv_ports_14_getFlit(1'b0),

    .recv_ports_14_putCredits_cr_in(1'b0),
    .EN_recv_ports_14_putCredits(1'b0),

    .EN_recv_ports_15_getFlit(1'b0),
    .recv_ports_15_getFlit(1'b0),

    .recv_ports_15_putCredits_cr_in(1'b0),
    .EN_recv_ports_15_putCredits(1'b0),

    .recv_ports_info_0_getRecvPortID(1'b0),

    .recv_ports_info_1_getRecvPortID(1'b0),

    .recv_ports_info_2_getRecvPortID(1'b0),

    .recv_ports_info_3_getRecvPortID(1'b0),

    .recv_ports_info_4_getRecvPortID(1'b0),

    .recv_ports_info_5_getRecvPortID(1'b0),

    .recv_ports_info_6_getRecvPortID(1'b0),

    .recv_ports_info_7_getRecvPortID(1'b0),

    .recv_ports_info_8_getRecvPortID(1'b0),

    .recv_ports_info_9_getRecvPortID(1'b0),

    .recv_ports_info_10_getRecvPortID(1'b0),

    .recv_ports_info_11_getRecvPortID(1'b0),

    .recv_ports_info_12_getRecvPortID(1'b0),

    .recv_ports_info_13_getRecvPortID(1'b0),

    .recv_ports_info_14_getRecvPortID(1'b0),

    .recv_ports_info_15_getRecvPortID(1'b0)
);

ram_sp_sr_sw i_ram_sp_sr_sw (
    .clk(CLK), // Clock Input
    .address(address), // Address Input
    .data_in(), // Data bi-directional
    .data_out(data), // Data bi-directional
    .tail_out(tail), // Data bi-directional
    .cs(1'b1), // Chip Select
    .we(1'b0), // Write Enable/Read Enable
    .oe(1'b1) // Output Enable
);

noc_input_controller i_noc_input_controller (
    .data_in(data),
    .tail_in(tail),
    .address(address),
    .CLK(CLK),
    .RST_N(RST_N),
    .en_get_credit(arb_rdy_get_credit),
    .get_credit(arb_get_credit),
    .flit_out(flit)
);

MapReduceMapper_unq1 i_MapReduceMapper_unq1_1 (
    .enable(flit_in_mapper0[flit_port_width-1]),
    .task_id(), // not used
    .key("                                the     "), // word to be counted, # chars must be equal to hex digits of word in mapper module
    .value(flit_in_mapper0[`DATA_WIDTH-1:0]),
    .clk(CLK), // clk
    .rstn(RST_N), // global active low reset
    .put_credits_mapper(mapper0_put_credit),
    .en_put_credits_mapper(en_mapper0_put_credit),
    .get_credit(mapper0_get_credit),
    .en_get_credit(mapper0_rdy_get_credit),
    .clear(), //
    .tail(flit_in_mapper0[flit_port_width-2]),
    .finish(), // end of mapping step
    .read_request(), // not used
    .write_request(), // not used
    .int_key(key_out_mapper0), // not used
    .int_value(value_out_mapper0), // result, goes to reducer
    .read_addr(), // not used
    .write_addr(), // not used, tied to task_id
    .flit_out_mapper(flit_out_mapper0) // flit: mapper out, reducer in
);
 
//MapReduceMapper_unq1 i_MapReduceMapper_unq1_2 (
//	.enable(flit_in_mapper1[flit_port_width-1]),
//    .reset_n(RST_N), // global active low reset
//	.task_id(3'b101), // reducer address (5)
//	.key(data_words), // word to be counted
//	.flit_value(flit_in_mapper1[`DATA_WIDTH-1:0]),
//    .tail(flit_in_mapper1[flit_port_width-2]),
//    .finish(), // end of mapping step
//	.read_request(), // not used
//	.write_request(), // not used
//	.int_key(), // not used
//	.int_flit_value() // result, goes to reducer
//	.read_addr(), // not used
//	.write_addr() // not used, tied to task_id
//);
// 
//MapReduceMapper_unq1 i_MapReduceMapper_unq1_3 (
//	.enable(flit_in_mapper2[flit_port_width-1]),
//    .reset_n(RST_N), // global active low reset
//	.task_id(3'b101), // reducer address (5)
//	.key(data_words), // word to be counted
//	.flit_value(flit_in_mapper2[`DATA_WIDTH-1:0]),
//    .tail(flit_in_mapper2[flit_port_width-2]),
//    .finish(), // end of mapping step
//	.read_request(), // not used
//	.write_request(), // not used
//	.int_key(), // not used
//	.int_flit_value() // result, goes to reducer
//	.read_addr(), // not used
//	.write_addr() // not used, tied to task_id
//);
//
//MapReduceMapper_unq1 i_MapReduceMapper_unq1_4 (
//	.enable(flit_in_mapper3[flit_port_width-1]),
//    .reset_n(RST_N), // global active low reset
//	.task_id(3'b101), // reducer address (5)
//	.key(data_words), // word to be counted
//	.flit_value(flit_in_mapper3[`DATA_WIDTH-1:0]),
//    .tail(flit_in_mapper3[flit_port_width-2]),
//    .finish(), // end of mapping step
//	.read_request(), // not used
//	.write_request(), // not used
//	.int_key(), // not used
//	.int_flit_value() // result, goes to reducer
//	.read_addr(), // not used
//	.write_addr() // not used, tied to task_id
//);
 
MapReduceReducer_unq1 i_MapReduceReducer_unq1(
	.enable(flit_in_reducer[flit_port_width-1]), // valid bit from mapper flit
	.task_id(), // the incoming mapper number
	.int_key(), // the word you are searching for
	.search_key("                                the     "), // key you are searching for
	.int_value(flit_in_reducer[0]), // number of times the word is found given by mapper
    .put_credits_reducer(reducer_put_credit),
    .en_put_credits_reducer(en_reducer_put_credit),
	.clk(CLK),
	.rstn(RST_N),
	.finish(), // not used
	.read_request(), // not used
	.write_request(), // not used
	.result(result_output), // the word count for the search key
	.read_addr(), // not used
	.write_addr() // not used
);
 
endmodule // top_level
 
