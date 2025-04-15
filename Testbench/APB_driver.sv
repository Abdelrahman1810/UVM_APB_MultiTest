package APB_driver_pkg;
import uvm_pkg::*;
import APB_config_pkg::*;
import APB_seq_item_pkg::*;
import APB_sequencer_pkg::*;
`include "uvm_macros.svh"
	class APB_driver extends uvm_driver #(APB_seq_item);
		`uvm_component_utils(APB_driver)

		virtual APB_if APB_vif;
		APB_config cfg;

		function new(string name="APB_driver", uvm_component parent = null);
			super.new(name,parent);
		endfunction : new

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            cfg = APB_config::type_id::create("cfg",this);

             if (!uvm_config_db#(APB_config)::get(this, "", "CFG", cfg))
                    `uvm_fatal("build_phase", "TEST - Unable to get config");

        endfunction

		task run_phase (uvm_phase phase);
			super.run_phase(phase);
			forever begin
				seq_item_port.get_next_item(req);

					void'(begin_tr(req, "APB_driver"));
					cfg.APB_vif.PRESETn	= req.PRESETn;
					if (req.PRESETn) begin
						drive(req);
					end else begin
						@(posedge cfg.APB_vif.PCLK);
					end
					end_tr(req);
				
				seq_item_port.item_done();
				//`uvm_info("run_phase",stim_seq_item.convert2string_stimulus(),UVM_HIGH)
			end
			
		endtask : run_phase

		task drive(APB_seq_item stim_seq_item);	

		// IDLE Phase
			@(posedge cfg.APB_vif.PCLK);
			cfg.APB_vif.PENABLE	=	0;
			while (cfg.APB_vif.PREADY == 1) begin
				@(posedge cfg.APB_vif.PCLK);
			end

		// Drive data
			cfg.APB_vif.PWDATA	= stim_seq_item.PWDATA;
			cfg.APB_vif.PWRITE	= stim_seq_item.PWRITE;
			cfg.APB_vif.PADDR	= stim_seq_item.PADDR;
			@(posedge cfg.APB_vif.PCLK);

		// SETUP Phase
			cfg.APB_vif.PENABLE	=	stim_seq_item.PENABLE;
			@(posedge cfg.APB_vif.PCLK);

			while (cfg.APB_vif.PENABLE && cfg.APB_vif.PREADY == 0) begin
				@(posedge cfg.APB_vif.PCLK);
			end
			
		// ACCESS Phase
			while (cfg.APB_vif.PREADY == 1) begin
				@(posedge cfg.APB_vif.PCLK);
			end

			// back to IDLE state
			cfg.APB_vif.PENABLE = 0;

		endtask : drive
	endclass : APB_driver
endpackage : APB_driver_pkg
