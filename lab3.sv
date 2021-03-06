// ELEX 7660 202010 Lab 3
// Use 4x4 keypad for ADC channel selection and ouput result on 7-seg LED display
// Robert Trost 2020/1/21

module lab3 (  output logic [3:0] kpc,  // column select, active-low
              (* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
              input logic  [3:0] kpr,  // rows, active-low w/ pull-ups
			  output logic [7:0] leds, // active-low LED segments 
              output logic [3:0] ct,   // " digit enables
			  output logic [7:0] LED,  // 8 green LEDS next to ethernet connector
			  output ADC_CONVST, ADC_SCK, ADC_SDI,  // ADC interface
              input ADC_SDO,
              input logic  reset_n, CLOCK_50 ) ;

   logic clk ;              // clock
   logic [11:0] adcValue;   // ADC result    
   logic [3:0] displayNum;	// number to display on 7-seg
   logic [3:0] kpNum; 		// keypad output
   logic [1:0] digit;       // 7-seg display digit currently selected
   logic [7:0] delayCnt;    // delay count to slow down digit cycling on display
   logic kphit;             // keypad button press indicator
   
   pll pll0 ( .inclk0(CLOCK_50), .c0(clk) ) ;
   
   // use 8 leds on the board to show the key pressed and analog result info
   assign LED[7:4] = adcValue[11:8];
   assign LED[3:0] = kpNum;
  
   // modules from labs 1 & 2
   decode7 decode7_0 (.num(displayNum), .leds) ;
   kpdecode kpdecode_0 (.num(kpNum), .kphit, .kpr, .kpc) ;
   colseq  colseq_0  (.kpc, .kpr, .reset_n, .clk) ;
 
   // ADC interface module
   adcinterface(.clk, .reset_n, .chan(kpNum[2:0]),.result(adcValue),
	.ADC_CONVST, .ADC_SCK, .ADC_SDI, .ADC_SDO 
);
	
	// Logic to output the three hex digits of the ADC result to the 4 digit seven segment display

	// cycle through the three hex digits in the 12-bit ADC result displaying one at a time
    always_ff @(posedge clk) begin
	// only switch to next digit when count rolls over for crisp display
	delayCnt <= delayCnt + 1'b1;  
	if (delayCnt == 0)
		if (digit >= 2)
			digit <= '0;
		else
			digit <= digit + 1'b1 ;
	end

    // enable the 7-segment module for the selected digit	
    assign ct =  1'b1 << digit;

    // select the bits from the 12-bit ADC result for the selected digit	
	always_comb
	case( digit )
        2 : displayNum = adcValue[11:8] ;
        1 : displayNum = adcValue[7:4] ;
        0 : displayNum = adcValue[3:0] ;
		default: 
           displayNum = 'hf ; 
    endcase
	

endmodule



// megafunction wizard: %ALTPLL%
// ...
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ...

module pll ( inclk0, c0);

        input     inclk0;
        output    c0;

        wire [0:0] sub_wire2 = 1'h0;
        wire [4:0] sub_wire3;
        wire  sub_wire0 = inclk0;
        wire [1:0] sub_wire1 = {sub_wire2, sub_wire0};
        wire [0:0] sub_wire4 = sub_wire3[0:0];
        wire  c0 = sub_wire4;

        altpll altpll_component ( .inclk (sub_wire1), .clk
          (sub_wire3), .activeclock (), .areset (1'b0), .clkbad
          (), .clkena ({6{1'b1}}), .clkloss (), .clkswitch
          (1'b0), .configupdate (1'b0), .enable0 (), .enable1 (),
          .extclk (), .extclkena ({4{1'b1}}), .fbin (1'b1),
          .fbmimicbidir (), .fbout (), .fref (), .icdrclk (),
          .locked (), .pfdena (1'b1), .phasecounterselect
          ({4{1'b1}}), .phasedone (), .phasestep (1'b1),
          .phaseupdown (1'b1), .pllena (1'b1), .scanaclr (1'b0),
          .scanclk (1'b0), .scanclkena (1'b1), .scandata (1'b0),
          .scandataout (), .scandone (), .scanread (1'b0),
          .scanwrite (1'b0), .sclkout0 (), .sclkout1 (),
          .vcooverrange (), .vcounderrange ());

        defparam
                altpll_component.bandwidth_type = "AUTO",
                altpll_component.clk0_divide_by = 25000,
                altpll_component.clk0_duty_cycle = 50,
                altpll_component.clk0_multiply_by = 1,
                altpll_component.clk0_phase_shift = "0",
                altpll_component.compensate_clock = "CLK0",
                altpll_component.inclk0_input_frequency = 20000,
                altpll_component.intended_device_family = "Cyclone IV E",
                altpll_component.lpm_hint = "CBX_MODULE_PREFIX=lab1clk",
                altpll_component.lpm_type = "altpll",
                altpll_component.operation_mode = "NORMAL",
                altpll_component.pll_type = "AUTO",
                altpll_component.port_activeclock = "PORT_UNUSED",
                altpll_component.port_areset = "PORT_UNUSED",
                altpll_component.port_clkbad0 = "PORT_UNUSED",
                altpll_component.port_clkbad1 = "PORT_UNUSED",
                altpll_component.port_clkloss = "PORT_UNUSED",
                altpll_component.port_clkswitch = "PORT_UNUSED",
                altpll_component.port_configupdate = "PORT_UNUSED",
                altpll_component.port_fbin = "PORT_UNUSED",
                altpll_component.port_inclk0 = "PORT_USED",
                altpll_component.port_inclk1 = "PORT_UNUSED",
                altpll_component.port_locked = "PORT_UNUSED",
                altpll_component.port_pfdena = "PORT_UNUSED",
                altpll_component.port_phasecounterselect = "PORT_UNUSED",
                altpll_component.port_phasedone = "PORT_UNUSED",
                altpll_component.port_phasestep = "PORT_UNUSED",
                altpll_component.port_phaseupdown = "PORT_UNUSED",
                altpll_component.port_pllena = "PORT_UNUSED",
                altpll_component.port_scanaclr = "PORT_UNUSED",
                altpll_component.port_scanclk = "PORT_UNUSED",
                altpll_component.port_scanclkena = "PORT_UNUSED",
                altpll_component.port_scandata = "PORT_UNUSED",
                altpll_component.port_scandataout = "PORT_UNUSED",
                altpll_component.port_scandone = "PORT_UNUSED",
                altpll_component.port_scanread = "PORT_UNUSED",
                altpll_component.port_scanwrite = "PORT_UNUSED",
                altpll_component.port_clk0 = "PORT_USED",
                altpll_component.port_clk1 = "PORT_UNUSED",
                altpll_component.port_clk2 = "PORT_UNUSED",
                altpll_component.port_clk3 = "PORT_UNUSED",
                altpll_component.port_clk4 = "PORT_UNUSED",
                altpll_component.port_clk5 = "PORT_UNUSED",
                altpll_component.port_clkena0 = "PORT_UNUSED",
                altpll_component.port_clkena1 = "PORT_UNUSED",
                altpll_component.port_clkena2 = "PORT_UNUSED",
                altpll_component.port_clkena3 = "PORT_UNUSED",
                altpll_component.port_clkena4 = "PORT_UNUSED",
                altpll_component.port_clkena5 = "PORT_UNUSED",
                altpll_component.port_extclk0 = "PORT_UNUSED",
                altpll_component.port_extclk1 = "PORT_UNUSED",
                altpll_component.port_extclk2 = "PORT_UNUSED",
                altpll_component.port_extclk3 = "PORT_UNUSED",
                altpll_component.width_clock = 5;


endmodule

