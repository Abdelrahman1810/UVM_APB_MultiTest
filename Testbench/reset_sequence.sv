package rst_sequence_pkg;
import shared_pkg::*;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_reset_sequence extends uvm_sequence #(APB_seq_item);
    `uvm_object_utils(APB_reset_sequence) 
    function new(string name = "APB_reset_sequence");
        super.new(name);
    endfunction //new()

    virtual task pre_body();
        `uvm_info({get_type_name(), "FROM_APB_BASE_SEQ"}, {"Entered pre_body of sequence", get_type_name()}, UVM_LOW )
    endtask : pre_body
    
    virtual task post_body();
        `uvm_info({get_type_name(), "FROM_APB_BASE_SEQ"}, {"Entered post_body of sequence", get_type_name()}, UVM_LOW )
    endtask : post_body
    
    APB_seq_item item;
    // Main task
    task body;
        // Creat seq_item
        repeat(10) begin
            item = APB_seq_item::type_id::create("item");
            start_item(item);
                Reset_assertion: assert (item.reset())
                    else $error("Assertion Reset_assertion failed!");
            finish_item(item);
        end
    endtask
endclass //APB_reset_sequence extends uvm_sequence #(APB_seq_item)
endpackage