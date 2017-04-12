# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sat Nov 26 02:05:27 2016
# Designs open: 1
#   Sim: /afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1
#   Group count = 4
#   Group mapper0 signal count = 26
#   Group reducer signal count = 15
#   Group input_arb signal count = 3
#   Group Group1 signal count = 1
# End_DVE_Session_Save_Info

# DVE version: K-2015.09_Full64
# DVE build date: Aug 25 2015 21:36:02


#<Session mode="Full" path="/afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{98 80} {1631 880}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 484]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 484
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 483} {height 522} {dock_state left} {dock_on_new_line true} {child_hier_colhier 374} {child_hier_coltype 100} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 202]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 202
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 524
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 201} {height 522} {dock_state left} {dock_on_new_line true} {child_data_colvariable 134} {child_data_colvalue 12} {child_data_coltype 46} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 180]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 536
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 535} {height 179} {dock_state bottom} {dock_on_new_line true}}
set DriverLoad.1 [gui_create_window -type DriverLoad -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 180]
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value 998
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 997} {height 179} {dock_state bottom} {dock_on_new_line false}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui }}
gui_set_env SIMSETUP::SIMEXE {/afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui } -dir /afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Breakpoints
stop -disable -file {/afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/mkInputVCQueues.v}  -line {391}   

# Global: Bus
gui_bus_create -name EXP:wordcompare {{CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.word[319:0]} {CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value[63:0]}}

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1}


set _session_group_68 mapper0
gui_sg_create "$_session_group_68"
set mapper0 "$_session_group_68"

gui_sg_addsignal -group "$_session_group_68" { CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.enable CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.task_id CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.key CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value EXP:wordcompare CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.clk CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.rstn CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.clear CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.tail CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.finish CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.read_request CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.write_request CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.int_key CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.int_value CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.read_addr CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.write_addr CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.counter CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.index CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.word CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.done CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.flit_out_mapper CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.en_put_credits_mapper CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.put_credits_mapper CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.en_get_credit CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.get_credit CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.task_id }
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.key}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.key}
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value}
gui_set_radix -radix {ascii} -signals {EXP:wordcompare}
gui_set_radix -radix {unsigned} -signals {EXP:wordcompare}
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.int_key}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.int_key}
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.word}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.word}

set _session_group_69 reducer
gui_sg_create "$_session_group_69"
set reducer "$_session_group_69"

gui_sg_addsignal -group "$_session_group_69" { CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.enable CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.int_key CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.search_key CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.int_value CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.clk CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.finish CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.read_request CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.write_request CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.result CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.read_addr CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.write_addr CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.counter CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.addr CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.en_put_credits_reducer CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.put_credits_reducer }
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.int_key}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.int_key}
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.search_key}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.search_key}
gui_set_radix -radix {decimal} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.result}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.result}

set _session_group_70 input_arb
gui_sg_create "$_session_group_70"
set input_arb "$_session_group_70"

gui_sg_addsignal -group "$_session_group_70" { CONNECT_testbench_sample.i_top_level.i_noc_input_controller.en_get_credit CONNECT_testbench_sample.i_top_level.i_noc_input_controller.get_credit CONNECT_testbench_sample.i_top_level.i_noc_input_controller.num_credits }

set _session_group_71 Group1
gui_sg_create "$_session_group_71"
set Group1 "$_session_group_71"

gui_sg_addsignal -group "$_session_group_71" { CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value }
gui_set_radix -radix {ascii} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value}
gui_set_radix -radix {unsigned} -signals {Sim:CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1.value}

# Global: Highlighting
gui_highlight_signals -color #00ff00 {CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.inputVCQueues_ifc_mf_ifc_not_full {CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core_5$out_ports_0_getFlit[70:0]} CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.inputVCQueues_ifc_mf_ifc_not_full_1}

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 443929962



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 0} {Input 1} {Others 0} {Linkage 0} {Output 1} {LowPower 0} {Parameter 0} {All 0} {Aggregate 0} {LibBaseMember 0} {Event 0} {Assertion 0} {Constant 0} {Interface 0} {BaseMembers 0} {Signal 0} {$unit 0} {Inout 1} {Variable 0} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active CONNECT_testbench_sample.i_top_level.i_MapReduceMapper_unq1_1 /afs/asu.edu/users/c/f/a/cfarnsw2/datamining/data_mining/src/MapReduceMapper_unq1.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 480
gui_src_set_reusable -id ${Source.1}

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.EN_send_ports_0_getCredits -time 155000 -starttime 155000
gui_get_loads -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.EN_send_ports_0_getCredits
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_MapReduceReducer_unq1.int_value[31:0]} -time 335000 -starttime 335000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_noc_input_controller.get_credit[1:0]} -time 75000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core$in_ports_0_getCredits[1:0]} -time 75000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.outport_encoder_76_BIT_3_77_AND_IF_flitBuffers_ETC___d654 -time 75000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.NOT_IF_outPortFIFOs_0_first__90_EQ_0_91_THEN_c_ETC___d652 -time 0 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.fifo_out__h38368 -time 75000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_noc_input_controller.flit_out[70:0]} -time 1805000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_noc_input_controller.data_internal[63:0]} -time 1805000 -starttime 1805000
gui_get_loads -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_noc_input_controller.data_internal[63:0]}
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_mkNetwork.send_ports_1_putFlit_flit_in[70:0]} -time 1805000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_noc_input_controller.data_in[63:0]} -time 1805000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_routeTable_rt_ifc_banks_banks_rf.ADDR_IN[3:0]} -time 0 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_routeTable_rt_ifc_banks_banks_rf.ADDR_1[3:0]} -time 55000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal {CONNECT_testbench_sample.i_top_level.i_mkNetwork.send_ports_0_putFlit_flit_in[70:0]} -time 1805000 -starttime 1805000
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88 -time 5000 -starttime 852787
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.inputVCQueues_ifc_mf_ifc_not_full -time 5000 -starttime 852787
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88 -time 5000 -starttime 5489816
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.inputVCQueues_ifc_mf_ifc_not_full_1 -time 5000 -starttime 5489816
gui_get_drivers -session -id ${DriverLoad.1} -signal CONNECT_testbench_sample.i_top_level.i_mkNetwork.net_routers_router_core.flitBuffers.IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88 -time 5000 -starttime 8670000
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
#</Session>

