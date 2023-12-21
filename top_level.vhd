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
		dig_sel		: out	std_logic_vector( 3 downto 0 );
		seg7_code	: out	std_logic_vector( 7 downto 0 )
	);
	
end top_level;


architecture arch of top_level is

	signal top_sda_in, top_sda_oe	: std_logic;
	signal top_scl_in, top_scl_oe : std_logic;
	
	
	 component simple_struct is
        port (
			clk_clk            : in  std_logic                    := 'X'; -- clk
			dig_sel_readdata   : out std_logic_vector(3 downto 0);        -- readdata
			leds_leds          : out std_logic_vector(3 downto 0);        -- leds
			port_sel7_readdata : out std_logic_vector(7 downto 0);        -- readdata
			reset_reset_n      : in  std_logic                    := 'X'; -- reset_n
			scl_in             : in  std_logic                    := 'X'; -- in
			scl_oe             : out std_logic;                           -- oe
			sda_in             : in  std_logic                    := 'X'; -- in
			sda_oe             : out std_logic;                           -- oe
			usart_rxd          : in  std_logic                    := 'X'; -- rxd
			usart_txd          : out std_logic;                           -- txd
			controller_0_keys_key_read          : in  std_logic                    := 'X'  -- key_read
		);
    end component simple_struct;

begin
	
	 u0 : component simple_struct
        port map (
            clk_clk       => clk, 				--   clk.clk
            leds_leds     =>  leds_out, 		--      .leds
            reset_reset_n =>  en, 				-- reset.reset_n
            scl_in        =>  top_scl_in,		--   scl.in
            scl_oe        =>  top_scl_oe,		--      .oe
            sda_in        =>  top_sda_in,		--   sda.in
            sda_oe        =>  top_sda_oe,		--      .oe
            usart_rxd     =>  RXD,				-- usart.rxd
            usart_txd     =>  TXD,				--      .txd
				dig_sel_readdata   => dig_sel,   --   dig_sel.readdata
				port_sel7_readdata => seg7_code,  -- port_sel7.readdata
				controller_0_keys_key_read       => key        --       key.key_read
        );
	
	
	SDA <= '0' when top_sda_oe = '1' else 'Z';
	top_sda_in <= SDA;
	
	SCL <= '0' when top_scl_oe = '1' else 'Z';
	top_scl_in <= SCL;


end arch;