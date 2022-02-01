
class master_sequencer extends uvm_sequencer#(m_trans_item);
`uvm_component_utils(master_sequencer);

function new(string name="master_sequencer",uvm_component parent=null);
super.new(name,parent);
endfunction : new

endclass 

