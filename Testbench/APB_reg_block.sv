package APB_reg_block_pkg;
  
import uvm_pkg::*;
`include "uvm_macros.svh"
import APB_reg_pkg::*;

////	Register Block
class APB_reg_block extends uvm_reg_block;
  `uvm_object_utils(APB_reg_block)
  
  // register instances 
  rand SYS_STATUS_REG reg_SYS_STATUS_REG;
  rand INT_CTRL_REG reg_INT_CTRL_REG;
  rand DEV_ID_REG reg_DEV_ID_REG;
  rand MEM_CTRL_REG reg_MEM_CTRL_REG;
  rand TEMP_SENSOR_REG reg_TEMP_SENSOR_REG;
  rand ADC_CTRL_REG reg_ADC_CTRL_REG;
  rand DBG_CTRL_REG reg_DBG_CTRL_REG;
  rand GPIO_DATA_REG reg_GPIO_DATA_REG;
  rand DAC_OUTPUT_REG reg_DAC_OUTPUT_REG;
  rand VOLTAGE_CTRL_REG reg_VOLTAGE_CTRL_REG;
  rand CLK_CONFIG_REG reg_CLK_CONFIG_REG;
  rand TIMER_COUNT_REG reg_TIMER_COUNT_REG;
  rand INPUT_DATA_REG reg_INPUT_DATA_REG;
  rand OUTPUT_DATA_REG reg_OUTPUT_DATA_REG;
  rand DMA_CTRL_REG reg_DMA_CTRL_REG;
  rand SYS_CTRL_REG reg_SYS_CTRL_REG;

  
  function new (string name = "APB_reg_block");
    super.new(name, build_coverage(UVM_NO_COVERAGE));
  endfunction

  function void build();
  
        reg_SYS_STATUS_REG = SYS_STATUS_REG::type_id::create("reg_SYS_STATUS_REG");
        reg_SYS_STATUS_REG.build();
        reg_SYS_STATUS_REG.configure(this);

        reg_INT_CTRL_REG = INT_CTRL_REG::type_id::create("reg_INT_CTRL_REG");
        reg_INT_CTRL_REG.build();
        reg_INT_CTRL_REG.configure(this);

        reg_DEV_ID_REG = DEV_ID_REG::type_id::create("reg_DEV_ID_REG");
        reg_DEV_ID_REG.build();
        reg_DEV_ID_REG.configure(this);

        reg_MEM_CTRL_REG = MEM_CTRL_REG::type_id::create("reg_MEM_CTRL_REG");
        reg_MEM_CTRL_REG.build();
        reg_MEM_CTRL_REG.configure(this);

        reg_TEMP_SENSOR_REG = TEMP_SENSOR_REG::type_id::create("reg_TEMP_SENSOR_REG");
        reg_TEMP_SENSOR_REG.build();
        reg_TEMP_SENSOR_REG.configure(this);

        reg_ADC_CTRL_REG = ADC_CTRL_REG::type_id::create("reg_ADC_CTRL_REG");
        reg_ADC_CTRL_REG.build();
        reg_ADC_CTRL_REG.configure(this);

        reg_DBG_CTRL_REG = DBG_CTRL_REG::type_id::create("reg_DBG_CTRL_REG");
        reg_DBG_CTRL_REG.build();
        reg_DBG_CTRL_REG.configure(this);

        reg_GPIO_DATA_REG = GPIO_DATA_REG::type_id::create("reg_GPIO_DATA_REG");
        reg_GPIO_DATA_REG.build();
        reg_GPIO_DATA_REG.configure(this);

        reg_DAC_OUTPUT_REG = DAC_OUTPUT_REG::type_id::create("reg_DAC_OUTPUT_REG");
        reg_DAC_OUTPUT_REG.build();
        reg_DAC_OUTPUT_REG.configure(this);

        reg_VOLTAGE_CTRL_REG = VOLTAGE_CTRL_REG::type_id::create("reg_VOLTAGE_CTRL_REG");
        reg_VOLTAGE_CTRL_REG.build();
        reg_VOLTAGE_CTRL_REG.configure(this);

        reg_CLK_CONFIG_REG = CLK_CONFIG_REG::type_id::create("reg_CLK_CONFIG_REG");
        reg_CLK_CONFIG_REG.build();
        reg_CLK_CONFIG_REG.configure(this);

        reg_TIMER_COUNT_REG = TIMER_COUNT_REG::type_id::create("reg_TIMER_COUNT_REG");
        reg_TIMER_COUNT_REG.build();
        reg_TIMER_COUNT_REG.configure(this);

        reg_INPUT_DATA_REG = INPUT_DATA_REG::type_id::create("reg_INPUT_DATA_REG");
        reg_INPUT_DATA_REG.build();
        reg_INPUT_DATA_REG.configure(this);

        reg_OUTPUT_DATA_REG = OUTPUT_DATA_REG::type_id::create("reg_OUTPUT_DATA_REG");
        reg_OUTPUT_DATA_REG.build();
        reg_OUTPUT_DATA_REG.configure(this);

        reg_DMA_CTRL_REG = DMA_CTRL_REG::type_id::create("reg_DMA_CTRL_REG");
        reg_DMA_CTRL_REG.build();
        reg_DMA_CTRL_REG.configure(this);

        reg_SYS_CTRL_REG = SYS_CTRL_REG::type_id::create("reg_SYS_CTRL_REG");
        reg_SYS_CTRL_REG.build();
        reg_SYS_CTRL_REG.configure(this);

        // For Backdoor
        add_hdl_path("top.sys_level.reg_file", "RTL");
        reg_SYS_STATUS_REG.add_hdl_path_slice("SYS_STATUS_REG",0,32);
        reg_INT_CTRL_REG.add_hdl_path_slice("INT_CTRL_REG",0,32);
        reg_DEV_ID_REG.add_hdl_path_slice("DEV_ID_REG",0,32);
        reg_MEM_CTRL_REG.add_hdl_path_slice("MEM_CTRL_REG",0,32);
        reg_TEMP_SENSOR_REG.add_hdl_path_slice("TEMP_SENSOR_REG",0,32);
        reg_ADC_CTRL_REG.add_hdl_path_slice("ADC_CTRL_REG",0,32);
        reg_DBG_CTRL_REG.add_hdl_path_slice("DBG_CTRL_REG",0,32);
        reg_GPIO_DATA_REG.add_hdl_path_slice("GPIO_DATA_REG",0,32);
        reg_DAC_OUTPUT_REG.add_hdl_path_slice("DAC_OUTPUT_REG",0,32);
        reg_VOLTAGE_CTRL_REG.add_hdl_path_slice("VOLTAGE_CTRL_REG",0,32);
        reg_CLK_CONFIG_REG.add_hdl_path_slice("CLK_CONFIG_REG",0,32);
        reg_TIMER_COUNT_REG.add_hdl_path_slice("TIMER_COUNT_REG",0,32);
        reg_INPUT_DATA_REG.add_hdl_path_slice("INPUT_DATA_REG",0,32);
        reg_OUTPUT_DATA_REG.add_hdl_path_slice("OUTPUT_DATA_REG",0,32);
        reg_DMA_CTRL_REG.add_hdl_path_slice("DMA_CTRL_REG",0,32);
        reg_SYS_CTRL_REG.add_hdl_path_slice("SYS_CTRL_REG",0,32);
        
        // Create the map
        default_map=create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
        default_map.add_reg(reg_SYS_STATUS_REG,   32'h0000_0000, "RW");
        default_map.add_reg(reg_INT_CTRL_REG,     32'h0000_0004, "RW");
        default_map.add_reg(reg_DEV_ID_REG,       32'h0000_0008, "RW");
        default_map.add_reg(reg_MEM_CTRL_REG,     32'h0000_000c, "RW");
        default_map.add_reg(reg_TEMP_SENSOR_REG,  32'h0000_0010, "RW");
        default_map.add_reg(reg_ADC_CTRL_REG,     32'h0000_0014, "RW");
        default_map.add_reg(reg_DBG_CTRL_REG,     32'h0000_0018, "RW");
        default_map.add_reg(reg_GPIO_DATA_REG,    32'h0000_001c, "RW");
        default_map.add_reg(reg_DAC_OUTPUT_REG,     32'h0000_0020, "RW");
        default_map.add_reg(reg_VOLTAGE_CTRL_REG, 32'h0000_0024, "RW");
        default_map.add_reg(reg_CLK_CONFIG_REG,   32'h0000_0028, "RW");
        default_map.add_reg(reg_TIMER_COUNT_REG,  32'h0000_002c, "RW");
        default_map.add_reg(reg_INPUT_DATA_REG,   32'h0000_0030, "RW");
        default_map.add_reg(reg_OUTPUT_DATA_REG,  32'h0000_0034, "RW");
        default_map.add_reg(reg_DMA_CTRL_REG,     32'h0000_0038, "RW");
        default_map.add_reg(reg_SYS_CTRL_REG,     32'h0000_003c, "RW");

        lock_model();
  endfunction
endclass
endpackage