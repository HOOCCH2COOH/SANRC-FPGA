onerror {resume}
quietly virtual signal -install /SANRC_tb/u_SANRC/u_ANC/u_OFZ { /SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[35:16]} Fn
quietly virtual function -install /SANRC_tb/u_SANRC/u_ANC/u_ANCC -env /SANRC_tb { &{/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[35], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[34], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[33], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[32], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[31], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[30], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[29], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[28], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[27], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[26], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[25], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[24], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[23], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[22], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[21], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[20], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[19], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[18], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[17], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[16] }} Yn
quietly virtual function -install /SANRC_tb/u_SANRC/u_ANC/u_ANCC -env /SANRC_tb { &{/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[33], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[32], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[31], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[30], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[29], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[28], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[27], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[26], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[25], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[24], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[23], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[22], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[21], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[20], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[19], /SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[18] }} Yn001
quietly WaveActivateNextPane {} 0
add wave -noupdate /SANRC_tb/aud_mclk
add wave -noupdate /SANRC_tb/aud_lrc
add wave -noupdate /SANRC_tb/aud_dacdat
add wave -noupdate /SANRC_tb/u_SANRC/aud_adcdat
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/audio_rx_down
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz
add wave -noupdate -color {Dark Orchid} -format Analog-Step -height 74 -max 1947.0000000000002 -min -1782.0 -radix decimal -childformat {{{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[35]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[34]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[33]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[32]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[31]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[30]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[29]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[28]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[27]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[26]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[25]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[24]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[23]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[22]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[21]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[20]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[19]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[18]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[17]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn[16]} -radix decimal}} -subitemconfig {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[35]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[34]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[33]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[32]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[31]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[30]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[29]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[28]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[27]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[26]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[25]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[24]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[23]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[22]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[21]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[20]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[19]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[18]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[17]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn[16]} {-color {Dark Orchid} -radix decimal}} /SANRC_tb/u_SANRC/u_ANC/u_OFZ/Fn
add wave -noupdate /SANRC_tb/u_SANRC/OFZ_ok
add wave -noupdate -color {Dark Orchid} -format Analog-Step -height 80 -max 3618.0 -min -2656.0 -radix decimal -childformat {{(15) -radix decimal} {(14) -radix decimal} {(13) -radix decimal} {(12) -radix decimal} {(11) -radix decimal} {(10) -radix decimal} {(9) -radix decimal} {(8) -radix decimal} {(7) -radix decimal} {(6) -radix decimal} {(5) -radix decimal} {(4) -radix decimal} {(3) -radix decimal} {(2) -radix decimal} {(1) -radix decimal} {(0) -radix decimal}} -subitemconfig {{/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[33]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[32]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[31]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[30]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[29]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[28]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[27]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[26]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[25]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[24]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[23]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[22]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[21]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[20]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[19]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/u_ANCC/yn[18]} {-color {Dark Orchid} -radix decimal}} /SANRC_tb/u_SANRC/u_ANC/u_ANCC/Yn001
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/sn
add wave -noupdate -group ANC -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_addr
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/sz
add wave -noupdate -group ANC -radix decimal /SANRC_tb/u_SANRC/u_ANC/vn
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/wz
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/inp_frame
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/lms_frame
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/xn
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/audio_rx_down
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/clk_cnt
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/inp_out
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/inp_state
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/s_cur
add wave -noupdate -group ANC -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_ANCC/sn_addr
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/sn_cnt
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/sn_wren
add wave -noupdate -group ANC -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_ANCC/wz_addr
add wave -noupdate -group ANC -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_ANCC/xn_addr
add wave -noupdate -group ANC /SANRC_tb/u_SANRC/u_ANC/u_ANCC/xn_cnt
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/audio_left_i
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/audio_right_i
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/en
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/fn
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/inp_frame
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/lms_frame
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/cyc_cnt
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/s_cur
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/rst_n
add wave -noupdate -group OFZ -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_addr
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_next
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_wren
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn
add wave -noupdate -group OFZ -radix unsigned -childformat {{{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[12]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[11]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[10]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[9]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[8]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[7]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[6]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[5]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[4]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[3]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[2]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[1]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[0]} -radix unsigned}} -subitemconfig {{/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[12]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[11]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[10]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[9]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[8]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[7]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[6]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[5]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[4]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[3]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[2]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[1]} {-height 15 -radix unsigned} {/SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr[0]} {-height 15 -radix unsigned}} /SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr
add wave -noupdate -group OFZ /SANRC_tb/u_SANRC/u_ANC/u_OFZ/yn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12784210000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 187
configure wave -valuecolwidth 52
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 2
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {21 ms}
