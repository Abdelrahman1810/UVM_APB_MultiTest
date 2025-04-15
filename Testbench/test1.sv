package test1_pkg;
import shared_pkg::*;
import base_test_pkg::*;

import uvm_pkg::*;
`include "uvm_macros.svh"

class test1 extends base_test;
    `uvm_component_utils(test1)

    function new(string name = "test1", uvm_component parent = null);
        super.new(name, null);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);            
        phase.raise_objection(this);            
            #1; `uvm_info("run_phase", "Start Write Test", UVM_DEBUG) 
            super.rst_seq.start(super.env.agt.sqr);
            super.write_seq.start(super.env.agt.sqr);
        phase.drop_objection(this);
    endtask
endclass //test1 extends uvm_test
endpackage