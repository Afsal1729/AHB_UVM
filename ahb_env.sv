`include "m_agent.sv"
`include "s_agent.sv"
//`include "scoreboard.sv"
class env extends uvm_env;
`uvm_component_utils(env);

 master_agent m_agent;
 slave_agent s_agent;
//scoreboard scb;
function new(string name="a_env",uvm_component parent=null);
	super.new(name,parent);
endfunction 


function void build_phase(uvm_phase phase);
super.build_phase(phase);
  s_agent =  slave_agent::type_id::create("s_agent",this);
  m_agent =  master_agent::type_id::create("m_agent",this);
//scb =  scoreboard::type_id::create("scb",this);
endfunction
  /*
function void connect_phase(uvm_phase phase);
m_agent.m_mon.monitor_port.connect(scb.master_export);
endfunction*/
endclass

