onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/audio_rx_down
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/audio_left_i
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/audio_right_i
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/OFZ_ok
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/sn_addr
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/sn_wren
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/xn_addr
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/inp_state
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/inp_in
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/inp_out
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/lms_frame
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/vn
add wave -noupdate -expand -group INP -color {Dark Orchid} -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_ANC_INP/frame
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_ANC_INP/in_1
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_ANC_INP/in_2
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/sz
add wave -noupdate -expand -group INP -color {Dark Orchid} -format Analog-Step -max 1000000000000.0 -min -1000000000000.0 -radix hexadecimal /SANRC_tb/u_SANRC/u_ANC/yn
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/sn
add wave -noupdate -expand -group INP -color {Dark Orchid} -format Analog-Step -height 74 -max 1000000000000.0 -min -1000000000000.0 -radix decimal -childformat {{{/SANRC_tb/u_SANRC/u_ANC/yn[39]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[38]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[37]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[36]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[35]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[34]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[33]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[32]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[31]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[30]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[29]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[28]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[27]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[26]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[25]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[24]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[23]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[22]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[21]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[20]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[19]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[18]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[17]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[16]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[15]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[14]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[13]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[12]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[11]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[10]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[9]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[8]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[7]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[6]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[5]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[4]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[3]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[2]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[1]} -radix decimal} {{/SANRC_tb/u_SANRC/u_ANC/yn[0]} -radix decimal}} -subitemconfig {{/SANRC_tb/u_SANRC/u_ANC/yn[39]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[38]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[37]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[36]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[35]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[34]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[33]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[32]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[31]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[30]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[29]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[28]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[27]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[26]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[25]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[24]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[23]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[22]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[21]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[20]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[19]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[18]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[17]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[16]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[15]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[14]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[13]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[12]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[11]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[10]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[9]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[8]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[7]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[6]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[5]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[4]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[3]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[2]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[1]} {-color {Dark Orchid} -radix decimal} {/SANRC_tb/u_SANRC/u_ANC/yn[0]} {-color {Dark Orchid} -radix decimal}} /SANRC_tb/u_SANRC/u_ANC/yn
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_ANC_INP/out
add wave -noupdate -expand -group LMS -color {Dark Orchid} -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/lms_frame
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/lms_v
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/lms_e
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/mult_1
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/mult_2
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/s_next
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/lms_w
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_ANC_LMS/lms_w_next
add wave -noupdate -radix unsigned -childformat {{{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[10]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[9]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[8]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[7]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[6]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[5]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[4]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[3]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[2]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[1]} -radix unsigned} {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[0]} -radix unsigned}} -subitemconfig {{/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[10]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[9]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[8]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[7]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[6]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[5]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[4]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[3]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[2]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[1]} {-radix unsigned} {/SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt[0]} {-radix unsigned}} /SANRC_tb/u_SANRC/u_OFZ_MIC_TEST/ANC_cyc_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19064006900000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 5000
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {20188877940 ns}
