module top();
import uvm_pkg::*;
import base_test_pkg::*;
import test1_pkg::*;
import test2_pkg::*;
import test3_pkg::*;
import test4_pkg::*;

`include "uvm_macros.svh"
import shared_pkg::*;
    bit PCLK;

initial begin
    forever begin
        #(clk_cycle/2) PCLK = ~PCLK;
    end
end

    APB_if intf(PCLK);

    APB_Wrapper#(
        .DATA_WIDTH(DATA_WIDTH)    ,
        .ADDR_WIDTH(ADDR_WIDTH)    ,
        .NO_SLAVES(NO_SLAVES)  
    )sys_level(
        .PCLK(PCLK)                     ,

        `ifdef AMBA4
            .PSTRB(intf.PSTRB)        ,
            .PPROT(intf.PPROT)        ,
        `endif

        .PRESETn(intf.PRESETn)    ,
        .PADDR(intf.PADDR)        ,
        .PWRITE(intf.PWRITE)      ,
        .PWDATA(intf.PWDATA)      ,
        .PENABLE(intf.PENABLE)    ,
        .PSELx  (intf.PSELx)           ,
        .PREADY (intf.PREADY)          ,
        .PRDATA(intf.PRDATA)      ,
        .PSLVERR(intf.PSLVERR)    
    );

    // testbench tb(intf);

    initial begin
        uvm_config_db#(virtual APB_if)::set(null, "uvm_test_top", "CFG", intf);
        run_test("bbbbbbb");
    end
    // assign intf.CurrentState = sys_level.apb_slave.CurrentState    ;
    // assign intf.NextState = sys_level.apb_slave.NextState           ;

endmodule