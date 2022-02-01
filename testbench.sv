import uvm_pkg::*;
`include "uvm_macros.svh"
//import uvm_pkg::*;
`include "Interface.sv"
`include "ahb_test.sv"



module top;
bit clk;

initial
 forever
  #10 clk = ~clk;

ahb_intf ahb_if(clk);

initial 
begin
  uvm_config_db #(virtual ahb_intf)::set(null,"*","vif",ahb_if);

	run_test("ahb_test");
  

end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule