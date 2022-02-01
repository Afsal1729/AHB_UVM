//`include "ahb_env.sv"
`include "s_sequence.sv"
`include "m_sequence.sv"
`include "ahb_env.sv"
class ahb_test extends uvm_test;
`uvm_component_utils(ahb_test)

env env1;
slave_sequence sseq;
master_sequence mseq;




function new(string name="ahb_test",uvm_component parent=null);
super.new(name,parent);
endfunction 


function void build_phase(uvm_phase phase);
   super.build_phase(phase);
  env1 = env::type_id::create("env1",this);
  sseq = slave_sequence::type_id::create("sseq");
  mseq = master_sequence::type_id::create("mseq");
  
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this,"starting virtual sequence");
	`uvm_info("AHB_VSEQ","Starting the test",UVM_MEDIUM);
  

	  mseq.start(env1.m_agent.m_sqr);
  	sseq.start(env1.s_agent.s_sqr);

	#5000;
	phase.drop_objection(this,"ending virtual sequence");
endtask
endclass 






