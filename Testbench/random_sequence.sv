package random_sequence_pkg;
import shared_pkg::*;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_random_sequence extends uvm_sequence #(APB_seq_item);
    `uvm_object_utils(APB_random_sequence) 
    function new(string name = "APB_random_sequence");
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
        // Creat seq_item
        repeat(CONST_LOOP) begin
            item = APB_seq_item::type_id::create("item");
            start_item(item);
            RANDOM_TASK(1);
            finish_item(item);
        end
    endtask

    task RANDOM_TASK(bit enable = 1);
        random_assertion: assert (item.randomize())
            else $error("Assertion random_assertion failed!");
        item.PENABLE = enable;
    endtask
endclass //APB_random_sequence extends uvm_sequence #(APB_seq_item)
endpackage