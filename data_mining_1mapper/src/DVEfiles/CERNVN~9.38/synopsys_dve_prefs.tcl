# DVE version H-2013.06-SP1_Full64
# Preferences written on Wed Aug 24 15:02:26 2016
gui_set_var -name {read_pref_file} -value {true}
gui_set_pref_value -category {Data} -key {showValueAnnotation} -value {true}
gui_set_pref_value -category {Globals} -key {app_fixed_width_font} -value {Courier [Adobe],14,-1,5,50,0,0,0,0,0}
gui_set_pref_value -category {Globals} -key {cbug_fifo_dump_enable_proc} -value {false}
gui_create_pref_key -category {Globals} -key {load_detail_for_funcov} -value_type {bool} -value {false}
gui_set_pref_value -category {Schematics} -key {net_text_maxlen} -value {16}
gui_set_pref_value -category {Source} -key {value_annotate} -value {true}

gui_create_pref_category -category {dlg_settings}
gui_create_pref_key -category {dlg_settings} -key {tableWithImmediatePopup} -value_type {bool} -value {true}

gui_create_pref_category -category {schem_obj_name}
gui_create_pref_key -category {schem_obj_name} -key {show_cell_and_pin_with_symbol_name} -value_type {bool} -value {false}
gui_create_pref_key -category {schem_pin_hc} -key {textExtFont} -value_type {string} -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_set_pref_value -category {schem_text} -key {sizeScheme} -value {Large}
gui_set_var -name {read_pref_file} -value {false}
