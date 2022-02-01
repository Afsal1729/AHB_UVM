class s_trans_item extends uvm_sequence_item;
  `uvm_object_utils(s_trans_item)
 bit HRESET;
       //bit HREADY;
         bit HWRITE;
   //bit [31:0] HADDR[];
      bit [31:0] HWDATA;
   rand bit [31:0] HRDATA;
        rand bit [1:0] HRESP;
  rand bit HREADY;
  /*parameter SINGLE_TRANSFER=0; 
  parameter INCR=1; 
  parameter INCR4=3; 
  parameter INCR8=5;
  */
		 
  function new(string name="s_trans_item");
	super.new(name);
endfunction
  
 /* constraint addr_size{if(HBURST==SINGLE_TRANSFER) HADDR.size==1;}
                      // if(HBURST==INCR) HADDR.size<1024;}
 // if(HBURST==INCR4) HADDR.size==4;if(HBURST==INCR8) HADDR.size==8;}
  
  //constraint incr4{
  */
		 
endclass
		 
		 
		 
