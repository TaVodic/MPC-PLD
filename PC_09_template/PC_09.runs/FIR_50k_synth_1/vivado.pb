
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:052default:default2
00:00:062default:default2
1265.7502default:default2
0.0002default:defaultZ17-268h px� 
�
Command: %s
53*	vivadotcl2n
Zsynth_design -top FIR_50k -part xc7z010clg400-1 -incremental_mode off -mode out_of_context2default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7z010clg400-12default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
128322default:defaultZ8-7075h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1265.750 ; gain = 0.000
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
FIR_50k2default:default2]
Gc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/synth/FIR_50k.vhd2default:default2
702default:default8@Z8-638h px� 
f
%s
*synth2N
:	Parameter C_XDEVICEFAMILY bound to: zynq - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_ELABORATION_DIR bound to: ./ - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_COMPONENT_NAME bound to: FIR_50k - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_COEF_FILE bound to: FIR_50k.mif - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_COEF_FILE_LINES bound to: 32 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_FILTER_TYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_INTERP_RATE bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_DECIM_RATE bound to: 1 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_ZERO_PACKING_FACTOR bound to: 1 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_SYMMETRY bound to: 1 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_NUM_FILTS bound to: 1 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_NUM_TAPS bound to: 60 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_CHANNELS bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_CHANNEL_PATTERN bound to: fixed - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_ROUND_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_COEF_RELOAD bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_RELOAD_SLOTS bound to: 1 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_COL_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_COL_PIPE_LEN bound to: 4 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_COL_CONFIG bound to: 4 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_OPTIMIZATION bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_DATA_PATH_WIDTHS bound to: 9 - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_DATA_IP_PATH_WIDTHS bound to: 9 - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_DATA_PX_PATH_WIDTHS bound to: 9 - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_DATA_WIDTH bound to: 9 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_COEF_PATH_WIDTHS bound to: 12 - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_COEF_WIDTH bound to: 12 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_DATA_PATH_SRC bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_COEF_PATH_SRC bound to: 0 - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_PX_PATH_SRC bound to: 0 - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_DATA_PATH_SIGN bound to: 0 - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_COEF_PATH_SIGN bound to: 0 - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_ACCUM_PATH_WIDTHS bound to: 24 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_OUTPUT_WIDTH bound to: 9 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_OUTPUT_PATH_WIDTHS bound to: 9 - type: string 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_ACCUM_OP_PATH_WIDTHS bound to: 24 - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_EXT_MULT_CNFG bound to: none - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_DATA_PATH_PSAMP_SRC bound to: 0 - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_OP_PATH_PSAMP_SRC bound to: 0 - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_NUM_MADDS bound to: 4 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_OPT_MADDS bound to: none - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_OVERSAMPLING_RATE bound to: 8 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_INPUT_RATE bound to: 8 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_OUTPUT_RATE bound to: 8 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_DATA_MEMTYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_COEF_MEMTYPE bound to: 2 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_IPBUFF_MEMTYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_OPBUFF_MEMTYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_DATAPATH_MEMTYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_MEM_ARRANGEMENT bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_DATA_MEM_PACKING bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_COEF_MEM_PACKING bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_FILTS_PACKED bound to: 0 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_LATENCY bound to: 19 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_HAS_ARESETn bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_HAS_ACLKEN bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_DATA_HAS_TLAST bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_S_DATA_HAS_FIFO bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_S_DATA_HAS_TUSER bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_S_DATA_TDATA_WIDTH bound to: 16 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_S_DATA_TUSER_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_M_DATA_HAS_TREADY bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_M_DATA_HAS_TUSER bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_M_DATA_TDATA_WIDTH bound to: 16 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_M_DATA_TUSER_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_HAS_CONFIG_CHANNEL bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_CONFIG_SYNC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_CONFIG_PACKET_SIZE bound to: 0 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_CONFIG_TDATA_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter C_RELOAD_TDATA_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2(
fir_compiler_v7_2_182default:default2j
Vc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/hdl/fir_compiler_v7_2_vh_rfs.vhd2default:default2
671132default:default2
U02default:default2(
fir_compiler_v7_2_182default:default2]
Gc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/synth/FIR_50k.vhd2default:default2
1982default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
FIR_50k2default:default2
02default:default2
12default:default2]
Gc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/synth/FIR_50k.vhd2default:default2
702default:default8@Z8-256h px� 
�
�RAM %s from Abstract Data Type (record/struct) for this pattern/configuration is not supported. This will most likely be implemented in registers
4277*oasys2"
p_path_out_reg2default:defaultZ8-5858h px� 
�
KPotential Runtime issue for 3D-RAM or RAM from Record/Structs for RAM  %s 
6483*oasys2"
p_path_out_reg2default:defaultZ8-10225h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR2default:default2*
delay__parameterized182default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR_ALT2default:default2*
delay__parameterized182default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR2default:default2*
delay__parameterized172default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR_ALT2default:default2*
delay__parameterized172default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
WE2default:default2*
delay__parameterized162default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CE2default:default2*
delay__parameterized162default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR2default:default2*
delay__parameterized162default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR_ALT2default:default2*
delay__parameterized162default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CLK2default:default2*
delay__parameterized162default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
WE2default:default2*
delay__parameterized152default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CE2default:default2*
delay__parameterized152default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR2default:default2*
delay__parameterized152default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR_ALT2default:default2*
delay__parameterized152default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CLK2default:default2*
delay__parameterized152default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

