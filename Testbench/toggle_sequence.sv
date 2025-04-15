package toggle_sequence_pkg;
import shared_pkg::*;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_toggle_sequence extends uvm_sequence #(APB_seq_item);
    `uvm_object_utils(APB_toggle_sequence) 
    function new(string name = "APB_toggle_sequence");
        super.new(name);
    endfunction //new()


    APB_seq_item item;

    virtual task pre_body();
        `uvm_info({get_type_name(), "FROM_APB_BASE_SEQ"}, {"Entered pre_body of sequence", get_type_name()}, UVM_LOW )
    endtask : pre_body
    
    virtual task post_body();
        `uvm_info({get_type_name(), "FROM_APB_BASE_SEQ"}, {"Entered post_body of sequence", get_type_name()}, UVM_LOW )
    endtask : post_body
    
    // Main task
    task body;
        bit toggle = 1;
        // Creat seq_item
        repeat(CONST_LOOP) begin
            item = APB_seq_item::type_id::create("item");
            start_item(item);
            TOGGLE_TASK(1, toggle);
            finish_item(item);
            toggle = ~toggle;
        end

        // repeat(TOGGLE_LOOP) begin
        //     item = APB_seq_item::type_id::create("item");
        //     start_item(item);
        //     TOGGLE_TASK(0, toggle);
        //     finish_item(item);
        //     toggle = ~toggle;
        // end
    endtask

    task TOGGLE_TASK(bit enable = 1, bit toggle);
        toggle_assertion: assert (item.randomize())
            else $error("Assertion toggle_assertion failed!");
        item.PENABLE = enable;
        item.PWRITE = toggle;
    endtask
endclass //APB_toggle_sequence extends uvm_sequence #(APB_seq_item)
endpackage