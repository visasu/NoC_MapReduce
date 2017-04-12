//-----------------------------------------------------
// Design Name : ram_sp_sr_sw
// File Name   : ram_sp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------

`ifdef SRAM_V
`else
`define SRAM_V
`endif

`include "custom_params.v"

module ram_sp_sr_sw (
    clk         , // Clock Input
    address     , // Address Input
    data_in     , // Data Input
    data_out    , // Data Output
    tail_out    , // Tail Output
    cs          , // Chip Select
    we          , // Write Enable/Read Enable
    oe            // Output Enable
); 

//parameter DATA_WIDTH = 8 ; // this is now assigned in custom_params.v
//parameter ADDR_WIDTH = 8 ; // this is now assigned in custom_params.v
parameter RAM_DEPTH = 1 << `ADDR_WIDTH; // RAM_DEPTH = 2^addr_width

//--------------Input Ports----------------------- 
input                   clk;
input [`ADDR_WIDTH-1:0] address;
input                   cs;
input                   we;
input                   oe;
input [`DATA_WIDTH-1:0] data_in;

//--------------Output Ports----------------------- 
output reg [`DATA_WIDTH-1:0] data_out;
output reg tail_out;

//--------------Internal variables---------------- 
reg [`DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
reg [0:0]       mem_tails [0:RAM_DEPTH-1];
reg                   oe_r;

//--------------Code Starts Here------------------ 
int i;

initial begin
    $readmemh("input.hex", mem);
    $readmemb("input.tails", mem_tails);
    //for (i=0;i<=RAM_DEPTH-1;i=i+1) begin
    //    $display("mem[%d] is: %h", i, mem[i]);
    //end
end


// Tri-State Buffer control
// output : When we = 0, oe = 1, cs = 1
//assign data = (cs && oe &&  ! we) ? data_out_internal : 8'bz;

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we ) begin
       mem[address] = data_in;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (posedge clk)
begin : MEM_READ
  if (cs &&  ! we && oe) begin
    data_out = mem[address];
    tail_out = mem_tails[address];
    oe_r = 1;
  end else begin
    oe_r = 0;
  end
end

endmodule // End of Module ram_sp_sr_sw
