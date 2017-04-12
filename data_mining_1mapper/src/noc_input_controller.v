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
    get_credit,
    en_get_credit
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
reg [`NUM_MAPPERS-1:0] mapper_free;
input [flit_port_width-1:0] flit_in;
output reg [flit_port_width-1:0] flit_out;
output reg [`ADDR_WIDTH-1:0] address;
reg [`DATA_WIDTH-1:0] data_out;
output en_get_credit;
input [vc_bits:0] get_credit; // [vc_bits-1+1:0]
reg [dest_bits-1:0] dest; // destination port number
reg tail_internal; // if 1, flit is end of package
reg valid;
reg [vc_bits-1:0] vc;
reg [2:0] num_credits;

reg [`DATA_WIDTH-1:0] data_internal;

assign en_get_credit = 1'b1;
assign vc = 'b0;
//assign valid = 1'b1;
assign mapper_free = 'b0001;
wire [flit_port_width-1:0] flit_out_internal;


always@(posedge CLK) begin
  if (~RST_N) begin
    valid <= 1'b0;
    data_internal <= 'b0;
    tail_internal <= 1'b0;
    dest <= `MAPPER0_PORT;
    address <= 'b0;
    num_credits <= 3'b111;
  end
  else begin
    //$display("data: %h", data_in);
    valid <= 1'b1;
    data_internal <= data_in;
    tail_internal <= tail_in;
    address <= address+'b1;
    flit_out <= {valid, tail_internal, dest, vc, data_internal};
    if (get_credit[vc_bits])
    begin
        //num_credits <= num_credits; // subtract 1 and add 1, so leave alone.
    end
    else
    begin
        num_credits <= num_credits-1;
    end

    //flit_out <= flit_out_internal;
    casez (mapper_free)
      4'b???1 : dest <= `MAPPER0_PORT;
      4'b??1? : dest <= `MAPPER1_PORT;
      4'b?1?? : dest <= `MAPPER2_PORT;
      4'b1??? : dest <= `MAPPER3_PORT;
      default : dest <= `MAPPER0_PORT;
    endcase
  end
end

endmodule // noc_input_controller

