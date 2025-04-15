interface APB_if (input PCLK);
    parameter DATA_WIDTH = 32					;
    parameter ADDR_WIDTH = 32					;
    parameter NO_SLAVES  = 1					;

`ifdef AMBA4
	logic [DATA_WIDTH/8 -1 : 0] 	PSTRB  	; // input 
	logic [2:0]                 	PPROT  	; // input 
`endif 
// PSI => Previous System IN
// PSO => Previous System OUT
// Global Sinals
    logic 						 	PRESETn     ; // input  
// Master FROM Previous system
	logic [NO_SLAVES - 1 : 0]		PSELx	 ;
	logic 							PENABLE	 ;
    logic [ADDR_WIDTH-1 : 0]     	PADDR    ; // input
    logic                        	PWRITE   ; // input
    logic [DATA_WIDTH-1 : 0]     	PWDATA   ; // input

// Master TO Previous system
    logic [DATA_WIDTH-1 : 0]    	PRDATA  	; // output
    logic                       	PSLVERR 	; // output
    logic                       	PREADY 		; // output


//// monitor clocking block
//   clocking mon_cb @(posedge PCLK);
//     default input #1 output #1;

// 		input PRESETn		;
// 		input PADDR		;
// 		input PWRITE		;
// 		input PWDATA		;

// 		input PRDATA		;
// 		input PSLVERR	;
// 		input PREADY	;
//   endclocking

//// driver clocking block
//   clocking drv_cb @(posedge PCLK);
//     default input #1 output #1;

// 		output PRESETn		;
// 		output PADDR		;
// 		output PWRITE	;
// 		output PWDATA	;

// 		input PRDATA		;
// 		input PSLVERR	;
// 		input PREADY	;
//   endclocking
  
//// driver modport
//   modport DRIVER  (clocking drv_cb, input PCLK);
  
//// monitor modport  
//   modport MONITOR (clocking mon_cb, input PCLK);
endinterface