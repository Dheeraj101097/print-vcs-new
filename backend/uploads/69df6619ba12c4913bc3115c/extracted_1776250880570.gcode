; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 4m 59s; total estimated time: 12m 12s
; total layer number: 4
; total filament length [mm] : 488.58
; total filament volume [cm^3] : 1175.18
; total filament weight [g] : 1.49
; model label id: 169,331,425
; filament_density: 1.27,1.24,1.24,1.24,1.24,1.24
; filament_diameter: 1.75,1.75,1.75,1.75,1.75,1.75
; max_z_height: 1.04
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0,0,0
; additional_cooling_fan_speed = 0,70,70,70,70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0,0,0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200,200,200
; close_fan_the_first_x_layers = 3,1,1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70,70,70
; cool_plate_temp = 0,35,35,35,35,35
; cool_plate_temp_initial_layer = 0,35,35,35,35,35
; cooling_filter_enabled = 0
; counter_coef_1 = 0,0,0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;;;;;
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70,70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70,0,0,0,0,0
; eng_plate_temp_initial_layer = 70,0,0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 30,100,100,100,100,100
; fan_direction = left
; fan_max_speed = 90,100,100,100,100,100
; fan_min_speed = 40,100,100,100,100,100
; filament_adaptive_volumetric_speed = 0,0,0,0,0,0
; filament_adhesiveness_category = 300,100,100,100,100,100
; filament_change_length = 10,10,10,10,10,10
; filament_change_length_nc = 10,10,10,10,10,10
; filament_colour = #FFFFFF;#FFFF00;#FF0000;#080808;#FF8000;#FFFFFF
; filament_colour_type = 1;1;1;1;1;1
; filament_cooling_before_tower = 0,0,0,0,0,0
; filament_cost = 30,20,20,20,20,20
; filament_density = 1.27,1.24,1.24,1.24,1.24,1.24
; filament_diameter = 1.75,1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.95,0.98,0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0,0,0
; filament_ids = GFG99;GFL99;GFL99;GFL99;GFL99;GFL99
; filament_is_support = 0,0,0,0,0,0
; filament_map = 1,1,1,1,1,1
; filament_map_2 = 0,0,0,0,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12,12,12,12,12,12
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15,15
; filament_multi_colour = #FFFFFF;#FFFF00;#FF0000;#080808;#FF8000;#FFFFFF
; filament_notes = 
; filament_nozzle_map = 0,0,0,0,0,0
; filament_pre_cooling_temperature = 0,0,0,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0,0,0
; filament_prime_volume = 45,45,45,45,45,45
; filament_prime_volume_nc = 60,60,60,60,60,60
; filament_printable = 3,3,3,3,3,3
; filament_ramming_travel_time = 0,0,0,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14,14,14
; filament_scarf_gap = 0%,15%,15%,15%,15%,15%
; filament_scarf_height = 10%,10%,10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10,10,10
; filament_scarf_seam_type = none,none,none,none,none,none
; filament_self_index = 1,2,3,4,5,6
; filament_settings_id = "Generic PETG";"Generic PLA";"Generic PLA";"Generic PLA";"Generic PLA";"Generic PLA"
; filament_shrink = 100%,100%,100%,100%,100%,100%
; filament_soluble = 0,0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG;PLA;PLA;PLA;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1,1,1,1
; filament_vendor = Generic;Generic;Generic;Generic;Generic;Generic
; filament_volume_map = 0,0,0,0,0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,341,369,184,354,167,414,0,363,227,238,414,693,647,0,200,423,693,654,557,499,0,636,654,564,421,239,217,0,564,167,341,369,184,354,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 200
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 70,55,55,55,55,55
; hot_plate_temp_initial_layer = 70,55,55,55,55,55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10,10,10,10,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 200
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 200
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.28
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0,0,0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0,0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 255,220,220,220,220,220
; nozzle_temperature_initial_layer = 255,220,220,220,220,220
; nozzle_temperature_range_high = 270,240,240,240,240,240
; nozzle_temperature_range_low = 220,190,190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 90,100,100,100,100,100
; overhang_fan_threshold = 10%,50%,50%,50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.28mm Extra Draft @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1,1,1
; slow_down_layer_time = 12,8,8,8,8,8
; slow_down_min_speed = 20,20,20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 200
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70,45,45,45,45,45
; supertack_plate_temp_initial_layer = 70,45,45,45,45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 40
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70,45,45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 70,55,55,55,55,55
; textured_plate_temp_initial_layer = 70,55,55,55,55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 4
; top_one_wall_type = all top
; top_shell_layers = 4
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.45
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 219.984
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R12
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S70 ;set bed temp
M190 S70 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S255 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S255
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T270


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P12 R10
G1 E50 F200
M400
M104 S255
G92 E0
M73 P47 R6
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P48 R6
G1 E5 F300
M109 S235 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P50 R6
G1 E-0.5 F300

M73 P52 R5
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S235
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
M73 P53 R5
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X113.16 Y87.5515 I29.6793 J80.897
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S255 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
M73 P54 R5
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S255
G1 Z0.2
G0 E2 F300
G0 X240 E15 F4800
G0 Y11 E0.700 F1200
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F4800
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/4
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
; object ids of layer 1 start: 169,331,425
M624 BwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer1 end: 169,331,425
M625
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X135.415 Y87.032
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
M73 P55 R5
G1 X135.385 Y87.057 E.00141
G2 X134.924 Y87.906 I.609 J.881 E.0362
G2 X134.963 Y92.866 I77.57 J1.866 E.17909
G2 X135.876 Y94.225 I1.433 J.024 E.06295
G2 X137.159 Y94.366 I1.14 J-4.482 E.04675
G2 X139.93 Y94.353 I1.233 J-32.842 E.10005
G2 X141.209 Y93.708 I-.044 J-1.68 E.05345
G2 X141.421 Y93.044 I-1.308 J-.783 E.02536
G2 X141.484 Y90.735 I-30.275 J-1.983 E.08343
G1 X141.524 Y86.435 E.15529
M73 P56 R5
G1 X141.888 Y86.435 E.01314
G3 X141.858 Y93.378 I-196.652 J2.627 E.25073
G3 X140.812 Y94.606 I-2.453 J-1.03 E.05919
G3 X139.855 Y94.781 I-.916 J-2.308 E.03534
G3 X136.154 Y94.748 I-1.537 J-34.787 E.13371
G3 X135.125 Y94.224 I.125 J-1.517 E.04273
M73 P57 R5
G3 X134.506 Y92.706 I1.4 J-1.456 E.06098
G3 X134.5 Y86.428 I182.834 J-3.313 E.22667
G3 X138.455 Y86.412 I3.199 J298.205 E.14281
G3 X138.464 Y89.733 I-121.121 J1.97 E.11992
G1 X138.006 Y89.715 E.01654
G2 X137.936 Y87.767 I-28.805 J.067 E.07039
G2 X137.66 Y87.074 I-1.588 J.23 E.02718
G1 X137.285 Y86.906 E.01482
G2 X135.581 Y86.949 I-.767 J3.349 E.0622
G1 X135.469 Y87.005 E.00454
M204 S6000
G1 X135.635 Y87.433 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X135.379 Y87.954 I.411 J.526 E.0217
G2 X135.419 Y92.827 I78.883 J1.791 E.17597
G2 X135.89 Y93.731 I1.052 J.027 E.03844
G2 X136.562 Y93.883 I.779 J-1.885 E.025
G2 X139.885 Y93.898 I1.818 J-36.594 E.12002
G2 X140.83 Y93.45 I-.008 J-1.238 E.03897
G2 X140.966 Y92.998 I-1.121 J-.584 E.01715
M73 P58 R5
G2 X141.027 Y90.73 I-29.998 J-1.941 E.08193
G1 X141.072 Y85.977 E.1716
G1 X142.344 Y85.977 E.04593
G3 X142.32 Y93.431 I-233.5 J2.987 E.26912
G3 X141.007 Y95.02 I-2.776 J-.956 E.07604
G3 X139.882 Y95.238 I-1.105 J-2.696 E.04166
G3 X136.1 Y95.202 I-1.566 J-34.488 E.13663
G3 X134.67 Y94.406 I.218 J-2.075 E.06072
G3 X134.062 Y92.922 I1.702 J-1.563 E.05913
M73 P59 R5
G3 X134.022 Y90.395 I41.324 J-1.928 E.09127
G1 X134.046 Y85.975 E.15961
G3 X138.41 Y85.955 I3.699 J332.278 E.1576
G3 X138.892 Y85.97 I-.072 J10.07 E.01741
G3 X138.899 Y90.196 I-62.635 J2.221 E.15262
G3 X137.556 Y90.154 I.156 J-26.545 E.04855
G2 X137.483 Y87.833 I-33.813 J-.105 E.08384
G2 X137.331 Y87.427 I-.92 J.113 E.01579
M73 P59 R4
G2 X136.456 Y87.281 I-.695 J1.467 E.03244
G2 X135.69 Y87.41 I-.093 J1.789 E.02827
M204 S6000
G1 X135.616 Y86.674 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130123
G1 F3000
M204 S500
G2 X134.727 Y86.839 I1.376 J9.9 E.00624
M204 S6000
G1 X134.726 Y86.908 F30000
; LINE_WIDTH: 0.26948
G1 F3000
M204 S500
G1 X135.566 Y86.649 E.01573
M204 S6000
G1 X134.975 Y86.653 F30000
; LINE_WIDTH: 0.244763
G1 F3000
M204 S500
G1 X134.724 Y87.491 E.01395
M204 S6000
G1 X134.749 Y87.495 F30000
; LINE_WIDTH: 0.109884
G1 F3000
M204 S500
G3 X134.905 Y86.654 I8.444 J1.133 E.00453
; WIPE_START
G1 X134.749 Y87.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.009 Y86.639 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.230078
G1 F3000
M204 S500
G3 X138.165 Y87.411 I-8.42 J2.108 E.01164
; LINE_WIDTH: 0.180137
G1 X138.182 Y87.516 E.00116
; LINE_WIDTH: 0.144583
G1 X138.203 Y87.726 E.00169
; LINE_WIDTH: 0.115019
G1 X138.217 Y87.987 E.00149
; WIPE_START
G1 X138.203 Y87.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.669 Y95.203 Z.6 F30000
G1 X135.89 Y99.002 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X136.388 Y99.518 E.02589
G2 X138.319 Y101.314 I21.559 J-21.253 E.09526
G3 X141.915 Y104.531 I-270.419 J305.872 E.17419
G3 X141.901 Y105.463 I-75.048 J-.62 E.03364
G3 X134.471 Y105.474 I-4.816 J-726.216 E.26827
G3 X134.474 Y105.081 I9.121 J-.144 E.01421
G2 X139.233 Y105.043 I-1.089 J-439.428 E.17185
G2 X139.87 Y104.937 I-.035 J-2.184 E.02341
G1 X141.013 Y104.352 E.04636
G1 X140.157 Y103.404 E.04613
G2 X139.479 Y102.766 I-11.656 J11.71 E.03363
G3 X134.471 Y98.28 I511.613 J-576.218 E.24276
G1 X134.471 Y97.399 E.03179
G3 X140.676 Y97.366 I5.182 J389.385 E.22404
G3 X141.971 Y97.382 I-.179 J68.153 E.04677
G3 X141.981 Y97.835 I-5.542 J.34 E.01638
G2 X136.964 Y97.888 I-.743 J166.48 E.18114
G1 X136.231 Y97.947 E.02655
G1 X135.843 Y98.951 E.03887
G1 X135.849 Y98.958 E.00035
M204 S6000
G1 X136.372 Y98.848 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X138.623 Y100.973 I22.062 J-21.118 E.11181
G3 X142.374 Y104.333 I-242.781 J274.828 E.18182
G3 X142.35 Y105.918 I-126.164 J-1.171 E.05723
G3 X134.018 Y105.926 I-4.52 J-373.94 E.30082
G3 X134.031 Y104.632 I37.008 J-.276 E.04672
G3 X138.856 Y104.599 I4.463 J302.303 E.17422
G2 X139.699 Y104.512 I.026 J-3.85 E.03064
G1 X140.275 Y104.217 E.02338
G2 X139.171 Y103.104 I-7.776 J6.61 E.05664
G3 X134.013 Y98.476 I340.355 J-384.513 E.25022
G3 X134.023 Y96.954 I29.565 J-.566 E.05496
G3 X140.678 Y96.909 I4.737 J209.765 E.24027
G3 X142.398 Y96.943 I-.185 J52.957 E.06212
G3 X142.421 Y98.275 I-7.075 J.793 E.04818
G3 X139.418 Y98.303 I-2.147 J-69.241 E.10846
G2 X136.554 Y98.38 I-.535 J33.572 E.10348
G1 X136.394 Y98.792 E.01597
; WIPE_START
G1 X136.996 Y99.486 E-.34898
G1 X137.794 Y100.216 E-.41102
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.521 Y97.648 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14875
G1 F3000
M204 S500
G1 X136.095 Y97.666 E.00356
M204 S6000
G1 X136.521 Y97.648 F30000
; LINE_WIDTH: 0.119917
G1 F3000
M204 S500
G1 X136.947 Y97.629 E.00259
; LINE_WIDTH: 0.104147
G1 X137.043 Y97.626 E.00047
; WIPE_START
G1 X136.947 Y97.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.981 Y97.575 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50692
G1 F6300
M204 S500
G1 X135.845 Y98.439 E.04477
; WIPE_START
G1 X134.981 Y97.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.128 Y103.211 Z.6 F30000
G1 X141.726 Y104.961 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X141.37 Y104.606 E.02179
G1 X140.857 Y104.868 E.02497
G1 X141.27 Y105.281 E.02528
; WIPE_START
G1 X140.857 Y104.868 E-.26669
G1 X141.37 Y104.606 E-.26341
G1 X141.726 Y104.961 E-.2299
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.854 Y108.536 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X137.846 Y108.536 E.0003
G3 X137.798 Y114.12 I-289.029 J.33 E.20162
G3 X137.435 Y114.112 I-.04 J-6.745 E.01313
G2 X137.445 Y109.828 I-293.049 J-2.837 E.15468
G2 X137.411 Y109.482 I-1.835 J.005 E.01259
M73 P60 R4
G1 X137.194 Y108.53 E.03524
G1 X134.534 Y108.453 E.09607
G1 X134.534 Y108.182 E.00977
G3 X139.174 Y108.168 I3.191 J287.586 E.16754
G3 X140.754 Y108.27 I.26 J8.207 E.05724
G3 X141.877 Y109.832 I-.438 J1.5 E.07483
G3 X141.858 Y116.129 I-74.249 J2.917 E.22743
G3 X141.234 Y117.172 I-1.349 J-.099 E.04549
G3 X140.543 Y117.518 I-1.537 J-2.205 E.02799
G3 X137.485 Y117.558 I-2.309 J-59.715 E.11044
G1 X134.537 Y117.54 E.10644
G1 X134.531 Y117.249 E.01053
G2 X139.895 Y117.199 I.871 J-196.793 E.19367
G2 X140.947 Y116.972 I.093 J-2.123 E.0393
G2 X141.507 Y115.985 I-.708 J-1.054 E.04251
G2 X141.547 Y114.205 I-18.375 J-1.304 E.06429
G2 X141.52 Y109.919 I-106.945 J-1.457 E.15476
G2 X141.191 Y108.931 I-1.503 J-.049 E.03839
G2 X140.041 Y108.488 I-1.128 J1.211 E.0456
G2 X139.413 Y108.487 I-.357 J33.759 E.02266
G1 X137.914 Y108.534 E.05416
M204 S6000
G1 X138.3 Y108.979 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X138.256 Y114.07 I-263.022 J.314 E.1838
G3 X138.237 Y114.564 I-7.302 J-.041 E.01786
G3 X136.984 Y114.534 I-.421 J-8.53 E.04528
G3 X137.002 Y111.386 I115.651 J-.93 E.11365
G2 X136.962 Y109.569 I-14.115 J-.602 E.06567
G1 X136.827 Y108.977 E.02194
G3 X134.074 Y108.895 I3.972 J-180.472 E.09942
G3 X134.089 Y107.728 I36.196 J-.143 E.04215
G3 X139.18 Y107.711 I3.571 J310.609 E.18382
G3 X140.868 Y107.828 I.263 J8.469 E.06121
G3 X142.334 Y109.811 I-.561 J1.948 E.09572
G3 X142.328 Y116.005 I-99.307 J2.997 E.22368
G3 X141.376 Y117.629 I-1.881 J-.012 E.07119
G3 X140.455 Y117.984 I-1.105 J-1.491 E.03608
G3 X137.483 Y118.015 I-2.216 J-71.799 E.1073
G1 X134.089 Y117.995 E.12256
G1 X134.065 Y116.795 E.04334
G2 X139.875 Y116.743 I.668 J-250.155 E.20977
G2 X140.585 Y116.644 I-.032 J-2.834 E.02596
G2 X141.053 Y115.932 I-.308 J-.712 E.03256
G2 X141.09 Y114.204 I-18.108 J-1.256 E.06243
G2 X141.063 Y109.948 I-107.115 J-1.455 E.15367
G2 X140.936 Y109.351 I-1.519 J.013 E.0222
G2 X140.194 Y108.957 I-.815 J.64 E.03123
G2 X138.359 Y108.976 I-.724 J18.975 E.06626
M204 S6000
G1 X137.586 Y109.104 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.125576
G1 F3000
M204 S500
G1 X137.561 Y108.867 E.00156
; LINE_WIDTH: 0.170886
G1 X137.535 Y108.631 E.00241
; LINE_WIDTH: 0.216197
G1 X137.509 Y108.394 E.00326
; WIPE_START
G1 X137.535 Y108.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.341 Y116.046 Z.6 F30000
G1 X141.254 Y123.895 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X141.374 Y123.749 E.00684
G2 X141.523 Y123.057 I-1.235 J-.628 E.02584
G2 X141.557 Y120.144 I-432.516 J-6.508 E.10518
G1 X141.847 Y120.142 E.01048
G1 X141.865 Y121.305 E.042
G3 X141.873 Y128.805 I-378.121 J4.122 E.2708
G3 X141.556 Y128.806 I-.172 J-4.613 E.01143
G2 X141.506 Y125.656 I-54.377 J-.706 E.11379
G2 X141.374 Y125.161 I-1.536 J.145 E.01855
G1 X141.151 Y124.9 E.0124
G2 X140.699 Y124.702 I-.688 J.957 E.01795
G2 X137.026 Y124.651 I-3.457 J116.892 E.13266
G3 X134.522 Y124.612 I.625 J-121.106 E.09041
G3 X134.522 Y124.292 I8.529 J-.167 E.01156
G3 X139.733 Y124.263 I4.708 J380.059 E.18817
G2 X140.768 Y124.183 I-.015 J-6.886 E.03753
G2 X141.21 Y123.936 I-.304 J-1.063 E.01843
M204 S6000
G1 X140.905 Y123.596 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X141.055 Y123.269 I-.378 J-.37 E.01325
G2 X141.116 Y119.706 I-752.637 J-14.617 E.12866
G3 X142.287 Y119.693 I.789 J17.64 E.04229
G3 X142.323 Y129.242 I-320.132 J5.978 E.3448
G3 X141.118 Y129.246 I-.641 J-11.482 E.04349
G3 X141.088 Y126.822 I54.459 J-1.89 E.08754
G2 X141.024 Y125.55 I-8.332 J-.219 E.04603
G2 X140.622 Y125.156 I-.493 J.101 E.02158
G2 X137.021 Y125.108 I-3.429 J121.83 E.13002
G3 X134.074 Y125.056 I.565 J-114.791 E.10643
G3 X134.075 Y123.846 I25.929 J-.587 E.0437
G3 X139.725 Y123.806 I15.291 J1794.552 E.20401
G2 X140.645 Y123.742 I-.022 J-6.877 E.03331
G2 X140.861 Y123.637 I-.117 J-.516 E.00876
; WIPE_START
G1 X140.98 Y123.508 E-.06653
G1 X141.033 Y123.385 E-.05109
G1 X141.055 Y123.269 E-.04475
G1 X141.082 Y121.697 E-.59763
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.964 Y129.247 Z.6 F30000
G1 X138.426 Y139.628 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X138.182 Y139.655 E.00889
G3 X138.073 Y138.367 I5.493 J-1.113 E.04678
G3 X138.021 Y133.441 I357.222 J-6.184 E.17789
G2 X137.849 Y132.505 I-2.213 J-.075 E.03462
G2 X136.659 Y131.837 I-1.185 J.717 E.05151
G2 X135.953 Y131.845 I-.317 J3.175 E.02554
G2 X134.975 Y132.853 I.226 J1.198 E.05404
G2 X134.878 Y133.863 I8.672 J1.342 E.03667
G1 X134.845 Y140.157 E.22725
G1 X134.55 Y140.151 E.01064
G3 X134.552 Y133.034 I326.082 J-3.477 E.25699
G3 X135.337 Y131.761 I1.46 J.022 E.05667
G3 X136.448 Y131.51 I.945 J1.601 E.0418
G1 X136.646 Y131.515 E.00712
G3 X137.391 Y131.653 I.048 J1.824 E.02757
G3 X138.272 Y132.531 I-.93 J1.814 E.04565
G3 X138.403 Y134.397 I-10.66 J1.684 E.0676
G3 X138.426 Y139.568 I-264.377 J3.788 E.18673
; WIPE_START
G1 X138.182 Y139.655 E-.09879
G1 X138.106 Y139.159 E-.19086
G1 X138.073 Y138.367 E-.30102
G1 X138.068 Y137.922 E-.16933
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.229 Y139.765 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X141.338 Y139.63 E.00627
G2 X141.488 Y139.366 I-1.272 J-.894 E.01098
G2 X141.55 Y133.56 I-128.68 J-4.296 E.20965
G3 X141.569 Y131.852 I71.131 J-.078 E.0617
G1 X141.88 Y131.849 E.01121
G1 X141.889 Y132.303 E.01637
G3 X141.84 Y139.305 I-149.101 J2.451 E.25287
G3 X141.23 Y140.202 I-1.472 J-.346 E.04002
G3 X139.945 Y140.581 I-1.16 J-1.563 E.04938
G3 X138.356 Y139.867 I-.087 J-1.93 E.06527
M73 P61 R4
G1 X138.516 Y139.681 E.00885
G2 X139.218 Y140.128 I2.574 J-3.268 E.0301
G2 X141.188 Y139.808 I.723 J-1.776 E.07576
M204 S6000
G1 X140.879 Y139.471 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X141.036 Y139.236 I-.636 J-.594 E.01026
G2 X141.104 Y132.232 I-276.294 J-6.187 E.25289
G3 X141.128 Y131.412 I17.82 J.104 E.02961
G3 X142.326 Y131.409 I.627 J10.383 E.0433
G3 X142.293 Y139.375 I-157.271 J3.316 E.28766
G3 X141.514 Y140.56 I-1.927 J-.418 E.05234
G3 X139.945 Y141.038 I-1.42 J-1.845 E.06052
G3 X137.753 Y139.796 I-.087 J-2.403 E.09576
G3 X137.616 Y138.379 I5.543 J-1.253 E.05156
G3 X137.565 Y133.46 I354.468 J-6.142 E.17761
G2 X137.443 Y132.72 I-1.771 J-.089 E.02729
G2 X136.631 Y132.294 I-.78 J.499 E.03465
G2 X136.029 Y132.297 I-.286 J2.703 E.02176
G2 X135.42 Y132.957 I.148 J.748 E.03468
G2 X135.321 Y134.694 I11.362 J1.519 E.06287
G1 X135.301 Y140.623 E.21407
G1 X134.096 Y140.599 E.04352
G3 X134.083 Y133.33 I428.129 J-4.357 E.26248
G3 X134.369 Y132.061 I2.325 J-.143 E.04758
G3 X136.45 Y131.053 I1.907 J1.285 E.0875
G1 X136.664 Y131.058 E.0077
G3 X137.489 Y131.194 I.023 J2.443 E.03035
G3 X138.687 Y132.329 I-1.124 J2.388 E.06061
G3 X138.819 Y133.241 I-3.419 J.96 E.03338
G3 X138.871 Y135.222 I-42.856 J2.103 E.07156
G1 X138.882 Y139.377 E.15004
G2 X139.655 Y139.783 I1.276 J-1.491 E.03177
G2 X140.832 Y139.508 I.283 J-1.449 E.04498
; WIPE_START
G1 X141.036 Y139.236 E-.12943
G1 X141.073 Y137.577 E-.63058
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.061 Y143.333 Z.6 F30000
G1 X135.764 Y143.675 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X135.731 Y143.438 E.00862
G3 X136.544 Y143.316 I.756 J2.255 E.02985
G3 X141.536 Y143.306 I2.933 J218.6 E.18025
G1 X141.873 Y143.313 E.01215
G3 X141.877 Y143.659 I-9.126 J.291 E.01246
G3 X135.824 Y143.675 I-3.77 J-267.09 E.21857
M204 S6000
G1 X135.589 Y143.74 F30000
G1 F3000
M204 S500
G1 X134.793 Y144.657 E.04386
G1 X134.594 Y144.531 E.00852
G3 X135.457 Y143.549 I1.561 J.502 E.04857
G1 X135.573 Y143.693 E.00669
; WIPE_START
G1 X134.793 Y144.657 E-.47121
G1 X134.594 Y144.531 E-.08966
G1 X134.745 Y144.208 E-.13551
G1 X134.841 Y144.071 E-.06362
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.833 Y144.701 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X134.879 Y151.574 E.24819
G1 X135.674 Y152.37 E.04061
G1 X135.53 Y152.56 E.00863
G3 X134.67 Y151.769 I.718 J-1.644 E.04298
G1 X134.633 Y151.717 E.00229
G3 X134.609 Y151.602 I.302 J-.124 E.00427
G3 X134.53 Y150.443 I5.972 J-.989 E.042
G3 X134.568 Y144.694 I117.061 J-2.106 E.20761
G1 X134.773 Y144.699 E.00743
; WIPE_START
G1 X134.804 Y146.699 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.762 Y152.417 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X141.583 Y152.477 E.2102
G1 X141.583 Y152.749 E.00982
G3 X136.385 Y152.752 I-2.722 J-211.99 E.18768
G3 X135.72 Y152.644 I-.107 J-1.449 E.02453
G1 X135.751 Y152.476 E.00618
; WIPE_START
G1 X137.751 Y152.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.059 Y145.033 Z.6 F30000
G1 X135.854 Y144.132 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X135.291 Y144.781 E.03101
G1 X135.335 Y151.384 E.23842
G1 X135.912 Y151.961 E.02948
G1 X142.368 Y152.027 E.23312
G3 X142.361 Y153.201 I-18.425 J.469 E.04238
G3 X136.368 Y153.208 I-3.283 J-236.931 E.21639
G3 X135.078 Y152.83 I-.056 J-2.201 E.04932
G3 X134.101 Y151.224 I.874 J-1.632 E.07121
G3 X134.114 Y144.629 I113.112 J-3.081 E.23816
G1 X134.126 Y144.501 E.00463
G3 X135.846 Y142.931 I2.144 J.622 E.08847
G3 X137.623 Y142.839 I1.417 J10.18 E.06433
G3 X141.543 Y142.849 I1.445 J203.38 E.14154
G1 X142.316 Y142.867 E.02792
G3 X142.326 Y144.102 I-15.449 J.738 E.04462
G3 X135.914 Y144.133 I-4.232 J-216.266 E.23151
; WIPE_START
G1 X135.291 Y144.781 E-.34163
G1 X135.298 Y145.882 E-.41837
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.822 Y151.149 Z.6 F30000
G1 X141.978 Y152.252 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.377582
G1 F3000
M204 S500
G3 X141.977 Y152.975 I-26.422 J.317 E.01911
; WIPE_START
G1 X141.978 Y152.252 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.657 Y159.769 Z.6 F30000
G1 X139.88 Y164.192 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X139.852 Y164.013 E.00653
G2 X139.45 Y163.434 I-1.024 J.281 E.02594
G2 X135.338 Y160.519 I-134.529 J185.45 E.18199
G2 X139.64 Y157.457 I-67.967 J-100.031 E.19067
G1 X139.864 Y157.193 E.01249
G1 X139.957 Y156.722 E.01734
G1 X139.828 Y156.352 E.01413
G1 X139.598 Y156.044 E.0139
G2 X138.625 Y155.831 I-.891 J1.748 E.03638
G2 X134.522 Y155.793 I-8.784 J725.658 E.14816
G1 X134.521 Y155.481 E.01126
G3 X141.917 Y155.49 I3.221 J419.728 E.26702
G3 X141.879 Y156.364 I-23.075 J-.562 E.03161
G2 X137.068 Y159.772 I95.726 J140.259 E.21288
G2 X136.771 Y160.214 I.683 J.778 E.01945
G1 X136.739 Y160.564 E.01266
G2 X137.329 Y161.479 I1.378 J-.24 E.04039
G2 X139.392 Y162.935 I25.399 J-33.798 E.09117
G2 X141.9 Y164.689 I66.568 J-92.5 E.11049
G3 X141.925 Y165.591 I-17.72 J.941 E.03261
G3 X134.521 Y165.572 I-1.921 J-677.164 E.26731
G1 X134.52 Y165.267 E.01099
G2 X138.91 Y165.219 I.917 J-116.97 E.15853
G2 X139.837 Y164.585 I-.052 J-1.069 E.04268
G1 X139.888 Y164.251 E.01218
M204 S6000
M73 P62 R4
G1 X139.426 Y164.247 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X139.155 Y163.784 I-.626 J.056 E.02
G3 X134.56 Y160.514 I828.577 J-1169.638 E.20364
G3 X137.51 Y158.447 I108.966 J152.384 E.13008
G2 X139.322 Y157.125 I-31.844 J-45.558 E.08098
G1 X139.438 Y156.988 E.00649
G1 X139.484 Y156.755 E.00859
G2 X139.302 Y156.411 I-.633 J.115 E.01427
G2 X138.607 Y156.288 I-.594 J1.331 E.02576
G2 X134.379 Y156.249 I-9.757 J821.142 E.15266
G1 X134.07 Y156.239 E.01114
G3 X134.074 Y155.035 I39.974 J-.479 E.04348
G3 X142.374 Y155.035 I4.176 J376.474 E.29968
G3 X142.324 Y156.614 I-23.585 J.052 E.05706
G2 X137.377 Y160.11 I97.255 J142.852 E.21873
G2 X137.293 Y160.791 I.359 J.39 E.02695
G2 X137.963 Y161.386 I2.343 J-1.965 E.03247
G3 X142.341 Y164.441 I-410.338 J592.671 E.19276
G3 X142.364 Y166.048 I-15.638 J1.026 E.05806
G3 X134.07 Y166.019 I-2.092 J-574.617 E.29947
G3 X134.072 Y164.812 I32.803 J-.565 E.04359
G2 X138.866 Y164.764 I1.1 J-131 E.17311
G2 X139.419 Y164.306 I.013 J-.548 E.02829
M204 S6000
G1 X140.119 Y164.078 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128742
G1 F3000
M204 S500
G2 X140.107 Y163.722 I-3.489 J-.06 E.00241
M204 S6000
G1 X139.982 Y163.664 F30000
; LINE_WIDTH: 0.108368
G1 F3000
M204 S500
G3 X140.175 Y163.883 I-1.659 J1.653 E.00151
; WIPE_START
G1 X139.982 Y163.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.72 Y165.154 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118468
G1 F3000
M204 S500
G1 X139.624 Y165.258 E.00085
; LINE_WIDTH: 0.149559
G1 X139.529 Y165.363 E.00119
; WIPE_START
G1 X139.624 Y165.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.381 Y165.387 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5066
G1 F6300
M204 S500
G1 X140.46 Y164.466 E.04773
G1 X140.248 Y164.466 E.00776
G1 X140.209 Y164.723 E.00952
G1 X140.152 Y164.814 E.00392
G1 X140.744 Y165.406 E.03066
M204 S6000
G1 X141.632 Y165.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.123849
G1 F3000
M204 S500
G1 X141.661 Y165.154 E.00135
; WIPE_START
G1 X141.632 Y165.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.873 Y160.368 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X136.63 Y161.125 E.04639
; WIPE_START
G1 X135.873 Y160.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.955 Y156.097 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.12498
G1 F3000
M204 S500
G1 X139.88 Y155.956 E.00103
; LINE_WIDTH: 0.169109
G1 X139.806 Y155.816 E.00159
; LINE_WIDTH: 0.203055
G1 X139.789 Y155.79 E.00038
G1 X139.523 Y155.723 E.00347
M204 S6000
G1 X140.389 Y155.666 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50034
G1 F6300
M204 S500
G1 X141.134 Y156.411 E.03808
G1 X140.753 Y156.677 E.01679
G1 X140.385 Y156.309 E.01882
G1 X140.249 Y156.38 E.00553
G1 X140.358 Y156.694 E.01198
G1 X140.319 Y156.89 E.00724
G1 X140.52 Y157.091 E.01025
; WIPE_START
G1 X140.319 Y156.89 E-.10781
G1 X140.358 Y156.694 E-.0761
G1 X140.249 Y156.38 E-.12603
G1 X140.385 Y156.309 E-.05818
G1 X140.753 Y156.677 E-.19795
G1 X141.134 Y156.411 E-.17653
G1 X141.101 Y156.379 E-.01741
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.641 Y156.043 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122836
G1 F3000
M204 S500
G1 X141.62 Y155.88 E.00104
; LINE_WIDTH: 0.162656
G1 X141.599 Y155.717 E.00155
; OBJECT_ID: 169
; WIPE_START
G1 X141.62 Y155.88 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
M204 S6000
G1 X139.848 Y148.456 Z.6 F30000
G1 X125.189 Y87.032 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.158 Y87.057 E.00141
G2 X124.697 Y87.906 I.609 J.881 E.0362
G2 X124.737 Y92.866 I77.57 J1.866 E.17909
G2 X125.65 Y94.225 I1.433 J.024 E.06295
G2 X126.933 Y94.366 I1.14 J-4.482 E.04675
G2 X129.703 Y94.353 I1.233 J-32.842 E.10005
G2 X130.983 Y93.708 I-.044 J-1.68 E.05345
G2 X131.194 Y93.044 I-1.308 J-.783 E.02536
G2 X131.257 Y90.735 I-30.275 J-1.983 E.08343
G1 X131.298 Y86.435 E.15529
G1 X131.662 Y86.435 E.01314
G3 X131.632 Y93.378 I-196.652 J2.627 E.25073
G3 X130.585 Y94.606 I-2.453 J-1.03 E.05919
G3 X129.629 Y94.781 I-.916 J-2.308 E.03534
G3 X125.927 Y94.748 I-1.537 J-34.787 E.13371
G3 X124.899 Y94.224 I.125 J-1.517 E.04273
G3 X124.28 Y92.706 I1.4 J-1.456 E.06098
G3 X124.274 Y86.428 I182.834 J-3.313 E.22667
G3 X128.229 Y86.412 I3.199 J298.205 E.14281
G3 X128.237 Y89.733 I-121.121 J1.97 E.11992
G1 X127.78 Y89.715 E.01654
G2 X127.709 Y87.767 I-28.805 J.067 E.07039
G2 X127.434 Y87.074 I-1.588 J.23 E.02718
G1 X127.059 Y86.906 E.01482
G2 X125.355 Y86.949 I-.767 J3.349 E.0622
G1 X125.242 Y87.005 E.00454
M204 S6000
G1 X125.409 Y87.433 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X125.152 Y87.954 I.411 J.526 E.0217
G2 X125.192 Y92.827 I78.883 J1.791 E.17597
G2 X125.664 Y93.731 I1.052 J.027 E.03844
G2 X126.336 Y93.883 I.779 J-1.885 E.025
G2 X129.659 Y93.898 I1.818 J-36.594 E.12002
G2 X130.603 Y93.45 I-.008 J-1.238 E.03897
G2 X130.739 Y92.998 I-1.121 J-.584 E.01715
G2 X130.8 Y90.73 I-29.998 J-1.941 E.08193
G1 X130.845 Y85.977 E.1716
G1 X132.117 Y85.977 E.04593
G3 X132.094 Y93.431 I-233.5 J2.987 E.26912
G3 X130.781 Y95.02 I-2.776 J-.956 E.07604
G3 X129.655 Y95.238 I-1.105 J-2.696 E.04166
G3 X125.873 Y95.202 I-1.566 J-34.488 E.13663
G3 X124.443 Y94.406 I.218 J-2.075 E.06072
G3 X123.836 Y92.922 I1.702 J-1.563 E.05913
G3 X123.795 Y90.395 I41.324 J-1.928 E.09127
G1 X123.819 Y85.975 E.15961
G3 X128.184 Y85.955 I3.699 J332.278 E.1576
G3 X128.666 Y85.97 I-.072 J10.07 E.01741
G3 X128.673 Y90.196 I-62.635 J2.221 E.15262
G3 X127.329 Y90.154 I.156 J-26.545 E.04855
G2 X127.257 Y87.833 I-33.813 J-.105 E.08384
G2 X127.105 Y87.427 I-.92 J.113 E.01579
G2 X126.23 Y87.281 I-.695 J1.467 E.03244
G2 X125.464 Y87.41 I-.093 J1.789 E.02827
M204 S6000
G1 X125.39 Y86.674 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130123
G1 F3000
M204 S500
G2 X124.5 Y86.839 I1.376 J9.9 E.00624
M204 S6000
G1 X124.5 Y86.908 F30000
; LINE_WIDTH: 0.26948
G1 F3000
M204 S500
G1 X125.34 Y86.649 E.01573
M204 S6000
G1 X124.749 Y86.653 F30000
; LINE_WIDTH: 0.244763
G1 F3000
M204 S500
M73 P63 R4
G1 X124.498 Y87.491 E.01395
M204 S6000
G1 X124.523 Y87.495 F30000
; LINE_WIDTH: 0.109884
G1 F3000
M204 S500
G3 X124.679 Y86.654 I8.444 J1.133 E.00453
; WIPE_START
G1 X124.523 Y87.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.783 Y86.639 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.230078
G1 F3000
M204 S500
G3 X127.939 Y87.411 I-8.42 J2.108 E.01164
; LINE_WIDTH: 0.180137
G1 X127.956 Y87.516 E.00116
; LINE_WIDTH: 0.144583
G1 X127.976 Y87.726 E.00169
; LINE_WIDTH: 0.115019
G1 X127.99 Y87.987 E.00149
; WIPE_START
G1 X127.976 Y87.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.443 Y95.203 Z.6 F30000
G1 X125.664 Y99.002 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X126.161 Y99.518 E.02589
G2 X128.093 Y101.314 I21.559 J-21.253 E.09526
G3 X131.688 Y104.531 I-270.419 J305.872 E.17419
G3 X131.675 Y105.463 I-75.048 J-.62 E.03364
G3 X124.245 Y105.474 I-4.816 J-726.216 E.26827
G3 X124.247 Y105.081 I9.121 J-.144 E.01421
G2 X129.007 Y105.043 I-1.089 J-439.428 E.17185
G2 X129.644 Y104.937 I-.035 J-2.184 E.02341
G1 X130.787 Y104.352 E.04636
G1 X129.931 Y103.404 E.04613
G2 X129.252 Y102.766 I-11.656 J11.71 E.03363
G3 X124.244 Y98.28 I511.613 J-576.218 E.24276
G1 X124.245 Y97.399 E.03179
G3 X130.45 Y97.366 I5.182 J389.385 E.22404
G3 X131.745 Y97.382 I-.179 J68.153 E.04677
G3 X131.754 Y97.835 I-5.542 J.34 E.01638
G2 X126.738 Y97.888 I-.743 J166.48 E.18114
G1 X126.005 Y97.947 E.02655
G1 X125.616 Y98.951 E.03887
G1 X125.623 Y98.958 E.00035
M204 S6000
G1 X126.146 Y98.848 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X128.397 Y100.973 I22.062 J-21.118 E.11181
G3 X132.148 Y104.333 I-242.781 J274.828 E.18182
G3 X132.123 Y105.918 I-126.164 J-1.171 E.05723
G3 X123.792 Y105.926 I-4.52 J-373.94 E.30082
G3 X123.805 Y104.632 I37.008 J-.276 E.04672
G3 X128.63 Y104.599 I4.463 J302.303 E.17422
G2 X129.472 Y104.512 I.026 J-3.85 E.03064
G1 X130.049 Y104.217 E.02338
G2 X128.945 Y103.104 I-7.776 J6.61 E.05664
G3 X123.787 Y98.476 I340.355 J-384.513 E.25022
G3 X123.797 Y96.954 I29.565 J-.566 E.05496
G3 X130.451 Y96.909 I4.737 J209.765 E.24027
G3 X132.171 Y96.943 I-.185 J52.957 E.06212
G3 X132.195 Y98.275 I-7.075 J.793 E.04818
G3 X129.191 Y98.303 I-2.147 J-69.241 E.10846
G2 X126.327 Y98.38 I-.535 J33.572 E.10348
G1 X126.168 Y98.792 E.01597
; WIPE_START
G1 X126.769 Y99.486 E-.34898
G1 X127.568 Y100.216 E-.41102
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.295 Y97.648 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14875
G1 F3000
M204 S500
G1 X125.869 Y97.666 E.00356
M204 S6000
G1 X126.295 Y97.648 F30000
; LINE_WIDTH: 0.119917
G1 F3000
M204 S500
G1 X126.721 Y97.629 E.00259
; LINE_WIDTH: 0.104147
G1 X126.817 Y97.626 E.00047
; WIPE_START
G1 X126.721 Y97.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.755 Y97.575 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50692
G1 F6300
M204 S500
G1 X125.619 Y98.439 E.04477
; WIPE_START
G1 X124.755 Y97.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.901 Y103.211 Z.6 F30000
G1 X131.499 Y104.961 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X131.144 Y104.606 E.02179
G1 X130.631 Y104.868 E.02497
G1 X131.043 Y105.281 E.02528
; WIPE_START
G1 X130.631 Y104.868 E-.26669
G1 X131.144 Y104.606 E-.26341
G1 X131.499 Y104.961 E-.2299
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.628 Y108.536 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X127.619 Y108.536 E.0003
G3 X127.572 Y114.12 I-289.029 J.33 E.20162
G3 X127.208 Y114.112 I-.04 J-6.745 E.01313
G2 X127.218 Y109.828 I-293.049 J-2.837 E.15468
G2 X127.185 Y109.482 I-1.835 J.005 E.01259
G1 X126.967 Y108.53 E.03524
G1 X124.307 Y108.453 E.09607
G1 X124.307 Y108.182 E.00977
G3 X128.948 Y108.168 I3.191 J287.586 E.16754
G3 X130.527 Y108.27 I.26 J8.207 E.05724
G3 X131.651 Y109.832 I-.438 J1.5 E.07483
G3 X131.631 Y116.129 I-74.249 J2.917 E.22743
G3 X131.007 Y117.172 I-1.349 J-.099 E.04549
G3 X130.317 Y117.518 I-1.537 J-2.205 E.02799
G3 X127.259 Y117.558 I-2.309 J-59.715 E.11044
G1 X124.311 Y117.54 E.10644
G1 X124.305 Y117.249 E.01053
G2 X129.668 Y117.199 I.871 J-196.793 E.19367
G2 X130.721 Y116.972 I.093 J-2.123 E.0393
G2 X131.281 Y115.985 I-.708 J-1.054 E.04251
G2 X131.321 Y114.205 I-18.375 J-1.304 E.06429
G2 X131.293 Y109.919 I-106.945 J-1.457 E.15476
G2 X130.965 Y108.931 I-1.503 J-.049 E.03839
G2 X129.815 Y108.488 I-1.128 J1.211 E.0456
G2 X129.187 Y108.487 I-.357 J33.759 E.02266
G1 X127.688 Y108.534 E.05416
M204 S6000
G1 X128.073 Y108.979 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X128.03 Y114.07 I-263.022 J.314 E.1838
G3 X128.01 Y114.564 I-7.302 J-.041 E.01786
G3 X126.758 Y114.534 I-.421 J-8.53 E.04528
G3 X126.775 Y111.386 I115.651 J-.93 E.11365
G2 X126.736 Y109.569 I-14.115 J-.602 E.06567
G1 X126.6 Y108.977 E.02194
G3 X123.848 Y108.895 I3.972 J-180.472 E.09942
G3 X123.862 Y107.728 I36.196 J-.143 E.04215
G3 X128.953 Y107.711 I3.571 J310.609 E.18382
G3 X130.642 Y107.828 I.263 J8.469 E.06121
G3 X132.108 Y109.811 I-.561 J1.948 E.09572
G3 X132.101 Y116.005 I-99.307 J2.997 E.22368
G3 X131.149 Y117.629 I-1.881 J-.012 E.07119
M73 P64 R4
G3 X130.228 Y117.984 I-1.105 J-1.491 E.03608
G3 X127.257 Y118.015 I-2.216 J-71.799 E.1073
G1 X123.862 Y117.995 E.12256
G1 X123.839 Y116.795 E.04334
G2 X129.648 Y116.743 I.668 J-250.155 E.20977
G2 X130.359 Y116.644 I-.032 J-2.834 E.02596
G2 X130.826 Y115.932 I-.308 J-.712 E.03256
G2 X130.864 Y114.204 I-18.108 J-1.256 E.06243
G2 X130.837 Y109.948 I-107.114 J-1.455 E.15367
G2 X130.709 Y109.351 I-1.519 J.013 E.0222
G2 X129.967 Y108.957 I-.815 J.64 E.03123
G2 X128.133 Y108.976 I-.724 J18.975 E.06626
M204 S6000
G1 X127.36 Y109.104 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.125576
G1 F3000
M204 S500
G1 X127.334 Y108.867 E.00156
; LINE_WIDTH: 0.170886
G1 X127.308 Y108.631 E.00241
; LINE_WIDTH: 0.216197
G1 X127.283 Y108.394 E.00326
; WIPE_START
G1 X127.308 Y108.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.115 Y116.046 Z.6 F30000
G1 X131.027 Y123.895 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X131.147 Y123.749 E.00684
G2 X131.297 Y123.057 I-1.235 J-.628 E.02584
G2 X131.331 Y120.144 I-432.516 J-6.508 E.10518
G1 X131.621 Y120.142 E.01048
G1 X131.639 Y121.305 E.042
G3 X131.646 Y128.805 I-378.121 J4.122 E.2708
G3 X131.329 Y128.806 I-.172 J-4.613 E.01143
G2 X131.279 Y125.656 I-54.377 J-.706 E.11379
G2 X131.147 Y125.161 I-1.536 J.145 E.01855
G1 X130.925 Y124.9 E.0124
G2 X130.473 Y124.702 I-.688 J.957 E.01795
G2 X126.799 Y124.651 I-3.457 J116.892 E.13266
G3 X124.296 Y124.612 I.625 J-121.106 E.09041
G3 X124.295 Y124.292 I8.529 J-.167 E.01156
G3 X129.507 Y124.263 I4.708 J380.059 E.18817
G2 X130.542 Y124.183 I-.015 J-6.886 E.03753
G2 X130.984 Y123.936 I-.304 J-1.063 E.01843
M204 S6000
G1 X130.679 Y123.596 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X130.828 Y123.269 I-.378 J-.37 E.01325
G2 X130.889 Y119.706 I-752.637 J-14.617 E.12866
G3 X132.06 Y119.693 I.789 J17.64 E.04229
G3 X132.096 Y129.242 I-320.132 J5.978 E.3448
G3 X130.892 Y129.246 I-.641 J-11.482 E.04349
G3 X130.862 Y126.822 I54.459 J-1.89 E.08754
G2 X130.798 Y125.55 I-8.332 J-.219 E.04603
G2 X130.395 Y125.156 I-.493 J.101 E.02158
G2 X126.795 Y125.108 I-3.429 J121.83 E.13002
G3 X123.847 Y125.056 I.565 J-114.791 E.10643
G3 X123.848 Y123.846 I25.929 J-.587 E.0437
G3 X129.498 Y123.806 I15.291 J1794.552 E.20401
G2 X130.418 Y123.742 I-.022 J-6.877 E.03331
G2 X130.634 Y123.637 I-.117 J-.516 E.00876
; WIPE_START
G1 X130.754 Y123.508 E-.06653
G1 X130.807 Y123.385 E-.05109
G1 X130.828 Y123.269 E-.04475
G1 X130.855 Y121.697 E-.59763
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.737 Y129.247 Z.6 F30000
G1 X128.2 Y139.628 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X127.955 Y139.655 E.00889
G3 X127.846 Y138.367 I5.493 J-1.113 E.04678
G3 X127.795 Y133.441 I357.222 J-6.184 E.17789
G2 X127.622 Y132.505 I-2.213 J-.075 E.03462
G2 X126.433 Y131.837 I-1.185 J.717 E.05151
G2 X125.727 Y131.845 I-.317 J3.175 E.02554
G2 X124.748 Y132.853 I.226 J1.198 E.05404
G2 X124.651 Y133.863 I8.672 J1.342 E.03667
G1 X124.619 Y140.157 E.22725
G1 X124.324 Y140.151 E.01064
G3 X124.326 Y133.034 I326.082 J-3.477 E.25699
G3 X125.111 Y131.761 I1.46 J.022 E.05667
G3 X126.222 Y131.51 I.945 J1.601 E.0418
G1 X126.419 Y131.515 E.00712
G3 X127.165 Y131.653 I.048 J1.824 E.02757
G3 X128.046 Y132.531 I-.93 J1.814 E.04565
G3 X128.176 Y134.397 I-10.66 J1.684 E.0676
G3 X128.2 Y139.568 I-264.377 J3.788 E.18673
; WIPE_START
G1 X127.955 Y139.655 E-.09879
G1 X127.88 Y139.159 E-.19086
G1 X127.846 Y138.367 E-.30102
G1 X127.842 Y137.922 E-.16933
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.003 Y139.765 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X131.112 Y139.63 E.00627
G2 X131.261 Y139.366 I-1.272 J-.894 E.01098
G2 X131.324 Y133.56 I-128.68 J-4.296 E.20965
G3 X131.343 Y131.852 I71.131 J-.078 E.0617
G1 X131.653 Y131.849 E.01121
G1 X131.663 Y132.303 E.01637
G3 X131.613 Y139.305 I-149.101 J2.451 E.25287
G3 X131.004 Y140.202 I-1.472 J-.346 E.04002
G3 X129.719 Y140.581 I-1.16 J-1.563 E.04938
G3 X128.13 Y139.867 I-.087 J-1.93 E.06527
G1 X128.29 Y139.681 E.00885
G2 X128.992 Y140.128 I2.574 J-3.268 E.0301
G2 X130.961 Y139.808 I.723 J-1.776 E.07576
M204 S6000
G1 X130.653 Y139.471 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X130.81 Y139.236 I-.636 J-.594 E.01026
G2 X130.878 Y132.232 I-276.294 J-6.187 E.25289
G3 X130.901 Y131.412 I17.82 J.104 E.02961
G3 X132.1 Y131.409 I.627 J10.383 E.0433
G3 X132.066 Y139.375 I-157.271 J3.316 E.28766
G3 X131.288 Y140.56 I-1.927 J-.418 E.05234
G3 X129.719 Y141.038 I-1.42 J-1.845 E.06052
G3 X127.527 Y139.796 I-.087 J-2.403 E.09576
G3 X127.389 Y138.379 I5.543 J-1.253 E.05156
G3 X127.338 Y133.46 I354.468 J-6.142 E.17761
G2 X127.216 Y132.72 I-1.771 J-.089 E.02729
G2 X126.404 Y132.294 I-.78 J.499 E.03465
G2 X125.803 Y132.297 I-.286 J2.703 E.02176
G2 X125.194 Y132.957 I.148 J.748 E.03468
G2 X125.095 Y134.694 I11.362 J1.519 E.06287
G1 X125.074 Y140.623 E.21407
G1 X123.869 Y140.599 E.04352
G3 X123.857 Y133.33 I428.129 J-4.357 E.26248
G3 X124.142 Y132.061 I2.325 J-.143 E.04758
G3 X126.224 Y131.053 I1.907 J1.285 E.0875
G1 X126.437 Y131.058 E.0077
G3 X127.262 Y131.194 I.023 J2.443 E.03035
G3 X128.461 Y132.329 I-1.124 J2.388 E.06061
G3 X128.593 Y133.241 I-3.419 J.96 E.03338
G3 X128.644 Y135.222 I-42.856 J2.103 E.07156
G1 X128.656 Y139.377 E.15004
M73 P65 R4
G2 X129.428 Y139.783 I1.276 J-1.491 E.03177
G2 X130.606 Y139.508 I.283 J-1.449 E.04498
; WIPE_START
G1 X130.81 Y139.236 E-.12943
G1 X130.846 Y137.577 E-.63058
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.835 Y143.333 Z.6 F30000
G1 X125.537 Y143.675 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X125.504 Y143.438 E.00862
G3 X126.318 Y143.316 I.756 J2.255 E.02985
G3 X131.31 Y143.306 I2.933 J218.6 E.18025
G1 X131.646 Y143.313 E.01215
G3 X131.651 Y143.659 I-9.126 J.291 E.01246
G3 X125.597 Y143.675 I-3.77 J-267.09 E.21857
M204 S6000
G1 X125.363 Y143.74 F30000
G1 F3000
M204 S500
G1 X124.567 Y144.657 E.04386
G1 X124.367 Y144.531 E.00852
G3 X125.231 Y143.549 I1.561 J.502 E.04857
G1 X125.347 Y143.693 E.00669
; WIPE_START
G1 X124.567 Y144.657 E-.47121
G1 X124.367 Y144.531 E-.08966
G1 X124.518 Y144.208 E-.13551
G1 X124.614 Y144.071 E-.06362
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.607 Y144.701 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X124.653 Y151.574 E.24819
G1 X125.448 Y152.37 E.04061
G1 X125.303 Y152.56 E.00863
G3 X124.443 Y151.769 I.718 J-1.644 E.04298
G1 X124.407 Y151.717 E.00229
G3 X124.383 Y151.602 I.302 J-.124 E.00427
G3 X124.304 Y150.443 I5.972 J-.989 E.042
G3 X124.341 Y144.694 I117.061 J-2.106 E.20761
G1 X124.547 Y144.699 E.00743
; WIPE_START
G1 X124.578 Y146.699 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.535 Y152.417 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X131.357 Y152.477 E.2102
G1 X131.356 Y152.749 E.00982
G3 X126.158 Y152.752 I-2.722 J-211.99 E.18768
G3 X125.494 Y152.644 I-.107 J-1.449 E.02453
G1 X125.525 Y152.476 E.00618
; WIPE_START
G1 X127.525 Y152.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.833 Y145.033 Z.6 F30000
G1 X125.628 Y144.132 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X125.065 Y144.781 E.03101
G1 X125.108 Y151.384 E.23842
G1 X125.686 Y151.961 E.02948
G1 X132.142 Y152.027 E.23312
G3 X132.134 Y153.201 I-18.425 J.469 E.04238
G3 X126.141 Y153.208 I-3.283 J-236.931 E.21639
G3 X124.851 Y152.83 I-.056 J-2.201 E.04932
G3 X123.874 Y151.224 I.874 J-1.632 E.07121
G3 X123.887 Y144.629 I113.112 J-3.081 E.23816
G1 X123.9 Y144.501 E.00463
G3 X125.62 Y142.931 I2.144 J.622 E.08847
G3 X127.397 Y142.839 I1.417 J10.18 E.06433
G3 X131.317 Y142.849 I1.445 J203.38 E.14154
G1 X132.09 Y142.867 E.02792
G3 X132.099 Y144.102 I-15.449 J.738 E.04462
G3 X125.688 Y144.133 I-4.232 J-216.266 E.23151
; WIPE_START
G1 X125.065 Y144.781 E-.34163
G1 X125.072 Y145.882 E-.41837
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.595 Y151.149 Z.6 F30000
G1 X131.751 Y152.252 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.377582
G1 F3000
M204 S500
G3 X131.75 Y152.975 I-26.422 J.317 E.01911
; WIPE_START
G1 X131.751 Y152.252 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.431 Y159.769 Z.6 F30000
G1 X129.654 Y164.192 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X129.625 Y164.013 E.00653
G2 X129.224 Y163.434 I-1.024 J.281 E.02594
G2 X125.112 Y160.519 I-134.529 J185.45 E.18199
G2 X129.414 Y157.457 I-67.967 J-100.031 E.19067
G1 X129.637 Y157.193 E.01249
G1 X129.73 Y156.722 E.01734
G1 X129.602 Y156.352 E.01413
G1 X129.372 Y156.044 E.0139
G2 X128.398 Y155.831 I-.891 J1.748 E.03638
G2 X124.295 Y155.793 I-8.784 J725.658 E.14816
G1 X124.295 Y155.481 E.01126
G3 X131.69 Y155.49 I3.221 J419.728 E.26702
G3 X131.652 Y156.364 I-23.075 J-.562 E.03161
G2 X126.841 Y159.772 I95.726 J140.259 E.21288
G2 X126.545 Y160.214 I.683 J.778 E.01945
G1 X126.513 Y160.564 E.01266
G2 X127.103 Y161.479 I1.378 J-.24 E.04039
G2 X129.166 Y162.935 I25.399 J-33.798 E.09117
G2 X131.673 Y164.689 I66.568 J-92.5 E.11049
G3 X131.698 Y165.591 I-17.72 J.941 E.03261
G3 X124.295 Y165.572 I-1.921 J-677.164 E.26731
G1 X124.294 Y165.267 E.01099
G2 X128.684 Y165.219 I.917 J-116.97 E.15853
G2 X129.61 Y164.585 I-.052 J-1.069 E.04268
G1 X129.661 Y164.251 E.01218
M204 S6000
G1 X129.2 Y164.247 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X128.929 Y163.784 I-.626 J.056 E.02
G3 X124.333 Y160.514 I828.577 J-1169.638 E.20364
G3 X127.284 Y158.447 I108.966 J152.384 E.13008
G2 X129.096 Y157.125 I-31.844 J-45.558 E.08098
G1 X129.212 Y156.988 E.00649
G1 X129.258 Y156.755 E.00859
G2 X129.076 Y156.411 I-.633 J.115 E.01427
G2 X128.38 Y156.288 I-.594 J1.331 E.02576
G2 X124.152 Y156.249 I-9.757 J821.142 E.15266
G1 X123.844 Y156.239 E.01114
G3 X123.847 Y155.035 I39.974 J-.479 E.04348
G3 X132.147 Y155.035 I4.176 J376.474 E.29968
G3 X132.098 Y156.614 I-23.585 J.052 E.05706
G2 X127.151 Y160.11 I97.255 J142.852 E.21873
G2 X127.067 Y160.791 I.359 J.39 E.02695
G2 X127.737 Y161.386 I2.343 J-1.965 E.03247
G3 X132.115 Y164.441 I-410.338 J592.671 E.19276
G3 X132.138 Y166.048 I-15.638 J1.026 E.05806
G3 X123.844 Y166.019 I-2.092 J-574.617 E.29947
G3 X123.845 Y164.812 I32.803 J-.565 E.04359
G2 X128.639 Y164.764 I1.1 J-131 E.17311
G2 X129.193 Y164.306 I.013 J-.548 E.02829
M204 S6000
G1 X129.893 Y164.078 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128742
G1 F3000
M204 S500
G2 X129.881 Y163.722 I-3.489 J-.06 E.00241
M204 S6000
G1 X129.755 Y163.664 F30000
; LINE_WIDTH: 0.108368
G1 F3000
M204 S500
M73 P66 R4
G3 X129.948 Y163.883 I-1.659 J1.653 E.00151
; WIPE_START
G1 X129.755 Y163.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.494 Y165.154 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118468
G1 F3000
M204 S500
G1 X129.398 Y165.258 E.00085
; LINE_WIDTH: 0.149559
G1 X129.302 Y165.363 E.00119
; WIPE_START
G1 X129.398 Y165.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.155 Y165.387 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5066
G1 F6300
M204 S500
G1 X130.233 Y164.466 E.04773
G1 X130.021 Y164.466 E.00776
G1 X129.982 Y164.723 E.00952
G1 X129.925 Y164.814 E.00392
G1 X130.517 Y165.406 E.03066
M204 S6000
G1 X131.405 Y165.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.123849
G1 F3000
M204 S500
G1 X131.435 Y165.154 E.00135
; WIPE_START
G1 X131.405 Y165.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.647 Y160.368 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X126.404 Y161.125 E.04639
; WIPE_START
G1 X125.647 Y160.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.728 Y156.097 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.12498
G1 F3000
M204 S500
G1 X129.654 Y155.956 E.00103
; LINE_WIDTH: 0.169109
G1 X129.579 Y155.816 E.00159
; LINE_WIDTH: 0.203055
G1 X129.563 Y155.79 E.00038
G1 X129.297 Y155.723 E.00347
M204 S6000
G1 X130.162 Y155.666 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50034
G1 F6300
M204 S500
G1 X130.907 Y156.411 E.03808
G1 X130.527 Y156.677 E.01679
G1 X130.158 Y156.309 E.01882
G1 X130.023 Y156.38 E.00553
G1 X130.132 Y156.694 E.01198
G1 X130.093 Y156.89 E.00724
G1 X130.293 Y157.091 E.01025
; WIPE_START
G1 X130.093 Y156.89 E-.10781
G1 X130.132 Y156.694 E-.0761
G1 X130.023 Y156.38 E-.12603
G1 X130.158 Y156.309 E-.05818
G1 X130.527 Y156.677 E-.19795
G1 X130.907 Y156.411 E-.17653
G1 X130.875 Y156.379 E-.01741
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.414 Y156.043 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122836
G1 F3000
M204 S500
G1 X131.393 Y155.88 E.00104
; LINE_WIDTH: 0.162656
G1 X131.372 Y155.717 E.00155
; OBJECT_ID: 331
; WIPE_START
G1 X131.393 Y155.88 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
M204 S6000
G1 X129.622 Y148.456 Z.6 F30000
G1 X114.962 Y87.032 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X114.932 Y87.057 E.00141
G2 X114.471 Y87.906 I.609 J.881 E.0362
G2 X114.51 Y92.866 I77.57 J1.866 E.17909
G2 X115.424 Y94.225 I1.433 J.024 E.06295
G2 X116.706 Y94.366 I1.14 J-4.482 E.04675
G2 X119.477 Y94.353 I1.233 J-32.842 E.10005
G2 X120.756 Y93.708 I-.044 J-1.68 E.05345
G2 X120.968 Y93.044 I-1.308 J-.783 E.02536
G2 X121.031 Y90.735 I-30.275 J-1.983 E.08343
G1 X121.071 Y86.435 E.15529
G1 X121.435 Y86.435 E.01314
G3 X121.406 Y93.378 I-196.652 J2.627 E.25073
G3 X120.359 Y94.606 I-2.453 J-1.03 E.05919
G3 X119.402 Y94.781 I-.916 J-2.308 E.03534
G3 X115.701 Y94.748 I-1.537 J-34.787 E.13371
G3 X114.673 Y94.224 I.125 J-1.517 E.04273
G3 X114.053 Y92.706 I1.4 J-1.456 E.06098
G3 X114.047 Y86.428 I182.834 J-3.313 E.22667
G3 X118.003 Y86.412 I3.199 J298.205 E.14281
G3 X118.011 Y89.733 I-121.121 J1.97 E.11992
G1 X117.553 Y89.715 E.01654
G2 X117.483 Y87.767 I-28.805 J.067 E.07039
G2 X117.207 Y87.074 I-1.588 J.23 E.02718
G1 X116.833 Y86.906 E.01482
G2 X115.128 Y86.949 I-.767 J3.349 E.0622
G1 X115.016 Y87.005 E.00454
M204 S6000
G1 X115.182 Y87.433 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X114.926 Y87.954 I.411 J.526 E.0217
G2 X114.966 Y92.827 I78.883 J1.791 E.17597
G2 X115.437 Y93.731 I1.052 J.027 E.03844
G2 X116.109 Y93.883 I.779 J-1.885 E.025
G2 X119.432 Y93.898 I1.818 J-36.594 E.12002
G2 X120.377 Y93.45 I-.008 J-1.238 E.03897
G2 X120.513 Y92.998 I-1.121 J-.584 E.01715
G2 X120.574 Y90.73 I-29.998 J-1.941 E.08193
G1 X120.619 Y85.977 E.1716
G1 X121.891 Y85.977 E.04593
G3 X121.867 Y93.431 I-233.5 J2.987 E.26912
G3 X120.554 Y95.02 I-2.776 J-.956 E.07604
G3 X119.429 Y95.238 I-1.105 J-2.696 E.04166
G3 X115.647 Y95.202 I-1.566 J-34.488 E.13663
G3 X114.217 Y94.406 I.218 J-2.075 E.06072
G3 X113.61 Y92.922 I1.702 J-1.563 E.05913
G3 X113.569 Y90.395 I41.324 J-1.928 E.09127
G1 X113.593 Y85.975 E.15961
G3 X117.958 Y85.955 I3.699 J332.278 E.1576
G3 X118.439 Y85.97 I-.072 J10.07 E.01741
G3 X118.447 Y90.196 I-62.635 J2.221 E.15262
G3 X117.103 Y90.154 I.156 J-26.545 E.04855
G2 X117.03 Y87.833 I-33.813 J-.105 E.08384
G2 X116.878 Y87.427 I-.92 J.113 E.01579
G2 X116.004 Y87.281 I-.695 J1.467 E.03244
G2 X115.238 Y87.41 I-.093 J1.789 E.02827
M204 S6000
G1 X115.164 Y86.674 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130123
G1 F3000
M204 S500
G2 X114.274 Y86.839 I1.376 J9.9 E.00624
M204 S6000
G1 X114.273 Y86.908 F30000
; LINE_WIDTH: 0.26948
G1 F3000
M204 S500
G1 X115.114 Y86.649 E.01573
M204 S6000
G1 X114.522 Y86.653 F30000
; LINE_WIDTH: 0.244763
G1 F3000
M204 S500
G1 X114.271 Y87.491 E.01395
M204 S6000
G1 X114.296 Y87.495 F30000
; LINE_WIDTH: 0.109884
G1 F3000
M204 S500
G3 X114.452 Y86.654 I8.444 J1.133 E.00453
; WIPE_START
G1 X114.296 Y87.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.556 Y86.639 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.230078
G1 F3000
M204 S500
G3 X117.712 Y87.411 I-8.42 J2.108 E.01164
; LINE_WIDTH: 0.180137
G1 X117.73 Y87.516 E.00116
; LINE_WIDTH: 0.144583
G1 X117.75 Y87.726 E.00169
; LINE_WIDTH: 0.115019
G1 X117.764 Y87.987 E.00149
; WIPE_START
G1 X117.75 Y87.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.217 Y95.203 Z.6 F30000
G1 X115.437 Y99.002 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X115.935 Y99.518 E.02589
G2 X117.866 Y101.314 I21.559 J-21.253 E.09526
G3 X121.462 Y104.531 I-270.419 J305.872 E.17419
G3 X121.448 Y105.463 I-75.048 J-.62 E.03364
G3 X114.018 Y105.474 I-4.816 J-726.216 E.26827
M73 P67 R4
G3 X114.021 Y105.081 I9.121 J-.144 E.01421
G2 X118.78 Y105.043 I-1.089 J-439.428 E.17185
G2 X119.418 Y104.937 I-.035 J-2.184 E.02341
G1 X120.56 Y104.352 E.04636
G1 X119.704 Y103.404 E.04613
G2 X119.026 Y102.766 I-11.656 J11.71 E.03363
G3 X114.018 Y98.28 I511.613 J-576.218 E.24276
G1 X114.018 Y97.399 E.03179
G3 X120.223 Y97.366 I5.182 J389.385 E.22404
G3 X121.518 Y97.382 I-.179 J68.153 E.04677
G3 X121.528 Y97.835 I-5.542 J.34 E.01638
G2 X116.511 Y97.888 I-.743 J166.48 E.18114
G1 X115.778 Y97.947 E.02655
G1 X115.39 Y98.951 E.03887
G1 X115.396 Y98.958 E.00035
M204 S6000
G1 X115.92 Y98.848 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X118.171 Y100.973 I22.062 J-21.118 E.11181
G3 X121.922 Y104.333 I-242.781 J274.828 E.18182
G3 X121.897 Y105.918 I-126.164 J-1.171 E.05723
G3 X113.565 Y105.926 I-4.52 J-373.94 E.30082
G3 X113.578 Y104.632 I37.008 J-.276 E.04672
G3 X118.404 Y104.599 I4.463 J302.303 E.17422
G2 X119.246 Y104.512 I.026 J-3.85 E.03064
G1 X119.822 Y104.217 E.02338
G2 X118.719 Y103.104 I-7.776 J6.61 E.05664
G3 X113.56 Y98.476 I340.355 J-384.513 E.25022
G3 X113.571 Y96.954 I29.565 J-.566 E.05496
G3 X120.225 Y96.909 I4.737 J209.765 E.24027
G3 X121.945 Y96.943 I-.185 J52.957 E.06212
G3 X121.969 Y98.275 I-7.075 J.793 E.04818
G3 X118.965 Y98.303 I-2.147 J-69.241 E.10846
G2 X116.101 Y98.38 I-.535 J33.572 E.10348
G1 X115.941 Y98.792 E.01597
; WIPE_START
G1 X116.543 Y99.486 E-.34898
G1 X117.341 Y100.216 E-.41102
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.068 Y97.648 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14875
G1 F3000
M204 S500
G1 X115.642 Y97.666 E.00356
M204 S6000
G1 X116.068 Y97.648 F30000
; LINE_WIDTH: 0.119917
G1 F3000
M204 S500
G1 X116.494 Y97.629 E.00259
; LINE_WIDTH: 0.104147
G1 X116.591 Y97.626 E.00047
; WIPE_START
G1 X116.494 Y97.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.528 Y97.575 Z.6 F30000
G1 Z.2
M73 P67 R3
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50692
G1 F6300
M204 S500
G1 X115.392 Y98.439 E.04477
; WIPE_START
G1 X114.528 Y97.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.675 Y103.211 Z.6 F30000
G1 X121.273 Y104.961 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X120.917 Y104.606 E.02179
G1 X120.404 Y104.868 E.02497
G1 X120.817 Y105.281 E.02528
; WIPE_START
G1 X120.404 Y104.868 E-.26669
G1 X120.917 Y104.606 E-.26341
G1 X121.273 Y104.961 E-.2299
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.401 Y108.536 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X117.393 Y108.536 E.0003
G3 X117.345 Y114.12 I-289.029 J.33 E.20162
G3 X116.982 Y114.112 I-.04 J-6.745 E.01313
G2 X116.992 Y109.828 I-293.049 J-2.837 E.15468
G2 X116.958 Y109.482 I-1.835 J.005 E.01259
G1 X116.741 Y108.53 E.03524
G1 X114.081 Y108.453 E.09607
G1 X114.081 Y108.182 E.00977
G3 X118.721 Y108.168 I3.191 J287.586 E.16754
G3 X120.301 Y108.27 I.26 J8.207 E.05724
G3 X121.425 Y109.832 I-.438 J1.5 E.07483
G3 X121.405 Y116.129 I-74.249 J2.917 E.22743
G3 X120.781 Y117.172 I-1.349 J-.099 E.04549
G3 X120.09 Y117.518 I-1.537 J-2.205 E.02799
G3 X117.032 Y117.558 I-2.309 J-59.715 E.11044
G1 X114.084 Y117.54 E.10644
G1 X114.078 Y117.249 E.01053
G2 X119.442 Y117.199 I.871 J-196.793 E.19367
G2 X120.494 Y116.972 I.093 J-2.123 E.0393
G2 X121.054 Y115.985 I-.708 J-1.054 E.04251
G2 X121.094 Y114.205 I-18.375 J-1.304 E.06429
G2 X121.067 Y109.919 I-106.945 J-1.457 E.15476
G2 X120.738 Y108.931 I-1.503 J-.049 E.03839
G2 X119.588 Y108.488 I-1.128 J1.211 E.0456
G2 X118.961 Y108.487 I-.357 J33.759 E.02266
G1 X117.461 Y108.534 E.05416
M204 S6000
G1 X117.847 Y108.979 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X117.803 Y114.07 I-263.022 J.314 E.1838
G3 X117.784 Y114.564 I-7.302 J-.041 E.01786
G3 X116.531 Y114.534 I-.421 J-8.53 E.04528
G3 X116.549 Y111.386 I115.651 J-.93 E.11365
G2 X116.509 Y109.569 I-14.115 J-.602 E.06567
G1 X116.374 Y108.977 E.02194
G3 X113.622 Y108.895 I3.972 J-180.472 E.09942
G3 X113.636 Y107.728 I36.196 J-.143 E.04215
G3 X118.727 Y107.711 I3.571 J310.609 E.18382
G3 X120.415 Y107.828 I.263 J8.469 E.06121
G3 X121.881 Y109.811 I-.561 J1.948 E.09572
G3 X121.875 Y116.005 I-99.307 J2.997 E.22368
G3 X120.923 Y117.629 I-1.881 J-.012 E.07119
G3 X120.002 Y117.984 I-1.105 J-1.491 E.03608
G3 X117.031 Y118.015 I-2.216 J-71.799 E.1073
G1 X113.636 Y117.995 E.12256
G1 X113.612 Y116.795 E.04334
G2 X119.422 Y116.743 I.668 J-250.155 E.20977
G2 X120.132 Y116.644 I-.032 J-2.834 E.02596
G2 X120.6 Y115.932 I-.308 J-.712 E.03256
G2 X120.637 Y114.204 I-18.108 J-1.256 E.06243
G2 X120.611 Y109.948 I-107.115 J-1.455 E.15367
G2 X120.483 Y109.351 I-1.519 J.013 E.0222
G2 X119.741 Y108.957 I-.815 J.64 E.03123
G2 X117.907 Y108.976 I-.724 J18.975 E.06626
M204 S6000
G1 X117.134 Y109.104 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.125576
G1 F3000
M204 S500
G1 X117.108 Y108.867 E.00156
; LINE_WIDTH: 0.170886
G1 X117.082 Y108.631 E.00241
; LINE_WIDTH: 0.216197
G1 X117.056 Y108.394 E.00326
; WIPE_START
G1 X117.082 Y108.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.889 Y116.046 Z.6 F30000
G1 X120.801 Y123.895 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X120.921 Y123.749 E.00684
G2 X121.07 Y123.057 I-1.235 J-.628 E.02584
G2 X121.104 Y120.144 I-432.516 J-6.508 E.10518
M73 P68 R3
G1 X121.395 Y120.142 E.01048
G1 X121.412 Y121.305 E.042
G3 X121.42 Y128.805 I-378.121 J4.122 E.2708
G3 X121.103 Y128.806 I-.172 J-4.613 E.01143
G2 X121.053 Y125.656 I-54.377 J-.706 E.11379
G2 X120.921 Y125.161 I-1.536 J.145 E.01855
G1 X120.698 Y124.9 E.0124
G2 X120.246 Y124.702 I-.688 J.957 E.01795
G2 X116.573 Y124.651 I-3.457 J116.892 E.13266
G3 X114.069 Y124.612 I.625 J-121.106 E.09041
G3 X114.069 Y124.292 I8.529 J-.167 E.01156
G3 X119.28 Y124.263 I4.708 J380.059 E.18817
G2 X120.316 Y124.183 I-.015 J-6.886 E.03753
G2 X120.757 Y123.936 I-.304 J-1.063 E.01843
M204 S6000
G1 X120.452 Y123.596 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X120.602 Y123.269 I-.378 J-.37 E.01325
G2 X120.663 Y119.706 I-752.637 J-14.617 E.12866
G3 X121.834 Y119.693 I.789 J17.64 E.04229
G3 X121.87 Y129.242 I-320.132 J5.978 E.3448
G3 X120.666 Y129.246 I-.641 J-11.482 E.04349
G3 X120.635 Y126.822 I54.459 J-1.89 E.08754
G2 X120.572 Y125.55 I-8.332 J-.219 E.04603
G2 X120.169 Y125.156 I-.493 J.101 E.02158
G2 X116.568 Y125.108 I-3.429 J121.83 E.13002
G3 X113.621 Y125.056 I.565 J-114.791 E.10643
G3 X113.622 Y123.846 I25.929 J-.587 E.0437
G3 X119.272 Y123.806 I15.291 J1794.552 E.20401
G2 X120.192 Y123.742 I-.022 J-6.877 E.03331
G2 X120.408 Y123.637 I-.117 J-.516 E.00876
; WIPE_START
G1 X120.527 Y123.508 E-.06653
G1 X120.581 Y123.385 E-.05109
G1 X120.602 Y123.269 E-.04475
G1 X120.629 Y121.697 E-.59763
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.511 Y129.247 Z.6 F30000
G1 X117.973 Y139.628 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X117.729 Y139.655 E.00889
G3 X117.62 Y138.367 I5.493 J-1.113 E.04678
G3 X117.568 Y133.441 I357.222 J-6.184 E.17789
G2 X117.396 Y132.505 I-2.213 J-.075 E.03462
G2 X116.206 Y131.837 I-1.185 J.717 E.05151
G2 X115.5 Y131.845 I-.317 J3.175 E.02554
G2 X114.522 Y132.853 I.226 J1.198 E.05404
G2 X114.425 Y133.863 I8.672 J1.342 E.03667
G1 X114.392 Y140.157 E.22725
G1 X114.098 Y140.151 E.01064
G3 X114.099 Y133.034 I326.082 J-3.477 E.25699
G3 X114.885 Y131.761 I1.46 J.022 E.05667
G3 X115.996 Y131.51 I.945 J1.601 E.0418
G1 X116.193 Y131.515 E.00712
G3 X116.938 Y131.653 I.048 J1.824 E.02757
G3 X117.819 Y132.531 I-.93 J1.814 E.04565
G3 X117.95 Y134.397 I-10.66 J1.684 E.0676
G3 X117.974 Y139.568 I-264.377 J3.788 E.18673
; WIPE_START
G1 X117.729 Y139.655 E-.09879
G1 X117.653 Y139.159 E-.19086
G1 X117.62 Y138.367 E-.30102
G1 X117.615 Y137.922 E-.16933
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.776 Y139.765 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X120.885 Y139.63 E.00627
G2 X121.035 Y139.366 I-1.272 J-.894 E.01098
G2 X121.098 Y133.56 I-128.68 J-4.296 E.20965
G3 X121.116 Y131.852 I71.131 J-.078 E.0617
G1 X121.427 Y131.849 E.01121
G1 X121.436 Y132.303 E.01637
G3 X121.387 Y139.305 I-149.101 J2.451 E.25287
G3 X120.777 Y140.202 I-1.472 J-.346 E.04002
G3 X119.493 Y140.581 I-1.16 J-1.563 E.04938
G3 X117.903 Y139.867 I-.087 J-1.93 E.06527
G1 X118.063 Y139.681 E.00885
G2 X118.765 Y140.128 I2.574 J-3.268 E.0301
G2 X120.735 Y139.808 I.723 J-1.776 E.07576
M204 S6000
G1 X120.426 Y139.471 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X120.583 Y139.236 I-.635 J-.594 E.01026
G2 X120.651 Y132.232 I-276.294 J-6.187 E.25289
G3 X120.675 Y131.412 I17.82 J.104 E.02961
G3 X121.874 Y131.409 I.627 J10.383 E.0433
G3 X121.84 Y139.375 I-157.271 J3.316 E.28766
G3 X121.062 Y140.56 I-1.927 J-.418 E.05234
G3 X119.493 Y141.038 I-1.42 J-1.845 E.06052
G3 X117.3 Y139.796 I-.087 J-2.403 E.09576
G3 X117.163 Y138.379 I5.543 J-1.253 E.05156
G3 X117.112 Y133.46 I354.468 J-6.142 E.17761
G2 X116.99 Y132.72 I-1.771 J-.089 E.02729
G2 X116.178 Y132.294 I-.78 J.499 E.03465
G2 X115.576 Y132.297 I-.286 J2.703 E.02176
G2 X114.967 Y132.957 I.148 J.748 E.03468
G2 X114.868 Y134.694 I11.362 J1.519 E.06287
G1 X114.848 Y140.623 E.21407
G1 X113.643 Y140.599 E.04352
G3 X113.63 Y133.33 I428.129 J-4.357 E.26248
G3 X113.916 Y132.061 I2.325 J-.143 E.04758
G3 X115.997 Y131.053 I1.907 J1.285 E.0875
G1 X116.211 Y131.058 E.0077
G3 X117.036 Y131.194 I.023 J2.443 E.03035
G3 X118.234 Y132.329 I-1.124 J2.388 E.06061
G3 X118.366 Y133.241 I-3.419 J.96 E.03338
G3 X118.418 Y135.222 I-42.856 J2.103 E.07156
G1 X118.43 Y139.377 E.15004
G2 X119.202 Y139.783 I1.276 J-1.491 E.03177
G2 X120.379 Y139.508 I.283 J-1.449 E.04498
; WIPE_START
G1 X120.583 Y139.236 E-.12943
G1 X120.62 Y137.577 E-.63058
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.608 Y143.333 Z.6 F30000
G1 X115.311 Y143.675 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X115.278 Y143.438 E.00862
G3 X116.091 Y143.316 I.756 J2.255 E.02985
G3 X121.083 Y143.306 I2.933 J218.6 E.18025
G1 X121.42 Y143.313 E.01215
G3 X121.424 Y143.659 I-9.126 J.291 E.01246
G3 X115.371 Y143.675 I-3.77 J-267.09 E.21857
M204 S6000
G1 X115.136 Y143.74 F30000
G1 F3000
M204 S500
G1 X114.34 Y144.657 E.04386
G1 X114.141 Y144.531 E.00852
G3 X115.005 Y143.549 I1.561 J.502 E.04857
G1 X115.12 Y143.693 E.00669
; WIPE_START
G1 X114.34 Y144.657 E-.47121
G1 X114.141 Y144.531 E-.08966
G1 X114.292 Y144.208 E-.13551
G1 X114.388 Y144.071 E-.06362
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.381 Y144.701 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
M73 P69 R3
G1 X114.426 Y151.574 E.24819
G1 X115.221 Y152.37 E.04061
G1 X115.077 Y152.56 E.00863
G3 X114.217 Y151.769 I.718 J-1.644 E.04298
G1 X114.18 Y151.717 E.00229
G3 X114.156 Y151.602 I.302 J-.124 E.00427
G3 X114.077 Y150.443 I5.972 J-.989 E.042
G3 X114.115 Y144.694 I117.061 J-2.106 E.20761
G1 X114.321 Y144.699 E.00743
; WIPE_START
G1 X114.351 Y146.699 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.309 Y152.417 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X121.13 Y152.477 E.2102
G1 X121.13 Y152.749 E.00982
G3 X115.932 Y152.752 I-2.722 J-211.99 E.18768
G3 X115.267 Y152.644 I-.107 J-1.449 E.02453
G1 X115.298 Y152.476 E.00618
; WIPE_START
G1 X117.298 Y152.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.606 Y145.033 Z.6 F30000
G1 X115.401 Y144.132 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X114.838 Y144.781 E.03101
G1 X114.882 Y151.384 E.23842
G1 X115.459 Y151.961 E.02948
G1 X121.915 Y152.027 E.23312
G3 X121.908 Y153.201 I-18.425 J.469 E.04238
G3 X115.915 Y153.208 I-3.283 J-236.931 E.21639
G3 X114.625 Y152.83 I-.056 J-2.201 E.04932
G3 X113.648 Y151.224 I.874 J-1.632 E.07121
G3 X113.661 Y144.629 I113.112 J-3.081 E.23816
G1 X113.673 Y144.501 E.00463
G3 X115.393 Y142.931 I2.144 J.622 E.08847
G3 X117.17 Y142.839 I1.417 J10.18 E.06433
G3 X121.09 Y142.849 I1.445 J203.38 E.14154
G1 X121.863 Y142.867 E.02792
G3 X121.873 Y144.102 I-15.449 J.738 E.04462
G3 X115.461 Y144.133 I-4.232 J-216.266 E.23151
; WIPE_START
G1 X114.838 Y144.781 E-.34163
G1 X114.846 Y145.882 E-.41837
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.369 Y151.149 Z.6 F30000
G1 X121.525 Y152.252 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.377582
G1 F3000
M204 S500
G3 X121.524 Y152.975 I-26.422 J.317 E.01911
; WIPE_START
G1 X121.525 Y152.252 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.204 Y159.769 Z.6 F30000
G1 X119.427 Y164.192 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X119.399 Y164.013 E.00653
G2 X118.998 Y163.434 I-1.024 J.281 E.02594
G2 X114.885 Y160.519 I-134.529 J185.45 E.18199
G2 X119.187 Y157.457 I-67.967 J-100.031 E.19067
G1 X119.411 Y157.193 E.01249
G1 X119.504 Y156.722 E.01734
G1 X119.376 Y156.352 E.01413
G1 X119.146 Y156.044 E.0139
G2 X118.172 Y155.831 I-.891 J1.748 E.03638
G2 X114.069 Y155.793 I-8.784 J725.658 E.14816
G1 X114.068 Y155.481 E.01126
G3 X121.464 Y155.49 I3.221 J419.728 E.26702
G3 X121.426 Y156.364 I-23.075 J-.562 E.03161
G2 X116.615 Y159.772 I95.726 J140.259 E.21288
G2 X116.319 Y160.214 I.683 J.778 E.01945
G1 X116.286 Y160.564 E.01266
G2 X116.877 Y161.479 I1.378 J-.24 E.04039
G2 X118.939 Y162.935 I25.399 J-33.798 E.09117
G2 X121.447 Y164.689 I66.568 J-92.5 E.11049
G3 X121.472 Y165.591 I-17.72 J.941 E.03261
G3 X114.068 Y165.572 I-1.921 J-677.164 E.26731
G1 X114.067 Y165.267 E.01099
G2 X118.457 Y165.219 I.917 J-116.97 E.15853
G2 X119.384 Y164.585 I-.052 J-1.069 E.04268
G1 X119.435 Y164.251 E.01218
M204 S6000
G1 X118.973 Y164.247 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X118.703 Y163.784 I-.626 J.056 E.02
G3 X114.107 Y160.514 I828.577 J-1169.638 E.20364
G3 X117.057 Y158.447 I108.966 J152.384 E.13008
G2 X118.869 Y157.125 I-31.844 J-45.558 E.08098
G1 X118.985 Y156.988 E.00649
G1 X119.031 Y156.755 E.00859
G2 X118.849 Y156.411 I-.633 J.115 E.01427
G2 X118.154 Y156.288 I-.594 J1.331 E.02576
G2 X113.926 Y156.249 I-9.757 J821.142 E.15266
G1 X113.617 Y156.239 E.01114
G3 X113.621 Y155.035 I39.974 J-.479 E.04348
G3 X121.921 Y155.035 I4.176 J376.474 E.29968
G3 X121.871 Y156.614 I-23.585 J.052 E.05706
G2 X116.924 Y160.11 I97.255 J142.852 E.21873
G2 X116.84 Y160.791 I.359 J.39 E.02695
G2 X117.511 Y161.386 I2.343 J-1.965 E.03247
G3 X121.889 Y164.441 I-410.338 J592.671 E.19276
G3 X121.911 Y166.048 I-15.638 J1.026 E.05806
G3 X113.617 Y166.019 I-2.092 J-574.617 E.29947
G3 X113.619 Y164.812 I32.803 J-.565 E.04359
G2 X118.413 Y164.764 I1.1 J-131 E.17311
G2 X118.966 Y164.306 I.013 J-.548 E.02829
M204 S6000
G1 X119.666 Y164.078 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128742
G1 F3000
M204 S500
G2 X119.654 Y163.722 I-3.489 J-.06 E.00241
M204 S6000
G1 X119.529 Y163.664 F30000
; LINE_WIDTH: 0.108368
G1 F3000
M204 S500
G3 X119.722 Y163.883 I-1.659 J1.653 E.00151
; WIPE_START
G1 X119.529 Y163.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.268 Y165.154 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118468
G1 F3000
M204 S500
G1 X119.172 Y165.258 E.00085
; LINE_WIDTH: 0.149559
G1 X119.076 Y165.363 E.00119
; WIPE_START
G1 X119.172 Y165.258 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.928 Y165.387 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5066
G1 F6300
M204 S500
G1 X120.007 Y164.466 E.04773
G1 X119.795 Y164.466 E.00776
G1 X119.756 Y164.723 E.00952
G1 X119.699 Y164.814 E.00392
G1 X120.291 Y165.406 E.03066
M204 S6000
G1 X121.179 Y165.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.123849
G1 F3000
M204 S500
G1 X121.208 Y165.154 E.00135
; WIPE_START
G1 X121.179 Y165.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P70 R3
G1 X115.42 Y160.368 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X116.178 Y161.125 E.04639
; WIPE_START
G1 X115.42 Y160.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.502 Y156.097 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.12498
G1 F3000
M204 S500
G1 X119.428 Y155.956 E.00103
; LINE_WIDTH: 0.169109
G1 X119.353 Y155.816 E.00159
; LINE_WIDTH: 0.203055
G1 X119.336 Y155.79 E.00038
G1 X119.071 Y155.723 E.00347
M204 S6000
G1 X119.936 Y155.666 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50034
G1 F6300
M204 S500
G1 X120.681 Y156.411 E.03808
G1 X120.3 Y156.677 E.01679
G1 X119.932 Y156.309 E.01882
G1 X119.797 Y156.38 E.00553
G1 X119.905 Y156.694 E.01198
G1 X119.866 Y156.89 E.00724
G1 X120.067 Y157.091 E.01025
; WIPE_START
G1 X119.866 Y156.89 E-.10781
G1 X119.905 Y156.694 E-.0761
G1 X119.797 Y156.38 E-.12603
G1 X119.932 Y156.309 E-.05818
G1 X120.3 Y156.677 E-.19795
G1 X120.681 Y156.411 E-.17653
G1 X120.649 Y156.379 E-.01741
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.188 Y156.043 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122836
G1 F3000
M204 S500
G1 X121.167 Y155.88 E.00104
; LINE_WIDTH: 0.162656
G1 X121.146 Y155.717 E.00155
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3000
G1 X121.167 Y155.88 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 2/4
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
; object ids of layer 2 start: 169,331,425
M624 BwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer2 end: 169,331,425
M625
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.652 Y156.678
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X139.58 Y156.47 E.00945
G2 X139.415 Y156.261 I-.682 J.368 E.01155
G2 X138.798 Y156.112 I-.571 J1.01 E.02774
G2 X134.249 Y156.06 I-6.536 J375.104 E.19616
G3 X134.254 Y155.214 I17.494 J-.334 E.03648
G3 X142.193 Y155.219 I3.721 J426.531 E.34235
G3 X142.144 Y156.513 I-22.684 J-.209 E.05586
G2 X137.25 Y159.975 I86.806 J127.905 E.25849
G2 X137.219 Y161.002 I.492 J.529 E.0493
G2 X137.8 Y161.496 I2.959 J-2.892 E.03294
G2 X142.165 Y164.543 I807.609 J-1152.394 E.22955
G3 X142.188 Y165.864 I-18.182 J.973 E.05697
G3 X134.251 Y165.839 I-2.114 J-587.958 E.34225
G3 X134.251 Y164.996 I33.794 J-.441 E.03633
G2 X138.876 Y164.949 I1.184 J-111.6 E.19948
G2 X139.342 Y164.796 I-.091 J-1.062 E.02133
G2 X139.288 Y163.652 I-.449 J-.552 E.0574
G2 X134.874 Y160.518 I-235.825 J327.478 E.23344
G2 X139.247 Y157.419 I-190.181 J-273.047 E.23114
G2 X139.636 Y157.033 I-.658 J-1.051 E.02381
G1 X139.66 Y156.736 E.01288
G1 X139.278 Y156.757 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.247 Y156.652 I-.275 J.027 E.00439
G2 X139.019 Y156.504 I-.274 J.173 E.01113
G2 X135.914 Y156.454 I-2.506 J58.481 E.12363
G3 X133.891 Y156.425 I.048 J-74.485 E.08051
G3 X133.896 Y154.849 I19.632 J-.729 E.06273
G3 X142.547 Y154.845 I4.488 J332.294 E.34432
G3 X142.509 Y156.718 I-15.279 J.634 E.07459
G2 X137.506 Y160.251 I87.947 J129.844 E.24385
G2 X137.56 Y160.819 I.27 J.26 E.02578
G2 X138.582 Y161.591 I7.227 J-8.504 E.05102
G3 X140.925 Y163.229 I-56.115 J82.729 E.11377
G3 X142.515 Y164.336 I-19.43 J29.634 E.07714
G3 X142.533 Y166.238 I-11.086 J1.052 E.07582
G3 X133.891 Y166.206 I-2.329 J-523.15 E.34395
G3 X133.891 Y164.622 I20.528 J-.8 E.06304
G2 X138.842 Y164.575 I1.22 J-133.023 E.1971
G2 X139.22 Y164.34 I.011 J-.402 E.01875
G2 X139.045 Y163.939 I-.357 J-.084 E.01867
G3 X134.312 Y160.566 I453.819 J-641.818 E.23134
G1 X134.247 Y160.513 E.00332
G3 X138.646 Y157.399 I1147.337 J1616.221 E.21454
G2 X139.194 Y156.984 I-7.158 J-10.003 E.02735
G2 X139.278 Y156.817 I-.191 J-.2 E.00758
M204 S10000
G1 X139.772 Y157.598 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
G1 X136.924 Y159.642 E.19585
G1 X136.567 Y159.788 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X135.524 Y160.52 E.05071
G1 X136.622 Y161.3 E.05363
G1 X136.814 Y161.052 E.01246
G3 X136.635 Y160.473 I.898 J-.595 E.02448
G1 X136.7 Y160.131 E.01386
G1 X136.748 Y160.038 E.00416
G1 X136.602 Y159.836 E.00991
G1 X136.255 Y160.473 F30000
; LINE_WIDTH: 0.511568
G1 F5695.554
G2 X136.252 Y160.571 I-.028 J.048 E.01147
G1 X136.987 Y161.441 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
G2 X139.688 Y163.377 I58.661 J-79.002 E.18711
G1 X140.046 Y163.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X139.858 Y163.778 E.01255
G1 X139.956 Y164.001 E.00971
G3 X139.797 Y164.857 I-1.156 J.228 E.03551
G1 X139.524 Y165.125 E.01522
G1 X139.415 Y165.179 E.00485
G1 X139.421 Y165.488 E.01232
G1 X141.819 Y165.489 E.09542
G1 X141.796 Y164.743 E.0297
G1 X140.095 Y163.558 E.08252
G1 X140.342 Y164.169 F30000
G1 F7144.644
G1 X140.303 Y164.594 E.01702
G1 X140.155 Y164.961 E.01572
G1 X140.036 Y165.129 E.00819
G1 X141.448 Y165.129 E.05619
G1 X141.442 Y164.935 E.00773
G1 X140.391 Y164.203 E.05096
G1 X140.635 Y164.745 F30000
; LINE_WIDTH: 0.394909
G1 F7680.033
G1 X140.572 Y164.781 E.00268
G1 X140.619 Y164.808 E.00201
G1 X139.045 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
G1 X135.833 Y165.424 E.1745
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X134.445 Y165.419 E.07177
; WIPE_START
G1 X135.833 Y165.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.761 Y157.867 Z.88 F30000
G1 X134.444 Y155.637 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.532414
G1 F5444.184
G1 X134.844 Y155.639 E.02089
; LINE_WIDTH: 0.556294
G1 F5182.184
G3 X137.423 Y155.64 I.796 J804.611 E.14149
G1 X139.128 Y155.67 E.09362
G1 X139.507 Y155.581 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X139.495 Y155.885 E.01208
G1 X139.681 Y155.992 E.00855
G1 X139.924 Y156.317 E.01617
G1 X140.039 Y156.699 E.01586
G1 X139.969 Y157.225 E.02115
G1 X140.133 Y157.455 E.01124
G1 X141.776 Y156.312 E.07967
G1 X141.804 Y155.592 E.02868
G1 X139.567 Y155.582 E.08903
G1 X140.247 Y156.017 F30000
; LINE_WIDTH: 0.565569
G1 F5087.102
G1 X140.439 Y156.485 E.02828
G1 X140.466 Y156.696 E.0119
G1 X141.352 Y156.08 E.06035
G1 X141.354 Y156.022 E.00321
G1 X140.307 Y156.018 E.05856
; WIPE_START
G1 X141.354 Y156.022 E-.3981
G1 X141.352 Y156.08 E-.02184
G1 X140.618 Y156.591 E-.34007
; WIPE_END
G1 E-.04 F1800
G1 X137.852 Y149.477 Z.88 F30000
G1 X135.723 Y144.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X135.106 Y144.712 E.04063
G1 X135.15 Y151.461 E.29102
G1 X135.835 Y152.145 E.04174
G1 X142.186 Y152.211 E.27389
G3 X142.184 Y153.017 I-15.639 J.362 E.03479
G3 X136.114 Y153.011 I-2.858 J-184.576 E.26177
G3 X135.512 Y152.849 I.021 J-1.275 E.02715
G3 X134.476 Y151.984 I.751 J-1.952 E.05926
G3 X134.286 Y151.223 I1.386 J-.75 E.03419
G3 X134.253 Y146.5 I104.203 J-3.088 E.20368
G3 X134.307 Y144.546 I30.526 J-.146 E.08426
G3 X135.891 Y143.11 I1.957 J.566 E.09708
G3 X137.622 Y143.024 I1.375 J10.16 E.07482
G3 X140.843 Y143.025 I1.512 J225.279 E.13889
G3 X142.139 Y143.047 I-.245 J52.583 E.0559
G3 X142.146 Y143.923 I-21.432 J.606 E.03778
G3 X135.77 Y143.947 I-4.211 J-273.027 E.27494
G1 X135.763 Y143.955 E.00047
G1 X135.941 Y144.322 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.482 Y144.851 E.02789
G1 X135.524 Y151.305 E.25687
G1 X135.992 Y151.772 E.02631
G1 X142.555 Y151.839 E.26126
G3 X142.535 Y153.39 I-12.499 J.612 E.06177
G3 X136.088 Y153.385 I-3.083 J-193.366 E.25663
G3 X135.357 Y153.191 I.052 J-1.664 E.03036
G3 X134.147 Y152.164 I.912 J-2.301 E.06429
G3 X133.912 Y151.249 I1.739 J-.934 E.03798
G3 X133.878 Y146.497 I103.801 J-3.114 E.18917
G3 X133.942 Y144.454 I26.721 J-.195 E.08137
G3 X135.799 Y142.746 I2.327 J.667 E.10563
G3 X137.62 Y142.649 I1.459 J10.173 E.07266
G3 X140.846 Y142.65 I1.513 J225.615 E.12842
G3 X142.5 Y142.69 I.118 J29.411 E.06586
G3 X142.504 Y144.283 I-18.899 J.844 E.06344
G3 X136.001 Y144.323 I-4.493 J-206.388 E.25886
M204 S10000
G1 X135.848 Y143.542 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
G1 X135.721 Y143.563 E.00571
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X135.542 Y143.631 I.076 J.465 E.0077
G1 X141.952 Y143.486 F30000
; LINE_WIDTH: 0.588624
G1 F4865.193
G2 X136.275 Y143.503 I-1.688 J381.573 E.3318
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X135.991 Y143.523 I.084 J3.261 E.01517
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X135.848 Y143.542 E.00699
G1 X135.93 Y143.301 F30000
; LINE_WIDTH: 0.489929
G1 F5982.279
G1 X135.626 Y143.555 E.01882
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X135.254 Y143.869 I3.535 J4.562 E.02485
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X134.895 Y144.284 I2.048 J2.135 E.03096
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X134.834 Y144.373 E.00567
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X134.752 Y144.503 E.0075
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X134.699 Y144.732 I.484 J.232 E.01137
G2 X134.689 Y145.384 I33.324 J.83 E.03121
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X134.727 Y151.395 I173.802 J1.921 E.32149
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X134.739 Y151.544 E.00731
G2 X134.854 Y151.776 I.425 J-.066 E.01291
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X135.273 Y152.209 I1.874 J-1.392 E.03404
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X135.374 Y152.291 E.00692
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X135.455 Y152.353 E.00508
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X135.535 Y152.414 E.00478
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X135.812 Y152.543 I.431 J-.561 E.01318
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X135.954 Y152.569 E.00688
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X138.568 Y152.606 I1.938 J-45.472 E.13918
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X140.281 Y152.609 E.08747
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X141.994 Y152.613 E.08261
; WIPE_START
G1 X140.281 Y152.609 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.619 Y145.006 Z.88 F30000
G1 X139.165 Y139.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X139.349 Y139.886 E.00897
G2 X141.02 Y139.592 I.592 J-1.531 E.07689
G2 X141.217 Y139.295 I-.907 J-.814 E.01544
G2 X141.273 Y136.139 I-91.854 J-3.227 E.1361
G3 X141.305 Y131.589 I190.503 J-.97 E.19623
G3 X142.147 Y131.583 I.51 J12.053 E.03633
G3 X142.11 Y139.346 I-164.906 J3.091 E.33479
G3 X141.393 Y140.42 I-1.745 J-.388 E.05696
G3 X139.946 Y140.853 I-1.323 J-1.782 E.06649
G3 X137.935 Y139.754 I-.081 J-2.24 E.10371
G3 X137.817 Y138.871 I3.141 J-.871 E.03852
G3 X137.749 Y133.433 I938.133 J-14.477 E.23453
G2 X137.605 Y132.632 I-2.427 J.02 E.03526
G2 X136.635 Y132.109 I-.941 J.583 E.04976
G2 X135.877 Y132.144 I-.274 J2.308 E.03289
G2 X135.238 Y132.925 I.314 J.908 E.04581
G2 X135.138 Y134.544 I9.636 J1.409 E.07004
G1 X135.116 Y140.434 E.254
G1 X134.28 Y140.418 E.03609
M73 P71 R3
G3 X134.27 Y133.277 I367.728 J-4.084 E.30795
G3 X134.633 Y131.998 I2.012 J-.12 E.0584
G3 X136.536 Y131.24 I1.685 J1.46 E.09181
G3 X137.41 Y131.361 I.084 J2.601 E.03822
G3 X138.505 Y132.371 I-1.099 J2.291 E.06519
G3 X138.659 Y133.78 I-5.61 J1.326 E.06128
G3 X138.686 Y135.215 I-55.594 J1.737 E.06191
G1 X138.698 Y139.475 E.18369
G2 X139.112 Y139.76 I2.137 J-2.662 E.02172
G1 X139.341 Y139.46 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.933 Y139.617 I.644 J-1.234 E.02458
G2 X140.747 Y139.333 I.042 J-1.19 E.03511
G2 X140.847 Y139.185 I-.45 J-.413 E.00714
G2 X140.914 Y132.216 I-272.184 J-6.106 E.2774
G3 X140.949 Y131.24 I15.683 J.07 E.03888
G3 X142.509 Y131.235 I.812 J9.744 E.06217
G3 X142.481 Y139.403 I-149.209 J3.571 E.32516
G3 X141.626 Y140.714 I-2.118 J-.448 E.06376
G3 X139.945 Y141.228 I-1.553 J-2.073 E.07135
G3 X137.587 Y139.894 I-.084 J-2.603 E.11342
G3 X137.442 Y138.887 I3.413 J-1.005 E.04064
G3 X137.374 Y133.45 I906.214 J-14.078 E.21643
G2 X137.274 Y132.81 I-2.101 J.001 E.02588
G2 X136.75 Y132.497 I-.586 J.386 E.02511
G2 X135.985 Y132.503 I-.359 J2.881 E.03057
G2 X135.604 Y133.008 I.208 J.553 E.02656
G2 X135.512 Y134.547 I9.415 J1.33 E.06143
G1 X135.49 Y140.817 E.24956
G1 X133.906 Y140.786 E.06304
G3 X133.895 Y133.265 I383.096 J-4.349 E.29935
G3 X134.51 Y131.577 I2.273 J-.128 E.07351
G3 X136.547 Y130.865 I1.805 J1.895 E.08851
G3 X137.557 Y131.016 I.076 J2.948 E.04087
G3 X138.855 Y132.234 I-1.232 J2.613 E.07202
G3 X139.008 Y133.215 I-3.755 J1.089 E.03961
G3 X139.06 Y135.213 I-43.917 J2.155 E.07957
G1 X139.072 Y139.277 E.16175
G2 X139.289 Y139.431 I.913 J-1.05 E.0106
M204 S10000
G1 X138.7 Y139.995 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.517434
G1 F5622.502
G1 X138.603 Y139.918 E.00627
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X138.494 Y139.825 E.00685
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X138.297 Y139.572 I.216 J-.372 E.01433
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X138.284 Y139.461 E.00525
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X138.262 Y139.058 I8.027 J-.635 E.02059
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X138.209 Y133.796 I457.492 J-7.25 E.29868
G1 X138.195 Y133.408 E.02207
G2 X138.119 Y132.704 I-4.298 J.108 E.04022
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X137.859 Y132.221 I-1.011 J.232 E.03187
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X136.525 Y131.673 I-1.234 J1.105 E.07989
G2 X136.083 Y131.678 I-.178 J3.395 E.02366
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X135.936 Y131.695 E.00758
G2 X135.161 Y132.094 I.251 J1.443 E.04552
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X134.929 Y132.395 I.836 J.882 E.0221
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X134.722 Y133.356 I2.018 J.937 E.0596
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X134.708 Y133.733 E.02058
G2 X134.696 Y136.044 I90.749 J1.649 E.12595
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X134.698 Y140.231 E.21616
; WIPE_START
G1 X134.697 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.7 Y139.995 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556328
G1 F5181.833
G2 X140.13 Y140.416 I1.204 J-1.454 E.08409
G2 X141.653 Y139.365 I-.004 J-1.635 E.10794
G1 X141.666 Y139.277 E.00487
G2 X141.724 Y131.775 I-217.653 J-5.446 E.41174
; WIPE_START
G1 X141.723 Y133.775 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.344 Y126.152 Z.88 F30000
G1 X141.209 Y123.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X141.238 Y123.302 E.00618
G2 X141.287 Y120.03 I-88.736 J-2.964 E.1411
G1 X141.294 Y119.883 E.00637
G3 X142.108 Y119.871 I.621 J14.333 E.03512
G3 X142.142 Y129.069 I-343.474 J5.855 E.39665
G3 X141.295 Y129.074 I-.495 J-10.871 E.03653
G2 X141.249 Y125.851 I-465.892 J5.05 E.139
G2 X140.969 Y125.095 I-1.105 J-.022 E.03559
G1 X140.694 Y124.977 E.01293
G2 X135.579 Y124.907 I-4.92 J172.161 E.22057
G1 X134.252 Y124.879 E.05726
G3 X134.251 Y124.026 I28.298 J-.439 E.03678
G3 X139.752 Y123.991 I5.364 J407.272 E.23719
G2 X140.639 Y123.934 I.037 J-6.321 E.03838
G2 X141.186 Y123.498 I-.124 J-.717 E.03147
G1 X140.842 Y123.349 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.865 Y123.255 I-.324 J-.13 E.0039
G2 X140.912 Y120.019 I-91.605 J-2.951 E.1288
G3 X140.939 Y119.533 I3.734 J-.035 E.0194
G3 X142.189 Y119.497 I.931 J10.635 E.04979
G3 X142.465 Y119.513 I-.048 J3.211 E.01103
G3 X142.523 Y122.775 I-93.815 J3.301 E.12985
G3 X142.508 Y129.413 I-300.119 J2.64 E.26422
G3 X140.942 Y129.418 I-.814 J-8.909 E.06244
G3 X140.899 Y126.883 I40.436 J-1.952 E.10094
G2 X140.852 Y125.66 I-11.936 J-.159 E.04871
G2 X140.732 Y125.401 I-.451 J.052 E.01158
G2 X140.32 Y125.334 I-.314 J.628 E.01687
G2 X135.573 Y125.282 I-19.637 J1577.07 E.18895
G3 X133.899 Y125.239 I.191 J-40.475 E.06665
G3 X133.897 Y123.66 I12.6 J-.804 E.06288
G3 X139.745 Y123.616 I5.336 J318.555 E.23275
G2 X140.559 Y123.566 I.043 J-5.943 E.03249
G2 X140.815 Y123.403 I-.041 J-.347 E.01249
M204 S10000
G1 X141.692 Y123.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
G1 X141.706 Y121.146 E.12273
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X141.702 Y120.067 I97.022 J-.897 E.05477
; WIPE_START
G1 X141.706 Y121.146 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.76 Y124.309 Z.88 F30000
G1 X134.445 Y124.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
G2 X136.631 Y124.462 I5.395 J-984.686 E.12205
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X138.781 Y124.468 I2.352 J-433.847 E.12973
G1 X140.214 Y124.467 E.08645
G1 X140.589 Y124.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X140.809 Y124.619 E.00879
G1 X141.236 Y124.826 E.01889
G1 X141.4 Y125.002 E.00956
G1 X141.517 Y124.931 E.00547
G3 X141.781 Y125.06 I-.023 J.382 E.01199
G1 X141.775 Y123.796 E.0503
G1 X141.457 Y123.789 E.01266
G1 X141.354 Y123.939 E.00723
G1 X140.967 Y124.225 E.01916
G1 X140.587 Y124.315 E.01554
G1 X140.589 Y124.536 E.0088
G1 X141.405 Y124.381 F30000
; LINE_WIDTH: 0.502428
G1 F5813.241
G2 X141.4 Y124.477 I-.028 J.047 E.01091
G1 X141.42 Y125.606 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
G1 X141.703 Y125.815 E.0193
G1 X141.711 Y126.148 E.01829
G3 X141.715 Y128.884 I-316.202 J1.803 E.15007
; WIPE_START
G1 X141.712 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.226 Y119.398 Z.88 F30000
G1 X138.123 Y108.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X138.116 Y108.798 E.00032
G1 X138.061 Y114.391 E.24118
G3 X137.166 Y114.37 I-.228 J-9.413 E.03863
G2 X137.182 Y110.158 I-1509.827 J-7.73 E.18162
G2 X137.157 Y109.6 I-7.11 J.043 E.02411
G1 X136.978 Y108.796 E.03552
G3 X134.258 Y108.716 I4.812 J-210.43 E.11732
G3 X134.27 Y107.911 I34.461 J.095 E.03471
G3 X139.144 Y107.893 I3.846 J363.204 E.21018
G3 X140.795 Y108.001 I.263 J8.643 E.07143
G3 X142.148 Y109.792 I-.467 J1.76 E.10434
G3 X142.143 Y115.992 I-96.42 J3.026 E.26739
G3 X141.277 Y117.472 I-1.701 J-.002 E.07748
G3 X140.546 Y117.793 I-1.399 J-2.194 E.03459
G3 X137.538 Y117.83 I-2.043 J-43.787 E.12974
G1 X134.27 Y117.811 E.1409
G1 X134.254 Y116.978 E.0359
G2 X139.878 Y116.928 I.811 J-221.986 E.24253
G2 X140.653 Y116.816 I-.013 J-2.844 E.03385
G2 X141.239 Y115.928 I-.389 J-.894 E.04854
G2 X141.275 Y113.925 I-23.875 J-1.44 E.08642
G2 X141.243 Y109.86 I-91.863 J-1.294 E.1753
G2 X141.006 Y109.135 I-1.155 J-.024 E.0335
G2 X140.037 Y108.76 I-.941 J.992 E.04596
G1 X138.183 Y108.797 E.07994
G1 X138.488 Y109.163 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X138.452 Y113.777 E.18364
G3 X138.412 Y114.735 I-8.637 J.117 E.03817
G3 X136.802 Y114.7 I-.658 J-6.92 E.06421
G3 X136.812 Y111.251 I83.034 J-1.482 E.13731
G2 X136.785 Y109.654 I-31.224 J-.254 E.06358
G1 X136.675 Y109.162 E.02004
G3 X133.883 Y109.078 I4.936 J-209.701 E.11118
G3 X133.902 Y107.539 I52.505 J-.115 E.06127
G3 X139.148 Y107.518 I4.186 J387.013 E.20881
G3 X140.883 Y107.636 I.263 J8.931 E.0693
G3 X142.523 Y109.775 I-.554 J2.123 E.11552
G3 X142.517 Y116.019 I-96.591 J3.041 E.24857
G3 X141.481 Y117.787 I-2.053 J-.016 E.08539
G3 X140.578 Y118.167 I-1.397 J-2.057 E.03927
G3 X137.537 Y118.205 I-2.072 J-43.797 E.12107
G1 X133.903 Y118.183 E.14465
G1 X133.871 Y116.606 E.06281
G2 X139.861 Y116.553 I.516 J-281.176 E.23841
G2 X140.581 Y116.433 I.051 J-1.91 E.02922
G2 X140.866 Y115.886 I-.359 J-.535 E.02559
G2 X140.901 Y113.924 I-23.883 J-1.403 E.07813
G2 X140.869 Y109.889 I-92.5 J-1.292 E.16063
G2 X140.653 Y109.321 I-.719 J-.052 E.02494
G2 X140.02 Y109.135 I-.593 J.842 E.02674
G2 X138.548 Y109.16 I-.416 J18.787 E.05863
; WIPE_START
M204 S10000
G1 X138.506 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.638 Y109.593 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
G1 X137.642 Y111.257 E.09675
G2 X137.617 Y113.935 I928.907 J10.115 E.1557
G1 X137.859 Y114.196 E.02073
; WIPE_START
G1 X137.617 Y113.935 E-.13547
G1 X137.632 Y112.292 E-.62453
; WIPE_END
G1 E-.04 F1800
G1 X137.54 Y117.394 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556602
G1 F5178.971
G2 X139.894 Y117.373 I.363 J-93.158 E.12926
G1 X140.031 Y117.367 E.00753
G2 X141.11 Y117.057 I.11 J-1.647 E.06291
G1 X141.268 Y116.929 E.01114
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X141.663 Y116.194 I-.763 J-.884 E.04941
G1 X141.688 Y115.986 E.01214
G2 X141.717 Y110.421 I-95.921 J-3.281 E.32224
G1 X141.695 Y109.831 E.03418
G2 X141.191 Y108.701 I-1.381 J-.061 E.07426
G1 X141.18 Y108.691 E.00088
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X141.047 Y108.598 I-1.463 J1.945 E.00852
G1 X140.809 Y108.47 E.01413
G2 X139.713 Y108.329 I-.918 J2.803 E.05832
G1 X139.139 Y108.332 E.03008
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X137.925 Y108.347 E.06738
G1 X137.501 Y108.322 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
G1 X137.501 Y108.829 E.02597
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X137.5 Y108.899 E.00377
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X137.499 Y108.969 E.00409
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X137.516 Y109.001 E.00233
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X137.534 Y109.034 E.00248
G1 X137.077 Y108.346 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
G1 X135.768 Y108.331 E.07052
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X134.458 Y108.317 E.06504
; WIPE_START
G1 X135.768 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.675 Y115.885 Z.88 F30000
G1 X134.457 Y117.394 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
G1 X137.54 Y117.394 E.15862
; WIPE_START
G1 X135.54 Y117.394 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.957 Y110.155 Z.88 F30000
G1 X139.788 Y104.674 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X139.877 Y104.629 E.00431
G1 X140.499 Y104.188 E.03287
G2 X139.339 Y103.006 I-9.165 J7.837 E.07147
G3 X134.198 Y98.397 I403.081 J-454.653 E.29773
G3 X134.204 Y97.133 I25.323 J-.523 E.05451
G3 X140.695 Y97.094 I5.077 J307.911 E.27991
G3 X142.23 Y97.118 I-.058 J53.259 E.06619
G3 X142.25 Y98.1 I-15.714 J.809 E.04237
G2 X137.264 Y98.147 I15.25 J1865.937 E.215
G2 X135.587 Y98.274 I.893 J22.973 E.07251
G1 X136.575 Y99.335 E.0625
G2 X139.498 Y101.993 I53.631 J-56.057 E.17039
G3 X142.188 Y104.413 I-175.542 J197.839 E.15603
G3 X142.168 Y105.734 I-104.991 J-.94 E.05695
G3 X134.2 Y105.743 I-4.782 J-654.062 E.34358
G3 X134.207 Y104.813 I16.22 J-.349 E.04014
G3 X138.98 Y104.781 I5.559 J477.802 E.20582
G2 X139.732 Y104.694 I.019 J-3.131 E.03271
G1 X139.627 Y104.335 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.938 Y104.126 I-.499 J-1.08 E.01497
G2 X139.087 Y103.284 I-7.64 J6.87 E.04768
G3 X133.823 Y98.557 I314.742 J-355.793 E.2816
G3 X133.852 Y96.772 I17.197 J-.613 E.07111
G3 X140.696 Y96.719 I5.139 J223.205 E.27242
G3 X142.565 Y96.766 I.421 J20.579 E.07443
G3 X142.589 Y98.446 I-7.035 J.942 E.06705
G3 X141.189 Y98.491 I-1.093 J-12.365 E.05577
G2 X136.99 Y98.535 I-.581 J143.774 E.16716
G1 X136.388 Y98.584 E.02402
G2 X138.085 Y100.233 I18.228 J-17.056 E.0942
G3 X142.566 Y104.25 I-324.732 J366.721 E.23952
G3 X142.536 Y106.107 I-148.094 J-1.41 E.0739
G3 X133.84 Y106.109 I-4.452 J-501.161 E.34612
G3 X133.853 Y104.447 I21.105 J-.67 E.06616
G3 X138.968 Y104.406 I8.882 J793.218 E.20358
G2 X139.569 Y104.348 I.031 J-2.806 E.02408
M204 S10000
G1 X139.323 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
G1 X138.538 Y105.27 E.04935
G2 X134.396 Y105.278 I-1.09 J538.895 E.26016
G1 X139.701 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X141.799 Y105.36 E.08351
G1 X141.811 Y104.578 E.03115
G1 X141.285 Y104.106 E.02812
G1 X140.843 Y104.55 E.02493
G1 X140.702 Y104.602 E.00601
G1 X140.614 Y104.562 E.00385
G1 X139.932 Y105.019 E.03267
G1 X139.694 Y105.082 E.00983
G1 X139.7 Y105.31 E.00908
G1 X140.672 Y104.983 F30000
; LINE_WIDTH: 0.468329
G1 F6298.816
G1 X140.756 Y104.981 E.00381
G1 X140.816 Y104.979 F30000
; LINE_WIDTH: 0.453874
G1 F6530.032
G1 X141.135 Y104.996 E.01391
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X141.454 Y105.012 E.01223
G1 X141.458 Y104.732 E.01071
G1 X141.299 Y104.589 E.00821
G1 X141.093 Y104.798 E.01125
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X140.98 Y104.872 E.00541
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X140.866 Y104.946 E.00591
G1 X140.929 Y103.933 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
G1 X140.614 Y103.619 E.02678
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X140.155 Y103.169 E.03599
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X139.627 Y102.686 E.03764
G3 X136.249 Y99.645 I111.103 J-126.796 E.23909
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X135.864 Y99.264 E.03185
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X135.579 Y98.987 E.02461
G1 X135.218 Y98.849 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
G1 X135.432 Y98.628 E.01108
G1 X135.046 Y98.225 E.02012
; LINE_WIDTH: 0.409301
M73 P72 R3
G1 F7363.507
G1 X135.01 Y98.167 E.00261
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X134.975 Y98.109 E.0028
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X134.993 Y98.026 E.0038
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X135.012 Y97.944 E.00406
G1 X135.154 Y97.912 E.00698
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X136.006 Y97.86 E.03638
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X137.254 Y97.787 I9.118 J144.535 E.04871
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X141.902 Y97.757 I9.596 J1132.296 E.1642
G1 X141.896 Y97.459 E.01055
G2 X136.843 Y97.464 I-1.861 J659.304 E.17851
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X135.99 Y97.489 E.03389
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X135.136 Y97.514 E.03638
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X134.881 Y97.532 E.01168
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X134.626 Y97.551 E.01213
G1 X134.588 Y98.108 E.02649
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X134.588 Y98.227 E.0051
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X134.846 Y98.485 E.01497
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X135.173 Y98.808 I3.652 J-3.379 E.01698
; WIPE_START
G1 X134.846 Y98.485 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.393 Y90.873 Z.88 F30000
G1 X135.656 Y87.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X135.534 Y87.277 E.00588
G2 X135.192 Y87.963 I.534 J.695 E.0342
G2 X135.238 Y92.891 I66.427 J1.84 E.21259
G2 X136.192 Y94.025 I1.138 J.011 E.06958
G2 X137.24 Y94.095 I1.068 J-8.135 E.04531
G2 X139.799 Y94.091 I1.225 J-33.233 E.11038
G2 X140.824 Y93.734 I.017 J-1.602 E.04773
G2 X141.148 Y93.035 I-.689 J-.744 E.03407
G2 X141.214 Y90.519 I-45.136 J-2.447 E.10855
G1 X141.255 Y86.162 E.18787
G1 X142.159 Y86.162 E.03901
G3 X142.137 Y93.396 I-263.533 J2.815 E.31194
G3 X140.931 Y94.851 I-2.632 J-.955 E.08313
G3 X139.738 Y95.06 I-1.136 J-2.974 E.05254
G3 X136.33 Y95.039 I-1.422 J-45.85 E.147
G3 X134.816 Y94.293 I.016 J-1.94 E.07528
G3 X134.236 Y92.742 I1.644 J-1.5 E.07317
G3 X134.207 Y90.444 I65.458 J-1.974 E.09909
G1 X134.229 Y86.158 E.18483
G3 X138.715 Y86.144 I2.983 J235.393 E.19344
G3 X138.724 Y90.009 I-83.313 J2.128 E.16667
G3 X137.738 Y89.976 I.196 J-20.914 E.04257
G2 X137.655 Y87.732 I-26.349 J-.15 E.09686
G2 X137.458 Y87.281 I-.991 J.165 E.02144
G2 X136.443 Y87.096 I-.819 J1.616 E.0451
G2 X135.714 Y87.204 I-.087 J1.939 E.03197
G1 X135.818 Y87.555 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.592 Y87.82 I.197 J.396 E.01424
G2 X135.544 Y88.724 I5.874 J.768 E.03608
G2 X135.612 Y92.857 I71.273 J.902 E.16453
G2 X136.44 Y93.682 I.802 J.023 E.05212
G2 X139.77 Y93.717 I2.145 J-45.024 E.13259
G2 X140.571 Y93.456 I.042 J-1.23 E.03425
G2 X140.775 Y92.995 I-.435 J-.467 E.0206
G2 X140.839 Y90.515 I-45.374 J-2.417 E.09875
G1 X140.883 Y85.787 E.18818
G1 X142.533 Y85.787 E.06566
G3 X142.507 Y93.468 I-230.889 J3.072 E.3057
G3 X141.089 Y95.191 I-2.956 J-.987 E.09085
G3 X139.757 Y95.435 I-1.29 J-3.292 E.05425
G3 X136.298 Y95.413 I-1.439 J-46.066 E.13772
G3 X134.537 Y94.543 I.048 J-2.315 E.08074
G3 X133.861 Y92.765 I1.869 J-1.727 E.07759
G3 X133.832 Y90.444 I65.545 J-1.996 E.09236
G1 X133.857 Y85.786 E.18542
G3 X138.617 Y85.768 I3.346 J258.086 E.18948
G3 X139.067 Y85.807 I.046 J2.084 E.01802
G3 X139.119 Y89.146 I-41.991 J2.325 E.13295
G3 X139.066 Y90.382 I-10.936 J.151 E.04927
G3 X137.368 Y90.336 I-.224 J-23.328 E.06761
G2 X137.287 Y87.806 I-30.876 J-.268 E.1008
G2 X137.192 Y87.573 I-.509 J.071 E.01011
G2 X136.671 Y87.471 I-.485 J1.092 E.02131
G2 X135.876 Y87.54 I-.147 J2.891 E.03187
; WIPE_START
M204 S10000
G1 X135.679 Y87.646 E-.08493
G1 X135.592 Y87.82 E-.07374
G1 X135.554 Y88.173 E-.13487
G1 X135.544 Y88.724 E-.2096
G1 X135.549 Y89.4 E-.25686
; WIPE_END
G1 E-.04 F1800
G1 X134.703 Y87.947 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
G1 X134.692 Y89.813 E.11987
G2 X134.747 Y92.945 I51.584 J.66 E.20122
G2 X135.662 Y94.374 I1.725 J-.098 E.11393
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X136.77 Y94.572 I1.005 J-2.421 E.074
G2 X140.123 Y94.545 I1.43 J-30.545 E.21888
G1 X140.257 Y94.526 E.00883
G2 X141.128 Y94.102 I-.152 J-1.421 E.06449
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X141.159 Y94.072 E.0027
G2 X141.303 Y93.904 I-.856 J-.878 E.01366
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X141.271 Y93.798 E.00633
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X141.24 Y93.692 E.0058
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X141.209 Y93.586 E.00527
G1 X141.444 Y93.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
G3 X141.706 Y93.226 I.096 J.244 E.01062
G1 X141.66 Y92.872 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
G1 X141.69 Y90.79 E.1328
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X141.707 Y86.357 I-818.445 J-5.298 E.2677
; WIPE_START
G1 X141.699 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.929 Y89.707 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
G2 X138.449 Y89.717 I.673 J-21.775 E.01016
G1 X138.538 Y89.808 E.00249
G1 X138.382 Y89.246 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
G2 X138.347 Y86.52 I-87.268 J-.238 E.10341
G1 X137.764 Y86.522 E.02212
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X137.314 Y86.548 E.01919
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X137.237 Y86.57 E.0038
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X137.16 Y86.591 E.00417
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X137.084 Y86.612 E.00454
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X137.007 Y86.634 E.00491
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X137.14 Y86.7 E.00913
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X137.272 Y86.766 E.00841
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X137.405 Y86.833 E.0077
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X137.537 Y86.899 E.00698
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X137.753 Y87.041 I-.144 J.453 E.01054
G1 X137.956 Y87.415 E.01712
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X138.021 Y87.679 E.00985
G3 X138.075 Y89.24 I-25.201 J1.644 E.0566
G1 X138.322 Y89.245 E.00896
G1 X138.041 Y86.818 F30000
; LINE_WIDTH: 0.359469
G1 F8589.18
G1 X137.985 Y86.851 E.00215
G1 X138.022 Y86.872 E.0014
G1 X135.912 Y86.645 F30000
; LINE_WIDTH: 0.629923
G1 F4512.586
G3 X136.947 Y86.631 I.648 J9.44 E.06529
G1 X134.952 Y86.829 F30000
; LINE_WIDTH: 0.362209
G1 F8511.282
G1 X134.896 Y86.862 E.00219
G1 X134.933 Y86.883 E.00144
G1 X134.897 Y87.575 F30000
; LINE_WIDTH: 0.419998
G1 F7144.644
G3 X135.346 Y86.952 I1.083 J.306 E.0312
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X135.456 Y86.892 E.00531
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X135.566 Y86.832 E.00594
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X135.677 Y86.772 E.00656
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X135.787 Y86.713 E.00719
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X135.897 Y86.653 E.00782
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X135.912 Y86.645 E.00104
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X135.82 Y86.622 E.00594
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X135.729 Y86.599 E.00546
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X135.638 Y86.576 E.00497
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X135.547 Y86.552 E.00448
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X135.456 Y86.529 E.00375
G1 X134.603 Y86.532 E.03402
G1 X134.6 Y87.57 E.04143
G1 X134.837 Y87.574 E.00944
; OBJECT_ID: 169
; WIPE_START
G1 X134.6 Y87.57 E-.08991
G1 X134.603 Y86.532 E-.39444
G1 X135.329 Y86.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
G1 X134.689 Y94.135 Z.88 F30000
G1 X129.425 Y156.678 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X129.354 Y156.47 E.00945
G2 X129.189 Y156.261 I-.682 J.368 E.01155
G2 X128.572 Y156.112 I-.571 J1.01 E.02774
G2 X124.023 Y156.06 I-6.536 J375.104 E.19616
G3 X124.027 Y155.214 I17.494 J-.334 E.03648
G3 X131.966 Y155.219 I3.721 J426.531 E.34235
G3 X131.918 Y156.513 I-22.684 J-.209 E.05586
G2 X127.024 Y159.975 I86.806 J127.905 E.25849
G2 X126.993 Y161.002 I.492 J.529 E.0493
G2 X127.574 Y161.496 I2.959 J-2.892 E.03294
G2 X131.939 Y164.543 I807.609 J-1152.394 E.22955
G3 X131.962 Y165.864 I-18.182 J.973 E.05697
G3 X124.025 Y165.839 I-2.114 J-587.958 E.34225
G3 X124.024 Y164.996 I33.794 J-.441 E.03633
G2 X128.65 Y164.949 I1.184 J-111.6 E.19948
G2 X129.115 Y164.796 I-.091 J-1.062 E.02133
G2 X129.062 Y163.652 I-.449 J-.552 E.0574
G2 X124.647 Y160.518 I-235.825 J327.478 E.23344
G2 X129.021 Y157.419 I-190.181 J-273.047 E.23114
G2 X129.41 Y157.033 I-.658 J-1.051 E.02381
G1 X129.434 Y156.736 E.01288
G1 X129.052 Y156.757 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.02 Y156.652 I-.275 J.027 E.00439
G2 X128.793 Y156.504 I-.274 J.173 E.01113
G2 X125.687 Y156.454 I-2.506 J58.481 E.12363
G3 X123.665 Y156.425 I.048 J-74.485 E.08051
G3 X123.67 Y154.849 I19.632 J-.729 E.06273
G3 X132.32 Y154.845 I4.488 J332.294 E.34432
G3 X132.283 Y156.718 I-15.279 J.634 E.07459
G2 X127.279 Y160.251 I87.947 J129.844 E.24385
G2 X127.334 Y160.819 I.27 J.26 E.02578
G2 X128.356 Y161.591 I7.227 J-8.504 E.05102
G3 X130.698 Y163.229 I-56.115 J82.729 E.11377
G3 X132.289 Y164.336 I-19.43 J29.634 E.07714
G3 X132.306 Y166.238 I-11.086 J1.052 E.07582
G3 X123.665 Y166.206 I-2.329 J-523.15 E.34395
G3 X123.664 Y164.622 I20.528 J-.8 E.06304
G2 X128.616 Y164.575 I1.22 J-133.023 E.1971
G2 X128.993 Y164.34 I.011 J-.402 E.01875
G2 X128.819 Y163.939 I-.357 J-.084 E.01867
G3 X124.086 Y160.566 I453.819 J-641.818 E.23134
G1 X124.02 Y160.513 E.00332
G3 X128.42 Y157.399 I1147.337 J1616.221 E.21454
G2 X128.967 Y156.984 I-7.158 J-10.003 E.02735
G2 X129.051 Y156.817 I-.191 J-.2 E.00758
M204 S10000
G1 X129.546 Y157.598 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
G1 X126.697 Y159.642 E.19585
G1 X126.34 Y159.788 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X125.297 Y160.52 E.05071
G1 X126.396 Y161.3 E.05363
G1 X126.587 Y161.052 E.01246
G3 X126.408 Y160.473 I.898 J-.595 E.02448
G1 X126.474 Y160.131 E.01386
G1 X126.522 Y160.038 E.00416
G1 X126.375 Y159.836 E.00991
G1 X126.029 Y160.473 F30000
; LINE_WIDTH: 0.511568
G1 F5695.554
G2 X126.025 Y160.571 I-.028 J.048 E.01147
G1 X126.761 Y161.441 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
G2 X129.462 Y163.377 I58.661 J-79.002 E.18711
G1 X129.819 Y163.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X129.632 Y163.778 E.01255
G1 X129.73 Y164.001 E.00971
G3 X129.571 Y164.857 I-1.156 J.228 E.03551
G1 X129.297 Y165.125 E.01522
G1 X129.188 Y165.179 E.00485
G1 X129.195 Y165.488 E.01232
G1 X131.592 Y165.489 E.09542
G1 X131.57 Y164.743 E.0297
G1 X129.868 Y163.558 E.08252
G1 X130.116 Y164.169 F30000
G1 F7144.644
G1 X130.076 Y164.594 E.01702
G1 X129.929 Y164.961 E.01572
G1 X129.81 Y165.129 E.00819
G1 X131.221 Y165.129 E.05619
G1 X131.216 Y164.935 E.00773
G1 X130.165 Y164.203 E.05096
G1 X130.408 Y164.745 F30000
; LINE_WIDTH: 0.394909
G1 F7680.033
G1 X130.346 Y164.781 E.00268
G1 X130.393 Y164.808 E.00201
G1 X128.818 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
G1 X125.607 Y165.424 E.1745
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X124.218 Y165.419 E.07177
; WIPE_START
G1 X125.607 Y165.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.534 Y157.867 Z.88 F30000
G1 X124.218 Y155.637 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.532414
G1 F5444.184
G1 X124.618 Y155.639 E.02089
; LINE_WIDTH: 0.556294
G1 F5182.184
G3 X127.196 Y155.64 I.796 J804.611 E.14149
G1 X128.902 Y155.67 E.09362
G1 X129.281 Y155.581 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X129.268 Y155.885 E.01208
G1 X129.454 Y155.992 E.00855
G1 X129.698 Y156.317 E.01617
G1 X129.813 Y156.699 E.01586
G1 X129.742 Y157.225 E.02115
G1 X129.907 Y157.455 E.01124
G1 X131.55 Y156.312 E.07967
G1 X131.577 Y155.592 E.02868
G1 X129.341 Y155.582 E.08903
G1 X130.02 Y156.017 F30000
; LINE_WIDTH: 0.565569
G1 F5087.102
G1 X130.213 Y156.485 E.02828
G1 X130.24 Y156.696 E.0119
G1 X131.126 Y156.08 E.06035
G1 X131.128 Y156.022 E.00321
G1 X130.08 Y156.018 E.05856
; WIPE_START
G1 X131.128 Y156.022 E-.3981
G1 X131.126 Y156.08 E-.02184
G1 X130.391 Y156.591 E-.34007
; WIPE_END
G1 E-.04 F1800
G1 X127.626 Y149.477 Z.88 F30000
G1 X125.497 Y144.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X124.879 Y144.712 E.04063
G1 X124.924 Y151.461 E.29102
G1 X125.608 Y152.145 E.04174
G1 X131.96 Y152.211 E.27389
G3 X131.958 Y153.017 I-15.639 J.362 E.03479
G3 X125.887 Y153.011 I-2.858 J-184.576 E.26177
G3 X125.285 Y152.849 I.021 J-1.275 E.02715
G3 X124.249 Y151.984 I.751 J-1.952 E.05926
G3 X124.06 Y151.223 I1.386 J-.75 E.03419
G3 X124.027 Y146.5 I104.203 J-3.088 E.20368
G3 X124.08 Y144.546 I30.526 J-.146 E.08426
G3 X125.664 Y143.11 I1.957 J.566 E.09708
G3 X127.395 Y143.024 I1.375 J10.16 E.07482
G3 X130.616 Y143.025 I1.512 J225.279 E.13889
G3 X131.913 Y143.047 I-.245 J52.583 E.0559
G3 X131.919 Y143.923 I-21.432 J.606 E.03778
G3 X125.543 Y143.947 I-4.211 J-273.027 E.27494
G1 X125.536 Y143.955 E.00047
G1 X125.714 Y144.322 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.255 Y144.851 E.02789
G1 X125.298 Y151.305 E.25687
G1 X125.765 Y151.772 E.02631
G1 X132.329 Y151.839 E.26126
G3 X132.309 Y153.39 I-12.499 J.612 E.06177
G3 X125.861 Y153.385 I-3.083 J-193.366 E.25663
G3 X125.131 Y153.191 I.052 J-1.664 E.03036
G3 X123.921 Y152.164 I.912 J-2.301 E.06429
G3 X123.686 Y151.249 I1.739 J-.934 E.03798
G3 X123.652 Y146.497 I103.801 J-3.114 E.18917
G3 X123.715 Y144.454 I26.721 J-.195 E.08137
G3 X125.573 Y142.746 I2.327 J.667 E.10563
G3 X127.393 Y142.649 I1.459 J10.173 E.07266
G3 X130.62 Y142.65 I1.513 J225.615 E.12842
G3 X132.274 Y142.69 I.118 J29.411 E.06586
G3 X132.278 Y144.283 I-18.899 J.844 E.06344
G3 X125.774 Y144.323 I-4.493 J-206.388 E.25886
M204 S10000
G1 X125.622 Y143.542 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
G1 X125.494 Y143.563 E.00571
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X125.316 Y143.631 I.076 J.465 E.0077
G1 X131.725 Y143.486 F30000
; LINE_WIDTH: 0.588624
G1 F4865.193
G2 X126.049 Y143.503 I-1.688 J381.573 E.3318
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X125.765 Y143.523 I.084 J3.261 E.01517
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X125.622 Y143.542 E.00699
G1 X125.704 Y143.301 F30000
; LINE_WIDTH: 0.489929
G1 F5982.279
G1 X125.4 Y143.555 E.01882
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X125.027 Y143.869 I3.535 J4.562 E.02485
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X124.668 Y144.284 I2.048 J2.135 E.03096
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X124.608 Y144.373 E.00567
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X124.526 Y144.503 E.0075
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X124.473 Y144.732 I.484 J.232 E.01137
G2 X124.463 Y145.384 I33.324 J.83 E.03121
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X124.501 Y151.395 I173.802 J1.921 E.32149
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X124.513 Y151.544 E.00731
G2 X124.628 Y151.776 I.425 J-.066 E.01291
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X125.047 Y152.209 I1.874 J-1.392 E.03404
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X125.148 Y152.291 E.00692
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X125.228 Y152.353 E.00508
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X125.309 Y152.414 E.00478
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X125.586 Y152.543 I.431 J-.561 E.01318
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X125.728 Y152.569 E.00688
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X128.341 Y152.606 I1.938 J-45.472 E.13918
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X130.054 Y152.609 E.08747
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X131.768 Y152.613 E.08261
; WIPE_START
G1 X130.054 Y152.609 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.392 Y145.006 Z.88 F30000
G1 X128.938 Y139.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X129.122 Y139.886 E.00897
G2 X130.793 Y139.592 I.592 J-1.531 E.07689
M73 P73 R3
G2 X130.99 Y139.295 I-.907 J-.814 E.01544
G2 X131.047 Y136.139 I-91.854 J-3.227 E.1361
G3 X131.078 Y131.589 I190.503 J-.97 E.19623
G3 X131.92 Y131.583 I.51 J12.053 E.03633
G3 X131.883 Y139.346 I-164.906 J3.091 E.33479
G3 X131.167 Y140.42 I-1.745 J-.388 E.05696
G3 X129.719 Y140.853 I-1.323 J-1.782 E.06649
G3 X127.709 Y139.754 I-.081 J-2.24 E.10371
G3 X127.59 Y138.871 I3.141 J-.871 E.03852
G3 X127.522 Y133.433 I938.133 J-14.477 E.23453
G2 X127.379 Y132.632 I-2.427 J.02 E.03526
G2 X126.409 Y132.109 I-.941 J.583 E.04976
G2 X125.65 Y132.144 I-.274 J2.308 E.03289
G2 X125.011 Y132.925 I.314 J.908 E.04581
G2 X124.911 Y134.544 I9.636 J1.409 E.07004
G1 X124.89 Y140.434 E.254
G1 X124.053 Y140.418 E.03609
G3 X124.043 Y133.277 I367.728 J-4.084 E.30795
G3 X124.406 Y131.998 I2.012 J-.12 E.0584
G3 X126.31 Y131.24 I1.685 J1.46 E.09181
G3 X127.183 Y131.361 I.084 J2.601 E.03822
G3 X128.279 Y132.371 I-1.099 J2.291 E.06519
G3 X128.433 Y133.78 I-5.61 J1.326 E.06128
G3 X128.459 Y135.215 I-55.594 J1.737 E.06191
G1 X128.471 Y139.475 E.18369
G2 X128.886 Y139.76 I2.137 J-2.662 E.02172
G1 X129.115 Y139.46 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.706 Y139.617 I.644 J-1.234 E.02458
G2 X130.521 Y139.333 I.042 J-1.19 E.03511
G2 X130.621 Y139.185 I-.45 J-.413 E.00714
G2 X130.688 Y132.216 I-272.184 J-6.106 E.2774
G3 X130.723 Y131.24 I15.683 J.07 E.03888
G3 X132.283 Y131.235 I.812 J9.744 E.06217
G3 X132.255 Y139.403 I-149.209 J3.571 E.32516
G3 X131.399 Y140.714 I-2.118 J-.448 E.06376
G3 X129.719 Y141.228 I-1.553 J-2.073 E.07135
G3 X127.361 Y139.894 I-.084 J-2.603 E.11342
G3 X127.216 Y138.887 I3.413 J-1.005 E.04064
G3 X127.148 Y133.45 I906.214 J-14.078 E.21643
G2 X127.047 Y132.81 I-2.101 J.001 E.02588
G2 X126.524 Y132.497 I-.586 J.386 E.02511
G2 X125.758 Y132.503 I-.359 J2.881 E.03057
G2 X125.377 Y133.008 I.208 J.553 E.02656
G2 X125.286 Y134.547 I9.415 J1.33 E.06143
G1 X125.264 Y140.817 E.24956
G1 X123.68 Y140.786 E.06304
G3 X123.668 Y133.265 I383.096 J-4.349 E.29935
G3 X124.284 Y131.577 I2.273 J-.128 E.07351
G3 X126.32 Y130.865 I1.805 J1.895 E.08851
G3 X127.33 Y131.016 I.076 J2.948 E.04087
G3 X128.628 Y132.234 I-1.232 J2.613 E.07202
G3 X128.781 Y133.215 I-3.755 J1.089 E.03961
G3 X128.834 Y135.213 I-43.917 J2.155 E.07957
G1 X128.846 Y139.277 E.16175
G2 X129.062 Y139.431 I.913 J-1.05 E.0106
M204 S10000
G1 X128.474 Y139.995 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.517434
G1 F5622.502
G1 X128.377 Y139.918 E.00627
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X128.268 Y139.825 E.00685
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X128.07 Y139.572 I.216 J-.372 E.01433
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X128.057 Y139.461 E.00525
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X128.036 Y139.058 I8.027 J-.635 E.02059
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X127.982 Y133.796 I457.492 J-7.25 E.29868
G1 X127.968 Y133.408 E.02207
G2 X127.892 Y132.704 I-4.298 J.108 E.04022
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X127.632 Y132.221 I-1.011 J.232 E.03187
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X126.298 Y131.673 I-1.234 J1.105 E.07989
G2 X125.857 Y131.678 I-.178 J3.395 E.02366
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X125.71 Y131.695 E.00758
G2 X124.934 Y132.094 I.251 J1.443 E.04552
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X124.702 Y132.395 I.836 J.882 E.0221
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X124.496 Y133.356 I2.018 J.937 E.0596
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X124.482 Y133.733 E.02058
G2 X124.469 Y136.044 I90.749 J1.649 E.12595
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X124.472 Y140.231 E.21616
; WIPE_START
G1 X124.47 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.474 Y139.995 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556328
G1 F5181.833
G2 X129.904 Y140.416 I1.204 J-1.454 E.08409
G2 X131.427 Y139.365 I-.004 J-1.635 E.10794
G1 X131.44 Y139.277 E.00487
G2 X131.498 Y131.775 I-217.653 J-5.446 E.41174
; WIPE_START
G1 X131.496 Y133.775 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.118 Y126.152 Z.88 F30000
G1 X130.983 Y123.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X131.011 Y123.302 E.00618
G2 X131.06 Y120.03 I-88.736 J-2.964 E.1411
G1 X131.067 Y119.883 E.00637
G3 X131.882 Y119.871 I.621 J14.333 E.03512
G3 X131.915 Y129.069 I-343.474 J5.855 E.39665
G3 X131.068 Y129.074 I-.495 J-10.871 E.03653
G2 X131.022 Y125.851 I-465.892 J5.05 E.139
G2 X130.743 Y125.095 I-1.105 J-.022 E.03559
G1 X130.467 Y124.977 E.01293
G2 X125.353 Y124.907 I-4.92 J172.161 E.22057
G1 X124.025 Y124.879 E.05726
G3 X124.025 Y124.026 I28.298 J-.439 E.03678
G3 X129.525 Y123.991 I5.364 J407.272 E.23719
G2 X130.413 Y123.934 I.037 J-6.321 E.03838
G2 X130.96 Y123.498 I-.124 J-.717 E.03147
G1 X130.615 Y123.349 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.639 Y123.255 I-.324 J-.13 E.0039
G2 X130.686 Y120.019 I-91.605 J-2.951 E.1288
G3 X130.713 Y119.533 I3.734 J-.035 E.0194
G3 X131.962 Y119.497 I.931 J10.635 E.04979
G3 X132.239 Y119.513 I-.048 J3.211 E.01103
G3 X132.297 Y122.775 I-93.815 J3.301 E.12985
G3 X132.282 Y129.413 I-300.119 J2.64 E.26422
G3 X130.715 Y129.418 I-.814 J-8.909 E.06244
G3 X130.672 Y126.883 I40.436 J-1.952 E.10094
G2 X130.626 Y125.66 I-11.936 J-.159 E.04871
G2 X130.505 Y125.401 I-.451 J.052 E.01158
G2 X130.093 Y125.334 I-.314 J.628 E.01687
G2 X125.347 Y125.282 I-19.637 J1577.07 E.18895
G3 X123.673 Y125.239 I.191 J-40.475 E.06665
G3 X123.671 Y123.66 I12.6 J-.804 E.06288
G3 X129.518 Y123.616 I5.336 J318.555 E.23275
G2 X130.332 Y123.566 I.043 J-5.943 E.03249
G2 X130.588 Y123.403 I-.041 J-.347 E.01249
M204 S10000
G1 X131.465 Y123.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
G1 X131.479 Y121.146 E.12273
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X131.475 Y120.067 I97.022 J-.897 E.05477
; WIPE_START
G1 X131.479 Y121.146 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.533 Y124.309 Z.88 F30000
G1 X124.218 Y124.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
G2 X126.404 Y124.462 I5.395 J-984.686 E.12205
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X128.554 Y124.468 I2.352 J-433.847 E.12973
G1 X129.987 Y124.467 E.08645
G1 X130.363 Y124.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X130.583 Y124.619 E.00879
G1 X131.009 Y124.826 E.01889
G1 X131.173 Y125.002 E.00956
G1 X131.291 Y124.931 E.00547
G3 X131.554 Y125.06 I-.023 J.382 E.01199
G1 X131.549 Y123.796 E.0503
G1 X131.231 Y123.789 E.01266
G1 X131.128 Y123.939 E.00723
G1 X130.741 Y124.225 E.01916
G1 X130.361 Y124.315 E.01554
G1 X130.362 Y124.536 E.0088
G1 X131.178 Y124.381 F30000
; LINE_WIDTH: 0.502428
G1 F5813.241
G2 X131.174 Y124.477 I-.028 J.047 E.01091
G1 X131.194 Y125.606 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
G1 X131.477 Y125.815 E.0193
G1 X131.484 Y126.148 E.01829
G3 X131.488 Y128.884 I-316.202 J1.803 E.15007
; WIPE_START
G1 X131.485 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130 Y119.398 Z.88 F30000
G1 X127.897 Y108.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X127.89 Y108.798 E.00032
G1 X127.835 Y114.391 E.24118
G3 X126.94 Y114.37 I-.228 J-9.413 E.03863
G2 X126.956 Y110.158 I-1509.827 J-7.73 E.18162
G2 X126.93 Y109.6 I-7.11 J.043 E.02411
G1 X126.751 Y108.796 E.03552
G3 X124.032 Y108.716 I4.812 J-210.43 E.11732
G3 X124.043 Y107.911 I34.461 J.095 E.03471
G3 X128.918 Y107.893 I3.846 J363.204 E.21018
G3 X130.568 Y108.001 I.263 J8.643 E.07143
G3 X131.922 Y109.792 I-.467 J1.76 E.10434
G3 X131.917 Y115.992 I-96.42 J3.026 E.26739
G3 X131.051 Y117.472 I-1.701 J-.002 E.07748
G3 X130.319 Y117.793 I-1.399 J-2.194 E.03459
G3 X127.311 Y117.83 I-2.043 J-43.787 E.12974
G1 X124.044 Y117.811 E.1409
G1 X124.027 Y116.978 E.0359
G2 X129.652 Y116.928 I.811 J-221.986 E.24253
G2 X130.426 Y116.816 I-.013 J-2.844 E.03385
G2 X131.012 Y115.928 I-.389 J-.894 E.04854
G2 X131.049 Y113.925 I-23.875 J-1.44 E.08642
G2 X131.016 Y109.86 I-91.863 J-1.294 E.1753
G2 X130.78 Y109.135 I-1.155 J-.024 E.0335
G2 X129.81 Y108.76 I-.941 J.992 E.04596
G1 X127.957 Y108.797 E.07994
G1 X128.262 Y109.163 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X128.225 Y113.777 E.18364
G3 X128.185 Y114.735 I-8.637 J.117 E.03817
G3 X126.576 Y114.7 I-.658 J-6.92 E.06421
G3 X126.586 Y111.251 I83.034 J-1.482 E.13731
G2 X126.558 Y109.654 I-31.224 J-.254 E.06358
G1 X126.449 Y109.162 E.02004
G3 X123.657 Y109.078 I4.936 J-209.701 E.11118
G3 X123.676 Y107.539 I52.505 J-.115 E.06127
G3 X128.922 Y107.518 I4.186 J387.013 E.20881
G3 X130.656 Y107.636 I.263 J8.931 E.0693
G3 X132.296 Y109.775 I-.554 J2.123 E.11552
G3 X132.291 Y116.019 I-96.591 J3.041 E.24857
G3 X131.255 Y117.787 I-2.053 J-.016 E.08539
G3 X130.351 Y118.167 I-1.397 J-2.057 E.03927
G3 X127.31 Y118.205 I-2.072 J-43.797 E.12107
G1 X123.676 Y118.183 E.14465
G1 X123.645 Y116.606 E.06281
G2 X129.634 Y116.553 I.516 J-281.176 E.23841
G2 X130.354 Y116.433 I.051 J-1.91 E.02922
G2 X130.639 Y115.886 I-.359 J-.535 E.02559
G2 X130.674 Y113.924 I-23.883 J-1.403 E.07813
G2 X130.642 Y109.889 I-92.5 J-1.292 E.16063
G2 X130.427 Y109.321 I-.719 J-.052 E.02494
G2 X129.794 Y109.135 I-.593 J.842 E.02674
G2 X128.322 Y109.16 I-.416 J18.787 E.05863
; WIPE_START
M204 S10000
G1 X128.28 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.412 Y109.593 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
G1 X127.416 Y111.257 E.09675
G2 X127.39 Y113.935 I928.907 J10.115 E.1557
G1 X127.633 Y114.196 E.02073
; WIPE_START
G1 X127.39 Y113.935 E-.13547
G1 X127.406 Y112.292 E-.62453
; WIPE_END
G1 E-.04 F1800
G1 X127.313 Y117.394 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556602
G1 F5178.971
G2 X129.667 Y117.373 I.363 J-93.158 E.12926
G1 X129.804 Y117.367 E.00753
G2 X130.883 Y117.057 I.11 J-1.647 E.06291
G1 X131.041 Y116.929 E.01114
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X131.436 Y116.194 I-.763 J-.884 E.04941
G1 X131.462 Y115.986 E.01214
G2 X131.491 Y110.421 I-95.921 J-3.281 E.32224
G1 X131.469 Y109.831 E.03418
G2 X130.965 Y108.701 I-1.381 J-.061 E.07426
G1 X130.953 Y108.691 E.00088
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X130.82 Y108.598 I-1.463 J1.945 E.00852
G1 X130.583 Y108.47 E.01413
G2 X129.486 Y108.329 I-.918 J2.803 E.05832
G1 X128.913 Y108.332 E.03008
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X127.698 Y108.347 E.06738
G1 X127.275 Y108.322 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
G1 X127.275 Y108.829 E.02597
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X127.274 Y108.899 E.00377
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X127.273 Y108.969 E.00409
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X127.29 Y109.001 E.00233
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X127.308 Y109.034 E.00248
G1 X126.851 Y108.346 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
G1 X125.541 Y108.331 E.07052
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X124.231 Y108.317 E.06504
; WIPE_START
G1 X125.541 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.449 Y115.885 Z.88 F30000
G1 X124.231 Y117.394 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
G1 X127.313 Y117.394 E.15862
; WIPE_START
G1 X125.313 Y117.394 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.731 Y110.155 Z.88 F30000
G1 X129.561 Y104.674 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X129.651 Y104.629 E.00431
G1 X130.273 Y104.188 E.03287
G2 X129.112 Y103.006 I-9.165 J7.837 E.07147
G3 X123.972 Y98.397 I403.081 J-454.653 E.29773
G3 X123.977 Y97.133 I25.323 J-.523 E.05451
G3 X130.469 Y97.094 I5.077 J307.911 E.27991
G3 X132.003 Y97.118 I-.058 J53.259 E.06619
G3 X132.023 Y98.1 I-15.714 J.809 E.04237
G2 X127.037 Y98.147 I15.25 J1865.937 E.215
G2 X125.361 Y98.274 I.893 J22.973 E.07251
G1 X126.348 Y99.335 E.0625
G2 X129.272 Y101.993 I53.631 J-56.057 E.17039
G3 X131.962 Y104.413 I-175.542 J197.839 E.15603
G3 X131.942 Y105.734 I-104.991 J-.94 E.05695
G3 X123.974 Y105.743 I-4.782 J-654.062 E.34358
G3 X123.981 Y104.813 I16.22 J-.349 E.04014
G3 X128.754 Y104.781 I5.559 J477.802 E.20582
G2 X129.505 Y104.694 I.019 J-3.131 E.03271
G1 X129.401 Y104.335 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.712 Y104.126 I-.499 J-1.08 E.01497
G2 X128.861 Y103.284 I-7.64 J6.87 E.04768
G3 X123.597 Y98.557 I314.742 J-355.793 E.2816
G3 X123.626 Y96.772 I17.197 J-.613 E.07111
G3 X130.47 Y96.719 I5.139 J223.205 E.27242
G3 X132.338 Y96.766 I.421 J20.579 E.07443
G3 X132.363 Y98.446 I-7.035 J.942 E.06705
G3 X130.963 Y98.491 I-1.093 J-12.365 E.05577
G2 X126.763 Y98.535 I-.581 J143.774 E.16716
G1 X126.162 Y98.584 E.02402
G2 X127.858 Y100.233 I18.228 J-17.056 E.0942
G3 X132.339 Y104.25 I-324.732 J366.721 E.23952
G3 X132.31 Y106.107 I-148.094 J-1.41 E.0739
G3 X123.614 Y106.109 I-4.452 J-501.161 E.34612
G3 X123.627 Y104.447 I21.105 J-.67 E.06616
G3 X128.741 Y104.406 I8.882 J793.218 E.20358
G2 X129.342 Y104.348 I.031 J-2.806 E.02408
M204 S10000
G1 X129.097 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
G1 X128.311 Y105.27 E.04935
G2 X124.169 Y105.278 I-1.09 J538.895 E.26016
G1 X129.475 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X131.573 Y105.36 E.08351
G1 X131.585 Y104.578 E.03115
G1 X131.059 Y104.106 E.02812
G1 X130.617 Y104.55 E.02493
G1 X130.475 Y104.602 E.00601
G1 X130.388 Y104.562 E.00385
G1 X129.706 Y105.019 E.03267
G1 X129.467 Y105.082 E.00983
G1 X129.473 Y105.31 E.00908
G1 X130.445 Y104.983 F30000
; LINE_WIDTH: 0.468329
G1 F6298.816
G1 X130.53 Y104.981 E.00381
G1 X130.59 Y104.979 F30000
; LINE_WIDTH: 0.453874
G1 F6530.032
G1 X130.909 Y104.996 E.01391
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X131.228 Y105.012 E.01223
G1 X131.232 Y104.732 E.01071
G1 X131.072 Y104.589 E.00821
G1 X130.866 Y104.798 E.01125
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X130.753 Y104.872 E.00541
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X130.64 Y104.946 E.00591
G1 X130.703 Y103.933 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
G1 X130.388 Y103.619 E.02678
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X129.928 Y103.169 E.03599
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X129.4 Y102.686 E.03764
G3 X126.022 Y99.645 I111.103 J-126.796 E.23909
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X125.637 Y99.264 E.03185
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X125.353 Y98.987 E.02461
G1 X124.991 Y98.849 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
G1 X125.206 Y98.628 E.01108
M73 P74 R3
G1 X124.819 Y98.225 E.02012
; LINE_WIDTH: 0.409301
G1 F7363.507
G1 X124.784 Y98.167 E.00261
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X124.749 Y98.109 E.0028
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X124.767 Y98.026 E.0038
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X124.785 Y97.944 E.00406
G1 X124.927 Y97.912 E.00698
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X125.78 Y97.86 E.03638
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X127.027 Y97.787 I9.118 J144.535 E.04871
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X131.675 Y97.757 I9.596 J1132.296 E.1642
G1 X131.669 Y97.459 E.01055
G2 X126.617 Y97.464 I-1.861 J659.304 E.17851
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X125.763 Y97.489 E.03389
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X124.91 Y97.514 E.03638
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X124.655 Y97.532 E.01168
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X124.4 Y97.551 E.01213
G1 X124.362 Y98.108 E.02649
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X124.361 Y98.227 E.0051
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X124.619 Y98.485 E.01497
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X124.947 Y98.808 I3.652 J-3.379 E.01698
; WIPE_START
G1 X124.619 Y98.485 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.167 Y90.873 Z.88 F30000
G1 X125.43 Y87.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X125.308 Y87.277 E.00588
G2 X124.965 Y87.963 I.534 J.695 E.0342
G2 X125.012 Y92.891 I66.427 J1.84 E.21259
G2 X125.966 Y94.025 I1.138 J.011 E.06958
G2 X127.014 Y94.095 I1.068 J-8.135 E.04531
G2 X129.573 Y94.091 I1.225 J-33.233 E.11038
G2 X130.597 Y93.734 I.017 J-1.602 E.04773
G2 X130.921 Y93.035 I-.689 J-.744 E.03407
G2 X130.988 Y90.519 I-45.136 J-2.447 E.10855
G1 X131.028 Y86.162 E.18787
G1 X131.933 Y86.162 E.03901
G3 X131.911 Y93.396 I-263.533 J2.815 E.31194
G3 X130.704 Y94.851 I-2.632 J-.955 E.08313
G3 X129.512 Y95.06 I-1.136 J-2.974 E.05254
G3 X126.103 Y95.039 I-1.422 J-45.85 E.147
G3 X124.59 Y94.293 I.016 J-1.94 E.07528
G3 X124.009 Y92.742 I1.644 J-1.5 E.07317
G3 X123.98 Y90.444 I65.458 J-1.974 E.09909
G1 X124.003 Y86.158 E.18483
G3 X128.489 Y86.144 I2.983 J235.393 E.19344
G3 X128.498 Y90.009 I-83.313 J2.128 E.16667
G3 X127.512 Y89.976 I.196 J-20.914 E.04257
G2 X127.429 Y87.732 I-26.349 J-.15 E.09686
G2 X127.232 Y87.281 I-.991 J.165 E.02144
G2 X126.217 Y87.096 I-.819 J1.616 E.0451
G2 X125.488 Y87.204 I-.087 J1.939 E.03197
G1 X125.591 Y87.555 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.366 Y87.82 I.197 J.396 E.01424
G2 X125.318 Y88.724 I5.874 J.768 E.03608
G2 X125.385 Y92.857 I71.274 J.902 E.16453
G2 X126.213 Y93.682 I.802 J.023 E.05212
G2 X129.543 Y93.717 I2.145 J-45.024 E.13259
G2 X130.345 Y93.456 I.042 J-1.23 E.03425
G2 X130.548 Y92.995 I-.435 J-.467 E.0206
G2 X130.613 Y90.515 I-45.374 J-2.417 E.09875
G1 X130.657 Y85.787 E.18818
G1 X132.307 Y85.787 E.06566
G3 X132.281 Y93.468 I-230.889 J3.072 E.3057
G3 X130.863 Y95.191 I-2.956 J-.987 E.09085
G3 X129.531 Y95.435 I-1.29 J-3.292 E.05425
G3 X126.071 Y95.413 I-1.439 J-46.066 E.13772
G3 X124.31 Y94.543 I.048 J-2.315 E.08074
G3 X123.635 Y92.765 I1.869 J-1.727 E.07759
G3 X123.605 Y90.444 I65.545 J-1.996 E.09236
G1 X123.63 Y85.786 E.18542
G3 X128.39 Y85.768 I3.346 J258.086 E.18948
G3 X128.84 Y85.807 I.046 J2.084 E.01802
G3 X128.893 Y89.146 I-41.991 J2.325 E.13295
G3 X128.84 Y90.382 I-10.936 J.151 E.04927
G3 X127.142 Y90.336 I-.224 J-23.328 E.06761
G2 X127.06 Y87.806 I-30.876 J-.268 E.1008
G2 X126.966 Y87.573 I-.509 J.071 E.01011
G2 X126.445 Y87.471 I-.485 J1.092 E.02131
G2 X125.65 Y87.54 I-.147 J2.891 E.03187
; WIPE_START
M204 S10000
G1 X125.453 Y87.646 E-.08493
G1 X125.366 Y87.82 E-.07374
G1 X125.328 Y88.173 E-.13487
G1 X125.318 Y88.724 E-.2096
G1 X125.323 Y89.4 E-.25686
; WIPE_END
G1 E-.04 F1800
G1 X124.477 Y87.947 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
G1 X124.465 Y89.813 E.11987
G2 X124.52 Y92.945 I51.584 J.66 E.20122
G2 X125.436 Y94.374 I1.725 J-.098 E.11393
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X126.544 Y94.572 I1.005 J-2.421 E.074
G2 X129.896 Y94.545 I1.43 J-30.545 E.21888
G1 X130.03 Y94.526 E.00883
G2 X130.902 Y94.102 I-.152 J-1.421 E.06449
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X130.933 Y94.072 E.0027
G2 X131.076 Y93.904 I-.856 J-.878 E.01366
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X131.045 Y93.798 E.00633
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X131.014 Y93.692 E.0058
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X130.982 Y93.586 E.00527
G1 X131.217 Y93.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
G3 X131.479 Y93.226 I.096 J.244 E.01062
G1 X131.434 Y92.872 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
G1 X131.463 Y90.79 E.1328
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X131.48 Y86.357 I-818.445 J-5.298 E.2677
; WIPE_START
G1 X131.473 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.702 Y89.707 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
G2 X128.222 Y89.717 I.673 J-21.775 E.01016
G1 X128.311 Y89.808 E.00249
G1 X128.156 Y89.246 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
G2 X128.12 Y86.52 I-87.268 J-.238 E.10341
G1 X127.537 Y86.522 E.02212
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X127.087 Y86.548 E.01919
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X127.011 Y86.57 E.0038
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X126.934 Y86.591 E.00417
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X126.857 Y86.612 E.00454
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X126.78 Y86.634 E.00491
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X126.913 Y86.7 E.00913
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X127.046 Y86.766 E.00841
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X127.178 Y86.833 E.0077
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X127.311 Y86.899 E.00698
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X127.527 Y87.041 I-.144 J.453 E.01054
G1 X127.73 Y87.415 E.01712
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X127.795 Y87.679 E.00985
G3 X127.848 Y89.24 I-25.201 J1.644 E.0566
G1 X128.096 Y89.245 E.00896
G1 X127.815 Y86.818 F30000
; LINE_WIDTH: 0.359469
G1 F8589.18
G1 X127.759 Y86.851 E.00215
G1 X127.795 Y86.872 E.0014
G1 X125.685 Y86.645 F30000
; LINE_WIDTH: 0.629923
G1 F4512.586
G3 X126.721 Y86.631 I.648 J9.44 E.06529
G1 X124.726 Y86.829 F30000
; LINE_WIDTH: 0.362209
G1 F8511.282
G1 X124.669 Y86.862 E.00219
G1 X124.706 Y86.883 E.00144
G1 X124.67 Y87.575 F30000
; LINE_WIDTH: 0.419998
G1 F7144.644
G3 X125.119 Y86.952 I1.083 J.306 E.0312
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X125.23 Y86.892 E.00531
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X125.34 Y86.832 E.00594
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X125.45 Y86.772 E.00656
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X125.561 Y86.713 E.00719
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X125.671 Y86.653 E.00782
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X125.685 Y86.645 E.00104
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X125.594 Y86.622 E.00594
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X125.503 Y86.599 E.00546
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X125.412 Y86.576 E.00497
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X125.32 Y86.552 E.00448
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X125.229 Y86.529 E.00375
G1 X124.377 Y86.532 E.03402
G1 X124.374 Y87.57 E.04143
G1 X124.61 Y87.574 E.00944
; OBJECT_ID: 331
; WIPE_START
G1 X124.374 Y87.57 E-.08991
G1 X124.377 Y86.532 E-.39444
G1 X125.102 Y86.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
G1 X124.462 Y94.135 Z.88 F30000
G1 X119.199 Y156.678 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X119.128 Y156.47 E.00945
G2 X118.963 Y156.261 I-.682 J.368 E.01155
G2 X118.345 Y156.112 I-.571 J1.01 E.02774
G2 X113.796 Y156.06 I-6.536 J375.104 E.19616
G3 X113.801 Y155.214 I17.494 J-.334 E.03648
G3 X121.74 Y155.219 I3.721 J426.531 E.34235
G3 X121.691 Y156.513 I-22.684 J-.209 E.05586
G2 X116.797 Y159.975 I86.806 J127.905 E.25849
G2 X116.766 Y161.002 I.492 J.529 E.0493
G2 X117.347 Y161.496 I2.959 J-2.892 E.03294
G2 X121.712 Y164.543 I807.609 J-1152.394 E.22955
G3 X121.735 Y165.864 I-18.182 J.973 E.05697
G3 X113.798 Y165.839 I-2.114 J-587.958 E.34225
G3 X113.798 Y164.996 I33.794 J-.441 E.03633
G2 X118.423 Y164.949 I1.184 J-111.6 E.19948
G2 X118.889 Y164.796 I-.091 J-1.062 E.02133
G2 X118.835 Y163.652 I-.449 J-.552 E.0574
G2 X114.421 Y160.518 I-235.825 J327.478 E.23344
G2 X118.794 Y157.419 I-190.181 J-273.047 E.23114
G2 X119.183 Y157.033 I-.658 J-1.051 E.02381
G1 X119.207 Y156.736 E.01288
G1 X118.826 Y156.757 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.794 Y156.652 I-.275 J.027 E.00439
G2 X118.566 Y156.504 I-.274 J.173 E.01113
G2 X115.461 Y156.454 I-2.506 J58.481 E.12363
G3 X113.438 Y156.425 I.048 J-74.485 E.08051
G3 X113.443 Y154.849 I19.632 J-.729 E.06273
G3 X122.094 Y154.845 I4.488 J332.294 E.34432
G3 X122.057 Y156.718 I-15.279 J.634 E.07459
G2 X117.053 Y160.251 I87.947 J129.844 E.24385
G2 X117.107 Y160.819 I.27 J.26 E.02578
G2 X118.13 Y161.591 I7.227 J-8.504 E.05102
G3 X120.472 Y163.229 I-56.115 J82.729 E.11377
G3 X122.063 Y164.336 I-19.43 J29.634 E.07714
G3 X122.08 Y166.238 I-11.086 J1.052 E.07582
G3 X113.439 Y166.206 I-2.329 J-523.15 E.34395
G3 X113.438 Y164.622 I20.528 J-.8 E.06304
G2 X118.389 Y164.575 I1.22 J-133.023 E.1971
G2 X118.767 Y164.34 I.011 J-.402 E.01875
G2 X118.593 Y163.939 I-.357 J-.084 E.01867
G3 X113.859 Y160.566 I453.819 J-641.818 E.23134
G1 X113.794 Y160.513 E.00332
G3 X118.194 Y157.399 I1147.337 J1616.221 E.21454
G2 X118.741 Y156.984 I-7.158 J-10.003 E.02735
G2 X118.825 Y156.817 I-.191 J-.2 E.00758
M204 S10000
G1 X119.32 Y157.598 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
G1 X116.471 Y159.642 E.19585
G1 X116.114 Y159.788 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X115.071 Y160.52 E.05071
G1 X116.17 Y161.3 E.05363
G1 X116.361 Y161.052 E.01246
G3 X116.182 Y160.473 I.898 J-.595 E.02448
G1 X116.247 Y160.131 E.01386
G1 X116.295 Y160.038 E.00416
G1 X116.149 Y159.836 E.00991
G1 X115.803 Y160.473 F30000
; LINE_WIDTH: 0.511568
G1 F5695.554
G2 X115.799 Y160.571 I-.028 J.048 E.01147
G1 X116.534 Y161.441 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
G2 X119.235 Y163.377 I58.661 J-79.002 E.18711
G1 X119.593 Y163.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X119.406 Y163.778 E.01255
G1 X119.504 Y164.001 E.00971
G3 X119.344 Y164.857 I-1.156 J.228 E.03551
G1 X119.071 Y165.125 E.01522
G1 X118.962 Y165.179 E.00485
G1 X118.969 Y165.488 E.01232
G1 X121.366 Y165.489 E.09542
G1 X121.343 Y164.743 E.0297
G1 X119.642 Y163.558 E.08252
G1 X119.889 Y164.169 F30000
G1 F7144.644
G1 X119.85 Y164.594 E.01702
G1 X119.702 Y164.961 E.01572
G1 X119.583 Y165.129 E.00819
G1 X120.995 Y165.129 E.05619
G1 X120.989 Y164.935 E.00773
G1 X119.938 Y164.203 E.05096
G1 X120.182 Y164.745 F30000
; LINE_WIDTH: 0.394909
G1 F7680.033
G1 X120.119 Y164.781 E.00268
G1 X120.166 Y164.808 E.00201
G1 X118.592 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
G1 X115.38 Y165.424 E.1745
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X113.992 Y165.419 E.07177
; WIPE_START
G1 X115.38 Y165.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.308 Y157.867 Z.88 F30000
G1 X113.991 Y155.637 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.532414
G1 F5444.184
G1 X114.391 Y155.639 E.02089
; LINE_WIDTH: 0.556294
G1 F5182.184
G3 X116.97 Y155.64 I.796 J804.611 E.14149
G1 X118.675 Y155.67 E.09362
G1 X119.054 Y155.581 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X119.042 Y155.885 E.01208
G1 X119.228 Y155.992 E.00855
G1 X119.471 Y156.317 E.01617
G1 X119.586 Y156.699 E.01586
G1 X119.516 Y157.225 E.02115
G1 X119.68 Y157.455 E.01124
G1 X121.324 Y156.312 E.07967
G1 X121.351 Y155.592 E.02868
G1 X119.114 Y155.582 E.08903
G1 X119.794 Y156.017 F30000
; LINE_WIDTH: 0.565569
G1 F5087.102
G1 X119.987 Y156.485 E.02828
G1 X120.013 Y156.696 E.0119
G1 X120.899 Y156.08 E.06035
G1 X120.902 Y156.022 E.00321
G1 X119.854 Y156.018 E.05856
; WIPE_START
G1 X120.902 Y156.022 E-.3981
G1 X120.899 Y156.08 E-.02184
G1 X120.165 Y156.591 E-.34007
; WIPE_END
G1 E-.04 F1800
G1 X117.399 Y149.477 Z.88 F30000
G1 X115.271 Y144.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X114.653 Y144.712 E.04063
G1 X114.698 Y151.461 E.29102
G1 X115.382 Y152.145 E.04174
G1 X121.733 Y152.211 E.27389
G3 X121.731 Y153.017 I-15.639 J.362 E.03479
G3 X115.661 Y153.011 I-2.858 J-184.576 E.26177
G3 X115.059 Y152.849 I.021 J-1.275 E.02715
G3 X114.023 Y151.984 I.751 J-1.952 E.05926
G3 X113.833 Y151.223 I1.386 J-.75 E.03419
G3 X113.8 Y146.5 I104.203 J-3.088 E.20368
G3 X113.854 Y144.546 I30.526 J-.146 E.08426
G3 X115.438 Y143.11 I1.957 J.566 E.09708
G3 X117.169 Y143.024 I1.375 J10.16 E.07482
G3 X120.39 Y143.025 I1.512 J225.279 E.13889
G3 X121.686 Y143.047 I-.245 J52.583 E.0559
G3 X121.693 Y143.923 I-21.432 J.606 E.03778
G3 X115.317 Y143.947 I-4.211 J-273.027 E.27494
G1 X115.31 Y143.955 E.00047
G1 X115.488 Y144.322 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.029 Y144.851 E.02789
G1 X115.071 Y151.305 E.25687
G1 X115.539 Y151.772 E.02631
G1 X122.102 Y151.839 E.26126
G3 X122.082 Y153.39 I-12.499 J.612 E.06177
G3 X115.635 Y153.385 I-3.083 J-193.366 E.25663
G3 X114.904 Y153.191 I.052 J-1.664 E.03036
G3 X113.694 Y152.164 I.912 J-2.301 E.06429
G3 X113.459 Y151.249 I1.739 J-.934 E.03798
G3 X113.426 Y146.497 I103.801 J-3.114 E.18917
G3 X113.489 Y144.454 I26.721 J-.195 E.08137
G3 X115.346 Y142.746 I2.327 J.667 E.10563
G3 X117.167 Y142.649 I1.459 J10.173 E.07266
G3 X120.393 Y142.65 I1.513 J225.615 E.12842
G3 X122.047 Y142.69 I.118 J29.411 E.06586
G3 X122.051 Y144.283 I-18.899 J.844 E.06344
G3 X115.548 Y144.323 I-4.493 J-206.388 E.25886
M204 S10000
G1 X115.396 Y143.542 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
G1 X115.268 Y143.563 E.00571
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X115.089 Y143.631 I.076 J.465 E.0077
G1 X121.499 Y143.486 F30000
; LINE_WIDTH: 0.588624
G1 F4865.193
G2 X115.822 Y143.503 I-1.688 J381.573 E.3318
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X115.538 Y143.523 I.084 J3.261 E.01517
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X115.396 Y143.542 E.00699
G1 X115.478 Y143.301 F30000
; LINE_WIDTH: 0.489929
G1 F5982.279
G1 X115.173 Y143.555 E.01882
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X114.801 Y143.869 I3.535 J4.562 E.02485
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X114.442 Y144.284 I2.048 J2.135 E.03096
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X114.381 Y144.373 E.00567
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X114.299 Y144.503 E.0075
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X114.246 Y144.732 I.484 J.232 E.01137
G2 X114.237 Y145.384 I33.324 J.83 E.03121
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X114.274 Y151.395 I173.802 J1.921 E.32149
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X114.286 Y151.544 E.00731
G2 X114.402 Y151.776 I.425 J-.066 E.01291
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X114.82 Y152.209 I1.874 J-1.392 E.03404
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X114.921 Y152.291 E.00692
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X115.002 Y152.353 E.00508
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X115.082 Y152.414 E.00478
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X115.359 Y152.543 I.431 J-.561 E.01318
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X115.501 Y152.569 E.00688
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X118.115 Y152.606 I1.938 J-45.472 E.13918
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X119.828 Y152.609 E.08747
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X121.541 Y152.613 E.08261
; WIPE_START
G1 X119.828 Y152.609 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.166 Y145.006 Z.88 F30000
G1 X118.712 Y139.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M73 P75 R3
G1 X118.896 Y139.886 E.00897
G2 X120.567 Y139.592 I.592 J-1.531 E.07689
G2 X120.764 Y139.295 I-.907 J-.814 E.01544
G2 X120.821 Y136.139 I-91.854 J-3.227 E.1361
G3 X120.852 Y131.589 I190.503 J-.97 E.19623
G3 X121.694 Y131.583 I.51 J12.053 E.03633
G3 X121.657 Y139.346 I-164.906 J3.091 E.33479
G3 X120.94 Y140.42 I-1.745 J-.388 E.05696
G3 X119.493 Y140.853 I-1.323 J-1.782 E.06649
G3 X117.482 Y139.754 I-.081 J-2.24 E.10371
G3 X117.364 Y138.871 I3.141 J-.871 E.03852
G3 X117.296 Y133.433 I938.133 J-14.477 E.23453
G2 X117.153 Y132.632 I-2.427 J.02 E.03526
G2 X116.182 Y132.109 I-.941 J.583 E.04976
G2 X115.424 Y132.144 I-.274 J2.308 E.03289
G2 X114.785 Y132.925 I.314 J.908 E.04581
G2 X114.685 Y134.544 I9.636 J1.409 E.07004
G1 X114.664 Y140.434 E.254
G1 X113.827 Y140.418 E.03609
G3 X113.817 Y133.277 I367.728 J-4.084 E.30795
G3 X114.18 Y131.998 I2.012 J-.12 E.0584
G3 X116.083 Y131.24 I1.685 J1.46 E.09181
G3 X116.957 Y131.361 I.084 J2.601 E.03822
G3 X118.052 Y132.371 I-1.099 J2.291 E.06519
G3 X118.206 Y133.78 I-5.61 J1.326 E.06128
G3 X118.233 Y135.215 I-55.594 J1.737 E.06191
G1 X118.245 Y139.475 E.18369
G2 X118.66 Y139.76 I2.137 J-2.662 E.02172
G1 X118.888 Y139.46 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.48 Y139.617 I.644 J-1.234 E.02458
G2 X120.294 Y139.333 I.042 J-1.19 E.03511
G2 X120.394 Y139.185 I-.45 J-.413 E.00714
G2 X120.462 Y132.216 I-272.184 J-6.106 E.2774
G3 X120.496 Y131.24 I15.683 J.07 E.03888
G3 X122.056 Y131.235 I.812 J9.744 E.06217
G3 X122.028 Y139.403 I-149.209 J3.571 E.32516
G3 X121.173 Y140.714 I-2.118 J-.448 E.06376
G3 X119.492 Y141.228 I-1.553 J-2.073 E.07135
G3 X117.134 Y139.894 I-.084 J-2.603 E.11342
G3 X116.989 Y138.887 I3.413 J-1.005 E.04064
G3 X116.921 Y133.45 I906.214 J-14.078 E.21643
G2 X116.821 Y132.81 I-2.101 J.001 E.02588
G2 X116.298 Y132.497 I-.586 J.386 E.02511
G2 X115.532 Y132.503 I-.359 J2.881 E.03057
G2 X115.151 Y133.008 I.208 J.553 E.02656
G2 X115.06 Y134.547 I9.415 J1.33 E.06143
G1 X115.037 Y140.817 E.24956
G1 X113.454 Y140.786 E.06304
G3 X113.442 Y133.265 I383.096 J-4.349 E.29935
G3 X114.057 Y131.577 I2.273 J-.128 E.07351
G3 X116.094 Y130.865 I1.805 J1.895 E.08851
G3 X117.104 Y131.016 I.076 J2.948 E.04087
G3 X118.402 Y132.234 I-1.232 J2.613 E.07202
G3 X118.555 Y133.215 I-3.755 J1.089 E.03961
G3 X118.608 Y135.213 I-43.917 J2.155 E.07957
G1 X118.619 Y139.277 E.16175
G2 X118.836 Y139.431 I.913 J-1.05 E.0106
M204 S10000
G1 X118.247 Y139.995 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556328
G1 F5181.833
G2 X119.677 Y140.416 I1.204 J-1.454 E.08409
G2 X121.2 Y139.365 I-.004 J-1.635 E.10794
G1 X121.213 Y139.277 E.00487
G2 X121.272 Y131.775 I-217.653 J-5.446 E.41174
; WIPE_START
G1 X121.27 Y133.775 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.247 Y139.995 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.517434
G1 F5622.502
G1 X118.151 Y139.918 E.00627
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X118.041 Y139.825 E.00685
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X117.844 Y139.572 I.216 J-.372 E.01433
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X117.831 Y139.461 E.00525
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X117.809 Y139.058 I8.027 J-.635 E.02059
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X117.756 Y133.796 I457.492 J-7.25 E.29868
G1 X117.742 Y133.408 E.02207
G2 X117.666 Y132.704 I-4.298 J.108 E.04022
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X117.406 Y132.221 I-1.011 J.232 E.03187
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X116.072 Y131.673 I-1.234 J1.105 E.07989
G2 X115.63 Y131.678 I-.178 J3.395 E.02366
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X115.484 Y131.695 E.00758
G2 X114.708 Y132.094 I.251 J1.443 E.04552
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X114.476 Y132.395 I.836 J.882 E.0221
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X114.269 Y133.356 I2.018 J.937 E.0596
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X114.255 Y133.733 E.02058
G2 X114.243 Y136.044 I90.749 J1.649 E.12595
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X114.245 Y140.231 E.21616
; WIPE_START
G1 X114.244 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.32 Y131.246 Z.88 F30000
G1 X120.757 Y123.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X120.785 Y123.302 E.00618
G2 X120.834 Y120.03 I-88.736 J-2.964 E.1411
G1 X120.841 Y119.883 E.00637
G3 X121.655 Y119.871 I.621 J14.333 E.03512
G3 X121.689 Y129.069 I-343.474 J5.855 E.39665
G3 X120.842 Y129.074 I-.495 J-10.871 E.03653
G2 X120.796 Y125.851 I-465.892 J5.05 E.139
G2 X120.517 Y125.095 I-1.105 J-.022 E.03559
G1 X120.241 Y124.977 E.01293
G2 X115.126 Y124.907 I-4.92 J172.161 E.22057
G1 X113.799 Y124.879 E.05726
G3 X113.798 Y124.026 I28.298 J-.439 E.03678
G3 X119.299 Y123.991 I5.364 J407.272 E.23719
G2 X120.186 Y123.934 I.037 J-6.321 E.03838
G2 X120.734 Y123.498 I-.124 J-.717 E.03147
G1 X120.389 Y123.349 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.412 Y123.255 I-.324 J-.13 E.0039
G2 X120.459 Y120.019 I-91.605 J-2.951 E.1288
G3 X120.486 Y119.533 I3.734 J-.035 E.0194
G3 X121.736 Y119.497 I.931 J10.635 E.04979
G3 X122.012 Y119.513 I-.048 J3.211 E.01103
G3 X122.07 Y122.775 I-93.815 J3.301 E.12985
G3 X122.055 Y129.413 I-300.119 J2.64 E.26422
G3 X120.489 Y129.418 I-.814 J-8.909 E.06244
G3 X120.446 Y126.883 I40.436 J-1.952 E.10094
G2 X120.399 Y125.66 I-11.936 J-.159 E.04871
G2 X120.279 Y125.401 I-.451 J.052 E.01158
G2 X119.867 Y125.334 I-.314 J.628 E.01687
G2 X115.12 Y125.282 I-19.637 J1577.07 E.18895
G3 X113.446 Y125.239 I.191 J-40.475 E.06665
G3 X113.444 Y123.66 I12.6 J-.804 E.06288
G3 X119.292 Y123.616 I5.336 J318.555 E.23275
G2 X120.106 Y123.566 I.043 J-5.943 E.03249
G2 X120.362 Y123.403 I-.041 J-.347 E.01249
M204 S10000
G1 X121.239 Y123.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
G1 X121.253 Y121.146 E.12273
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X121.249 Y120.067 I97.022 J-.897 E.05477
; WIPE_START
G1 X121.253 Y121.146 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.307 Y124.309 Z.88 F30000
G1 X113.992 Y124.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
G2 X116.178 Y124.462 I5.395 J-984.686 E.12205
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X118.328 Y124.468 I2.352 J-433.847 E.12973
G1 X119.761 Y124.467 E.08645
G1 X120.136 Y124.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X120.356 Y124.619 E.00879
G1 X120.783 Y124.826 E.01889
G1 X120.947 Y125.002 E.00956
G1 X121.064 Y124.931 E.00547
G3 X121.328 Y125.06 I-.023 J.382 E.01199
G1 X121.323 Y123.796 E.0503
G1 X121.005 Y123.789 E.01266
G1 X120.901 Y123.939 E.00723
G1 X120.514 Y124.225 E.01916
G1 X120.135 Y124.315 E.01554
G1 X120.136 Y124.536 E.0088
G1 X120.952 Y124.381 F30000
; LINE_WIDTH: 0.502428
G1 F5813.241
G2 X120.947 Y124.477 I-.028 J.047 E.01091
G1 X120.967 Y125.606 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
G1 X121.25 Y125.815 E.0193
G1 X121.258 Y126.148 E.01829
G3 X121.262 Y128.884 I-316.202 J1.803 E.15007
; WIPE_START
G1 X121.259 Y126.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.774 Y119.398 Z.88 F30000
G1 X117.671 Y108.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X117.663 Y108.798 E.00032
G1 X117.609 Y114.391 E.24118
G3 X116.713 Y114.37 I-.228 J-9.413 E.03863
G2 X116.729 Y110.158 I-1509.827 J-7.73 E.18162
G2 X116.704 Y109.6 I-7.11 J.043 E.02411
G1 X116.525 Y108.796 E.03552
G3 X113.805 Y108.716 I4.812 J-210.43 E.11732
G3 X113.817 Y107.911 I34.461 J.095 E.03471
G3 X118.691 Y107.893 I3.846 J363.204 E.21018
G3 X120.342 Y108.001 I.263 J8.643 E.07143
G3 X121.695 Y109.792 I-.467 J1.76 E.10434
G3 X121.69 Y115.992 I-96.42 J3.026 E.26739
G3 X120.825 Y117.472 I-1.701 J-.002 E.07748
G3 X120.093 Y117.793 I-1.399 J-2.194 E.03459
G3 X117.085 Y117.83 I-2.043 J-43.787 E.12974
G1 X113.817 Y117.811 E.1409
G1 X113.801 Y116.978 E.0359
G2 X119.425 Y116.928 I.811 J-221.986 E.24253
G2 X120.2 Y116.816 I-.013 J-2.844 E.03385
M73 P75 R2
G2 X120.786 Y115.928 I-.389 J-.894 E.04854
G2 X120.823 Y113.925 I-23.875 J-1.44 E.08642
G2 X120.79 Y109.86 I-91.863 J-1.294 E.1753
G2 X120.553 Y109.135 I-1.155 J-.024 E.0335
G2 X119.584 Y108.76 I-.941 J.992 E.04596
G1 X117.731 Y108.797 E.07994
G1 X118.035 Y109.163 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X117.999 Y113.777 E.18364
G3 X117.959 Y114.735 I-8.637 J.117 E.03817
G3 X116.349 Y114.7 I-.658 J-6.92 E.06421
G3 X116.359 Y111.251 I83.034 J-1.482 E.13731
G2 X116.332 Y109.654 I-31.224 J-.254 E.06358
G1 X116.222 Y109.162 E.02004
G3 X113.43 Y109.078 I4.936 J-209.701 E.11118
G3 X113.45 Y107.539 I52.505 J-.115 E.06127
G3 X118.696 Y107.518 I4.186 J387.013 E.20881
G3 X120.43 Y107.636 I.263 J8.931 E.0693
G3 X122.07 Y109.775 I-.554 J2.123 E.11552
G3 X122.064 Y116.019 I-96.591 J3.041 E.24857
G3 X121.028 Y117.787 I-2.053 J-.016 E.08539
G3 X120.125 Y118.167 I-1.397 J-2.057 E.03927
G3 X117.084 Y118.205 I-2.072 J-43.797 E.12107
G1 X113.45 Y118.183 E.14465
G1 X113.419 Y116.606 E.06281
G2 X119.408 Y116.553 I.516 J-281.176 E.23841
G2 X120.128 Y116.433 I.051 J-1.91 E.02922
G2 X120.413 Y115.886 I-.359 J-.535 E.02559
G2 X120.448 Y113.924 I-23.883 J-1.403 E.07813
G2 X120.416 Y109.889 I-92.5 J-1.292 E.16063
G2 X120.2 Y109.321 I-.719 J-.052 E.02494
G2 X119.568 Y109.135 I-.593 J.842 E.02674
G2 X118.095 Y109.16 I-.416 J18.787 E.05863
; WIPE_START
M204 S10000
G1 X118.053 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.185 Y109.593 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
G1 X117.189 Y111.257 E.09675
G2 X117.164 Y113.935 I928.907 J10.115 E.1557
G1 X117.406 Y114.196 E.02073
; WIPE_START
G1 X117.164 Y113.935 E-.13547
G1 X117.179 Y112.292 E-.62453
; WIPE_END
G1 E-.04 F1800
G1 X117.087 Y117.394 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
G1 X114.004 Y117.394 E.15862
G1 X117.087 Y117.394 F30000
; LINE_WIDTH: 0.556602
G1 F5178.971
G2 X119.441 Y117.373 I.363 J-93.158 E.12926
G1 X119.578 Y117.367 E.00753
G2 X120.657 Y117.057 I.11 J-1.647 E.06291
G1 X120.815 Y116.929 E.01114
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X121.21 Y116.194 I-.763 J-.884 E.04941
G1 X121.235 Y115.986 E.01214
G2 X121.264 Y110.421 I-95.921 J-3.281 E.32224
G1 X121.243 Y109.831 E.03418
G2 X120.739 Y108.701 I-1.381 J-.061 E.07426
G1 X120.727 Y108.691 E.00088
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X120.594 Y108.598 I-1.463 J1.945 E.00852
G1 X120.356 Y108.47 E.01413
G2 X119.26 Y108.329 I-.918 J2.803 E.05832
G1 X118.686 Y108.332 E.03008
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X117.472 Y108.347 E.06738
G1 X117.048 Y108.322 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
G1 X117.049 Y108.829 E.02597
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X117.047 Y108.899 E.00377
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X117.046 Y108.969 E.00409
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X117.064 Y109.001 E.00233
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X117.081 Y109.034 E.00248
G1 X116.625 Y108.346 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
G1 X115.315 Y108.331 E.07052
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X114.005 Y108.317 E.06504
; WIPE_START
G1 X115.315 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.335 Y104.674 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X119.425 Y104.629 E.00431
G1 X120.046 Y104.188 E.03287
G2 X118.886 Y103.006 I-9.165 J7.837 E.07147
G3 X113.745 Y98.397 I403.081 J-454.653 E.29773
G3 X113.751 Y97.133 I25.323 J-.523 E.05451
G3 X120.242 Y97.094 I5.077 J307.911 E.27991
G3 X121.777 Y97.118 I-.058 J53.259 E.06619
G3 X121.797 Y98.1 I-15.714 J.809 E.04237
G2 X116.811 Y98.147 I15.25 J1865.937 E.215
G2 X115.135 Y98.274 I.893 J22.973 E.07251
G1 X116.122 Y99.335 E.0625
G2 X119.045 Y101.993 I53.631 J-56.057 E.17039
G3 X121.736 Y104.413 I-175.542 J197.839 E.15603
G3 X121.715 Y105.734 I-104.991 J-.94 E.05695
G3 X113.748 Y105.743 I-4.782 J-654.062 E.34358
G3 X113.754 Y104.813 I16.22 J-.349 E.04014
G3 X118.527 Y104.781 I5.559 J477.802 E.20582
G2 X119.279 Y104.694 I.019 J-3.131 E.03271
G1 X119.174 Y104.335 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.485 Y104.126 I-.499 J-1.08 E.01497
G2 X118.634 Y103.284 I-7.64 J6.87 E.04768
G3 X113.37 Y98.557 I314.742 J-355.793 E.2816
G3 X113.4 Y96.772 I17.197 J-.613 E.07111
G3 X120.243 Y96.719 I5.139 J223.205 E.27242
G3 X122.112 Y96.766 I.421 J20.579 E.07443
G3 X122.136 Y98.446 I-7.035 J.942 E.06705
G3 X120.737 Y98.491 I-1.093 J-12.365 E.05577
G2 X116.537 Y98.535 I-.581 J143.774 E.16716
G1 X115.936 Y98.584 E.02402
G2 X117.632 Y100.233 I18.228 J-17.056 E.0942
G3 X122.113 Y104.25 I-324.732 J366.721 E.23952
G3 X122.083 Y106.107 I-148.094 J-1.41 E.0739
G3 X113.388 Y106.109 I-4.452 J-501.161 E.34612
G3 X113.4 Y104.447 I21.105 J-.67 E.06616
G3 X118.515 Y104.406 I8.882 J793.218 E.20358
G2 X119.116 Y104.348 I.031 J-2.806 E.02408
M204 S10000
G1 X118.87 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
G1 X118.085 Y105.27 E.04935
G2 X113.943 Y105.278 I-1.09 J538.895 E.26016
G1 X119.248 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X121.346 Y105.36 E.08351
G1 X121.358 Y104.578 E.03115
G1 X120.833 Y104.106 E.02812
G1 X120.39 Y104.55 E.02493
G1 X120.249 Y104.602 E.00601
G1 X120.161 Y104.562 E.00385
G1 X119.479 Y105.019 E.03267
G1 X119.241 Y105.082 E.00983
G1 X119.247 Y105.31 E.00908
G1 X120.219 Y104.983 F30000
; LINE_WIDTH: 0.468329
G1 F6298.816
G1 X120.303 Y104.981 E.00381
G1 X120.363 Y104.979 F30000
; LINE_WIDTH: 0.453874
G1 F6530.032
G1 X120.682 Y104.996 E.01391
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X121.001 Y105.012 E.01223
G1 X121.006 Y104.732 E.01071
G1 X120.846 Y104.589 E.00821
G1 X120.64 Y104.798 E.01125
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X120.527 Y104.872 E.00541
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X120.414 Y104.946 E.00591
G1 X120.476 Y103.933 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
G1 X120.161 Y103.619 E.02678
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X119.702 Y103.169 E.03599
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X119.174 Y102.686 E.03764
G3 X115.796 Y99.645 I111.103 J-126.796 E.23909
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X115.411 Y99.264 E.03185
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X115.126 Y98.987 E.02461
G1 X114.765 Y98.849 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
G1 X114.979 Y98.628 E.01108
G1 X114.593 Y98.225 E.02012
; LINE_WIDTH: 0.409301
G1 F7363.507
M73 P76 R2
G1 X114.558 Y98.167 E.00261
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X114.522 Y98.109 E.0028
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X114.541 Y98.026 E.0038
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X114.559 Y97.944 E.00406
G1 X114.701 Y97.912 E.00698
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X115.553 Y97.86 E.03638
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X116.801 Y97.787 I9.118 J144.535 E.04871
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X121.449 Y97.757 I9.596 J1132.296 E.1642
G1 X121.443 Y97.459 E.01055
G2 X116.39 Y97.464 I-1.861 J659.304 E.17851
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X115.537 Y97.489 E.03389
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X114.683 Y97.514 E.03638
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X114.428 Y97.532 E.01168
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X114.173 Y97.551 E.01213
G1 X114.135 Y98.108 E.02649
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X114.135 Y98.227 E.0051
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X114.393 Y98.485 E.01497
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X114.72 Y98.808 I3.652 J-3.379 E.01698
; WIPE_START
G1 X114.393 Y98.485 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.94 Y90.873 Z.88 F30000
G1 X115.203 Y87.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X115.081 Y87.277 E.00588
G2 X114.739 Y87.963 I.534 J.695 E.0342
G2 X114.785 Y92.891 I66.427 J1.84 E.21259
G2 X115.739 Y94.025 I1.138 J.011 E.06958
G2 X116.787 Y94.095 I1.068 J-8.135 E.04531
G2 X119.346 Y94.091 I1.225 J-33.233 E.11038
G2 X120.371 Y93.734 I.017 J-1.602 E.04773
G2 X120.695 Y93.035 I-.689 J-.744 E.03407
G2 X120.761 Y90.519 I-45.136 J-2.447 E.10855
G1 X120.802 Y86.162 E.18787
G1 X121.707 Y86.162 E.03901
G3 X121.685 Y93.396 I-263.533 J2.815 E.31194
G3 X120.478 Y94.851 I-2.632 J-.955 E.08313
G3 X119.285 Y95.06 I-1.136 J-2.974 E.05254
G3 X115.877 Y95.039 I-1.422 J-45.85 E.147
G3 X114.364 Y94.293 I.016 J-1.94 E.07528
G3 X113.783 Y92.742 I1.644 J-1.5 E.07317
G3 X113.754 Y90.444 I65.458 J-1.974 E.09909
G1 X113.777 Y86.158 E.18483
G3 X118.263 Y86.144 I2.983 J235.393 E.19344
G3 X118.272 Y90.009 I-83.313 J2.128 E.16667
G3 X117.285 Y89.976 I.196 J-20.914 E.04257
G2 X117.202 Y87.732 I-26.349 J-.15 E.09686
G2 X117.005 Y87.281 I-.991 J.165 E.02144
G2 X115.99 Y87.096 I-.819 J1.616 E.0451
G2 X115.261 Y87.204 I-.087 J1.939 E.03197
G1 X115.365 Y87.555 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.14 Y87.82 I.197 J.396 E.01424
G2 X115.091 Y88.724 I5.874 J.768 E.03608
G2 X115.159 Y92.857 I71.274 J.902 E.16453
G2 X115.987 Y93.682 I.802 J.023 E.05212
G2 X119.317 Y93.717 I2.145 J-45.024 E.13259
G2 X120.118 Y93.456 I.042 J-1.23 E.03425
G2 X120.322 Y92.995 I-.435 J-.467 E.0206
G2 X120.386 Y90.515 I-45.374 J-2.417 E.09875
G1 X120.431 Y85.787 E.18818
G1 X122.08 Y85.787 E.06566
G3 X122.055 Y93.468 I-230.889 J3.072 E.3057
G3 X120.637 Y95.191 I-2.956 J-.987 E.09085
G3 X119.304 Y95.435 I-1.29 J-3.292 E.05425
G3 X115.845 Y95.413 I-1.439 J-46.066 E.13772
G3 X114.084 Y94.543 I.048 J-2.315 E.08074
G3 X113.408 Y92.765 I1.869 J-1.727 E.07759
G3 X113.379 Y90.444 I65.545 J-1.996 E.09236
G1 X113.404 Y85.786 E.18542
G3 X118.164 Y85.768 I3.346 J258.086 E.18948
G3 X118.614 Y85.807 I.046 J2.084 E.01802
G3 X118.666 Y89.146 I-41.991 J2.325 E.13295
G3 X118.613 Y90.382 I-10.936 J.151 E.04927
G3 X116.916 Y90.336 I-.224 J-23.328 E.06761
G2 X116.834 Y87.806 I-30.876 J-.268 E.1008
G2 X116.739 Y87.573 I-.509 J.071 E.01011
G2 X116.218 Y87.471 I-.485 J1.092 E.02131
G2 X115.423 Y87.54 I-.147 J2.891 E.03187
; WIPE_START
M204 S10000
G1 X115.226 Y87.646 E-.08493
G1 X115.14 Y87.82 E-.07374
G1 X115.101 Y88.173 E-.13487
G1 X115.091 Y88.724 E-.2096
G1 X115.096 Y89.4 E-.25686
; WIPE_END
G1 E-.04 F1800
G1 X114.25 Y87.947 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
G1 X114.239 Y89.813 E.11987
G2 X114.294 Y92.945 I51.584 J.66 E.20122
G2 X115.209 Y94.374 I1.725 J-.098 E.11393
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X116.317 Y94.572 I1.005 J-2.421 E.074
G2 X119.67 Y94.545 I1.43 J-30.545 E.21888
G1 X119.804 Y94.526 E.00883
G2 X120.675 Y94.102 I-.152 J-1.421 E.06449
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X120.707 Y94.072 E.0027
G2 X120.85 Y93.904 I-.856 J-.878 E.01366
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X120.819 Y93.798 E.00633
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X120.787 Y93.692 E.0058
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X120.756 Y93.586 E.00527
G1 X120.991 Y93.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
G3 X121.253 Y93.226 I.096 J.244 E.01062
G1 X121.207 Y92.872 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
G1 X121.237 Y90.79 E.1328
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X121.254 Y86.357 I-818.445 J-5.298 E.2677
; WIPE_START
G1 X121.246 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.476 Y89.707 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
G2 X117.996 Y89.717 I.673 J-21.775 E.01016
G1 X118.085 Y89.808 E.00249
G1 X117.929 Y89.246 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
G2 X117.894 Y86.52 I-87.268 J-.238 E.10341
G1 X117.311 Y86.522 E.02212
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X116.861 Y86.548 E.01919
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X116.784 Y86.57 E.0038
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X116.708 Y86.591 E.00417
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X116.631 Y86.612 E.00454
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X116.554 Y86.634 E.00491
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X116.687 Y86.7 E.00913
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X116.819 Y86.766 E.00841
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X116.952 Y86.833 E.0077
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X117.084 Y86.899 E.00698
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X117.3 Y87.041 I-.144 J.453 E.01054
G1 X117.503 Y87.415 E.01712
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X117.568 Y87.679 E.00985
G3 X117.622 Y89.24 I-25.201 J1.644 E.0566
G1 X117.869 Y89.245 E.00896
G1 X117.589 Y86.818 F30000
; LINE_WIDTH: 0.359469
G1 F8589.18
G1 X117.532 Y86.851 E.00215
G1 X117.569 Y86.872 E.0014
G1 X115.459 Y86.645 F30000
; LINE_WIDTH: 0.629923
G1 F4512.586
G3 X116.494 Y86.631 I.648 J9.44 E.06529
G1 X114.499 Y86.829 F30000
; LINE_WIDTH: 0.362209
G1 F8511.282
G1 X114.443 Y86.862 E.00219
G1 X114.48 Y86.883 E.00144
G1 X114.444 Y87.575 F30000
; LINE_WIDTH: 0.419998
G1 F7144.644
G3 X114.893 Y86.952 I1.083 J.306 E.0312
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X115.003 Y86.892 E.00531
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X115.114 Y86.832 E.00594
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X115.224 Y86.772 E.00656
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X115.334 Y86.713 E.00719
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X115.445 Y86.653 E.00782
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X115.459 Y86.645 E.00104
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X115.368 Y86.622 E.00594
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X115.276 Y86.599 E.00546
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X115.185 Y86.576 E.00497
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X115.094 Y86.552 E.00448
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X115.003 Y86.529 E.00375
G1 X114.15 Y86.532 E.03402
G1 X114.147 Y87.57 E.04143
G1 X114.384 Y87.574 E.00944
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F7124.94
G1 X114.147 Y87.57 E-.08991
G1 X114.15 Y86.532 E-.39443
G1 X114.876 Y86.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 3/4
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.88 I1.217 J0 P1  F30000
; object ids of layer 3 start: 169,331,425
M624 BwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer3 end: 169,331,425
M625
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.622 Y156.573
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X139.614 Y156.536 E.0016
G1 X139.447 Y156.278 E.01326
G2 X138.718 Y156.108 I-.643 J1.106 E.03276
G2 X134.249 Y156.06 I-7.769 J518.454 E.19268
G3 X134.253 Y155.214 I17.002 J-.341 E.03649
G3 X142.194 Y155.219 I3.7 J436.266 E.3424
G3 X142.144 Y156.513 I-23.469 J-.255 E.05586
G2 X137.272 Y159.958 I89.16 J131.272 E.25731
G2 X137.17 Y160.94 I.458 J.544 E.04709
G2 X137.86 Y161.54 I2.68 J-2.388 E.03953
G2 X142.167 Y164.544 I307.806 J-436.675 E.22642
G3 X142.189 Y165.864 I-21.622 J1.018 E.05692
G3 X134.252 Y165.839 I-2.224 J-554.855 E.34226
G3 X134.252 Y164.996 I24.634 J-.418 E.03634
G2 X138.876 Y164.949 I1.244 J-105.817 E.19942
G2 X139.342 Y164.798 I-.093 J-1.076 E.02129
G1 X139.51 Y164.615 E.01072
G2 X139.304 Y163.664 I-.626 J-.362 E.04604
G1 X139.119 Y163.522 E.01005
G2 X134.875 Y160.517 I-458.307 J642.503 E.22422
G2 X139.205 Y157.451 I-176.431 J-253.801 E.22876
G1 X139.461 Y157.25 E.01404
G1 X139.704 Y156.945 E.01681
G1 X139.635 Y156.631 E.01387
G1 X139.262 Y156.683 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.19 Y156.572 I-.393 J.175 E.00531
G2 X138.992 Y156.501 I-.251 J.386 E.00847
G2 X135.831 Y156.453 I-2.407 J55.548 E.12585
G3 X133.891 Y156.425 I.137 J-75.307 E.07722
G3 X133.896 Y154.85 I19.81 J-.719 E.06271
G3 X142.547 Y154.845 I4.498 J324.765 E.34435
G3 X142.509 Y156.718 I-15.49 J.624 E.07458
G2 X137.52 Y160.24 I92.34 J136.1 E.24309
G2 X137.476 Y160.721 I.216 J.263 E.02141
G2 X138.081 Y161.237 I2.404 J-2.208 E.03172
G3 X142.515 Y164.335 I-337.987 J488.436 E.21528
G3 X142.533 Y166.238 I-11.207 J1.059 E.07587
G3 X133.892 Y166.206 I-2.432 J-496.317 E.34393
G3 X133.891 Y164.622 I22.473 J-.808 E.06304
G2 X138.842 Y164.575 I1.283 J-126.428 E.19709
G2 X139.22 Y164.336 I.017 J-.392 E.01897
G2 X139.06 Y163.95 I-.359 J-.077 E.01769
G1 X138.896 Y163.824 E.00824
G3 X134.359 Y160.602 I378.383 J-537.536 E.22148
G1 X134.248 Y160.514 E.00564
G3 X134.443 Y160.364 I1.645 J1.939 E.00977
G2 X138.978 Y157.153 I-194.962 J-280.178 E.22117
G2 X139.299 Y156.852 I-.471 J-.825 E.01771
G2 X139.283 Y156.74 I-.43 J.007 E.00452
M204 S10000
G1 X139.769 Y157.6 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
G1 X136.923 Y159.642 E.19558
G1 X136.564 Y159.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X135.524 Y160.518 E.05064
G1 X136.547 Y161.245 E.04995
G3 X136.599 Y160.937 I.445 J-.083 E.0127
G1 X136.723 Y160.88 E.00543
G1 X136.64 Y160.44 E.01782
G1 X136.701 Y160.13 E.01259
G1 X136.748 Y160.038 E.0041
G1 X136.599 Y159.833 E.01008
G1 X136.26 Y160.47 F30000
; LINE_WIDTH: 0.516989
G1 F5627.99
G2 X136.257 Y160.569 I-.029 J.049 E.01182
G1 X137.179 Y161.243 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
G1 X137.185 Y161.549 E.01472
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X137.186 Y161.573 E.00121
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X137.187 Y161.596 E.0013
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X139.385 Y163.154 I48.405 J-65.991 E.15136
G1 X139.693 Y163.381 E.02148
G1 X140.051 Y163.527 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X139.869 Y163.774 E.0122
G1 X139.951 Y163.946 E.00761
G1 X139.987 Y164.301 E.01418
G3 X139.809 Y164.844 I-1.186 J-.087 E.02299
G1 X139.527 Y165.124 E.01581
G1 X139.418 Y165.178 E.00484
G1 X139.425 Y165.488 E.01234
G1 X141.808 Y165.489 E.09484
G1 X141.795 Y164.742 E.02972
G1 X140.1 Y163.561 E.08223
G1 X140.341 Y164.168 F30000
G1 F7144.644
G1 X140.303 Y164.586 E.01672
G1 X140.176 Y164.929 E.01455
G1 X140.036 Y165.128 E.00969
G1 X141.442 Y165.129 E.05594
G1 X141.439 Y164.932 E.00782
G1 X140.39 Y164.202 E.05084
G1 X140.633 Y164.744 F30000
; LINE_WIDTH: 0.396188
G1 F7650.785
G1 X140.57 Y164.781 E.0027
G1 X140.617 Y164.808 E.00204
G1 X139.048 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
G1 X138.055 Y165.42 E.05398
G3 X135.776 Y165.423 I-1.464 J-199.159 E.12384
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X134.445 Y165.419 E.06879
; WIPE_START
G1 X135.776 Y165.423 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.747 Y157.861 Z1.16 F30000
G1 X134.444 Y155.637 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.53292
G1 F5438.362
G1 X134.902 Y155.639 E.02393
; LINE_WIDTH: 0.556741
G1 F5177.519
G3 X137.621 Y155.641 I.71 J628.686 E.14935
G1 X139.127 Y155.669 E.08269
G1 X139.505 Y155.582 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X139.494 Y155.886 E.01214
G1 X139.731 Y156.028 E.01098
G1 X139.972 Y156.421 E.01836
G1 X140.09 Y156.955 E.02176
G3 X139.959 Y157.227 I-.407 J-.029 E.01229
G1 X140.13 Y157.458 E.01142
G1 X141.777 Y156.312 E.07986
G1 X141.804 Y155.592 E.02868
G1 X139.565 Y155.582 E.08915
G1 X140.238 Y156.017 F30000
; LINE_WIDTH: 0.563819
G1 F5104.776
G3 X140.474 Y156.692 I-1.228 J.808 E.04024
G1 X141.353 Y156.08 E.05966
G1 X141.356 Y156.022 E.00326
G1 X140.298 Y156.017 E.05891
; WIPE_START
G1 X141.356 Y156.022 E-.40183
G1 X141.353 Y156.08 E-.02226
G1 X140.628 Y156.585 E-.33591
; WIPE_END
G1 E-.04 F1800
G1 X135.15 Y151.39 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X135.15 Y151.461 E.00307
G1 X135.835 Y152.145 E.04174
G1 X142.186 Y152.211 E.27389
G3 X142.184 Y153.017 I-15.111 J.356 E.03479
G3 X136.255 Y153.019 I-3.021 J-188.976 E.25565
G3 X135.206 Y152.692 I.021 J-1.911 E.04807
G3 X134.332 Y151.609 I.736 J-1.489 E.0619
G3 X134.25 Y149.503 I14.647 J-1.627 E.09097
G3 X134.293 Y144.709 I129.901 J-1.208 E.20675
G3 X134.393 Y144.309 I.948 J.024 E.01789
G3 X135.745 Y143.15 I1.812 J.746 E.07971
G3 X136.775 Y143.036 I.879 J3.22 E.04483
G3 X140.842 Y143.025 I2.767 J273.526 E.1754
G3 X142.139 Y143.047 I-.213 J50.424 E.05593
G3 X142.148 Y143.923 I-18.081 J.618 E.03778
G3 X135.77 Y143.947 I-4.327 J-306.234 E.27502
G1 X135.106 Y144.712 E.04369
G1 X135.15 Y151.33 E.28536
G1 X135.524 Y151.305 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.992 Y151.772 E.02631
G1 X142.555 Y151.839 E.26126
G3 X142.535 Y153.39 I-13.43 J.6 E.06176
G3 X136.237 Y153.393 I-3.256 J-197.89 E.25069
G3 X135.018 Y153.016 I.043 J-2.297 E.05148
G3 X133.963 Y151.679 I.921 J-1.811 E.06995
G3 X133.875 Y149.504 I14.829 J-1.692 E.08669
G3 X133.919 Y144.684 I129.331 J-1.213 E.19186
G3 X134.117 Y144.011 I1.506 J.077 E.02821
G3 X135.799 Y142.746 I2.141 J1.097 E.08667
G3 X137.211 Y142.653 I1.194 J7.322 E.05642
G3 X140.846 Y142.65 I2.029 J286.473 E.14466
G3 X142.5 Y142.688 I-.008 J36.677 E.06587
G3 X142.503 Y144.284 I-14.086 J.828 E.06357
G3 X135.941 Y144.322 I-4.545 J-220.55 E.26122
G1 X135.482 Y144.851 E.02789
G1 X135.524 Y151.245 E.25449
M204 S10000
G1 X134.725 Y151.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.504165
G1 F5790.505
G2 X134.848 Y151.767 I.598 J.044 E.0215
; LINE_WIDTH: 0.557514
G1 F5169.477
G2 X134.985 Y151.937 I1.928 J-1.411 E.01202
; LINE_WIDTH: 0.575695
G1 F4987.195
G2 X135.257 Y152.195 I2.828 J-2.708 E.02137
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X135.421 Y152.328 E.01112
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X135.537 Y152.415 E.00697
; LINE_WIDTH: 0.446493
G1 F6654.752
G2 X135.819 Y152.545 I.428 J-.561 E.01337
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X135.954 Y152.569 E.00655
; LINE_WIDTH: 0.541749
G1 F5338.669
G2 X138.496 Y152.605 I1.926 J-46.083 E.13543
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X140.245 Y152.609 E.08944
; LINE_WIDTH: 0.49629
G1 F5895.049
G1 X141.994 Y152.613 E.08438
; WIPE_START
G1 X140.245 Y152.609 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.725 Y151.357 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.549563
G1 F5253.444
G3 X134.686 Y146.928 I159.616 J-3.635 E.23978
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X134.693 Y145.031 I145.437 J-.361 E.09703
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X134.699 Y144.735 E.01391
G3 X134.752 Y144.502 I.409 J-.03 E.01135
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X134.838 Y144.367 I2.594 J1.55 E.0079
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X134.9 Y144.277 E.00576
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X135.129 Y143.994 I2.914 J2.127 E.0206
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X135.327 Y143.803 I2.171 J2.05 E.01516
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X135.407 Y143.735 E.00523
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X135.965 Y143.294 E.03254
G1 X135.542 Y143.631 F30000
; LINE_WIDTH: 0.423704
G1 F7071.826
G3 X135.744 Y143.559 I.257 J.401 E.00872
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X135.863 Y143.54 E.00539
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X135.99 Y143.523 E.00625
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X136.203 Y143.506 I.331 J2.833 E.01127
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X139.864 Y143.484 I2.426 J98.82 E.21499
G3 X140.837 Y143.484 I.47 J142.627 E.05713
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X141.701 Y143.486 I.581 J-74.02 E.04883
G1 X141.953 Y143.728 E.01976
; WIPE_START
G1 X141.701 Y143.486 E-.21894
G1 X140.837 Y143.484 E-.54106
; WIPE_END
G1 E-.04 F1800
G1 X137.716 Y136.519 Z1.16 F30000
G1 X135.774 Y132.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X135.667 Y132.247 E.00536
G2 X135.237 Y132.929 I.517 J.803 E.03591
G2 X135.137 Y134.566 I9.465 J1.398 E.0708
G1 X135.116 Y140.434 E.25305
G1 X134.28 Y140.418 E.0361
G3 X134.266 Y133.44 I507.954 J-4.501 E.30088
M73 P77 R2
G3 X134.354 Y132.56 I3.431 J-.102 E.03826
G3 X135.199 Y131.527 I1.642 J.481 E.05916
G3 X136.552 Y131.24 I1.133 J2.012 E.06054
G3 X137.51 Y131.408 I.122 J2.124 E.0423
G3 X138.526 Y132.428 I-1.042 J2.054 E.06314
G3 X138.663 Y133.892 I-6.916 J1.387 E.0635
G3 X138.698 Y139.477 I-197.192 J4.024 E.24085
G2 X139.246 Y139.84 I3.362 J-4.476 E.02837
G2 X141.036 Y139.578 I.696 J-1.49 E.0826
G1 X141.215 Y139.323 E.01342
G2 X141.274 Y136.024 I-88.433 J-3.229 E.14232
G3 X141.305 Y131.585 I184.331 J-.91 E.19141
G3 X142.147 Y131.582 I.474 J14.099 E.03628
G3 X142.11 Y139.343 I-166.444 J3.094 E.33472
G3 X141.386 Y140.425 I-1.747 J-.386 E.05745
G3 X139.881 Y140.852 I-1.328 J-1.817 E.06889
G3 X137.916 Y139.703 I-.039 J-2.188 E.10323
G3 X137.798 Y138.272 I6.552 J-1.26 E.06201
G2 X137.748 Y133.415 I-1247.715 J10.507 E.20947
G2 X137.606 Y132.628 I-1.994 J-.048 E.03472
G2 X136.629 Y132.108 I-.951 J.611 E.0499
G2 X136.002 Y132.112 I-.274 J6.121 E.02701
G2 X135.83 Y132.163 I.182 J.938 E.00775
G1 X135.943 Y132.524 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.603 Y133.011 I.239 J.529 E.02483
G2 X135.512 Y134.569 I9.204 J1.319 E.0622
G1 X135.49 Y140.817 E.24867
G1 X133.906 Y140.786 E.06304
G3 X133.891 Y133.431 I527.43 J-4.797 E.29273
G3 X133.998 Y132.442 I3.73 J-.097 E.03973
G3 X135.005 Y131.206 I1.987 J.591 E.06514
G3 X136.563 Y130.865 I1.324 J2.325 E.06444
G3 X137.44 Y130.971 I.008 J3.618 E.03527
G3 X138.884 Y132.317 I-.877 J2.389 E.0807
G3 X139.038 Y133.881 I-7.11 J1.487 E.06265
G3 X139.072 Y139.277 I-191.103 J3.92 E.2148
G2 X140.653 Y139.415 I.884 J-1.002 E.06761
G2 X140.847 Y139.195 I-.356 J-.51 E.01178
G2 X140.913 Y132.334 I-267.548 J-6.006 E.27311
G3 X140.949 Y131.241 I19.227 J.088 E.04356
G3 X142.51 Y131.246 I.757 J7.182 E.06227
G3 X142.482 Y139.4 I-153.029 J3.539 E.32462
G3 X141.618 Y140.72 I-2.121 J-.445 E.06426
G3 X139.878 Y141.227 I-1.56 J-2.118 E.07361
G3 X139.359 Y141.177 I.206 J-4.837 E.02077
G3 X137.582 Y139.881 I.529 J-2.593 E.09029
G3 X137.439 Y138.805 I3.266 J-.982 E.04339
G3 X137.386 Y133.95 I171.334 J-4.265 E.19327
G2 X137.312 Y132.909 I-5.726 J-.113 E.04158
G2 X136.744 Y132.496 I-.586 J.209 E.02972
G2 X136.066 Y132.484 I-.428 J4.936 E.02698
G2 X135.999 Y132.502 I.116 J.568 E.00277
M204 S10000
G1 X136.084 Y131.679 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
G1 X135.953 Y131.691 E.00674
G2 X135.169 Y132.088 I.236 J1.441 E.04588
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X134.919 Y132.415 I.788 J.861 E.02391
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X134.715 Y133.503 I2.438 J1.02 E.06665
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X134.709 Y133.694 E.01035
G2 X134.695 Y136.645 I107.849 J1.982 E.15975
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X134.698 Y140.231 E.18433
; WIPE_START
G1 X134.697 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.084 Y131.679 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
G3 X136.539 Y131.673 I.269 J3.422 E.0244
G3 X137.879 Y132.246 I.109 J1.597 E.08098
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X138.065 Y132.529 I-.781 J.717 E.01943
G1 X138.142 Y132.822 E.01728
G1 X138.187 Y133.269 E.02565
G3 X138.254 Y138.771 I-234.918 J5.615 E.31394
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X138.276 Y139.358 I14.528 J-.241 E.03091
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X138.29 Y139.526 E.00817
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X138.495 Y139.826 I.384 J-.042 E.01655
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X138.602 Y139.917 E.00673
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X138.697 Y139.993 E.00615
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X139.677 Y140.409 I1.157 J-1.365 E.05926
G1 X139.804 Y140.419 E.00699
G2 X141.312 Y139.913 I.211 J-1.871 E.09008
G2 X141.666 Y139.275 I-.682 J-.796 E.04086
G2 X141.725 Y131.774 I-226.04 J-5.516 E.41155
; WIPE_START
G1 X141.722 Y133.774 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.326 Y126.151 Z1.16 F30000
G1 X141.189 Y123.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X141.202 Y123.461 E.00163
G2 X141.238 Y123.306 I-.681 J-.24 E.00684
G2 X141.293 Y119.881 I-222.109 J-5.29 E.14772
G3 X142.111 Y119.869 I.6 J13.182 E.03528
G3 X142.141 Y129.069 I-363.455 J5.817 E.39669
G3 X141.292 Y129.072 I-.472 J-12.005 E.03662
G3 X141.272 Y126.657 I63.038 J-1.745 E.10415
G2 X141.225 Y125.608 I-9.038 J-.122 E.04529
G2 X140.932 Y125.073 I-.84 J.112 E.0269
G1 X140.677 Y124.974 E.01179
G2 X136.715 Y124.921 I-3.603 J120.385 E.1709
G3 X134.252 Y124.878 I.952 J-126.704 E.10622
G3 X134.253 Y124.026 I20.983 J-.383 E.03675
G3 X138.806 Y124 I3.393 J200.086 E.19633
G2 X140.655 Y123.93 I.362 J-14.833 E.07982
G2 X141.13 Y123.607 I-.134 J-.71 E.02548
G1 X141.161 Y123.549 E.00283
G1 X140.846 Y123.341 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.865 Y123.258 I-.322 J-.117 E.00341
G2 X140.925 Y119.684 I-431.298 J-9.119 E.14229
G3 X140.939 Y119.534 I1.876 J.096 E.006
G3 X142.043 Y119.494 I.875 J9.004 E.04401
G3 X142.465 Y119.512 I-.103 J7.252 E.0168
G3 X142.523 Y122.743 I-82.114 J3.097 E.12861
G3 X142.508 Y129.413 I-272.898 J2.734 E.26549
G3 X140.943 Y129.418 I-.807 J-8.179 E.06241
G3 X140.907 Y128.663 I7.988 J-.754 E.0301
G2 X140.875 Y125.88 I-55.971 J-.737 E.11079
G2 X140.793 Y125.477 I-.984 J-.01 E.01647
G2 X140.599 Y125.346 I-.229 J.129 E.00967
G2 X136.711 Y125.296 I-3.608 J128.888 E.15475
G3 X133.9 Y125.239 I1.127 J-126.045 E.11194
G3 X133.897 Y123.659 I13.82 J-.815 E.06292
G3 X138.803 Y123.626 I4.025 J230.856 E.1953
G2 X140.571 Y123.563 I.351 J-15.171 E.07042
G2 X140.82 Y123.396 I-.047 J-.339 E.01239
M204 S10000
G1 X141.692 Y123.407 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
G1 X141.706 Y121.223 E.11833
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X141.702 Y120.287 I106.745 J-.909 E.04763
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X141.916 Y120.064 E.01472
; WIPE_START
G1 X141.702 Y120.287 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.082 Y124.086 Z1.16 F30000
G1 X134.445 Y124.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
G1 X135.431 Y124.457 E.0536
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X138.808 Y124.468 I5.158 J-1097.004 E.19695
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X140.217 Y124.467 E.08739
G1 X140.592 Y124.595 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X140.783 Y124.613 E.00763
G1 X141.179 Y124.787 E.0172
G1 X141.438 Y125.085 E.01574
G1 X141.481 Y125.179 E.00411
G1 X141.783 Y125.165 E.01201
G1 X141.775 Y123.784 E.05497
G1 X141.452 Y123.777 E.01286
G1 X141.279 Y124.018 E.01181
G1 X140.995 Y124.214 E.01374
G1 X140.591 Y124.305 E.0165
G1 X140.592 Y124.535 E.00914
G1 X141.409 Y124.392 F30000
; LINE_WIDTH: 0.494249
G1 F5922.767
G2 X141.403 Y124.486 I-.027 J.046 E.01042
G1 X141.691 Y125.545 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
G1 X141.715 Y126.653 E.06081
G3 X141.714 Y128.645 I-365.053 J.826 E.10932
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X141.483 Y128.878 E.01704
; WIPE_START
G1 X141.714 Y128.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.446 Y121.017 Z1.16 F30000
G1 X141.03 Y109.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X141 Y109.142 E.0017
G2 X140.12 Y108.766 I-.846 J.763 E.04259
G2 X139.677 Y108.756 I-.354 J5.881 E.01909
G1 X138.116 Y108.799 E.06735
G1 X138.077 Y113.744 E.21325
G3 X138.061 Y114.394 I-21.223 J-.218 E.02804
G3 X137.166 Y114.368 I-.174 J-9.389 E.0386
G3 X137.188 Y110.743 I550.038 J1.427 E.1563
G2 X137.157 Y109.6 I-16.18 J-.133 E.04932
G1 X136.978 Y108.796 E.03551
G3 X134.259 Y108.716 I4.245 J-190.923 E.1173
G3 X134.27 Y107.911 I31.488 J.033 E.0347
G3 X139.527 Y107.898 I3.3 J266.573 E.22668
G3 X140.836 Y108.012 I.138 J6.018 E.0568
G3 X142.146 Y109.758 I-.523 J1.757 E.10084
G3 X142.148 Y115.925 I-98.644 J3.107 E.26596
G3 X141.888 Y116.897 I-1.778 J.045 E.04398
G3 X140.526 Y117.795 I-1.954 J-1.484 E.07171
G3 X137.49 Y117.83 I-2.057 J-46.276 E.13096
G1 X134.27 Y117.811 E.13883
G1 X134.254 Y116.978 E.0359
G2 X140.081 Y116.917 I.836 J-198.271 E.25131
G2 X140.848 Y116.708 I.032 J-1.391 E.03475
G2 X141.233 Y115.983 I-.603 J-.785 E.03649
G2 X141.275 Y114.29 I-25.853 J-1.485 E.07303
G2 X141.244 Y109.865 I-100.14 J-1.505 E.19086
G2 X141.127 Y109.311 I-1.678 J.065 E.0245
G1 X141.063 Y109.217 E.00488
G1 X140.725 Y109.385 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.096 Y109.14 I-.646 J.728 E.02742
G2 X139.682 Y109.131 I-.331 J5.508 E.0165
G1 X138.488 Y109.163 E.04753
G3 X138.446 Y114.108 I-229.37 J.496 E.1968
G3 X138.411 Y114.734 I-5.826 J-.003 E.02497
G3 X136.804 Y114.7 I-.661 J-6.741 E.06413
G3 X136.813 Y110.744 I103.805 J-1.757 E.15745
G2 X136.785 Y109.654 I-16.082 J-.129 E.04342
G1 X136.675 Y109.162 E.02004
G3 X133.883 Y109.078 I4.91 J-208.862 E.1112
G3 X133.902 Y107.539 I61.525 J.021 E.06127
G3 X139.535 Y107.523 I3.594 J283.119 E.22418
G3 X140.944 Y107.652 I.137 J6.257 E.05646
G3 X142.521 Y109.74 I-.632 J2.116 E.11145
G3 X142.522 Y115.95 I-98.872 J3.123 E.24719
G3 X142.109 Y117.226 I-2.069 J.036 E.05439
G3 X140.674 Y118.156 I-2.247 J-1.894 E.06908
G3 X137.489 Y118.205 I-2.222 J-41.407 E.12681
G1 X133.903 Y118.183 E.14274
G1 X133.871 Y116.606 E.06281
G2 X139.857 Y116.553 I.854 J-243.189 E.23825
G2 X140.536 Y116.458 I.063 J-2.02 E.02743
G2 X140.861 Y115.936 I-.284 J-.539 E.02564
G2 X140.9 Y114.29 I-26.154 J-1.445 E.06556
G2 X140.87 Y109.895 I-101.673 J-1.5 E.17495
G2 X140.754 Y109.437 I-.993 J.007 E.01897
M204 S10000
G1 X141.127 Y108.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
G3 X141.696 Y109.834 I-.814 J1.119 E.07914
G1 X141.706 Y110.059 E.01304
G3 X141.696 Y115.896 I-101.795 J2.736 E.33775
G1 X141.682 Y116.049 E.00892
G3 X141.271 Y116.925 I-1.234 J-.044 E.05754
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X141.261 Y116.936 E.0008
G3 X140.041 Y117.368 I-1.121 J-1.228 E.07343
G1 X139.884 Y117.373 E.00866
G3 X138.446 Y117.391 I-1.518 J-65.058 E.07948
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X134.457 Y117.394 I-2.619 J-719.618 E.20729
; WIPE_START
G1 X136.457 Y117.393 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.616 Y114.195 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
G3 X137.642 Y111.299 I489.208 J2.962 E.16843
G1 X137.638 Y109.593 E.09925
G1 X137.501 Y108.327 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
G1 X137.502 Y108.828 E.02568
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X137.501 Y108.898 E.00383
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X137.5 Y108.969 E.00416
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X137.517 Y109.001 E.0023
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X137.535 Y109.033 E.00244
G1 X137.925 Y108.347 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
G3 X139.518 Y108.329 I2.295 J129.717 E.08775
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X139.917 Y108.334 E.02083
G3 X141.009 Y108.575 I.116 J2.068 E.05909
G1 X141.127 Y108.651 E.00731
G1 X137.077 Y108.346 F30000
; LINE_WIDTH: 0.546922
G1 F5281.948
G1 X135.768 Y108.331 E.07052
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X134.458 Y108.317 E.06504
; WIPE_START
G1 X135.768 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.617 Y100.7 Z1.16 F30000
G1 X135.568 Y98.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X136.562 Y99.322 E.06264
G2 X139.497 Y101.992 I52.429 J-54.693 E.1711
G3 X142.188 Y104.413 I-170.214 J191.92 E.15609
G3 X142.168 Y105.734 I-104.989 J-.94 E.05695
G3 X134.198 Y105.743 I-4.756 J-646.551 E.34367
G3 X134.207 Y104.813 I13.358 J-.337 E.04012
G3 X138.257 Y104.792 I3.029 J194.358 E.17461
G2 X139.69 Y104.71 I.248 J-8.212 E.06197
G1 X139.831 Y104.658 E.00651
G1 X140.513 Y104.197 E.03549
G2 X139.271 Y102.944 I-9.327 J8.008 E.07615
G3 X134.198 Y98.397 I385.239 J-434.778 E.29376
G3 X134.205 Y97.133 I23.066 J-.519 E.05451
G3 X140.921 Y97.095 I5.121 J317.268 E.28964
G3 X142.23 Y97.119 I-.016 J37.102 E.05644
G3 X142.25 Y98.1 I-9.397 J.683 E.04233
G2 X137.255 Y98.148 I13.314 J1658.362 E.21541
G2 X135.628 Y98.257 I1.096 J28.375 E.07031
G1 X136.38 Y98.58 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.749 Y100.831 I23.246 J-22.101 E.13013
G3 X142.566 Y104.25 I-232.379 J263.166 E.20396
G3 X142.536 Y106.107 I-148.094 J-1.41 E.0739
G3 X133.84 Y106.109 I-4.459 J-502.798 E.34615
G3 X133.853 Y104.448 I22.096 J-.653 E.06613
G3 X138.975 Y104.406 I4.506 J238.501 E.20388
G2 X139.659 Y104.322 I.032 J-2.561 E.02752
G1 X139.943 Y104.13 E.01365
G2 X139.019 Y103.222 I-7.317 J6.529 E.0516
G3 X133.823 Y98.557 I302.231 J-341.854 E.27792
G3 X133.853 Y96.772 I17.451 J-.606 E.07112
G3 X140.923 Y96.72 I5.189 J228.924 E.28143
G3 X142.565 Y96.766 I.34 J17.451 E.06541
G3 X142.592 Y98.445 I-7.415 J.958 E.06698
G3 X141.412 Y98.489 I-.874 J-7.447 E.04705
G2 X137.045 Y98.532 I-.667 J156.379 E.17381
G1 X136.44 Y98.576 E.02417
M204 S10000
G1 X135.884 Y99.286 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
G1 X136.237 Y99.634 E.02902
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X139.558 Y102.624 I116.807 J-126.382 E.235
G1 X140.067 Y103.087 E.03614
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X140.628 Y103.631 I-12.025 J12.963 E.04351
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X140.983 Y103.983 E.03023
G1 X139.705 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X141.799 Y105.36 E.08334
G1 X141.811 Y104.578 E.03115
G1 X141.34 Y104.155 E.0252
G1 X140.899 Y104.601 E.02496
G1 X140.728 Y104.649 E.00707
G1 X140.59 Y104.597 E.00585
G1 X140.016 Y104.986 E.02761
G1 X139.698 Y105.078 E.01318
G1 X139.704 Y105.31 E.00924
G1 X140.641 Y105.002 F30000
; LINE_WIDTH: 0.423508
G1 F7075.639
G1 X140.807 Y105.004 E.00667
G1 X140.867 Y105.005 F30000
; LINE_WIDTH: 0.406861
G1 F7415.318
G1 X141.168 Y105.016 E.01157
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X141.47 Y105.027 E.01046
G1 X141.473 Y104.778 E.00866
G2 X141.354 Y104.617 I-.236 J.051 E.00716
G1 X141.138 Y104.838 E.01069
; LINE_WIDTH: 0.396754
G1 F7637.945
G1 X140.918 Y104.974 E.00965
G1 X139.327 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
G1 X138.258 Y105.272 E.06721
G2 X135.769 Y105.274 I-.801 J441.112 E.15642
G2 X134.395 Y105.278 I-.353 J138.553 E.08636
; WIPE_START
G1 X135.769 Y105.274 E-.52215
G1 X136.395 Y105.274 E-.23785
; WIPE_END
G1 E-.04 F1800
G1 X135.884 Y99.286 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
G1 X135.534 Y98.946 E.03013
G1 X135.173 Y98.809 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
M73 P78 R2
G1 F7939.26
G1 X135.387 Y98.588 E.01102
G1 X135.023 Y98.211 E.01878
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X134.957 Y98.096 E.00519
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X134.976 Y98.014 E.00366
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X134.994 Y97.931 E.00394
G1 X135.131 Y97.902 E.00657
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X136.891 Y97.805 E.07157
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X137.245 Y97.787 E.01256
G3 X141.902 Y97.757 I9.125 J1054.978 E.1648
G1 X141.896 Y97.459 E.01055
G1 X140.919 Y97.447 E.03456
G2 X136.877 Y97.462 I1.138 J844.588 E.14307
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X135.115 Y97.511 E.07157
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X134.868 Y97.528 E.0111
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X134.621 Y97.546 E.01145
G1 X134.582 Y98.094 E.02542
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X134.583 Y98.229 E.00563
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X134.82 Y98.467 E.01347
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X135.129 Y98.769 I3.692 J-3.462 E.01577
; WIPE_START
G1 X134.82 Y98.467 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.202 Y90.844 Z1.16 F30000
G1 X135.372 Y87.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X135.296 Y87.562 E.00655
G2 X135.191 Y87.97 I.791 J.421 E.01834
G2 X135.232 Y92.812 I71.105 J1.831 E.20885
G2 X135.749 Y93.865 I1.238 J.045 E.05271
G2 X136.547 Y94.068 I.893 J-1.84 E.03575
G2 X139.902 Y94.081 I1.819 J-34.674 E.14471
G2 X140.959 Y93.59 I-.008 J-1.4 E.05186
G2 X141.144 Y93.068 I-.909 J-.616 E.02412
G2 X141.212 Y90.744 I-28.998 J-2.002 E.10031
G1 X141.255 Y86.162 E.19755
G1 X142.159 Y86.162 E.03901
G3 X142.138 Y93.394 I-238.073 J2.92 E.31183
G3 X140.876 Y94.875 I-2.547 J-.892 E.08585
G3 X139.879 Y95.052 I-1.055 J-3.041 E.04386
G3 X136.111 Y95.016 I-1.571 J-32.653 E.1626
G3 X134.827 Y94.304 I.229 J-1.926 E.06492
G3 X134.252 Y92.977 I1.467 J-1.422 E.06373
G3 X134.207 Y90.293 I34.1 J-1.918 E.11578
G1 X134.229 Y86.158 E.17832
G3 X138.595 Y86.143 I3.039 J242.645 E.18826
G1 X138.716 Y86.147 E.0052
G3 X138.726 Y90.01 I-88.309 J2.168 E.16658
G3 X137.738 Y89.976 I.262 J-22.511 E.04263
G2 X137.676 Y87.879 I-33.386 J-.057 E.09047
G2 X137.458 Y87.282 I-1.237 J.112 E.02774
G2 X136.435 Y87.097 I-.831 J1.669 E.04546
G2 X135.536 Y87.276 I-.084 J1.921 E.03992
G2 X135.416 Y87.389 I.552 J.706 E.00711
G1 X135.685 Y87.651 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.565 Y88.001 I.404 J.334 E.01507
G2 X135.606 Y92.784 I71.116 J1.79 E.19038
G2 X135.865 Y93.482 I.957 J.042 E.03045
G2 X136.576 Y93.694 I.674 J-.96 E.03005
G2 X139.866 Y93.708 I1.794 J-34.451 E.13098
G2 X140.658 Y93.363 I-.013 J-1.112 E.03532
G2 X140.772 Y93.021 I-.582 J-.384 E.01454
G2 X140.837 Y90.739 I-28.895 J-1.961 E.09087
G1 X140.883 Y85.787 E.1971
G1 X142.533 Y85.787 E.06566
G3 X142.507 Y93.468 I-239.153 J3.044 E.30571
G3 X141.088 Y95.192 I-2.955 J-.987 E.09092
G3 X139.901 Y95.427 I-1.185 J-2.874 E.04847
G3 X136.064 Y95.388 I-1.59 J-32.963 E.15282
G3 X134.548 Y94.555 I.265 J-2.278 E.07058
G3 X133.879 Y93.01 I1.744 J-1.673 E.06846
G3 X133.832 Y90.293 I34.395 J-1.95 E.1082
G1 X133.857 Y85.786 E.1794
G3 X138.603 Y85.768 I3.368 J260.389 E.18891
G3 X139.067 Y85.808 I.022 J2.477 E.01858
G3 X139.118 Y89.22 I-42.344 J2.346 E.13589
G3 X139.065 Y90.383 I-10.19 J.116 E.04636
G3 X137.368 Y90.336 I-.076 J-28.108 E.06757
G2 X137.303 Y87.921 I-38.033 J-.176 E.09618
G2 X137.192 Y87.573 I-.766 J.052 E.01468
G2 X136.445 Y87.471 I-.566 J1.36 E.03033
G2 X135.743 Y87.592 I-.087 J1.603 E.0286
G2 X135.726 Y87.607 I.346 J.394 E.00091
; WIPE_START
M204 S10000
G1 X135.627 Y87.726 E-.05886
G1 X135.593 Y87.819 E-.03768
G1 X135.565 Y88.001 E-.07005
G1 X135.544 Y88.687 E-.26076
G1 X135.546 Y89.556 E-.33017
G1 X135.546 Y89.563 E-.00247
; WIPE_END
G1 E-.04 F1800
G1 X134.697 Y87.958 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
G1 X134.691 Y89.563 E.10313
G2 X134.746 Y92.934 I54.656 J.795 E.21673
G1 X134.772 Y93.162 E.01474
G2 X135.723 Y94.405 I1.722 J-.332 E.10428
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X135.778 Y94.429 E.00391
G2 X137.106 Y94.583 I1.197 J-4.518 E.08757
G2 X140.046 Y94.553 I1.138 J-32.466 E.19191
G1 X140.198 Y94.535 E.00996
G2 X141.088 Y94.138 I-.116 J-1.459 E.06482
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X141.31 Y93.906 I-1.353 J-1.515 E.01997
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X141.304 Y93.883 E.0014
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X141.27 Y93.776 E.00609
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X141.236 Y93.669 E.00554
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X141.203 Y93.562 E.00498
G1 X141.428 Y93.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
G1 X141.552 Y93.162 E.0048
G1 X141.705 Y93.238 E.00653
G1 X141.659 Y92.884 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
G2 X141.689 Y90.75 I-84.506 J-2.275 E.1363
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X141.707 Y86.357 I-775.829 J-5.261 E.26509
; WIPE_START
G1 X141.699 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.929 Y89.714 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
G1 X138.456 Y89.723 E.00939
G1 X138.538 Y89.809 E.00211
G1 X138.383 Y89.26 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
G2 X138.352 Y86.518 I-106.425 J-.172 E.10452
G1 X137.386 Y86.522 E.0368
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X137.299 Y86.543 E.00381
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X137.211 Y86.565 E.00423
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X137.123 Y86.587 E.00466
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X137.036 Y86.608 E.00508
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X136.948 Y86.63 E.00551
G1 X137.092 Y86.697 E.00972
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X137.237 Y86.764 E.00897
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X137.381 Y86.831 E.00822
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X137.526 Y86.899 E.00747
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X137.753 Y87.042 I-.114 J.434 E.01101
G1 X137.963 Y87.43 E.01777
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X138.048 Y88.009 E.02126
G3 X138.075 Y89.255 I-203.786 J5.075 E.04528
G1 X138.323 Y89.259 E.009
G1 X138.044 Y86.818 F30000
; LINE_WIDTH: 0.362949
G1 F8490.486
G1 X137.987 Y86.851 E.0022
G1 X138.025 Y86.873 E.00145
G1 X136.465 Y86.635 F30000
; LINE_WIDTH: 0.635768
G1 F4466.768
G1 X136.888 Y86.63 E.02693
G1 X134.952 Y86.829 F30000
; LINE_WIDTH: 0.362009
G1 F8516.92
G1 X134.895 Y86.861 E.00218
G1 X134.933 Y86.883 E.00144
G1 X134.892 Y87.583 F30000
; LINE_WIDTH: 0.419499
G1 F7154.583
G1 X134.963 Y87.372 E.00883
G3 X135.572 Y86.847 I1.014 J.56 E.03267
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X135.821 Y86.818 E.00942
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X136.069 Y86.788 E.00857
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X136.135 Y86.763 E.00249
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X136.201 Y86.737 E.00286
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X136.267 Y86.711 E.00323
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X136.333 Y86.686 E.0036
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X136.399 Y86.66 E.00397
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X136.465 Y86.635 E.00434
G1 X136.398 Y86.611 E.00434
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X136.331 Y86.588 E.00397
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X136.265 Y86.564 E.0036
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X136.198 Y86.541 E.00323
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X136.131 Y86.517 E.00286
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X136.064 Y86.494 E.00254
G1 X135.534 Y86.526 E.01904
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X134.603 Y86.532 I-1.236 J-132.775 E.03701
G1 X134.6 Y87.583 E.04179
G1 X134.832 Y87.583 E.00924
; OBJECT_ID: 169
; WIPE_START
G1 X134.6 Y87.583 E-.08836
G1 X134.603 Y86.532 E-.39958
G1 X135.319 Y86.527 E-.27206
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
G1 X134.676 Y94.133 Z1.16 F30000
G1 X129.395 Y156.573 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X129.387 Y156.536 E.0016
G1 X129.22 Y156.278 E.01326
G2 X128.491 Y156.108 I-.643 J1.106 E.03276
G2 X124.023 Y156.06 I-7.769 J518.454 E.19268
G3 X124.027 Y155.214 I17.002 J-.341 E.03649
G3 X131.967 Y155.219 I3.7 J436.266 E.3424
G3 X131.918 Y156.513 I-23.469 J-.255 E.05586
G2 X127.045 Y159.958 I89.16 J131.272 E.25731
G2 X126.944 Y160.94 I.458 J.544 E.04709
G2 X127.634 Y161.54 I2.68 J-2.388 E.03953
G2 X131.941 Y164.544 I307.806 J-436.675 E.22642
G3 X131.962 Y165.864 I-21.622 J1.018 E.05692
G3 X124.025 Y165.839 I-2.224 J-554.855 E.34226
G3 X124.025 Y164.996 I24.634 J-.418 E.03634
G2 X128.65 Y164.949 I1.244 J-105.817 E.19942
G2 X129.115 Y164.798 I-.093 J-1.076 E.02129
G1 X129.284 Y164.615 E.01072
G2 X129.077 Y163.664 I-.626 J-.362 E.04604
G1 X128.892 Y163.522 E.01005
G2 X124.649 Y160.517 I-458.307 J642.503 E.22422
G2 X128.979 Y157.451 I-176.431 J-253.801 E.22876
G1 X129.235 Y157.25 E.01404
G1 X129.478 Y156.945 E.01681
G1 X129.408 Y156.631 E.01387
G1 X129.036 Y156.683 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.964 Y156.572 I-.393 J.175 E.00531
G2 X128.765 Y156.501 I-.251 J.386 E.00847
G2 X125.604 Y156.453 I-2.407 J55.548 E.12585
G3 X123.664 Y156.425 I.137 J-75.307 E.07722
G3 X123.67 Y154.85 I19.81 J-.719 E.06271
G3 X132.321 Y154.845 I4.498 J324.765 E.34435
G3 X132.283 Y156.718 I-15.49 J.624 E.07458
G2 X127.294 Y160.24 I92.34 J136.1 E.24309
G2 X127.249 Y160.721 I.216 J.263 E.02141
G2 X127.855 Y161.237 I2.404 J-2.208 E.03172
G3 X132.288 Y164.335 I-337.987 J488.436 E.21528
G3 X132.306 Y166.238 I-11.207 J1.059 E.07587
G3 X123.666 Y166.206 I-2.432 J-496.317 E.34393
G3 X123.665 Y164.622 I22.473 J-.808 E.06304
G2 X128.616 Y164.575 I1.283 J-126.428 E.19709
G2 X128.994 Y164.336 I.017 J-.392 E.01897
G2 X128.834 Y163.95 I-.359 J-.077 E.01769
G1 X128.669 Y163.824 E.00824
G3 X124.133 Y160.602 I378.383 J-537.536 E.22148
G1 X124.022 Y160.514 E.00564
G3 X124.216 Y160.364 I1.645 J1.939 E.00977
G2 X128.751 Y157.153 I-194.962 J-280.178 E.22117
G2 X129.073 Y156.852 I-.471 J-.825 E.01771
G2 X129.056 Y156.74 I-.43 J.007 E.00452
M204 S10000
G1 X129.543 Y157.6 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
G1 X126.697 Y159.642 E.19558
G1 X126.338 Y159.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X125.298 Y160.518 E.05064
G1 X126.321 Y161.245 E.04995
G3 X126.373 Y160.937 I.445 J-.083 E.0127
G1 X126.497 Y160.88 E.00543
G1 X126.413 Y160.44 E.01782
G1 X126.474 Y160.13 E.01259
G1 X126.522 Y160.038 E.0041
G1 X126.373 Y159.833 E.01008
G1 X126.033 Y160.47 F30000
; LINE_WIDTH: 0.516989
G1 F5627.99
G2 X126.03 Y160.569 I-.029 J.049 E.01182
G1 X126.953 Y161.243 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
G1 X126.959 Y161.549 E.01472
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X126.96 Y161.573 E.00121
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X126.96 Y161.596 E.0013
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X129.159 Y163.154 I48.405 J-65.991 E.15136
G1 X129.466 Y163.381 E.02148
G1 X129.824 Y163.527 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X129.642 Y163.774 E.0122
G1 X129.725 Y163.946 E.00761
G1 X129.761 Y164.301 E.01418
G3 X129.583 Y164.844 I-1.186 J-.087 E.02299
G1 X129.301 Y165.124 E.01581
G1 X129.192 Y165.178 E.00484
G1 X129.199 Y165.488 E.01234
G1 X131.581 Y165.489 E.09484
G1 X131.569 Y164.742 E.02972
G1 X129.873 Y163.561 E.08223
G1 X130.115 Y164.168 F30000
G1 F7144.644
G1 X130.077 Y164.586 E.01672
G1 X129.949 Y164.929 E.01455
G1 X129.81 Y165.128 E.00969
G1 X131.215 Y165.129 E.05594
G1 X131.212 Y164.932 E.00782
G1 X130.164 Y164.202 E.05084
G1 X130.406 Y164.744 F30000
; LINE_WIDTH: 0.396188
G1 F7650.785
G1 X130.343 Y164.781 E.0027
G1 X130.391 Y164.808 E.00204
G1 X128.822 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
G1 X127.828 Y165.42 E.05398
G3 X125.55 Y165.423 I-1.464 J-199.159 E.12384
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X124.219 Y165.419 E.06879
; WIPE_START
G1 X125.55 Y165.423 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.521 Y157.861 Z1.16 F30000
G1 X124.218 Y155.637 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.53292
G1 F5438.362
G1 X124.676 Y155.639 E.02393
; LINE_WIDTH: 0.556741
G1 F5177.519
G3 X127.395 Y155.641 I.71 J628.686 E.14935
G1 X128.9 Y155.669 E.08269
G1 X129.278 Y155.582 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X129.268 Y155.886 E.01214
G1 X129.505 Y156.028 E.01098
G1 X129.746 Y156.421 E.01836
G1 X129.864 Y156.955 E.02176
G3 X129.733 Y157.227 I-.407 J-.029 E.01229
G1 X129.903 Y157.458 E.01142
G1 X131.55 Y156.312 E.07986
G1 X131.578 Y155.592 E.02868
G1 X129.338 Y155.582 E.08915
G1 X130.012 Y156.017 F30000
; LINE_WIDTH: 0.563819
G1 F5104.776
G3 X130.248 Y156.692 I-1.228 J.808 E.04024
G1 X131.127 Y156.08 E.05966
G1 X131.129 Y156.022 E.00326
G1 X130.072 Y156.017 E.05891
; WIPE_START
G1 X131.129 Y156.022 E-.40183
G1 X131.127 Y156.08 E-.02226
G1 X130.401 Y156.585 E-.33591
; WIPE_END
G1 E-.04 F1800
G1 X124.923 Y151.39 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X124.924 Y151.461 E.00307
G1 X125.608 Y152.145 E.04174
G1 X131.96 Y152.211 E.27389
G3 X131.957 Y153.017 I-15.111 J.356 E.03479
G3 X126.029 Y153.019 I-3.021 J-188.976 E.25565
G3 X124.98 Y152.692 I.021 J-1.911 E.04807
G3 X124.105 Y151.609 I.736 J-1.489 E.0619
G3 X124.023 Y149.503 I14.647 J-1.627 E.09097
G3 X124.067 Y144.709 I129.901 J-1.208 E.20675
G3 X124.167 Y144.309 I.948 J.024 E.01789
G3 X125.519 Y143.15 I1.812 J.746 E.07971
G3 X126.548 Y143.036 I.879 J3.22 E.04483
G3 X130.616 Y143.025 I2.767 J273.526 E.1754
G3 X131.912 Y143.047 I-.213 J50.424 E.05593
G3 X131.921 Y143.923 I-18.081 J.618 E.03778
G3 X125.543 Y143.947 I-4.327 J-306.234 E.27502
G1 X124.879 Y144.712 E.04369
G1 X124.923 Y151.33 E.28536
G1 X125.298 Y151.305 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.765 Y151.772 E.02631
G1 X132.329 Y151.839 E.26126
G3 X132.308 Y153.39 I-13.43 J.6 E.06176
G3 X126.01 Y153.393 I-3.256 J-197.89 E.25069
G3 X124.791 Y153.016 I.043 J-2.297 E.05148
G3 X123.737 Y151.679 I.921 J-1.811 E.06995
G3 X123.648 Y149.504 I14.829 J-1.692 E.08669
G3 X123.693 Y144.684 I129.331 J-1.213 E.19186
G3 X123.891 Y144.011 I1.506 J.077 E.02821
G3 X125.572 Y142.746 I2.141 J1.097 E.08667
G3 X126.985 Y142.653 I1.194 J7.322 E.05642
G3 X130.619 Y142.65 I2.029 J286.473 E.14466
G3 X132.274 Y142.688 I-.008 J36.677 E.06587
G3 X132.277 Y144.284 I-14.086 J.828 E.06357
G3 X125.714 Y144.322 I-4.545 J-220.55 E.26122
G1 X125.255 Y144.851 E.02789
G1 X125.297 Y151.245 E.25449
M204 S10000
G1 X124.498 Y151.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.504165
G1 F5790.505
G2 X124.621 Y151.767 I.598 J.044 E.0215
; LINE_WIDTH: 0.557514
G1 F5169.477
G2 X124.758 Y151.937 I1.928 J-1.411 E.01202
; LINE_WIDTH: 0.575695
G1 F4987.195
G2 X125.03 Y152.195 I2.828 J-2.708 E.02137
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X125.194 Y152.328 E.01112
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X125.31 Y152.415 E.00697
; LINE_WIDTH: 0.446493
G1 F6654.752
G2 X125.592 Y152.545 I.428 J-.561 E.01337
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X125.727 Y152.569 E.00655
; LINE_WIDTH: 0.541749
G1 F5338.669
G2 X128.269 Y152.605 I1.926 J-46.083 E.13543
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X130.018 Y152.609 E.08944
; LINE_WIDTH: 0.49629
G1 F5895.049
G1 X131.768 Y152.613 E.08438
; WIPE_START
G1 X130.018 Y152.609 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.498 Y151.357 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.549563
G1 F5253.444
G3 X124.459 Y146.928 I159.616 J-3.635 E.23978
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X124.467 Y145.031 I145.437 J-.361 E.09703
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X124.473 Y144.735 E.01391
G3 X124.526 Y144.502 I.409 J-.03 E.01135
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X124.612 Y144.367 I2.594 J1.55 E.0079
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X124.673 Y144.277 E.00576
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X124.902 Y143.994 I2.914 J2.127 E.0206
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X125.101 Y143.803 I2.171 J2.05 E.01516
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X125.181 Y143.735 E.00523
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X125.738 Y143.294 E.03254
G1 X125.315 Y143.631 F30000
; LINE_WIDTH: 0.423704
G1 F7071.826
G3 X125.518 Y143.559 I.257 J.401 E.00872
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X125.636 Y143.54 E.00539
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X125.763 Y143.523 E.00625
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X125.976 Y143.506 I.331 J2.833 E.01127
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X129.637 Y143.484 I2.426 J98.82 E.21499
G3 X130.61 Y143.484 I.47 J142.627 E.05713
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X131.475 Y143.486 I.581 J-74.02 E.04883
G1 X131.727 Y143.728 E.01976
; WIPE_START
G1 X131.475 Y143.486 E-.21894
G1 X130.61 Y143.484 E-.54106
; WIPE_END
G1 E-.04 F1800
G1 X127.49 Y136.519 Z1.16 F30000
G1 X125.547 Y132.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X125.441 Y132.247 E.00536
G2 X125.01 Y132.929 I.517 J.803 E.03591
G2 X124.911 Y134.566 I9.465 J1.398 E.0708
G1 X124.89 Y140.434 E.25305
G1 X124.053 Y140.418 E.0361
G3 X124.039 Y133.44 I507.954 J-4.501 E.30088
M73 P79 R2
G3 X124.127 Y132.56 I3.431 J-.102 E.03826
G3 X124.973 Y131.527 I1.642 J.481 E.05916
G3 X126.325 Y131.24 I1.133 J2.012 E.06054
G3 X127.283 Y131.408 I.122 J2.124 E.0423
G3 X128.299 Y132.428 I-1.042 J2.054 E.06314
G3 X128.436 Y133.892 I-6.916 J1.387 E.0635
G3 X128.471 Y139.477 I-197.192 J4.024 E.24085
G2 X129.019 Y139.84 I3.362 J-4.476 E.02837
G2 X130.809 Y139.578 I.696 J-1.49 E.0826
G1 X130.989 Y139.323 E.01342
G2 X131.048 Y136.024 I-88.433 J-3.229 E.14232
G3 X131.079 Y131.585 I184.331 J-.91 E.19141
G3 X131.92 Y131.582 I.474 J14.099 E.03628
G3 X131.884 Y139.343 I-166.444 J3.094 E.33472
G3 X131.16 Y140.425 I-1.747 J-.386 E.05745
G3 X129.655 Y140.852 I-1.328 J-1.817 E.06889
G3 X127.69 Y139.703 I-.039 J-2.188 E.10323
G3 X127.572 Y138.272 I6.552 J-1.26 E.06201
G2 X127.521 Y133.415 I-1247.715 J10.507 E.20947
G2 X127.38 Y132.628 I-1.994 J-.048 E.03472
G2 X126.402 Y132.108 I-.951 J.611 E.0499
G2 X125.776 Y132.112 I-.274 J6.121 E.02701
G2 X125.604 Y132.163 I.182 J.938 E.00775
G1 X125.717 Y132.524 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.377 Y133.011 I.239 J.529 E.02483
G2 X125.286 Y134.569 I9.204 J1.319 E.0622
G1 X125.264 Y140.817 E.24867
G1 X123.68 Y140.786 E.06304
G3 X123.664 Y133.431 I527.43 J-4.797 E.29273
G3 X123.771 Y132.442 I3.73 J-.097 E.03973
G3 X124.779 Y131.206 I1.987 J.591 E.06514
G3 X126.336 Y130.865 I1.324 J2.325 E.06444
G3 X127.214 Y130.971 I.008 J3.618 E.03527
G3 X128.658 Y132.317 I-.877 J2.389 E.0807
G3 X128.811 Y133.881 I-7.11 J1.487 E.06265
G3 X128.846 Y139.277 I-191.103 J3.92 E.2148
G2 X130.426 Y139.415 I.884 J-1.002 E.06761
G2 X130.62 Y139.195 I-.356 J-.51 E.01178
G2 X130.686 Y132.334 I-267.548 J-6.006 E.27311
G3 X130.722 Y131.241 I19.227 J.088 E.04356
G3 X132.284 Y131.246 I.757 J7.182 E.06227
G3 X132.255 Y139.4 I-153.029 J3.539 E.32462
G3 X131.391 Y140.72 I-2.121 J-.445 E.06426
G3 X129.652 Y141.227 I-1.56 J-2.118 E.07361
G3 X129.133 Y141.177 I.206 J-4.837 E.02077
G3 X127.355 Y139.881 I.529 J-2.593 E.09029
G3 X127.212 Y138.805 I3.266 J-.982 E.04339
G3 X127.16 Y133.95 I171.334 J-4.265 E.19327
G2 X127.085 Y132.909 I-5.726 J-.113 E.04158
G2 X126.517 Y132.496 I-.586 J.209 E.02972
G2 X125.84 Y132.484 I-.428 J4.936 E.02698
G2 X125.773 Y132.502 I.116 J.568 E.00277
M204 S10000
G1 X125.858 Y131.679 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
G1 X125.727 Y131.691 E.00674
G2 X124.942 Y132.088 I.236 J1.441 E.04588
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X124.693 Y132.415 I.788 J.861 E.02391
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X124.489 Y133.503 I2.438 J1.02 E.06665
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X124.483 Y133.694 E.01035
G2 X124.469 Y136.645 I107.849 J1.982 E.15975
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X124.471 Y140.231 E.18433
; WIPE_START
G1 X124.47 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.858 Y131.679 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
G3 X126.313 Y131.673 I.269 J3.422 E.0244
G3 X127.652 Y132.246 I.109 J1.597 E.08098
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X127.839 Y132.529 I-.781 J.717 E.01943
G1 X127.915 Y132.822 E.01728
G1 X127.961 Y133.269 E.02565
G3 X128.028 Y138.771 I-234.918 J5.615 E.31394
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X128.05 Y139.358 I14.528 J-.241 E.03091
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X128.064 Y139.526 E.00817
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X128.268 Y139.826 I.384 J-.042 E.01655
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X128.376 Y139.917 E.00673
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X128.471 Y139.993 E.00615
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X129.45 Y140.409 I1.157 J-1.365 E.05926
G1 X129.577 Y140.419 E.00699
G2 X131.085 Y139.913 I.211 J-1.871 E.09008
G2 X131.44 Y139.275 I-.682 J-.796 E.04086
G2 X131.498 Y131.774 I-226.04 J-5.516 E.41155
; WIPE_START
G1 X131.495 Y133.774 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.1 Y126.151 Z1.16 F30000
G1 X130.962 Y123.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X130.975 Y123.461 E.00163
G2 X131.011 Y123.306 I-.681 J-.24 E.00684
G2 X131.066 Y119.881 I-222.109 J-5.29 E.14772
G3 X131.884 Y119.869 I.6 J13.182 E.03528
G3 X131.915 Y129.069 I-363.455 J5.817 E.39669
G3 X131.066 Y129.072 I-.472 J-12.005 E.03662
G3 X131.045 Y126.657 I63.038 J-1.745 E.10415
G2 X130.998 Y125.608 I-9.038 J-.122 E.04529
G2 X130.706 Y125.073 I-.84 J.112 E.0269
G1 X130.451 Y124.974 E.01179
G2 X126.488 Y124.921 I-3.603 J120.385 E.1709
G3 X124.025 Y124.878 I.952 J-126.704 E.10622
G3 X124.027 Y124.026 I20.983 J-.383 E.03675
G3 X128.58 Y124 I3.393 J200.086 E.19633
G2 X130.428 Y123.93 I.362 J-14.833 E.07982
G2 X130.904 Y123.607 I-.134 J-.71 E.02548
G1 X130.934 Y123.549 E.00283
G1 X130.619 Y123.341 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.638 Y123.258 I-.322 J-.117 E.00341
G2 X130.699 Y119.684 I-431.298 J-9.119 E.14229
G3 X130.713 Y119.534 I1.876 J.096 E.006
G3 X131.817 Y119.494 I.875 J9.004 E.04401
G3 X132.238 Y119.512 I-.103 J7.252 E.0168
G3 X132.297 Y122.743 I-82.114 J3.097 E.12861
G3 X132.282 Y129.413 I-272.898 J2.734 E.26549
G3 X130.716 Y129.418 I-.807 J-8.179 E.06241
G3 X130.681 Y128.663 I7.988 J-.754 E.0301
G2 X130.648 Y125.88 I-55.971 J-.737 E.11079
G2 X130.567 Y125.477 I-.984 J-.01 E.01647
G2 X130.373 Y125.346 I-.229 J.129 E.00967
G2 X126.485 Y125.296 I-3.608 J128.888 E.15475
G3 X123.673 Y125.239 I1.127 J-126.045 E.11194
G3 X123.67 Y123.659 I13.82 J-.815 E.06292
G3 X128.577 Y123.626 I4.025 J230.856 E.1953
G2 X130.344 Y123.563 I.351 J-15.171 E.07042
G2 X130.594 Y123.396 I-.047 J-.339 E.01239
M204 S10000
G1 X131.465 Y123.407 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
G1 X131.479 Y121.223 E.11833
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X131.475 Y120.287 I106.745 J-.909 E.04763
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X131.69 Y120.064 E.01472
; WIPE_START
G1 X131.475 Y120.287 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.856 Y124.086 Z1.16 F30000
G1 X124.218 Y124.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
G1 X125.204 Y124.457 E.0536
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X128.582 Y124.468 I5.158 J-1097.004 E.19695
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X129.99 Y124.467 E.08739
G1 X130.366 Y124.595 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X130.557 Y124.613 E.00763
G1 X130.952 Y124.787 E.0172
G1 X131.212 Y125.085 E.01574
G1 X131.255 Y125.179 E.00411
G1 X131.556 Y125.165 E.01201
G1 X131.549 Y123.784 E.05497
G1 X131.226 Y123.777 E.01286
G1 X131.053 Y124.018 E.01181
G1 X130.769 Y124.214 E.01374
G1 X130.364 Y124.305 E.0165
G1 X130.366 Y124.535 E.00914
G1 X131.183 Y124.392 F30000
; LINE_WIDTH: 0.494249
G1 F5922.767
G2 X131.177 Y124.486 I-.027 J.046 E.01042
G1 X131.464 Y125.545 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
G1 X131.489 Y126.653 E.06081
G3 X131.488 Y128.645 I-365.053 J.826 E.10932
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X131.256 Y128.878 E.01704
; WIPE_START
G1 X131.488 Y128.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.22 Y121.017 Z1.16 F30000
G1 X130.803 Y109.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X130.774 Y109.142 E.0017
G2 X129.894 Y108.766 I-.846 J.763 E.04259
G2 X129.451 Y108.756 I-.354 J5.881 E.01909
G1 X127.89 Y108.799 E.06735
G1 X127.851 Y113.744 E.21325
G3 X127.834 Y114.394 I-21.223 J-.218 E.02804
G3 X126.94 Y114.368 I-.174 J-9.389 E.0386
G3 X126.961 Y110.743 I550.038 J1.427 E.1563
G2 X126.93 Y109.6 I-16.18 J-.133 E.04932
G1 X126.751 Y108.796 E.03551
G3 X124.032 Y108.716 I4.245 J-190.923 E.1173
G3 X124.043 Y107.911 I31.488 J.033 E.0347
G3 X129.3 Y107.898 I3.3 J266.573 E.22668
G3 X130.61 Y108.012 I.138 J6.018 E.0568
G3 X131.92 Y109.758 I-.523 J1.757 E.10084
G3 X131.921 Y115.925 I-98.644 J3.107 E.26596
G3 X131.662 Y116.897 I-1.778 J.045 E.04398
G3 X130.299 Y117.795 I-1.954 J-1.484 E.07171
G3 X127.263 Y117.83 I-2.057 J-46.276 E.13096
G1 X124.044 Y117.811 E.13883
G1 X124.027 Y116.978 E.0359
G2 X129.855 Y116.917 I.836 J-198.271 E.25131
G2 X130.621 Y116.708 I.032 J-1.391 E.03475
G2 X131.007 Y115.983 I-.603 J-.785 E.03649
G2 X131.048 Y114.29 I-25.853 J-1.485 E.07303
G2 X131.017 Y109.865 I-100.14 J-1.505 E.19086
G2 X130.9 Y109.311 I-1.678 J.065 E.0245
G1 X130.837 Y109.217 E.00488
G1 X130.498 Y109.385 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.87 Y109.14 I-.646 J.728 E.02742
G2 X129.455 Y109.131 I-.331 J5.508 E.0165
G1 X128.262 Y109.163 E.04753
G3 X128.219 Y114.108 I-229.37 J.496 E.1968
G3 X128.185 Y114.734 I-5.826 J-.003 E.02497
G3 X126.578 Y114.7 I-.661 J-6.741 E.06413
G3 X126.586 Y110.744 I103.805 J-1.757 E.15745
G2 X126.558 Y109.654 I-16.082 J-.129 E.04342
G1 X126.449 Y109.162 E.02004
G3 X123.656 Y109.078 I4.91 J-208.862 E.1112
G3 X123.676 Y107.539 I61.525 J.021 E.06127
G3 X129.308 Y107.523 I3.594 J283.119 E.22418
G3 X130.718 Y107.652 I.137 J6.257 E.05646
G3 X132.295 Y109.74 I-.632 J2.116 E.11145
G3 X132.296 Y115.95 I-98.872 J3.123 E.24719
G3 X131.882 Y117.226 I-2.069 J.036 E.05439
G3 X130.447 Y118.156 I-2.247 J-1.894 E.06908
G3 X127.262 Y118.205 I-2.222 J-41.407 E.12681
G1 X123.676 Y118.183 E.14274
G1 X123.645 Y116.606 E.06281
G2 X129.63 Y116.553 I.854 J-243.189 E.23825
G2 X130.31 Y116.458 I.063 J-2.02 E.02743
G2 X130.634 Y115.936 I-.284 J-.539 E.02564
G2 X130.674 Y114.29 I-26.154 J-1.445 E.06556
G2 X130.643 Y109.895 I-101.673 J-1.5 E.17495
G2 X130.528 Y109.437 I-.993 J.007 E.01897
M204 S10000
G1 X130.901 Y108.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
G3 X131.469 Y109.834 I-.814 J1.119 E.07914
G1 X131.48 Y110.059 E.01304
G3 X131.469 Y115.896 I-101.795 J2.736 E.33775
G1 X131.455 Y116.049 E.00892
G3 X131.045 Y116.925 I-1.234 J-.044 E.05754
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X131.034 Y116.936 E.0008
G3 X129.815 Y117.368 I-1.121 J-1.228 E.07343
G1 X129.658 Y117.373 E.00866
G3 X128.22 Y117.391 I-1.518 J-65.058 E.07948
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X124.231 Y117.394 I-2.619 J-719.618 E.20729
; WIPE_START
G1 X126.231 Y117.393 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.389 Y114.195 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
G3 X127.415 Y111.299 I489.208 J2.962 E.16843
G1 X127.412 Y109.593 E.09925
G1 X127.275 Y108.327 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
G1 X127.275 Y108.828 E.02568
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X127.275 Y108.898 E.00383
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X127.274 Y108.969 E.00416
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X127.291 Y109.001 E.0023
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X127.308 Y109.033 E.00244
G1 X127.698 Y108.347 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
G3 X129.291 Y108.329 I2.295 J129.717 E.08775
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X129.691 Y108.334 E.02083
G3 X130.783 Y108.575 I.116 J2.068 E.05909
G1 X130.901 Y108.651 E.00731
G1 X126.851 Y108.346 F30000
; LINE_WIDTH: 0.546922
G1 F5281.948
G1 X125.541 Y108.331 E.07052
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X124.232 Y108.317 E.06504
; WIPE_START
G1 X125.541 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.39 Y100.7 Z1.16 F30000
G1 X125.342 Y98.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X126.336 Y99.322 E.06264
G2 X129.271 Y101.992 I52.429 J-54.693 E.1711
G3 X131.962 Y104.413 I-170.214 J191.92 E.15609
G3 X131.942 Y105.734 I-104.989 J-.94 E.05695
G3 X123.972 Y105.743 I-4.756 J-646.551 E.34367
G3 X123.981 Y104.813 I13.358 J-.337 E.04012
G3 X128.03 Y104.792 I3.029 J194.358 E.17461
G2 X129.463 Y104.71 I.248 J-8.212 E.06197
G1 X129.605 Y104.658 E.00651
G1 X130.287 Y104.197 E.03549
G2 X129.044 Y102.944 I-9.327 J8.008 E.07615
G3 X123.972 Y98.397 I385.239 J-434.778 E.29376
G3 X123.978 Y97.133 I23.066 J-.519 E.05451
G3 X130.695 Y97.095 I5.121 J317.268 E.28964
G3 X132.003 Y97.119 I-.016 J37.102 E.05644
G3 X132.024 Y98.1 I-9.397 J.683 E.04233
G2 X127.028 Y98.148 I13.314 J1658.362 E.21541
G2 X125.402 Y98.257 I1.096 J28.375 E.07031
G1 X126.153 Y98.58 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.523 Y100.831 I23.246 J-22.101 E.13013
G3 X132.339 Y104.25 I-232.379 J263.166 E.20396
G3 X132.31 Y106.107 I-148.094 J-1.41 E.0739
G3 X123.613 Y106.109 I-4.459 J-502.798 E.34615
G3 X123.626 Y104.448 I22.096 J-.653 E.06613
G3 X128.748 Y104.406 I4.506 J238.501 E.20388
G2 X129.433 Y104.322 I.032 J-2.561 E.02752
G1 X129.717 Y104.13 E.01365
G2 X128.792 Y103.222 I-7.317 J6.529 E.0516
G3 X123.597 Y98.557 I302.231 J-341.854 E.27792
G3 X123.626 Y96.772 I17.451 J-.606 E.07112
G3 X130.696 Y96.72 I5.189 J228.924 E.28143
G3 X132.339 Y96.766 I.34 J17.451 E.06541
G3 X132.365 Y98.445 I-7.415 J.958 E.06698
G3 X131.185 Y98.489 I-.874 J-7.447 E.04705
G2 X126.819 Y98.532 I-.667 J156.379 E.17381
G1 X126.213 Y98.576 E.02417
M204 S10000
G1 X125.658 Y99.286 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
G1 X126.01 Y99.634 E.02902
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X129.332 Y102.624 I116.807 J-126.382 E.235
G1 X129.84 Y103.087 E.03614
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X130.402 Y103.631 I-12.025 J12.963 E.04351
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X130.757 Y103.983 E.03023
G1 X129.479 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X131.573 Y105.36 E.08334
G1 X131.585 Y104.578 E.03115
G1 X131.113 Y104.155 E.0252
G1 X130.672 Y104.601 E.02496
G1 X130.501 Y104.649 E.00707
G1 X130.364 Y104.597 E.00585
G1 X129.789 Y104.986 E.02761
G1 X129.471 Y105.078 E.01318
G1 X129.477 Y105.31 E.00924
G1 X130.414 Y105.002 F30000
; LINE_WIDTH: 0.423508
G1 F7075.639
G1 X130.58 Y105.004 E.00667
G1 X130.64 Y105.005 F30000
; LINE_WIDTH: 0.406861
G1 F7415.318
G1 X130.942 Y105.016 E.01157
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X131.243 Y105.027 E.01046
G1 X131.247 Y104.778 E.00866
G2 X131.127 Y104.617 I-.236 J.051 E.00716
G1 X130.912 Y104.838 E.01069
; LINE_WIDTH: 0.396754
G1 F7637.945
G1 X130.691 Y104.974 E.00965
G1 X129.101 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
G1 X128.032 Y105.272 E.06721
G2 X125.543 Y105.274 I-.801 J441.112 E.15642
G2 X124.169 Y105.278 I-.353 J138.553 E.08636
; WIPE_START
G1 X125.543 Y105.274 E-.52215
G1 X126.169 Y105.274 E-.23785
; WIPE_END
G1 E-.04 F1800
G1 X125.658 Y99.286 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
G1 X125.308 Y98.946 E.03013
M73 P80 R2
G1 X124.946 Y98.809 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
G1 F7939.26
G1 X125.161 Y98.588 E.01102
G1 X124.797 Y98.211 E.01878
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X124.731 Y98.096 E.00519
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X124.749 Y98.014 E.00366
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X124.768 Y97.931 E.00394
G1 X124.905 Y97.902 E.00657
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X126.664 Y97.805 E.07157
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X127.019 Y97.787 E.01256
G3 X131.675 Y97.757 I9.125 J1054.978 E.1648
G1 X131.669 Y97.459 E.01055
G1 X130.693 Y97.447 E.03456
G2 X126.65 Y97.462 I1.138 J844.588 E.14307
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X124.889 Y97.511 E.07157
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X124.642 Y97.528 E.0111
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X124.395 Y97.546 E.01145
G1 X124.356 Y98.094 E.02542
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X124.356 Y98.229 E.00563
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X124.594 Y98.467 E.01347
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X124.902 Y98.769 I3.692 J-3.462 E.01577
; WIPE_START
G1 X124.594 Y98.467 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.975 Y90.844 Z1.16 F30000
G1 X125.146 Y87.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X125.07 Y87.562 E.00655
G2 X124.965 Y87.97 I.791 J.421 E.01834
G2 X125.005 Y92.812 I71.105 J1.831 E.20885
G2 X125.523 Y93.865 I1.238 J.045 E.05271
G2 X126.321 Y94.068 I.893 J-1.84 E.03575
G2 X129.676 Y94.081 I1.819 J-34.674 E.14471
G2 X130.733 Y93.59 I-.008 J-1.4 E.05186
G2 X130.918 Y93.068 I-.909 J-.616 E.02412
G2 X130.985 Y90.744 I-28.998 J-2.002 E.10031
G1 X131.028 Y86.162 E.19755
G1 X131.933 Y86.162 E.03901
G3 X131.912 Y93.394 I-238.073 J2.92 E.31183
G3 X130.65 Y94.875 I-2.547 J-.892 E.08585
G3 X129.653 Y95.052 I-1.055 J-3.041 E.04386
G3 X125.884 Y95.016 I-1.571 J-32.653 E.1626
G3 X124.6 Y94.304 I.229 J-1.926 E.06492
G3 X124.026 Y92.977 I1.467 J-1.422 E.06373
G3 X123.981 Y90.293 I34.1 J-1.918 E.11578
G1 X124.003 Y86.158 E.17832
G3 X128.369 Y86.143 I3.039 J242.645 E.18826
G1 X128.489 Y86.147 E.0052
G3 X128.5 Y90.01 I-88.309 J2.168 E.16658
G3 X127.511 Y89.976 I.262 J-22.511 E.04263
G2 X127.449 Y87.879 I-33.386 J-.057 E.09047
G2 X127.232 Y87.282 I-1.237 J.112 E.02774
G2 X126.208 Y87.097 I-.831 J1.669 E.04546
G2 X125.309 Y87.276 I-.084 J1.921 E.03992
G2 X125.189 Y87.389 I.552 J.706 E.00711
G1 X125.459 Y87.651 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.339 Y88.001 I.404 J.334 E.01507
G2 X125.379 Y92.784 I71.116 J1.79 E.19038
G2 X125.639 Y93.482 I.957 J.042 E.03045
G2 X126.35 Y93.694 I.674 J-.96 E.03005
G2 X129.639 Y93.708 I1.794 J-34.451 E.13098
G2 X130.431 Y93.363 I-.013 J-1.112 E.03532
G2 X130.546 Y93.021 I-.582 J-.384 E.01454
G2 X130.61 Y90.739 I-28.895 J-1.961 E.09087
G1 X130.657 Y85.787 E.1971
G1 X132.307 Y85.787 E.06566
G3 X132.281 Y93.468 I-239.153 J3.044 E.30571
G3 X130.861 Y95.192 I-2.955 J-.987 E.09092
G3 X129.674 Y95.427 I-1.185 J-2.874 E.04847
G3 X125.837 Y95.388 I-1.59 J-32.963 E.15282
G3 X124.322 Y94.555 I.265 J-2.278 E.07058
G3 X123.652 Y93.01 I1.744 J-1.673 E.06846
G3 X123.606 Y90.293 I34.395 J-1.95 E.1082
G1 X123.63 Y85.786 E.1794
G3 X128.376 Y85.768 I3.368 J260.389 E.18891
G3 X128.84 Y85.808 I.022 J2.477 E.01858
G3 X128.892 Y89.22 I-42.344 J2.346 E.13589
G3 X128.839 Y90.383 I-10.19 J.116 E.04636
G3 X127.142 Y90.336 I-.076 J-28.108 E.06757
G2 X127.076 Y87.921 I-38.033 J-.176 E.09618
G2 X126.966 Y87.573 I-.766 J.052 E.01468
G2 X126.219 Y87.471 I-.566 J1.36 E.03033
G2 X125.517 Y87.592 I-.087 J1.603 E.0286
G2 X125.5 Y87.607 I.346 J.394 E.00091
; WIPE_START
M204 S10000
G1 X125.401 Y87.726 E-.05886
G1 X125.367 Y87.819 E-.03768
G1 X125.339 Y88.001 E-.07005
G1 X125.318 Y88.687 E-.26076
G1 X125.32 Y89.556 E-.33017
G1 X125.32 Y89.563 E-.00247
; WIPE_END
G1 E-.04 F1800
G1 X124.471 Y87.958 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
G1 X124.465 Y89.563 E.10313
G2 X124.52 Y92.934 I54.656 J.795 E.21673
G1 X124.546 Y93.162 E.01474
G2 X125.497 Y94.405 I1.722 J-.332 E.10428
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X125.551 Y94.429 E.00391
G2 X126.88 Y94.583 I1.197 J-4.518 E.08757
G2 X129.82 Y94.553 I1.138 J-32.466 E.19191
G1 X129.972 Y94.535 E.00996
G2 X130.862 Y94.138 I-.116 J-1.459 E.06482
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X131.084 Y93.906 I-1.353 J-1.515 E.01997
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X131.078 Y93.883 E.0014
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X131.044 Y93.776 E.00609
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X131.01 Y93.669 E.00554
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X130.976 Y93.562 E.00498
G1 X131.202 Y93.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
G1 X131.326 Y93.162 E.0048
G1 X131.478 Y93.238 E.00653
G1 X131.432 Y92.884 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
G2 X131.463 Y90.75 I-84.506 J-2.275 E.1363
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X131.48 Y86.357 I-775.829 J-5.261 E.26509
; WIPE_START
G1 X131.472 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.703 Y89.714 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
G1 X128.23 Y89.723 E.00939
G1 X128.312 Y89.809 E.00211
G1 X128.156 Y89.26 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
G2 X128.125 Y86.518 I-106.425 J-.172 E.10452
G1 X127.16 Y86.522 E.0368
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X127.072 Y86.543 E.00381
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X126.984 Y86.565 E.00423
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X126.897 Y86.587 E.00466
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X126.809 Y86.608 E.00508
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X126.721 Y86.63 E.00551
G1 X126.866 Y86.697 E.00972
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X127.01 Y86.764 E.00897
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X127.155 Y86.831 E.00822
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X127.299 Y86.899 E.00747
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X127.527 Y87.042 I-.114 J.434 E.01101
G1 X127.736 Y87.43 E.01777
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X127.822 Y88.009 E.02126
G3 X127.849 Y89.255 I-203.786 J5.075 E.04528
G1 X128.096 Y89.259 E.009
G1 X127.817 Y86.818 F30000
; LINE_WIDTH: 0.362949
G1 F8490.486
G1 X127.761 Y86.851 E.0022
G1 X127.798 Y86.873 E.00145
G1 X126.238 Y86.635 F30000
; LINE_WIDTH: 0.635768
G1 F4466.768
G1 X126.661 Y86.63 E.02693
G1 X124.725 Y86.829 F30000
; LINE_WIDTH: 0.362009
G1 F8516.92
G1 X124.669 Y86.861 E.00218
G1 X124.706 Y86.883 E.00144
G1 X124.666 Y87.583 F30000
; LINE_WIDTH: 0.419499
G1 F7154.583
G1 X124.736 Y87.372 E.00883
G3 X125.346 Y86.847 I1.014 J.56 E.03267
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X125.594 Y86.818 E.00942
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X125.843 Y86.788 E.00857
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X125.909 Y86.763 E.00249
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X125.975 Y86.737 E.00286
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X126.041 Y86.711 E.00323
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X126.107 Y86.686 E.0036
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X126.172 Y86.66 E.00397
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X126.238 Y86.635 E.00434
G1 X126.172 Y86.611 E.00434
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X126.105 Y86.588 E.00397
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X126.038 Y86.564 E.0036
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X125.971 Y86.541 E.00323
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X125.905 Y86.517 E.00286
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X125.838 Y86.494 E.00254
G1 X125.308 Y86.526 E.01904
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X124.377 Y86.532 I-1.236 J-132.775 E.03701
G1 X124.373 Y87.583 E.04179
G1 X124.606 Y87.583 E.00924
; OBJECT_ID: 331
; WIPE_START
G1 X124.373 Y87.583 E-.08836
G1 X124.377 Y86.532 E-.39958
G1 X125.093 Y86.527 E-.27206
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
G1 X124.449 Y94.133 Z1.16 F30000
G1 X119.169 Y156.573 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X119.161 Y156.536 E.0016
G1 X118.994 Y156.278 E.01326
G2 X118.265 Y156.108 I-.643 J1.106 E.03276
G2 X113.796 Y156.06 I-7.769 J518.454 E.19268
G3 X113.801 Y155.214 I17.002 J-.341 E.03649
G3 X121.741 Y155.219 I3.7 J436.266 E.3424
G3 X121.691 Y156.513 I-23.469 J-.255 E.05586
G2 X116.819 Y159.958 I89.16 J131.272 E.25731
G2 X116.717 Y160.94 I.458 J.544 E.04709
G2 X117.407 Y161.54 I2.68 J-2.388 E.03953
G2 X121.714 Y164.544 I307.806 J-436.675 E.22642
G3 X121.736 Y165.864 I-21.622 J1.018 E.05692
G3 X113.799 Y165.839 I-2.224 J-554.855 E.34226
G3 X113.799 Y164.996 I24.634 J-.418 E.03634
G2 X118.423 Y164.949 I1.244 J-105.817 E.19942
G2 X118.889 Y164.798 I-.093 J-1.076 E.02129
G1 X119.057 Y164.615 E.01072
G2 X118.851 Y163.664 I-.626 J-.362 E.04604
G1 X118.666 Y163.522 E.01005
G2 X114.422 Y160.517 I-458.307 J642.503 E.22422
G2 X118.752 Y157.451 I-176.431 J-253.801 E.22876
G1 X119.009 Y157.25 E.01404
G1 X119.251 Y156.945 E.01681
G1 X119.182 Y156.631 E.01387
G1 X118.809 Y156.683 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.737 Y156.572 I-.393 J.175 E.00531
G2 X118.539 Y156.501 I-.251 J.386 E.00847
G2 X115.378 Y156.453 I-2.407 J55.548 E.12585
G3 X113.438 Y156.425 I.137 J-75.307 E.07722
G3 X113.443 Y154.85 I19.81 J-.719 E.06271
G3 X122.094 Y154.845 I4.498 J324.765 E.34435
G3 X122.057 Y156.718 I-15.49 J.624 E.07458
G2 X117.067 Y160.24 I92.34 J136.1 E.24309
G2 X117.023 Y160.721 I.216 J.263 E.02141
G2 X117.628 Y161.237 I2.404 J-2.208 E.03172
G3 X122.062 Y164.335 I-337.987 J488.436 E.21528
G3 X122.08 Y166.238 I-11.207 J1.059 E.07587
G3 X113.439 Y166.206 I-2.432 J-496.317 E.34393
G3 X113.438 Y164.622 I22.473 J-.808 E.06304
G2 X118.389 Y164.575 I1.283 J-126.428 E.19709
G2 X118.767 Y164.336 I.017 J-.392 E.01897
G2 X118.607 Y163.95 I-.359 J-.077 E.01769
G1 X118.443 Y163.824 E.00824
G3 X113.906 Y160.602 I378.383 J-537.536 E.22148
G1 X113.795 Y160.514 E.00564
G3 X113.99 Y160.364 I1.645 J1.939 E.00977
G2 X118.525 Y157.153 I-194.962 J-280.178 E.22117
G2 X118.846 Y156.852 I-.471 J-.825 E.01771
G2 X118.83 Y156.74 I-.43 J.007 E.00452
M204 S10000
G1 X119.316 Y157.6 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
G1 X116.471 Y159.642 E.19558
G1 X116.111 Y159.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X115.071 Y160.518 E.05064
G1 X116.094 Y161.245 E.04995
G3 X116.146 Y160.937 I.445 J-.083 E.0127
G1 X116.27 Y160.88 E.00543
G1 X116.187 Y160.44 E.01782
G1 X116.248 Y160.13 E.01259
G1 X116.295 Y160.038 E.0041
G1 X116.146 Y159.833 E.01008
G1 X115.807 Y160.47 F30000
; LINE_WIDTH: 0.516989
G1 F5627.99
G2 X115.804 Y160.569 I-.029 J.049 E.01182
G1 X116.726 Y161.243 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
G1 X116.732 Y161.549 E.01472
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X116.733 Y161.573 E.00121
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X116.734 Y161.596 E.0013
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X118.932 Y163.154 I48.405 J-65.991 E.15136
G1 X119.24 Y163.381 E.02148
G1 X119.598 Y163.527 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X119.416 Y163.774 E.0122
G1 X119.498 Y163.946 E.00761
G1 X119.534 Y164.301 E.01418
G3 X119.356 Y164.844 I-1.186 J-.087 E.02299
G1 X119.074 Y165.124 E.01581
G1 X118.965 Y165.178 E.00484
G1 X118.972 Y165.488 E.01234
G1 X121.355 Y165.489 E.09484
G1 X121.342 Y164.742 E.02972
G1 X119.647 Y163.561 E.08223
G1 X119.888 Y164.168 F30000
G1 F7144.644
G1 X119.85 Y164.586 E.01672
G1 X119.723 Y164.929 E.01455
G1 X119.584 Y165.128 E.00969
G1 X120.989 Y165.129 E.05594
G1 X120.986 Y164.932 E.00782
G1 X119.937 Y164.202 E.05084
G1 X120.18 Y164.744 F30000
; LINE_WIDTH: 0.396188
G1 F7650.785
G1 X120.117 Y164.781 E.0027
G1 X120.164 Y164.808 E.00204
G1 X118.595 Y165.403 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
G1 X117.602 Y165.42 E.05398
G3 X115.323 Y165.423 I-1.464 J-199.159 E.12384
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X113.992 Y165.419 E.06879
; WIPE_START
G1 X115.323 Y165.423 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.294 Y157.861 Z1.16 F30000
G1 X113.992 Y155.637 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.53292
G1 F5438.362
G1 X114.449 Y155.639 E.02393
; LINE_WIDTH: 0.556741
G1 F5177.519
G3 X117.168 Y155.641 I.71 J628.686 E.14935
G1 X118.674 Y155.669 E.08269
G1 X119.052 Y155.582 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X119.041 Y155.886 E.01214
G1 X119.278 Y156.028 E.01098
G1 X119.519 Y156.421 E.01836
G1 X119.637 Y156.955 E.02176
G3 X119.506 Y157.227 I-.407 J-.029 E.01229
G1 X119.677 Y157.458 E.01142
G1 X121.324 Y156.312 E.07986
G1 X121.351 Y155.592 E.02868
G1 X119.112 Y155.582 E.08915
G1 X119.785 Y156.017 F30000
; LINE_WIDTH: 0.563819
G1 F5104.776
G3 X120.021 Y156.692 I-1.228 J.808 E.04024
G1 X120.9 Y156.08 E.05966
G1 X120.903 Y156.022 E.00326
G1 X119.845 Y156.017 E.05891
; WIPE_START
G1 X120.903 Y156.022 E-.40183
G1 X120.9 Y156.08 E-.02226
G1 X120.175 Y156.585 E-.33591
; WIPE_END
G1 E-.04 F1800
G1 X114.697 Y151.39 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X114.698 Y151.461 E.00307
G1 X115.382 Y152.145 E.04174
G1 X121.733 Y152.211 E.27389
G3 X121.731 Y153.017 I-15.111 J.356 E.03479
G3 X115.802 Y153.019 I-3.021 J-188.976 E.25565
G3 X114.753 Y152.692 I.021 J-1.911 E.04807
G3 X113.879 Y151.609 I.736 J-1.489 E.0619
G3 X113.797 Y149.503 I14.647 J-1.627 E.09097
G3 X113.841 Y144.709 I129.901 J-1.208 E.20675
G3 X113.94 Y144.309 I.948 J.024 E.01789
G3 X115.292 Y143.15 I1.812 J.746 E.07971
G3 X116.322 Y143.036 I.879 J3.22 E.04483
G3 X120.389 Y143.025 I2.767 J273.526 E.1754
G3 X121.686 Y143.047 I-.213 J50.424 E.05593
G3 X121.695 Y143.923 I-18.081 J.618 E.03778
G3 X115.317 Y143.947 I-4.327 J-306.234 E.27502
G1 X114.653 Y144.712 E.04369
G1 X114.697 Y151.33 E.28536
G1 X115.071 Y151.305 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.539 Y151.772 E.02631
G1 X122.102 Y151.839 E.26126
G3 X122.082 Y153.39 I-13.43 J.6 E.06176
G3 X115.784 Y153.393 I-3.256 J-197.89 E.25069
G3 X114.565 Y153.016 I.043 J-2.297 E.05148
G3 X113.51 Y151.679 I.921 J-1.811 E.06995
G3 X113.422 Y149.504 I14.829 J-1.692 E.08669
G3 X113.466 Y144.684 I129.331 J-1.213 E.19186
G3 X113.664 Y144.011 I1.506 J.077 E.02821
G3 X115.346 Y142.746 I2.141 J1.097 E.08667
G3 X116.758 Y142.653 I1.194 J7.322 E.05642
G3 X120.393 Y142.65 I2.029 J286.473 E.14466
G3 X122.047 Y142.688 I-.008 J36.677 E.06587
G3 X122.051 Y144.284 I-14.086 J.828 E.06357
G3 X115.488 Y144.322 I-4.545 J-220.55 E.26122
G1 X115.029 Y144.851 E.02789
G1 X115.071 Y151.245 E.25449
M204 S10000
G1 X114.272 Y151.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549563
G1 F5253.444
G3 X114.233 Y146.928 I159.616 J-3.635 E.23978
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X114.24 Y145.031 I145.437 J-.361 E.09703
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X114.246 Y144.735 E.01391
G3 X114.299 Y144.502 I.409 J-.03 E.01135
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X114.385 Y144.367 I2.594 J1.55 E.0079
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X114.447 Y144.277 E.00576
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X114.676 Y143.994 I2.914 J2.127 E.0206
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X114.874 Y143.803 I2.171 J2.05 E.01516
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X114.954 Y143.735 E.00523
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X115.512 Y143.294 E.03254
G1 X115.089 Y143.631 F30000
; LINE_WIDTH: 0.423704
G1 F7071.826
G3 X115.291 Y143.559 I.257 J.401 E.00872
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X115.41 Y143.54 E.00539
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X115.537 Y143.523 E.00625
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X115.75 Y143.506 I.331 J2.833 E.01127
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X119.411 Y143.484 I2.426 J98.82 E.21499
G3 X120.384 Y143.484 I.47 J142.627 E.05713
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X121.248 Y143.486 I.581 J-74.02 E.04883
G1 X121.5 Y143.728 E.01976
; WIPE_START
G1 X121.248 Y143.486 E-.21894
G1 X120.384 Y143.484 E-.54106
; WIPE_END
G1 E-.04 F1800
G1 X121.344 Y151.056 Z1.16 F30000
G1 X121.541 Y152.613 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.49629
G1 F5895.049
G1 X119.792 Y152.609 E.08438
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X118.043 Y152.605 E.08944
; LINE_WIDTH: 0.541749
G1 F5338.669
G3 X115.501 Y152.569 I-.616 J-46.119 E.13543
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X115.366 Y152.545 E.00655
; LINE_WIDTH: 0.446493
G1 F6654.752
G3 X115.084 Y152.415 I.146 J-.69 E.01337
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X114.968 Y152.328 E.00697
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X114.804 Y152.195 E.01112
; LINE_WIDTH: 0.575695
G1 F4987.195
G3 X114.532 Y151.937 I2.556 J-2.966 E.02137
; LINE_WIDTH: 0.557514
G1 F5169.477
G3 X114.395 Y151.767 I1.791 J-1.581 E.01202
; LINE_WIDTH: 0.504165
G1 F5790.505
G3 X114.272 Y151.357 I.475 J-.366 E.0215
; WIPE_START
G1 X114.31 Y151.637 E-.48945
G1 X114.395 Y151.767 E-.27055
; WIPE_END
G1 E-.04 F1800
G1 X114.756 Y144.143 Z1.16 F30000
G1 X115.321 Y132.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X115.214 Y132.247 E.00536
M73 P81 R2
G2 X114.784 Y132.929 I.517 J.803 E.03591
G2 X114.684 Y134.566 I9.465 J1.398 E.0708
G1 X114.664 Y140.434 E.25305
G1 X113.827 Y140.418 E.0361
G3 X113.813 Y133.44 I507.954 J-4.501 E.30088
G3 X113.901 Y132.56 I3.431 J-.102 E.03826
G3 X114.747 Y131.527 I1.642 J.481 E.05916
G3 X116.099 Y131.24 I1.133 J2.012 E.06054
G3 X117.057 Y131.408 I.122 J2.124 E.0423
G3 X118.073 Y132.428 I-1.042 J2.054 E.06314
G3 X118.21 Y133.892 I-6.916 J1.387 E.0635
G3 X118.245 Y139.477 I-197.192 J4.024 E.24085
G2 X118.793 Y139.84 I3.362 J-4.476 E.02837
G2 X120.583 Y139.578 I.696 J-1.49 E.0826
G1 X120.762 Y139.323 E.01342
G2 X120.821 Y136.024 I-88.433 J-3.229 E.14232
G3 X120.853 Y131.585 I184.331 J-.91 E.19141
G3 X121.694 Y131.582 I.474 J14.099 E.03628
G3 X121.657 Y139.343 I-166.444 J3.094 E.33472
G3 X120.933 Y140.425 I-1.747 J-.386 E.05745
G3 X119.428 Y140.852 I-1.328 J-1.817 E.06889
G3 X117.463 Y139.703 I-.039 J-2.188 E.10323
G3 X117.345 Y138.272 I6.552 J-1.26 E.06201
G2 X117.295 Y133.415 I-1247.715 J10.507 E.20947
G2 X117.154 Y132.628 I-1.994 J-.048 E.03472
G2 X116.176 Y132.108 I-.951 J.611 E.0499
G2 X115.55 Y132.112 I-.274 J6.121 E.02701
G2 X115.377 Y132.163 I.182 J.938 E.00775
G1 X115.49 Y132.524 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.15 Y133.011 I.239 J.529 E.02483
G2 X115.059 Y134.569 I9.204 J1.319 E.0622
G1 X115.037 Y140.817 E.24867
G1 X113.454 Y140.786 E.06304
G3 X113.438 Y133.431 I527.43 J-4.797 E.29273
G3 X113.545 Y132.442 I3.73 J-.097 E.03973
G3 X114.552 Y131.206 I1.987 J.591 E.06514
G3 X116.11 Y130.865 I1.324 J2.325 E.06444
G3 X116.987 Y130.971 I.008 J3.618 E.03527
G3 X118.431 Y132.317 I-.877 J2.389 E.0807
G3 X118.585 Y133.881 I-7.11 J1.487 E.06265
G3 X118.619 Y139.277 I-191.103 J3.92 E.2148
G2 X120.2 Y139.415 I.884 J-1.002 E.06761
G2 X120.394 Y139.195 I-.356 J-.51 E.01178
G2 X120.46 Y132.334 I-267.548 J-6.006 E.27311
G3 X120.496 Y131.241 I19.227 J.088 E.04356
G3 X122.057 Y131.246 I.757 J7.182 E.06227
G3 X122.029 Y139.4 I-153.029 J3.539 E.32462
G3 X121.165 Y140.72 I-2.121 J-.445 E.06426
G3 X119.425 Y141.227 I-1.56 J-2.118 E.07361
G3 X118.906 Y141.177 I.206 J-4.837 E.02077
G3 X117.129 Y139.881 I.529 J-2.593 E.09029
G3 X116.986 Y138.805 I3.266 J-.982 E.04339
G3 X116.934 Y133.95 I171.334 J-4.265 E.19327
G2 X116.859 Y132.909 I-5.726 J-.113 E.04158
G2 X116.291 Y132.496 I-.586 J.209 E.02972
G2 X115.613 Y132.484 I-.428 J4.936 E.02698
G2 X115.546 Y132.502 I.116 J.568 E.00277
M204 S10000
G1 X115.631 Y131.679 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
G1 X115.501 Y131.691 E.00674
G2 X114.716 Y132.088 I.236 J1.441 E.04588
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X114.466 Y132.415 I.788 J.861 E.02391
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X114.262 Y133.503 I2.438 J1.02 E.06665
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X114.256 Y133.694 E.01035
G2 X114.243 Y136.645 I107.849 J1.982 E.15975
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X114.245 Y140.231 E.18433
; WIPE_START
G1 X114.244 Y138.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.631 Y131.679 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
G3 X116.087 Y131.673 I.269 J3.422 E.0244
G3 X117.426 Y132.246 I.109 J1.597 E.08098
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X117.612 Y132.529 I-.781 J.717 E.01943
G1 X117.689 Y132.822 E.01728
G1 X117.734 Y133.269 E.02565
G3 X117.801 Y138.771 I-234.918 J5.615 E.31394
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X117.823 Y139.358 I14.528 J-.241 E.03091
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X117.837 Y139.526 E.00817
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X118.042 Y139.826 I.384 J-.042 E.01655
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X118.149 Y139.917 E.00673
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X118.244 Y139.993 E.00615
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X119.224 Y140.409 I1.157 J-1.365 E.05926
G1 X119.351 Y140.419 E.00699
G2 X120.859 Y139.913 I.211 J-1.871 E.09008
G2 X121.213 Y139.275 I-.682 J-.796 E.04086
G2 X121.272 Y131.774 I-226.04 J-5.516 E.41155
; WIPE_START
G1 X121.269 Y133.774 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.874 Y126.151 Z1.16 F30000
G1 X120.736 Y123.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X120.749 Y123.461 E.00163
G2 X120.785 Y123.306 I-.681 J-.24 E.00684
G2 X120.84 Y119.881 I-222.109 J-5.29 E.14772
G3 X121.658 Y119.869 I.6 J13.182 E.03528
G3 X121.689 Y129.069 I-363.455 J5.817 E.39669
G3 X120.839 Y129.072 I-.472 J-12.005 E.03662
G3 X120.819 Y126.657 I63.038 J-1.745 E.10415
G2 X120.772 Y125.608 I-9.038 J-.122 E.04529
G2 X120.48 Y125.073 I-.84 J.112 E.0269
G1 X120.225 Y124.974 E.01179
G2 X116.262 Y124.921 I-3.603 J120.385 E.1709
G3 X113.799 Y124.878 I.952 J-126.704 E.10622
G3 X113.801 Y124.026 I20.983 J-.383 E.03675
G3 X118.353 Y124 I3.393 J200.086 E.19633
G2 X120.202 Y123.93 I.362 J-14.833 E.07982
G2 X120.677 Y123.607 I-.134 J-.71 E.02548
G1 X120.708 Y123.549 E.00283
G1 X120.393 Y123.341 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.412 Y123.258 I-.322 J-.117 E.00341
G2 X120.473 Y119.684 I-431.298 J-9.119 E.14229
G3 X120.486 Y119.534 I1.876 J.096 E.006
G3 X121.59 Y119.494 I.875 J9.004 E.04401
G3 X122.012 Y119.512 I-.103 J7.252 E.0168
G3 X122.07 Y122.743 I-82.114 J3.097 E.12861
G3 X122.056 Y129.413 I-272.898 J2.734 E.26549
G3 X120.49 Y129.418 I-.807 J-8.179 E.06241
G3 X120.454 Y128.663 I7.988 J-.754 E.0301
G2 X120.422 Y125.88 I-55.971 J-.737 E.11079
G2 X120.34 Y125.477 I-.984 J-.01 E.01647
G2 X120.146 Y125.346 I-.229 J.129 E.00967
G2 X116.259 Y125.296 I-3.608 J128.888 E.15475
G3 X113.447 Y125.239 I1.127 J-126.045 E.11194
G3 X113.444 Y123.659 I13.82 J-.815 E.06292
G3 X118.351 Y123.626 I4.025 J230.856 E.1953
G2 X120.118 Y123.563 I.351 J-15.171 E.07042
G2 X120.367 Y123.396 I-.047 J-.339 E.01239
M204 S10000
G1 X121.239 Y123.407 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
G1 X121.253 Y121.223 E.11833
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X121.249 Y120.287 I106.745 J-.909 E.04763
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X121.463 Y120.064 E.01472
; WIPE_START
G1 X121.249 Y120.287 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.629 Y124.086 Z1.16 F30000
G1 X113.992 Y124.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
G1 X114.978 Y124.457 E.0536
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X118.355 Y124.468 I5.158 J-1097.004 E.19695
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X119.764 Y124.467 E.08739
G1 X120.14 Y124.595 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X120.33 Y124.613 E.00763
G1 X120.726 Y124.787 E.0172
G1 X120.986 Y125.085 E.01574
G1 X121.028 Y125.179 E.00411
G1 X121.33 Y125.165 E.01201
G1 X121.323 Y123.784 E.05497
G1 X121 Y123.777 E.01286
G1 X120.826 Y124.018 E.01181
G1 X120.542 Y124.214 E.01374
G1 X120.138 Y124.305 E.0165
G1 X120.139 Y124.535 E.00914
G1 X120.956 Y124.392 F30000
; LINE_WIDTH: 0.494249
G1 F5922.767
G2 X120.95 Y124.486 I-.027 J.046 E.01042
G1 X121.238 Y125.545 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
G1 X121.262 Y126.653 E.06081
G3 X121.262 Y128.645 I-365.053 J.826 E.10932
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X121.03 Y128.878 E.01704
; WIPE_START
G1 X121.262 Y128.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.993 Y121.017 Z1.16 F30000
G1 X120.577 Y109.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X120.547 Y109.142 E.0017
G2 X119.667 Y108.766 I-.846 J.763 E.04259
G2 X119.225 Y108.756 I-.354 J5.881 E.01909
G1 X117.663 Y108.799 E.06735
G1 X117.624 Y113.744 E.21325
G3 X117.608 Y114.394 I-21.223 J-.218 E.02804
G3 X116.713 Y114.368 I-.174 J-9.389 E.0386
G3 X116.735 Y110.743 I550.038 J1.427 E.1563
G2 X116.704 Y109.6 I-16.18 J-.133 E.04932
G1 X116.525 Y108.796 E.03551
G3 X113.806 Y108.716 I4.245 J-190.923 E.1173
G3 X113.817 Y107.911 I31.488 J.033 E.0347
G3 X119.074 Y107.898 I3.3 J266.573 E.22668
G3 X120.383 Y108.012 I.138 J6.018 E.0568
G3 X121.694 Y109.758 I-.523 J1.757 E.10084
G3 X121.695 Y115.925 I-98.644 J3.107 E.26596
G3 X121.435 Y116.897 I-1.778 J.045 E.04398
G3 X120.073 Y117.795 I-1.954 J-1.484 E.07171
G3 X117.037 Y117.83 I-2.057 J-46.276 E.13096
G1 X113.817 Y117.811 E.13883
G1 X113.801 Y116.978 E.0359
G2 X119.629 Y116.917 I.836 J-198.271 E.25131
G2 X120.395 Y116.708 I.032 J-1.391 E.03475
G2 X120.78 Y115.983 I-.603 J-.785 E.03649
G2 X120.822 Y114.29 I-25.853 J-1.485 E.07303
G2 X120.791 Y109.865 I-100.14 J-1.505 E.19086
G2 X120.674 Y109.311 I-1.678 J.065 E.0245
G1 X120.611 Y109.217 E.00488
G1 X120.272 Y109.385 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.643 Y109.14 I-.646 J.728 E.02742
G2 X119.229 Y109.131 I-.331 J5.508 E.0165
G1 X118.035 Y109.163 E.04753
G3 X117.993 Y114.108 I-229.37 J.496 E.1968
G3 X117.959 Y114.734 I-5.826 J-.003 E.02497
G3 X116.351 Y114.7 I-.661 J-6.741 E.06413
G3 X116.36 Y110.744 I103.805 J-1.757 E.15745
G2 X116.332 Y109.654 I-16.082 J-.129 E.04342
G1 X116.222 Y109.162 E.02004
G3 X113.43 Y109.078 I4.91 J-208.862 E.1112
G3 X113.45 Y107.539 I61.525 J.021 E.06127
G3 X119.082 Y107.523 I3.594 J283.119 E.22418
G3 X120.491 Y107.652 I.137 J6.257 E.05646
G3 X122.068 Y109.74 I-.632 J2.116 E.11145
G3 X122.069 Y115.95 I-98.872 J3.123 E.24719
G3 X121.656 Y117.226 I-2.069 J.036 E.05439
G3 X120.221 Y118.156 I-2.247 J-1.894 E.06908
G3 X117.036 Y118.205 I-2.222 J-41.407 E.12681
G1 X113.45 Y118.183 E.14274
G1 X113.419 Y116.606 E.06281
G2 X119.404 Y116.553 I.854 J-243.189 E.23825
G2 X120.083 Y116.458 I.063 J-2.02 E.02743
G2 X120.408 Y115.936 I-.284 J-.539 E.02564
G2 X120.447 Y114.29 I-26.154 J-1.445 E.06556
G2 X120.417 Y109.895 I-101.673 J-1.5 E.17495
G2 X120.301 Y109.437 I-.993 J.007 E.01897
M204 S10000
G1 X120.674 Y108.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
G3 X121.243 Y109.834 I-.814 J1.119 E.07914
G1 X121.253 Y110.059 E.01304
G3 X121.243 Y115.896 I-101.795 J2.736 E.33775
G1 X121.229 Y116.049 E.00892
G3 X120.818 Y116.925 I-1.234 J-.044 E.05754
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X120.808 Y116.936 E.0008
G3 X119.588 Y117.368 I-1.121 J-1.228 E.07343
G1 X119.432 Y117.373 E.00866
G3 X117.993 Y117.391 I-1.518 J-65.058 E.07948
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X114.004 Y117.394 I-2.619 J-719.618 E.20729
; WIPE_START
G1 X116.004 Y117.393 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.163 Y114.195 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
G3 X117.189 Y111.299 I489.208 J2.962 E.16843
G1 X117.185 Y109.593 E.09925
G1 X117.048 Y108.327 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
G1 X117.049 Y108.828 E.02568
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X117.048 Y108.898 E.00383
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X117.047 Y108.969 E.00416
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X117.065 Y109.001 E.0023
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X117.082 Y109.033 E.00244
G1 X117.472 Y108.347 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
G3 X119.065 Y108.329 I2.295 J129.717 E.08775
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X119.464 Y108.334 E.02083
G3 X120.557 Y108.575 I.116 J2.068 E.05909
G1 X120.674 Y108.651 E.00731
G1 X116.625 Y108.346 F30000
; LINE_WIDTH: 0.546922
G1 F5281.948
G1 X115.315 Y108.331 E.07052
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X114.005 Y108.317 E.06504
; WIPE_START
G1 X115.315 Y108.331 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.164 Y100.7 Z1.16 F30000
G1 X115.115 Y98.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X116.109 Y99.322 E.06264
G2 X119.044 Y101.992 I52.429 J-54.693 E.1711
G3 X121.736 Y104.413 I-170.214 J191.92 E.15609
G3 X121.715 Y105.734 I-104.989 J-.94 E.05695
G3 X113.746 Y105.743 I-4.756 J-646.551 E.34367
G3 X113.754 Y104.813 I13.358 J-.337 E.04012
G3 X117.804 Y104.792 I3.029 J194.358 E.17461
G2 X119.237 Y104.71 I.248 J-8.212 E.06197
G1 X119.378 Y104.658 E.00651
G1 X120.06 Y104.197 E.03549
G2 X118.818 Y102.944 I-9.327 J8.008 E.07615
G3 X113.745 Y98.397 I385.239 J-434.778 E.29376
G3 X113.752 Y97.133 I23.066 J-.519 E.05451
G3 X120.468 Y97.095 I5.121 J317.268 E.28964
G3 X121.777 Y97.119 I-.016 J37.102 E.05644
G3 X121.797 Y98.1 I-9.397 J.683 E.04233
G2 X116.802 Y98.148 I13.314 J1658.362 E.21541
G2 X115.175 Y98.257 I1.096 J28.375 E.07031
G1 X115.927 Y98.58 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.296 Y100.831 I23.246 J-22.101 E.13013
G3 X122.113 Y104.25 I-232.379 J263.166 E.20396
G3 X122.083 Y106.107 I-148.094 J-1.41 E.0739
G3 X113.387 Y106.109 I-4.459 J-502.798 E.34615
G3 X113.4 Y104.448 I22.096 J-.653 E.06613
G3 X118.522 Y104.406 I4.506 J238.501 E.20388
G2 X119.206 Y104.322 I.032 J-2.561 E.02752
G1 X119.49 Y104.13 E.01365
G2 X118.566 Y103.222 I-7.317 J6.529 E.0516
G3 X113.37 Y98.557 I302.231 J-341.854 E.27792
G3 X113.4 Y96.772 I17.451 J-.606 E.07112
G3 X120.47 Y96.72 I5.189 J228.924 E.28143
G3 X122.112 Y96.766 I.34 J17.451 E.06541
G3 X122.139 Y98.445 I-7.415 J.958 E.06698
G3 X120.959 Y98.489 I-.874 J-7.447 E.04705
G2 X116.593 Y98.532 I-.667 J156.379 E.17381
G1 X115.987 Y98.576 E.02417
M204 S10000
G1 X115.431 Y99.286 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
G1 X115.784 Y99.634 E.02902
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X119.105 Y102.624 I116.807 J-126.382 E.235
G1 X119.614 Y103.087 E.03614
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X120.175 Y103.631 I-12.025 J12.963 E.04351
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X120.53 Y103.983 E.03023
G1 X119.252 Y105.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X121.346 Y105.36 E.08334
G1 X121.358 Y104.578 E.03115
G1 X120.887 Y104.155 E.0252
G1 X120.446 Y104.601 E.02496
G1 X120.275 Y104.649 E.00707
G1 X120.138 Y104.597 E.00585
G1 X119.563 Y104.986 E.02761
G1 X119.245 Y105.078 E.01318
G1 X119.251 Y105.31 E.00924
G1 X120.188 Y105.002 F30000
; LINE_WIDTH: 0.423508
G1 F7075.639
G1 X120.354 Y105.004 E.00667
G1 X120.414 Y105.005 F30000
; LINE_WIDTH: 0.406861
G1 F7415.318
G1 X120.715 Y105.016 E.01157
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X121.017 Y105.027 E.01046
G1 X121.02 Y104.778 E.00866
G2 X120.901 Y104.617 I-.236 J.051 E.00716
G1 X120.685 Y104.838 E.01069
; LINE_WIDTH: 0.396754
G1 F7637.945
G1 X120.465 Y104.974 E.00965
G1 X118.874 Y105.256 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
G1 X117.805 Y105.272 E.06721
G2 X115.316 Y105.274 I-.801 J441.112 E.15642
G2 X113.942 Y105.278 I-.353 J138.553 E.08636
; WIPE_START
G1 X115.316 Y105.274 E-.52215
G1 X115.942 Y105.274 E-.23785
; WIPE_END
G1 E-.04 F1800
G1 X115.431 Y99.286 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
M73 P82 R2
G1 X115.081 Y98.946 E.03013
G1 X114.72 Y98.809 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
G1 F7939.26
G1 X114.934 Y98.588 E.01102
G1 X114.57 Y98.211 E.01878
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X114.504 Y98.096 E.00519
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X114.523 Y98.014 E.00366
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X114.541 Y97.931 E.00394
G1 X114.679 Y97.902 E.00657
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X116.438 Y97.805 E.07157
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X116.793 Y97.787 E.01256
G3 X121.449 Y97.757 I9.125 J1054.978 E.1648
G1 X121.443 Y97.459 E.01055
G1 X120.466 Y97.447 E.03456
G2 X116.424 Y97.462 I1.138 J844.588 E.14307
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X114.662 Y97.511 E.07157
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X114.415 Y97.528 E.0111
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X114.168 Y97.546 E.01145
G1 X114.129 Y98.094 E.02542
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X114.13 Y98.229 E.00563
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X114.368 Y98.467 E.01347
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X114.676 Y98.769 I3.692 J-3.462 E.01577
; WIPE_START
G1 X114.368 Y98.467 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.749 Y90.844 Z1.16 F30000
G1 X114.919 Y87.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
G1 X114.843 Y87.562 E.00655
G2 X114.739 Y87.97 I.791 J.421 E.01834
G2 X114.779 Y92.812 I71.105 J1.831 E.20885
G2 X115.296 Y93.865 I1.238 J.045 E.05271
G2 X116.094 Y94.068 I.893 J-1.84 E.03575
G2 X119.449 Y94.081 I1.819 J-34.674 E.14471
G2 X120.507 Y93.59 I-.008 J-1.4 E.05186
G2 X120.692 Y93.068 I-.909 J-.616 E.02412
G2 X120.759 Y90.744 I-28.998 J-2.002 E.10031
G1 X120.802 Y86.162 E.19755
G1 X121.707 Y86.162 E.03901
G3 X121.685 Y93.394 I-238.073 J2.92 E.31183
G3 X120.423 Y94.875 I-2.547 J-.892 E.08585
G3 X119.426 Y95.052 I-1.055 J-3.041 E.04386
G3 X115.658 Y95.016 I-1.571 J-32.653 E.1626
G3 X114.374 Y94.304 I.229 J-1.926 E.06492
G3 X113.8 Y92.977 I1.467 J-1.422 E.06373
G3 X113.754 Y90.293 I34.1 J-1.918 E.11578
G1 X113.777 Y86.158 E.17832
G3 X118.142 Y86.143 I3.039 J242.645 E.18826
G1 X118.263 Y86.147 E.0052
G3 X118.273 Y90.01 I-88.309 J2.168 E.16658
G3 X117.285 Y89.976 I.262 J-22.511 E.04263
G2 X117.223 Y87.879 I-33.386 J-.057 E.09047
G2 X117.005 Y87.282 I-1.237 J.112 E.02774
G2 X115.982 Y87.097 I-.831 J1.669 E.04546
G2 X115.083 Y87.276 I-.084 J1.921 E.03992
G2 X114.963 Y87.389 I.552 J.706 E.00711
G1 X115.233 Y87.651 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.112 Y88.001 I.404 J.334 E.01507
G2 X115.153 Y92.784 I71.116 J1.79 E.19038
G2 X115.412 Y93.482 I.957 J.042 E.03045
G2 X116.123 Y93.694 I.674 J-.96 E.03005
G2 X119.413 Y93.708 I1.794 J-34.451 E.13098
G2 X120.205 Y93.363 I-.013 J-1.112 E.03532
G2 X120.319 Y93.021 I-.582 J-.384 E.01454
G2 X120.384 Y90.739 I-28.895 J-1.961 E.09087
G1 X120.43 Y85.787 E.1971
G1 X122.08 Y85.787 E.06566
G3 X122.055 Y93.468 I-239.153 J3.044 E.30571
G3 X120.635 Y95.192 I-2.955 J-.987 E.09092
G3 X119.448 Y95.427 I-1.185 J-2.874 E.04847
G3 X115.611 Y95.388 I-1.59 J-32.963 E.15282
G3 X114.095 Y94.555 I.265 J-2.278 E.07058
G3 X113.426 Y93.01 I1.744 J-1.673 E.06846
G3 X113.379 Y90.293 I34.395 J-1.95 E.1082
G1 X113.404 Y85.786 E.1794
G3 X118.15 Y85.768 I3.368 J260.389 E.18891
G3 X118.614 Y85.808 I.022 J2.477 E.01858
G3 X118.666 Y89.22 I-42.344 J2.346 E.13589
G3 X118.612 Y90.383 I-10.19 J.116 E.04636
G3 X116.916 Y90.336 I-.076 J-28.108 E.06757
G2 X116.85 Y87.921 I-38.033 J-.176 E.09618
G2 X116.739 Y87.573 I-.766 J.052 E.01468
G2 X115.993 Y87.471 I-.566 J1.36 E.03033
G2 X115.29 Y87.592 I-.087 J1.603 E.0286
G2 X115.273 Y87.607 I.346 J.394 E.00091
; WIPE_START
M204 S10000
G1 X115.174 Y87.726 E-.05886
G1 X115.14 Y87.819 E-.03768
G1 X115.112 Y88.001 E-.07005
G1 X115.091 Y88.687 E-.26076
G1 X115.093 Y89.556 E-.33017
G1 X115.093 Y89.563 E-.00247
; WIPE_END
G1 E-.04 F1800
G1 X114.244 Y87.958 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
G1 X114.238 Y89.563 E.10313
G2 X114.293 Y92.934 I54.656 J.795 E.21673
G1 X114.319 Y93.162 E.01474
G2 X115.27 Y94.405 I1.722 J-.332 E.10428
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X115.325 Y94.429 E.00391
G2 X116.653 Y94.583 I1.197 J-4.518 E.08757
G2 X119.594 Y94.553 I1.138 J-32.466 E.19191
G1 X119.745 Y94.535 E.00996
G2 X120.635 Y94.138 I-.116 J-1.459 E.06482
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X120.857 Y93.906 I-1.353 J-1.515 E.01997
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X120.851 Y93.883 E.0014
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X120.817 Y93.776 E.00609
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X120.784 Y93.669 E.00554
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X120.75 Y93.562 E.00498
G1 X120.975 Y93.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
G1 X121.099 Y93.162 E.0048
G1 X121.252 Y93.238 E.00653
G1 X121.206 Y92.884 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
G2 X121.236 Y90.75 I-84.506 J-2.275 E.1363
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X121.254 Y86.357 I-775.829 J-5.261 E.26509
; WIPE_START
G1 X121.246 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.476 Y89.714 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
G1 X118.004 Y89.723 E.00939
G1 X118.085 Y89.809 E.00211
G1 X117.93 Y89.26 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
G2 X117.899 Y86.518 I-106.425 J-.172 E.10452
G1 X116.934 Y86.522 E.0368
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X116.846 Y86.543 E.00381
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X116.758 Y86.565 E.00423
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X116.67 Y86.587 E.00466
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X116.583 Y86.608 E.00508
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X116.495 Y86.63 E.00551
G1 X116.639 Y86.697 E.00972
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X116.784 Y86.764 E.00897
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X116.928 Y86.831 E.00822
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X117.073 Y86.899 E.00747
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X117.3 Y87.042 I-.114 J.434 E.01101
G1 X117.51 Y87.43 E.01777
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X117.595 Y88.009 E.02126
G3 X117.622 Y89.255 I-203.786 J5.075 E.04528
G1 X117.87 Y89.259 E.009
G1 X117.591 Y86.818 F30000
; LINE_WIDTH: 0.362949
G1 F8490.486
G1 X117.534 Y86.851 E.0022
G1 X117.572 Y86.873 E.00145
G1 X116.012 Y86.635 F30000
; LINE_WIDTH: 0.635768
G1 F4466.768
G1 X116.435 Y86.63 E.02693
G1 X114.499 Y86.829 F30000
; LINE_WIDTH: 0.362009
G1 F8516.92
G1 X114.442 Y86.861 E.00218
G1 X114.48 Y86.883 E.00144
G1 X114.439 Y87.583 F30000
; LINE_WIDTH: 0.419499
G1 F7154.583
G1 X114.51 Y87.372 E.00883
G3 X115.119 Y86.847 I1.014 J.56 E.03267
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X115.368 Y86.818 E.00942
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X115.616 Y86.788 E.00857
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X115.682 Y86.763 E.00249
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X115.748 Y86.737 E.00286
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X115.814 Y86.711 E.00323
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X115.88 Y86.686 E.0036
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X115.946 Y86.66 E.00397
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X116.012 Y86.635 E.00434
G1 X115.945 Y86.611 E.00434
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X115.878 Y86.588 E.00397
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X115.812 Y86.564 E.0036
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X115.745 Y86.541 E.00323
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X115.678 Y86.517 E.00286
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X115.612 Y86.494 E.00254
G1 X115.082 Y86.526 E.01904
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X114.15 Y86.532 I-1.236 J-132.775 E.03701
G1 X114.147 Y87.583 E.04179
G1 X114.379 Y87.583 E.00924
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F7156.055
G1 X114.147 Y87.583 E-.08836
G1 X114.15 Y86.532 E-.39958
G1 X114.866 Y86.527 E-.27207
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 4/4
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S102
G17
G3 Z1.16 I1.217 J0 P1  F30000
; object ids of layer 4 start: 169,331,425
M624 BwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer4 end: 169,331,425
M625
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.29 Y156.744
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.987 Y156.5 I-.333 J.103 E.01643
G2 X134.849 Y156.446 I-3.136 J81.101 E.16471
G3 X133.891 Y156.425 I.177 J-30.547 E.03815
G3 X133.896 Y154.849 I19.174 J-.726 E.06274
G3 X142.548 Y154.845 I4.486 J339.234 E.34435
G3 X142.509 Y156.718 I-16.043 J.61 E.07458
G2 X137.527 Y160.235 I92.352 J136.117 E.24278
G2 X137.511 Y160.766 I.228 J.272 E.0239
G2 X138.481 Y161.521 I5.136 J-5.599 E.04895
G3 X140.97 Y163.261 I-62.508 J92.047 E.1209
G3 X142.513 Y164.333 I-20.556 J31.239 E.07479
G3 X142.532 Y166.238 I-9.92 J1.052 E.07596
G3 X133.89 Y166.206 I-2.371 J-525.515 E.34398
G3 X133.893 Y164.622 I20.563 J-.763 E.06308
G2 X138.705 Y164.583 I1.29 J-138.139 E.19157
G2 X139.166 Y164.444 I.068 J-.606 E.01968
G2 X139.075 Y163.961 I-.269 J-.199 E.02192
G1 X138.91 Y163.834 E.0083
G3 X134.425 Y160.652 I529.335 J-750.724 E.2189
G1 X134.249 Y160.514 E.00886
G3 X138.155 Y157.755 I118.625 J163.795 E.19034
G2 X139.195 Y156.982 I-17.05 J-24.021 E.05157
G1 X139.261 Y156.902 E.00415
G1 X139.279 Y156.803 E.00398
; WIPE_START
M204 S10000
G1 X139.22 Y156.61 E-.07674
G1 X139.142 Y156.543 E-.039
G1 X138.987 Y156.5 E-.0612
G1 X137.516 Y156.459 E-.55924
G1 X137.453 Y156.458 E-.02383
; WIPE_END
G1 E-.04 F1800
G1 X139.74 Y158.398 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.35 Y155.788 E.15914
G1 X142.362 Y155.225
G1 X137.834 Y159.753 E.27612
; WIPE_START
M204 S10000
G1 X139.248 Y158.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.361 Y165.151 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.474 Y166.039 E.05412
G1 X140.922 Y166.039
G1 X142.34 Y164.621 E.08645
G1 X142.113 Y164.297
G1 X140.371 Y166.039 E.10624
G1 X139.82 Y166.039
G1 X141.789 Y164.07 E.12008
G1 X141.464 Y163.843
G1 X139.268 Y166.039 E.13391
G1 X138.717 Y166.039
G1 X141.14 Y163.616 E.14775
G1 X140.815 Y163.389
G1 X138.165 Y166.039 E.16158
G1 X137.615 Y166.038
G1 X138.886 Y164.767 E.07751
G1 X138.31 Y164.791
G1 X137.068 Y166.033 E.07578
G1 X136.521 Y166.029
G1 X137.747 Y164.802 E.07479
G1 X137.188 Y164.811
G1 X135.974 Y166.024 E.07401
G1 X135.427 Y166.02
G1 X136.635 Y164.812 E.07362
G1 X136.081 Y164.814
G1 X134.88 Y166.015 E.07324
G1 X134.333 Y166.011
G1 X135.528 Y164.816 E.07285
G1 X134.975 Y164.818
G1 X134.08 Y165.713 E.05456
; WIPE_START
M204 S10000
G1 X134.975 Y164.818 E-.48084
G1 X135.528 Y164.816 E-.21023
G1 X135.4 Y164.944 E-.06893
; WIPE_END
G1 E-.04 F1800
G1 X139.434 Y164.218 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.491 Y163.162 E.06441
G1 X140.166 Y162.935
G1 X139.249 Y163.852 E.05591
G1 X138.933 Y163.616
G1 X139.842 Y162.708 E.05539
G1 X139.517 Y162.481
G1 X138.611 Y163.388 E.05528
G1 X138.288 Y163.159
G1 X139.193 Y162.254 E.05517
G1 X138.868 Y162.027
G1 X137.965 Y162.93 E.05506
G1 X137.643 Y162.701
G1 X138.544 Y161.8 E.05495
G1 X138.219 Y161.573
G1 X137.32 Y162.473 E.05484
G1 X136.997 Y162.244
G1 X137.895 Y161.347 E.05473
G1 X137.585 Y161.105
G1 X136.675 Y162.015 E.05551
G1 X136.352 Y161.787
G1 X137.314 Y160.825 E.05865
G1 X137.207 Y160.38
G1 X136.029 Y161.558 E.07183
G1 X135.706 Y161.329
G1 X141.993 Y155.042 E.38339
G1 X141.444 Y155.04
G1 X135.384 Y161.1 E.36959
G1 X135.062 Y160.87
G1 X137.391 Y158.542 E.142
; WIPE_START
M204 S10000
G1 X135.977 Y159.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.403 Y156.53 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.896 Y155.037 E.09103
G1 X140.347 Y155.035
G1 X139.066 Y156.315 E.07809
G1 X138.547 Y156.283
G1 X139.798 Y155.032 E.07629
G1 X139.249 Y155.03
G1 X138.002 Y156.277 E.07603
G1 X137.457 Y156.27
G1 X138.7 Y155.027 E.07577
G1 X138.151 Y155.025
G1 X136.913 Y156.263 E.07551
G1 X136.368 Y156.256
G1 X137.602 Y155.022 E.07525
G1 X137.05 Y155.023
G1 X135.823 Y156.25 E.07482
G1 X135.278 Y156.243
G1 X136.494 Y155.027 E.07413
G1 X135.938 Y155.032
G1 X134.734 Y156.236 E.07344
G1 X134.189 Y156.23
G1 X135.382 Y155.037 E.07275
G1 X134.826 Y155.041
G1 X134.08 Y155.787 E.04547
; WIPE_START
M204 S10000
G1 X134.826 Y155.041 E-.40074
G1 X135.382 Y155.037 E-.21129
G1 X135.107 Y155.312 E-.14797
; WIPE_END
G1 E-.04 F1800
G1 X138.465 Y162.166 Z1.44 F30000
G1 X139.504 Y164.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
G3 X139.443 Y164.414 I-.668 J-.248 E.0019
; LINE_WIDTH: 0.147062
G1 X139.381 Y164.498 E.001
; LINE_WIDTH: 0.120275
G1 X139.319 Y164.581 E.00069
G1 X139.308 Y164.59 F30000
; LINE_WIDTH: 0.135238
G1 F12000
G3 X138.969 Y164.851 I-1.789 J-1.977 E.00356
; WIPE_START
G1 X139.308 Y164.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.772 Y159.691 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M73 P83 R2
G1 X137.521 Y159.914 E.00687
; LINE_WIDTH: 0.210796
G2 X137.139 Y160.312 I.765 J1.117 E.00926
; WIPE_START
G1 X137.269 Y160.137 E-.29908
G1 X137.521 Y159.914 E-.46092
; WIPE_END
G1 E-.04 F1800
G1 X136.37 Y159.257 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
G1 X136.18 Y159.416 E.00187
; LINE_WIDTH: 0.171253
G1 X135.99 Y159.575 E.00304
; LINE_WIDTH: 0.214175
G1 X135.801 Y159.734 E.00422
; LINE_WIDTH: 0.257097
G1 X135.611 Y159.893 E.00539
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X135.421 Y160.052 E.00657
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X135.231 Y160.211 E.00775
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X135.041 Y160.37 E.00892
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X134.724 Y160.643 E.01686
; WIPE_START
G1 X135.041 Y160.37 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.239 Y157.939 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
G1 X138.016 Y158.129 E.00227
; LINE_WIDTH: 0.176706
G1 X137.792 Y158.318 E.00377
; LINE_WIDTH: 0.223354
G1 X137.568 Y158.508 E.0053
; LINE_WIDTH: 0.251283
G1 X137.454 Y158.604 E.00317
; WIPE_START
G1 X137.568 Y158.508 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.678 Y158.336 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
G1 X139.476 Y158.505 E.00514
; LINE_WIDTH: 0.198217
G1 X139.273 Y158.674 E.00404
; LINE_WIDTH: 0.161001
G1 X139.097 Y158.823 E.00257
; LINE_WIDTH: 0.124914
G1 X138.921 Y158.972 E.00165
; WIPE_START
G1 X139.097 Y158.823 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.376 Y155.061 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
G1 X142.012 Y155.06 E.00298
; WIPE_START
G1 X142.376 Y155.061 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.345 Y156.362 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
G1 X142.117 Y156.552 E.01135
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X141.889 Y156.743 E.00984
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X141.661 Y156.933 E.00833
; LINE_WIDTH: 0.267734
G1 F12000
G1 X141.433 Y157.124 E.00682
; LINE_WIDTH: 0.221773
G1 X141.205 Y157.314 E.00531
; LINE_WIDTH: 0.175812
G1 X140.977 Y157.505 E.0038
; LINE_WIDTH: 0.129851
G1 X140.749 Y157.695 E.00229
; WIPE_START
G1 X140.977 Y157.505 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.937 Y151.773 Z1.44 F30000
G1 X135.524 Y151.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.992 Y151.772 E.02631
G1 X142.555 Y151.839 E.26126
G3 X142.535 Y153.39 I-13 J.608 E.06177
G3 X136.348 Y153.398 I-3.399 J-245.281 E.24626
G3 X135.031 Y153.024 I-.048 J-2.338 E.05531
G3 X133.961 Y151.669 I.909 J-1.818 E.07097
G3 X133.883 Y150.458 I10.929 J-1.314 E.04834
G3 X133.924 Y144.621 I121.66 J-2.071 E.23232
G3 X134.057 Y144.142 I1.388 J.127 E.01991
G3 X135.654 Y142.786 I2.157 J.923 E.08645
G3 X136.57 Y142.667 I.851 J2.971 E.0369
G3 X140.649 Y142.649 I2.997 J209.491 E.16235
G3 X142.499 Y142.684 I-.321 J64.879 E.07366
G3 X142.504 Y144.285 I-14.645 J.846 E.06375
G3 X135.941 Y144.322 I-4.443 J-206.777 E.26126
G1 X135.482 Y144.851 E.02789
G1 X135.524 Y151.245 E.25449
; WIPE_START
M204 S10000
G1 X135.992 Y151.772 E-.26789
G1 X137.287 Y151.785 E-.49211
; WIPE_END
G1 E-.04 F1800
G1 X141.635 Y153.195 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.362 Y152.468 E.04436
G1 X142.243 Y152.036
G1 X141.081 Y153.198 E.07086
G1 X140.527 Y153.2
G1 X141.697 Y152.03 E.07137
G1 X141.151 Y152.024
G1 X139.973 Y153.203 E.07187
G1 X139.419 Y153.206
G1 X140.605 Y152.019 E.07238
G1 X140.06 Y152.013
G1 X138.864 Y153.208 E.07288
G1 X138.31 Y153.211
G1 X139.514 Y152.008 E.07339
G1 X138.968 Y152.002
G1 X137.756 Y153.214 E.07389
G1 X137.21 Y153.209
G1 X138.422 Y151.996 E.07393
G1 X137.876 Y151.991
G1 X136.665 Y153.202 E.07387
G1 X136.137 Y153.179
G1 X137.331 Y151.985 E.07281
G1 X136.785 Y151.98
G1 X135.665 Y153.1 E.06831
G1 X135.281 Y152.932
G1 X136.239 Y151.974 E.05843
G1 X135.8 Y151.862
G1 X134.939 Y152.722 E.05246
G1 X134.632 Y152.479
G1 X135.524 Y151.586 E.05442
G1 X135.324 Y151.234
G1 X134.384 Y152.175 E.05735
G1 X134.204 Y151.803
G1 X135.321 Y150.687 E.06809
G1 X135.317 Y150.139
G1 X134.124 Y151.332 E.07278
G1 X134.092 Y150.812
G1 X135.313 Y149.591 E.07446
G1 X135.31 Y149.043
G1 X134.086 Y150.267 E.07466
G1 X134.079 Y149.723
G1 X135.306 Y148.495 E.07486
G1 X135.303 Y147.948
G1 X134.074 Y149.177 E.07494
G1 X134.074 Y148.625
G1 X135.299 Y147.4 E.0747
G1 X135.295 Y146.852
G1 X134.074 Y148.073 E.07446
G1 X134.075 Y147.521
G1 X135.292 Y146.304 E.07423
G1 X135.288 Y145.756
G1 X134.075 Y146.969 E.07396
G1 X134.082 Y146.411
G1 X135.284 Y145.209 E.07331
; WIPE_START
M204 S10000
G1 X134.082 Y146.411 E-.64606
G1 X134.079 Y146.711 E-.11394
; WIPE_END
G1 E-.04 F1800
G1 X141.319 Y144.295 Z1.44 F30000
G1 X141.909 Y144.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.319 Y143.688 E.02505
G1 X142.314 Y143.142
G1 X141.345 Y144.111 E.05909
G1 X140.786 Y144.119
G1 X142.03 Y142.875 E.07588
G1 X141.489 Y142.864
G1 X140.234 Y144.119 E.07654
G1 X139.682 Y144.12
G1 X140.948 Y142.854 E.0772
G1 X140.402 Y142.848
G1 X139.13 Y144.12 E.07755
G1 X138.578 Y144.121
G1 X139.849 Y142.849 E.07751
G1 X139.297 Y142.85
G1 X138.026 Y144.121 E.07748
G1 X137.475 Y144.121
G1 X138.745 Y142.851 E.07745
G1 X138.192 Y142.852
G1 X136.923 Y144.122 E.07742
G1 X136.371 Y144.122
G1 X137.64 Y142.853 E.07738
G1 X137.088 Y142.854
G1 X134.089 Y145.852 E.18284
G1 X134.096 Y145.294
G1 X136.517 Y142.874 E.14759
G1 X135.912 Y142.927
G1 X134.126 Y144.713 E.10891
; WIPE_START
M204 S10000
G1 X135.54 Y143.299 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.48 Y143.053 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
G1 X135.378 Y143.124 E.00117
; LINE_WIDTH: 0.179713
G1 X135.276 Y143.196 E.00165
; LINE_WIDTH: 0.214273
G1 X135.174 Y143.268 E.00212
; LINE_WIDTH: 0.246896
G1 X135.062 Y143.358 E.00298
; LINE_WIDTH: 0.29318
G1 F11031.832
G2 X134.515 Y143.896 I2.887 J3.484 E.01978
; LINE_WIDTH: 0.258333
G1 F12000
G1 X134.353 Y144.106 E.00582
; LINE_WIDTH: 0.223912
G1 X134.191 Y144.317 E.00481
; WIPE_START
G1 X134.353 Y144.106 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.347 Y139.464 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.049 Y139.613 I.624 J-1.213 E.0289
G2 X140.765 Y139.314 I-.032 J-1.084 E.03157
G1 X140.847 Y139.193 E.00582
M73 P83 R1
G2 X140.904 Y133.396 I-181.781 J-4.692 E.23073
G3 X140.948 Y131.239 I43.647 J-.185 E.08587
G3 X142.51 Y131.235 I.812 J10.002 E.06221
G3 X142.482 Y139.4 I-150.39 J3.57 E.32504
G3 X141.61 Y140.727 I-2.124 J-.446 E.0647
G3 X139.762 Y141.224 I-1.577 J-2.178 E.07786
G3 X137.596 Y139.915 I.09 J-2.595 E.10519
G3 X137.441 Y138.872 I3.454 J-1.046 E.04214
G3 X137.373 Y133.428 I1915.931 J-26.801 E.21671
G2 X137.251 Y132.773 I-1.59 J-.042 E.02673
G2 X136.736 Y132.495 I-.586 J.471 E.02392
G2 X135.929 Y132.524 I-.334 J1.963 E.03237
G2 X135.581 Y133.127 I.387 J.624 E.02885
G2 X135.513 Y134.473 I9.909 J1.176 E.05371
G1 X135.49 Y140.817 E.25248
G1 X133.906 Y140.786 E.06304
G3 X133.894 Y133.3 I461.903 J-4.514 E.29795
G3 X134.408 Y131.682 I2.375 J-.136 E.06908
G3 X136.451 Y130.863 I1.884 J1.741 E.09055
G1 X136.684 Y130.869 E.00927
G3 X137.546 Y131.011 I.016 J2.586 E.03496
G3 X138.86 Y132.246 I-1.104 J2.491 E.07314
G3 X139.032 Y133.712 I-5.63 J1.405 E.05892
G3 X139.061 Y135.304 I-54.389 J1.79 E.06335
G1 X139.072 Y139.277 E.15815
G2 X139.294 Y139.435 I.899 J-1.026 E.01088
; WIPE_START
M204 S10000
G1 X139.521 Y139.551 E-.09681
G1 X139.772 Y139.608 E-.09788
G1 X140.049 Y139.613 E-.10507
G1 X140.193 Y139.594 E-.05506
G1 X140.438 Y139.527 E-.09672
G1 X140.64 Y139.424 E-.08624
G1 X140.765 Y139.314 E-.0631
G1 X140.847 Y139.193 E-.05561
G1 X140.853 Y138.92 E-.10352
; WIPE_END
G1 E-.04 F1800
G1 X134.924 Y140.606 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X135.293 Y140.238 E.02247
G1 X135.295 Y139.684
G1 X134.383 Y140.596 E.05557
G1 X134.104 Y140.323
G1 X135.297 Y139.131 E.07271
G1 X135.299 Y138.577
G1 X134.103 Y139.774 E.07295
G1 X134.101 Y139.224
G1 X135.301 Y138.024 E.07318
G1 X135.303 Y137.47
G1 X134.099 Y138.674 E.07341
G1 X134.097 Y138.125
G1 X135.305 Y136.917 E.07364
G1 X135.307 Y136.364
G1 X134.095 Y137.575 E.07387
G1 X134.094 Y137.025
G1 X135.309 Y135.81 E.0741
G1 X135.311 Y135.257
G1 X134.092 Y136.476 E.07433
G1 X134.09 Y135.926
G1 X135.313 Y134.703 E.07457
G1 X135.322 Y134.143
G1 X134.088 Y135.376 E.07522
G1 X134.087 Y134.827
G1 X135.34 Y133.573 E.07645
G1 X135.413 Y132.949
G1 X134.085 Y134.277 E.081
; WIPE_START
M204 S10000
G1 X135.413 Y132.949 E-.71381
G1 X135.399 Y133.07 E-.04619
; WIPE_END
G1 E-.04 F1800
G1 X139.616 Y139.431 Z1.44 F30000
G1 X140.632 Y140.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.285 Y139.311 E.10081
G1 X142.307 Y138.738
G1 X140.022 Y141.022 E.13933
G1 X139.502 Y140.991
G1 X142.324 Y138.169 E.17212
G1 X142.33 Y137.612
G1 X141.053 Y138.889 E.07785
G1 X141.066 Y138.324
G1 X142.335 Y137.055 E.07741
G1 X142.341 Y136.498
G1 X141.079 Y137.76 E.07696
G1 X141.091 Y137.197
G1 X142.346 Y135.941 E.07656
G1 X142.347 Y135.389
G1 X141.093 Y136.643 E.07648
G1 X141.096 Y136.089
G1 X142.346 Y134.839 E.07624
G1 X142.344 Y134.289
M73 P84 R1
G1 X141.098 Y135.535 E.076
G1 X141.1 Y134.981
G1 X142.343 Y133.739 E.07577
G1 X142.342 Y133.189
G1 X141.103 Y134.427 E.07553
G1 X141.105 Y133.874
G1 X142.34 Y132.639 E.07529
G1 X142.33 Y132.098
G1 X141.108 Y133.32 E.0745
G1 X141.11 Y132.766
G1 X142.317 Y131.559 E.07361
G1 X141.922 Y131.403
G1 X141.116 Y132.209 E.04912
; WIPE_START
M204 S10000
G1 X141.922 Y131.403 E-.43285
G1 X142.317 Y131.559 E-.16162
G1 X142.009 Y131.867 E-.16553
; WIPE_END
G1 E-.04 F1800
G1 X140.262 Y139.297 Z1.44 F30000
G1 X140.144 Y139.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X139.057 Y140.885 E.06627
G1 X138.68 Y140.711
G1 X139.607 Y139.783 E.05655
G1 X139.22 Y139.619
G1 X138.354 Y140.485 E.05283
G1 X138.07 Y140.217
G1 X138.892 Y139.395 E.05012
G1 X138.872 Y138.864
G1 X137.825 Y139.911 E.06381
G1 X137.698 Y139.487
G1 X138.87 Y138.315 E.07149
G1 X138.869 Y137.765
G1 X137.652 Y138.982 E.0742
G1 X137.632 Y138.45
G1 X138.867 Y137.215 E.07533
G1 X138.865 Y136.665
G1 X137.62 Y137.911 E.07596
G1 X137.611 Y137.368
G1 X138.864 Y136.115 E.07643
G1 X138.862 Y135.565
G1 X137.607 Y136.821 E.07658
G1 X137.603 Y136.274
G1 X138.856 Y135.02 E.07646
G1 X138.846 Y134.478
G1 X137.599 Y135.726 E.07609
G1 X137.595 Y135.179
G1 X138.837 Y133.937 E.07573
G1 X138.811 Y133.411
G1 X137.591 Y134.631 E.07442
G1 X137.587 Y134.084
G1 X138.775 Y132.895 E.07249
G1 X138.701 Y132.418
G1 X137.569 Y133.55 E.06903
G1 X137.54 Y133.028
G1 X138.517 Y132.051 E.05958
G1 X138.258 Y131.758
G1 X137.386 Y132.631 E.05322
G1 X137.077 Y132.388
G1 X137.969 Y131.496 E.0544
G1 X137.634 Y131.28
G1 X136.627 Y132.287 E.06143
G1 X136.079 Y132.283
G1 X137.238 Y131.124 E.07069
G1 X136.736 Y131.074
G1 X134.089 Y133.721 E.16142
G1 X134.103 Y133.156
G1 X136.19 Y131.069 E.1273
G1 X135.524 Y131.183
G1 X134.189 Y132.519 E.08145
; WIPE_START
M204 S10000
G1 X135.524 Y131.183 E-.71775
G1 X135.634 Y131.165 E-.04226
; WIPE_END
G1 E-.04 F1800
G1 X140.276 Y137.223 Z1.44 F30000
G1 X142.184 Y139.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
G1 X142.164 Y139.746 E.00021
; LINE_WIDTH: 0.130511
G1 X142.105 Y139.828 E.00079
; LINE_WIDTH: 0.163118
G1 X142.045 Y139.911 E.00116
; LINE_WIDTH: 0.199555
G1 X141.89 Y140.095 E.00371
; LINE_WIDTH: 0.222554
G3 X141.453 Y140.525 I-4.507 J-4.14 E.01103
; LINE_WIDTH: 0.185394
G1 X141.246 Y140.697 E.00372
; LINE_WIDTH: 0.147212
G1 X141.167 Y140.754 E.00094
; LINE_WIDTH: 0.120327
G1 X141.088 Y140.812 E.00065
; WIPE_START
G1 X141.167 Y140.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.357 Y139.86 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
G1 X140.132 Y139.786 E.00235
G1 X140.473 Y139.723 F30000
; LINE_WIDTH: 0.140994
G1 F12000
G1 X140.22 Y139.874 E.00263
; WIPE_START
G1 X140.473 Y139.723 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.791 Y133.39 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
G1 X138.791 Y133.156 E.00128
G1 X138.694 Y132.386 F30000
; LINE_WIDTH: 0.128952
G1 F12000
G2 X138.597 Y132.246 I-.611 J.321 E.0013
; WIPE_START
G1 X138.694 Y132.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.393 Y131.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
G2 X137.273 Y131.133 I-.288 J.191 E.00089
; WIPE_START
G1 X137.393 Y131.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.087 Y132.291 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
G1 X135.935 Y132.254 E.00247
; LINE_WIDTH: 0.183556
G1 X135.838 Y132.32 E.0016
; LINE_WIDTH: 0.123039
G2 X135.581 Y132.543 I1.035 J1.454 E.00237
; LINE_WIDTH: 0.126364
G1 X135.519 Y132.624 E.00075
; LINE_WIDTH: 0.162472
G2 X135.339 Y132.875 I2.197 J1.762 E.0035
; WIPE_START
G1 X135.519 Y132.624 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.807 Y131.594 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
G2 X134.463 Y131.94 I4.051 J4.378 E.00276
; WIPE_START
G1 X134.807 Y131.594 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.203 Y126.196 Z1.44 F30000
G1 X140.831 Y125.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.567 Y125.344 I-.284 J.067 E.01474
G2 X134.303 Y125.255 I-26.442 J1649.858 E.24939
G3 X133.9 Y125.24 I.022 J-5.853 E.01605
G3 X133.896 Y123.66 I14.303 J-.823 E.06293
G3 X139.743 Y123.616 I5.095 J291.895 E.23273
G2 X140.603 Y123.556 I.034 J-5.676 E.03436
G2 X140.866 Y123.25 I-.068 J-.324 E.01723
G2 X140.921 Y119.763 I-406.372 J-8.259 E.13881
G3 X140.939 Y119.533 I2.353 J.068 E.00917
G3 X142.119 Y119.496 I1.021 J13.405 E.04697
G3 X142.465 Y119.512 I-.064 J4.937 E.01381
G3 X142.532 Y124.958 I-134.811 J4.385 E.21679
G3 X142.508 Y129.413 I-151.211 J1.42 E.17733
G3 X140.942 Y129.418 I-.808 J-8.036 E.06242
G3 X140.898 Y126.84 I46.671 J-2.088 E.10265
G2 X140.84 Y125.627 I-6.849 J-.276 E.04839
; WIPE_START
M204 S10000
G1 X140.8 Y125.485 E-.05615
G1 X140.732 Y125.407 E-.03945
G1 X140.652 Y125.362 E-.03455
G1 X140.567 Y125.344 E-.03293
G1 X138.997 Y125.322 E-.59691
; WIPE_END
G1 E-.04 F1800
G1 X142.318 Y128.801 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X141.866 Y129.253 E.02757
G1 X141.328 Y129.24
G1 X142.327 Y128.241 E.06094
G1 X142.329 Y127.687
G1 X141.118 Y128.898 E.07386
G1 X141.105 Y128.36
G1 X142.33 Y127.135 E.07469
G1 X142.331 Y126.583
G1 X141.103 Y127.811 E.07489
G1 X141.1 Y127.262
G1 X142.331 Y126.031 E.0751
G1 X142.332 Y125.479
G1 X141.095 Y126.716 E.07545
G1 X141.081 Y126.178
G1 X142.333 Y124.927 E.07629
G1 X142.33 Y124.378
G1 X141.053 Y125.655 E.07786
G1 X140.881 Y125.275
G1 X142.327 Y123.83 E.08814
G1 X142.324 Y123.281
G1 X140.464 Y125.141 E.11342
G1 X139.928 Y125.125
G1 X142.321 Y122.733 E.14592
G1 X142.318 Y122.184
G1 X140.974 Y123.528 E.08195
G1 X141.075 Y122.876
G1 X142.315 Y121.635 E.07564
G1 X142.307 Y121.092
G1 X141.09 Y122.31 E.07425
G1 X141.098 Y121.749
G1 X142.296 Y120.552 E.07302
G1 X142.285 Y120.012
G1 X141.103 Y121.194 E.07208
G1 X141.107 Y120.638
G1 X142.049 Y119.696 E.05749
G1 X141.493 Y119.701
G1 X141.111 Y120.083 E.0233
; WIPE_START
M204 S10000
G1 X141.493 Y119.701 E-.20535
G1 X142.049 Y119.696 E-.21152
G1 X141.411 Y120.334 E-.34314
; WIPE_END
G1 E-.04 F1800
G1 X140.838 Y123.664 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X139.382 Y125.12 E.08881
G1 X138.836 Y125.115
G1 X140.152 Y123.798 E.08026
G1 X139.583 Y123.816
G1 X138.29 Y125.109 E.07885
G1 X137.744 Y125.104
G1 X139.029 Y123.819 E.07837
G1 X138.475 Y123.821
G1 X137.198 Y125.098 E.07788
G1 X136.652 Y125.093
G1 X137.921 Y123.824 E.0774
G1 X137.368 Y123.826
G1 X136.106 Y125.087 E.07692
G1 X135.56 Y125.082
G1 X136.814 Y123.828 E.07644
G1 X136.26 Y123.831
G1 X135.022 Y125.068 E.07547
G1 X134.484 Y125.055
G1 X135.706 Y123.833 E.0745
G1 X135.15 Y123.838
G1 X134.088 Y124.9 E.06474
G1 X134.075 Y124.362
G1 X134.589 Y123.848 E.03135
; WIPE_START
M204 S10000
G1 X134.075 Y124.362 E-.27625
G1 X134.088 Y124.9 E-.20462
G1 X134.607 Y124.38 E-.27913
; WIPE_END
G1 E-.04 F1800
G1 X141.131 Y125.733 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
G1 X141.058 Y125.926 E.00124
; WIPE_START
G1 X141.131 Y125.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.192 Y128.972 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
G2 X141.159 Y129.25 I.322 J.18 E.00321
; WIPE_START
G1 X141.155 Y129.068 E-.48684
G1 X141.192 Y128.972 E-.27316
; WIPE_END
G1 E-.04 F1800
G1 X140.16 Y121.41 Z1.44 F30000
G1 X138.488 Y109.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
M73 P85 R1
G1 X138.452 Y113.773 E.18346
G3 X138.411 Y114.735 I-7.48 J.162 E.03836
G3 X136.803 Y114.698 I-.644 J-7.029 E.06416
G3 X136.812 Y110.603 I121.596 J-1.771 E.16301
G2 X136.786 Y109.663 I-13.087 J-.102 E.03745
G1 X136.676 Y109.162 E.02039
G3 X133.883 Y109.078 I5.107 J-215.305 E.1112
G3 X133.902 Y107.539 I54.131 J-.09 E.06127
G3 X139.419 Y107.521 I3.795 J326.245 E.21959
G3 X140.963 Y107.658 I.188 J6.651 E.06184
G3 X142.522 Y109.757 I-.652 J2.112 E.11134
G3 X142.523 Y115.93 I-102.109 J3.109 E.24574
G3 X142.26 Y117.013 I-2.194 J.041 E.04485
G3 X140.602 Y118.165 I-2.332 J-1.59 E.08216
G3 X137.322 Y118.204 I-2.187 J-45.48 E.13057
G1 X133.903 Y118.183 E.13612
G1 X133.871 Y116.606 E.06281
G2 X139.405 Y116.565 I-.575 J-457.684 E.22026
G2 X140.473 Y116.482 I.116 J-5.399 E.04272
G2 X140.843 Y116.05 I-.172 J-.52 E.02378
G2 X140.893 Y115.245 I-5.184 J-.731 E.03211
G2 X140.882 Y110.135 I-371.979 J-1.754 E.20342
G2 X140.791 Y109.484 I-2.204 J-.022 E.02624
G2 X140.06 Y109.137 I-.67 J.467 E.03372
G2 X138.548 Y109.16 I-.499 J17.008 E.06019
; WIPE_START
M204 S10000
G1 X138.506 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.304 Y116.133 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X140.469 Y117.968 E.1119
G1 X139.892 Y117.993
G1 X142.341 Y115.544 E.14938
G1 X142.353 Y114.981
G1 X139.333 Y118.001 E.18417
G1 X138.777 Y118.006
G1 X140.04 Y116.742 E.07705
G1 X139.473 Y116.758
G1 X138.228 Y118.003 E.07596
G1 X137.679 Y118.001
G1 X138.911 Y116.769 E.07513
G1 X138.352 Y116.776
G1 X137.13 Y117.998 E.07451
G1 X136.581 Y117.996
G1 X137.797 Y116.78 E.07415
G1 X137.242 Y116.784
G1 X136.032 Y117.993 E.07378
G1 X135.483 Y117.991
G1 X136.687 Y116.787 E.07342
G1 X136.132 Y116.791
G1 X134.934 Y117.989 E.07305
G1 X134.385 Y117.986
G1 X135.577 Y116.794 E.07269
G1 X135.022 Y116.798
G1 X134.093 Y117.726 E.05663
G1 X134.082 Y117.186
G1 X134.467 Y116.801 E.02344
; WIPE_START
M204 S10000
G1 X134.082 Y117.186 E-.20655
G1 X134.093 Y117.726 E-.20552
G1 X134.741 Y117.079 E-.34793
; WIPE_END
G1 E-.04 F1800
G1 X137.805 Y114.566 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.237 Y114.134 E.02632
G1 X138.254 Y113.566
G1 X137.276 Y114.543 E.05963
G1 X136.993 Y114.275
G1 X138.258 Y113.01 E.07718
G1 X138.263 Y112.454
G1 X136.987 Y113.73 E.07781
G1 X136.992 Y113.173
G1 X138.267 Y111.898 E.07773
G1 X138.272 Y111.342
G1 X136.998 Y112.616 E.07765
G1 X137.004 Y112.059
G1 X138.276 Y110.787 E.07757
G1 X138.28 Y110.231
G1 X137.01 Y111.501 E.07749
G1 X137.01 Y110.95
G1 X138.285 Y109.675 E.07775
G1 X138.289 Y109.119
G1 X137.007 Y110.401 E.07819
; WIPE_START
M204 S10000
G1 X138.289 Y109.119 E-.68903
G1 X138.288 Y109.306 E-.07097
; WIPE_END
G1 E-.04 F1800
G1 X142.365 Y114.418 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.075 Y115.707 E.07863
G1 X141.093 Y115.138
G1 X142.368 Y113.863 E.07777
G1 X142.369 Y113.31
G1 X141.093 Y114.586 E.07779
G1 X141.094 Y114.034
G1 X142.37 Y112.758 E.0778
G1 X142.371 Y112.206
G1 X141.095 Y113.482 E.07782
G1 X141.095 Y112.93
G1 X142.365 Y111.66 E.07742
G1 X142.356 Y111.118
G1 X141.096 Y112.378 E.07686
G1 X141.096 Y111.826
G1 X142.348 Y110.575 E.0763
G1 X142.33 Y110.041
G1 X141.097 Y111.274 E.07521
G1 X141.088 Y110.731
G1 X142.304 Y109.516 E.07412
G1 X142.202 Y109.066
G1 X141.074 Y110.195 E.06881
G1 X141.041 Y109.675
G1 X142.018 Y108.699 E.05952
G1 X141.771 Y108.394
G1 X140.891 Y109.275 E.05371
G1 X140.57 Y109.044
G1 X141.469 Y108.145 E.05483
G1 X141.122 Y107.94
G1 X140.114 Y108.948 E.06146
G1 X139.577 Y108.934
G1 X140.706 Y107.805 E.0688
G1 X140.21 Y107.749
G1 X139.01 Y108.949 E.07317
G1 X138.443 Y108.965
G1 X139.678 Y107.73 E.07531
G1 X139.135 Y107.722
G1 X136.994 Y109.862 E.13055
G1 X136.927 Y109.378
G1 X138.582 Y107.723 E.10091
G1 X138.029 Y107.725
G1 X136.788 Y108.966 E.07568
G1 X136.253 Y108.95
G1 X137.476 Y107.727 E.07458
G1 X136.922 Y107.729
G1 X135.717 Y108.934 E.07349
G1 X135.182 Y108.918
G1 X136.369 Y107.73 E.0724
G1 X135.816 Y107.732
G1 X134.647 Y108.901 E.0713
G1 X134.112 Y108.885
G1 X135.263 Y107.734 E.07021
G1 X134.71 Y107.736
G1 X134.092 Y108.354 E.03769
; WIPE_START
M204 S10000
G1 X134.71 Y107.736 E-.33214
G1 X135.263 Y107.734 E-.21021
G1 X134.858 Y108.139 E-.21765
; WIPE_END
G1 E-.04 F1800
G1 X139.903 Y113.866 Z1.44 F30000
G1 X142.258 Y116.54 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
G1 X141.94 Y116.947 E.01267
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X141.451 Y117.437 I-3.509 J-3.015 E.01986
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X141.263 Y117.584 E.00604
; LINE_WIDTH: 0.248541
G1 F12000
G1 X141.074 Y117.732 E.00499
; LINE_WIDTH: 0.208882
G1 X140.886 Y117.88 E.00394
; WIPE_START
G1 X141.074 Y117.732 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.888 Y110.42 Z1.44 F30000
G1 X138.458 Y108.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
G1 X138.305 Y108.922 E.00237
G1 X138.244 Y108.981 E.00123
G1 X138.301 Y109.131 E.00232
; WIPE_START
G1 X138.244 Y108.981 E-.29779
G1 X138.305 Y108.922 E-.1581
G1 X138.458 Y108.981 E-.30412
; WIPE_END
G1 E-.04 F1800
G1 X142.191 Y109.028 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
G1 X142.097 Y108.895 E.00114
; WIPE_START
G1 X142.191 Y109.028 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.483 Y102.357 Z1.44 F30000
G1 X136.384 Y98.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.036 Y100.189 I16.729 J-15.522 E.09184
G3 X142.566 Y104.25 I-343.514 J387.669 E.24213
G3 X142.536 Y106.107 I-148.096 J-1.41 E.0739
G3 X133.84 Y106.109 I-4.501 J-511.753 E.34615
G3 X133.852 Y104.447 I16.724 J-.702 E.06619
G3 X138.904 Y104.408 I4.214 J216.374 E.20107
G2 X139.608 Y104.342 I.029 J-3.481 E.02819
G2 X139.948 Y104.148 I-.524 J-1.314 E.01561
G2 X139.112 Y103.307 I-5.157 J4.285 E.04725
G3 X133.823 Y98.558 I221.017 J-251.441 E.28293
G3 X133.838 Y96.881 I23.532 J-.639 E.06674
G1 X133.852 Y96.772 E.0044
G3 X140.736 Y96.719 I4.847 J184.983 E.27401
G3 X142.565 Y96.766 I.053 J33.525 E.07286
G3 X142.592 Y98.445 I-7.316 J.957 E.06697
G3 X141.278 Y98.49 I-1.1 J-12.874 E.05238
G2 X137.021 Y98.533 I-.553 J155.523 E.16944
G1 X136.444 Y98.576 E.02303
; WIPE_START
M204 S10000
G1 X137.075 Y99.3 E-.3651
G1 X137.838 Y100.006 E-.3949
; WIPE_END
G1 E-.04 F1800
G1 X141.497 Y105.911 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.353 Y105.055 E.0522
G1 X142.362 Y104.495
G1 X140.944 Y105.913 E.08648
G1 X140.391 Y105.914
G1 X142.155 Y104.15 E.10758
G1 X141.864 Y103.89
G1 X139.838 Y105.916 E.12359
G1 X139.284 Y105.918
G1 X141.574 Y103.629 E.1396
G1 X141.283 Y103.368
G1 X138.731 Y105.92 E.15561
G1 X138.178 Y105.922
G1 X139.548 Y104.552 E.08356
G1 X138.951 Y104.597
G1 X137.625 Y105.924 E.0809
G1 X137.071 Y105.925
G1 X138.394 Y104.602 E.08068
G1 X137.838 Y104.608
G1 X136.518 Y105.927 E.08046
G1 X135.965 Y105.929
G1 X137.281 Y104.613 E.08024
G1 X136.724 Y104.619
G1 X135.418 Y105.924 E.07962
G1 X134.872 Y105.919
G1 X136.167 Y104.624 E.07899
G1 X135.61 Y104.63
G1 X134.325 Y105.914 E.07835
G1 X134.033 Y105.656
G1 X135.053 Y104.635 E.06225
G1 X134.497 Y104.64
G1 X134.025 Y105.112 E.02875
; WIPE_START
M204 S10000
G1 X134.497 Y104.64 E-.2534
G1 X135.053 Y104.635 E-.21161
G1 X134.504 Y105.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M73 P86 R1
G1 X140.091 Y104.009 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.992 Y103.108 E.05497
G1 X140.701 Y102.847
G1 X139.833 Y103.716 E.05297
G1 X139.55 Y103.447
G1 X140.411 Y102.586 E.0525
G1 X140.12 Y102.326
G1 X139.267 Y103.179 E.05203
G1 X138.976 Y102.918
G1 X139.829 Y102.065 E.05203
G1 X139.538 Y101.804
G1 X138.685 Y102.658 E.05206
G1 X138.394 Y102.398
G1 X139.248 Y101.543 E.05209
G1 X138.957 Y101.283
G1 X138.102 Y102.138 E.05213
G1 X137.811 Y101.877
G1 X138.666 Y101.022 E.05216
G1 X138.376 Y100.761
G1 X137.52 Y101.617 E.05219
G1 X137.228 Y101.357
G1 X138.085 Y100.501 E.05223
G1 X137.796 Y100.238
G1 X136.937 Y101.097 E.05236
G1 X136.646 Y100.837
G1 X137.509 Y99.973 E.05266
G1 X137.223 Y99.708
G1 X136.355 Y100.577 E.05296
G1 X136.063 Y100.317
G1 X136.937 Y99.443 E.05326
G1 X136.666 Y99.162
G1 X135.772 Y100.056 E.05455
G1 X135.481 Y99.796
G1 X136.396 Y98.881 E.05584
G1 X136.126 Y98.599
G1 X135.189 Y99.536 E.05713
; WIPE_START
M204 S10000
G1 X136.126 Y98.599 E-.50342
G1 X136.396 Y98.881 E-.14819
G1 X136.195 Y99.082 E-.10839
; WIPE_END
G1 E-.04 F1800
G1 X141.956 Y98.283 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.426 Y97.814 E.02862
G1 X142.415 Y97.273
G1 X141.402 Y98.286 E.06175
G1 X140.848 Y98.289
G1 X142.192 Y96.945 E.08198
G1 X141.655 Y96.931
G1 X140.294 Y98.292 E.08301
G1 X139.74 Y98.295
G1 X141.111 Y96.924 E.08361
G1 X140.564 Y96.919
G1 X139.185 Y98.297 E.08406
G1 X138.631 Y98.3
G1 X140.012 Y96.919 E.0842
G1 X139.46 Y96.92
G1 X138.074 Y98.306 E.08451
G1 X137.511 Y98.318
G1 X138.908 Y96.921 E.08519
G1 X138.356 Y96.921
G1 X136.932 Y98.345 E.08682
G1 X136.343 Y98.383
G1 X137.804 Y96.922 E.08911
G1 X137.252 Y96.922
G1 X134.898 Y99.276 E.14354
G1 X134.607 Y99.016
G1 X136.7 Y96.923 E.12764
G1 X136.142 Y96.929
G1 X134.321 Y98.75 E.11106
G1 X134.036 Y98.484
G1 X135.581 Y96.939 E.09417
G1 X135.019 Y96.95
G1 X134.023 Y97.945 E.0607
G1 X134.024 Y97.393
G1 X134.457 Y96.96 E.02641
; WIPE_START
M204 S10000
G1 X134.024 Y97.393 E-.23277
G1 X134.023 Y97.945 E-.20976
G1 X134.614 Y97.354 E-.31746
; WIPE_END
G1 E-.04 F1800
G1 X139.267 Y103.405 Z1.44 F30000
G1 X139.995 Y104.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
G1 X139.848 Y104.464 E.00142
; LINE_WIDTH: 0.175957
G1 X139.701 Y104.576 E.00237
; LINE_WIDTH: 0.201899
G1 X139.686 Y104.586 E.00029
G1 X139.538 Y104.541 E.00242
; WIPE_START
G1 X139.686 Y104.586 E-.67784
G1 X139.701 Y104.576 E-.08216
; WIPE_END
G1 E-.04 F1800
G1 X137.437 Y98.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
G1 X137.208 Y98.345 E.0016
; WIPE_START
G1 X137.437 Y98.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.341 Y97.199 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
G1 X142.368 Y97.121 E.00099
G1 X142.36 Y96.935 E.0022
; WIPE_START
G1 X142.368 Y97.121 E-.52509
G1 X142.341 Y97.199 E-.23491
; WIPE_END
G1 E-.04 F1800
G1 X138.742 Y90.468 Z1.44 F30000
G1 X137.195 Y87.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X136.437 Y87.472 I-.574 J1.386 E.03079
G2 X135.741 Y87.593 I-.084 J1.577 E.02836
G2 X135.565 Y88.004 I.348 J.393 E.0184
G2 X135.604 Y92.761 I75.618 J1.756 E.18939
G2 X135.874 Y93.489 I1.017 J.037 E.03169
G2 X136.403 Y93.677 I.589 J-.817 E.02266
G2 X139.91 Y93.704 I1.993 J-31.538 E.13965
G2 X140.684 Y93.326 I0 J-.981 E.0355
G2 X140.797 Y92.704 I-1.47 J-.588 E.02535
G2 X140.883 Y85.787 I-279.296 J-6.958 E.27531
G1 X142.533 Y85.787 E.06566
G3 X142.508 Y93.468 I-292.858 J2.87 E.3057
G3 X141.088 Y95.192 I-2.955 J-.986 E.09092
G3 X139.766 Y95.434 I-1.34 J-3.583 E.05377
G3 X136.237 Y95.407 I-1.436 J-43.481 E.14052
G3 X134.559 Y94.568 I.087 J-2.271 E.07696
G3 X133.872 Y92.928 I1.813 J-1.723 E.07234
G3 X133.832 Y90.475 I53.037 J-2.107 E.09768
G1 X133.857 Y85.786 E.18664
G3 X138.64 Y85.769 I3.283 J248.828 E.19039
G3 X139.065 Y85.798 I-.008 J3.262 E.01696
G3 X139.11 Y89.762 I-46.497 J2.518 E.15785
G3 X139.066 Y90.383 I-5.189 J-.059 E.02481
G3 X137.368 Y90.336 I-.148 J-25.479 E.0676
G2 X137.303 Y87.926 I-41.619 J-.083 E.096
G2 X137.225 Y87.627 I-.747 J.038 E.01238
; WIPE_START
M204 S10000
G1 X137.07 Y87.518 E-.07197
G1 X136.959 Y87.494 E-.04294
G1 X136.437 Y87.472 E-.19855
G1 X136.037 Y87.504 E-.15249
G1 X135.9 Y87.53 E-.05324
G1 X135.741 Y87.593 E-.06473
G1 X135.63 Y87.719 E-.06378
G1 X135.594 Y87.816 E-.03939
G1 X135.565 Y88.004 E-.07241
G1 X135.565 Y88.005 E-.00049
; WIPE_END
G1 E-.04 F1800
G1 X140.045 Y94.185 Z1.44 F30000
G1 X140.717 Y95.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.263 Y93.566 E.09428
G1 X142.323 Y92.954
G1 X140.067 Y95.21 E.13755
G1 X139.487 Y95.239
G1 X142.329 Y92.396 E.17331
G1 X142.336 Y91.839
G1 X140.924 Y93.251 E.0861
G1 X140.999 Y92.624
G1 X142.342 Y91.281 E.08188
G1 X142.342 Y90.729
G1 X141.014 Y92.057 E.08099
G1 X141.02 Y91.5
G1 X142.341 Y90.179 E.08056
G1 X142.34 Y89.628
G1 X141.026 Y90.942 E.08013
G1 X141.032 Y90.385
G1 X142.339 Y89.078 E.0797
G1 X142.338 Y88.527
G1 X141.038 Y89.827 E.07926
G1 X141.045 Y89.27
G1 X142.337 Y87.977 E.07883
G1 X142.336 Y87.426
G1 X141.051 Y88.712 E.0784
G1 X141.057 Y88.155
G1 X142.335 Y86.876 E.07797
G1 X142.334 Y86.326
G1 X141.063 Y87.597 E.07754
G1 X141.069 Y87.04
G1 X142.122 Y85.987 E.06419
G1 X141.57 Y85.987
G1 X141.075 Y86.482 E.03019
; WIPE_START
M204 S10000
G1 X141.57 Y85.987 E-.26609
G1 X142.122 Y85.987 E-.20954
G1 X141.593 Y86.516 E-.28438
; WIPE_END
G1 E-.04 F1800
G1 X138.907 Y89.753 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.481 Y90.179 E.02599
G1 X137.948 Y90.161
G1 X138.918 Y89.191 E.05915
G1 X138.919 Y88.638
G1 X137.56 Y89.997 E.08285
G1 X137.548 Y89.458
G1 X138.917 Y88.089 E.0835
G1 X138.916 Y87.539
G1 X137.536 Y88.919 E.08415
G1 X137.524 Y88.379
G1 X138.914 Y86.989 E.0848
G1 X138.897 Y86.455
G1 X137.491 Y87.86 E.08572
G1 X137.357 Y87.444
G1 X138.819 Y85.981 E.0892
G1 X138.279 Y85.97
G1 X136.955 Y87.294 E.08076
G1 X136.425 Y87.273
G1 X137.726 Y85.971 E.07934
G1 X137.172 Y85.973
G1 X135.785 Y87.361 E.0846
; WIPE_START
M204 S10000
G1 X137.172 Y85.973 E-.7455
G1 X137.211 Y85.973 E-.0145
; WIPE_END
G1 E-.04 F1800
G1 X140.069 Y93.05 Z1.44 F30000
G1 X140.372 Y93.802 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.928 Y95.246 E.0881
G1 X138.368 Y95.254
G1 X139.712 Y93.911 E.08192
G1 X139.139 Y93.932
G1 X137.812 Y95.259 E.08092
G1 X137.269 Y95.251
G1 X138.586 Y93.934 E.08035
G1 X138.042 Y93.927
G1 X136.735 Y95.234 E.07973
G1 X136.214 Y95.203
G1 X137.498 Y93.919 E.07827
G1 X136.954 Y93.912
G1 X135.742 Y95.124 E.0739
G1 X135.351 Y94.964
G1 X136.435 Y93.879 E.06613
G1 X135.979 Y93.784
G1 X135.027 Y94.736 E.05804
G1 X134.744 Y94.467
G1 X135.657 Y93.554 E.05569
G1 X135.469 Y93.191
G1 X134.494 Y94.166 E.05948
G1 X134.289 Y93.819
G1 X135.408 Y92.701 E.0682
G1 X135.381 Y92.177
G1 X134.143 Y93.414 E.07546
G1 X134.082 Y92.924
G1 X135.375 Y91.631 E.07887
M73 P87 R1
G1 X135.369 Y91.085
G1 X134.05 Y92.405 E.08046
G1 X134.04 Y91.862
G1 X135.364 Y90.539 E.08069
G1 X135.358 Y89.994
G1 X134.031 Y91.32 E.08091
G1 X134.033 Y90.767
G1 X135.352 Y89.448 E.08044
G1 X135.347 Y88.902
G1 X134.036 Y90.213 E.07994
G1 X134.038 Y89.659
G1 X135.358 Y88.339 E.08048
G1 X135.422 Y87.723
G1 X134.041 Y89.105 E.08425
G1 X134.043 Y88.551
G1 X136.619 Y85.975 E.15706
G1 X136.066 Y85.977
G1 X134.046 Y87.997 E.12316
G1 X134.048 Y87.443
G1 X135.512 Y85.979 E.08926
G1 X134.959 Y85.981
G1 X134.051 Y86.889 E.05536
; WIPE_START
M204 S10000
G1 X134.959 Y85.981 E-.48788
G1 X135.512 Y85.979 E-.21029
G1 X135.397 Y86.094 E-.06183
; WIPE_END
G1 E-.04 F1800
G1 X135.365 Y88.608 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
G1 X135.273 Y88.828 E.00201
; WIPE_START
G1 X135.365 Y88.608 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.709 Y87.285 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
G2 X135.4 Y87.586 I1.969 J2.335 E.00719
G1 X135.425 Y87.726 E.00237
; WIPE_START
G1 X135.4 Y87.586 E-.18799
G1 X135.58 Y87.393 E-.34899
G1 X135.709 Y87.285 E-.22302
; WIPE_END
G1 E-.04 F1800
G1 X142.262 Y86.253 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
G1 X142.299 Y86.164 E.00121
G1 X142.298 Y85.967 E.00246
; WIPE_START
G1 X142.299 Y86.164 E-.50978
G1 X142.262 Y86.253 E-.25022
; WIPE_END
G1 E-.04 F1800
G1 X141.087 Y92.13 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
G1 X140.991 Y92.356 E.00158
G1 X140.997 Y93.323 F30000
; LINE_WIDTH: 0.191182
G1 F12000
G3 X140.62 Y93.734 I-1.683 J-1.165 E.00811
; LINE_WIDTH: 0.214865
G1 X140.44 Y93.869 E.00385
G1 X139.985 Y93.891 F30000
; LINE_WIDTH: 0.127375
G1 F12000
G3 X139.787 Y93.986 I-1.8 J-3.502 E.00163
; WIPE_START
G1 X139.985 Y93.891 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.693 Y94.443 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
G3 X141.423 Y94.713 I-2.696 J-2.428 E.00216
; OBJECT_ID: 169
; WIPE_START
G1 X141.693 Y94.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
G1 X140.177 Y101.923 Z1.44 F30000
G1 X129.063 Y156.744 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.76 Y156.5 I-.333 J.103 E.01643
G2 X124.623 Y156.446 I-3.136 J81.101 E.16471
G3 X123.665 Y156.425 I.177 J-30.547 E.03815
G3 X123.67 Y154.849 I19.174 J-.726 E.06274
G3 X132.321 Y154.845 I4.486 J339.234 E.34435
G3 X132.283 Y156.718 I-16.043 J.61 E.07458
G2 X127.3 Y160.235 I92.351 J136.117 E.24278
G2 X127.285 Y160.766 I.228 J.272 E.0239
G2 X128.254 Y161.521 I5.136 J-5.599 E.04895
G3 X130.744 Y163.261 I-62.508 J92.047 E.1209
G3 X132.287 Y164.333 I-20.556 J31.239 E.07479
G3 X132.306 Y166.238 I-9.92 J1.052 E.07596
G3 X123.664 Y166.206 I-2.371 J-525.515 E.34398
G3 X123.666 Y164.622 I20.563 J-.763 E.06308
G2 X128.479 Y164.583 I1.29 J-138.139 E.19157
G2 X128.939 Y164.444 I.068 J-.606 E.01968
G2 X128.849 Y163.961 I-.269 J-.199 E.02192
G1 X128.683 Y163.834 E.0083
G3 X124.198 Y160.652 I529.335 J-750.724 E.2189
G1 X124.023 Y160.514 E.00886
G3 X127.929 Y157.755 I118.625 J163.795 E.19034
G2 X128.969 Y156.982 I-17.05 J-24.021 E.05157
G1 X129.035 Y156.902 E.00415
G1 X129.053 Y156.803 E.00398
; WIPE_START
M204 S10000
G1 X128.993 Y156.61 E-.07674
G1 X128.916 Y156.543 E-.039
G1 X128.76 Y156.5 E-.0612
G1 X127.289 Y156.459 E-.55924
G1 X127.227 Y156.458 E-.02383
; WIPE_END
G1 E-.04 F1800
G1 X129.514 Y158.398 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.124 Y155.788 E.15914
G1 X132.136 Y155.225
G1 X127.608 Y159.753 E.27612
; WIPE_START
M204 S10000
G1 X129.022 Y158.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.135 Y165.151 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X131.247 Y166.039 E.05412
G1 X130.696 Y166.039
G1 X132.113 Y164.621 E.08645
G1 X131.887 Y164.297
G1 X130.144 Y166.039 E.10624
G1 X129.593 Y166.039
G1 X131.562 Y164.07 E.12008
G1 X131.238 Y163.843
G1 X129.042 Y166.039 E.13391
G1 X128.49 Y166.039
G1 X130.913 Y163.616 E.14775
G1 X130.589 Y163.389
G1 X127.939 Y166.039 E.16158
G1 X127.388 Y166.038
G1 X128.659 Y164.767 E.07751
G1 X128.084 Y164.791
G1 X126.841 Y166.033 E.07578
G1 X126.294 Y166.029
G1 X127.521 Y164.802 E.07479
G1 X126.961 Y164.811
G1 X125.748 Y166.024 E.07401
G1 X125.201 Y166.02
G1 X126.408 Y164.812 E.07362
G1 X125.855 Y164.814
G1 X124.654 Y166.015 E.07324
G1 X124.107 Y166.011
G1 X125.302 Y164.816 E.07285
G1 X124.748 Y164.818
G1 X123.854 Y165.713 E.05456
; WIPE_START
M204 S10000
G1 X124.748 Y164.818 E-.48084
G1 X125.302 Y164.816 E-.21023
G1 X125.173 Y164.944 E-.06893
; WIPE_END
G1 E-.04 F1800
G1 X129.208 Y164.218 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.264 Y163.162 E.06441
G1 X129.94 Y162.935
G1 X129.023 Y163.852 E.05591
G1 X128.707 Y163.616
G1 X129.615 Y162.708 E.05539
G1 X129.291 Y162.481
G1 X128.384 Y163.388 E.05528
G1 X128.062 Y163.159
G1 X128.966 Y162.254 E.05517
G1 X128.642 Y162.027
G1 X127.739 Y162.93 E.05506
G1 X127.416 Y162.701
G1 X128.317 Y161.8 E.05495
G1 X127.993 Y161.573
G1 X127.093 Y162.473 E.05484
G1 X126.771 Y162.244
G1 X127.668 Y161.347 E.05473
G1 X127.358 Y161.105
G1 X126.448 Y162.015 E.05551
G1 X126.125 Y161.787
G1 X127.087 Y160.825 E.05865
G1 X126.981 Y160.38
G1 X125.803 Y161.558 E.07183
G1 X125.48 Y161.329
G1 X131.767 Y155.042 E.38339
G1 X131.218 Y155.04
G1 X125.157 Y161.1 E.36959
G1 X124.836 Y160.87
G1 X127.165 Y158.542 E.142
; WIPE_START
M204 S10000
G1 X125.75 Y159.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.176 Y156.53 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.669 Y155.037 E.09103
G1 X130.12 Y155.035
G1 X128.84 Y156.315 E.07809
G1 X128.32 Y156.283
G1 X129.571 Y155.032 E.07629
G1 X129.022 Y155.03
G1 X127.775 Y156.277 E.07603
G1 X127.231 Y156.27
G1 X128.473 Y155.027 E.07577
G1 X127.924 Y155.025
G1 X126.686 Y156.263 E.07551
G1 X126.141 Y156.256
G1 X127.375 Y155.022 E.07525
G1 X126.824 Y155.023
G1 X125.597 Y156.25 E.07482
G1 X125.052 Y156.243
G1 X126.268 Y155.027 E.07413
G1 X125.712 Y155.032
G1 X124.507 Y156.236 E.07344
G1 X123.963 Y156.23
G1 X125.156 Y155.037 E.07275
G1 X124.6 Y155.041
G1 X123.854 Y155.787 E.04547
; WIPE_START
M204 S10000
G1 X124.6 Y155.041 E-.40074
G1 X125.156 Y155.037 E-.21129
G1 X124.88 Y155.312 E-.14797
; WIPE_END
G1 E-.04 F1800
G1 X128.238 Y162.166 Z1.44 F30000
G1 X129.278 Y164.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
G3 X129.217 Y164.414 I-.668 J-.248 E.0019
; LINE_WIDTH: 0.147062
G1 X129.154 Y164.498 E.001
; LINE_WIDTH: 0.120275
G1 X129.092 Y164.581 E.00069
G1 X129.082 Y164.59 F30000
; LINE_WIDTH: 0.135238
G1 F12000
G3 X128.743 Y164.851 I-1.789 J-1.977 E.00356
; WIPE_START
G1 X129.082 Y164.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.546 Y159.691 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M73 P88 R1
G1 X127.294 Y159.914 E.00687
; LINE_WIDTH: 0.210796
G2 X126.912 Y160.312 I.765 J1.117 E.00926
; WIPE_START
G1 X127.043 Y160.137 E-.29908
G1 X127.294 Y159.914 E-.46092
; WIPE_END
G1 E-.04 F1800
G1 X126.144 Y159.257 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
G1 X125.954 Y159.416 E.00187
; LINE_WIDTH: 0.171253
G1 X125.764 Y159.575 E.00304
; LINE_WIDTH: 0.214175
G1 X125.574 Y159.734 E.00422
; LINE_WIDTH: 0.257097
G1 X125.384 Y159.893 E.00539
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X125.195 Y160.052 E.00657
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X125.005 Y160.211 E.00775
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X124.815 Y160.37 E.00892
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X124.497 Y160.643 E.01686
; WIPE_START
G1 X124.815 Y160.37 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.012 Y157.939 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
G1 X127.789 Y158.129 E.00227
; LINE_WIDTH: 0.176706
G1 X127.566 Y158.318 E.00377
; LINE_WIDTH: 0.223354
G1 X127.342 Y158.508 E.0053
; LINE_WIDTH: 0.251283
G1 X127.227 Y158.604 E.00317
; WIPE_START
G1 X127.342 Y158.508 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.451 Y158.336 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
G1 X129.249 Y158.505 E.00514
; LINE_WIDTH: 0.198217
G1 X129.046 Y158.674 E.00404
; LINE_WIDTH: 0.161001
G1 X128.871 Y158.823 E.00257
; LINE_WIDTH: 0.124914
G1 X128.695 Y158.972 E.00165
; WIPE_START
G1 X128.871 Y158.823 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.149 Y155.061 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
G1 X131.785 Y155.06 E.00298
; WIPE_START
G1 X132.149 Y155.061 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.118 Y156.362 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
G1 X131.89 Y156.552 E.01135
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X131.662 Y156.743 E.00984
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X131.435 Y156.933 E.00833
; LINE_WIDTH: 0.267734
G1 F12000
G1 X131.207 Y157.124 E.00682
; LINE_WIDTH: 0.221773
G1 X130.979 Y157.314 E.00531
; LINE_WIDTH: 0.175812
G1 X130.751 Y157.505 E.0038
; LINE_WIDTH: 0.129851
G1 X130.523 Y157.695 E.00229
; WIPE_START
G1 X130.751 Y157.505 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.71 Y151.773 Z1.44 F30000
G1 X125.298 Y151.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.765 Y151.772 E.02631
G1 X132.329 Y151.839 E.26126
G3 X132.309 Y153.39 I-13 J.608 E.06177
G3 X126.122 Y153.398 I-3.399 J-245.281 E.24626
G3 X124.805 Y153.024 I-.048 J-2.338 E.05531
G3 X123.735 Y151.669 I.909 J-1.818 E.07097
G3 X123.657 Y150.458 I10.929 J-1.314 E.04834
G3 X123.697 Y144.621 I121.66 J-2.071 E.23232
G3 X123.83 Y144.142 I1.388 J.127 E.01991
G3 X125.428 Y142.786 I2.157 J.923 E.08645
G3 X126.344 Y142.667 I.851 J2.971 E.0369
G3 X130.423 Y142.649 I2.997 J209.491 E.16235
G3 X132.273 Y142.684 I-.321 J64.879 E.07366
G3 X132.278 Y144.285 I-14.645 J.846 E.06375
G3 X125.714 Y144.322 I-4.443 J-206.777 E.26126
G1 X125.255 Y144.851 E.02789
G1 X125.297 Y151.245 E.25449
; WIPE_START
M204 S10000
G1 X125.765 Y151.772 E-.26789
G1 X127.06 Y151.785 E-.49211
; WIPE_END
G1 E-.04 F1800
G1 X131.408 Y153.195 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.136 Y152.468 E.04436
G1 X132.016 Y152.036
G1 X130.854 Y153.198 E.07086
G1 X130.3 Y153.2
G1 X131.471 Y152.03 E.07137
G1 X130.925 Y152.024
G1 X129.746 Y153.203 E.07187
G1 X129.192 Y153.206
G1 X130.379 Y152.019 E.07238
G1 X129.833 Y152.013
G1 X128.638 Y153.208 E.07288
G1 X128.084 Y153.211
G1 X129.287 Y152.008 E.07339
G1 X128.742 Y152.002
G1 X127.53 Y153.214 E.07389
G1 X126.983 Y153.209
G1 X128.196 Y151.996 E.07393
G1 X127.65 Y151.991
G1 X126.439 Y153.202 E.07387
G1 X125.91 Y153.179
G1 X127.104 Y151.985 E.07281
G1 X126.558 Y151.98
G1 X125.438 Y153.1 E.06831
G1 X125.054 Y152.932
G1 X126.013 Y151.974 E.05843
G1 X125.573 Y151.862
G1 X124.713 Y152.722 E.05246
G1 X124.405 Y152.479
G1 X125.297 Y151.586 E.05442
G1 X125.098 Y151.234
G1 X124.157 Y152.175 E.05735
G1 X123.978 Y151.803
G1 X125.094 Y150.687 E.06809
G1 X125.091 Y150.139
G1 X123.897 Y151.332 E.07278
G1 X123.866 Y150.812
G1 X125.087 Y149.591 E.07446
G1 X125.083 Y149.043
G1 X123.859 Y150.267 E.07466
G1 X123.852 Y149.723
G1 X125.08 Y148.495 E.07486
G1 X125.076 Y147.948
G1 X123.847 Y149.177 E.07494
G1 X123.848 Y148.625
G1 X125.073 Y147.4 E.0747
G1 X125.069 Y146.852
G1 X123.848 Y148.073 E.07446
G1 X123.848 Y147.521
G1 X125.065 Y146.304 E.07423
G1 X125.062 Y145.756
G1 X123.849 Y146.969 E.07396
G1 X123.856 Y146.411
G1 X125.058 Y145.209 E.07331
; WIPE_START
M204 S10000
G1 X123.856 Y146.411 E-.64606
G1 X123.852 Y146.711 E-.11394
; WIPE_END
G1 E-.04 F1800
G1 X131.092 Y144.295 Z1.44 F30000
G1 X131.682 Y144.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.093 Y143.688 E.02505
G1 X132.087 Y143.142
G1 X131.118 Y144.111 E.05909
G1 X130.559 Y144.119
G1 X131.803 Y142.875 E.07588
G1 X131.262 Y142.864
G1 X130.007 Y144.119 E.07654
G1 X129.455 Y144.12
G1 X130.721 Y142.854 E.0772
G1 X130.175 Y142.848
G1 X128.904 Y144.12 E.07755
G1 X128.352 Y144.121
G1 X129.623 Y142.849 E.07751
G1 X129.071 Y142.85
G1 X127.8 Y144.121 E.07748
G1 X127.248 Y144.121
G1 X128.518 Y142.851 E.07745
G1 X127.966 Y142.852
G1 X126.696 Y144.122 E.07742
G1 X126.145 Y144.122
G1 X127.413 Y142.853 E.07738
G1 X126.861 Y142.854
G1 X123.863 Y145.852 E.18284
G1 X123.87 Y145.294
G1 X126.29 Y142.874 E.14759
G1 X125.685 Y142.927
G1 X123.899 Y144.713 E.10891
; WIPE_START
M204 S10000
G1 X125.314 Y143.299 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.253 Y143.053 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
G1 X125.151 Y143.124 E.00117
; LINE_WIDTH: 0.179713
G1 X125.049 Y143.196 E.00165
; LINE_WIDTH: 0.214273
G1 X124.948 Y143.268 E.00212
; LINE_WIDTH: 0.246896
G1 X124.835 Y143.358 E.00298
; LINE_WIDTH: 0.29318
G1 F11031.832
G2 X124.289 Y143.896 I2.887 J3.484 E.01978
; LINE_WIDTH: 0.258333
G1 F12000
G1 X124.127 Y144.106 E.00582
; LINE_WIDTH: 0.223912
G1 X123.965 Y144.317 E.00481
; WIPE_START
G1 X124.127 Y144.106 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.121 Y139.464 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.822 Y139.613 I.624 J-1.213 E.0289
G2 X130.538 Y139.314 I-.032 J-1.084 E.03157
G1 X130.62 Y139.193 E.00582
G2 X130.678 Y133.396 I-181.781 J-4.692 E.23073
G3 X130.722 Y131.239 I43.647 J-.185 E.08587
G3 X132.283 Y131.235 I.812 J10.002 E.06221
G3 X132.255 Y139.4 I-150.39 J3.57 E.32504
G3 X131.383 Y140.727 I-2.124 J-.446 E.0647
G3 X129.536 Y141.224 I-1.577 J-2.178 E.07786
G3 X127.37 Y139.915 I.09 J-2.595 E.10519
G3 X127.215 Y138.872 I3.454 J-1.046 E.04214
G3 X127.147 Y133.428 I1915.931 J-26.801 E.21671
G2 X127.024 Y132.773 I-1.59 J-.042 E.02673
G2 X126.509 Y132.495 I-.586 J.471 E.02392
G2 X125.702 Y132.524 I-.334 J1.963 E.03237
G2 X125.355 Y133.127 I.387 J.624 E.02885
G2 X125.287 Y134.473 I9.909 J1.176 E.05371
G1 X125.264 Y140.817 E.25248
G1 X123.68 Y140.786 E.06304
G3 X123.667 Y133.3 I461.903 J-4.514 E.29795
G3 X124.181 Y131.682 I2.375 J-.136 E.06908
G3 X126.224 Y130.863 I1.884 J1.741 E.09055
G1 X126.457 Y130.869 E.00927
G3 X127.32 Y131.011 I.016 J2.586 E.03496
G3 X128.633 Y132.246 I-1.104 J2.491 E.07314
G3 X128.806 Y133.712 I-5.63 J1.405 E.05892
G3 X128.835 Y135.304 I-54.389 J1.79 E.06335
G1 X128.846 Y139.277 E.15815
G2 X129.068 Y139.435 I.899 J-1.026 E.01088
; WIPE_START
M204 S10000
G1 X129.295 Y139.551 E-.09681
G1 X129.546 Y139.608 E-.09788
G1 X129.822 Y139.613 E-.10507
G1 X129.966 Y139.594 E-.05506
G1 X130.212 Y139.527 E-.09672
G1 X130.414 Y139.424 E-.08624
G1 X130.538 Y139.314 E-.0631
G1 X130.62 Y139.193 E-.05561
G1 X130.627 Y138.92 E-.10352
; WIPE_END
G1 E-.04 F1800
G1 X124.698 Y140.606 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X125.066 Y140.238 E.02247
G1 X125.068 Y139.684
G1 X124.157 Y140.596 E.05557
G1 X123.878 Y140.323
G1 X125.07 Y139.131 E.07271
G1 X125.072 Y138.577
G1 X123.876 Y139.774 E.07295
G1 X123.874 Y139.224
G1 X125.074 Y138.024 E.07318
G1 X125.076 Y137.47
G1 X123.873 Y138.674 E.07341
G1 X123.871 Y138.125
G1 X125.078 Y136.917 E.07364
G1 X125.08 Y136.364
G1 X123.869 Y137.575 E.07387
G1 X123.867 Y137.025
G1 X125.082 Y135.81 E.0741
G1 X125.084 Y135.257
G1 X123.865 Y136.476 E.07433
G1 X123.864 Y135.926
G1 X125.087 Y134.703 E.07457
G1 X125.095 Y134.143
G1 X123.862 Y135.376 E.07522
G1 X123.86 Y134.827
G1 X125.114 Y133.573 E.07645
G1 X125.187 Y132.949
G1 X123.858 Y134.277 E.081
; WIPE_START
M204 S10000
G1 X125.187 Y132.949 E-.71381
G1 X125.173 Y133.07 E-.04619
; WIPE_END
G1 E-.04 F1800
G1 X129.39 Y139.431 Z1.44 F30000
G1 X130.406 Y140.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.059 Y139.311 E.10081
G1 X132.08 Y138.738
G1 X129.796 Y141.022 E.13933
G1 X129.275 Y140.991
G1 X132.098 Y138.169 E.17212
G1 X132.103 Y137.612
G1 X130.827 Y138.889 E.07785
G1 X130.839 Y138.324
G1 X132.109 Y137.055 E.07741
G1 X132.114 Y136.498
G1 X130.852 Y137.76 E.07696
G1 X130.864 Y137.197
G1 X132.12 Y135.941 E.07656
G1 X132.121 Y135.389
G1 X130.867 Y136.643 E.07648
G1 X130.869 Y136.089
G1 X132.119 Y134.839 E.07624
M73 P89 R1
G1 X132.118 Y134.289
G1 X130.872 Y135.535 E.076
G1 X130.874 Y134.981
G1 X132.116 Y133.739 E.07577
G1 X132.115 Y133.189
G1 X130.876 Y134.427 E.07553
G1 X130.879 Y133.874
G1 X132.114 Y132.639 E.07529
G1 X132.103 Y132.098
G1 X130.881 Y133.32 E.0745
G1 X130.884 Y132.766
G1 X132.091 Y131.559 E.07361
G1 X131.695 Y131.403
G1 X130.89 Y132.209 E.04912
; WIPE_START
M204 S10000
G1 X131.695 Y131.403 E-.43285
G1 X132.091 Y131.559 E-.16162
G1 X131.783 Y131.867 E-.16553
; WIPE_END
G1 E-.04 F1800
G1 X130.035 Y139.297 Z1.44 F30000
G1 X129.917 Y139.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.831 Y140.885 E.06627
G1 X128.453 Y140.711
G1 X129.38 Y139.783 E.05655
G1 X128.994 Y139.619
G1 X128.127 Y140.485 E.05283
G1 X127.844 Y140.217
G1 X128.666 Y139.395 E.05012
G1 X128.645 Y138.864
G1 X127.599 Y139.911 E.06381
G1 X127.471 Y139.487
G1 X128.644 Y138.315 E.07149
G1 X128.642 Y137.765
G1 X127.425 Y138.982 E.0742
G1 X127.405 Y138.45
G1 X128.641 Y137.215 E.07533
G1 X128.639 Y136.665
G1 X127.393 Y137.911 E.07596
G1 X127.384 Y137.368
G1 X128.637 Y136.115 E.07643
G1 X128.636 Y135.565
G1 X127.38 Y136.821 E.07658
G1 X127.376 Y136.274
G1 X128.63 Y135.02 E.07646
G1 X128.62 Y134.478
G1 X127.372 Y135.726 E.07609
G1 X127.368 Y135.179
G1 X128.61 Y133.937 E.07573
G1 X128.585 Y133.411
G1 X127.364 Y134.631 E.07442
G1 X127.36 Y134.084
G1 X128.549 Y132.895 E.07249
G1 X128.475 Y132.418
G1 X127.343 Y133.55 E.06903
G1 X127.313 Y133.028
G1 X128.29 Y132.051 E.05958
G1 X128.032 Y131.758
G1 X127.159 Y132.631 E.05322
G1 X126.851 Y132.388
G1 X127.743 Y131.496 E.0544
G1 X127.407 Y131.28
G1 X126.4 Y132.287 E.06143
G1 X125.853 Y132.283
G1 X127.012 Y131.124 E.07069
G1 X126.51 Y131.074
G1 X123.863 Y133.721 E.16142
G1 X123.876 Y133.156
G1 X125.964 Y131.069 E.1273
G1 X125.298 Y131.183
G1 X123.962 Y132.519 E.08145
; WIPE_START
M204 S10000
G1 X125.298 Y131.183 E-.71775
G1 X125.407 Y131.165 E-.04226
; WIPE_END
G1 E-.04 F1800
G1 X130.05 Y137.223 Z1.44 F30000
G1 X131.958 Y139.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
G1 X131.938 Y139.746 E.00021
; LINE_WIDTH: 0.130511
G1 X131.878 Y139.828 E.00079
; LINE_WIDTH: 0.163118
G1 X131.819 Y139.911 E.00116
; LINE_WIDTH: 0.199555
G1 X131.663 Y140.095 E.00371
; LINE_WIDTH: 0.222554
G3 X131.226 Y140.525 I-4.507 J-4.14 E.01103
; LINE_WIDTH: 0.185394
G1 X131.02 Y140.697 E.00372
; LINE_WIDTH: 0.147212
G1 X130.941 Y140.754 E.00094
; LINE_WIDTH: 0.120327
G1 X130.861 Y140.812 E.00065
; WIPE_START
G1 X130.941 Y140.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.131 Y139.86 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
G1 X129.905 Y139.786 E.00235
G1 X130.246 Y139.723 F30000
; LINE_WIDTH: 0.140994
G1 F12000
G1 X129.994 Y139.874 E.00263
; WIPE_START
G1 X130.246 Y139.723 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.564 Y133.39 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
G1 X128.564 Y133.156 E.00128
G1 X128.468 Y132.386 F30000
; LINE_WIDTH: 0.128952
G1 F12000
G2 X128.371 Y132.246 I-.611 J.321 E.0013
; WIPE_START
G1 X128.468 Y132.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.167 Y131.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
G2 X127.046 Y131.133 I-.288 J.191 E.00089
; WIPE_START
G1 X127.167 Y131.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.861 Y132.291 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
G1 X125.709 Y132.254 E.00247
; LINE_WIDTH: 0.183556
G1 X125.612 Y132.32 E.0016
; LINE_WIDTH: 0.123039
G2 X125.355 Y132.543 I1.035 J1.454 E.00237
; LINE_WIDTH: 0.126364
G1 X125.292 Y132.624 E.00075
; LINE_WIDTH: 0.162472
G2 X125.113 Y132.875 I2.197 J1.762 E.0035
; WIPE_START
G1 X125.292 Y132.624 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.581 Y131.594 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
G2 X124.237 Y131.94 I4.051 J4.378 E.00276
; WIPE_START
G1 X124.581 Y131.594 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.976 Y126.196 Z1.44 F30000
G1 X130.605 Y125.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.341 Y125.344 I-.284 J.067 E.01474
G2 X124.076 Y125.255 I-26.442 J1649.858 E.24939
G3 X123.673 Y125.24 I.022 J-5.853 E.01605
G3 X123.67 Y123.66 I14.303 J-.823 E.06293
G3 X129.516 Y123.616 I5.095 J291.895 E.23273
G2 X130.377 Y123.556 I.034 J-5.676 E.03436
G2 X130.639 Y123.25 I-.068 J-.324 E.01723
G2 X130.695 Y119.763 I-406.372 J-8.259 E.13881
G3 X130.713 Y119.533 I2.353 J.068 E.00917
G3 X131.892 Y119.496 I1.021 J13.405 E.04697
G3 X132.239 Y119.512 I-.064 J4.937 E.01381
G3 X132.306 Y124.958 I-134.811 J4.385 E.21679
G3 X132.282 Y129.413 I-151.211 J1.42 E.17733
G3 X130.716 Y129.418 I-.808 J-8.036 E.06242
G3 X130.672 Y126.84 I46.671 J-2.088 E.10265
G2 X130.613 Y125.627 I-6.849 J-.276 E.04839
; WIPE_START
M204 S10000
G1 X130.574 Y125.485 E-.05615
G1 X130.505 Y125.407 E-.03945
G1 X130.426 Y125.362 E-.03455
G1 X130.341 Y125.344 E-.03293
G1 X128.77 Y125.322 E-.59691
; WIPE_END
G1 E-.04 F1800
G1 X132.092 Y128.801 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X131.64 Y129.253 E.02757
G1 X131.101 Y129.24
G1 X132.1 Y128.241 E.06094
G1 X132.103 Y127.687
G1 X130.892 Y128.898 E.07386
G1 X130.879 Y128.36
G1 X132.104 Y127.135 E.07469
G1 X132.104 Y126.583
G1 X130.876 Y127.811 E.07489
G1 X130.873 Y127.262
G1 X132.105 Y126.031 E.0751
G1 X132.106 Y125.479
G1 X130.868 Y126.716 E.07545
G1 X130.855 Y126.178
G1 X132.106 Y124.927 E.07629
G1 X132.103 Y124.378
G1 X130.826 Y125.655 E.07786
G1 X130.655 Y125.275
G1 X132.1 Y123.83 E.08814
G1 X132.097 Y123.281
G1 X130.238 Y125.141 E.11342
G1 X129.702 Y125.125
G1 X132.095 Y122.733 E.14592
G1 X132.092 Y122.184
G1 X130.748 Y123.528 E.08195
G1 X130.848 Y122.876
G1 X132.089 Y121.635 E.07564
G1 X132.081 Y121.092
G1 X130.863 Y122.31 E.07425
G1 X130.872 Y121.749
G1 X132.069 Y120.552 E.07302
G1 X132.058 Y120.012
G1 X130.876 Y121.194 E.07208
G1 X130.88 Y120.638
G1 X131.823 Y119.696 E.05749
G1 X131.266 Y119.701
G1 X130.884 Y120.083 E.0233
; WIPE_START
M204 S10000
G1 X131.266 Y119.701 E-.20535
G1 X131.823 Y119.696 E-.21152
G1 X131.184 Y120.334 E-.34314
; WIPE_END
G1 E-.04 F1800
G1 X130.612 Y123.664 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X129.156 Y125.12 E.08881
G1 X128.61 Y125.115
G1 X129.926 Y123.798 E.08026
G1 X129.357 Y123.816
G1 X128.064 Y125.109 E.07885
G1 X127.518 Y125.104
G1 X128.803 Y123.819 E.07837
G1 X128.249 Y123.821
G1 X126.972 Y125.098 E.07788
G1 X126.426 Y125.093
G1 X127.695 Y123.824 E.0774
G1 X127.141 Y123.826
G1 X125.88 Y125.087 E.07692
G1 X125.334 Y125.082
G1 X126.587 Y123.828 E.07644
G1 X126.033 Y123.831
G1 X124.796 Y125.068 E.07547
G1 X124.258 Y125.055
G1 X125.48 Y123.833 E.0745
G1 X124.923 Y123.838
G1 X123.862 Y124.9 E.06474
G1 X123.848 Y124.362
G1 X124.363 Y123.848 E.03135
; WIPE_START
M204 S10000
G1 X123.848 Y124.362 E-.27625
G1 X123.862 Y124.9 E-.20462
G1 X124.381 Y124.38 E-.27913
; WIPE_END
G1 E-.04 F1800
G1 X130.905 Y125.733 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
G1 X130.831 Y125.926 E.00124
; WIPE_START
G1 X130.905 Y125.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.966 Y128.972 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
G2 X130.932 Y129.25 I.322 J.18 E.00321
; WIPE_START
G1 X130.929 Y129.068 E-.48684
G1 X130.966 Y128.972 E-.27316
; WIPE_END
G1 E-.04 F1800
G1 X129.933 Y121.41 Z1.44 F30000
G1 X128.262 Y109.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
M73 P90 R1
G1 X128.225 Y113.773 E.18346
G3 X128.184 Y114.735 I-7.48 J.162 E.03836
G3 X126.576 Y114.698 I-.644 J-7.029 E.06416
G3 X126.586 Y110.603 I121.596 J-1.771 E.16301
G2 X126.559 Y109.663 I-13.087 J-.102 E.03745
G1 X126.449 Y109.162 E.02039
G3 X123.657 Y109.078 I5.107 J-215.305 E.1112
G3 X123.676 Y107.539 I54.131 J-.09 E.06127
G3 X129.193 Y107.521 I3.795 J326.245 E.21959
G3 X130.737 Y107.658 I.188 J6.651 E.06184
G3 X132.295 Y109.757 I-.652 J2.112 E.11134
G3 X132.297 Y115.93 I-102.109 J3.109 E.24574
G3 X132.034 Y117.013 I-2.194 J.041 E.04485
G3 X130.375 Y118.165 I-2.332 J-1.59 E.08216
G3 X127.096 Y118.204 I-2.187 J-45.48 E.13057
G1 X123.676 Y118.183 E.13612
G1 X123.645 Y116.606 E.06281
G2 X129.179 Y116.565 I-.575 J-457.684 E.22026
G2 X130.247 Y116.482 I.116 J-5.399 E.04272
G2 X130.616 Y116.05 I-.172 J-.52 E.02378
G2 X130.667 Y115.245 I-5.184 J-.731 E.03211
G2 X130.656 Y110.135 I-371.979 J-1.754 E.20342
G2 X130.565 Y109.484 I-2.204 J-.022 E.02624
G2 X129.833 Y109.137 I-.67 J.467 E.03372
G2 X128.322 Y109.16 I-.499 J17.008 E.06019
; WIPE_START
M204 S10000
G1 X128.28 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.077 Y116.133 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X130.242 Y117.968 E.1119
G1 X129.665 Y117.993
G1 X132.115 Y115.544 E.14938
G1 X132.127 Y114.981
G1 X129.107 Y118.001 E.18417
G1 X128.55 Y118.006
G1 X129.814 Y116.742 E.07705
G1 X129.247 Y116.758
G1 X128.001 Y118.003 E.07596
G1 X127.452 Y118.001
G1 X128.684 Y116.769 E.07513
G1 X128.125 Y116.776
G1 X126.903 Y117.998 E.07451
G1 X126.354 Y117.996
G1 X127.57 Y116.78 E.07415
G1 X127.015 Y116.784
G1 X125.805 Y117.993 E.07378
G1 X125.256 Y117.991
G1 X126.46 Y116.787 E.07342
G1 X125.905 Y116.791
G1 X124.707 Y117.989 E.07305
G1 X124.158 Y117.986
G1 X125.35 Y116.794 E.07269
G1 X124.795 Y116.798
G1 X123.867 Y117.726 E.05663
G1 X123.856 Y117.186
G1 X124.24 Y116.801 E.02344
; WIPE_START
M204 S10000
G1 X123.856 Y117.186 E-.20655
G1 X123.867 Y117.726 E-.20552
G1 X124.514 Y117.079 E-.34793
; WIPE_END
G1 E-.04 F1800
G1 X127.579 Y114.566 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.01 Y114.134 E.02632
G1 X128.028 Y113.566
G1 X127.05 Y114.543 E.05963
G1 X126.766 Y114.275
G1 X128.032 Y113.01 E.07718
G1 X128.036 Y112.454
G1 X126.76 Y113.73 E.07781
G1 X126.766 Y113.173
G1 X128.041 Y111.898 E.07773
G1 X128.045 Y111.342
G1 X126.772 Y112.616 E.07765
G1 X126.777 Y112.059
G1 X128.049 Y110.787 E.07757
G1 X128.054 Y110.231
G1 X126.783 Y111.501 E.07749
G1 X126.783 Y110.95
G1 X128.058 Y109.675 E.07775
G1 X128.063 Y109.119
G1 X126.78 Y110.401 E.07819
; WIPE_START
M204 S10000
G1 X128.063 Y109.119 E-.68903
G1 X128.061 Y109.306 E-.07097
; WIPE_END
G1 E-.04 F1800
G1 X132.138 Y114.418 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.849 Y115.707 E.07863
G1 X130.866 Y115.138
G1 X132.142 Y113.863 E.07777
G1 X132.143 Y113.31
G1 X130.867 Y114.586 E.07779
G1 X130.868 Y114.034
G1 X132.143 Y112.758 E.0778
G1 X132.144 Y112.206
G1 X130.868 Y113.482 E.07782
G1 X130.869 Y112.93
G1 X132.138 Y111.66 E.07742
G1 X132.13 Y111.118
G1 X130.869 Y112.378 E.07686
G1 X130.87 Y111.826
G1 X132.121 Y110.575 E.0763
G1 X132.104 Y110.041
G1 X130.871 Y111.274 E.07521
G1 X130.862 Y110.731
G1 X132.077 Y109.516 E.07412
G1 X131.975 Y109.066
G1 X130.847 Y110.195 E.06881
G1 X130.815 Y109.675
G1 X131.791 Y108.699 E.05952
G1 X131.545 Y108.394
G1 X130.664 Y109.275 E.05371
G1 X130.343 Y109.044
G1 X131.242 Y108.145 E.05483
G1 X130.896 Y107.94
G1 X129.888 Y108.948 E.06146
G1 X129.351 Y108.934
G1 X130.479 Y107.805 E.0688
G1 X129.984 Y107.749
G1 X128.784 Y108.949 E.07317
G1 X128.217 Y108.965
G1 X129.452 Y107.73 E.07531
G1 X128.909 Y107.722
G1 X126.768 Y109.862 E.13055
G1 X126.701 Y109.378
G1 X128.356 Y107.723 E.10091
G1 X127.802 Y107.725
G1 X126.561 Y108.966 E.07568
G1 X126.026 Y108.95
G1 X127.249 Y107.727 E.07458
G1 X126.696 Y107.729
G1 X125.491 Y108.934 E.07349
G1 X124.956 Y108.918
G1 X126.143 Y107.73 E.0724
G1 X125.59 Y107.732
G1 X124.42 Y108.901 E.0713
G1 X123.885 Y108.885
G1 X125.036 Y107.734 E.07021
G1 X124.483 Y107.736
G1 X123.865 Y108.354 E.03769
; WIPE_START
M204 S10000
G1 X124.483 Y107.736 E-.33214
G1 X125.036 Y107.734 E-.21021
G1 X124.631 Y108.139 E-.21765
; WIPE_END
G1 E-.04 F1800
G1 X129.676 Y113.866 Z1.44 F30000
G1 X132.032 Y116.54 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
G1 X131.714 Y116.947 E.01267
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X131.225 Y117.437 I-3.509 J-3.015 E.01986
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X131.036 Y117.584 E.00604
; LINE_WIDTH: 0.248541
G1 F12000
G1 X130.848 Y117.732 E.00499
; LINE_WIDTH: 0.208882
G1 X130.66 Y117.88 E.00394
; WIPE_START
G1 X130.848 Y117.732 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.662 Y110.42 Z1.44 F30000
G1 X128.232 Y108.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
G1 X128.079 Y108.922 E.00237
G1 X128.018 Y108.981 E.00123
G1 X128.075 Y109.131 E.00232
; WIPE_START
G1 X128.018 Y108.981 E-.29779
G1 X128.079 Y108.922 E-.1581
G1 X128.232 Y108.981 E-.30412
; WIPE_END
G1 E-.04 F1800
G1 X131.965 Y109.028 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
G1 X131.871 Y108.895 E.00114
; WIPE_START
G1 X131.965 Y109.028 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.257 Y102.357 Z1.44 F30000
G1 X126.158 Y98.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X127.81 Y100.189 I16.729 J-15.522 E.09184
G3 X132.339 Y104.25 I-343.514 J387.669 E.24213
G3 X132.31 Y106.107 I-148.096 J-1.41 E.0739
G3 X123.613 Y106.109 I-4.501 J-511.753 E.34615
G3 X123.626 Y104.447 I16.724 J-.702 E.06619
G3 X128.677 Y104.408 I4.214 J216.374 E.20107
G2 X129.381 Y104.342 I.029 J-3.481 E.02819
G2 X129.721 Y104.148 I-.524 J-1.314 E.01561
G2 X128.886 Y103.307 I-5.157 J4.285 E.04725
G3 X123.597 Y98.558 I221.017 J-251.441 E.28293
G3 X123.611 Y96.881 I23.532 J-.639 E.06674
G1 X123.626 Y96.772 E.0044
G3 X130.509 Y96.719 I4.847 J184.983 E.27401
G3 X132.339 Y96.766 I.053 J33.525 E.07286
G3 X132.366 Y98.445 I-7.316 J.957 E.06697
G3 X131.051 Y98.49 I-1.1 J-12.874 E.05238
G2 X126.795 Y98.533 I-.553 J155.523 E.16944
G1 X126.218 Y98.576 E.02303
; WIPE_START
M204 S10000
G1 X126.849 Y99.3 E-.3651
G1 X127.612 Y100.006 E-.3949
; WIPE_END
G1 E-.04 F1800
G1 X131.271 Y105.911 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.127 Y105.055 E.0522
G1 X132.136 Y104.495
G1 X130.718 Y105.913 E.08648
G1 X130.164 Y105.914
G1 X131.929 Y104.15 E.10758
G1 X131.638 Y103.89
G1 X129.611 Y105.916 E.12359
G1 X129.058 Y105.918
G1 X131.347 Y103.629 E.1396
G1 X131.056 Y103.368
G1 X128.505 Y105.92 E.15561
G1 X127.951 Y105.922
G1 X129.322 Y104.552 E.08356
G1 X128.725 Y104.597
G1 X127.398 Y105.924 E.0809
G1 X126.845 Y105.925
G1 X128.168 Y104.602 E.08068
G1 X127.611 Y104.608
G1 X126.292 Y105.927 E.08046
G1 X125.738 Y105.929
G1 X127.054 Y104.613 E.08024
G1 X126.497 Y104.619
G1 X125.192 Y105.924 E.07962
G1 X124.645 Y105.919
G1 X125.941 Y104.624 E.07899
G1 X125.384 Y104.63
G1 X124.099 Y105.914 E.07835
G1 X123.806 Y105.656
G1 X124.827 Y104.635 E.06225
G1 X124.27 Y104.64
G1 X123.799 Y105.112 E.02875
; WIPE_START
M204 S10000
G1 X124.27 Y104.64 E-.2534
G1 X124.827 Y104.635 E-.21161
G1 X124.278 Y105.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M73 P91 R1
G1 X129.864 Y104.009 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.766 Y103.108 E.05497
G1 X130.475 Y102.847
G1 X129.606 Y103.716 E.05297
G1 X129.323 Y103.447
G1 X130.184 Y102.586 E.0525
G1 X129.893 Y102.326
G1 X129.04 Y103.179 E.05203
G1 X128.75 Y102.918
G1 X129.603 Y102.065 E.05203
G1 X129.312 Y101.804
G1 X128.458 Y102.658 E.05206
G1 X128.167 Y102.398
G1 X129.021 Y101.543 E.05209
G1 X128.731 Y101.283
G1 X127.876 Y102.138 E.05213
G1 X127.584 Y101.877
G1 X128.44 Y101.022 E.05216
G1 X128.149 Y100.761
G1 X127.293 Y101.617 E.05219
G1 X127.002 Y101.357
G1 X127.858 Y100.501 E.05223
G1 X127.569 Y100.238
G1 X126.711 Y101.097 E.05236
G1 X126.419 Y100.837
G1 X127.283 Y99.973 E.05266
G1 X126.997 Y99.708
G1 X126.128 Y100.577 E.05296
G1 X125.837 Y100.317
G1 X126.71 Y99.443 E.05326
G1 X126.44 Y99.162
G1 X125.546 Y100.056 E.05455
G1 X125.254 Y99.796
G1 X126.17 Y98.881 E.05584
G1 X125.9 Y98.599
G1 X124.963 Y99.536 E.05713
; WIPE_START
M204 S10000
G1 X125.9 Y98.599 E-.50342
G1 X126.17 Y98.881 E-.14819
G1 X125.968 Y99.082 E-.10839
; WIPE_END
G1 E-.04 F1800
G1 X131.73 Y98.283 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.199 Y97.814 E.02862
G1 X132.188 Y97.273
G1 X131.176 Y98.286 E.06175
G1 X130.622 Y98.289
G1 X131.966 Y96.945 E.08198
G1 X131.429 Y96.931
G1 X130.067 Y98.292 E.08301
G1 X129.513 Y98.295
G1 X130.884 Y96.924 E.08361
G1 X130.337 Y96.919
G1 X128.959 Y98.297 E.08406
G1 X128.405 Y98.3
G1 X129.785 Y96.919 E.0842
G1 X129.233 Y96.92
G1 X127.847 Y98.306 E.08451
G1 X127.284 Y98.318
G1 X128.681 Y96.921 E.08519
G1 X128.129 Y96.921
G1 X126.706 Y98.345 E.08682
G1 X126.116 Y98.383
G1 X127.577 Y96.922 E.08911
G1 X127.025 Y96.922
G1 X124.672 Y99.276 E.14354
G1 X124.38 Y99.016
G1 X126.473 Y96.923 E.12764
G1 X125.916 Y96.929
G1 X124.095 Y98.75 E.11106
G1 X123.81 Y98.484
G1 X125.354 Y96.939 E.09417
G1 X124.792 Y96.95
G1 X123.797 Y97.945 E.0607
G1 X123.798 Y97.393
G1 X124.231 Y96.96 E.02641
; WIPE_START
M204 S10000
G1 X123.798 Y97.393 E-.23277
G1 X123.797 Y97.945 E-.20976
G1 X124.388 Y97.354 E-.31746
; WIPE_END
G1 E-.04 F1800
G1 X129.04 Y103.405 Z1.44 F30000
G1 X129.768 Y104.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
G1 X129.622 Y104.464 E.00142
; LINE_WIDTH: 0.175957
G1 X129.475 Y104.576 E.00237
; LINE_WIDTH: 0.201899
G1 X129.459 Y104.586 E.00029
G1 X129.311 Y104.541 E.00242
; WIPE_START
G1 X129.459 Y104.586 E-.67784
G1 X129.475 Y104.576 E-.08216
; WIPE_END
G1 E-.04 F1800
G1 X127.211 Y98.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
G1 X126.981 Y98.345 E.0016
; WIPE_START
G1 X127.211 Y98.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.114 Y97.199 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
G1 X132.142 Y97.121 E.00099
G1 X132.134 Y96.935 E.0022
; WIPE_START
G1 X132.142 Y97.121 E-.52509
G1 X132.114 Y97.199 E-.23491
; WIPE_END
G1 E-.04 F1800
G1 X128.516 Y90.468 Z1.44 F30000
G1 X126.969 Y87.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X126.211 Y87.472 I-.574 J1.386 E.03079
G2 X125.515 Y87.593 I-.084 J1.577 E.02836
G2 X125.339 Y88.004 I.348 J.393 E.0184
G2 X125.378 Y92.761 I75.618 J1.756 E.18939
G2 X125.647 Y93.489 I1.017 J.037 E.03169
G2 X126.177 Y93.677 I.589 J-.817 E.02266
G2 X129.683 Y93.704 I1.993 J-31.538 E.13965
G2 X130.458 Y93.326 I0 J-.981 E.0355
G2 X130.57 Y92.704 I-1.47 J-.588 E.02535
G2 X130.657 Y85.787 I-279.296 J-6.958 E.27531
G1 X132.307 Y85.787 E.06566
G3 X132.281 Y93.468 I-292.858 J2.87 E.3057
G3 X130.862 Y95.192 I-2.955 J-.986 E.09092
G3 X129.54 Y95.434 I-1.34 J-3.583 E.05377
G3 X126.01 Y95.407 I-1.436 J-43.481 E.14052
G3 X124.333 Y94.568 I.087 J-2.271 E.07696
G3 X123.646 Y92.928 I1.813 J-1.723 E.07234
G3 X123.605 Y90.475 I53.037 J-2.107 E.09768
G1 X123.63 Y85.786 E.18664
G3 X128.413 Y85.769 I3.283 J248.828 E.19039
G3 X128.838 Y85.798 I-.008 J3.262 E.01696
G3 X128.884 Y89.762 I-46.497 J2.518 E.15785
G3 X128.84 Y90.383 I-5.189 J-.059 E.02481
G3 X127.142 Y90.336 I-.148 J-25.479 E.0676
G2 X127.077 Y87.926 I-41.619 J-.083 E.096
G2 X126.998 Y87.627 I-.747 J.038 E.01238
; WIPE_START
M204 S10000
G1 X126.843 Y87.518 E-.07197
G1 X126.733 Y87.494 E-.04294
G1 X126.211 Y87.472 E-.19855
G1 X125.811 Y87.504 E-.15249
G1 X125.673 Y87.53 E-.05324
G1 X125.515 Y87.593 E-.06473
G1 X125.404 Y87.719 E-.06378
G1 X125.368 Y87.816 E-.03939
G1 X125.339 Y88.004 E-.07241
G1 X125.338 Y88.005 E-.00049
; WIPE_END
G1 E-.04 F1800
G1 X129.818 Y94.185 Z1.44 F30000
G1 X130.49 Y95.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.036 Y93.566 E.09428
G1 X132.096 Y92.954
G1 X129.841 Y95.21 E.13755
G1 X129.261 Y95.239
G1 X132.103 Y92.396 E.17331
G1 X132.109 Y91.839
G1 X130.697 Y93.251 E.0861
G1 X130.773 Y92.624
G1 X132.116 Y91.281 E.08188
G1 X132.116 Y90.729
G1 X130.788 Y92.057 E.08099
G1 X130.794 Y91.5
G1 X132.115 Y90.179 E.08056
G1 X132.114 Y89.628
G1 X130.8 Y90.942 E.08013
G1 X130.806 Y90.385
G1 X132.113 Y89.078 E.0797
G1 X132.112 Y88.527
G1 X130.812 Y89.827 E.07926
G1 X130.818 Y89.27
G1 X132.111 Y87.977 E.07883
G1 X132.11 Y87.426
G1 X130.824 Y88.712 E.0784
G1 X130.83 Y88.155
G1 X132.109 Y86.876 E.07797
G1 X132.108 Y86.326
G1 X130.836 Y87.597 E.07754
G1 X130.843 Y87.04
G1 X131.895 Y85.987 E.06419
G1 X131.344 Y85.987
G1 X130.849 Y86.482 E.03019
; WIPE_START
M204 S10000
G1 X131.344 Y85.987 E-.26609
G1 X131.895 Y85.987 E-.20954
G1 X131.366 Y86.516 E-.28438
; WIPE_END
G1 E-.04 F1800
G1 X128.681 Y89.753 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.255 Y90.179 E.02599
G1 X127.721 Y90.161
G1 X128.691 Y89.191 E.05915
G1 X128.692 Y88.638
G1 X127.334 Y89.997 E.08285
G1 X127.322 Y89.458
G1 X128.691 Y88.089 E.0835
G1 X128.689 Y87.539
G1 X127.309 Y88.919 E.08415
G1 X127.297 Y88.379
G1 X128.688 Y86.989 E.0848
G1 X128.671 Y86.455
G1 X127.265 Y87.86 E.08572
G1 X127.13 Y87.444
G1 X128.593 Y85.981 E.0892
G1 X128.053 Y85.97
G1 X126.728 Y87.294 E.08076
G1 X126.198 Y87.273
G1 X127.499 Y85.971 E.07934
G1 X126.946 Y85.973
G1 X125.559 Y87.361 E.0846
; WIPE_START
M204 S10000
G1 X126.946 Y85.973 E-.7455
G1 X126.984 Y85.973 E-.0145
; WIPE_END
G1 E-.04 F1800
G1 X129.842 Y93.05 Z1.44 F30000
G1 X130.146 Y93.802 Z1.44
G1 Z1.04
M73 P91 R0
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.701 Y95.246 E.0881
G1 X128.142 Y95.254
G1 X129.485 Y93.911 E.08192
G1 X128.913 Y93.932
G1 X127.586 Y95.259 E.08092
G1 X127.042 Y95.251
G1 X128.36 Y93.934 E.08035
G1 X127.816 Y93.927
G1 X126.508 Y95.234 E.07973
G1 X125.988 Y95.203
G1 X127.271 Y93.919 E.07827
G1 X126.727 Y93.912
G1 X125.515 Y95.124 E.0739
G1 X125.124 Y94.964
G1 X126.209 Y93.879 E.06613
G1 X125.752 Y93.784
G1 X124.8 Y94.736 E.05804
G1 X124.518 Y94.467
G1 X125.431 Y93.554 E.05569
G1 X125.243 Y93.191
G1 X124.268 Y94.166 E.05948
G1 X124.063 Y93.819
G1 X125.181 Y92.701 E.0682
G1 X125.154 Y92.177
G1 X123.917 Y93.414 E.07546
G1 X123.855 Y92.924
M73 P92 R0
G1 X125.148 Y91.631 E.07887
G1 X125.143 Y91.085
G1 X123.823 Y92.405 E.08046
G1 X123.814 Y91.862
G1 X125.137 Y90.539 E.08069
G1 X125.132 Y89.994
G1 X123.805 Y91.32 E.08091
G1 X123.807 Y90.767
G1 X125.126 Y89.448 E.08044
G1 X125.12 Y88.902
G1 X123.809 Y90.213 E.07994
G1 X123.812 Y89.659
G1 X125.132 Y88.339 E.08048
G1 X125.196 Y87.723
G1 X123.814 Y89.105 E.08425
G1 X123.817 Y88.551
G1 X126.393 Y85.975 E.15706
G1 X125.839 Y85.977
G1 X123.819 Y87.997 E.12316
G1 X123.822 Y87.443
G1 X125.286 Y85.979 E.08926
G1 X124.732 Y85.981
G1 X123.825 Y86.889 E.05536
; WIPE_START
M204 S10000
G1 X124.732 Y85.981 E-.48788
G1 X125.286 Y85.979 E-.21029
G1 X125.171 Y86.094 E-.06183
; WIPE_END
G1 E-.04 F1800
G1 X125.139 Y88.608 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
G1 X125.046 Y88.828 E.00201
; WIPE_START
G1 X125.139 Y88.608 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.483 Y87.285 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
G2 X125.173 Y87.586 I1.969 J2.335 E.00719
G1 X125.198 Y87.726 E.00237
; WIPE_START
G1 X125.173 Y87.586 E-.18799
G1 X125.354 Y87.393 E-.34899
G1 X125.483 Y87.285 E-.22302
; WIPE_END
G1 E-.04 F1800
G1 X132.035 Y86.253 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
G1 X132.072 Y86.164 E.00121
G1 X132.072 Y85.967 E.00246
; WIPE_START
G1 X132.072 Y86.164 E-.50978
G1 X132.035 Y86.253 E-.25022
; WIPE_END
G1 E-.04 F1800
G1 X130.86 Y92.13 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
G1 X130.764 Y92.356 E.00158
G1 X130.77 Y93.323 F30000
; LINE_WIDTH: 0.191182
G1 F12000
G3 X130.393 Y93.734 I-1.683 J-1.165 E.00811
; LINE_WIDTH: 0.214865
G1 X130.214 Y93.869 E.00385
G1 X129.758 Y93.891 F30000
; LINE_WIDTH: 0.127375
G1 F12000
G3 X129.56 Y93.986 I-1.8 J-3.502 E.00163
; WIPE_START
G1 X129.758 Y93.891 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.467 Y94.443 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
G3 X131.197 Y94.713 I-2.696 J-2.428 E.00216
; OBJECT_ID: 331
; WIPE_START
G1 X131.467 Y94.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
G1 X129.951 Y101.923 Z1.44 F30000
G1 X118.837 Y156.744 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.534 Y156.5 I-.333 J.103 E.01643
G2 X114.397 Y156.446 I-3.136 J81.101 E.16471
G3 X113.438 Y156.425 I.177 J-30.547 E.03815
G3 X113.444 Y154.849 I19.174 J-.726 E.06274
G3 X122.095 Y154.845 I4.486 J339.234 E.34435
G3 X122.057 Y156.718 I-16.043 J.61 E.07458
G2 X117.074 Y160.235 I92.351 J136.117 E.24278
G2 X117.058 Y160.766 I.228 J.272 E.0239
G2 X118.028 Y161.521 I5.136 J-5.599 E.04895
G3 X120.517 Y163.261 I-62.508 J92.047 E.1209
G3 X122.06 Y164.333 I-20.556 J31.239 E.07479
G3 X122.079 Y166.238 I-9.92 J1.052 E.07596
G3 X113.438 Y166.206 I-2.371 J-525.515 E.34398
G3 X113.44 Y164.622 I20.563 J-.763 E.06308
G2 X118.252 Y164.583 I1.29 J-138.139 E.19157
G2 X118.713 Y164.444 I.068 J-.606 E.01968
G2 X118.622 Y163.961 I-.269 J-.199 E.02192
G1 X118.457 Y163.834 E.0083
G3 X113.972 Y160.652 I529.335 J-750.724 E.2189
G1 X113.796 Y160.514 E.00886
G3 X117.702 Y157.755 I118.625 J163.795 E.19034
G2 X118.742 Y156.982 I-17.05 J-24.021 E.05157
G1 X118.808 Y156.902 E.00415
G1 X118.826 Y156.803 E.00398
; WIPE_START
M204 S10000
G1 X118.767 Y156.61 E-.07674
G1 X118.689 Y156.543 E-.039
G1 X118.534 Y156.5 E-.0612
G1 X117.063 Y156.459 E-.55924
G1 X117 Y156.458 E-.02383
; WIPE_END
G1 E-.04 F1800
G1 X119.288 Y158.398 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.897 Y155.788 E.15914
G1 X121.909 Y155.225
G1 X117.381 Y159.753 E.27612
; WIPE_START
M204 S10000
G1 X118.796 Y158.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.908 Y165.151 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.021 Y166.039 E.05412
G1 X120.469 Y166.039
G1 X121.887 Y164.621 E.08645
G1 X121.66 Y164.297
G1 X119.918 Y166.039 E.10624
G1 X119.367 Y166.039
G1 X121.336 Y164.07 E.12008
G1 X121.011 Y163.843
G1 X118.815 Y166.039 E.13391
G1 X118.264 Y166.039
G1 X120.687 Y163.616 E.14775
G1 X120.362 Y163.389
G1 X117.713 Y166.039 E.16158
G1 X117.162 Y166.038
G1 X118.433 Y164.767 E.07751
G1 X117.858 Y164.791
G1 X116.615 Y166.033 E.07578
G1 X116.068 Y166.029
G1 X117.294 Y164.802 E.07479
G1 X116.735 Y164.811
G1 X115.521 Y166.024 E.07401
G1 X114.974 Y166.02
G1 X116.182 Y164.812 E.07362
G1 X115.628 Y164.814
G1 X114.427 Y166.015 E.07324
G1 X113.881 Y166.011
G1 X115.075 Y164.816 E.07285
G1 X114.522 Y164.818
G1 X113.627 Y165.713 E.05456
; WIPE_START
M204 S10000
G1 X114.522 Y164.818 E-.48084
G1 X115.075 Y164.816 E-.21023
G1 X114.947 Y164.944 E-.06893
; WIPE_END
G1 E-.04 F1800
G1 X118.982 Y164.218 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.038 Y163.162 E.06441
G1 X119.713 Y162.935
G1 X118.796 Y163.852 E.05591
G1 X118.481 Y163.616
G1 X119.389 Y162.708 E.05539
G1 X119.064 Y162.481
G1 X118.158 Y163.388 E.05528
G1 X117.835 Y163.159
G1 X118.74 Y162.254 E.05517
G1 X118.415 Y162.027
G1 X117.512 Y162.93 E.05506
G1 X117.19 Y162.701
G1 X118.091 Y161.8 E.05495
G1 X117.766 Y161.573
G1 X116.867 Y162.473 E.05484
G1 X116.544 Y162.244
G1 X117.442 Y161.347 E.05473
G1 X117.132 Y161.105
G1 X116.222 Y162.015 E.05551
G1 X115.899 Y161.787
G1 X116.861 Y160.825 E.05865
G1 X116.754 Y160.38
G1 X115.576 Y161.558 E.07183
G1 X115.254 Y161.329
G1 X121.541 Y155.042 E.38339
G1 X120.992 Y155.04
G1 X114.931 Y161.1 E.36959
G1 X114.61 Y160.87
G1 X116.938 Y158.542 E.142
; WIPE_START
M204 S10000
G1 X115.524 Y159.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.95 Y156.53 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.443 Y155.037 E.09103
G1 X119.894 Y155.035
G1 X118.613 Y156.315 E.07809
G1 X118.094 Y156.283
G1 X119.345 Y155.032 E.07629
G1 X118.796 Y155.03
G1 X117.549 Y156.277 E.07603
G1 X117.004 Y156.27
G1 X118.247 Y155.027 E.07577
G1 X117.698 Y155.025
G1 X116.46 Y156.263 E.07551
G1 X115.915 Y156.256
G1 X117.149 Y155.022 E.07525
G1 X116.597 Y155.023
G1 X115.37 Y156.25 E.07482
G1 X114.826 Y156.243
G1 X116.041 Y155.027 E.07413
G1 X115.485 Y155.032
G1 X114.281 Y156.236 E.07344
G1 X113.736 Y156.23
G1 X114.929 Y155.037 E.07275
G1 X114.373 Y155.041
G1 X113.628 Y155.787 E.04547
; WIPE_START
M204 S10000
G1 X114.373 Y155.041 E-.40074
G1 X114.929 Y155.037 E-.21129
G1 X114.654 Y155.312 E-.14797
; WIPE_END
G1 E-.04 F1800
G1 X118.012 Y162.166 Z1.44 F30000
G1 X119.052 Y164.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
G3 X118.99 Y164.414 I-.668 J-.248 E.0019
; LINE_WIDTH: 0.147062
G1 X118.928 Y164.498 E.001
; LINE_WIDTH: 0.120275
G1 X118.866 Y164.581 E.00069
G1 X118.855 Y164.59 F30000
; LINE_WIDTH: 0.135238
G1 F12000
G3 X118.516 Y164.851 I-1.789 J-1.977 E.00356
; WIPE_START
G1 X118.855 Y164.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.319 Y159.691 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M73 P93 R0
G1 X117.068 Y159.914 E.00687
; LINE_WIDTH: 0.210796
G2 X116.686 Y160.312 I.765 J1.117 E.00926
; WIPE_START
G1 X116.816 Y160.137 E-.29908
G1 X117.068 Y159.914 E-.46092
; WIPE_END
G1 E-.04 F1800
G1 X115.917 Y159.257 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
G1 X115.727 Y159.416 E.00187
; LINE_WIDTH: 0.171253
G1 X115.538 Y159.575 E.00304
; LINE_WIDTH: 0.214175
G1 X115.348 Y159.734 E.00422
; LINE_WIDTH: 0.257097
G1 X115.158 Y159.893 E.00539
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X114.968 Y160.052 E.00657
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X114.778 Y160.211 E.00775
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X114.589 Y160.37 E.00892
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X114.271 Y160.643 E.01686
; WIPE_START
G1 X114.589 Y160.37 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.786 Y157.939 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
G1 X117.563 Y158.129 E.00227
; LINE_WIDTH: 0.176706
G1 X117.34 Y158.318 E.00377
; LINE_WIDTH: 0.223354
G1 X117.116 Y158.508 E.0053
; LINE_WIDTH: 0.251283
G1 X117.001 Y158.604 E.00317
; WIPE_START
G1 X117.116 Y158.508 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.225 Y158.336 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
G1 X119.023 Y158.505 E.00514
; LINE_WIDTH: 0.198217
G1 X118.82 Y158.674 E.00404
; LINE_WIDTH: 0.161001
G1 X118.644 Y158.823 E.00257
; LINE_WIDTH: 0.124914
G1 X118.469 Y158.972 E.00165
; WIPE_START
G1 X118.644 Y158.823 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.923 Y155.061 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
G1 X121.559 Y155.06 E.00298
; WIPE_START
G1 X121.923 Y155.061 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.892 Y156.362 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
G1 X121.664 Y156.552 E.01135
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X121.436 Y156.743 E.00984
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X121.208 Y156.933 E.00833
; LINE_WIDTH: 0.267734
G1 F12000
G1 X120.98 Y157.124 E.00682
; LINE_WIDTH: 0.221773
G1 X120.752 Y157.314 E.00531
; LINE_WIDTH: 0.175812
G1 X120.524 Y157.505 E.0038
; LINE_WIDTH: 0.129851
G1 X120.297 Y157.695 E.00229
; WIPE_START
G1 X120.524 Y157.505 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.484 Y151.773 Z1.44 F30000
G1 X115.071 Y151.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.539 Y151.772 E.02631
G1 X122.102 Y151.839 E.26126
G3 X122.082 Y153.39 I-13 J.608 E.06177
G3 X115.896 Y153.398 I-3.399 J-245.281 E.24626
G3 X114.578 Y153.024 I-.048 J-2.338 E.05531
G3 X113.508 Y151.669 I.909 J-1.818 E.07097
G3 X113.43 Y150.458 I10.929 J-1.314 E.04834
G3 X113.471 Y144.621 I121.66 J-2.071 E.23232
G3 X113.604 Y144.142 I1.388 J.127 E.01991
G3 X115.201 Y142.786 I2.157 J.923 E.08645
G3 X116.117 Y142.667 I.851 J2.971 E.0369
G3 X120.196 Y142.649 I2.997 J209.491 E.16235
G3 X122.046 Y142.684 I-.321 J64.879 E.07366
G3 X122.051 Y144.285 I-14.645 J.846 E.06375
G3 X115.488 Y144.322 I-4.443 J-206.777 E.26126
G1 X115.029 Y144.851 E.02789
G1 X115.071 Y151.245 E.25449
; WIPE_START
M204 S10000
G1 X115.539 Y151.772 E-.26789
G1 X116.834 Y151.785 E-.49211
; WIPE_END
G1 E-.04 F1800
G1 X121.182 Y153.195 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.91 Y152.468 E.04436
G1 X121.79 Y152.036
G1 X120.628 Y153.198 E.07086
G1 X120.074 Y153.2
G1 X121.244 Y152.03 E.07137
G1 X120.698 Y152.024
G1 X119.52 Y153.203 E.07187
G1 X118.966 Y153.206
G1 X120.153 Y152.019 E.07238
G1 X119.607 Y152.013
G1 X118.412 Y153.208 E.07288
G1 X117.858 Y153.211
G1 X119.061 Y152.008 E.07339
G1 X118.515 Y152.002
G1 X117.303 Y153.214 E.07389
G1 X116.757 Y153.209
G1 X117.969 Y151.996 E.07393
G1 X117.424 Y151.991
G1 X116.212 Y153.202 E.07387
G1 X115.684 Y153.179
G1 X116.878 Y151.985 E.07281
G1 X116.332 Y151.98
G1 X115.212 Y153.1 E.06831
G1 X114.828 Y152.932
G1 X115.786 Y151.974 E.05843
G1 X115.347 Y151.862
G1 X114.486 Y152.722 E.05246
G1 X114.179 Y152.479
G1 X115.071 Y151.586 E.05442
G1 X114.871 Y151.234
G1 X113.931 Y152.175 E.05735
G1 X113.751 Y151.803
G1 X114.868 Y150.687 E.06809
G1 X114.864 Y150.139
G1 X113.671 Y151.332 E.07278
G1 X113.64 Y150.812
G1 X114.861 Y149.591 E.07446
G1 X114.857 Y149.043
G1 X113.633 Y150.267 E.07466
G1 X113.626 Y149.723
G1 X114.853 Y148.495 E.07486
G1 X114.85 Y147.948
G1 X113.621 Y149.177 E.07494
G1 X113.621 Y148.625
G1 X114.846 Y147.4 E.0747
G1 X114.842 Y146.852
G1 X113.621 Y148.073 E.07446
G1 X113.622 Y147.521
G1 X114.839 Y146.304 E.07423
G1 X114.835 Y145.756
G1 X113.622 Y146.969 E.07396
G1 X113.629 Y146.411
G1 X114.832 Y145.209 E.07331
; WIPE_START
M204 S10000
G1 X113.629 Y146.411 E-.64606
G1 X113.626 Y146.711 E-.11394
; WIPE_END
G1 E-.04 F1800
G1 X120.866 Y144.295 Z1.44 F30000
G1 X121.456 Y144.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.866 Y143.688 E.02505
G1 X121.861 Y143.142
G1 X120.892 Y144.111 E.05909
G1 X120.333 Y144.119
G1 X121.577 Y142.875 E.07588
G1 X121.036 Y142.864
G1 X119.781 Y144.119 E.07654
G1 X119.229 Y144.12
G1 X120.495 Y142.854 E.0772
G1 X119.949 Y142.848
G1 X118.677 Y144.12 E.07755
G1 X118.125 Y144.121
G1 X119.397 Y142.849 E.07751
G1 X118.844 Y142.85
G1 X117.574 Y144.121 E.07748
G1 X117.022 Y144.121
G1 X118.292 Y142.851 E.07745
G1 X117.739 Y142.852
G1 X116.47 Y144.122 E.07742
G1 X115.918 Y144.122
G1 X117.187 Y142.853 E.07738
G1 X116.635 Y142.854
G1 X113.636 Y145.852 E.18284
G1 X113.643 Y145.294
G1 X116.064 Y142.874 E.14759
G1 X115.459 Y142.927
G1 X113.673 Y144.713 E.10891
; WIPE_START
M204 S10000
G1 X115.087 Y143.299 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.027 Y143.053 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
G1 X114.925 Y143.124 E.00117
; LINE_WIDTH: 0.179713
G1 X114.823 Y143.196 E.00165
; LINE_WIDTH: 0.214273
G1 X114.721 Y143.268 E.00212
; LINE_WIDTH: 0.246896
G1 X114.609 Y143.358 E.00298
; LINE_WIDTH: 0.29318
G1 F11031.832
G2 X114.062 Y143.896 I2.887 J3.484 E.01978
; LINE_WIDTH: 0.258333
G1 F12000
G1 X113.9 Y144.106 E.00582
; LINE_WIDTH: 0.223912
G1 X113.739 Y144.317 E.00481
; WIPE_START
G1 X113.9 Y144.106 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.894 Y139.464 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.596 Y139.613 I.624 J-1.213 E.0289
G2 X120.312 Y139.314 I-.032 J-1.084 E.03157
G1 X120.394 Y139.193 E.00582
G2 X120.451 Y133.396 I-181.781 J-4.692 E.23073
G3 X120.495 Y131.239 I43.647 J-.185 E.08587
G3 X122.057 Y131.235 I.812 J10.002 E.06221
G3 X122.029 Y139.4 I-150.39 J3.57 E.32504
G3 X121.157 Y140.727 I-2.124 J-.446 E.0647
G3 X119.309 Y141.224 I-1.577 J-2.178 E.07786
G3 X117.143 Y139.915 I.09 J-2.595 E.10519
G3 X116.989 Y138.872 I3.454 J-1.046 E.04214
G3 X116.92 Y133.428 I1915.931 J-26.801 E.21671
G2 X116.798 Y132.773 I-1.59 J-.042 E.02673
G2 X116.283 Y132.495 I-.586 J.471 E.02392
G2 X115.476 Y132.524 I-.334 J1.963 E.03237
G2 X115.128 Y133.127 I.387 J.624 E.02885
G2 X115.06 Y134.473 I9.909 J1.176 E.05371
G1 X115.037 Y140.817 E.25248
G1 X113.454 Y140.786 E.06304
G3 X113.441 Y133.3 I461.903 J-4.514 E.29795
G3 X113.955 Y131.682 I2.375 J-.136 E.06908
G3 X115.998 Y130.863 I1.884 J1.741 E.09055
G1 X116.231 Y130.869 E.00927
G3 X117.093 Y131.011 I.016 J2.586 E.03496
G3 X118.407 Y132.246 I-1.104 J2.491 E.07314
G3 X118.579 Y133.712 I-5.63 J1.405 E.05892
G3 X118.608 Y135.304 I-54.389 J1.79 E.06335
G1 X118.619 Y139.277 E.15815
G2 X118.842 Y139.435 I.899 J-1.026 E.01088
; WIPE_START
M204 S10000
G1 X119.068 Y139.551 E-.09681
G1 X119.319 Y139.608 E-.09788
G1 X119.596 Y139.613 E-.10507
G1 X119.74 Y139.594 E-.05506
G1 X119.985 Y139.527 E-.09672
G1 X120.187 Y139.424 E-.08624
G1 X120.312 Y139.314 E-.0631
G1 X120.394 Y139.193 E-.05561
G1 X120.4 Y138.92 E-.10352
; WIPE_END
G1 E-.04 F1800
G1 X114.471 Y140.606 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X114.84 Y140.238 E.02247
G1 X114.842 Y139.684
G1 X113.931 Y140.596 E.05557
G1 X113.652 Y140.323
G1 X114.844 Y139.131 E.07271
G1 X114.846 Y138.577
G1 X113.65 Y139.774 E.07295
G1 X113.648 Y139.224
G1 X114.848 Y138.024 E.07318
G1 X114.85 Y137.47
G1 X113.646 Y138.674 E.07341
G1 X113.644 Y138.125
G1 X114.852 Y136.917 E.07364
G1 X114.854 Y136.364
G1 X113.643 Y137.575 E.07387
G1 X113.641 Y137.025
G1 X114.856 Y135.81 E.0741
G1 X114.858 Y135.257
G1 X113.639 Y136.476 E.07433
G1 X113.637 Y135.926
G1 X114.86 Y134.703 E.07457
G1 X114.869 Y134.143
G1 X113.636 Y135.376 E.07522
G1 X113.634 Y134.827
G1 X114.887 Y133.573 E.07645
G1 X114.96 Y132.949
G1 X113.632 Y134.277 E.081
; WIPE_START
M204 S10000
G1 X114.96 Y132.949 E-.71381
G1 X114.946 Y133.07 E-.04619
; WIPE_END
G1 E-.04 F1800
G1 X119.163 Y139.431 Z1.44 F30000
G1 X120.179 Y140.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.833 Y139.311 E.10081
G1 X121.854 Y138.738
G1 X119.569 Y141.022 E.13933
G1 X119.049 Y140.991
G1 X121.872 Y138.169 E.17212
G1 X121.877 Y137.612
G1 X120.6 Y138.889 E.07785
G1 X120.613 Y138.324
G1 X121.882 Y137.055 E.07741
G1 X121.888 Y136.498
G1 X120.626 Y137.76 E.07696
G1 X120.638 Y137.197
G1 X121.893 Y135.941 E.07656
G1 X121.894 Y135.389
G1 X120.64 Y136.643 E.07648
G1 X120.643 Y136.089
G1 X121.893 Y134.839 E.07624
M73 P94 R0
G1 X121.892 Y134.289
G1 X120.645 Y135.535 E.076
G1 X120.648 Y134.981
G1 X121.89 Y133.739 E.07577
G1 X121.889 Y133.189
G1 X120.65 Y134.427 E.07553
G1 X120.653 Y133.874
G1 X121.887 Y132.639 E.07529
G1 X121.877 Y132.098
G1 X120.655 Y133.32 E.0745
G1 X120.657 Y132.766
G1 X121.865 Y131.559 E.07361
G1 X121.469 Y131.403
G1 X120.663 Y132.209 E.04912
; WIPE_START
M204 S10000
G1 X121.469 Y131.403 E-.43285
G1 X121.865 Y131.559 E-.16162
G1 X121.556 Y131.867 E-.16553
; WIPE_END
G1 E-.04 F1800
G1 X119.809 Y139.297 Z1.44 F30000
G1 X119.691 Y139.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.604 Y140.885 E.06627
G1 X118.227 Y140.711
G1 X119.154 Y139.783 E.05655
G1 X118.767 Y139.619
G1 X117.901 Y140.485 E.05283
G1 X117.617 Y140.217
G1 X118.439 Y139.395 E.05012
G1 X118.419 Y138.864
G1 X117.372 Y139.911 E.06381
G1 X117.245 Y139.487
G1 X118.417 Y138.315 E.07149
G1 X118.416 Y137.765
G1 X117.199 Y138.982 E.0742
G1 X117.179 Y138.45
G1 X118.414 Y137.215 E.07533
G1 X118.413 Y136.665
G1 X117.167 Y137.911 E.07596
G1 X117.158 Y137.368
G1 X118.411 Y136.115 E.07643
G1 X118.409 Y135.565
G1 X117.154 Y136.821 E.07658
G1 X117.15 Y136.274
G1 X118.404 Y135.02 E.07646
G1 X118.394 Y134.478
G1 X117.146 Y135.726 E.07609
G1 X117.142 Y135.179
G1 X118.384 Y133.937 E.07573
G1 X118.358 Y133.411
G1 X117.138 Y134.631 E.07442
G1 X117.134 Y134.084
G1 X118.323 Y132.895 E.07249
G1 X118.248 Y132.418
G1 X117.116 Y133.55 E.06903
G1 X117.087 Y133.028
G1 X118.064 Y132.051 E.05958
G1 X117.805 Y131.758
G1 X116.933 Y132.631 E.05322
G1 X116.624 Y132.388
G1 X117.516 Y131.496 E.0544
G1 X117.181 Y131.28
G1 X116.174 Y132.287 E.06143
G1 X115.626 Y132.283
G1 X116.785 Y131.124 E.07069
G1 X116.283 Y131.074
G1 X113.636 Y133.721 E.16142
G1 X113.65 Y133.156
G1 X115.737 Y131.069 E.1273
G1 X115.071 Y131.183
G1 X113.736 Y132.519 E.08145
; WIPE_START
M204 S10000
G1 X115.071 Y131.183 E-.71775
G1 X115.181 Y131.165 E-.04226
; WIPE_END
G1 E-.04 F1800
G1 X119.823 Y137.223 Z1.44 F30000
G1 X121.731 Y139.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
G1 X121.712 Y139.746 E.00021
; LINE_WIDTH: 0.130511
G1 X121.652 Y139.828 E.00079
; LINE_WIDTH: 0.163118
G1 X121.592 Y139.911 E.00116
; LINE_WIDTH: 0.199555
G1 X121.437 Y140.095 E.00371
; LINE_WIDTH: 0.222554
G3 X121 Y140.525 I-4.507 J-4.14 E.01103
; LINE_WIDTH: 0.185394
G1 X120.793 Y140.697 E.00372
; LINE_WIDTH: 0.147212
G1 X120.714 Y140.754 E.00094
; LINE_WIDTH: 0.120327
G1 X120.635 Y140.812 E.00065
; WIPE_START
G1 X120.714 Y140.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.905 Y139.86 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
G1 X119.679 Y139.786 E.00235
G1 X120.02 Y139.723 F30000
; LINE_WIDTH: 0.140994
G1 F12000
G1 X119.768 Y139.874 E.00263
; WIPE_START
G1 X120.02 Y139.723 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.338 Y133.39 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
G1 X118.338 Y133.156 E.00128
G1 X118.241 Y132.386 F30000
; LINE_WIDTH: 0.128952
G1 F12000
G2 X118.144 Y132.246 I-.611 J.321 E.0013
; WIPE_START
G1 X118.241 Y132.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.94 Y131.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
G2 X116.82 Y131.133 I-.288 J.191 E.00089
; WIPE_START
G1 X116.94 Y131.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.635 Y132.291 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
G1 X115.482 Y132.254 E.00247
; LINE_WIDTH: 0.183556
G1 X115.385 Y132.32 E.0016
; LINE_WIDTH: 0.123039
G2 X115.128 Y132.543 I1.035 J1.454 E.00237
; LINE_WIDTH: 0.126364
G1 X115.066 Y132.624 E.00075
; LINE_WIDTH: 0.162472
G2 X114.886 Y132.875 I2.197 J1.762 E.0035
; WIPE_START
G1 X115.066 Y132.624 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.354 Y131.594 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
G2 X114.011 Y131.94 I4.051 J4.378 E.00276
; WIPE_START
G1 X114.354 Y131.594 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.75 Y126.196 Z1.44 F30000
G1 X120.378 Y125.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.115 Y125.344 I-.284 J.067 E.01474
G2 X113.85 Y125.255 I-26.442 J1649.858 E.24939
G3 X113.447 Y125.24 I.022 J-5.853 E.01605
G3 X113.443 Y123.66 I14.303 J-.823 E.06293
G3 X119.29 Y123.616 I5.095 J291.895 E.23273
G2 X120.15 Y123.556 I.034 J-5.676 E.03436
G2 X120.413 Y123.25 I-.068 J-.324 E.01723
G2 X120.469 Y119.763 I-406.372 J-8.259 E.13881
G3 X120.486 Y119.533 I2.353 J.068 E.00917
G3 X121.666 Y119.496 I1.021 J13.405 E.04697
G3 X122.012 Y119.512 I-.064 J4.937 E.01381
G3 X122.079 Y124.958 I-134.811 J4.385 E.21679
G3 X122.055 Y129.413 I-151.211 J1.42 E.17733
G3 X120.49 Y129.418 I-.808 J-8.036 E.06242
G3 X120.445 Y126.84 I46.671 J-2.088 E.10265
G2 X120.387 Y125.627 I-6.849 J-.276 E.04839
; WIPE_START
M204 S10000
G1 X120.347 Y125.485 E-.05615
G1 X120.279 Y125.407 E-.03945
G1 X120.199 Y125.362 E-.03455
G1 X120.115 Y125.344 E-.03293
G1 X118.544 Y125.322 E-.59691
; WIPE_END
G1 E-.04 F1800
G1 X121.865 Y128.801 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.413 Y129.253 E.02757
G1 X120.875 Y129.24
G1 X121.874 Y128.241 E.06094
G1 X121.876 Y127.687
G1 X120.665 Y128.898 E.07386
G1 X120.652 Y128.36
G1 X121.877 Y127.135 E.07469
G1 X121.878 Y126.583
G1 X120.65 Y127.811 E.07489
G1 X120.647 Y127.262
G1 X121.878 Y126.031 E.0751
G1 X121.879 Y125.479
G1 X120.642 Y126.716 E.07545
G1 X120.629 Y126.178
G1 X121.88 Y124.927 E.07629
G1 X121.877 Y124.378
G1 X120.6 Y125.655 E.07786
G1 X120.429 Y125.275
G1 X121.874 Y123.83 E.08814
G1 X121.871 Y123.281
G1 X120.011 Y125.141 E.11342
G1 X119.475 Y125.125
G1 X121.868 Y122.733 E.14592
G1 X121.865 Y122.184
G1 X120.521 Y123.528 E.08195
G1 X120.622 Y122.876
G1 X121.862 Y121.635 E.07564
G1 X121.854 Y121.092
G1 X120.637 Y122.31 E.07425
G1 X120.646 Y121.749
G1 X121.843 Y120.552 E.07302
G1 X121.832 Y120.012
G1 X120.65 Y121.194 E.07208
G1 X120.654 Y120.638
G1 X121.597 Y119.696 E.05749
G1 X121.04 Y119.701
G1 X120.658 Y120.083 E.0233
; WIPE_START
M204 S10000
G1 X121.04 Y119.701 E-.20535
G1 X121.597 Y119.696 E-.21152
G1 X120.958 Y120.334 E-.34314
; WIPE_END
G1 E-.04 F1800
G1 X120.385 Y123.664 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.929 Y125.12 E.08881
G1 X118.383 Y125.115
G1 X119.699 Y123.798 E.08026
G1 X119.13 Y123.816
G1 X117.837 Y125.109 E.07885
G1 X117.291 Y125.104
G1 X118.576 Y123.819 E.07837
G1 X118.022 Y123.821
G1 X116.745 Y125.098 E.07788
G1 X116.199 Y125.093
G1 X117.469 Y123.824 E.0774
G1 X116.915 Y123.826
G1 X115.653 Y125.087 E.07692
G1 X115.107 Y125.082
G1 X116.361 Y123.828 E.07644
G1 X115.807 Y123.831
G1 X114.569 Y125.068 E.07547
G1 X114.031 Y125.055
G1 X115.253 Y123.833 E.0745
G1 X114.697 Y123.838
G1 X113.635 Y124.9 E.06474
G1 X113.622 Y124.362
G1 X114.136 Y123.848 E.03135
; WIPE_START
M204 S10000
G1 X113.622 Y124.362 E-.27625
G1 X113.635 Y124.9 E-.20462
G1 X114.155 Y124.38 E-.27913
; WIPE_END
G1 E-.04 F1800
G1 X120.678 Y125.733 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
G1 X120.605 Y125.926 E.00124
; WIPE_START
G1 X120.678 Y125.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.739 Y128.972 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
G2 X120.706 Y129.25 I.322 J.18 E.00321
; WIPE_START
G1 X120.702 Y129.068 E-.48684
G1 X120.739 Y128.972 E-.27316
; WIPE_END
G1 E-.04 F1800
G1 X119.707 Y121.41 Z1.44 F30000
G1 X118.035 Y109.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
M73 P95 R0
G1 X117.999 Y113.773 E.18346
G3 X117.958 Y114.735 I-7.48 J.162 E.03836
G3 X116.35 Y114.698 I-.644 J-7.029 E.06416
G3 X116.359 Y110.603 I121.596 J-1.771 E.16301
G2 X116.333 Y109.663 I-13.087 J-.102 E.03745
G1 X116.223 Y109.162 E.02039
G3 X113.43 Y109.078 I5.107 J-215.305 E.1112
G3 X113.45 Y107.539 I54.131 J-.09 E.06127
G3 X118.966 Y107.521 I3.795 J326.245 E.21959
G3 X120.511 Y107.658 I.188 J6.651 E.06184
G3 X122.069 Y109.757 I-.652 J2.112 E.11134
G3 X122.07 Y115.93 I-102.109 J3.109 E.24574
G3 X121.807 Y117.013 I-2.194 J.041 E.04485
G3 X120.149 Y118.165 I-2.332 J-1.59 E.08216
G3 X116.87 Y118.204 I-2.187 J-45.48 E.13057
G1 X113.45 Y118.183 E.13612
G1 X113.419 Y116.606 E.06281
G2 X118.952 Y116.565 I-.575 J-457.684 E.22026
G2 X120.02 Y116.482 I.116 J-5.399 E.04272
G2 X120.39 Y116.05 I-.172 J-.52 E.02378
G2 X120.44 Y115.245 I-5.184 J-.731 E.03211
G2 X120.429 Y110.135 I-371.979 J-1.754 E.20342
G2 X120.338 Y109.484 I-2.204 J-.022 E.02624
G2 X119.607 Y109.137 I-.67 J.467 E.03372
G2 X118.095 Y109.16 I-.499 J17.008 E.06019
; WIPE_START
M204 S10000
G1 X118.053 Y111.159 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.851 Y116.133 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X120.016 Y117.968 E.1119
G1 X119.439 Y117.993
G1 X121.889 Y115.544 E.14938
G1 X121.9 Y114.981
G1 X118.88 Y118.001 E.18417
G1 X118.324 Y118.006
G1 X119.587 Y116.742 E.07705
G1 X119.02 Y116.758
G1 X117.775 Y118.003 E.07596
G1 X117.226 Y118.001
G1 X118.458 Y116.769 E.07513
G1 X117.899 Y116.776
G1 X116.677 Y117.998 E.07451
G1 X116.128 Y117.996
G1 X117.344 Y116.78 E.07415
G1 X116.789 Y116.784
G1 X115.579 Y117.993 E.07378
G1 X115.03 Y117.991
G1 X116.234 Y116.787 E.07342
G1 X115.679 Y116.791
G1 X114.481 Y117.989 E.07305
G1 X113.932 Y117.986
G1 X115.124 Y116.794 E.07269
G1 X114.569 Y116.798
G1 X113.64 Y117.726 E.05663
G1 X113.63 Y117.186
G1 X114.014 Y116.801 E.02344
; WIPE_START
M204 S10000
G1 X113.63 Y117.186 E-.20655
G1 X113.64 Y117.726 E-.20552
G1 X114.288 Y117.079 E-.34793
; WIPE_END
G1 E-.04 F1800
G1 X117.352 Y114.566 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X117.784 Y114.134 E.02632
G1 X117.801 Y113.566
G1 X116.823 Y114.543 E.05963
G1 X116.54 Y114.275
G1 X117.806 Y113.01 E.07718
G1 X117.81 Y112.454
G1 X116.534 Y113.73 E.07781
G1 X116.54 Y113.173
G1 X117.814 Y111.898 E.07773
G1 X117.819 Y111.342
G1 X116.545 Y112.616 E.07765
G1 X116.551 Y112.059
G1 X117.823 Y110.787 E.07757
G1 X117.827 Y110.231
G1 X116.557 Y111.501 E.07749
G1 X116.557 Y110.95
G1 X117.832 Y109.675 E.07775
G1 X117.836 Y109.119
G1 X116.554 Y110.401 E.07819
; WIPE_START
M204 S10000
G1 X117.836 Y109.119 E-.68903
G1 X117.835 Y109.306 E-.07097
; WIPE_END
G1 E-.04 F1800
G1 X121.912 Y114.418 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.622 Y115.707 E.07863
G1 X120.64 Y115.138
G1 X121.915 Y113.863 E.07777
G1 X121.916 Y113.31
G1 X120.641 Y114.586 E.07779
G1 X120.641 Y114.034
G1 X121.917 Y112.758 E.0778
G1 X121.918 Y112.206
G1 X120.642 Y113.482 E.07782
G1 X120.642 Y112.93
G1 X121.912 Y111.66 E.07742
G1 X121.903 Y111.118
G1 X120.643 Y112.378 E.07686
G1 X120.644 Y111.826
G1 X121.895 Y110.575 E.0763
G1 X121.877 Y110.041
G1 X120.644 Y111.274 E.07521
G1 X120.635 Y110.731
G1 X121.851 Y109.516 E.07412
G1 X121.749 Y109.066
G1 X120.621 Y110.195 E.06881
G1 X120.589 Y109.675
G1 X121.565 Y108.699 E.05952
G1 X121.319 Y108.394
G1 X120.438 Y109.275 E.05371
G1 X120.117 Y109.044
G1 X121.016 Y108.145 E.05483
G1 X120.669 Y107.94
G1 X119.661 Y108.948 E.06146
G1 X119.125 Y108.934
G1 X120.253 Y107.805 E.0688
G1 X119.757 Y107.749
G1 X118.557 Y108.949 E.07317
G1 X117.99 Y108.965
G1 X119.225 Y107.73 E.07531
G1 X118.682 Y107.722
G1 X116.541 Y109.862 E.13055
G1 X116.474 Y109.378
G1 X118.129 Y107.723 E.10091
G1 X117.576 Y107.725
G1 X116.335 Y108.966 E.07568
G1 X115.8 Y108.95
G1 X117.023 Y107.727 E.07458
G1 X116.47 Y107.729
G1 X115.264 Y108.934 E.07349
G1 X114.729 Y108.918
G1 X115.916 Y107.73 E.0724
G1 X115.363 Y107.732
G1 X114.194 Y108.901 E.0713
G1 X113.659 Y108.885
G1 X114.81 Y107.734 E.07021
G1 X114.257 Y107.736
G1 X113.639 Y108.354 E.03769
; WIPE_START
M204 S10000
G1 X114.257 Y107.736 E-.33214
G1 X114.81 Y107.734 E-.21021
G1 X114.405 Y108.139 E-.21765
; WIPE_END
G1 E-.04 F1800
G1 X119.45 Y113.866 Z1.44 F30000
G1 X121.805 Y116.54 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
G1 X121.487 Y116.947 E.01267
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X120.998 Y117.437 I-3.509 J-3.015 E.01986
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X120.81 Y117.584 E.00604
; LINE_WIDTH: 0.248541
G1 F12000
G1 X120.622 Y117.732 E.00499
; LINE_WIDTH: 0.208882
G1 X120.433 Y117.88 E.00394
; WIPE_START
G1 X120.622 Y117.732 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.436 Y110.42 Z1.44 F30000
G1 X118.005 Y108.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
G1 X117.852 Y108.922 E.00237
G1 X117.791 Y108.981 E.00123
G1 X117.848 Y109.131 E.00232
; WIPE_START
G1 X117.791 Y108.981 E-.29779
G1 X117.852 Y108.922 E-.1581
G1 X118.005 Y108.981 E-.30412
; WIPE_END
G1 E-.04 F1800
G1 X121.738 Y109.028 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
G1 X121.645 Y108.895 E.00114
; WIPE_START
G1 X121.738 Y109.028 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.03 Y102.357 Z1.44 F30000
G1 X115.931 Y98.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X117.583 Y100.189 I16.729 J-15.522 E.09184
G3 X122.113 Y104.25 I-343.514 J387.669 E.24213
G3 X122.083 Y106.107 I-148.096 J-1.41 E.0739
G3 X113.387 Y106.109 I-4.501 J-511.753 E.34615
G3 X113.4 Y104.447 I16.724 J-.702 E.06619
G3 X118.451 Y104.408 I4.214 J216.374 E.20107
G2 X119.155 Y104.342 I.029 J-3.481 E.02819
G2 X119.495 Y104.148 I-.524 J-1.314 E.01561
G2 X118.659 Y103.307 I-5.157 J4.285 E.04725
G3 X113.37 Y98.558 I221.017 J-251.441 E.28293
G3 X113.385 Y96.881 I23.532 J-.639 E.06674
G1 X113.399 Y96.772 E.0044
G3 X120.283 Y96.719 I4.847 J184.983 E.27401
G3 X122.113 Y96.766 I.053 J33.525 E.07286
G3 X122.14 Y98.445 I-7.316 J.957 E.06697
G3 X120.825 Y98.49 I-1.1 J-12.874 E.05238
G2 X116.568 Y98.533 I-.553 J155.523 E.16944
G1 X115.991 Y98.576 E.02303
; WIPE_START
M204 S10000
G1 X116.623 Y99.3 E-.3651
G1 X117.385 Y100.006 E-.3949
; WIPE_END
G1 E-.04 F1800
G1 X121.045 Y105.911 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.9 Y105.055 E.0522
G1 X121.909 Y104.495
G1 X120.491 Y105.913 E.08648
G1 X119.938 Y105.914
G1 X121.702 Y104.15 E.10758
G1 X121.411 Y103.89
G1 X119.385 Y105.916 E.12359
G1 X118.832 Y105.918
G1 X121.121 Y103.629 E.1396
G1 X120.83 Y103.368
G1 X118.278 Y105.92 E.15561
G1 X117.725 Y105.922
G1 X119.095 Y104.552 E.08356
G1 X118.498 Y104.597
G1 X117.172 Y105.924 E.0809
G1 X116.619 Y105.925
G1 X117.942 Y104.602 E.08068
G1 X117.385 Y104.608
G1 X116.065 Y105.927 E.08046
G1 X115.512 Y105.929
G1 X116.828 Y104.613 E.08024
G1 X116.271 Y104.619
G1 X114.965 Y105.924 E.07962
G1 X114.419 Y105.919
G1 X115.714 Y104.624 E.07899
G1 X115.157 Y104.63
G1 X113.873 Y105.914 E.07835
G1 X113.58 Y105.656
G1 X114.601 Y104.635 E.06225
G1 X114.044 Y104.64
G1 X113.572 Y105.112 E.02875
; WIPE_START
M204 S10000
G1 X114.044 Y104.64 E-.2534
G1 X114.601 Y104.635 E-.21161
G1 X114.052 Y105.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M73 P96 R0
G1 X119.638 Y104.009 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.539 Y103.108 E.05497
G1 X120.249 Y102.847
G1 X119.38 Y103.716 E.05297
G1 X119.097 Y103.447
G1 X119.958 Y102.586 E.0525
G1 X119.667 Y102.326
G1 X118.814 Y103.179 E.05203
G1 X118.523 Y102.918
G1 X119.376 Y102.065 E.05203
G1 X119.086 Y101.804
G1 X118.232 Y102.658 E.05206
G1 X117.941 Y102.398
G1 X118.795 Y101.543 E.05209
G1 X118.504 Y101.283
G1 X117.649 Y102.138 E.05213
G1 X117.358 Y101.877
G1 X118.213 Y101.022 E.05216
G1 X117.923 Y100.761
G1 X117.067 Y101.617 E.05219
G1 X116.776 Y101.357
G1 X117.632 Y100.501 E.05223
G1 X117.343 Y100.238
G1 X116.484 Y101.097 E.05236
G1 X116.193 Y100.837
G1 X117.057 Y99.973 E.05266
G1 X116.77 Y99.708
G1 X115.902 Y100.577 E.05296
G1 X115.61 Y100.317
G1 X116.484 Y99.443 E.05326
G1 X116.214 Y99.162
G1 X115.319 Y100.056 E.05455
G1 X115.028 Y99.796
G1 X115.943 Y98.881 E.05584
G1 X115.673 Y98.599
G1 X114.737 Y99.536 E.05713
; WIPE_START
M204 S10000
G1 X115.673 Y98.599 E-.50342
G1 X115.943 Y98.881 E-.14819
G1 X115.742 Y99.082 E-.10839
; WIPE_END
G1 E-.04 F1800
G1 X121.504 Y98.283 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.973 Y97.814 E.02862
G1 X121.962 Y97.273
G1 X120.949 Y98.286 E.06175
G1 X120.395 Y98.289
G1 X121.739 Y96.945 E.08198
G1 X121.202 Y96.931
G1 X119.841 Y98.292 E.08301
G1 X119.287 Y98.295
G1 X120.658 Y96.924 E.08361
G1 X120.111 Y96.919
G1 X118.732 Y98.297 E.08406
G1 X118.178 Y98.3
G1 X119.559 Y96.919 E.0842
G1 X119.007 Y96.92
G1 X117.621 Y98.306 E.08451
G1 X117.058 Y98.318
G1 X118.455 Y96.921 E.08519
G1 X117.903 Y96.921
G1 X116.479 Y98.345 E.08682
G1 X115.89 Y98.383
G1 X117.351 Y96.922 E.08911
G1 X116.799 Y96.922
G1 X114.445 Y99.276 E.14354
G1 X114.154 Y99.016
G1 X116.247 Y96.923 E.12764
G1 X115.689 Y96.929
G1 X113.868 Y98.75 E.11106
G1 X113.583 Y98.484
G1 X115.128 Y96.939 E.09417
G1 X114.566 Y96.95
G1 X113.571 Y97.945 E.0607
G1 X113.571 Y97.393
G1 X114.004 Y96.96 E.02641
; WIPE_START
M204 S10000
G1 X113.571 Y97.393 E-.23277
G1 X113.571 Y97.945 E-.20976
G1 X114.161 Y97.354 E-.31746
; WIPE_END
G1 E-.04 F1800
G1 X118.814 Y103.405 Z1.44 F30000
G1 X119.542 Y104.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
G1 X119.395 Y104.464 E.00142
; LINE_WIDTH: 0.175957
G1 X119.249 Y104.576 E.00237
; LINE_WIDTH: 0.201899
G1 X119.233 Y104.586 E.00029
G1 X119.085 Y104.541 E.00242
; WIPE_START
G1 X119.233 Y104.586 E-.67784
G1 X119.249 Y104.576 E-.08216
; WIPE_END
G1 E-.04 F1800
G1 X116.985 Y98.244 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
G1 X116.755 Y98.345 E.0016
; WIPE_START
G1 X116.985 Y98.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.888 Y97.199 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
G1 X121.916 Y97.121 E.00099
G1 X121.907 Y96.935 E.0022
; WIPE_START
G1 X121.916 Y97.121 E-.52509
G1 X121.888 Y97.199 E-.23491
; WIPE_END
G1 E-.04 F1800
G1 X118.29 Y90.468 Z1.44 F30000
G1 X116.743 Y87.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.984 Y87.472 I-.574 J1.386 E.03079
G2 X115.288 Y87.593 I-.084 J1.577 E.02836
G2 X115.112 Y88.004 I.348 J.393 E.0184
G2 X115.151 Y92.761 I75.618 J1.756 E.18939
G2 X115.421 Y93.489 I1.017 J.037 E.03169
G2 X115.95 Y93.677 I.589 J-.817 E.02266
G2 X119.457 Y93.704 I1.993 J-31.538 E.13965
G2 X120.231 Y93.326 I0 J-.981 E.0355
G2 X120.344 Y92.704 I-1.47 J-.588 E.02535
G2 X120.43 Y85.787 I-279.296 J-6.958 E.27531
G1 X122.08 Y85.787 E.06566
G3 X122.055 Y93.468 I-292.858 J2.87 E.3057
G3 X120.635 Y95.192 I-2.955 J-.986 E.09092
G3 X119.313 Y95.434 I-1.34 J-3.583 E.05377
G3 X115.784 Y95.407 I-1.436 J-43.481 E.14052
G3 X114.106 Y94.568 I.087 J-2.271 E.07696
G3 X113.419 Y92.928 I1.813 J-1.723 E.07234
G3 X113.379 Y90.475 I53.037 J-2.107 E.09768
G1 X113.404 Y85.786 E.18664
G3 X118.187 Y85.769 I3.283 J248.828 E.19039
G3 X118.612 Y85.798 I-.008 J3.262 E.01696
G3 X118.658 Y89.762 I-46.497 J2.518 E.15785
G3 X118.613 Y90.383 I-5.189 J-.059 E.02481
G3 X116.916 Y90.336 I-.148 J-25.479 E.0676
G2 X116.851 Y87.926 I-41.619 J-.083 E.096
G2 X116.772 Y87.627 I-.747 J.038 E.01238
; WIPE_START
M204 S10000
G1 X116.617 Y87.518 E-.07197
G1 X116.507 Y87.494 E-.04294
G1 X115.984 Y87.472 E-.19855
G1 X115.584 Y87.504 E-.15249
G1 X115.447 Y87.53 E-.05324
G1 X115.288 Y87.593 E-.06473
G1 X115.178 Y87.719 E-.06378
G1 X115.141 Y87.816 E-.03939
G1 X115.112 Y88.004 E-.07241
G1 X115.112 Y88.005 E-.00049
; WIPE_END
G1 E-.04 F1800
G1 X119.592 Y94.185 Z1.44 F30000
G1 X120.264 Y95.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.81 Y93.566 E.09428
G1 X121.87 Y92.954
G1 X119.614 Y95.21 E.13755
G1 X119.034 Y95.239
G1 X121.876 Y92.396 E.17331
G1 X121.883 Y91.839
G1 X120.471 Y93.251 E.0861
G1 X120.546 Y92.624
G1 X121.889 Y91.281 E.08188
G1 X121.889 Y90.729
G1 X120.561 Y92.057 E.08099
G1 X120.567 Y91.5
G1 X121.888 Y90.179 E.08056
G1 X121.887 Y89.628
G1 X120.573 Y90.942 E.08013
G1 X120.579 Y90.385
G1 X121.886 Y89.078 E.0797
G1 X121.885 Y88.527
G1 X120.586 Y89.827 E.07926
G1 X120.592 Y89.27
G1 X121.884 Y87.977 E.07883
G1 X121.884 Y87.426
G1 X120.598 Y88.712 E.0784
G1 X120.604 Y88.155
G1 X121.883 Y86.876 E.07797
G1 X121.882 Y86.326
G1 X120.61 Y87.597 E.07754
G1 X120.616 Y87.04
G1 X121.669 Y85.987 E.06419
G1 X121.117 Y85.987
G1 X120.622 Y86.482 E.03019
; WIPE_START
M204 S10000
G1 X121.117 Y85.987 E-.26609
G1 X121.669 Y85.987 E-.20954
G1 X121.14 Y86.516 E-.28438
; WIPE_END
G1 E-.04 F1800
G1 X118.454 Y89.753 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.028 Y90.179 E.02599
G1 X117.495 Y90.161
G1 X118.465 Y89.191 E.05915
G1 X118.466 Y88.638
G1 X117.107 Y89.997 E.08285
G1 X117.095 Y89.458
G1 X118.464 Y88.089 E.0835
G1 X118.463 Y87.539
G1 X117.083 Y88.919 E.08415
G1 X117.071 Y88.379
G1 X118.461 Y86.989 E.0848
G1 X118.444 Y86.455
G1 X117.038 Y87.86 E.08572
G1 X116.904 Y87.444
G1 X118.366 Y85.981 E.0892
G1 X117.826 Y85.97
G1 X116.502 Y87.294 E.08076
G1 X115.972 Y87.273
G1 X117.273 Y85.971 E.07934
G1 X116.72 Y85.973
G1 X115.332 Y87.361 E.0846
; WIPE_START
M204 S10000
G1 X116.72 Y85.973 E-.7455
G1 X116.758 Y85.973 E-.0145
; WIPE_END
G1 E-.04 F1800
G1 X119.616 Y93.05 Z1.44 F30000
G1 X119.92 Y93.802 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.475 Y95.246 E.0881
G1 X117.916 Y95.254
G1 X119.259 Y93.911 E.08192
G1 X118.686 Y93.932
G1 X117.359 Y95.259 E.08092
G1 X116.816 Y95.251
G1 X118.133 Y93.934 E.08035
G1 X117.589 Y93.927
G1 X116.282 Y95.234 E.07973
G1 X115.761 Y95.203
G1 X117.045 Y93.919 E.07827
G1 X116.501 Y93.912
G1 X115.289 Y95.124 E.0739
G1 X114.898 Y94.964
G1 X115.982 Y93.879 E.06613
G1 X115.526 Y93.784
G1 X114.574 Y94.736 E.05804
G1 X114.291 Y94.467
G1 X115.205 Y93.554 E.05569
G1 X115.017 Y93.191
G1 X114.041 Y94.166 E.05948
G1 X113.836 Y93.819
G1 X114.955 Y92.701 E.0682
G1 X114.928 Y92.177
G1 X113.69 Y93.414 E.07546
G1 X113.629 Y92.924
M73 P97 R0
G1 X114.922 Y91.631 E.07887
G1 X114.916 Y91.085
G1 X113.597 Y92.405 E.08046
G1 X113.588 Y91.862
G1 X114.911 Y90.539 E.08069
G1 X114.905 Y89.994
G1 X113.578 Y91.32 E.08091
G1 X113.58 Y90.767
G1 X114.9 Y89.448 E.08044
G1 X114.894 Y88.902
G1 X113.583 Y90.213 E.07994
G1 X113.586 Y89.659
G1 X114.905 Y88.339 E.08048
G1 X114.97 Y87.723
G1 X113.588 Y89.105 E.08425
G1 X113.591 Y88.551
G1 X116.166 Y85.975 E.15706
G1 X115.613 Y85.977
G1 X113.593 Y87.997 E.12316
G1 X113.596 Y87.443
G1 X115.059 Y85.979 E.08926
G1 X114.506 Y85.981
G1 X113.598 Y86.889 E.05536
; WIPE_START
M204 S10000
G1 X114.506 Y85.981 E-.48788
G1 X115.059 Y85.979 E-.21029
G1 X114.944 Y86.094 E-.06183
; WIPE_END
G1 E-.04 F1800
G1 X114.913 Y88.608 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
G1 X114.82 Y88.828 E.00201
; WIPE_START
G1 X114.913 Y88.608 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.256 Y87.285 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
G2 X114.947 Y87.586 I1.969 J2.335 E.00719
G1 X114.972 Y87.726 E.00237
; WIPE_START
G1 X114.947 Y87.586 E-.18799
G1 X115.127 Y87.393 E-.34899
G1 X115.256 Y87.285 E-.22302
; WIPE_END
G1 E-.04 F1800
G1 X121.809 Y86.253 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
G1 X121.846 Y86.164 E.00121
G1 X121.846 Y85.967 E.00246
; WIPE_START
G1 X121.846 Y86.164 E-.50978
G1 X121.809 Y86.253 E-.25022
; WIPE_END
G1 E-.04 F1800
G1 X120.634 Y92.13 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
G1 X120.538 Y92.356 E.00158
G1 X120.544 Y93.323 F30000
; LINE_WIDTH: 0.191182
G1 F12000
G3 X120.167 Y93.734 I-1.683 J-1.165 E.00811
; LINE_WIDTH: 0.214865
G1 X119.987 Y93.869 E.00385
G1 X119.532 Y93.891 F30000
; LINE_WIDTH: 0.127375
G1 F12000
G3 X119.334 Y93.986 I-1.8 J-3.502 E.00163
; WIPE_START
G1 X119.532 Y93.891 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.241 Y94.443 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
G3 X120.97 Y94.713 I-2.696 J-2.428 E.00216
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
G1 X121.241 Y94.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.54 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z101.04 F600
    G1 Z99.04

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

