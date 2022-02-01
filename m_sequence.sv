//`include "m_seq_item.sv"
typedef m_trans_item; 
class master_sequence extends uvm_sequence #(m_trans_item);
`uvm_object_utils(master_sequence)
parameter SINGLE=0;
m_trans_item trx;
  
  
function new(string name="master_sequence");
	super.new(name);
endfunction 
  
  
virtual task body(); 
  repeat(5)
     begin
    trx=m_trans_item::type_id::create("trx");
      start_item(trx);
       trx.randomize() with {trx.HBURST==0;trx.HWRITE==0;};
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
