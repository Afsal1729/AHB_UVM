`include "m_seq_item.sv"
class master_driver extends uvm_driver#(m_trans_item) ;
`uvm_component_utils(master_driver);

m_trans_item trx;
 virtual ahb_intf vif;

function new(string name="master_driver",uvm_component parent=null);
super.new(name,parent);
endfunction 

 function void build_phase(uvm_phase phase);
 super.build_phase(phase);
	if(!uvm_config_db #( virtual ahb_intf)::get(this,"","vif",vif))
	 `uvm_fatal("VIF NOT SET",{"Configuration must be set for : " ,get_full_name(),".VIF"});
  // trx=m_trans_item::type_id::create("trx");
endfunction 
 

 function void end_of_elaboration_phase(uvm_phase phase);
 `uvm_info("AHB_MASTER_DRIVER",{get_full_name()," Created.."},UVM_MEDIUM);
endfunction 

 task run_phase(uvm_phase phase);
 	forever
	begin
    seq_item_port.get_next_item(trx);
	drive();
      $display("address size=%d",trx.HADDR.size);
      seq_item_port.item_done(trx);
	end
      //phase.raise_objection(this,"ending driver");
endtask : run_phase
 
 task drive();
   
  //@(posedge vif.HCLK)
   
      
     // trx.HREADY<=vif.mdrv_cb.HREADY;
         //trx.HRESP<=vif.mdrv_cb.HRESP;
         //trx.HRDATA<=vif.mdrv_cb.HRDATA;
     $display("hready_driver=%b",vif.HREADY);
   @(posedge vif.HCLK)
 vif.mdrv_cb.HWRITE<=trx.HWRITE;
   if(trx.HWRITE && vif.HREADY)
        begin
$display("hwrite=%b", trx.HWRITE);
 //vif.mdrv_cb.HWRITE<=trx.HWRITE;
         foreach(trx.HADDR[i])
           vif.mdrv_cb.HADDR<=trx.HADDR[i];
 vif.mdrv_cb.HWDATA<=trx.HWDATA;
  vif.mdrv_cb.HTRANS<=trx.HTRANS;
   vif.mdrv_cb.HBURST<=trx.HBURST;
   vif.mdrv_cb.HSIZE<=trx.HSIZE;   
    
          
       end
 //  end
 endtask

endclass 








