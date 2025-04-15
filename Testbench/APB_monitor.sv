
package APB_monitor_pkg;
import APB_seq_item_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
class APB_monitor extends uvm_monitor;
   `uvm_component_utils(APB_monitor)
virtual APB_if APB_vif;
    APB_seq_item rsp_seq_item;
   uvm_analysis_port #(APB_seq_item) mon_ap;
   
   

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mon_ap = new("mon_ap", this);
   endfunction : build_phase

    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      forever begin
         rsp_seq_item = APB_seq_item::type_id::create("rsp_seq_item");
         @(negedge APB_vif.PCLK);
         rsp_seq_item.PWDATA=APB_vif.PWDATA;
         rsp_seq_item.PRDATA=APB_vif.PRDATA;
         rsp_seq_item.PADDR=APB_vif.PADDR;
         rsp_seq_item.PRESETn=APB_vif.PRESETn;
         //rsp_seq_item.PPROT=APB_vif.PPROT;
         rsp_seq_item.PSELx=APB_vif.PSELx;
         rsp_seq_item.PENABLE=APB_vif.PENABLE;
         rsp_seq_item.PWRITE=APB_vif.PWRITE;
         rsp_seq_item.PREADY=APB_vif.PREADY;
         rsp_seq_item.PSLVERR=APB_vif.PSLVERR;
         //rsp_seq_item.PSTRB=APB_vif.PSTRB;
         mon_ap.write(rsp_seq_item);
        `uvm_info("run_phase",rsp_seq_item.convert2string(),UVM_HIGH)
      end
   endtask : run_phase
endclass : APB_monitor
endpackage : APB_monitor_pkg