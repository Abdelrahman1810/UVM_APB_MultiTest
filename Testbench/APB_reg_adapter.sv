package APB_reg_adapter_pkg;
	import shared_pkg::*;
	import uvm_pkg::*;
	import APB_seq_item_pkg::*;
	`include "uvm_macros.svh"

	class APB_reg_adapter extends uvm_reg_adapter;
	
	/*-------------------------------------------------------------------------------
	-- Interface, port, fields
	-------------------------------------------------------------------------------*/
		
	
	/*-------------------------------------------------------------------------------
	-- UVM Factory register
	-------------------------------------------------------------------------------*/
		// Provide implementations of virtual methods such as get_type_name and create
		`uvm_object_utils(APB_reg_adapter)
	
	/*-------------------------------------------------------------------------------
	-- Functions
	-------------------------------------------------------------------------------*/
		// Constructor
		function new(string name = "APB_reg_adapter");
			super.new(name);
			// this.supports_byte_enable = 1;
		endfunction : new

		virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
			APB_seq_item bus_seq_item = APB_seq_item::type_id::create("bus_seq_item");
			bus_seq_item.PWRITE 	= (rw.kind == UVM_READ)? 0 : 1;
			bus_seq_item.PENABLE 	= 1;
			bus_seq_item.PADDR 		= rw.addr;
			bus_seq_item.PWDATA 	= rw.data;
			bus_seq_item.PPROT 		= 3'b000;
			bus_seq_item.PREADY		= (rw.status == UVM_IS_OK)? 1 : 0;
			
			// foreach (rw.byte_en[i])
      		// 	bus_seq_item.PSTRB[i] = rw.byte_en[i];

      		// `uvm_info({get_type_name(), "FROM APB_REG_ADAPTER"}, {"reg2bus tr = ", "\n", bus_seq_item.sprint()}, UVM_LOW)
			
			return bus_seq_item;
		endfunction : reg2bus

		virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
			APB_seq_item bus_seq_item;
			if (!$cast(bus_seq_item, bus_item))
 				`uvm_fatal("NOT_BUS_TYPE", "Wrong type for bus_item")
 			
 			rw.kind 	= 	(bus_seq_item.PWRITE == 0)? UVM_READ : UVM_WRITE;
			rw.addr 	= 	bus_seq_item.PADDR;
			rw.data 	= 	(bus_seq_item.PWRITE == 0)? bus_seq_item.PRDATA : bus_seq_item.PWDATA;
			rw.status 	= 	(bus_seq_item.PREADY == 1)? UVM_IS_OK : UVM_NOT_OK;
			
			// foreach (rw.PSTRB[i])
      		// 	rw.byte_en[i] = bus_seq_item.PSTRB[i];

      		// `uvm_info({get_type_name(), "FROM APB_REG_ADAPTER"}, {"bus2reg rw = ", "\n", rw.sprint()}, UVM_LOW)
		endfunction : bus2reg
	
	endclass : APB_reg_adapter
	
endpackage : APB_reg_adapter_pkg