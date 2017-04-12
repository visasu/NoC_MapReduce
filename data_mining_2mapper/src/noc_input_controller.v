// control the data from the sram to the NoC
// need something to determine which mapper the flits are sent to
// as well as the tail logic
//

`ifdef NOC_INPUT_CONTROLLER
`else
`define NOC_INPUT_CONTROLLER
`endif

`include "custom_params.v"

module noc_input_controller (
    data_in,
    address,
    flit_in,//mapper_free,
    tail_in,
    CLK,
    RST_N,
    flit_out,
    //data_out,
    get_credit_mapper0,
    en_get_credit_mapper0,
    get_credit_mapper1,
    en_get_credit_mapper1
    //dest,
    //tail
);

localparam dest_bits = $clog2(`NUM_USER_RECV_PORTS);
localparam vc_bits = (`NUM_VCS > 1) ? $clog2(`NUM_VCS) : 1;
localparam flit_port_width = 2 /*valid and tail bits*/+ `FLIT_DATA_WIDTH + dest_bits + vc_bits;

//localparam num_mappers = 4;

input [`DATA_WIDTH-1:0] data_in;
input                   tail_in;
input CLK;
input RST_N;
reg [1:0] mapper_free;
input [flit_port_width-1:0] flit_in;
output reg [flit_port_width-1:0] flit_out;
output reg [`ADDR_WIDTH-1:0] address;
reg [`DATA_WIDTH-1:0] data_out;

output en_get_credit_mapper0;
input [vc_bits:0] get_credit_mapper0; // [vc_bits-1+1:0]
reg [2:0] num_credits_mapper0;

output en_get_credit_mapper1;
input [vc_bits:0] get_credit_mapper1; // [vc_bits-1+1:0]
reg [2:0] num_credits_mapper1;

//output en_get_credit_mapper2;
//input [vc_bits:0] get_credit_mapper2; // [vc_bits-1+1:0]
//reg [2:0] num_credits_mapper2;

//output en_get_credit_mapper3;
//input [vc_bits:0] get_credit_mapper3; // [vc_bits-1+1:0]
//reg [2:0] num_credits_mapper3;

reg [dest_bits-1:0] dest; // destination port number
reg tail_internal; // if 1, flit is end of package
reg valid;
reg [vc_bits-1:0] vc;

reg [`DATA_WIDTH-1:0] data_internal;

assign en_get_credit_mapper0 = 1'b1;
assign en_get_credit_mapper1 = 1'b1;
assign vc = 'b0;
//assign valid = 1'b1;
//assign mapper_free = 'b0001;
wire [flit_port_width-1:0] flit_out_internal;


always@(posedge CLK) begin
  if (~RST_N) begin
    valid <= 1'b0;
    data_internal <= 'b0;
    tail_internal <= 1'b0;
    dest <= `MAPPER0_PORT;
    address <= 'b0;
    num_credits_mapper0 <= 3'b111;
    num_credits_mapper1 <= 3'b111;
    //num_credits_mapper2 <= 3'b111;
    //num_credits_mapper3 <= 3'b111;
    mapper_free <= 2'b00;
  end
  else begin
    //$display("data: %h", data_in);
    valid <= 1'b1;
    data_internal <= data_in;
    tail_internal <= tail_in;
    address <= address+'b1;
    if (get_credit_mapper0[vc_bits])
        num_credits_mapper0 <= num_credits_mapper0+1; // getting a credit from mapper
    if (get_credit_mapper1[vc_bits])
        num_credits_mapper1 <= num_credits_mapper1+1; // getting a credit from mapper
//    if (get_credit_mapper2[vc_bits])
//        num_credits_mapper2 <= num_credits_mapper2+1; // getting a credit from mapper
//    if (get_credit_mapper3[vc_bits])
//        num_credits_mapper3 <= num_credits_mapper3+1; // getting a credit from mapper

    if ((dest == `MAPPER0_PORT) && (num_credits_mapper0 > 0))
    begin
        num_credits_mapper0 <= num_credits_mapper0-1;
        flit_out <= {valid, tail_internal, dest, vc, data_internal};
    end
    if ((dest == `MAPPER1_PORT) && (num_credits_mapper1 > 0))
    begin
        num_credits_mapper1 <= num_credits_mapper1-1;
        flit_out <= {valid, tail_internal, dest, vc, data_internal};
    end
//    if ((dest == `MAPPER2_PORT) && (num_credits_mapper2 > 0))
//    begin    
//        num_credits_mapper2 <= num_credits_mapper2-1;
//        flit_out <= {valid, tail_internal, dest, vc, data_internal};
//    end
//    if ((dest == `MAPPER3_PORT) && (num_credits_mapper3 > 0))
//    begin    
//        num_credits_mapper3 <= num_credits_mapper3-1;
//        flit_out <= {valid, tail_internal, dest, vc, data_internal};
//    end

    //flit_out <= flit_out_internal;
    if (tail_internal == 1)
    begin
        mapper_free = mapper_free + 1; // time multiplex the mappers
    end
    casez (mapper_free)
      2'b00 : dest <= `MAPPER0_PORT;
      2'b01 : dest <= `MAPPER1_PORT;
      2'b10 : dest <= `MAPPER0_PORT;
      2'b11 : dest <= `MAPPER1_PORT;
      default : dest <= `MAPPER0_PORT;
    endcase
  end
end

endmodule // noc_input_controller

