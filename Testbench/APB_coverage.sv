package APB_coverage_pkg;
	import APB_seq_item_pkg::*;
	import uvm_pkg::*;
    `include "uvm_macros.svh"
	class APB_coverage extends uvm_component;
		`uvm_component_utils(APB_coverage)
    uvm_analysis_export #(APB_seq_item) cov_export;
    uvm_tlm_analysis_fifo #(APB_seq_item) cov_fifo;
    APB_seq_item cov_seq_item;
covergroup cvr_grp;
        RESET: coverpoint cov_seq_item.PRESETn;

        WRITE: coverpoint cov_seq_item.PWRITE;
        
        READY: coverpoint cov_seq_item.PREADY;
        
        ENABLE: coverpoint cov_seq_item.PENABLE;
        
        READY_ENABLE: cross READY, ENABLE {
            option.cross_auto_bin_max = 0;
            bins ACCESSA = (binsof(READY) intersect{1} && binsof(ENABLE) intersect{1});
        }
    
        SEL: coverpoint cov_seq_item.PSELx {
            bins slave0 = {4'b0001};
            bins slave1 = {4'b0010};
            bins slave2 = {4'b0100};
            bins slave3 = {4'b1000};
        }
    endgroup
    function new(string name, uvm_component parent);
      super.new(name, parent);
      cvr_grp = new();
    endfunction : new

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      cov_export = new("cov_export", this);
      cov_fifo = new("cov_fifo", this);
      endfunction : build_phase

      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        cov_export.connect(cov_fifo.analysis_export);
        endfunction : connect_phase

      task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            cov_fifo.get(cov_seq_item);
            cvr_grp.sample();
        end
      endtask : run_phase

	endclass 
endpackage : APB_coverage_pkg
