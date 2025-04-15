package base_test_pkg;
import shared_pkg::*;
import APB_env_pkg::*;
import APB_config_pkg::*;
import rst_sequence_pkg::*;
import read_sequence_pkg::*;
import write_sequence_pkg::*;
import random_sequence_pkg::*;
import toggle_sequence_pkg::*;

import uvm_pkg::*;
`include "uvm_macros.svh"

class base_test extends uvm_test;
    `uvm_component_utils(base_test)
    APB_env env;
    APB_config cfg;

    APB_reset_sequence rst_seq;
    APB_read_sequence read_seq;
    APB_write_sequence write_seq;
    APB_random_sequence rnd_seq;
    APB_toggle_sequence tgl_seq;
    
    // declare new() function of parent uvm_test
    function new(string name = "base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    // build phase function and send the parameter phase to parent uvm_test
        function void build_phase(uvm_phase phase);
            uvm_factory factory = uvm_factory::get(); 
            super.build_phase(phase);
            factory.print();

            env = APB_env::type_id::create("env",this);
            cfg = APB_config::type_id::create("cfg",this);

            rst_seq = APB_reset_sequence::type_id::create("rst_seq");
            read_seq = APB_read_sequence::type_id::create("read_seq");
            write_seq = APB_write_sequence::type_id::create("write_seq");
            rnd_seq = APB_random_sequence::type_id::create("rnd_seq");
            tgl_seq = APB_toggle_sequence::type_id::create("tgl_seq");

             if (!uvm_config_db#(virtual APB_if)::get(this, "", "CFG", cfg.APB_vif))
                    `uvm_fatal("build_phase", "TEST - Unable to get config");

            uvm_config_db#(APB_config)::set(this, "*", "CFG", cfg);
        endfunction

    // run phase function to create UVM env
        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            
            // raise and drop to start and finish of base_test
            phase.raise_objection(this);
            #1; `uvm_info("run_phase", "Inside the slaby test DEBUG", UVM_DEBUG) 
            rst_seq.start(env.agt.sqr);
            phase.drop_objection(this);
        endtask
endclass //base_test extends uvm_test
endpackage