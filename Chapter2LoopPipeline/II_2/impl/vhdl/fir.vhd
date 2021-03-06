-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    y : OUT STD_LOGIC_VECTOR (31 downto 0);
    y_ap_vld : OUT STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of fir is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_fir,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu5p-flva2104-1-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.772000,HLS_SYN_LAT=46,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=126,HLS_SYN_LUT=269,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv5_A : STD_LOGIC_VECTOR (4 downto 0) := "01010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv5_1F : STD_LOGIC_VECTOR (4 downto 0) := "11111";
    constant ap_const_lv32_35 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110101";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal shift_reg_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal shift_reg_ce0 : STD_LOGIC;
    signal shift_reg_we0 : STD_LOGIC;
    signal shift_reg_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal shift_reg_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal c_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_ce0 : STD_LOGIC;
    signal c_q0 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln10_fu_161_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln10_reg_234 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln10_fu_155_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal tmp_fu_177_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln17_fu_191_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal acc_3_fu_207_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reg_119 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal i_1_reg_131 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal acc_reg_143 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln11_fu_167_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln10_fu_172_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln17_fu_185_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal mul_ln18_fu_201_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln27_fu_213_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal mul_ln27_fu_213_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component fir_mul_10s_32s_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (9 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_mul_32s_7ns_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (6 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_shift_reg IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_c IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (9 downto 0) );
    end component;



begin
    shift_reg_U : component fir_shift_reg
    generic map (
        DataWidth => 32,
        AddressRange => 11,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => shift_reg_address0,
        ce0 => shift_reg_ce0,
        we0 => shift_reg_we0,
        d0 => shift_reg_d0,
        q0 => shift_reg_q0);

    c_U : component fir_c
    generic map (
        DataWidth => 10,
        AddressRange => 11,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => c_address0,
        ce0 => c_ce0,
        q0 => c_q0);

    mul_10s_32s_32_1_1_U1 : component fir_mul_10s_32s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 10,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => c_q0,
        din1 => shift_reg_q0,
        dout => mul_ln18_fu_201_p2);

    mul_32s_7ns_32_1_1_U2 : component fir_mul_32s_7ns_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 7,
        dout_WIDTH => 32)
    port map (
        din0 => x,
        din1 => mul_ln27_fu_213_p1,
        dout => mul_ln27_fu_213_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    acc_reg_143_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                acc_reg_143 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                acc_reg_143 <= acc_3_fu_207_p2;
            end if; 
        end if;
    end process;

    i_1_reg_131_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                i_1_reg_131 <= ap_const_lv5_A;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                i_1_reg_131 <= add_ln17_fu_191_p2;
            end if; 
        end if;
    end process;

    i_reg_119_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_119 <= ap_const_lv4_A;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                i_reg_119 <= add_ln10_reg_234;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln10_fu_155_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                add_ln10_reg_234 <= add_ln10_fu_161_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln10_fu_155_p2, ap_CS_fsm_state5, tmp_fu_177_p3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln10_fu_155_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((tmp_fu_177_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    acc_3_fu_207_p2 <= std_logic_vector(unsigned(mul_ln18_fu_201_p2) + unsigned(acc_reg_143));
    add_ln10_fu_161_p2 <= std_logic_vector(unsigned(i_reg_119) + unsigned(ap_const_lv4_F));
    add_ln17_fu_191_p2 <= std_logic_vector(unsigned(i_1_reg_131) + unsigned(ap_const_lv5_1F));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);

    ap_done_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    c_address0 <= zext_ln17_fu_185_p1(4 - 1 downto 0);

    c_ce0_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            c_ce0 <= ap_const_logic_1;
        else 
            c_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln10_fu_155_p2 <= "1" when (i_reg_119 = ap_const_lv4_0) else "0";
    mul_ln27_fu_213_p1 <= ap_const_lv32_35(7 - 1 downto 0);

    shift_reg_address0_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state3, ap_CS_fsm_state4, zext_ln11_fu_167_p1, zext_ln10_fu_172_p1, zext_ln17_fu_185_p1, ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            shift_reg_address0 <= zext_ln17_fu_185_p1(4 - 1 downto 0);
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            shift_reg_address0 <= ap_const_lv4_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            shift_reg_address0 <= zext_ln10_fu_172_p1(4 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            shift_reg_address0 <= zext_ln11_fu_167_p1(4 - 1 downto 0);
        else 
            shift_reg_address0 <= "XXXX";
        end if; 
    end process;


    shift_reg_ce0_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            shift_reg_ce0 <= ap_const_logic_1;
        else 
            shift_reg_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    shift_reg_d0_assign_proc : process(x, shift_reg_q0, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            shift_reg_d0 <= x;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            shift_reg_d0 <= shift_reg_q0;
        else 
            shift_reg_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    shift_reg_we0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state7)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            shift_reg_we0 <= ap_const_logic_1;
        else 
            shift_reg_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_177_p3 <= i_1_reg_131(4 downto 4);
    y <= std_logic_vector(unsigned(acc_reg_143) + unsigned(mul_ln27_fu_213_p2));

    y_ap_vld_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            y_ap_vld <= ap_const_logic_1;
        else 
            y_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln10_fu_172_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_119),64));
    zext_ln11_fu_167_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln10_fu_161_p2),64));
    zext_ln17_fu_185_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_1_reg_131),64));
end behav;
