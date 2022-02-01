class m_trans_item extends uvm_sequence_item;
`uvm_object_utils(m_trans_item)
 rand bit HRESET;
       bit HREADY;
        rand bit [1:0] HTRANS;
        rand bit [2:0] HBURST;
        rand bit  [2:0] HSIZE;
        rand bit HWRITE;
  rand bit [31:0] HADDR[];
        rand bit [31:0] HWDATA;
        bit [31:0] HRDATA;
         bit [1:0] HRESP;
  bit HREADYOUT;
  parameter SINGLE_TRANSFER=0; 
  parameter INCR=1; 
  parameter INCR4=3; 
  parameter INCR8=5;
		 
function new(string name="m_trans_item");
	super.new(name);
endfunction
  constraint h_size{HSIZE==2;}
  constraint addr_size{if(HBURST==SINGLE_TRANSFER) HADDR.size==1;
                      if(HBURST==INCR) HADDR.size<1024;
  if(HBURST==INCR4) HADDR.size==4;if(HBURST==INCR8) HADDR.size==8;}
  
  //constraint incr4{
		 
endclass
		 
		 
		 
