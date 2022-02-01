//`include "s_seq_item.sv"
class slave_driver extends uvm_driver#(s_trans_item) ;
  `uvm_component_utils(slave_driver);

s_trans_item trx;
 virtual ahb_intf vif;

  function new(string name="slave_driver",uvm_component parent=null);
super.new(name,parent);
endfunction 

 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
   if(!uvm_config_db #( virtual ahb_intf)::get(this,"","vif",vif))
	 `uvm_fatal("VIF NOT SET",{"Configuration must be set for : " ,get_full_name(),".VIF"});
  // trx=s_trans_item::type_id::create("trx");
endfunction 
 

 function void end_of_elaboration_phase(uvm_phase phase);
   `uvm_info("AHB_SLAVE_DRIVER",{get_full_name()," Created.."},UVM_MEDIUM);
endfunction 

 task run_phase(uvm_phase phase);
 	forever
	begin
    seq_item_port.get_next_item(trx);
	drive();
      $display(" Data read =%d",trx.HRDATA);
      seq_item_port.item_done(trx);
	end
      //phase.raise_objection(this,"ending driver");
endtask : run_phase
 
 task drive();
   @(posedge vif.HCLK)
   begin
 //vif.sdrv_cb.HREADY<=1'b1;
$display("HWRITE_SLAVE DRIVER=%b", vif.HWRITE);
     if( !vif.sdrv_cb.HWRITE)
       begin
     $display("slave Driver:   HREADY_TRX=%b, HREADY_vif=%b at %t" ,trx.HREADY,vif.HREADY,$time);       
 vif.sdrv_cb.HRDATA<=trx.HRDATA;
 vif.sdrv_cb.HRESP<=1'b0;
 end
else
 vif.sdrv_cb.HREADY<=1'b1;
   end
 endtask

endclass 








