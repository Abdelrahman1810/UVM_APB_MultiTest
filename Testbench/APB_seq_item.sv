package APB_seq_item_pkg;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	import shared_pkg::*;
	class APB_seq_item extends uvm_sequence_item;
		`uvm_object_utils(APB_seq_item)

		rand logic [DATA_WIDTH-1:0] 	PWDATA;
		rand logic [ADDR_WIDTH-1:0] 	PADDR;
		rand logic 						PRESETn;
		rand logic 						PSELx;
		logic 							PENABLE;
		rand logic 						PWRITE;
		rand logic [2:0]				PPROT;
		rand logic [DATA_WIDTH/8-1:0] 	PSTRB; 
		logic 							PREADY;
		logic 							PSLVERR;
		logic [DATA_WIDTH:0] 			PRDATA;

		function new(string name = "APB_seq_item");
			super.new(name);
		endfunction 
		//function string convert2string();
		//	return $sformatf("%s PRESETn=0b%0b, PWDATA=0b%0b, PRDATA=0b%0b, PADDR=0b%0b, PPROT=0b%0b, PSELx=0b%b, PENABLE=0b%b,PWRITE=0b%b,PREADY=0b%b,PSLVERR=0b%b, PSTRB=0b%b",super.convert2string(),PRESETn,PRDATA,PADDR,PPROT,PSELx,PENABLE,PWRITE,PREADY,PSLVERR,PSTRB);
  	//endfunction
//
  	//function string convert2string_stimulus();
  	//	 return $sformatf("%s PRESETn=0b%0b, PWDATA=0b%0b, PRDATA=0b%0b, PADDR=0b%0b, PPROT=0b%0b, PSELx=0b%b, PENABLE=0b%b,PWRITE=0b%b,PREADY=0b%b,PSLVERR=0b%b, PSTRB=0b%b",PRESETn,PWDATA,PRDATA,PADDR,PPROT,PSELx,PENABLE,PWRITE,PREADY,PSLVERR,PSTRB);
  	//endfunction : convert2string_stimulus

/*
/// // // // // // // // // // // // // ///
/// // // // // Constraints // // // // ///
/// // // // // // // // // // // // // ///
*/

		constraint RESET {
			PRESETn dist {0:=ACTIVE_RESET, 1:=100-ACTIVE_RESET};
		}

		constraint ADDRESS {
			PADDR % 4 == 0;
			PADDR <= 32'h0000_003D;
			PADDR[ADDR_WIDTH-1:8] == 0;
		}

		constraint READ_WRITE {
			PWRITE dist {1:= WRITE_OP , 0:= READ_OP};
		}

		constraint WRITE_DATA {
			PWDATA dist {MAX_DATA:= 5 , MIN_DATA:= 5, [MIN_DATA+1 : MAX_DATA-1]:/90};
		}

		//constraint STRB {
		//	$onehot(PSTRB) == 1;
		//}
/*
/// // // // // // // // // // // // // ///
/// // // // // Constraints // // // // ///
/// // // // // // // // // // // // // ///
*/
	
/*
/// Reset Function
*/
function bit reset();
	PRESETn = 1'b0;
	PADDR = 32'd0;
	PPROT = 32'd0;
	// PSELx = 0;
	PENABLE = 1'b0;
	PWRITE = 1'b0;
	PSTRB = 32'd0;
	return !PRESETn;
endfunction : reset

  	endclass : APB_seq_item
  endpackage : APB_seq_item_pkg
