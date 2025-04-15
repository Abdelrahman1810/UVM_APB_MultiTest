package sequence_pkg;
import shared_pkg::*;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class APB_sequence extends uvm_sequence #(APB_seq_item);
    `uvm_object_utils(APB_sequence) 

    function new(string name = "APB_sequence");
        super.new(name);
    endfunction //new()

    APB_seq_item item;

    task body;
        repeat(100) begin
            item = APB_seq_item::type_id::create("item");
            start_item(item);
            assert (item.randomize());
            finish_item(item);
        end
    endtask

endclass
endpackage