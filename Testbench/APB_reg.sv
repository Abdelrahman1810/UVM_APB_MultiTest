package APB_reg_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

class SYS_STATUS_REG extends uvm_reg;
  `uvm_object_utils(SYS_STATUS_REG)

  rand uvm_reg_field SYS_ERR;
  rand uvm_reg_field INT_EN;
  rand uvm_reg_field PWR_GOOD;
  rand uvm_reg_field CLK_STAT;

  function new (string name = "SYS_STATUS_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    SYS_ERR = uvm_reg_field::type_id::create("SYS_ERR");
    SYS_ERR.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    INT_EN = uvm_reg_field::type_id::create("INT_EN");
    INT_EN.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    PWR_GOOD = uvm_reg_field::type_id::create("PWR_GOOD");
    PWR_GOOD.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    CLK_STAT = uvm_reg_field::type_id::create("CLK_STAT");
    CLK_STAT.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class INT_CTRL_REG extends uvm_reg;
  `uvm_object_utils(INT_CTRL_REG)

  rand uvm_reg_field INT_EN;
  rand uvm_reg_field PERI_INT_EN;
  rand uvm_reg_field TMR_INT_EN;
  rand uvm_reg_field EXT_INT_EN;

  function new (string name = "INT_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    INT_EN = uvm_reg_field::type_id::create("INT_EN");
    INT_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    PERI_INT_EN = uvm_reg_field::type_id::create("PERI_INT_EN");
    PERI_INT_EN.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    TMR_INT_EN = uvm_reg_field::type_id::create("TMR_INT_EN");
    TMR_INT_EN.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    EXT_INT_EN = uvm_reg_field::type_id::create("EXT_INT_EN");
    EXT_INT_EN.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class DEV_ID_REG extends uvm_reg;
  `uvm_object_utils(DEV_ID_REG)

  rand uvm_reg_field DEV_MFG_ID;
  rand uvm_reg_field DEV_MOD_ID;
  rand uvm_reg_field DEV_REV;
  rand uvm_reg_field RESERVED;

  function new (string name = "DEV_ID_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DEV_MFG_ID = uvm_reg_field::type_id::create("DEV_MFG_ID");
    DEV_MFG_ID.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DEV_MOD_ID = uvm_reg_field::type_id::create("DEV_MOD_ID");
    DEV_MOD_ID.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DEV_REV = uvm_reg_field::type_id::create("DEV_REV");
    DEV_REV.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    RESERVED.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(0), .individually_accessible(0)
    );
  endfunction
endclass

class MEM_CTRL_REG extends uvm_reg;
  `uvm_object_utils(MEM_CTRL_REG)

  rand uvm_reg_field CACHE_EN;
  rand uvm_reg_field MEM_MODE;
  rand uvm_reg_field PRE_FETCH;
  rand uvm_reg_field ECC_CTRL;

  function new (string name = "MEM_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    CACHE_EN = uvm_reg_field::type_id::create("CACHE_EN");
    CACHE_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    MEM_MODE = uvm_reg_field::type_id::create("MEM_MODE");
    MEM_MODE.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    PRE_FETCH = uvm_reg_field::type_id::create("PRE_FETCH");
    PRE_FETCH.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    ECC_CTRL = uvm_reg_field::type_id::create("ECC_CTRL");
    ECC_CTRL.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class TEMP_SENSOR_REG extends uvm_reg;
  `uvm_object_utils(TEMP_SENSOR_REG)

  rand uvm_reg_field TEMP_HB;
  rand uvm_reg_field TEMP_LB;
  rand uvm_reg_field OVR_TEMP_WARN;
  rand uvm_reg_field UND_TEMP_WARN;

  function new (string name = "TEMP_SENSOR_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    TEMP_HB = uvm_reg_field::type_id::create("TEMP_HB");
    TEMP_HB.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    TEMP_LB = uvm_reg_field::type_id::create("TEMP_LB");
    TEMP_LB.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    OVR_TEMP_WARN = uvm_reg_field::type_id::create("OVR_TEMP_WARN");
    OVR_TEMP_WARN.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    UND_TEMP_WARN = uvm_reg_field::type_id::create("UND_TEMP_WARN");
    UND_TEMP_WARN.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class ADC_CTRL_REG extends uvm_reg;
  `uvm_object_utils(ADC_CTRL_REG)

  rand uvm_reg_field ADC_START;
  rand uvm_reg_field ADC_READY;
  rand uvm_reg_field ADC_CH_SEL;
  rand uvm_reg_field ADC_REF_SEL;

  function new (string name = "ADC_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    ADC_START = uvm_reg_field::type_id::create("ADC_START");
    ADC_START.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    ADC_READY = uvm_reg_field::type_id::create("ADC_READY");
    ADC_READY.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    ADC_CH_SEL = uvm_reg_field::type_id::create("ADC_CH_SEL");
    ADC_CH_SEL.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    ADC_REF_SEL = uvm_reg_field::type_id::create("ADC_REF_SEL");
    ADC_REF_SEL.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class DBG_CTRL_REG extends uvm_reg;
  `uvm_object_utils(DBG_CTRL_REG)

  rand uvm_reg_field DBG_EN;
  rand uvm_reg_field BRKPT_EN;
  rand uvm_reg_field WDT_CTRL;
  rand uvm_reg_field STEP_EN;

  function new (string name = "DBG_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DBG_EN = uvm_reg_field::type_id::create("DBG_EN");
    DBG_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    BRKPT_EN = uvm_reg_field::type_id::create("BRKPT_EN");
    BRKPT_EN.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    WDT_CTRL = uvm_reg_field::type_id::create("WDT_CTRL");
    WDT_CTRL.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    STEP_EN = uvm_reg_field::type_id::create("STEP_EN");
    STEP_EN.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class GPIO_DATA_REG extends uvm_reg;
  `uvm_object_utils(GPIO_DATA_REG)

  rand uvm_reg_field GPIO_OUT3;
  rand uvm_reg_field GPIO_OUT2;
  rand uvm_reg_field GPIO_OUT1;
  rand uvm_reg_field GPIO_OUT0;

  function new (string name = "GPIO_DATA_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    GPIO_OUT3 = uvm_reg_field::type_id::create("GPIO_OUT3");
    GPIO_OUT3.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    GPIO_OUT2 = uvm_reg_field::type_id::create("GPIO_OUT2");
    GPIO_OUT2.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    GPIO_OUT1 = uvm_reg_field::type_id::create("GPIO_OUT1");
    GPIO_OUT1.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    GPIO_OUT0 = uvm_reg_field::type_id::create("GPIO_OUT0");
    GPIO_OUT0.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class DAC_OUTPUT_REG extends uvm_reg;
  `uvm_object_utils(DAC_OUTPUT_REG)

  rand uvm_reg_field DAC_EN;
  rand uvm_reg_field DAC_MODE;
  rand uvm_reg_field DAC_GAIN;
  rand uvm_reg_field DAC_PWR_MODE;

  function new (string name = "DAC_OUTPUT_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DAC_EN = uvm_reg_field::type_id::create("DAC_EN");
    DAC_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DAC_MODE = uvm_reg_field::type_id::create("DAC_MODE");
    DAC_MODE.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DAC_GAIN = uvm_reg_field::type_id::create("DAC_GAIN");
    DAC_GAIN.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DAC_PWR_MODE = uvm_reg_field::type_id::create("DAC_PWR_MODE");
    DAC_PWR_MODE.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class VOLTAGE_CTRL_REG extends uvm_reg;
  `uvm_object_utils(VOLTAGE_CTRL_REG)

  rand uvm_reg_field VOLTAGE_EN;
  rand uvm_reg_field VOLTAGE_SEL;
  rand uvm_reg_field VOLTAGE_SET;
  rand uvm_reg_field VOLTAGE_MON;

  function new (string name = "VOLTAGE_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    VOLTAGE_EN = uvm_reg_field::type_id::create("VOLTAGE_EN");
    VOLTAGE_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    VOLTAGE_SEL = uvm_reg_field::type_id::create("VOLTAGE_SEL");
    VOLTAGE_SEL.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    VOLTAGE_SET = uvm_reg_field::type_id::create("VOLTAGE_SET");
    VOLTAGE_SET.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    VOLTAGE_MON = uvm_reg_field::type_id::create("VOLTAGE_MON");
    VOLTAGE_MON.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class CLK_CONFIG_REG extends uvm_reg;
  `uvm_object_utils(CLK_CONFIG_REG)

  rand uvm_reg_field CLK_SRC;
  rand uvm_reg_field CLK_DIV;
  rand uvm_reg_field CLK_EN;
  rand uvm_reg_field CLK_RST;

  function new (string name = "CLK_CONFIG_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    CLK_SRC = uvm_reg_field::type_id::create("CLK_SRC");
    CLK_SRC.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    CLK_DIV = uvm_reg_field::type_id::create("CLK_DIV");
    CLK_DIV.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    CLK_EN = uvm_reg_field::type_id::create("CLK_EN");
    CLK_EN.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    CLK_RST = uvm_reg_field::type_id::create("CLK_RST");
    CLK_RST.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class TIMER_COUNT_REG extends uvm_reg;
  `uvm_object_utils(TIMER_COUNT_REG)

  rand uvm_reg_field TIMER_CNT_MSB;
  rand uvm_reg_field TIMER_CNT_LSB;
  rand uvm_reg_field TIMER_EN;
  rand uvm_reg_field TIMER_MODE;

  function new (string name = "TIMER_COUNT_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    TIMER_CNT_MSB = uvm_reg_field::type_id::create("TIMER_CNT_MSB");
    TIMER_CNT_MSB.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    TIMER_CNT_LSB = uvm_reg_field::type_id::create("TIMER_CNT_LSB");
    TIMER_CNT_LSB.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    TIMER_EN = uvm_reg_field::type_id::create("TIMER_EN");
    TIMER_EN.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    TIMER_MODE = uvm_reg_field::type_id::create("TIMER_MODE");
    TIMER_MODE.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class INPUT_DATA_REG extends uvm_reg;
  `uvm_object_utils(INPUT_DATA_REG)

  rand uvm_reg_field DATA_MSB;
  rand uvm_reg_field DATA_LSB;
  rand uvm_reg_field STATUS;
  rand uvm_reg_field RESERVED;

  function new (string name = "INPUT_DATA_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DATA_MSB = uvm_reg_field::type_id::create("DATA_MSB");
    DATA_MSB.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DATA_LSB = uvm_reg_field::type_id::create("DATA_LSB");
    DATA_LSB.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    STATUS = uvm_reg_field::type_id::create("STATUS");
    STATUS.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RO"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(0), .individually_accessible(1)
    );

    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    RESERVED.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class OUTPUT_DATA_REG extends uvm_reg;
  `uvm_object_utils(OUTPUT_DATA_REG)

  rand uvm_reg_field DATA_MSB;
  rand uvm_reg_field DATA_LSB;
  rand uvm_reg_field STATUS;
  rand uvm_reg_field RESERVED;

  function new (string name = "OUTPUT_DATA_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DATA_MSB = uvm_reg_field::type_id::create("DATA_MSB");
    DATA_MSB.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DATA_LSB = uvm_reg_field::type_id::create("DATA_LSB");
    DATA_LSB.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    STATUS = uvm_reg_field::type_id::create("STATUS");
    STATUS.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RO"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(0), .individually_accessible(1)
    );

    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    RESERVED.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class DMA_CTRL_REG extends uvm_reg;
  `uvm_object_utils(DMA_CTRL_REG)

  rand uvm_reg_field DMA_EN;
  rand uvm_reg_field DMA_SRC;
  rand uvm_reg_field DMA_DST;
  rand uvm_reg_field DMA_SIZE;

  function new (string name = "DMA_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    DMA_EN = uvm_reg_field::type_id::create("DMA_EN");
    DMA_EN.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DMA_SRC = uvm_reg_field::type_id::create("DMA_SRC");
    DMA_SRC.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DMA_DST = uvm_reg_field::type_id::create("DMA_DST");
    DMA_DST.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    DMA_SIZE = uvm_reg_field::type_id::create("DMA_SIZE");
    DMA_SIZE.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

class SYS_CTRL_REG extends uvm_reg;
  `uvm_object_utils(SYS_CTRL_REG)

  rand uvm_reg_field SYS_RST;
  rand uvm_reg_field SYS_PWR;
  rand uvm_reg_field SYS_MODE;
  rand uvm_reg_field SYS_STATUS;

  function new (string name = "SYS_CTRL_REG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    

    SYS_RST = uvm_reg_field::type_id::create("SYS_RST");
    SYS_RST.configure(
      .parent(this), .size(8), .lsb_pos(24),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    SYS_PWR = uvm_reg_field::type_id::create("SYS_PWR");
    SYS_PWR.configure(
      .parent(this), .size(8), .lsb_pos(16),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    SYS_MODE = uvm_reg_field::type_id::create("SYS_MODE");
    SYS_MODE.configure(
      .parent(this), .size(8), .lsb_pos(8),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    SYS_STATUS = uvm_reg_field::type_id::create("SYS_STATUS");
    SYS_STATUS.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"), .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
  endfunction
endclass

  
endpackage