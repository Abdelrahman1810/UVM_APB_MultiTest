module testbench(APB_if tb);

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
end

initial begin
    tb.PRESETn = 0;
    tb.PWRITE    = 0;
    tb.PADDR     = 0;
    tb.PWDATA    = 0;
    @(posedge tb.PCLK);
    @(posedge tb.PCLK);
    @(posedge tb.PCLK);
    tb.PRESETn = 1;
    tb.PENABLE    = 1;
    @(posedge tb.PCLK);
    @(posedge tb.PCLK);
end

initial begin
    repeat(5) @(posedge tb.PCLK);

@(posedge tb.PCLK);
    tb.PWRITE   = 1;
// 32'h0000_0000: SYS_STATUS_REG
    tb.PADDR = 32'h0000_0000;
    tb.PWDATA   = 32'h0000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0004: INT_CTRL_REG
    tb.PADDR = 32'h0000_0004;
    tb.PWDATA   = 32'h1000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0008: DEV_ID_REG
    tb.PADDR = 32'h0000_0008;
    tb.PWDATA   = 32'h2000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_000c: MEM_CTRL_REG
    tb.PADDR = 32'h0000_000c;
    tb.PWDATA   = 32'h3000_0000;
    repeat(5) @(posedge tb.PCLK);

Disable(3);
Enable();

// 32'h0000_0010: TEMP_SENSOR_REG
    tb.PADDR = 32'h0000_0010;
    tb.PWDATA   = 32'h4000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0014: ADC_CTRL_REG
    tb.PADDR = 32'h0000_0014;
    tb.PWDATA   = 32'h5000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0018: DBG_CTRL_REG
    tb.PADDR = 32'h0000_0018;
    tb.PWDATA   = 32'h6000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_001c: GPIO_DATA_REG
    tb.PADDR = 32'h0000_001c;
    tb.PWDATA   = 32'h7000_0000;
    repeat(5) @(posedge tb.PCLK);

Disable(4);
Enable();

// 32'h0000_0020: DAC_OUTPUT_REG
    tb.PADDR = 32'h0000_0020;
    tb.PWDATA   = 32'h8000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0024: VOLTAGE_CTRL_REG
    tb.PADDR = 32'h0000_0024;
    tb.PWDATA   = 32'h9000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0028: CLK_CONFIG_REG
    tb.PADDR = 32'h0000_0028;
    tb.PWDATA   = 32'hA000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_002c: TIMER_COUNT_REG
    tb.PADDR = 32'h0000_002c;
    tb.PWDATA   = 32'hB000_0000;
    repeat(5) @(posedge tb.PCLK);

Disable(5);
Enable();

// 32'h0000_0030: INPUT_DATA_REG
    tb.PADDR = 32'h0000_0030;
    tb.PWDATA   = 32'hC000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0034: OUTPUT_DATA_REG
    tb.PADDR = 32'h0000_0034;
    tb.PWDATA   = 32'hD000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_0038: DMA_CTRL_REG
    tb.PADDR = 32'h0000_0038;
    tb.PWDATA   = 32'hE000_0000;
    repeat(5) @(posedge tb.PCLK);

// 32'h0000_003c: SYS_CTRL_REG
    tb.PADDR = 32'h0000_003c;
    tb.PWDATA   = 32'hF000_0000;
    repeat(5) @(posedge tb.PCLK);

Disable(6);
Enable();

// // // // // // Read

    tb.PWRITE   = 0;

// 32'h0000_0000: SYS_STATUS_REG
    tb.PADDR = 32'h0000_0000;
    repeat(5) @(posedge tb.PCLK);
    $display("1_SYS_STATUS_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0004: INT_CTRL_REG
    tb.PADDR = 32'h0000_0004;
    repeat(5) @(posedge tb.PCLK);
    $display("1_INT_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0008: DEV_ID_REG
    tb.PADDR = 32'h0000_0008;
    repeat(5) @(posedge tb.PCLK);
    $display("1_DEV_ID_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_000c: MEM_CTRL_REG
    tb.PADDR = 32'h0000_000c;
    repeat(5) @(posedge tb.PCLK);
    $display("1_MEM_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");

Disable(3);
Enable();

// 32'h0000_0010: TEMP_SENSOR_REG
    tb.PADDR = 32'h0000_0010;
    repeat(5) @(posedge tb.PCLK);
    $display("1_TEMP_SENSOR_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0014: ADC_CTRL_REG
    tb.PADDR = 32'h0000_0014;
    repeat(5) @(posedge tb.PCLK);
    $display("1_ADC_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0018: DBG_CTRL_REG
    tb.PADDR = 32'h0000_0018;
    repeat(5) @(posedge tb.PCLK);
    $display("1_DBG_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_001c: GPIO_DATA_REG
    tb.PADDR = 32'h0000_001c;
    repeat(5) @(posedge tb.PCLK);
    $display("1_GPIO_DATA_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");

Disable(4);
Enable();

// 32'h0000_0020: DAC_OUTPUT_REG
    tb.PADDR = 32'h0000_0020;
    repeat(5) @(posedge tb.PCLK);
    $display("1_DAC_OUTPUT_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0024: VOLTAGE_CTRL_REG
    tb.PADDR = 32'h0000_0024;
    repeat(5) @(posedge tb.PCLK);
    $display("1_VOLTAGE_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0028: CLK_CONFIG_REG
    tb.PADDR = 32'h0000_0028;
    repeat(5) @(posedge tb.PCLK);
    $display("1_CLK_CONFIG_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_002c: TIMER_COUNT_REG
    tb.PADDR = 32'h0000_002c;
    repeat(5) @(posedge tb.PCLK);
    $display("1_TIMER_COUNT_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");

Disable(5);
Enable();

// 32'h0000_0030: INPUT_DATA_REG
    tb.PADDR = 32'h0000_0030;
    repeat(5) @(posedge tb.PCLK);
    $display("1_INPUT_DATA_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0034: OUTPUT_DATA_REG
    tb.PADDR = 32'h0000_0034;
    repeat(5) @(posedge tb.PCLK);
    $display("1_OUTPUT_DATA_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_0038: DMA_CTRL_REG
    tb.PADDR = 32'h0000_0038;
    repeat(5) @(posedge tb.PCLK);
    $display("1_DMA_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");
// 32'h0000_003c: SYS_CTRL_REG
    tb.PADDR = 32'h0000_003c;
    repeat(5) @(posedge tb.PCLK);
    $display("1_SYS_CTRL_REG, tb.PRDATA != %0h", tb.PRDATA);
$display("*********************************\n*********************************\n*********************************\n");

Disable(6);
Enable();

    repeat(16) begin
        tb.PWRITE = $random;
        tb.PADDR = 32'h0000_0000;
        tb.PWDATA   = $random;
        repeat(5) @(posedge tb.PCLK);
    end

    $stop;
end

task Disable(int disable_period = 2);
    repeat(5) @(posedge tb.PCLK);
    tb.PENABLE    = 0;
    repeat(disable_period) @(posedge tb.PCLK);
endtask

task Enable();
    tb.PENABLE    = 1;
    repeat(4) @(posedge tb.PCLK);
endtask
endmodule