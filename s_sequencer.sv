
class slave_sequencer extends uvm_sequencer#(s_trans_item);
  `uvm_component_utils(slave_sequencer);

  function new(string name="slave_sequencer",uvm_component parent=null);
super.new(name,parent);
endfunction : new

endclass 

