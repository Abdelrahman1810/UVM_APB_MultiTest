package test2_pkg;
import shared_pkg::*;
import base_test_pkg::*;

import uvm_pkg::*;
`include "uvm_macros.svh"

class test2 extends base_test;
    `uvm_component_utils(test2)
    
    function new(string name = "test2", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
            #1; `uvm_info("run_phase", "Start read test", UVM_DEBUG) 
            super.rst_seq.start(super.env.agt.sqr);
            super.read_seq.start(super.env.agt.sqr);
        phase.drop_objection(this);
    endtask
endclass //test2 extends uvm_test
endpackage