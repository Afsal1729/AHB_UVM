`include "s_seq_item.sv"
class slave_sequence extends uvm_sequence #(s_trans_item);
  `uvm_object_utils(slave_sequence)
parameter SINGLE=0;
s_trans_item trx;
  function new(string name="slave_sequence");
	super.new(name);
endfunction : new
virtual task body(); 
 // repeat(10)
     begin
    trx=s_trans_item::type_id::create("trx");
      start_item(trx);
       trx.randomize() with {HREADY==1; HRDATA==45;};
    finish_item(trx);
    end
endtask
endclass
/*

class write_sequence extends master_sequence;
`uvm_object_utils(write_sequence)

parameter SINGLE=0;
m_trans_item trx;
function new(string name = "write_sequence");
    super.new(name);
  endfunction
  
  virtual task body(); 
    repeat(20) begin
    trx=m_trans_item::type_id::create("trx");
      start_item(trx);
     trx.randomize() with {trx.HBURST=SINGLE; trx.HADDR=32'h100; trx.HWDATA=32'h45;trx.HWRITE=1;}
    finish_item(trx);
    end
  endtask*/
  
//endclass
