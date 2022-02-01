`include "s_driver.sv"
`include "s_sequencer.sv"
//`include "m_se.sv"
class slave_agent extends uvm_agent;
  `uvm_component_utils(slave_agent);



 slave_driver s_drv;
 //slave_monitor s_mon;
 slave_sequencer s_sqr;



  function new(string name="slave_agent",uvm_component parent=null);
super.new(name,parent);
endfunction 


function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  s_drv = slave_driver::type_id::create("s_drv",this);
  s_sqr = slave_sequencer::type_id::create("s_sqr",this);
  //ahb_slave_mon = //ahb_slave_monitor::type_id::create("ahb_slave_mon",this);
endfunction

function void connect_phase(uvm_phase phase);
  s_drv.seq_item_port.connect(s_sqr.seq_item_export);
	
endfunction
endclass






