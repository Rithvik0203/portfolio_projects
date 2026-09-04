onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Single_Cycle_CPU_tb/dut/clk
add wave -noupdate /Single_Cycle_CPU_tb/dut/reset
add wave -noupdate /Single_Cycle_CPU_tb/dut/instr_out
add wave -noupdate -expand -group REgisters -radix decimal -childformat {{{/Single_Cycle_CPU_tb/dut/reg_out[1]} -radix decimal -childformat {{{[63]} -radix decimal} {{[62]} -radix decimal} {{[61]} -radix decimal} {{[60]} -radix decimal} {{[59]} -radix decimal} {{[58]} -radix decimal} {{[57]} -radix decimal} {{[56]} -radix decimal} {{[55]} -radix decimal} {{[54]} -radix decimal} {{[53]} -radix decimal} {{[52]} -radix decimal} {{[51]} -radix decimal} {{[50]} -radix decimal} {{[49]} -radix decimal} {{[48]} -radix decimal} {{[47]} -radix decimal} {{[46]} -radix decimal} {{[45]} -radix decimal} {{[44]} -radix decimal} {{[43]} -radix decimal} {{[42]} -radix decimal} {{[41]} -radix decimal} {{[40]} -radix decimal} {{[39]} -radix decimal} {{[38]} -radix decimal} {{[37]} -radix decimal} {{[36]} -radix decimal} {{[35]} -radix decimal} {{[34]} -radix decimal} {{[33]} -radix decimal} {{[32]} -radix decimal} {{[31]} -radix decimal} {{[30]} -radix decimal} {{[29]} -radix decimal} {{[28]} -radix decimal} {{[27]} -radix decimal} {{[26]} -radix decimal} {{[25]} -radix decimal} {{[24]} -radix decimal} {{[23]} -radix decimal} {{[22]} -radix decimal} {{[21]} -radix decimal} {{[20]} -radix decimal} {{[19]} -radix decimal} {{[18]} -radix decimal} {{[17]} -radix decimal} {{[16]} -radix decimal} {{[15]} -radix decimal} {{[14]} -radix decimal} {{[13]} -radix decimal} {{[12]} -radix decimal} {{[11]} -radix decimal} {{[10]} -radix decimal} {{[9]} -radix decimal} {{[8]} -radix decimal} {{[7]} -radix decimal} {{[6]} -radix decimal} {{[5]} -radix decimal} {{[4]} -radix decimal} {{[3]} -radix decimal} {{[2]} -radix decimal} {{[1]} -radix decimal} {{[0]} -radix decimal}}} {{/Single_Cycle_CPU_tb/dut/reg_out[0]} -radix decimal}} -subitemconfig {{/Single_Cycle_CPU_tb/dut/reg_out[1]} {-radix decimal -childformat {{{[63]} -radix decimal} {{[62]} -radix decimal} {{[61]} -radix decimal} {{[60]} -radix decimal} {{[59]} -radix decimal} {{[58]} -radix decimal} {{[57]} -radix decimal} {{[56]} -radix decimal} {{[55]} -radix decimal} {{[54]} -radix decimal} {{[53]} -radix decimal} {{[52]} -radix decimal} {{[51]} -radix decimal} {{[50]} -radix decimal} {{[49]} -radix decimal} {{[48]} -radix decimal} {{[47]} -radix decimal} {{[46]} -radix decimal} {{[45]} -radix decimal} {{[44]} -radix decimal} {{[43]} -radix decimal} {{[42]} -radix decimal} {{[41]} -radix decimal} {{[40]} -radix decimal} {{[39]} -radix decimal} {{[38]} -radix decimal} {{[37]} -radix decimal} {{[36]} -radix decimal} {{[35]} -radix decimal} {{[34]} -radix decimal} {{[33]} -radix decimal} {{[32]} -radix decimal} {{[31]} -radix decimal} {{[30]} -radix decimal} {{[29]} -radix decimal} {{[28]} -radix decimal} {{[27]} -radix decimal} {{[26]} -radix decimal} {{[25]} -radix decimal} {{[24]} -radix decimal} {{[23]} -radix decimal} {{[22]} -radix decimal} {{[21]} -radix decimal} {{[20]} -radix decimal} {{[19]} -radix decimal} {{[18]} -radix decimal} {{[17]} -radix decimal} {{[16]} -radix decimal} {{[15]} -radix decimal} {{[14]} -radix decimal} {{[13]} -radix decimal} {{[12]} -radix decimal} {{[11]} -radix decimal} {{[10]} -radix decimal} {{[9]} -radix decimal} {{[8]} -radix decimal} {{[7]} -radix decimal} {{[6]} -radix decimal} {{[5]} -radix decimal} {{[4]} -radix decimal} {{[3]} -radix decimal} {{[2]} -radix decimal} {{[1]} -radix decimal} {{[0]} -radix decimal}}} {/Single_Cycle_CPU_tb/dut/reg_out[1][63]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][62]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][61]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][60]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][59]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][58]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][57]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][56]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][55]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][54]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][53]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][52]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][51]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][50]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][49]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][48]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][47]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][46]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][45]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][44]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][43]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][42]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][41]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][40]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][39]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][38]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][37]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][36]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][35]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][34]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][33]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][32]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][31]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][30]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][29]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][28]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][27]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][26]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][25]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][24]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][23]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][22]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][21]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][20]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][19]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][18]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][17]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][16]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][15]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][14]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][13]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][12]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][11]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][10]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][9]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][8]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][7]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][6]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][5]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][4]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][3]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][2]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][1]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[1][0]} {-radix decimal} {/Single_Cycle_CPU_tb/dut/reg_out[0]} {-radix decimal}} /Single_Cycle_CPU_tb/dut/reg_out
add wave -noupdate -expand -group REgisters /Single_Cycle_CPU_tb/dut/regf/out
add wave -noupdate /Single_Cycle_CPU_tb/dut/mux_out1
add wave -noupdate /Single_Cycle_CPU_tb/dut/mux_out2
add wave -noupdate /Single_Cycle_CPU_tb/dut/mux_out3
add wave -noupdate /Single_Cycle_CPU_tb/dut/sign_out
add wave -noupdate /Single_Cycle_CPU_tb/dut/shifter_out
add wave -noupdate -radix decimal /Single_Cycle_CPU_tb/dut/PC_out
add wave -noupdate -radix decimal /Single_Cycle_CPU_tb/dut/ALU_out
add wave -noupdate /Single_Cycle_CPU_tb/dut/Mem_out
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/ALUOpCtrl
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/BR_out
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/Reg2Loc
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/Branch
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/MemRead
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/MemtoReg
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/MemWrite
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/ALUSrc
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/RegWrite
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/BranchTaken
add wave -noupdate -expand -group {Control Flags} /Single_Cycle_CPU_tb/dut/Zero_Out
add wave -noupdate /Single_Cycle_CPU_tb/dut/ctrl/instr
add wave -noupdate -group mem /Single_Cycle_CPU_tb/dut/ctrl/MemRead
add wave -noupdate -group mem /Single_Cycle_CPU_tb/dut/ctrl/MemtoReg
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/AdderOut1
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/AdderOut2
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/out
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/in
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/carry_w1
add wave -noupdate -expand -group PC -radix decimal /Single_Cycle_CPU_tb/dut/pc/carry_w2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {159448690 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 121
configure wave -valuecolwidth 416
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2808750 ns}