PRE_ADDSUB2default:default2(
calc__parameterized02default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
PRE_ADD_BYPASS2default:default2(
calc__parameterized02default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CED2default:default2(
calc__parameterized02default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
WE2default:default2*
delay__parameterized142default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CE2default:default2*
delay__parameterized142default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR2default:default2*
delay__parameterized142default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
SCLR_ALT2default:default2*
delay__parameterized142default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
CLK2default:default2*
delay__parameterized142default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][57]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][56]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][55]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][54]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][53]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][52]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][51]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][50]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][49]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
POUT[fab][48]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][62]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][61]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][60]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][59]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][58]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][57]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][56]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][55]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][54]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][53]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][52]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][51]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][50]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][49]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2"
POUT[casc][48]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][57]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][56]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][55]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][54]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][53]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][52]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][51]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][50]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][49]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][48]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][47]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][46]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][45]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][44]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][43]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][42]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][41]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][40]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][39]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][38]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][37]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][36]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][35]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][34]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][33]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][32]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][31]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][30]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][29]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][28]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][27]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][26]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][25]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][24]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][23]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][22]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][21]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][20]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][19]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][18]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][17]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][16]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][15]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][14]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][13]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][12]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][11]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
PIN[fab][10]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PIN[fab][9]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PIN[fab][8]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PIN[fab][7]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PIN[fab][6]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PIN[fab][5]2default:default2
	add_accum2default:defaultZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:22 ; elapsed = 00:00:25 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:22 ; elapsed = 00:00:25 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:22 ; elapsed = 00:00:25 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0592default:default2
