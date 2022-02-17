onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/clk
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/rst_n
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/audio_rx_down
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/en_temp
add wave -noupdate -color Gold -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/cyc_cnt
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/audio_left_o
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/en
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/OFZ_ok
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_wren
add wave -noupdate -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_addr
add wave -noupdate -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn_addr
add wave -noupdate -color {Dark Orchid} -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/inp_frame
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/w_ok
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_next_temp
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/en_shift
add wave -noupdate -color {Violet Red} /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/yn
add wave -noupdate -color {Violet Red} /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/fn
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz_next
add wave -noupdate /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_LMS/lms_valid
add wave -noupdate -expand -group LMS -color {Dark Orchid} -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/lms_frame
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/sz
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/vn
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_OFZC/en
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_LMS/mult_1
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_LMS/mult_2
add wave -noupdate -expand -group LMS /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_LMS/lms_w_next
add wave -noupdate -expand -group INP -color {Dark Orchid} -radix unsigned /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_INP/frame
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_INP/in_1
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_INP/in_2
add wave -noupdate -expand -group INP /SANRC_tb/u_SANRC/u_ANC/u_OFZ/u_INP/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12692700000 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {19864516 ns}
