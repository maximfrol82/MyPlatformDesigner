library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_level is
	port(
		
		clk       	: in	std_logic;
		en        	: in	std_logic;
		key        	: in	std_logic;
		leds_out	: out	std_logic_vector( 3 downto 0 );
		TXD			: out	std_logic;
		RXD			: in	std_logic;
		SDA			: inout std_logic;
		SCL			: inout	std_Logic;
		dig_sel	: out	std_logic_vector( 3 downto 0 );
		seg7_code	: out	std_logic_vector( 7 downto 0 )
	);
	
end top_level;


architecture arch of top_level is

	signal top_sda_in, top_sda_oe	: std_logic;
	signal top_scl_in, top_scl_oe 	: std_logic;
	
	
	 component simple_struct is
        port (
         clk_clk           : in  std_logic                     := 'X'; -- clk
			reset_reset_n     : in  std_logic                     := 'X'; -- reset_n
			display_seg7_code : out std_logic_vector(7 downto 0);        -- seg7_code
			dig_sel_dig_sel   : out std_logic_vector(3 downto 0);         -- dig_sel
			usart_rxd         : in  std_logic                     := 'X'; -- rxd
			usart_txd         : out std_logic;                            -- txd
			sda_in            : in  std_logic                     := 'X'; -- in
			sda_oe            : out std_logic;                            -- oe
			scl_in            : in  std_logic                     := 'X'; -- in
			scl_oe            : out std_logic;                            -- oe
			leds_leds         : out std_logic_vector(3 downto 0);         -- leds
			controller_0_key_key_lm75a : in  std_logic                    := 'X'  -- key_lm75a
        );
    end component simple_struct;

begin
	
	 u0 : component simple_struct
        port map (
            clk_clk       => clk, 				--   clk.clk
            leds_leds     =>  leds_out, 		--      .leds
            reset_reset_n =>  en, 				-- reset.reset_n
				display_seg7_code => seg7_code, -- display.seg7_code
				dig_sel_dig_sel   => dig_sel,   -- dig_sel.dig_sel
            scl_in        =>  top_scl_in,		--   scl.in
            scl_oe        =>  top_scl_oe,		--      .oe
            sda_in        =>  top_sda_in,		--   sda.in
            sda_oe        =>  top_sda_oe,		--      .oe
            usart_rxd     =>  RXD,				-- usart.rxd
            usart_txd     =>  TXD,				--      .txd
				controller_0_key_key_lm75a => key  -- controller_0_key.key_lm75a
        );
	

		
	SDA <= '0' when top_sda_oe = '1' else 'Z';
	top_sda_in <= SDA;
	
	SCL <= '0' when top_scl_oe = '1' else 'Z';
	top_scl_in <= SCL;


end arch;