1398.2702default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
52default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2[
Ec:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/FIR_50k_ooc.xdc2default:default2
U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2[
Ec:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/FIR_50k_ooc.xdc2default:default2
U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2m
Wc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/constraints/fir_compiler_v7_2.xdc2default:default2
U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2m
Wc:/Temp/240703/PLD/PC_09_template/SOURCES/SIM/FIR_50k/constraints/fir_compiler_v7_2.xdc2default:default2
U0	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2a
KC:/Temp/240703/PLD/PC_09_template/PC_09.runs/FIR_50k_synth_1/dont_touch.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2a
KC:/Temp/240703/PLD/PC_09_template/PC_09.runs/FIR_50k_synth_1/dont_touch.xdc2default:default8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1398.2702default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0572default:default2
1398.2702default:default2
0.0002default:defaultZ17-268h px� 
c
!Incremental synthesis strategy %s2274*designutils2
off2default:defaultZ20-5008h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:32 ; elapsed = 00:00:36 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7z010clg400-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:32 ; elapsed = 00:00:36 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:36 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:33 ; elapsed = 00:00:37 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2n
ZU0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_cntrl_signals[0].i_delay2default:default2)
delay__parameterized42default:default2n
ZU0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_cntrl_signals[1].i_delay2default:defaultZ8-223h px� 
�
$decloning instance '%s' (%s) to '%s'223*oasys2n
ZU0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_cntrl_signals[4].i_delay2default:default2)
delay__parameterized52default:default2n
ZU0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_cntrl_signals[5].i_delay2default:defaultZ8-223h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:35 ; elapsed = 00:00:40 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:47 ; elapsed = 00:00:52 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:47 ; elapsed = 00:00:52 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:48 ; elapsed = 00:00:53 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
i
%s
*synth2Q
=
DSP Final Report (the ' indicates corresponding REG is set)
2default:defaulth p
x
� 
�
%s
*synth2�
�+---------------------+------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|Module Name          | DSP Mapping            | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+---------------------+------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|calc__parameterized0 | Dynamic                | -      | -      | -      | -      | 48     | -    | -    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|calc_7               | (C'+((D'+A')'*B')')'   | 30     | 18     | 0      | 25     | 48     | 1    | 1    | 1    | 1    | 1     | 1    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|calc_6               | (PCIN+((D'+A')'*B')')' | 30     | 9      | -      | 25     | 48     | 1    | 1    | -    | 1    | 1     | 1    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|calc_5               | (PCIN+((D'+A')'*B')')' | 30     | 10     | -      | 25     | 48     | 1    | 1    | -    | 1    | 1     | 1    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|calc                 | (PCIN+((D'+A')'*B')')' | 30     | 11     | -      | 25     | 48     | 1    | 1    | -    | 1    | 1     | 1    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+---------------------+------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|      |Cell    |Count |
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|1     |DSP48E1 |     5|
2default:defaulth px� 
E
%s*synth2-
|3     |LUT1    |     1|
2default:defaulth px� 
E
%s*synth2-
|4     |LUT2    |     9|
2default:defaulth px� 
E
%s*synth2-
|5     |LUT3    |    34|
2default:defaulth px� 
E
%s*synth2-
|6     |LUT4    |     4|
2default:defaulth px� 
E
%s*synth2-
|7     |LUT5    |     1|
2default:defaulth px� 
E
%s*synth2-
|8     |LUT6    |     1|
2default:defaulth px� 
E
%s*synth2-
|9     |SRL16E  |    80|
2default:defaulth px� 
E
%s*synth2-
|10    |FDRE    |   222|
2default:defaulth px� 
E
%s*synth2-
|11    |FDSE    |     3|
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 83 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:29 ; elapsed = 00:00:56 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:54 ; elapsed = 00:00:59 . Memory (MB): peak = 1398.270 ; gain = 132.520
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0262default:default2
1398.2702default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
52default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1398.2702default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
c0333ea52default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
1032default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:002default:default2
00:01:072default:default2
1398.2702default:default2
132.5202default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HC:/Temp/240703/PLD/PC_09_template/PC_09.runs/FIR_50k_synth_1/FIR_50k.dcp2default:defaultZ17-1381h px� 
�
<Added synthesis output to IP cache for IP %s, cache-ID = %s
485*coretcl2
FIR_50k2default:default2$
a183dd008d4ed24e2default:defaultZ2-1648h px� 
Q
Renamed %s cell refs.
330*coretcl2
542default:defaultZ2-1174h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HC:/Temp/240703/PLD/PC_09_template/PC_09.runs/FIR_50k_synth_1/FIR_50k.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2x
dExecuting : report_utilization -file FIR_50k_utilization_synth.rpt -pb FIR_50k_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Apr 10 08:56:37 20252default:defaultZ17-206h px� 


End Record