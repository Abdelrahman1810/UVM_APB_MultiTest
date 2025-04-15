package APB_env_pkg;
import APB_agent_pkg::*;
import APB_coverage_pkg::*;
// import APB_scoreboard_pkg::*;
import APB_reg_adapter_pkg::*;
import APB_seq_item_pkg::*;
import APB_reg_block_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_env extends uvm_env;
	`uvm_component_utils(APB_env)

	APB_agent agt;
	APB_coverage cov;
	// APB_scoreboard sb;
	APB_reg_block reg_model;
	APB_reg_adapter adapter;
	uvm_reg_predictor #(APB_seq_item) APB_predictor;

	function new(string name="APB_env", uvm_component parent = null);
		super.new(name,parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agt= APB_agent::type_id::create("agt",this);
		cov=APB_coverage::type_id::create("cov",this);
		// sb=APB_scoreboard::type_id::create("sb",this);
		reg_model = APB_reg_block::type_id::create("reg_model", this);
		reg_model.build();
		adapter = APB_reg_adapter::type_id::create("adapter", this);
		APB_predictor = uvm_reg_predictor#(APB_seq_item)::type_id::create("APB_predictor", this);
	endfunction

	function void connect_phase(uvm_phase phase);
		agt.agt_ap.connect(cov.cov_export);
		// agt.agt_ap.connect(sb.sb_export);
		APB_predictor.map = reg_model.default_map;
		APB_predictor.adapter = adapter;
		agt.agt_ap.connect(APB_predictor.bus_in);
	endfunction
endclass : APB_env
endpackage : APB_env_pkg





