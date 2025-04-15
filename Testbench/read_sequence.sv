package read_sequence_pkg;
import shared_pkg::*;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_read_sequence extends uvm_sequence #(APB_seq_item);
    `uvm_object_utils(APB_read_sequence) 
    function new(string name = "APB_read_sequence");
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
        // Create seq_item
        repeat(CONST_LOOP) begin
            item = APB_seq_item::type_id::create("item");
            start_item(item);
            read(1);
            finish_item(item);
        end

        // repeat(READ_INACTIVE_PENABLE_LOOP) begin
        //     item = APB_seq_item::type_id::create("item");
        //     start_item(item);
        //     read(0);
        //     finish_item(item);
        // end
    endtask

    task read(bit enable = 1);
        item.READ_WRITE.constraint_mode(0);
        read_assertion: assert (item.randomize())
            else $error("Assertion read_assertion failed!");
        item.PRESETn = 1;
        item.PENABLE = enable;
        item.PWRITE = 0;
    endtask
endclass //APB_read_sequence extends uvm_sequence #(APB_seq_item)
endpackage