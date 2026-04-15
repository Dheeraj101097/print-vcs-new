; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 7m 30s; total estimated time: 14m 41s
; total layer number: 3
; total filament length [mm] : 612.28
; total filament volume [cm^3] : 1472.70
; total filament weight [g] : 1.83
; model label id: 701,783,941,1070
; filament_density: 1.24,1.24,1.24,1.24,1.24,1.24
; filament_diameter: 1.75,1.75,1.75,1.75,1.75,1.75
; max_z_height: 0.76
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70,70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
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
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70,70,70
; cool_plate_temp = 35,35,35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35,35,35
; cooling_filter_enabled = 0
; counter_coef_1 = 0,0,0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;;;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70,70
; elefant_foot_compensation = 0.075
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
; eng_plate_temp = 0,0,0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80,80,80,80,80,80
; fan_direction = undefine
; fan_max_speed = 80,80,80,80,80,80
; fan_min_speed = 60,60,60,60,60,60
; filament_adaptive_volumetric_speed = 0,0,0,0,0,0
; filament_adhesiveness_category = 100,100,100,100,100,100
; filament_change_length = 10,10,10,10,10,10
; filament_change_length_nc = 10,10,10,10,10,10
; filament_colour = #FFFFFF;#CDBE0C;#FF0000;#080808;#FF8000;#FFFFFF
; filament_colour_type = 1;1;1;1;1;1
; filament_cooling_before_tower = 0,0,0,0,0,0
; filament_cost = 20,20,20,20,20,20
; filament_density = 1.24,1.24,1.24,1.24,1.24,1.24
; filament_diameter = 1.75,1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0,0,0
; filament_ids = GFL99;GFL99;GFL99;GFL99;GFL99;GFL99
; filament_is_support = 0,0,0,0,0,0
; filament_map = 1,1,1,1,1,1
; filament_map_2 = 0,0,0,0,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12,12,12,12,12,12
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15,15
; filament_multi_colour = #FFFFFF;#CDBE0C;#FF0000;#080808;#FF8000;#FFFFFF
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
; filament_scarf_gap = 15%,15%,15%,15%,15%,15%
; filament_scarf_height = 10%,10%,10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10,10,10
; filament_scarf_seam_type = none,none,none,none,none,none
; filament_self_index = 1,2,3,4,5,6
; filament_settings_id = "Generic PLA @BBL A1";"Generic PLA @BBL A1";"Generic PLA @BBL A1";"Generic PLA @BBL A1";"Generic PLA @BBL A1";"Generic PLA @BBL A1"
; filament_shrink = 100%,100%,100%,100%,100%,100%
; filament_soluble = 0,0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA;PLA;PLA
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
; flush_volumes_matrix = 0,279,354,169,339,152,460,0,303,194,199,460,678,511,0,185,408,678,639,617,484,0,621,639,549,271,224,202,0,549,152,279,354,169,339,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 200
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0,0,0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 65,65,65,65,65,65
; hot_plate_temp_initial_layer = 65,65,65,65,65,65
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
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20250822 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{flush_temperatures[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
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
; nozzle_height = 4.76
; nozzle_temperature = 220,220,220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
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
; overhang_fan_speed = 100,100,100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%,50%,50%
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
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.28mm Extra Draft @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
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
; retract_lift_below = 255
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
; slow_down_layer_time = 8,8,8,8,8,8
; slow_down_min_speed = 20,20,20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
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
; supertack_plate_temp = 45,45,45,45,45,45
; supertack_plate_temp_initial_layer = 45,45,45,45,45,45
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
; temperature_vitrification = 45,45,45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65,65,65,65,65
; textured_plate_temp_initial_layer = 65,65,65,65,65,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
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
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
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
; wipe_tower_x = 15
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
M73 P0 R14
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20250822 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F299.339 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S240 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
M73 P1 R14
G1 E5 F200
M104 S220
G92 E0
M73 P10 R13
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P11 R12
G1 X-48.2 F3000
M73 P13 R12
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P15 R12
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P16 R12
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

M73 P17 R12
G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P46 R7
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
M73 P47 R7
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X91.9692 Y98.0729 I84.2941 J66.2744
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

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/3
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 1070
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
M73 P48 R7
G1 X116.661 Y153.489 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X116.661 Y153.946 E.01702
G1 X118.108 Y153.946 E.05391
G1 X118.108 Y156.306 E.0879
G1 X116.661 Y156.306 E.05391
G1 X116.661 Y158.92 E.09734
G2 X116.91 Y160.185 I2.976 J.07 E.04842
G2 X117.95 Y160.962 I1.452 J-.859 E.04963
G1 X118.409 Y161.098 E.01784
G2 X119.379 Y160.829 I-.447 J-3.501 E.0376
G2 X119.728 Y160.583 I-.814 J-1.523 E.01593
G1 X121.905 Y162.172 E.1004
G3 X120.384 Y163.224 I-3.072 J-2.817 E.06945
G3 X118.639 Y163.561 I-2.521 J-8.377 E.06629
G3 X116.814 Y163.228 I.25 J-6.557 E.06934
G3 X115.619 Y162.45 I1.908 J-4.235 E.05334
G1 X115.245 Y162.131 E.01829
G3 X114.223 Y160.508 I5.935 J-4.873 E.07163
G3 X113.916 Y158.968 I5.166 J-1.83 E.05869
G1 X113.872 Y158.398 E.02129
G1 X113.872 Y150.129 E.30799
G1 X116.661 Y150.129 E.10388
G1 X116.661 Y153.429 E.12291
M204 S6000
G1 X117.118 Y153.489 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.565 Y153.489 E.05391
G1 X118.565 Y156.763 E.12195
G1 X117.118 Y156.763 E.05391
G1 X117.118 Y158.908 E.07989
G2 X117.313 Y159.967 I2.534 J.08 E.04038
G2 X118.092 Y160.527 I1.052 J-.641 E.03673
G1 X118.433 Y160.628 E.01326
G2 X119.361 Y160.29 I-.145 J-1.838 E.03725
G2 X119.631 Y159.947 I-1.801 J-1.692 E.01625
G1 X122.593 Y162.109 E.1366
G3 X121.028 Y163.44 I-4.982 J-4.273 E.07684
G3 X119.21 Y163.948 I-2.357 J-4.923 E.07065
G1 X118.648 Y164.02 E.02111
G3 X116.641 Y163.652 I.264 J-7.087 E.07626
G3 X115.327 Y162.801 I2.075 J-4.65 E.05855
G1 X114.91 Y162.446 E.02042
G3 X113.873 Y160.855 I7.041 J-5.72 E.07082
G3 X113.46 Y159.009 I5.301 J-2.155 E.0708
G1 X113.415 Y158.416 E.02214
G1 X113.415 Y149.672 E.32568
G1 X117.118 Y149.672 E.13792
M73 P49 R7
G1 X117.118 Y153.429 E.13993
; WIPE_START
G1 X118.565 Y153.489 E-.55053
G1 X118.565 Y154.041 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1070
M625
; object ids of layer 1 start: 701,783,941,1070
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y131.21 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer1 end: 701,783,941,1070
M625
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
G1 X116.478 Y151.282 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.52187
G1 F6300
M204 S500
G1 X115.713 Y150.518 E.04221
G1 X115.036 Y150.518 E.02644
G1 X116.272 Y151.754 E.06824
G1 X116.272 Y152.431 E.02644
G1 X114.358 Y150.518 E.10562
G1 X114.26 Y150.518 E.00384
G1 X114.26 Y151.097 E.02259
G1 X116.478 Y153.314 E.12241
; WIPE_START
G1 X115.064 Y151.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.292 Y154.129 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X117.72 Y154.556 E.02358
G1 X117.72 Y155.234 E.02644
G1 X116.821 Y154.335 E.04961
G1 X116.272 Y154.335 E.02141
G1 X116.272 Y153.786 E.02141
G1 X114.26 Y151.774 E.11106
G1 X114.26 Y152.451 E.02644
G1 X117.72 Y155.911 E.19095
G1 X117.049 Y155.918 E.02616
G1 X114.26 Y153.129 E.15396
G1 X114.26 Y153.806 E.02644
G1 X116.372 Y155.918 E.11657
G1 X116.272 Y155.918 E.0039
G1 X116.272 Y156.495 E.02254
G1 X114.26 Y154.483 E.11106
G1 X114.26 Y155.161 E.02644
G1 X116.272 Y157.173 E.11106
G1 X116.272 Y157.85 E.02644
G1 X114.26 Y155.838 E.11106
G1 X114.26 Y156.515 E.02644
G1 X116.272 Y158.527 E.11106
G2 X116.286 Y159.219 I7.03 J.201 E.02701
G1 X114.054 Y156.987 E.1232
; WIPE_START
G1 X115.469 Y158.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.423 Y161.001 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X120.925 Y162.503 E.08286
G3 X120.497 Y162.752 I-1.143 J-1.469 E.01939
G1 X119.092 Y161.348 E.07752
G3 X118.537 Y161.469 I-.908 J-2.817 E.02224
G1 X120 Y162.933 E.08078
G3 X119.437 Y163.047 I-.884 J-2.908 E.02245
G1 X117.661 Y161.271 E.09804
G1 X117.202 Y161.05 E.01986
G1 X116.869 Y160.78 E.01674
G1 X116.691 Y160.57 E.01075
G1 X116.47 Y160.164 E.01802
G1 X116.436 Y160.046 E.00481
G1 X114.26 Y157.87 E.1201
G2 X114.278 Y158.565 I3.614 J.255 E.02718
G1 X118.849 Y163.136 E.25229
G1 X118.629 Y163.169 E.00867
G1 X118.158 Y163.123 E.01847
G1 X114.35 Y159.315 E.21019
G2 X114.524 Y160.166 I4.156 J-.405 E.03395
G1 X117.344 Y162.986 E.15565
G3 X116.421 Y162.573 I.605 J-2.592 E.03971
G3 X115.614 Y161.934 I4.661 J-6.708 E.04018
G1 X114.675 Y160.994 E.05186
; WIPE_START
G1 X115.614 Y161.934 E-.50489
G1 X116.065 Y162.312 E-.22366
G1 X116.132 Y162.361 E-.03145
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.713 Y158.494 Z.6 F42000
G1 X130.776 Y153.756 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X130.785 Y153.794 E.00146
G3 X130.297 Y156.385 I-2.283 J.911 E.10365
G3 X128.626 Y157.092 I-1.71 J-1.712 E.06929
G3 X127.903 Y156.975 I.23 J-3.687 E.02732
G3 X126.642 Y153.458 I.807 J-2.274 E.15917
G3 X128.427 Y152.324 I1.988 J1.158 E.08186
G1 X128.628 Y152.303 E.00753
G3 X130.29 Y153.014 I-.05 J2.413 E.06902
G3 X130.617 Y153.452 I-3.653 J3.07 E.02034
G1 X130.748 Y153.703 E.01056
M204 S6000
G1 X130.363 Y153.964 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X130.481 Y154.973 I-1.786 J.72 E.03829
G3 X128.037 Y156.537 I-1.859 J-.213 E.12366
G3 X126.952 Y153.833 I.681 J-1.843 E.12226
G3 X128.479 Y152.778 I1.691 J.814 E.07232
G3 X129.068 Y152.821 I.144 J2.059 E.02205
G3 X130.34 Y153.908 I-.491 J1.862 E.06447
; WIPE_START
G1 X130.451 Y154.243 E-.13406
G1 X130.507 Y154.696 E-.17361
G1 X130.481 Y154.973 E-.10542
G1 X130.418 Y155.299 E-.12615
G1 X130.373 Y155.434 E-.05413
G1 X130.239 Y155.695 E-.11157
G1 X130.153 Y155.812 E-.05506
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.187 Y152.793 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X124.896 Y151.705 I4.161 J1.94 E.04854
M73 P50 R7
G1 X125.211 Y151.326 E.01836
G3 X126.72 Y150.289 I4.862 J5.455 E.06838
G3 X128.143 Y149.967 I1.762 J4.476 E.05456
G1 X128.639 Y149.918 E.01853
G1 X128.811 Y149.934 E.00645
G3 X130.573 Y150.297 I-.257 J5.707 E.06727
G3 X132.056 Y151.321 I-3.473 J6.617 E.06729
G3 X133.028 Y152.665 I-5.759 J5.19 E.06189
G3 X133.42 Y154.218 I-4.178 J1.882 E.06
G1 X133.469 Y154.708 E.01833
G3 X133.141 Y156.493 I-6.39 J-.253 E.06781
G3 X132.382 Y157.696 I-4.344 J-1.898 E.05319
G3 X131.71 Y158.375 I-2.087 J-1.394 E.03578
G3 X130.16 Y159.261 I-2.849 J-3.185 E.06701
G3 X128.728 Y159.477 I-1.967 J-8.195 E.05401
G3 X127.03 Y159.219 I.398 J-8.33 E.06406
G3 X125.598 Y158.402 I1.624 J-4.514 E.06171
G1 X125.206 Y158.095 E.01857
G3 X124.228 Y156.752 I5.543 J-5.067 E.06201
G3 X123.841 Y155.202 I4.168 J-1.864 E.05979
G1 X123.793 Y154.71 E.01844
G3 X124.066 Y153.077 I7.735 J.452 E.06178
G3 X124.162 Y152.848 I4.282 J1.656 E.00925
M204 S6000
G1 X123.771 Y152.603 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X124.541 Y151.417 I4.59 J2.138 E.05282
G1 X124.888 Y151 E.02021
G3 X126.365 Y149.951 I5.659 J6.402 E.06761
G3 X128.093 Y149.512 I2.092 J4.621 E.06674
G1 X128.637 Y149.459 E.02036
G1 X128.854 Y149.479 E.00812
G3 X130.759 Y149.879 I-.298 J6.15 E.0728
G3 X132.379 Y150.995 I-3.7 J7.11 E.07344
G3 X133.436 Y152.458 I-6.181 J5.577 E.06737
G3 X133.875 Y154.168 I-4.601 J2.092 E.06608
G1 X133.928 Y154.708 E.02023
G3 X133.638 Y156.46 I-8.462 J-.5 E.06624
G3 X132.739 Y157.981 I-4.668 J-1.732 E.06619
G1 X132.399 Y158.397 E.02001
G3 X130.96 Y159.441 I-5.623 J-6.238 E.06632
G3 X129.264 Y159.882 I-2.082 J-4.521 E.06561
G1 X128.731 Y159.936 E.01998
G3 X126.894 Y159.655 I.42 J-8.899 E.06933
G3 X125.32 Y158.765 I1.768 J-4.964 E.06767
G1 X124.886 Y158.425 E.02057
G3 X123.819 Y156.958 I5.965 J-5.459 E.06768
G3 X123.386 Y155.252 I4.589 J-2.073 E.06592
G1 X123.334 Y154.709 E.0203
G3 X123.632 Y152.932 I8.305 J.48 E.06724
G3 X123.746 Y152.657 I4.729 J1.809 E.01108
; WIPE_START
G1 X123.938 Y152.263 E-.16663
G1 X124.191 Y151.875 E-.17608
G1 X124.541 Y151.417 E-.21893
G1 X124.875 Y151.016 E-.19836
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.357 Y152.526 Z.6 F42000
G1 X132.792 Y152.614 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50849
G1 F6300
M204 S500
G1 X131.763 Y151.585 E.05518
G1 X131.007 Y150.997 E.03634
G2 X130.044 Y150.524 I-1.824 J2.5 E.04093
G1 X132.877 Y153.357 E.15198
G3 X133.011 Y154.149 I-5.477 J1.334 E.03052
G1 X129.233 Y150.372 E.20267
G2 X128.526 Y150.323 I-.558 J2.913 E.02697
G1 X133.06 Y154.857 E.24326
G1 X132.989 Y155.444 E.02245
G1 X127.937 Y150.393 E.27103
G2 X127.373 Y150.487 I.22 J3.045 E.02172
G1 X128.819 Y151.933 E.07757
G2 X128.194 Y151.967 I-.207 J1.973 E.02383
G1 X126.88 Y150.652 E.07052
G2 X126.449 Y150.88 I.716 J1.872 E.01852
G1 X127.669 Y152.1 E.06544
G1 X127.56 Y152.135 E.00436
G1 X127.232 Y152.321 E.0143
G1 X126.065 Y151.154 E.06259
G1 X125.695 Y151.442 E.0178
G1 X126.859 Y152.607 E.06247
G2 X126.539 Y152.945 I.503 J.797 E.01785
G1 X125.359 Y151.765 E.06332
G1 X125.067 Y152.131 E.01778
G1 X126.269 Y153.333 E.06447
G1 X126.105 Y153.647 E.01343
G1 X126.065 Y153.788 E.00555
G1 X124.787 Y152.51 E.06858
G2 X124.55 Y152.931 I1.68 J1.222 E.01838
G1 X125.949 Y154.331 E.0751
G1 X125.905 Y154.696 E.01395
G1 X125.938 Y154.978 E.01078
G1 X124.207 Y153.247 E.09288
; WIPE_START
G1 X125.621 Y154.661 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.09 Y154.204 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X132.888 Y156.002 E.0965
G3 X132.712 Y156.485 I-2.783 J-.742 E.01951
G1 X131.312 Y155.084 E.07515
G3 X131.195 Y155.626 I-1.749 J-.091 E.02113
G1 X132.476 Y156.907 E.06872
G3 X132.197 Y157.286 I-2.14 J-1.285 E.01789
G1 X130.99 Y156.08 E.06473
G1 X130.719 Y156.467 E.01793
G1 X131.907 Y157.655 E.06376
G3 X131.57 Y157.977 I-.842 J-.545 E.01783
G1 X130.396 Y156.802 E.063
G1 X130.021 Y157.085 E.01784
G1 X131.204 Y158.268 E.06347
G3 X130.819 Y158.542 I-1.608 J-1.848 E.01794
G1 X129.579 Y157.302 E.06652
G3 X129.047 Y157.429 I-.63 J-1.469 E.02085
G1 X130.389 Y158.77 E.07196
G3 X129.884 Y158.924 I-.905 J-2.059 E.02005
G1 X128.178 Y157.218 E.09152
; WIPE_START
G1 X129.593 Y158.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.5 Y159.198 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X124.275 Y153.973 E.28032
G1 X124.203 Y154.56 E.02241
G1 X128.729 Y159.085 E.24281
G1 X127.99 Y159.005 E.02818
G1 X124.249 Y155.265 E.2007
G2 X124.378 Y156.052 I4.193 J-.282 E.03031
G1 X127.179 Y158.853 E.15027
G3 X126.27 Y158.408 I1.129 J-3.463 E.03851
G1 X125.492 Y157.823 E.03694
G1 X124.456 Y156.788 E.05554
; WIPE_START
G1 X125.492 Y157.823 E-.55629
G1 X125.92 Y158.145 E-.20371
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.527 Y157.524 Z.6 F42000
G1 X141.01 Y156.912 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X141.01 Y159.459 E.09485
G3 X139.828 Y159.408 I-.334 J-6.034 E.04413
G3 X138.06 Y158.593 I.354 J-3.096 E.07377
G1 X137.775 Y158.352 E.01389
G3 X136.918 Y156.817 I4.107 J-3.3 E.0658
G3 X136.71 Y155.167 I7.5 J-1.784 E.06207
G1 X136.71 Y150.129 E.18763
G1 X139.155 Y150.129 E.0911
G1 X139.155 Y154.428 E.16009
G2 X139.358 Y155.777 I3.597 J.148 E.05113
G2 X140.489 Y156.731 I1.654 J-.813 E.0567
G1 X140.954 Y156.892 E.01832
M204 S6000
G1 X141.467 Y156.349 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X141.467 Y159.863 E.1309
G3 X138.798 Y159.619 I-.842 J-5.503 E.10081
G3 X137.435 Y158.663 I2.667 J-5.258 E.06224
G3 X136.524 Y157.091 I4.825 J-3.842 E.06793
G3 X136.285 Y155.714 I5.774 J-1.713 E.05216
G1 X136.252 Y155.181 E.0199
G1 X136.252 Y149.672 E.20517
G1 X139.612 Y149.672 E.12515
G1 X139.612 Y154.423 E.17694
G2 X139.777 Y155.591 I3.137 J.155 E.0442
G2 X140.649 Y156.303 I1.259 J-.652 E.04313
G1 X140.997 Y156.423 E.0137
G2 X141.409 Y156.363 I-.163 J-2.554 E.01555
; WIPE_START
G1 X141.442 Y158.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.973 Y151.237 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50031
G1 F6300
M204 S500
G1 X138.254 Y150.518 E.0379
G1 X137.607 Y150.518 E.02411
G1 X138.767 Y151.678 E.06115
G1 X138.767 Y152.325 E.02411
G1 X137.098 Y150.656 E.08798
G1 X137.098 Y151.302 E.02411
G1 X138.767 Y152.972 E.08798
G1 X138.767 Y153.618 E.02411
G1 X137.098 Y151.949 E.08798
M73 P51 R7
G1 X137.098 Y152.596 E.02411
G1 X138.767 Y154.265 E.08798
G2 X138.786 Y154.931 I8.662 J.085 E.02484
G1 X137.098 Y153.243 E.08898
G1 X137.098 Y153.89 E.02411
G1 X138.932 Y155.724 E.09669
G1 X139.002 Y155.937 E.00836
G1 X139.235 Y156.334 E.01714
G1 X139.541 Y156.653 E.01647
G2 X140.264 Y157.056 I1.546 J-1.922 E.03102
G1 X140.622 Y157.414 E.01885
G1 X140.622 Y158.061 E.02411
G1 X137.098 Y154.537 E.18574
G2 X137.1 Y155.186 I4.695 J.308 E.02421
G1 X140.622 Y158.707 E.18563
G1 X140.622 Y159.088 E.01418
G3 X140.336 Y159.068 I-.068 J-1.112 E.01071
G1 X137.148 Y155.881 E.16803
G2 X137.28 Y156.659 I6.339 J-.67 E.02944
G1 X139.842 Y159.221 E.13504
; WIPE_START
G1 X138.427 Y157.807 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.55 Y155.065 Z.6 F42000
G1 X145.835 Y154.956 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X144.522 Y154.089 I18.008 J-28.737 E.05861
G3 X143.818 Y153.288 I1.208 J-1.772 E.04015
G3 X143.614 Y152.184 I2.138 J-.964 E.04224
G1 X143.614 Y150.129 E.07653
G1 X146.06 Y150.129 E.0911
G1 X146.06 Y152.755 E.09781
G2 X146.298 Y153.766 I2.133 J.031 E.03905
G2 X147.2 Y154.386 I1.228 J-.819 E.04178
G1 X147.612 Y154.491 E.01583
G2 X148.622 Y154.054 I-.57 J-2.699 E.04124
G2 X149.135 Y152.867 I-1.074 J-1.17 E.04962
G1 X149.147 Y150.129 E.10196
G1 X151.593 Y150.129 E.0911
G1 X151.593 Y152.337 E.08224
G3 X151.38 Y153.544 I-2.743 J.139 E.04604
G3 X150.843 Y154.168 I-1.763 J-.974 E.03088
G1 X149.754 Y154.977 E.05053
G1 X150.889 Y155.818 E.0526
G3 X151.551 Y157.029 I-1.188 J1.437 E.05268
G3 X151.593 Y157.701 I-5.651 J.688 E.0251
G1 X151.593 Y159.255 E.05787
G1 X149.147 Y159.255 E.0911
G1 X149.147 Y157.303 E.07272
G2 X148.901 Y156.285 I-2.125 J-.025 E.0394
G2 X147.997 Y155.673 I-1.225 J.836 E.04163
G1 X147.645 Y155.585 E.01349
G2 X146.441 Y156.158 I.036 J1.63 E.05117
G2 X146.06 Y157.307 I1.708 J1.203 E.04576
G1 X146.06 Y159.255 E.07255
G1 X143.614 Y159.255 E.0911
G3 X143.622 Y157.63 I22.329 J-.701 E.06053
G3 X144.625 Y155.801 I2.162 J-.004 E.08107
G1 X145.786 Y154.99 E.05274
M204 S6000
G1 X145.02 Y154.968 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X143.883 Y154.151 I4.028 J-6.804 E.0522
G3 X143.474 Y153.643 I3.489 J-3.232 E.02431
G3 X143.157 Y152.193 I2.664 J-1.342 E.05587
G1 X143.157 Y149.672 E.09389
G1 X146.517 Y149.672 E.12515
G1 X146.517 Y152.737 E.11416
G2 X146.761 Y153.629 I1.54 J.057 E.03495
G2 X147.325 Y153.946 I.796 J-.753 E.02447
G1 X147.601 Y154.016 E.0106
G2 X148.418 Y153.617 I-.35 J-1.749 E.03425
G2 X148.679 Y152.835 I-1.072 J-.793 E.03122
G1 X148.69 Y149.672 E.11779
G1 X152.05 Y149.672 E.12515
G1 X152.05 Y152.344 E.09953
G3 X151.792 Y153.748 I-3.233 J.132 E.0536
G3 X151.124 Y154.529 I-2.25 J-1.249 E.03855
G1 X150.521 Y154.977 E.02795
G3 X151.293 Y155.56 I-4.668 J6.983 E.03604
G3 X152.003 Y156.959 I-1.566 J1.674 E.05967
G3 X152.05 Y157.694 I-6.108 J.758 E.02745
G1 X152.05 Y159.712 E.07515
G1 X148.69 Y159.712 E.12515
G1 X148.69 Y157.322 E.08904
G2 X148.439 Y156.426 I-1.533 J-.053 E.03519
G2 X147.875 Y156.113 I-.795 J.769 E.02438
G1 X147.621 Y156.05 E.00974
G2 X146.583 Y156.864 I.028 J1.105 E.05262
G2 X146.517 Y157.324 I1.794 J.491 E.01735
G1 X146.517 Y159.712 E.08896
G1 X143.157 Y159.712 E.12515
G1 X143.157 Y157.845 E.06954
G3 X143.477 Y156.358 I3.148 J-.101 E.05723
G3 X144.357 Y155.431 I2.695 J1.678 E.04792
G1 X144.971 Y155.002 E.02791
; WIPE_START
G1 X144.254 Y154.46 E-.34134
G1 X143.883 Y154.151 E-.18357
G1 X143.495 Y153.669 E-.2351
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.155 Y154.892 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.288734
G1 F3000
M204 S500
G2 X146.429 Y154.586 I-.495 J-.719 E.00831
; LINE_WIDTH: 0.25573
G1 X146.52 Y154.448 E.00286
; LINE_WIDTH: 0.224147
G1 X146.517 Y154.429 E.00028
; LINE_WIDTH: 0.196487
G1 X146.5 Y154.319 E.0014
; WIPE_START
G1 X146.517 Y154.429 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.878 Y151.337 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54752
G1 F6300
M204 S500
G1 X145.058 Y150.518 E.04763
G1 X144.345 Y150.518 E.02934
G1 X145.672 Y151.845 E.07717
G1 X145.672 Y152.558 E.02934
G1 X144.006 Y150.893 E.09685
G1 X144.01 Y151.61 E.02948
G1 X145.731 Y153.332 E.10012
G1 X145.851 Y153.741 E.01754
G2 X145.99 Y154.003 I.94 J-.333 E.01223
G1 X145.961 Y154.007 E.00123
G1 X146 Y154.268 E.01084
G1 X145.982 Y154.295 E.00136
G1 X144.013 Y152.327 E.11447
G2 X144.21 Y153.215 I1.912 J.041 E.03775
G1 X144.287 Y153.315 E.00519
G1 X145.471 Y154.498 E.06881
; WIPE_START
G1 X144.287 Y153.315 E-.63596
G1 X144.21 Y153.215 E-.04793
G1 X144.14 Y153.027 E-.07611
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.406 Y151.251 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.50858
G1 F6300
M204 S500
G1 X150.673 Y150.518 E.03933
G1 X150.014 Y150.518 E.02499
G1 X151.198 Y151.702 E.06354
G1 X151.196 Y152.358 E.02489
G1 X149.535 Y150.697 E.08911
G1 X149.535 Y151.356 E.02499
G1 X151.153 Y152.973 E.0868
G1 X151.027 Y153.374 E.01594
G1 X150.974 Y153.453 E.00361
G1 X149.535 Y152.014 E.07721
G3 X149.531 Y152.668 I-4.85 J.295 E.02484
G1 X150.668 Y153.806 E.06104
G1 X150.292 Y154.088 E.01785
G1 X149.475 Y153.271 E.04382
G1 X149.454 Y153.388 E.00449
G1 X149.319 Y153.774 E.01551
G1 X149.916 Y154.37 E.032
G1 X149.539 Y154.652 E.01785
G1 X149.058 Y154.171 E.02583
G3 X148.702 Y154.474 I-1.604 J-1.522 E.01776
G1 X151.122 Y156.894 E.12987
G3 X151.201 Y157.631 I-2.636 J.653 E.02821
G1 X148.257 Y154.688 E.15795
G3 X147.762 Y154.851 I-1.44 J-3.528 E.0198
G1 X148.259 Y155.347 E.02663
G1 X148.706 Y155.551 E.01867
G3 X149.405 Y156.494 I-.878 J1.38 E.04555
G1 X151.204 Y158.293 E.09656
G1 X151.204 Y158.867 E.02176
G1 X151.119 Y158.867 E.00323
G1 X149.535 Y157.283 E.085
G1 X149.535 Y157.941 E.02499
G1 X150.461 Y158.867 E.04966
M73 P52 R7
G1 X149.802 Y158.867 E.02499
G1 X149.33 Y158.394 E.02536
; WIPE_START
G1 X149.802 Y158.867 E-.25393
G1 X150.461 Y158.867 E-.25025
G1 X149.985 Y158.391 E-.25582
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X147.653 Y155.4 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X147.005 Y154.752 E.03476
G1 X146.953 Y154.762 E.00199
G1 X146.704 Y155.11 E.01624
G1 X146.929 Y155.335 E.0121
G2 X146.507 Y155.571 I.596 J1.563 E.01843
G1 X146.361 Y155.426 E.0078
G1 X146.231 Y155.547 E.00675
G1 X146.01 Y155.308 E.01235
G1 X145.761 Y155.484 E.01158
G1 X146.163 Y155.886 E.02156
G1 X145.914 Y156.295 E.01819
G1 X145.375 Y155.756 E.02892
G1 X144.989 Y156.029 E.01793
G1 X145.735 Y156.775 E.04004
G1 X145.72 Y156.823 E.00191
G2 X145.672 Y157.37 I2.638 J.506 E.02089
G1 X144.614 Y156.313 E.05675
G2 X144.305 Y156.662 I.908 J1.117 E.01778
G1 X145.672 Y158.029 E.07336
G1 X145.672 Y158.688 E.02499
G1 X144.094 Y157.11 E.08464
G2 X144.012 Y157.686 I2.154 J.604 E.02213
G1 X145.192 Y158.867 E.06336
G1 X144.534 Y158.867 E.02499
G1 X143.797 Y158.13 E.03953
; WIPE_START
G1 X144.534 Y158.867 E-.39589
G1 X145.192 Y158.867 E-.25024
G1 X144.98 Y158.655 E-.11388
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.459 Y157.132 Z.6 F42000
G1 X162.146 Y155.159 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X159.65 Y155.159 E.09299
G1 X159.63 Y154.826 E.01245
G1 X164.324 Y154.826 E.17483
G3 X163.968 Y156.689 I-5.998 J-.181 E.07096
G3 X162.975 Y158.135 I-6.355 J-3.299 E.0655
G3 X161.495 Y159.141 I-4.23 J-4.631 E.06687
G3 X160.109 Y159.443 I-1.687 J-4.41 E.05307
G1 X159.623 Y159.488 E.01815
G3 X157.949 Y159.225 I.408 J-8.061 E.06324
G3 X156.546 Y158.405 I1.626 J-4.393 E.06082
G1 X156.16 Y158.095 E.01843
G3 X155.193 Y156.746 I5.745 J-5.143 E.06196
G3 X154.805 Y155.181 I4.239 J-1.881 E.06034
G1 X154.758 Y154.686 E.01854
G3 X155.02 Y153.036 I7.807 J.395 E.06232
G3 X155.835 Y151.666 I4.24 J1.595 E.0597
G1 X156.144 Y151.29 E.01812
G3 X157.652 Y150.275 I4.766 J5.453 E.0679
G3 X159.736 Y149.93 I1.986 J5.538 E.07909
G3 X161.427 Y150.276 I-.204 J5.301 E.06458
G3 X161.975 Y150.565 I-2.44 J5.297 E.02307
G1 X160.754 Y152.032 E.0711
G2 X159.714 Y151.741 I-1.507 J3.376 E.04034
G2 X158.51 Y152.092 I.133 J2.701 E.04718
G2 X157.856 Y152.725 I2.522 J3.254 E.03396
G2 X157.295 Y155.352 I3.376 J2.095 E.10207
G2 X157.881 Y156.955 I3.584 J-.403 E.06418
G2 X158.835 Y157.729 I2.21 J-1.747 E.04612
G2 X159.76 Y157.922 I1.287 J-3.859 E.03529
G2 X160.81 Y157.649 I-.521 J-4.151 E.04052
G2 X161.734 Y156.472 I-.902 J-1.66 E.05731
G1 X162.129 Y155.216 E.04902
M204 S6000
G1 X161.524 Y155.616 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P52 R6
G1 X159.283 Y155.616 E.08347
G3 X159.241 Y154.368 I2.547 J-.71 E.04694
G1 X164.768 Y154.368 E.20585
G3 X164.741 Y155.291 I-4.102 J.342 E.03443
G3 X164.31 Y157.035 I-4.977 J-.303 E.06731
G3 X163.3 Y158.46 I-7.343 J-4.135 E.06516
G3 X161.676 Y159.561 I-4.59 J-5.022 E.07332
G3 X160.156 Y159.898 I-1.865 J-4.815 E.05824
G1 X159.623 Y159.947 E.01992
G3 X157.809 Y159.66 I.433 J-8.625 E.06852
G3 X156.264 Y158.765 I1.773 J-4.842 E.06685
G1 X155.837 Y158.422 E.0204
G3 X154.784 Y156.95 I6.17 J-5.531 E.06753
G3 X154.35 Y155.23 I4.662 J-2.089 E.06641
G1 X154.299 Y154.686 E.02035
G3 X154.585 Y152.895 I8.372 J.419 E.06771
G3 X155.478 Y151.381 I4.687 J1.745 E.06581
G1 X155.821 Y150.963 E.02013
G3 X157.301 Y149.933 I5.565 J6.419 E.06727
G3 X159.044 Y149.508 I2.072 J4.709 E.0672
G1 X159.591 Y149.459 E.02045
G1 X159.776 Y149.475 E.00692
G3 X161.61 Y149.858 I-.244 J5.758 E.07009
G3 X162.658 Y150.458 I-3.092 J6.608 E.04502
G1 X160.827 Y152.659 E.10662
G2 X159.705 Y152.203 I-1.269 J1.516 E.04585
G2 X158.763 Y152.473 I.105 J2.144 E.03681
G2 X158 Y153.435 I1.275 J1.794 E.04634
G2 X157.75 Y155.307 I3.249 J1.388 E.0712
G2 X158.254 Y156.685 I2.875 J-.27 E.05528
G2 X159.145 Y157.354 I1.54 J-1.123 E.04211
G2 X159.749 Y157.46 I.941 J-3.593 E.02288
G2 X160.727 Y157.172 I-.297 J-2.813 E.03821
G2 X161.302 Y156.324 I-.867 J-1.206 E.03892
G1 X161.506 Y155.673 E.02541
; WIPE_START
G1 X159.507 Y155.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.25 Y151.15 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51994
G1 F6300
M204 S500
G1 X160.514 Y150.415 E.04041
G1 X159.747 Y150.323 E.03003
G1 X160.797 Y151.373 E.05771
G1 X160.641 Y151.561 E.00951
G2 X160.186 Y151.436 I-.877 J2.312 E.01834
G1 X159.111 Y150.361 E.05912
G2 X158.513 Y150.437 I.122 J3.346 E.02348
G1 X159.461 Y151.385 E.05212
G2 X158.899 Y151.498 I.135 J2.135 E.02235
G1 X157.972 Y150.571 E.05095
G1 X157.527 Y150.77 E.01893
G1 X157.508 Y150.782 E.00089
G1 X158.425 Y151.699 E.0504
G1 X158.296 Y151.765 E.00563
G1 X158.031 Y151.98 E.01325
G1 X157.1 Y151.049 E.05117
G1 X156.718 Y151.341 E.01871
G1 X157.699 Y152.322 E.05394
G2 X157.421 Y152.719 I.609 J.722 E.01904
G1 X156.354 Y151.652 E.05868
G1 X156.057 Y152.029 E.01868
G1 X157.195 Y153.167 E.06255
G2 X157.018 Y153.665 I2.461 J1.155 E.02056
G1 X155.768 Y152.415 E.06874
G2 X155.523 Y152.844 I1.707 J1.257 E.01927
G1 X156.913 Y154.235 E.07644
G1 X156.875 Y154.871 E.02477
G1 X155.339 Y153.336 E.08441
G2 X155.238 Y153.909 I2.842 J.797 E.02267
G1 X157.202 Y155.873 E.10797
; WIPE_START
G1 X155.788 Y154.459 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.083 Y155.008 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X163.828 Y155.753 E.04093
G3 X163.696 Y156.295 I-2.7 J-.369 E.02174
G1 X162.615 Y155.214 E.05945
G1 X162.536 Y155.214 E.00304
G1 X162.394 Y155.668 E.01849
G1 X163.493 Y156.767 E.0604
G3 X163.228 Y157.176 I-4.587 J-2.676 E.01897
G1 X162.233 Y156.181 E.05469
G3 X162.065 Y156.689 I-3.151 J-.757 E.02079
G1 X162.933 Y157.556 E.04768
G1 X162.698 Y157.858 E.01487
G1 X162.621 Y157.919 E.00382
G1 X161.858 Y157.156 E.04193
G3 X161.572 Y157.545 I-1.584 J-.863 E.01882
G1 X162.241 Y158.213 E.03673
G3 X161.853 Y158.5 I-1.691 J-1.882 E.01878
G1 X161.208 Y157.855 E.03545
G3 X160.761 Y158.083 I-.758 J-.934 E.01964
G1 X161.422 Y158.744 E.03634
G3 X160.922 Y158.919 I-1.716 J-4.107 E.0206
G1 X160.229 Y158.225 E.03813
G1 X159.77 Y158.317 E.01818
G1 X159.624 Y158.295 E.00574
G1 X160.345 Y159.016 E.03963
G1 X159.738 Y159.084 E.02372
G1 X158.771 Y158.116 E.0532
G1 X158.684 Y158.09 E.00351
G3 X157.791 Y157.434 I1.087 J-2.415 E.04339
G1 X157.565 Y157.184 E.01309
G3 X157.234 Y156.579 I6.409 J-3.9 E.02683
G1 X155.169 Y154.514 E.11353
G1 X155.149 Y154.686 E.00672
G1 X155.212 Y155.232 E.0214
G1 X159.006 Y159.026 E.20856
G3 X158.196 Y158.891 I.466 J-5.27 E.03197
M73 P53 R6
G1 X155.342 Y156.037 E.15688
G2 X155.817 Y157.029 I2.942 J-.799 E.04298
G1 X156.393 Y157.762 E.03625
G1 X157.418 Y158.787 E.05632
; WIPE_START
G1 X156.393 Y157.762 E-.55059
G1 X156.053 Y157.329 E-.20941
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.675 Y156.933 Z.6 F42000
G1 X170.337 Y156.588 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X170.442 Y156.682 E.00523
G2 X171.112 Y157.019 I.971 J-1.095 E.02824
G1 X171.49 Y157.109 E.0145
G2 X172.392 Y156.81 I-.521 J-3.074 E.03553
G2 X173.008 Y155.713 I-.798 J-1.17 E.04854
G1 X173.035 Y155.42 E.01099
G1 X173.035 Y150.129 E.19705
G1 X175.481 Y150.129 E.0911
G1 X175.481 Y154.969 E.18027
G3 X175.256 Y156.784 I-7.319 J.012 E.06831
G3 X174.568 Y158.104 I-6.041 J-2.311 E.05553
G3 X173.235 Y159.139 I-3.942 J-3.698 E.06314
G3 X171.93 Y159.436 I-1.562 J-3.856 E.05006
G3 X171.073 Y159.434 I-.423 J-2.182 E.03211
G3 X169.015 Y158.567 I.196 J-3.342 E.08479
G3 X168.43 Y157.965 I1.149 J-1.701 E.0315
G3 X167.663 Y156.473 I2.812 J-2.389 E.06304
G3 X167.513 Y155.274 I10.701 J-1.944 E.04502
G1 X167.513 Y150.129 E.19162
G1 X169.959 Y150.129 E.0911
G1 X169.959 Y155.418 E.19698
G2 X170.202 Y156.409 I2.118 J.006 E.03838
G2 X170.302 Y156.539 I1.211 J-.822 E.00613
M204 S6000
G1 X170.664 Y156.268 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X171.23 Y156.577 I.779 J-.752 E.02439
G1 X171.491 Y156.64 E.01001
G2 X172.245 Y156.351 I-.178 J-1.593 E.0304
G2 X172.554 Y155.657 I-.817 J-.78 E.02885
G1 X172.578 Y155.399 E.00967
G1 X172.578 Y149.672 E.21329
G1 X175.938 Y149.672 E.12515
G1 X175.938 Y154.979 E.19767
G3 X175.744 Y156.746 I-8.445 J-.036 E.06632
G3 X174.926 Y158.394 I-6.147 J-2.024 E.06875
G3 X173.593 Y159.471 I-4.667 J-4.412 E.06401
G3 X171.979 Y159.89 I-1.891 J-3.959 E.0625
G3 X171.022 Y159.888 I-.472 J-2.439 E.03589
G3 X169.313 Y159.355 I.245 J-3.792 E.0673
G3 X168.35 Y158.604 I5.943 J-8.612 E.04551
G3 X167.372 Y157.096 I4.462 J-3.964 E.0672
G3 X167.103 Y155.816 I5.072 J-1.736 E.04886
G1 X167.056 Y155.294 E.01949
G1 X167.056 Y149.672 E.2094
G1 X170.416 Y149.672 E.12515
G1 X170.416 Y155.398 E.21326
G2 X170.632 Y156.217 I1.522 J.037 E.03198
; WIPE_START
G1 X170.841 Y156.421 E-.11075
G1 X170.956 Y156.483 E-.04959
G1 X171.23 Y156.577 E-.11019
G1 X171.491 Y156.64 E-.10215
G1 X171.912 Y156.532 E-.16499
G1 X172.147 Y156.422 E-.09872
G1 X172.245 Y156.351 E-.04606
G1 X172.326 Y156.27 E-.04345
G1 X172.374 Y156.194 E-.03409
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X169.122 Y150.312 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50604
G1 F6300
M204 S500
G1 X169.571 Y150.761 E.02396
G1 X169.571 Y151.416 E.02472
G1 X168.673 Y150.518 E.04793
G1 X168.018 Y150.518 E.02472
G1 X169.571 Y152.071 E.08289
G1 X169.571 Y152.726 E.02472
G1 X167.902 Y151.057 E.08908
G1 X167.902 Y151.712 E.02472
G1 X169.571 Y153.381 E.08908
G1 X169.571 Y154.036 E.02472
G1 X167.902 Y152.367 E.08908
G1 X167.902 Y153.022 E.02472
G1 X169.571 Y154.691 E.08908
G1 X169.571 Y155.346 E.02472
G1 X167.696 Y153.471 E.10006
; WIPE_START
G1 X169.11 Y154.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X175.298 Y151.249 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X174.567 Y150.518 E.03902
G1 X173.912 Y150.518 E.02472
G1 X175.093 Y151.698 E.063
G1 X175.093 Y152.353 E.02472
G1 X173.424 Y150.684 E.08908
G1 X173.424 Y151.339 E.02472
G1 X175.093 Y153.008 E.08908
G1 X175.093 Y153.663 E.02472
G1 X173.424 Y151.994 E.08908
G1 X173.424 Y152.649 E.02472
G1 X175.093 Y154.318 E.08908
G3 X175.092 Y154.972 I-7.359 J.321 E.02471
G1 X173.424 Y153.304 E.08905
G1 X173.424 Y153.959 E.02472
G1 X175.059 Y155.594 E.08726
G3 X174.994 Y156.184 I-3.797 J-.118 E.02243
G1 X173.424 Y154.614 E.08381
G1 X173.424 Y155.269 E.02472
G1 X174.867 Y156.712 E.07704
G3 X174.665 Y157.165 I-2.442 J-.817 E.01875
G1 X173.373 Y155.873 E.06894
G1 X173.362 Y155.974 E.00381
G1 X173.235 Y156.39 E.01642
G1 X174.428 Y157.582 E.06364
G1 X174.264 Y157.855 E.012
G1 X174.15 Y157.96 E.00584
G1 X172.988 Y156.798 E.06201
G3 X172.643 Y157.108 I-1.419 J-1.234 E.01755
G1 X173.808 Y158.272 E.06217
G3 X173.444 Y158.564 I-1.878 J-1.97 E.0176
G1 X172.206 Y157.326 E.06609
G1 X171.686 Y157.46 E.02028
G1 X173.026 Y158.801 E.07154
G3 X172.518 Y158.948 I-.742 J-1.621 E.02004
G1 X170.942 Y157.371 E.08413
G3 X169.664 Y156.094 I.369 J-1.646 E.07195
G1 X167.902 Y154.331 E.09404
G1 X167.902 Y154.986 E.02472
G1 X171.954 Y159.038 E.21625
G1 X171.505 Y159.086 E.01703
G1 X171.327 Y159.066 E.00678
G1 X167.95 Y155.69 E.18019
G2 X168.061 Y156.456 I3.755 J-.153 E.02926
G1 X170.565 Y158.959 E.13361
G3 X169.442 Y158.41 I.573 J-2.597 E.04762
G1 X168.976 Y158.025 E.0228
G1 X168.131 Y157.181 E.04509
; OBJECT_ID: 701
; WIPE_START
G1 X168.976 Y158.025 E-.454
G1 X169.442 Y158.41 E-.22961
G1 X169.606 Y158.527 E-.07639
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1070
M625
; start printing object, unique label id: 701
M624 AQAAAAAAAAA=
M204 S6000
G1 X162.522 Y155.684 Z.6 F42000
G1 X116.661 Y137.275 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X116.661 Y137.732 E.01702
G1 X118.108 Y137.732 E.05391
G1 X118.108 Y140.092 E.0879
G1 X116.661 Y140.092 E.05391
G1 X116.661 Y142.705 E.09734
G2 X116.91 Y143.971 I2.976 J.07 E.04842
G2 X117.95 Y144.747 I1.452 J-.859 E.04963
G1 X118.41 Y144.883 E.01784
G2 X119.379 Y144.615 I-.447 J-3.501 E.0376
G2 X119.728 Y144.369 I-.814 J-1.523 E.01593
G1 X121.905 Y145.958 E.1004
M73 P54 R6
G3 X120.384 Y147.01 I-3.072 J-2.817 E.06945
G3 X118.639 Y147.346 I-2.521 J-8.377 E.06629
G3 X116.814 Y147.014 I.25 J-6.557 E.06934
G3 X115.619 Y146.235 I1.908 J-4.235 E.05334
G1 X115.245 Y145.917 E.01829
G3 X114.223 Y144.294 I5.935 J-4.873 E.07163
G3 X113.916 Y142.754 I5.166 J-1.83 E.05869
G1 X113.872 Y142.184 E.02129
G1 X113.872 Y133.915 E.30799
G1 X116.661 Y133.915 E.10388
G1 X116.661 Y137.215 E.12291
M204 S6000
G1 X117.118 Y137.275 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.565 Y137.275 E.05391
G1 X118.565 Y140.549 E.12195
G1 X117.118 Y140.549 E.05391
G1 X117.118 Y142.694 E.07989
G2 X117.313 Y143.752 I2.534 J.08 E.04038
G2 X118.092 Y144.313 I1.052 J-.641 E.03673
G1 X118.433 Y144.414 E.01326
G2 X119.361 Y144.075 I-.145 J-1.838 E.03725
G2 X119.631 Y143.732 I-1.801 J-1.692 E.01625
G1 X122.593 Y145.894 E.1366
G3 X121.028 Y147.225 I-4.982 J-4.273 E.07684
G3 X119.21 Y147.734 I-2.357 J-4.923 E.07065
G1 X118.648 Y147.806 E.02111
G3 X116.641 Y147.437 I.264 J-7.087 E.07626
G3 X115.327 Y146.587 I2.075 J-4.65 E.05855
G1 X114.91 Y146.231 E.02042
G3 X113.873 Y144.641 I7.041 J-5.72 E.07082
G3 X113.46 Y142.794 I5.301 J-2.155 E.0708
G1 X113.415 Y142.202 E.02214
G1 X113.415 Y133.458 E.32568
G1 X117.118 Y133.458 E.13792
G1 X117.118 Y137.215 E.13993
; WIPE_START
G1 X118.565 Y137.275 E-.55053
G1 X118.565 Y137.826 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.478 Y135.068 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.52187
G1 F6300
M204 S500
G1 X115.713 Y134.303 E.04221
G1 X115.036 Y134.303 E.02644
G1 X116.272 Y135.54 E.06824
G1 X116.272 Y136.217 E.02644
G1 X114.358 Y134.303 E.10562
G1 X114.26 Y134.303 E.00384
G1 X114.26 Y134.882 E.02259
G1 X116.478 Y137.1 E.12241
; WIPE_START
G1 X115.064 Y135.686 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.292 Y137.915 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X117.72 Y138.342 E.02358
G1 X117.72 Y139.019 E.02644
G1 X116.821 Y138.12 E.04961
G1 X116.272 Y138.12 E.02141
G1 X116.272 Y137.572 E.02141
G1 X114.26 Y135.56 E.11106
G1 X114.26 Y136.237 E.02644
G1 X117.72 Y139.696 E.19095
G1 X117.049 Y139.704 E.02616
G1 X114.26 Y136.914 E.15396
G1 X114.26 Y137.592 E.02644
G1 X116.372 Y139.704 E.11657
G1 X116.272 Y139.704 E.0039
G1 X116.272 Y140.281 E.02254
G1 X114.26 Y138.269 E.11106
G1 X114.26 Y138.946 E.02644
G1 X116.272 Y140.958 E.11106
G1 X116.272 Y141.636 E.02644
G1 X114.26 Y139.624 E.11106
G1 X114.26 Y140.301 E.02644
G1 X116.272 Y142.313 E.11106
G2 X116.286 Y143.005 I7.03 J.201 E.02701
G1 X114.054 Y140.773 E.1232
; WIPE_START
G1 X115.469 Y142.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.423 Y144.787 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X120.925 Y146.288 E.08286
G3 X120.497 Y146.538 I-1.143 J-1.469 E.01939
G1 X119.092 Y145.133 E.07752
G3 X118.537 Y145.255 I-.908 J-2.817 E.02224
G1 X120 Y146.718 E.08078
G3 X119.437 Y146.833 I-.884 J-2.908 E.02245
G1 X117.661 Y145.056 E.09804
G1 X117.202 Y144.835 E.01986
G1 X116.869 Y144.565 E.01674
G1 X116.691 Y144.355 E.01075
G1 X116.47 Y143.95 E.01802
G1 X116.436 Y143.832 E.00481
G1 X114.26 Y141.656 E.1201
G2 X114.278 Y142.351 I3.614 J.255 E.02718
G1 X118.849 Y146.922 E.25229
G1 X118.629 Y146.955 E.00867
G1 X118.158 Y146.909 E.01847
G1 X114.35 Y143.1 E.21019
G2 X114.524 Y143.951 I4.156 J-.405 E.03395
G1 X117.344 Y146.771 E.15565
G3 X116.421 Y146.358 I.605 J-2.592 E.03971
G3 X115.614 Y145.719 I4.661 J-6.708 E.04018
G1 X114.675 Y144.78 E.05186
; WIPE_START
G1 X115.614 Y145.719 E-.50489
G1 X116.066 Y146.097 E-.22366
G1 X116.132 Y146.146 E-.03145
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.713 Y142.279 Z.6 F42000
G1 X130.776 Y137.542 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X130.785 Y137.58 E.00146
G3 X130.297 Y140.17 I-2.283 J.911 E.10365
G3 X128.626 Y140.878 I-1.71 J-1.712 E.06929
G3 X127.903 Y140.76 I.23 J-3.687 E.02732
G3 X126.642 Y137.243 I.807 J-2.274 E.15917
G3 X128.427 Y136.109 I1.988 J1.158 E.08186
G1 X128.628 Y136.088 E.00753
G3 X130.29 Y136.8 I-.05 J2.413 E.06902
G3 X130.617 Y137.237 I-3.653 J3.07 E.02034
G1 X130.748 Y137.488 E.01056
M204 S6000
G1 X130.363 Y137.749 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X130.481 Y138.758 I-1.786 J.72 E.03829
G3 X128.037 Y140.323 I-1.859 J-.213 E.12366
G3 X126.952 Y137.618 I.681 J-1.843 E.12226
G3 X128.479 Y136.563 I1.691 J.814 E.07232
G3 X129.068 Y136.607 I.144 J2.059 E.02205
G3 X130.34 Y137.694 I-.491 J1.862 E.06447
; WIPE_START
G1 X130.451 Y138.029 E-.13406
G1 X130.507 Y138.482 E-.17361
G1 X130.481 Y138.758 E-.10542
G1 X130.418 Y139.084 E-.12615
G1 X130.373 Y139.219 E-.05413
G1 X130.239 Y139.481 E-.11157
G1 X130.153 Y139.597 E-.05506
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.187 Y136.579 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X124.896 Y135.491 I4.161 J1.94 E.04854
G1 X125.211 Y135.112 E.01836
G3 X126.72 Y134.074 I4.862 J5.455 E.06838
G3 X128.143 Y133.752 I1.762 J4.476 E.05456
G1 X128.639 Y133.704 E.01853
G1 X128.811 Y133.72 E.00645
G3 X130.573 Y134.083 I-.257 J5.707 E.06727
G3 X132.056 Y135.106 I-3.473 J6.617 E.06729
G3 X133.028 Y136.45 I-5.759 J5.19 E.06189
M73 P55 R6
G3 X133.421 Y138.004 I-4.178 J1.882 E.06
G1 X133.469 Y138.494 E.01833
G3 X133.141 Y140.278 I-6.39 J-.253 E.06781
G3 X132.382 Y141.482 I-4.344 J-1.898 E.05319
G3 X131.71 Y142.16 I-2.087 J-1.394 E.03578
G3 X130.16 Y143.046 I-2.849 J-3.185 E.06701
G3 X128.728 Y143.262 I-1.967 J-8.195 E.05401
G3 X127.03 Y143.004 I.398 J-8.33 E.06406
G3 X125.598 Y142.188 I1.624 J-4.514 E.06171
G1 X125.206 Y141.88 E.01857
G3 X124.228 Y140.537 I5.543 J-5.067 E.06201
G3 X123.841 Y138.988 I4.168 J-1.864 E.05979
G1 X123.793 Y138.495 E.01844
G3 X124.066 Y136.863 I7.735 J.452 E.06178
G3 X124.162 Y136.633 I4.282 J1.656 E.00925
M204 S6000
G1 X123.772 Y136.388 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X124.541 Y135.203 I4.59 J2.138 E.05282
G1 X124.888 Y134.786 E.02021
G3 X126.365 Y133.736 I5.659 J6.402 E.06761
G3 X128.093 Y133.298 I2.092 J4.621 E.06674
G1 X128.637 Y133.245 E.02036
G1 X128.854 Y133.265 E.00812
G3 X130.759 Y133.665 I-.298 J6.15 E.0728
G3 X132.379 Y134.78 I-3.7 J7.11 E.07344
G3 X133.436 Y136.244 I-6.181 J5.577 E.06737
G3 X133.875 Y137.953 I-4.601 J2.092 E.06608
G1 X133.928 Y138.494 E.02023
G3 X133.638 Y140.245 I-8.462 J-.5 E.06624
G3 X132.739 Y141.767 I-4.668 J-1.732 E.06619
G1 X132.399 Y142.183 E.02001
G3 X130.96 Y143.226 I-5.623 J-6.238 E.06632
G3 X129.264 Y143.667 I-2.082 J-4.521 E.06561
G1 X128.731 Y143.721 E.01998
G3 X126.894 Y143.441 I.42 J-8.899 E.06933
G3 X125.32 Y142.551 I1.768 J-4.964 E.06767
G1 X124.886 Y142.21 E.02057
G3 X123.819 Y140.744 I5.965 J-5.459 E.06768
G3 X123.386 Y139.037 I4.589 J-2.073 E.06592
G1 X123.334 Y138.494 E.0203
G3 X123.632 Y136.717 I8.305 J.48 E.06724
G3 X123.746 Y136.443 I4.729 J1.809 E.01108
; WIPE_START
G1 X123.938 Y136.049 E-.16663
G1 X124.191 Y135.66 E-.17608
G1 X124.541 Y135.203 E-.21893
G1 X124.875 Y134.801 E-.19836
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.357 Y136.312 Z.6 F42000
G1 X132.792 Y136.399 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50849
G1 F6300
M204 S500
G1 X131.763 Y135.371 E.05518
G1 X131.007 Y134.783 E.03634
G2 X130.044 Y134.31 I-1.824 J2.5 E.04093
G1 X132.877 Y137.142 E.15198
G3 X133.011 Y137.935 I-5.477 J1.334 E.03052
G1 X129.233 Y134.158 E.20267
G2 X128.526 Y134.108 I-.558 J2.913 E.02697
G1 X133.06 Y138.642 E.24326
G1 X132.989 Y139.23 E.02245
G1 X127.937 Y134.178 E.27103
G2 X127.373 Y134.273 I.22 J3.045 E.02172
G1 X128.819 Y135.719 E.07757
G2 X128.194 Y135.752 I-.207 J1.973 E.02383
G1 X126.88 Y134.438 E.07052
G2 X126.449 Y134.666 I.716 J1.872 E.01852
G1 X127.669 Y135.886 E.06544
G1 X127.56 Y135.921 E.00436
G1 X127.232 Y136.106 E.0143
G1 X126.065 Y134.94 E.06259
G1 X125.695 Y135.228 E.0178
G1 X126.859 Y136.392 E.06247
G2 X126.539 Y136.731 I.503 J.797 E.01785
G1 X125.359 Y135.55 E.06332
G1 X125.067 Y135.917 E.01778
G1 X126.269 Y137.119 E.06447
G1 X126.105 Y137.433 E.01343
G1 X126.065 Y137.573 E.00555
G1 X124.787 Y136.295 E.06858
G2 X124.55 Y136.716 I1.68 J1.222 E.01838
G1 X125.949 Y138.116 E.0751
G1 X125.905 Y138.481 E.01395
G1 X125.938 Y138.763 E.01078
G1 X124.207 Y137.032 E.09288
; WIPE_START
G1 X125.621 Y138.447 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.09 Y137.989 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X132.888 Y139.788 E.0965
G3 X132.712 Y140.27 I-2.783 J-.742 E.01951
G1 X131.312 Y138.87 E.07515
G3 X131.195 Y139.412 I-1.749 J-.091 E.02113
G1 X132.476 Y140.693 E.06872
G3 X132.197 Y141.072 I-2.14 J-1.285 E.01789
G1 X130.99 Y139.865 E.06473
G1 X130.719 Y140.252 E.01793
G1 X131.907 Y141.441 E.06376
G3 X131.57 Y141.762 I-.842 J-.545 E.01783
G1 X130.396 Y140.588 E.063
G1 X130.021 Y140.871 E.01784
G1 X131.204 Y142.054 E.06347
G3 X130.819 Y142.328 I-1.608 J-1.848 E.01794
G1 X129.579 Y141.088 E.06652
G3 X129.047 Y141.214 I-.63 J-1.469 E.02085
G1 X130.389 Y142.556 E.07196
G3 X129.884 Y142.71 I-.905 J-2.059 E.02005
G1 X128.178 Y141.004 E.09152
; WIPE_START
G1 X129.593 Y142.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.5 Y142.984 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X124.275 Y137.759 E.28032
G1 X124.203 Y138.345 E.02241
G1 X128.729 Y142.871 E.24281
G1 X127.99 Y142.791 E.02818
G1 X124.249 Y139.05 E.2007
G2 X124.378 Y139.837 I4.193 J-.282 E.03031
G1 X127.179 Y142.638 E.15027
G3 X126.27 Y142.194 I1.129 J-3.463 E.03851
G1 X125.492 Y141.609 E.03694
G1 X124.456 Y140.574 E.05554
; WIPE_START
G1 X125.492 Y141.609 E-.55629
G1 X125.92 Y141.931 E-.20371
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.527 Y141.309 Z.6 F42000
G1 X141.01 Y140.697 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X141.01 Y143.244 E.09485
G3 X139.828 Y143.194 I-.334 J-6.034 E.04413
G3 X138.06 Y142.379 I.354 J-3.096 E.07377
G1 X137.775 Y142.138 E.01389
G3 X136.918 Y140.603 I4.107 J-3.3 E.0658
G3 X136.71 Y138.952 I7.5 J-1.784 E.06207
G1 X136.71 Y133.915 E.18763
G1 X139.155 Y133.915 E.0911
G1 X139.155 Y138.213 E.16009
G2 X139.358 Y139.562 I3.597 J.148 E.05113
G2 X140.489 Y140.517 I1.654 J-.813 E.0567
G1 X140.954 Y140.678 E.01832
M204 S6000
G1 X141.467 Y140.134 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X141.467 Y143.649 E.1309
G3 X138.799 Y143.405 I-.842 J-5.503 E.10081
G3 X137.435 Y142.449 I2.667 J-5.258 E.06224
G3 X136.524 Y140.876 I4.825 J-3.842 E.06793
G3 X136.285 Y139.5 I5.774 J-1.713 E.05216
G1 X136.252 Y138.966 E.0199
G1 X136.252 Y133.458 E.20517
G1 X139.612 Y133.458 E.12515
G1 X139.612 Y138.208 E.17694
G2 X139.777 Y139.376 I3.137 J.155 E.0442
G2 X140.649 Y140.089 I1.259 J-.652 E.04313
G1 X140.997 Y140.209 E.0137
G2 X141.409 Y140.149 I-.163 J-2.554 E.01555
; WIPE_START
G1 X141.442 Y142.148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.973 Y135.022 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50031
G1 F6300
M204 S500
G1 X138.254 Y134.303 E.0379
G1 X137.607 Y134.303 E.02411
G1 X138.767 Y135.463 E.06115
G1 X138.767 Y136.11 E.02411
G1 X137.098 Y134.441 E.08798
G1 X137.098 Y135.088 E.02411
G1 X138.767 Y136.757 E.08798
G1 X138.767 Y137.404 E.02411
G1 X137.098 Y135.735 E.08798
G1 X137.098 Y136.382 E.02411
G1 X138.767 Y138.051 E.08798
G2 X138.786 Y138.717 I8.662 J.085 E.02484
G1 X137.098 Y137.029 E.08898
G1 X137.098 Y137.675 E.02411
M73 P56 R6
G1 X138.932 Y139.51 E.09669
G1 X139.002 Y139.723 E.00836
G1 X139.235 Y140.12 E.01714
G1 X139.541 Y140.438 E.01647
G2 X140.264 Y140.842 I1.546 J-1.922 E.03102
G1 X140.622 Y141.199 E.01885
G1 X140.622 Y141.846 E.02411
G1 X137.098 Y138.322 E.18574
G2 X137.1 Y138.971 I4.695 J.308 E.02421
G1 X140.622 Y142.493 E.18563
G1 X140.622 Y142.874 E.01418
G3 X140.336 Y142.854 I-.068 J-1.112 E.01071
G1 X137.148 Y139.666 E.16803
G2 X137.28 Y140.444 I6.339 J-.67 E.02944
G1 X139.842 Y143.006 E.13504
; WIPE_START
G1 X138.427 Y141.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.55 Y138.851 Z.6 F42000
G1 X145.835 Y138.741 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X144.522 Y137.875 I18.008 J-28.737 E.05861
G3 X143.818 Y137.074 I1.208 J-1.772 E.04015
G3 X143.614 Y135.97 I2.138 J-.964 E.04224
G1 X143.614 Y133.915 E.07653
G1 X146.06 Y133.915 E.0911
G1 X146.06 Y136.541 E.09781
G2 X146.298 Y137.551 I2.133 J.031 E.03905
G2 X147.2 Y138.172 I1.228 J-.819 E.04178
G1 X147.612 Y138.276 E.01583
G2 X148.622 Y137.839 I-.57 J-2.699 E.04124
G2 X149.135 Y136.652 I-1.074 J-1.17 E.04962
G1 X149.147 Y133.915 E.10196
G1 X151.593 Y133.915 E.0911
G1 X151.593 Y136.123 E.08224
G3 X151.38 Y137.33 I-2.743 J.139 E.04604
G3 X150.843 Y137.954 I-1.763 J-.974 E.03088
G1 X149.754 Y138.763 E.05053
G1 X150.889 Y139.603 E.0526
G3 X151.551 Y140.814 I-1.188 J1.437 E.05268
G3 X151.593 Y141.487 I-5.651 J.688 E.0251
G1 X151.593 Y143.041 E.05787
G1 X149.147 Y143.041 E.0911
G1 X149.147 Y141.088 E.07272
G2 X148.901 Y140.07 I-2.125 J-.025 E.0394
G2 X147.997 Y139.458 I-1.225 J.836 E.04163
G1 X147.645 Y139.371 E.01349
G2 X146.441 Y139.943 I.036 J1.63 E.05117
G2 X146.06 Y141.093 I1.708 J1.203 E.04576
G1 X146.06 Y143.041 E.07255
G1 X143.614 Y143.041 E.0911
G3 X143.623 Y141.416 I22.329 J-.701 E.06053
G3 X144.625 Y139.587 I2.162 J-.004 E.08107
G1 X145.786 Y138.775 E.05274
M204 S6000
G1 X145.02 Y138.753 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X143.883 Y137.936 I4.028 J-6.804 E.0522
G3 X143.474 Y137.429 I3.489 J-3.232 E.02431
G3 X143.157 Y135.979 I2.664 J-1.342 E.05587
G1 X143.157 Y133.458 E.09389
G1 X146.517 Y133.458 E.12515
G1 X146.517 Y136.523 E.11416
G2 X146.761 Y137.414 I1.54 J.057 E.03495
G2 X147.325 Y137.732 I.796 J-.753 E.02447
G1 X147.601 Y137.802 E.0106
G2 X148.418 Y137.402 I-.35 J-1.749 E.03425
G2 X148.679 Y136.62 I-1.072 J-.793 E.03122
G1 X148.69 Y133.458 E.11779
G1 X152.05 Y133.458 E.12515
G1 X152.05 Y136.13 E.09953
G3 X151.792 Y137.534 I-3.233 J.132 E.0536
G3 X151.124 Y138.315 I-2.25 J-1.249 E.03855
G1 X150.521 Y138.762 E.02795
G3 X151.293 Y139.345 I-4.668 J6.983 E.03604
G3 X152.003 Y140.745 I-1.566 J1.674 E.05967
G3 X152.05 Y141.48 I-6.108 J.758 E.02745
G1 X152.05 Y143.498 E.07515
G1 X148.69 Y143.498 E.12515
G1 X148.69 Y141.107 E.08904
G2 X148.439 Y140.212 I-1.533 J-.053 E.03519
G2 X147.875 Y139.899 I-.795 J.769 E.02438
G1 X147.621 Y139.836 E.00974
G2 X146.583 Y140.649 I.028 J1.105 E.05262
G2 X146.517 Y141.109 I1.794 J.491 E.01735
G1 X146.517 Y143.498 E.08896
G1 X143.157 Y143.498 E.12515
G1 X143.157 Y141.631 E.06954
G3 X143.477 Y140.143 I3.148 J-.101 E.05723
G3 X144.357 Y139.217 I2.695 J1.678 E.04792
G1 X144.971 Y138.788 E.02791
; WIPE_START
G1 X144.254 Y138.246 E-.34134
G1 X143.883 Y137.936 E-.18357
G1 X143.495 Y137.455 E-.2351
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.155 Y138.677 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.288734
G1 F3000
M204 S500
G2 X146.429 Y138.371 I-.495 J-.719 E.00831
; LINE_WIDTH: 0.25573
G1 X146.52 Y138.234 E.00286
; LINE_WIDTH: 0.224147
G1 X146.517 Y138.215 E.00028
; LINE_WIDTH: 0.196487
G1 X146.5 Y138.104 E.0014
; WIPE_START
G1 X146.517 Y138.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.878 Y135.122 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54752
G1 F6300
M204 S500
G1 X145.058 Y134.303 E.04763
G1 X144.345 Y134.303 E.02934
G1 X145.672 Y135.63 E.07717
G1 X145.672 Y136.344 E.02934
G1 X144.006 Y134.678 E.09685
G1 X144.01 Y135.395 E.02948
G1 X145.731 Y137.117 E.10012
G1 X145.851 Y137.527 E.01754
G2 X145.99 Y137.788 I.94 J-.333 E.01223
G1 X145.961 Y137.793 E.00123
G1 X146 Y138.053 E.01084
G1 X145.982 Y138.081 E.00136
G1 X144.013 Y136.112 E.11447
G2 X144.21 Y137 I1.912 J.041 E.03775
G1 X144.287 Y137.1 E.00519
G1 X145.471 Y138.283 E.06881
; WIPE_START
G1 X144.287 Y137.1 E-.63596
G1 X144.21 Y137 E-.04793
G1 X144.14 Y136.812 E-.07611
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.406 Y135.036 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.50858
G1 F6300
M204 S500
G1 X150.673 Y134.303 E.03933
G1 X150.014 Y134.303 E.02499
G1 X151.198 Y135.487 E.06354
G1 X151.196 Y136.143 E.02489
G1 X149.535 Y134.483 E.08911
G1 X149.535 Y135.141 E.02499
G1 X151.153 Y136.759 E.0868
G1 X151.027 Y137.159 E.01594
G1 X150.974 Y137.239 E.00361
G1 X149.535 Y135.8 E.07721
G3 X149.531 Y136.454 I-4.85 J.295 E.02484
G1 X150.668 Y137.591 E.06104
G1 X150.292 Y137.874 E.01785
G1 X149.475 Y137.057 E.04382
G1 X149.454 Y137.173 E.00449
G1 X149.319 Y137.56 E.01551
G1 X149.916 Y138.156 E.032
G1 X149.539 Y138.438 E.01785
G1 X149.058 Y137.957 E.02583
G3 X148.702 Y138.26 I-1.604 J-1.522 E.01776
G1 X151.122 Y140.68 E.12987
G3 X151.201 Y141.417 I-2.636 J.653 E.02821
G1 X148.257 Y138.473 E.15795
G3 X147.762 Y138.637 I-1.44 J-3.528 E.0198
G1 X148.259 Y139.133 E.02663
G1 X148.706 Y139.336 E.01867
G3 X149.405 Y140.279 I-.878 J1.38 E.04555
G1 X151.204 Y142.079 E.09656
G1 X151.204 Y142.652 E.02176
G1 X151.119 Y142.652 E.00323
G1 X149.535 Y141.068 E.085
G1 X149.535 Y141.727 E.02499
G1 X150.461 Y142.652 E.04966
G1 X149.802 Y142.652 E.02499
G1 X149.33 Y142.18 E.02536
; WIPE_START
G1 X149.802 Y142.652 E-.25393
G1 X150.461 Y142.652 E-.25025
G1 X149.985 Y142.176 E-.25582
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P57 R6
G1 X147.653 Y139.186 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X147.005 Y138.538 E.03476
G1 X146.953 Y138.547 E.00199
G1 X146.704 Y138.895 E.01624
G1 X146.929 Y139.121 E.0121
G2 X146.507 Y139.357 I.596 J1.563 E.01843
G1 X146.362 Y139.212 E.0078
G1 X146.231 Y139.332 E.00675
G1 X146.01 Y139.093 E.01235
G1 X145.761 Y139.269 E.01158
G1 X146.163 Y139.671 E.02156
G1 X145.914 Y140.081 E.01819
G1 X145.375 Y139.542 E.02892
G1 X144.989 Y139.814 E.01793
G1 X145.735 Y140.561 E.04004
G1 X145.72 Y140.608 E.00191
G2 X145.672 Y141.156 I2.638 J.506 E.02089
G1 X144.614 Y140.098 E.05675
G2 X144.305 Y140.447 I.908 J1.117 E.01778
G1 X145.672 Y141.815 E.07336
G1 X145.672 Y142.473 E.02499
G1 X144.095 Y140.896 E.08464
G2 X144.012 Y141.471 I2.154 J.604 E.02213
G1 X145.192 Y142.652 E.06336
G1 X144.534 Y142.652 E.02499
G1 X143.797 Y141.915 E.03953
; WIPE_START
G1 X144.534 Y142.652 E-.39589
G1 X145.192 Y142.652 E-.25024
G1 X144.98 Y142.44 E-.11388
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.459 Y140.917 Z.6 F42000
G1 X162.146 Y138.945 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X159.65 Y138.945 E.09299
G1 X159.63 Y138.611 E.01245
G1 X164.324 Y138.611 E.17483
G3 X163.968 Y140.475 I-5.998 J-.181 E.07096
G3 X162.975 Y141.921 I-6.355 J-3.299 E.0655
G3 X161.495 Y142.927 I-4.23 J-4.631 E.06687
G3 X160.109 Y143.229 I-1.687 J-4.41 E.05307
G1 X159.623 Y143.273 E.01815
G3 X157.949 Y143.01 I.408 J-8.061 E.06324
G3 X156.546 Y142.191 I1.626 J-4.393 E.06082
G1 X156.16 Y141.881 E.01843
G3 X155.193 Y140.531 I5.745 J-5.143 E.06196
G3 X154.805 Y138.967 I4.239 J-1.881 E.06034
G1 X154.758 Y138.471 E.01854
G3 X155.02 Y136.822 I7.807 J.395 E.06232
G3 X155.835 Y135.452 I4.24 J1.595 E.0597
G1 X156.144 Y135.076 E.01812
G3 X157.652 Y134.061 I4.766 J5.453 E.0679
G3 X159.736 Y133.716 I1.986 J5.538 E.07909
G3 X161.427 Y134.062 I-.204 J5.301 E.06458
G3 X161.975 Y134.35 I-2.44 J5.297 E.02307
G1 X160.754 Y135.818 E.0711
G2 X159.714 Y135.527 I-1.507 J3.376 E.04034
G2 X158.51 Y135.877 I.133 J2.701 E.04718
G2 X157.856 Y136.511 I2.522 J3.254 E.03396
G2 X157.295 Y139.138 I3.376 J2.095 E.10207
G2 X157.881 Y140.741 I3.584 J-.403 E.06418
G2 X158.835 Y141.515 I2.21 J-1.747 E.04612
G2 X159.76 Y141.708 I1.287 J-3.859 E.03529
G2 X160.81 Y141.435 I-.521 J-4.151 E.04052
G2 X161.734 Y140.258 I-.902 J-1.66 E.05731
G1 X162.129 Y139.002 E.04902
M204 S6000
G1 X161.524 Y139.402 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X159.283 Y139.402 E.08347
G3 X159.241 Y138.154 I2.547 J-.71 E.04694
G1 X164.768 Y138.154 E.20585
G3 X164.741 Y139.076 I-4.102 J.342 E.03443
G3 X164.31 Y140.821 I-4.977 J-.303 E.06731
G3 X163.3 Y142.246 I-7.343 J-4.135 E.06516
G3 X161.676 Y143.347 I-4.59 J-5.022 E.07332
G3 X160.156 Y143.684 I-1.865 J-4.815 E.05824
G1 X159.623 Y143.732 E.01992
G3 X157.809 Y143.446 I.433 J-8.625 E.06852
G3 X156.264 Y142.55 I1.773 J-4.842 E.06685
G1 X155.837 Y142.207 E.0204
G3 X154.784 Y140.736 I6.17 J-5.531 E.06753
G3 X154.35 Y139.016 I4.662 J-2.089 E.06641
G1 X154.299 Y138.472 E.02035
G3 X154.585 Y136.68 I8.372 J.419 E.06771
G3 X155.478 Y135.166 I4.687 J1.745 E.06581
G1 X155.821 Y134.749 E.02013
G3 X157.301 Y133.719 I5.565 J6.419 E.06727
G3 X159.044 Y133.294 I2.072 J4.709 E.0672
G1 X159.591 Y133.245 E.02045
G1 X159.776 Y133.261 E.00692
G3 X161.61 Y133.643 I-.244 J5.758 E.07009
G3 X162.658 Y134.244 I-3.092 J6.608 E.04502
G1 X160.827 Y136.444 E.10662
G2 X159.705 Y135.989 I-1.269 J1.516 E.04585
G2 X158.763 Y136.258 I.105 J2.144 E.03681
G2 X158 Y137.221 I1.275 J1.794 E.04634
G2 X157.75 Y139.092 I3.249 J1.388 E.0712
G2 X158.254 Y140.471 I2.875 J-.27 E.05528
G2 X159.145 Y141.14 I1.54 J-1.123 E.04211
G2 X159.749 Y141.246 I.941 J-3.593 E.02288
G2 X160.727 Y140.957 I-.297 J-2.813 E.03821
G2 X161.302 Y140.11 I-.867 J-1.206 E.03892
G1 X161.506 Y139.459 E.02541
; WIPE_START
G1 X159.507 Y139.408 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.25 Y134.936 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51994
G1 F6300
M204 S500
G1 X160.514 Y134.201 E.04041
G1 X159.747 Y134.108 E.03003
G1 X160.797 Y135.158 E.05771
G1 X160.641 Y135.346 E.00951
G2 X160.186 Y135.222 I-.877 J2.312 E.01834
G1 X159.111 Y134.147 E.05912
G2 X158.513 Y134.223 I.122 J3.346 E.02348
G1 X159.461 Y135.171 E.05212
G2 X158.899 Y135.284 I.135 J2.135 E.02235
G1 X157.972 Y134.357 E.05095
G1 X157.527 Y134.555 E.01893
G1 X157.508 Y134.567 E.00089
G1 X158.425 Y135.484 E.0504
G1 X158.296 Y135.551 E.00563
G1 X158.031 Y135.765 E.01325
G1 X157.1 Y134.835 E.05117
G1 X156.718 Y135.126 E.01871
G1 X157.699 Y136.108 E.05394
G2 X157.421 Y136.505 I.609 J.722 E.01904
G1 X156.354 Y135.437 E.05868
G1 X156.057 Y135.815 E.01868
G1 X157.195 Y136.953 E.06255
G2 X157.018 Y137.451 I2.461 J1.155 E.02056
G1 X155.768 Y136.2 E.06874
G2 X155.523 Y136.63 I1.707 J1.257 E.01927
G1 X156.913 Y138.02 E.07644
G1 X156.875 Y138.657 E.02477
G1 X155.339 Y137.121 E.08441
G2 X155.238 Y137.695 I2.842 J.797 E.02267
G1 X157.202 Y139.659 E.10797
; WIPE_START
G1 X155.788 Y138.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.084 Y138.794 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X163.828 Y139.538 E.04093
G3 X163.696 Y140.081 I-2.7 J-.369 E.02174
G1 X162.615 Y138.999 E.05945
G1 X162.536 Y138.999 E.00304
G1 X162.394 Y139.453 E.01849
G1 X163.493 Y140.552 E.0604
G3 X163.228 Y140.962 I-4.587 J-2.676 E.01897
G1 X162.233 Y139.967 E.05469
G3 X162.065 Y140.474 I-3.151 J-.757 E.02079
G1 X162.933 Y141.342 E.04768
G1 X162.698 Y141.644 E.01487
G1 X162.621 Y141.704 E.00382
G1 X161.858 Y140.941 E.04193
G3 X161.572 Y141.33 I-1.584 J-.863 E.01882
G1 X162.241 Y141.999 E.03673
G3 X161.853 Y142.285 I-1.691 J-1.882 E.01878
G1 X161.208 Y141.64 E.03545
G3 X160.761 Y141.868 I-.758 J-.934 E.01964
G1 X161.422 Y142.529 E.03634
G3 X160.922 Y142.704 I-1.716 J-4.107 E.0206
G1 X160.229 Y142.011 E.03813
G1 X159.77 Y142.102 E.01818
G1 X159.624 Y142.08 E.00574
G1 X160.345 Y142.801 E.03963
G1 X159.738 Y142.869 E.02372
G1 X158.771 Y141.902 E.0532
G1 X158.684 Y141.875 E.00351
G3 X157.791 Y141.219 I1.087 J-2.415 E.04339
G1 X157.565 Y140.97 E.01309
G3 X157.234 Y140.365 I6.409 J-3.9 E.02683
G1 X155.169 Y138.3 E.11353
G1 X155.149 Y138.471 E.00672
G1 X155.212 Y139.018 E.0214
G1 X159.006 Y142.812 E.20856
G3 X158.196 Y142.676 I.466 J-5.27 E.03197
G1 X155.342 Y139.822 E.15688
G2 X155.817 Y140.814 I2.942 J-.799 E.04298
G1 X156.393 Y141.548 E.03625
G1 X157.418 Y142.572 E.05632
; WIPE_START
G1 X156.393 Y141.548 E-.55059
G1 X156.053 Y141.114 E-.20941
; WIPE_END
M73 P58 R6
G1 E-.04 F1800
M204 S6000
G1 X163.675 Y140.719 Z.6 F42000
G1 X170.337 Y140.373 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X170.442 Y140.467 E.00523
G2 X171.112 Y140.805 I.971 J-1.095 E.02824
G1 X171.49 Y140.895 E.0145
G2 X172.392 Y140.595 I-.521 J-3.074 E.03553
G2 X173.008 Y139.499 I-.798 J-1.17 E.04854
G1 X173.035 Y139.205 E.01099
G1 X173.035 Y133.915 E.19705
G1 X175.481 Y133.915 E.0911
G1 X175.481 Y138.755 E.18027
G3 X175.256 Y140.57 I-7.319 J.012 E.06831
G3 X174.568 Y141.889 I-6.041 J-2.311 E.05553
G3 X173.235 Y142.925 I-3.942 J-3.698 E.06314
G3 X171.93 Y143.221 I-1.562 J-3.856 E.05006
G3 X171.073 Y143.219 I-.423 J-2.182 E.03211
G3 X169.015 Y142.353 I.196 J-3.342 E.08479
G3 X168.43 Y141.751 I1.149 J-1.701 E.0315
G3 X167.663 Y140.259 I2.812 J-2.389 E.06304
G3 X167.513 Y139.06 I10.701 J-1.944 E.04502
G1 X167.513 Y133.915 E.19162
G1 X169.959 Y133.915 E.0911
G1 X169.959 Y139.203 E.19698
G2 X170.202 Y140.194 I2.118 J.006 E.03838
G2 X170.302 Y140.325 I1.211 J-.822 E.00613
M204 S6000
G1 X170.664 Y140.053 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X171.23 Y140.363 I.779 J-.752 E.02439
G1 X171.491 Y140.425 E.01001
G2 X172.245 Y140.136 I-.178 J-1.593 E.0304
G2 X172.554 Y139.443 I-.817 J-.78 E.02885
G1 X172.578 Y139.184 E.00967
G1 X172.578 Y133.458 E.21329
G1 X175.938 Y133.458 E.12515
G1 X175.938 Y138.765 E.19767
G3 X175.744 Y140.532 I-8.445 J-.036 E.06632
G3 X174.926 Y142.179 I-6.147 J-2.024 E.06875
G3 X173.593 Y143.256 I-4.667 J-4.412 E.06401
G3 X171.979 Y143.676 I-1.891 J-3.959 E.0625
G3 X171.022 Y143.673 I-.472 J-2.439 E.03589
G3 X169.313 Y143.141 I.245 J-3.792 E.0673
G3 X168.35 Y142.39 I5.943 J-8.612 E.04551
G3 X167.372 Y140.882 I4.462 J-3.964 E.0672
G3 X167.103 Y139.601 I5.072 J-1.736 E.04886
G1 X167.056 Y139.08 E.01949
G1 X167.056 Y133.458 E.2094
G1 X170.416 Y133.458 E.12515
G1 X170.416 Y139.183 E.21326
G2 X170.632 Y140.003 I1.522 J.037 E.03198
; WIPE_START
G1 X170.841 Y140.206 E-.11075
G1 X170.956 Y140.268 E-.04959
G1 X171.23 Y140.363 E-.11019
G1 X171.491 Y140.425 E-.10215
G1 X171.912 Y140.317 E-.16499
G1 X172.147 Y140.208 E-.09872
G1 X172.245 Y140.136 E-.04606
G1 X172.326 Y140.056 E-.04345
G1 X172.374 Y139.979 E-.03409
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X169.122 Y134.098 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50604
G1 F6300
M204 S500
G1 X169.571 Y134.546 E.02396
G1 X169.571 Y135.201 E.02472
G1 X168.673 Y134.303 E.04793
G1 X168.018 Y134.303 E.02472
G1 X169.571 Y135.856 E.08289
G1 X169.571 Y136.511 E.02472
G1 X167.902 Y134.842 E.08908
G1 X167.902 Y135.497 E.02472
G1 X169.571 Y137.166 E.08908
G1 X169.571 Y137.821 E.02472
G1 X167.902 Y136.152 E.08908
G1 X167.902 Y136.807 E.02472
G1 X169.571 Y138.476 E.08908
G1 X169.571 Y139.131 E.02472
G1 X167.696 Y137.256 E.10006
; WIPE_START
G1 X169.11 Y138.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X175.298 Y135.034 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X174.567 Y134.303 E.03902
G1 X173.912 Y134.303 E.02472
G1 X175.093 Y135.484 E.063
G1 X175.093 Y136.139 E.02472
G1 X173.424 Y134.47 E.08908
G1 X173.424 Y135.125 E.02472
G1 X175.093 Y136.794 E.08908
G1 X175.093 Y137.449 E.02472
G1 X173.424 Y135.779 E.08908
G1 X173.424 Y136.434 E.02472
G1 X175.093 Y138.103 E.08908
G3 X175.092 Y138.758 I-7.359 J.321 E.02471
G1 X173.424 Y137.089 E.08905
G1 X173.424 Y137.744 E.02472
G1 X175.059 Y139.379 E.08726
G3 X174.994 Y139.97 I-3.797 J-.118 E.02243
G1 X173.424 Y138.399 E.08381
G1 X173.424 Y139.054 E.02472
G1 X174.867 Y140.498 E.07704
G3 X174.665 Y140.951 I-2.442 J-.817 E.01875
G1 X173.373 Y139.659 E.06894
G1 X173.362 Y139.759 E.00381
G1 X173.235 Y140.176 E.01642
G1 X174.428 Y141.368 E.06364
G1 X174.264 Y141.641 E.012
G1 X174.15 Y141.745 E.00584
G1 X172.988 Y140.583 E.06201
G3 X172.643 Y140.893 I-1.419 J-1.234 E.01755
G1 X173.808 Y142.058 E.06217
G3 X173.444 Y142.35 I-1.878 J-1.97 E.0176
G1 X172.206 Y141.111 E.06609
G1 X171.686 Y141.246 E.02028
G1 X173.026 Y142.587 E.07154
G3 X172.518 Y142.733 I-.742 J-1.621 E.02004
G1 X170.942 Y141.157 E.08413
G3 X169.664 Y139.879 I.369 J-1.646 E.07195
G1 X167.902 Y138.117 E.09404
G1 X167.902 Y138.772 E.02472
G1 X171.954 Y142.824 E.21625
G1 X171.505 Y142.871 E.01703
G1 X171.327 Y142.852 E.00678
G1 X167.95 Y139.475 E.18019
G2 X168.061 Y140.241 I3.755 J-.153 E.02926
G1 X170.565 Y142.745 E.13361
G3 X169.442 Y142.196 I.573 J-2.597 E.04762
G1 X168.976 Y141.811 E.0228
G1 X168.131 Y140.966 E.04509
; OBJECT_ID: 783
; WIPE_START
G1 X168.976 Y141.811 E-.454
G1 X169.442 Y142.196 E-.22961
G1 X169.606 Y142.312 E-.07639
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 701
M625
; start printing object, unique label id: 783
M624 AgAAAAAAAAA=
M204 S6000
G1 X165.432 Y135.922 Z.6 F42000
G1 X155.843 Y121.239 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X155.817 Y121.269 E.00145
G2 X155.68 Y121.41 I.887 J1.001 E.00732
G2 X155.475 Y122.545 I1.377 J.835 E.04395
G3 X153.695 Y122.111 I1.484 J-9.961 E.06835
G3 X151.876 Y121.454 I4.725 J-15.914 E.07207
G1 X151.491 Y121.254 E.01615
G2 X152.433 Y120.401 I-1.287 J-2.367 E.04778
G2 X152.605 Y119.303 I-3.297 J-1.08 E.04156
G2 X152.456 Y115.797 I-35.659 J-.239 E.13078
G1 X152.378 Y115.315 E.01817
G2 X151.706 Y114.43 I-1.675 J.574 E.04208
G3 X152.504 Y113.991 I.765 J.446 E.03564
G3 X153.135 Y113.989 I.331 J5.606 E.02352
G3 X154.795 Y114.056 I-12.019 J320.156 E.06189
G3 X155.911 Y114.262 I-1.247 J9.869 E.04229
G1 X156.194 Y114.377 E.01135
M73 P59 R6
G2 X155.612 Y115.394 I6.398 J4.334 E.04367
G2 X155.503 Y116.431 I4.585 J1.007 E.03893
G2 X155.505 Y118.82 I94.113 J1.106 E.08897
G2 X155.849 Y120.403 I4.468 J-.139 E.06069
G2 X156.42 Y120.963 I2.748 J-2.235 E.02986
G2 X155.965 Y121.155 I.285 J1.307 E.01851
G1 X155.892 Y121.205 E.0033
; WIPE_START
G1 X155.817 Y121.269 E-.03729
G1 X155.68 Y121.41 E-.07458
G1 X155.57 Y121.602 E-.08435
G1 X155.506 Y121.793 E-.07643
G1 X155.476 Y121.95 E-.06098
G1 X155.45 Y122.197 E-.09426
G1 X155.475 Y122.545 E-.13255
G1 X154.957 Y122.458 E-.19957
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.408 Y121.219 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G2 X158.35 Y121.022 I-.102 J-2.829 E.03601
G2 X159.122 Y120.259 I-1.039 J-1.824 E.04088
G2 X159.519 Y117.873 I-5.713 J-2.177 E.0907
G2 X159.379 Y115.707 I-7.32 J-.615 E.08113
G2 X159.018 Y114.642 I-9.51 J2.631 E.04191
G1 X158.657 Y114.242 E.02008
G3 X160.02 Y114.027 I1.415 J4.545 E.05159
G3 X161.094 Y114.027 I.535 J46.529 E.04001
G3 X163.077 Y114.282 I-.012 J7.918 E.07465
G1 X163.277 Y114.374 E.00821
G2 X162.573 Y115.226 I5.731 J5.453 E.0412
G2 X162.359 Y116.15 I2.149 J.984 E.03556
G1 X162.219 Y119.676 E.13143
G3 X161.959 Y121.295 I-5.784 J-.099 E.06129
G3 X160.933 Y122.29 I-1.773 J-.802 E.05448
G3 X159.439 Y122.545 I-1.178 J-2.396 E.05723
G3 X158.435 Y122.27 I.036 J-2.104 E.03918
G3 X157.635 Y121.458 I2.775 J-3.535 E.04257
G1 X157.45 Y121.263 E.01004
; WIPE_START
G1 X158.003 Y121.143 E-.21519
G1 X158.35 Y121.022 E-.13963
G1 X158.509 Y120.93 E-.06991
G1 X158.67 Y120.805 E-.07749
G1 X158.924 Y120.528 E-.14244
G1 X159.104 Y120.284 E-.11534
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X156.123 Y121.6 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X155.909 Y122.204 I.633 J.565 E.02449
G3 X155.904 Y122.75 I-2.388 J.253 E.02037
G3 X155.544 Y123.013 I-.37 J-.129 E.01768
G3 X153.561 Y122.548 I1.32 J-10.093 E.07599
G3 X151.477 Y121.761 I3.323 J-11.953 E.08306
G3 X151.064 Y121.454 I.391 J-.955 E.01938
G3 X151.296 Y120.836 I.422 J-.194 E.02732
G2 X152.015 Y120.192 I-.981 J-1.817 E.0363
G2 X152.148 Y119.301 I-2.703 J-.861 E.03368
G2 X152.003 Y115.861 I-35.436 J-.232 E.12831
G1 X151.936 Y115.446 E.01563
M73 P59 R5
G2 X151.3 Y114.705 I-1.388 J.547 E.03705
G3 X151.136 Y114.504 I.426 J-.517 E.00973
G1 X151.131 Y114.473 E.00118
G3 X151.779 Y113.724 I1.869 J.962 E.03727
G3 X152.905 Y113.524 I.931 J1.98 E.04309
G1 X153.157 Y113.533 E.00938
G3 X154.839 Y113.601 I-8.827 J238.64 E.0627
G3 X156.048 Y113.825 I-1.33 J10.572 E.04583
G3 X156.54 Y114.127 I-.195 J.867 E.02189
G3 X156.623 Y114.518 I-.548 J.321 E.01515
G3 X156.304 Y115.048 I-6.662 J-3.658 E.02303
G2 X156.049 Y115.54 I4.672 J2.725 E.02067
G2 X155.96 Y116.434 I3.939 J.845 E.0335
G2 X155.962 Y118.806 I93.365 J1.103 E.08837
G2 X156.25 Y120.166 I3.844 J-.103 E.05206
G2 X156.953 Y120.692 I1.19 J-.86 E.03322
G2 X158.254 Y120.55 I.469 J-1.724 E.04988
G2 X158.71 Y120.048 I-1.429 J-1.756 E.02535
G2 X159.062 Y117.864 I-5.213 J-1.961 E.08296
G2 X158.936 Y115.819 I-7.044 J-.592 E.07656
G2 X158.62 Y114.883 I-8.488 J2.344 E.03682
G3 X158.208 Y114.389 I1.821 J-1.937 E.02401
G3 X158.392 Y113.903 I.532 J-.076 E.02021
G3 X158.892 Y113.707 I.648 J.92 E.02021
G3 X160.011 Y113.57 I1.106 J4.381 E.0421
G3 X162.326 Y113.662 I.562 J15.015 E.08638
G3 X163.145 Y113.816 I-2.466 J15.408 E.03103
G3 X163.596 Y114.094 I-.215 J.852 E.02005
G3 X163.685 Y114.574 I-.671 J.373 E.01852
G3 X163.469 Y114.836 I-.762 J-.41 E.01271
G2 X162.977 Y115.447 I4.043 J3.751 E.02926
G2 X162.816 Y116.176 I1.678 J.755 E.02801
G1 X162.676 Y119.7 E.13135
G3 X162.386 Y121.464 I-6.327 J-.133 E.0668
G3 X161.141 Y122.697 I-2.184 J-.961 E.0668
G3 X159.392 Y122.999 I-1.387 J-2.811 E.06706
G3 X158.179 Y122.649 I.082 J-2.558 E.04749
G3 X157.187 Y121.65 I3.81 J-4.776 E.05256
G2 X156.648 Y121.392 I-.844 J1.072 E.02246
G2 X156.173 Y121.567 I.181 J1.222 E.01896
M204 S6000
G1 X156.819 Y121.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.14993
G1 F3000
M204 S500
G1 X156.897 Y120.978 E.0021
G1 X157.047 Y120.986 E.00131
; LINE_WIDTH: 0.112473
G1 X157.164 Y120.988 E.00066
M204 S6000
G1 X157.141 Y121.297 F42000
; LINE_WIDTH: 0.163687
G1 F3000
M204 S500
G1 X156.803 Y121.074 E.00399
; WIPE_START
G1 X157.141 Y121.297 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X155.572 Y115.073 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.52817
G1 F6300
M204 S500
G1 X154.97 Y114.471 E.03366
G2 X154.23 Y114.417 I-.885 J7.017 E.02937
G1 X155.215 Y115.402 E.05509
G2 X155.13 Y116.002 I3.056 J.742 E.02403
G1 X153.53 Y114.402 E.08947
G2 X152.819 Y114.379 I-.543 J5.586 E.02811
G1 X155.117 Y116.676 E.12848
G1 X155.117 Y117.362 E.02713
G1 X152.568 Y114.814 E.14253
G1 X152.754 Y115.206 E.01717
G1 X152.838 Y115.769 E.02251
G1 X155.117 Y118.049 E.12746
G1 X155.117 Y118.735 E.02713
G1 X152.91 Y116.528 E.12342
G3 X152.945 Y117.249 I-13.188 J1.008 E.02857
G1 X155.175 Y119.479 E.12468
G2 X155.45 Y120.441 I6.498 J-1.341 E.03959
G1 X152.976 Y117.967 E.13835
G3 X152.984 Y118.661 I-10.299 J.462 E.02745
G1 X155.43 Y121.107 E.13679
G2 X155.18 Y121.543 I1.187 J.971 E.01997
G1 X152.99 Y119.353 E.12244
G3 X152.932 Y119.982 I-4.109 J-.063 E.02497
G1 X155.025 Y122.074 E.11702
G3 X154.07 Y121.806 I1.795 J-8.213 E.03924
G1 X152.8 Y120.535 E.07103
G1 X152.79 Y120.576 E.00165
G1 X152.507 Y120.928 E.01789
G1 X153.403 Y121.825 E.05012
; WIPE_START
G1 X152.507 Y120.928 E-.4817
G1 X152.79 Y120.576 E-.17192
G1 X152.8 Y120.535 E-.01582
G1 X152.969 Y120.704 E-.09056
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.137 Y116.209 Z.6 F42000
G1 X161.827 Y114.249 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.52432
G1 F6300
M204 S500
G1 X162.396 Y114.818 E.03157
G1 X162.224 Y115.043 E.0111
G1 X162.154 Y115.257 E.00883
G1 X161.323 Y114.426 E.0461
G2 X160.632 Y114.415 I-.464 J8.126 E.02711
G1 X162.007 Y115.791 E.0763
G2 X161.959 Y116.423 I4.828 J.689 E.02489
G1 X159.955 Y114.42 E.11114
G2 X159.37 Y114.472 I-.029 J2.992 E.0231
G1 X159.394 Y114.539 E.00279
G1 X161.931 Y117.076 E.14075
G1 X161.903 Y117.729 E.02563
G1 X159.737 Y115.562 E.12018
G3 X159.883 Y116.39 I-4.108 J1.154 E.03301
G1 X161.875 Y118.382 E.1105
G1 X161.847 Y119.035 E.02563
G1 X159.917 Y117.105 E.10705
G3 X159.911 Y117.779 I-8.746 J.251 E.02645
G1 X161.819 Y119.687 E.10587
G3 X161.776 Y120.325 I-4.116 J.044 E.02511
G1 X159.893 Y118.443 E.10445
G3 X159.839 Y119.069 I-3.876 J-.024 E.02468
G1 X161.668 Y120.898 E.10149
G3 X161.471 Y121.382 I-1.193 J-.204 E.02065
G1 X159.724 Y119.634 E.09694
G3 X159.562 Y120.154 I-3.017 J-.654 E.02136
G1 X161.134 Y121.725 E.08719
G1 X160.695 Y121.968 E.01965
G1 X159.34 Y120.612 E.07519
G3 X159.036 Y120.989 I-1.591 J-.975 E.01904
G1 X160.173 Y122.126 E.06309
G1 X159.661 Y122.175 E.02018
G1 X159.527 Y122.161 E.00526
G1 X158.656 Y121.29 E.04831
G1 X158.312 Y121.46 E.01508
G1 X158.177 Y121.492 E.00542
G1 X158.974 Y122.288 E.04417
; WIPE_START
G1 X158.177 Y121.492 E-.42788
G1 X158.312 Y121.46 E-.05248
G1 X158.656 Y121.29 E-.14606
G1 X158.905 Y121.539 E-.13358
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.356 Y120.415 Z.6 F42000
G1 X146.481 Y119.689 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X146.716 Y120.08 I-.509 J.571 E.01721
G3 X146.38 Y121.49 I-1.481 J.392 E.05626
G3 X144.803 Y121.842 I-1.063 J-1.057 E.06355
G3 X143.856 Y120.63 I.672 J-1.501 E.05959
G3 X144.077 Y119.662 I1.002 J-.281 E.03854
G3 X144.793 Y119.473 I.652 J1.017 E.02803
G1 X145.828 Y119.473 E.03857
G1 X146.013 Y119.496 E.00693
M73 P60 R5
G3 X146.435 Y119.651 I-.041 J.764 E.01701
; WIPE_START
G1 X146.625 Y119.854 E-.10549
G1 X146.716 Y120.08 E-.09235
G1 X146.775 Y120.371 E-.11315
G1 X146.731 Y120.793 E-.16122
G1 X146.697 Y120.93 E-.0536
G1 X146.59 Y121.174 E-.10127
G1 X146.396 Y121.465 E-.13292
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.611 Y118.234 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X143.634 Y118.261 E.0013
G2 X143.745 Y118.414 I1.197 J-.749 E.00704
G2 X144.489 Y118.709 I.792 J-.913 E.03038
G1 X149.25 Y118.708 E.17732
G3 X149.41 Y119.575 I-1.062 J.645 E.03357
G3 X148.932 Y120.866 I-2.689 J-.263 E.05186
G3 X147.74 Y121.994 I-2.774 J-1.739 E.06176
G3 X145.778 Y122.603 I-2.054 J-3.148 E.07751
G1 X145.73 Y122.358 E.00933
G2 X147.209 Y120.685 I-.414 J-1.857 E.08889
G1 X147.236 Y120.347 E.01262
G2 X146.922 Y119.479 I-1.783 J.153 E.0348
G2 X146.086 Y119.045 I-.977 J.861 E.03591
G1 X145.857 Y119.016 E.00858
G2 X144.576 Y119.022 I-.536 J22.082 E.04774
G2 X143.774 Y119.303 I.278 J2.077 E.03185
G2 X143.405 Y120.708 I1.086 J1.036 E.05647
G2 X144.65 Y122.273 I2.068 J-.366 E.07764
G1 X144.904 Y122.347 E.00986
G1 X144.855 Y122.594 E.00938
G3 X142.179 Y121.404 I.554 J-4.85 E.11076
G3 X141.601 Y120.778 I6.977 J-7.013 E.03177
G3 X140.873 Y119.294 I3.703 J-2.739 E.06191
G3 X140.738 Y118.22 I9.377 J-1.722 E.04031
G3 X142.182 Y115.001 I4.37 J.027 E.13526
G3 X143.656 Y114.176 I3.591 J4.684 E.06315
G3 X145.497 Y113.979 I1.485 J5.174 E.06931
G3 X147.509 Y114.465 I-.117 J4.887 E.07765
G3 X148.427 Y115.003 I-6.076 J11.409 E.03965
G3 X148.904 Y115.496 I-.786 J1.239 E.02577
G1 X148.961 Y115.659 E.00645
G1 X148.811 Y115.781 E.00723
G2 X146.434 Y115.07 I-2.507 J4.055 E.09347
G2 X143.688 Y116.704 I.102 J3.295 E.12424
G2 X143.428 Y117.669 I3.803 J1.543 E.03734
G2 X143.555 Y118.117 I1.403 J-.158 E.0174
G1 X143.585 Y118.18 E.00262
M204 S6000
G1 X144.016 Y118.009 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X144.274 Y118.21 I.493 J-.366 E.01234
G2 X144.517 Y118.251 I.303 J-1.036 E.00921
G1 X149.215 Y118.251 E.17499
G3 X149.725 Y118.639 I-.014 J.548 E.02549
G3 X149.838 Y119.843 I-1.747 J.771 E.04582
G3 X147.98 Y122.382 I-3.696 J-.755 E.12089
G3 X145.907 Y123.05 I-2.232 J-3.379 E.08213
G3 X141.685 Y121.556 I-.562 J-5.126 E.17254
G3 X141.05 Y120.765 I3.283 J-3.285 E.03787
G3 X140.316 Y118.661 I3.352 J-2.349 E.08406
G3 X140.333 Y117.56 I4.514 J-.483 E.04111
G3 X141.891 Y114.646 I4.735 J.659 E.12565
G3 X143.521 Y113.739 I3.901 J5.09 E.06971
G3 X145.535 Y113.523 I1.62 J5.608 E.07582
G3 X147.716 Y114.057 I-.149 J5.329 E.08427
G3 X148.691 Y114.63 I-6.408 J12.04 E.04214
G3 X149.328 Y115.325 I-1.034 J1.585 E.03548
G3 X149.451 Y115.772 I-2.787 J1.008 E.0173
G3 X149.066 Y116.391 I-.763 J-.046 E.02829
G3 X148.794 Y116.316 I-.041 J-.382 E.01077
G2 X146.442 Y115.529 I-2.512 J3.597 E.09363
G2 X144.098 Y116.907 I.095 J2.844 E.10558
G2 X143.895 Y117.662 I3.124 J1.248 E.0292
G2 X143.982 Y117.959 I.614 J-.019 E.01167
M204 S6000
G1 X144.107 Y118.886 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.144481
G1 F3000
M204 S500
G1 X143.799 Y118.886 E.00254
; WIPE_START
G1 X144.107 Y118.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.159 Y121.553 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.299071
G1 F3000
M204 S500
G1 X143.554 Y121.878 E.01068
; LINE_WIDTH: 0.272276
G1 X143.932 Y122.16 E.00882
M204 S6000
G1 X143.957 Y122.146 F42000
; LINE_WIDTH: 0.144644
G1 F3000
M204 S500
G1 X143.089 Y121.606 E.00847
; WIPE_START
G1 X143.957 Y122.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.599 Y122.242 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.208047
G1 F3000
M204 S500
G1 X146.903 Y122.068 E.00471
; LINE_WIDTH: 0.239182
G1 X146.956 Y122.035 E.00099
; LINE_WIDTH: 0.275474
G2 X147.46 Y121.632 I-2.938 J-4.189 E.01224
M204 S6000
G1 X147.431 Y121.61 F42000
; LINE_WIDTH: 0.435676
G1 F3000
M204 S500
G3 X146.792 Y122.205 I-9.405 J-9.464 E.02798
; WIPE_START
G1 X147.431 Y121.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.929 Y119.127 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.117141
G1 F3000
M204 S500
G1 X146.864 Y119.061 E.00056
; LINE_WIDTH: 0.144239
G2 X146.742 Y118.978 I-.163 J.107 E.00125
; LINE_WIDTH: 0.113921
G1 X146.663 Y118.96 E.00046
; WIPE_START
G1 X146.742 Y118.978 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.164 Y119.949 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54313
G1 F6300
M204 S500
G1 X148.312 Y119.097 E.04912
G1 X147.604 Y119.097 E.02883
G1 X148.803 Y120.296 E.0691
G3 X148.544 Y120.744 I-1.817 J-.753 E.02116
G1 X147.452 Y119.652 E.06294
G1 X147.53 Y119.843 E.0084
G1 X147.628 Y120.328 E.02021
G1 X147.609 Y120.516 E.00768
G1 X148.222 Y121.129 E.03535
G1 X147.942 Y121.399 E.01587
G1 X147.845 Y121.46 E.00463
G1 X147.347 Y120.961 E.02874
; WIPE_START
G1 X147.845 Y121.46 E-.26791
G1 X147.942 Y121.399 E-.0432
G1 X148.222 Y121.129 E-.148
G1 X147.662 Y120.569 E-.30091
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.003 Y116.163 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191303
G1 F3000
M204 S500
G1 X148.995 Y116.109 E.00067
; LINE_WIDTH: 0.21744
G1 X148.986 Y116.054 E.00079
; LINE_WIDTH: 0.209498
G2 X149.105 Y115.927 I-.795 J-.869 E.00237
; LINE_WIDTH: 0.157573
G2 X149.226 Y115.756 I-.963 J-.807 E.00196
; WIPE_START
G1 X149.105 Y115.927 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.291 Y115.22 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.11285
G1 F3000
M204 S500
G1 X148.158 Y115.153 E.00085
; LINE_WIDTH: 0.141098
G1 X148.005 Y115.08 E.00136
; LINE_WIDTH: 0.178707
G1 X147.841 Y115.002 E.00201
; LINE_WIDTH: 0.215774
G1 X147.71 Y114.946 E.00201
; LINE_WIDTH: 0.252234
G1 X147.572 Y114.888 E.00255
; LINE_WIDTH: 0.286813
G1 X147.456 Y114.843 E.00248
; LINE_WIDTH: 0.321262
G1 X147.316 Y114.79 E.00338
; LINE_WIDTH: 0.35378
G1 X147.214 Y114.757 E.00273
; LINE_WIDTH: 0.386226
G1 X147.085 Y114.716 E.00377
; LINE_WIDTH: 0.420035
G1 X146.974 Y114.686 E.00353
; LINE_WIDTH: 0.45549
G1 X146.825 Y114.651 E.00516
; LINE_WIDTH: 0.492466
G1 X146.691 Y114.626 E.00498
; LINE_WIDTH: 0.531019
G2 X146.448 Y114.587 I-.841 J4.574 E.00979
; LINE_WIDTH: 0.567412
G2 X146.318 Y114.579 I-.161 J1.468 E.00557
; LINE_WIDTH: 0.594813
G1 X145.979 Y114.569 E.01523
M204 S6000
G1 X145.66 Y115.003 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5138
G1 F6300
M204 S500
G1 X145.02 Y114.363 E.03474
G2 X144.411 Y114.419 I.095 J4.322 E.0235
G1 X145.003 Y115.012 E.03215
G1 X144.581 Y115.255 E.01872
G1 X143.853 Y114.527 E.0395
G2 X143.374 Y114.714 I.68 J2.439 E.01975
G1 X144.186 Y115.526 E.04404
G1 X143.845 Y115.851 E.01807
G1 X142.951 Y114.957 E.04854
G2 X142.549 Y115.221 I2.495 J4.225 E.01845
G1 X143.539 Y116.211 E.05371
G2 X143.298 Y116.636 I1.439 J1.095 E.01881
G1 X142.197 Y115.535 E.05975
G2 X141.894 Y115.898 I1.971 J1.955 E.01816
G1 X143.141 Y117.145 E.06765
G1 X143.03 Y117.672 E.02068
G1 X143.038 Y117.708 E.00141
G1 X141.636 Y116.306 E.07611
G1 X141.584 Y116.387 E.00368
G1 X141.424 Y116.76 E.01558
G1 X143.41 Y118.746 E.1078
G1 X143.411 Y119.14 E.01512
G1 X143.295 Y119.297 E.00747
G1 X141.249 Y117.251 E.11102
G2 X141.157 Y117.825 I2.905 J.759 E.02235
G1 X143.066 Y119.734 E.10358
G2 X142.976 Y120.309 I1.776 J.573 E.02246
G1 X141.15 Y118.483 E.0991
G2 X141.269 Y119.269 I6.891 J-.647 E.03051
G1 X143.022 Y121.021 E.09508
G1 X143.003 Y121.009 E.00084
G1 X142.767 Y121.389 E.01716
G3 X142.563 Y121.229 I.667 J-1.054 E.00995
G1 X141.358 Y120.023 E.06542
; WIPE_START
G1 X142.563 Y121.229 E-.64787
G1 X142.767 Y121.389 E-.09839
G1 X142.786 Y121.358 E-.01374
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.813 Y118.254 Z.6 F42000
G1 X130.712 Y115.982 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X130.49 Y116.097 E.0093
G2 X129.559 Y114.718 I-31.098 J19.99 E.06197
G2 X128.937 Y114.259 I-1.804 J1.796 E.02891
G1 X128.97 Y114.051 E.00785
G3 X130.35 Y114.004 I1.559 J25.206 E.05142
G3 X130.858 Y114.214 I.07 J.55 E.02143
G2 X130.463 Y115.106 I1.333 J1.125 E.03683
G2 X130.689 Y115.926 I3.966 J-.654 E.03177
; WIPE_START
G1 X130.49 Y116.097 E-.09967
G1 X129.559 Y114.718 E-.63215
G1 X129.503 Y114.669 E-.02818
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.781 Y118.621 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X135.906 Y118.977 E.01403
G1 X135.98 Y119.114 E.00581
G1 X136.443 Y119.809 E.03112
G1 X136.279 Y119.968 E.00851
G2 X135.949 Y119.756 I-1.075 J1.307 E.01463
G1 X135.473 Y119.542 E.01944
G2 X134.615 Y120.031 I.832 J2.461 E.03702
G2 X134.021 Y120.886 I2.318 J2.243 E.03894
G2 X133.885 Y121.356 I3.118 J1.161 E.01828
G2 X134.163 Y122.169 I1.401 J-.026 E.03253
G1 X134.267 Y122.346 E.00762
G3 X133.363 Y122.504 I-1.324 J-4.891 E.03424
G3 X129.879 Y122.447 I-1.451 J-17.572 E.12999
G3 X129.02 Y122.289 I2.932 J-18.405 E.03252
G1 X129.006 Y122.079 E.00785
G2 X130.233 Y121.296 I-.781 J-2.578 E.05492
G2 X130.597 Y120.893 I-4.058 J-4.035 E.02023
G1 X131.726 Y119.488 E.06714
G2 X132.026 Y118.859 I-1.408 J-1.059 E.02612
G2 X131.851 Y118.305 I-1.766 J.255 E.02174
G1 X131.189 Y117.212 E.04761
G1 X131.382 Y117.062 E.00909
G2 X131.863 Y117.473 I1.669 J-1.467 E.02367
G1 X132.401 Y117.779 E.02304
G2 X133.089 Y117.465 I-1.627 J-4.479 E.02821
G2 X133.614 Y116.958 I-1.335 J-1.909 E.02729
G2 X134.156 Y116.029 I-2.895 J-2.307 E.0402
G2 X134.295 Y115.456 I-4.449 J-1.385 E.02195
G2 X134.031 Y114.666 I-1.692 J.125 E.03135
G2 X133.44 Y114.215 I-1.472 J1.317 E.02788
G3 X136.394 Y114.024 I2.416 J14.459 E.11047
G1 X136.711 Y114.026 E.01178
G3 X138.842 Y114.255 I-.118 J11.145 E.07994
G1 X139.152 Y114.374 E.01238
G2 X138.183 Y114.973 I1.941 J4.22 E.04253
G2 X137.03 Y116.432 I9.822 J8.949 E.06933
G2 X135.975 Y118.033 I29.181 J20.376 E.07139
G2 X135.759 Y118.556 I2.143 J1.195 E.02114
M73 P61 R5
G1 X135.762 Y118.564 E.00034
; WIPE_START
G1 X135.906 Y118.977 E-.16594
G1 X135.98 Y119.114 E-.05931
G1 X136.443 Y119.809 E-.31747
G1 X136.279 Y119.968 E-.08684
G1 X135.99 Y119.782 E-.13043
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.021 Y121.021 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X137.228 Y120.914 E.00868
G1 X137.414 Y121.163 E.0116
G1 X137.932 Y121.832 E.03151
G2 X138.652 Y122.346 I1.671 J-1.58 E.03314
G1 X138.609 Y122.553 E.00789
G3 X137.05 Y122.495 I-.548 J-6.244 E.05827
G1 X136.786 Y122.43 E.01011
G2 X137.159 Y121.5 I-2.13 J-1.392 E.03756
G2 X137.04 Y121.078 I-4.719 J1.095 E.01634
; WIPE_START
G1 X137.228 Y120.914 E-.0947
G1 X137.414 Y121.163 E-.1183
G1 X137.932 Y121.832 E-.32143
G1 X138.278 Y122.133 E-.17425
G1 X138.395 Y122.2 E-.05132
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.245 Y118.562 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X136.372 Y118.878 I1.059 J-.242 E.01275
G2 X138.271 Y121.523 I27.676 J-17.869 E.12133
G2 X139.179 Y122.096 I1.926 J-2.045 E.04022
G3 X139.474 Y122.288 I-1.05 J1.94 E.01314
G1 X139.497 Y122.327 E.00165
G3 X139.195 Y122.872 I-.477 J.093 E.02521
G3 X138.358 Y123.023 I-.873 J-2.444 E.03181
G3 X136.95 Y122.941 I-.335 J-6.347 E.05265
G1 X136.636 Y122.864 E.01205
G3 X136.271 Y122.444 I.175 J-.521 E.02172
G3 X136.474 Y122.063 I.858 J.213 E.01624
G2 X136.687 Y121.505 I-1.497 J-.891 E.02235
G2 X136.4 Y120.828 I-1.67 J.307 E.02761
G2 X135.848 Y120.222 I-2 J1.268 E.03067
G2 X135.472 Y120.042 I-1.285 J2.204 E.01557
G2 X134.65 Y120.711 I.508 J1.464 E.04027
G2 X134.349 Y121.387 I1.194 J.936 E.02784
G2 X134.553 Y121.93 I1.064 J-.09 E.02187
G3 X134.735 Y122.365 I-1.016 J.68 E.01766
G3 X134.347 Y122.799 I-.479 J-.037 E.02328
G3 X133.414 Y122.959 I-1.426 J-5.517 E.03532
G3 X129.81 Y122.898 I-1.502 J-17.991 E.13446
G3 X128.683 Y122.666 I1.41 J-9.692 E.0429
G3 X128.135 Y122.128 I.112 J-.662 E.03044
G3 X128.463 Y121.752 I.408 J.024 E.01999
G2 X129.566 Y121.296 I-.572 J-2.949 E.04476
G2 X130.246 Y120.601 I-4.152 J-4.738 E.03627
G1 X131.363 Y119.209 E.06646
G2 X131.548 Y118.835 I-.844 J-.648 E.01565
G2 X131.445 Y118.517 I-1.014 J.153 E.01249
G2 X129.212 Y115.02 I-43.833 J25.52 E.15458
G2 X128.37 Y114.558 I-1.129 J1.06 E.03639
G3 X127.95 Y114.41 I.073 J-.875 E.01676
G1 X127.91 Y114.348 E.00275
G3 X128.187 Y113.763 I.442 J-.148 E.02663
G3 X129.677 Y113.568 I1.253 J3.78 E.05631
G3 X130.37 Y113.547 I.572 J7.344 E.02583
G3 X131.299 Y114.06 I.058 J.993 E.04172
G1 X131.38 Y114.188 E.00564
G3 X131.141 Y114.593 I-.766 J-.181 E.01778
G2 X130.933 Y115.111 I1.253 J.803 E.02091
G2 X131.464 Y116.361 I2.852 J-.474 E.05105
G2 X132.428 Y117.269 I1.776 J-.92 E.05029
G2 X133.245 Y116.689 I-.435 J-1.477 E.03798
G2 X133.771 Y115.713 I-2.225 J-1.828 E.04157
G1 X133.83 Y115.444 E.01026
G2 X133.374 Y114.714 I-.817 J.004 E.03372
G3 X133.063 Y114.478 I.258 J-.663 E.01476
G3 X133.085 Y114.105 I.38 J-.164 E.01443
G3 X133.464 Y113.786 I.457 J.157 E.0194
G3 X134.04 Y113.667 I.631 J1.603 E.022
G3 X136.718 Y113.569 I2.019 J18.652 E.09989
G3 X138.965 Y113.813 I-.135 J11.745 E.08432
G3 X139.446 Y114.088 I-.263 J1.016 E.02087
G3 X139.562 Y114.445 I-1.336 J.635 E.01403
G3 X139.281 Y114.827 I-.402 J-.001 E.01892
G2 X138.239 Y115.606 I.895 J2.285 E.04904
G2 X137.408 Y116.689 I11.499 J9.677 E.05086
G2 X136.373 Y118.259 I28.649 J20.017 E.07006
G2 X136.263 Y118.505 I1.241 J.701 E.01005
; WIPE_START
G1 X136.372 Y118.878 E-.14779
G1 X137.136 Y120.025 E-.52354
G1 X137.277 Y120.211 E-.08867
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.227 Y114.616 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.125504
G1 F3000
M204 S500
G1 X138.449 Y114.416 E.00201
; WIPE_START
G1 X138.227 Y114.616 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.186 Y114.228 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50682
G1 F6300
M204 S500
G1 X137.79 Y114.833 E.03233
G2 X137.489 Y115.187 I5.74 J5.194 E.0176
G1 X136.717 Y114.415 E.04127
G2 X136.06 Y114.415 I-.333 J8.151 E.02482
G1 X137.193 Y115.548 E.06057
G2 X136.915 Y115.926 I2.849 J2.386 E.01775
G1 X135.404 Y114.415 E.08077
G1 X134.772 Y114.439 E.02391
G1 X136.644 Y116.311 E.10008
G1 X136.383 Y116.706 E.0179
G1 X134.57 Y114.893 E.09692
G1 X134.62 Y115.035 E.0057
G1 X134.691 Y115.472 E.01671
G1 X134.652 Y115.631 E.00619
G1 X136.122 Y117.101 E.07858
G1 X135.861 Y117.496 E.0179
G1 X134.523 Y116.158 E.07151
G1 X134.314 Y116.605 E.01865
G1 X135.61 Y117.901 E.06928
G2 X135.416 Y118.363 I1.408 J.862 E.01902
G1 X134.053 Y117 E.07289
G3 X133.771 Y117.374 I-1.666 J-.964 E.01775
G1 X135.545 Y119.148 E.09488
G1 X135.475 Y119.117 E.00293
G1 X135.047 Y119.306 E.01769
G1 X133.432 Y117.691 E.08631
G3 X133.012 Y117.927 I-.722 J-.796 E.01837
G1 X134.619 Y119.534 E.08592
G1 X134.512 Y119.599 E.00474
G1 X134.269 Y119.84 E.01294
G1 X132.561 Y118.133 E.09131
G1 X132.378 Y118.216 E.00763
G1 X132.18 Y118.099 E.00869
G3 X132.356 Y118.583 I-1.707 J.894 E.01951
G1 X133.977 Y120.205 E.0867
G2 X133.728 Y120.611 I1.147 J.985 E.0181
G1 X132.315 Y119.198 E.07554
G3 X132.094 Y119.633 I-1.139 J-.304 E.01858
G1 X133.556 Y121.095 E.07817
G1 X133.489 Y121.326 E.00906
G1 X133.542 Y121.737 E.01568
G1 X131.808 Y120.003 E.09268
G1 X131.514 Y120.366 E.01763
G1 X133.265 Y122.117 E.09361
G3 X132.652 Y122.159 I-.559 J-3.611 E.02328
G1 X131.22 Y120.728 E.07652
G1 X130.926 Y121.09 E.01763
G1 X132.001 Y122.164 E.05743
G1 X131.343 Y122.162 E.02487
G1 X130.624 Y121.444 E.03842
G1 X130.292 Y121.768 E.01754
G1 X130.874 Y122.35 E.03109
; WIPE_START
G1 X130.292 Y121.768 E-.3125
G1 X130.624 Y121.444 E-.1763
G1 X131.129 Y121.949 E-.2712
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.761 Y122.017 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119115
G1 F3000
M204 S500
G1 X129.567 Y122.161 E.0015
; WIPE_START
G1 X129.761 Y122.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.237 Y115.253 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.125607
G1 F3000
M204 S500
G1 X130.176 Y115.115 E.00101
; LINE_WIDTH: 0.15691
G1 X129.913 Y114.241 E.00848
; WIPE_START
G1 X130.176 Y115.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.369 Y120.068 Z.6 F42000
G1 X123.153 Y121.106 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X123.128 Y121.095 E.00101
G1 X122.717 Y120.974 E.01597
G2 X121.925 Y121.423 I.466 J1.745 E.03431
G2 X121.685 Y121.983 I1.034 J.774 E.0229
G1 X121.62 Y122.568 E.02192
G3 X118.793 Y122.008 I.553 J-10.206 E.10769
G3 X117.544 Y121.421 I1.663 J-5.157 E.05155
G2 X118.189 Y121.104 I-1.288 J-3.445 E.02682
G2 X118.649 Y120.614 I-1.091 J-1.482 E.02518
G2 X118.826 Y119.827 I-2.849 J-1.056 E.03011
G2 X118.662 Y116.107 I-27.69 J-.638 E.1388
G2 X117.796 Y114.821 I-1.714 J.219 E.05988
G3 X117.555 Y114.596 I.549 J-.83 E.01236
G3 X117.658 Y114.364 I.141 J-.076 E.01092
G3 X118.349 Y114.175 I1.115 J2.717 E.02673
G3 X120.253 Y114.025 I1.674 J9.113 E.07126
G1 X120.54 Y114.026 E.0107
G3 X123.04 Y114.247 I.194 J12.08 E.09365
G3 X123.345 Y114.489 I-.188 J.551 E.01479
G1 X123.299 Y114.639 E.00587
G2 X122.448 Y114.974 I3.86 J11.071 E.03405
G1 X122.161 Y115.151 E.01257
G2 X121.73 Y116.01 I1.319 J1.199 E.03625
G2 X121.654 Y119.314 I15.367 J2.007 E.12332
G1 X121.715 Y119.748 E.01631
G2 X122.35 Y120.531 I1.159 J-.291 E.03878
G2 X122.85 Y120.66 I.778 J-1.98 E.01926
G2 X123.637 Y120.338 I-.247 J-1.727 E.03199
G3 X124.496 Y119.617 I3.136 J2.865 E.04191
G3 X125.404 Y119.572 I.522 J1.363 E.03442
G3 X126.16 Y122.192 I-.467 J1.554 E.12057
G3 X125.022 Y122.518 I-.85 J-.815 E.04624
G3 X123.953 Y121.874 I.12 J-1.407 E.04812
G2 X123.462 Y121.277 I-3.662 J2.514 E.02884
G2 X123.301 Y121.17 I-.683 J.855 E.00722
G1 X123.208 Y121.13 E.00376
M204 S6000
G1 X122.972 Y121.525 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X122.737 Y121.456 I-.428 J1.029 E.00914
G2 X122.28 Y121.715 I.327 J1.113 E.01975
G2 X122.136 Y122.061 I.636 J.466 E.01409
G3 X121.972 Y122.976 I-3.432 J-.144 E.03473
G1 X121.926 Y122.999 E.00191
G3 X121.604 Y123.025 I-.246 J-1.031 E.01208
G3 X118.652 Y122.443 I.579 J-10.707 E.11246
G3 X117.511 Y121.925 I1.577 J-4.987 E.04678
G3 X117.169 Y121.381 I.328 J-.586 E.02496
G3 X117.507 Y120.934 I.499 J.026 E.02215
G2 X118.239 Y120.397 I-.43 J-1.353 E.03442
G2 X118.369 Y119.805 I-2.184 J-.791 E.02264
G2 X118.209 Y116.176 I-27.075 J-.623 E.1354
G2 X117.528 Y115.191 I-1.28 J.158 E.04639
G3 X117.121 Y114.741 I.539 J-.896 E.02294
G3 X117.147 Y114.233 I.56 J-.226 E.01958
G3 X117.462 Y113.951 I.472 J.21 E.01622
G3 X118.256 Y113.727 I1.281 J3.03 E.03081
M73 P62 R5
G3 X120.545 Y113.569 I1.831 J9.884 E.08562
G3 X123.004 Y113.762 I.04 J15.296 E.09198
G3 X123.778 Y114.37 I-.143 J.979 E.03838
G3 X123.708 Y114.84 I-.641 J.144 E.01812
G3 X123.326 Y115.124 I-.491 J-.261 E.0183
G2 X122.673 Y115.372 I2.11 J6.552 E.02604
G1 X122.474 Y115.495 E.00871
G2 X122.181 Y116.095 I.92 J.821 E.02518
G2 X122.108 Y119.258 I14.92 J1.927 E.11806
G1 X122.16 Y119.628 E.01391
G2 X122.844 Y120.191 I.708 J-.163 E.03552
G2 X123.344 Y119.985 I-.148 J-1.069 E.02035
G3 X124.286 Y119.208 I3.396 J3.155 E.04563
G3 X125.495 Y119.124 I.732 J1.798 E.04588
G3 X126.932 Y120.547 I-.549 J1.992 E.07872
G3 X126.484 Y122.518 I-1.957 J.592 E.07874
G3 X124.944 Y122.969 I-1.188 J-1.203 E.06227
G3 X123.597 Y122.16 I.191 J-1.845 E.06042
G2 X123.177 Y121.636 I-3.805 J2.622 E.02504
G2 X123.027 Y121.549 I-.632 J.917 E.00645
M204 S6000
G1 X123.398 Y120.936 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.117406
G1 F3000
M204 S500
G1 X123.302 Y120.873 E.00069
; LINE_WIDTH: 0.143748
G1 X123.279 Y120.848 E.00028
; LINE_WIDTH: 0.117216
G3 X123.36 Y120.789 I.156 J.129 E.00061
; WIPE_START
G1 X123.279 Y120.848 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.345 Y120.826 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.55321
G1 F6300
M204 S500
G1 X125.649 Y120.13 E.04092
G2 X125.38 Y119.969 I-.51 J.546 E.01313
G2 X124.737 Y119.94 I-.387 J1.45 E.02696
G1 X126.152 Y121.354 E.08316
G3 X125.928 Y121.852 I-1.937 J-.573 E.02276
G1 X124.319 Y120.243 E.09459
G1 X123.941 Y120.587 E.02124
G1 X125.486 Y122.132 E.09086
G1 X125.257 Y122.16 E.00957
G3 X124.638 Y122.006 I.216 J-2.177 E.02664
G1 X123.597 Y120.965 E.0612
; WIPE_START
G1 X124.638 Y122.006 E-.55927
G1 X124.929 Y122.104 E-.11685
G1 X125.147 Y122.142 E-.08388
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.267 Y121.354 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122408
G1 F3000
M204 S500
G1 X118.11 Y121.473 E.00127
; WIPE_START
G1 X118.267 Y121.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.046 Y114.683 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.1219
G1 F3000
M204 S500
G2 X117.825 Y114.54 I-.308 J.233 E.00173
; WIPE_START
G1 X117.903 Y114.557 E-.22418
G1 X118.046 Y114.683 E-.53582
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.914 Y115.181 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50505
G1 F6300
M204 S500
G1 X121.168 Y114.434 E.03976
G2 X120.495 Y114.416 I-.547 J7.586 E.02533
G1 X121.511 Y115.431 E.05409
G1 X121.35 Y115.924 E.01952
G1 X119.851 Y114.424 E.07987
G2 X119.22 Y114.448 I-.149 J4.496 E.02377
G1 X121.283 Y116.51 E.10985
G2 X121.238 Y117.119 I7.488 J.862 E.02298
G1 X118.638 Y114.519 E.13844
G1 X118.555 Y114.534 E.0032
G1 X118.63 Y114.601 E.00382
G1 X118.428 Y114.834 E.01164
G1 X118.699 Y115.118 E.01476
G1 X118.836 Y115.371 E.01083
G1 X121.23 Y117.764 E.12746
G1 X121.227 Y118.415 E.02452
G1 X119.066 Y116.254 E.11511
G1 X119.134 Y116.976 E.02731
G1 X121.246 Y119.087 E.11245
G2 X121.334 Y119.829 I6.411 J-.388 E.02816
G1 X119.179 Y117.674 E.11478
G1 X119.2 Y118.349 E.02543
G1 X121.829 Y120.978 E.14
G2 X121.523 Y121.325 I.989 J1.178 E.0175
G1 X119.218 Y119.02 E.12275
G1 X119.215 Y119.671 E.02451
G1 X121.332 Y121.788 E.11271
G2 X121.276 Y122.148 I1.478 J.415 E.01378
G1 X121.016 Y122.126 E.00981
G1 X119.159 Y120.268 E.0989
G1 X119.007 Y120.77 E.01974
G1 X120.232 Y121.995 E.06524
G1 X119.355 Y121.771 E.03412
G1 X118.582 Y120.998 E.04117
; WIPE_START
G1 X119.355 Y121.771 E-.41542
G1 X120.232 Y121.995 E-.34426
G1 X120.232 Y121.995 E-.00031
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.157 Y114.609 Z.6 F42000
G1 X122.165 Y114.578 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.36648
G1 F3000
M204 S500
G1 X122.966 Y114.464 E.02133
M204 S6000
G1 X123.008 Y114.478 F42000
; LINE_WIDTH: 0.252294
G1 F3000
M204 S500
G1 X122.161 Y114.561 E.01453
M204 S6000
G1 X122.148 Y114.505 F42000
; LINE_WIDTH: 0.159155
G1 F3000
M204 S500
G1 X123.05 Y114.495 E.00855
; WIPE_START
G1 X122.148 Y114.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.542 Y115.141 Z.6 F42000
G1 X111.994 Y115.354 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X112.011 Y115.381 E.00116
G3 X112.231 Y115.685 I-1.107 J1.032 E.01404
G3 X112.447 Y116.744 I-2.396 J1.039 E.04054
G3 X111.708 Y120.482 I-10.747 J-.182 E.14264
G3 X110.975 Y121.545 I-2.387 J-.861 E.04865
G3 X110.017 Y121.901 I-1.283 J-1.986 E.03836
G3 X108.653 Y121.279 I.013 J-1.834 E.05753
G3 X108.406 Y120.853 I3.699 J-2.436 E.01836
G3 X108.249 Y119.432 I2.546 J-.999 E.05387
G3 X108.78 Y116.896 I13.509 J1.506 E.09662
G3 X109.168 Y115.874 I7.195 J2.143 E.04075
G3 X110.47 Y114.888 I1.543 J.685 E.06349
G1 X110.793 Y114.823 E.01228
G1 X111.223 Y114.933 E.01653
G3 X111.877 Y115.254 I-.319 J1.48 E.02742
G1 X111.949 Y115.315 E.00351
M204 S6000
G1 X111.676 Y115.694 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X111.759 Y115.784 I-.871 J.886 E.00458
G3 X111.989 Y116.751 I-1.723 J.92 E.03741
G3 X111.401 Y120.016 I-11.148 J-.324 E.12402
G3 X110.793 Y121.103 I-2.665 J-.776 E.0468
G3 X109.991 Y121.438 I-1.038 J-1.359 E.03272
G3 X109.492 Y121.346 I.08 J-1.833 E.01896
G3 X108.686 Y120.094 I.604 J-1.275 E.05841
G3 X108.909 Y118.212 I8.079 J.005 E.07078
G3 X109.575 Y116.083 I9.864 J1.915 E.08322
G3 X110.57 Y115.335 I1.142 J.483 E.04859
G1 X110.781 Y115.292 E.00804
G1 X111.097 Y115.372 E.01214
G3 X111.632 Y115.653 I-.292 J1.207 E.02274
; WIPE_START
G1 X111.759 Y115.784 E-.06944
G1 X111.823 Y115.893 E-.04788
G1 X111.915 Y116.144 E-.10172
G1 X111.967 Y116.466 E-.12397
G1 X111.989 Y116.751 E-.10843
G1 X111.942 Y117.562 E-.30855
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.693 Y116.232 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X106.511 Y115.115 I4.104 J2.147 E.05178
G3 X108.059 Y114.212 I3.871 J4.86 E.06697
G3 X109.849 Y113.957 I1.966 J7.386 E.06748
G1 X110.063 Y113.973 E.00802
G3 X112.096 Y114.342 I-.247 J7.144 E.07722
G3 X113.73 Y115.249 I-4.016 J9.164 E.06971
G3 X114.925 Y116.527 I-4.12 J5.051 E.06538
G3 X115.348 Y117.905 I-3.344 J1.779 E.05399
G1 X115.41 Y118.343 E.01649
G3 X113.547 Y121.819 I-4.349 J-.094 E.15247
G3 X111.943 Y122.514 I-2.843 J-4.366 E.0654
G3 X110.776 Y122.636 I-1.742 J-10.943 E.04371
G3 X108.704 Y122.324 I.34 J-9.29 E.07821
G3 X107.258 Y121.553 I2.022 J-5.532 E.06125
G1 X106.812 Y121.243 E.02024
G3 X105.693 Y119.803 I4.059 J-4.31 E.0682
G3 X105.372 Y118.446 I4.052 J-1.673 E.05213
G1 X105.324 Y117.972 E.01775
G3 X105.567 Y116.492 I5.925 J.214 E.05604
G3 X105.665 Y116.286 I4.23 J1.888 E.00849
M204 S6000
G1 X105.28 Y116.021 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X105.903 Y115.122 I3.55 J1.793 E.04089
G1 X106.2 Y114.775 E.01701
G3 X107.913 Y113.779 I4.222 J5.287 E.07406
G3 X109.851 Y113.499 I2.125 J7.853 E.0731
G1 X110.1 Y113.518 E.00933
G3 X112.262 Y113.916 I-.283 J7.593 E.08215
G3 X114.008 Y114.884 I-4.234 J9.699 E.07445
G3 X115.236 Y116.165 I-4.73 J5.761 E.06625
G3 X115.756 Y117.575 I-3.057 J1.929 E.05639
G3 X115.87 Y118.328 I-14.825 J2.633 E.02836
G3 X113.803 Y122.199 I-4.795 J-.072 E.16979
G3 X112.032 Y122.962 I-3.119 J-4.804 E.07216
G3 X110.774 Y123.095 I-1.859 J-11.6 E.04713
G3 X108.768 Y122.821 I.436 J-10.687 E.07552
G3 X107.002 Y121.931 I1.844 J-5.858 E.07399
G1 X106.512 Y121.591 E.02219
G3 X105.369 Y120.175 I4.676 J-4.944 E.06802
G3 X104.918 Y118.499 I4.097 J-2 E.06504
G1 X104.865 Y117.975 E.01961
G3 X105.137 Y116.336 I6.471 J.234 E.06206
G3 X105.253 Y116.075 I3.692 J1.479 E.01062
; WIPE_START
G1 X105.442 Y115.732 E-.14903
G1 X105.903 Y115.122 E-.29037
G1 X106.2 Y114.775 E-.17352
G1 X106.516 Y114.552 E-.14708
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.879 Y114.226 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50685
G1 F6300
M204 S500
G1 X109.52 Y114.867 E.03428
G2 X109.168 Y115.171 I.957 J1.468 E.01764
G1 X108.499 Y114.502 E.03577
G2 X107.996 Y114.655 I.327 J1.97 E.01993
G1 X108.9 Y115.559 E.04832
G1 X108.68 Y115.995 E.01846
G1 X107.56 Y114.876 E.05984
G2 X107.161 Y115.132 I2.5 J4.332 E.01796
G1 X108.516 Y116.488 E.07247
G1 X108.353 Y116.981 E.01963
G1 X106.776 Y115.403 E.08432
G1 X106.476 Y115.759 E.0176
G1 X108.215 Y117.499 E.09298
G1 X108.085 Y118.024 E.02048
G1 X106.194 Y116.134 E.10107
G2 X105.964 Y116.56 I2.481 J1.616 E.01832
G1 X107.979 Y118.575 E.10771
G2 X107.892 Y119.144 I3.736 J.863 E.02178
G1 X105.821 Y117.073 E.11068
G2 X105.747 Y117.655 I3.49 J.743 E.02219
G1 X107.84 Y119.748 E.11188
G2 X107.88 Y120.444 I3.637 J.14 E.0264
G1 X105.753 Y118.318 E.11367
G2 X105.869 Y119.089 I5.724 J-.461 E.0295
G1 X107.93 Y121.15 E.11022
G1 X107.559 Y121.21 E.01422
G1 X107.572 Y121.293 E.00315
G3 X107.08 Y120.956 I4.331 J-6.865 E.02254
G1 X105.886 Y119.762 E.06385
; WIPE_START
G1 X107.08 Y120.956 E-.64175
G1 X107.337 Y121.132 E-.11825
; WIPE_END
M73 P63 R5
G1 E-.04 F1800
M204 S6000
G1 X108.043 Y121.774 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490674
G1 F3000
M204 S500
G1 X108.433 Y121.711 E.01441
G1 X108.552 Y121.792 E.00523
; LINE_WIDTH: 0.462456
G1 X108.589 Y121.816 E.00152
; LINE_WIDTH: 0.436232
G1 X108.693 Y121.878 E.0039
; LINE_WIDTH: 0.3945
G1 X108.828 Y121.95 E.00437
; LINE_WIDTH: 0.351929
G1 X108.974 Y122.017 E.00405
; LINE_WIDTH: 0.309113
G1 X109.172 Y122.089 E.00458
; LINE_WIDTH: 0.261134
G2 X110.153 Y122.232 I.99 J-3.357 E.01768
; LINE_WIDTH: 0.308173
G1 X110.251 Y122.226 E.00213
; LINE_WIDTH: 0.346481
G1 X110.4 Y122.215 E.00368
; LINE_WIDTH: 0.387191
G1 X110.507 Y122.204 E.00301
; LINE_WIDTH: 0.422908
G1 X110.606 Y122.195 E.0031
; LINE_WIDTH: 0.443186
G1 X111.028 Y122.146 E.01386
M204 S6000
G1 X111.018 Y122.121 F42000
; LINE_WIDTH: 0.513467
G1 F3000
M204 S500
G1 X109.979 Y122.34 E.04073
; WIPE_START
G1 X111.018 Y122.121 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.429 Y115.056 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.526659
G1 F3000
M204 S500
G2 X112.098 Y114.841 I-1.973 J2.673 E.0156
; LINE_WIDTH: 0.485639
G1 X111.935 Y114.754 E.00665
; LINE_WIDTH: 0.445647
G1 X111.62 Y114.626 E.01118
; LINE_WIDTH: 0.407427
G1 X111.521 Y114.593 E.00308
G2 X111.231 Y114.518 I-1.348 J4.59 E.00889
; LINE_WIDTH: 0.373517
G2 X110.714 Y114.433 I-.7 J2.652 E.01416
; LINE_WIDTH: 0.397662
G1 X110.602 Y114.439 E.00324
; LINE_WIDTH: 0.431691
G1 X110.489 Y114.444 E.00355
; LINE_WIDTH: 0.467217
G1 X110.367 Y114.45 E.00422
; LINE_WIDTH: 0.498926
G1 X110.159 Y114.467 E.00779
; LINE_WIDTH: 0.525407
G1 X109.95 Y114.483 E.00824
; WIPE_START
G1 X110.159 Y114.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.937 Y114.982 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5223
G1 F6300
M204 S500
G1 X114.272 Y116.317 E.07374
G3 X114.738 Y117.025 I-1.607 J1.563 E.03331
G3 X114.897 Y117.619 I-2.334 J.943 E.02408
G1 X112.671 Y115.393 E.12296
G1 X112.585 Y115.521 E.00602
G1 X112.736 Y115.933 E.01712
G1 X112.776 Y116.176 E.00963
G1 X115.014 Y118.414 E.12366
G3 X114.948 Y119.026 I-3.466 J-.065 E.02407
G1 X112.828 Y116.906 E.11711
G3 X112.785 Y117.541 I-4.788 J-.006 E.02487
G1 X114.798 Y119.554 E.1112
G1 X114.593 Y120.027 E.02014
G1 X112.716 Y118.15 E.1037
G3 X112.61 Y118.722 I-3.301 J-.318 E.02274
G1 X114.342 Y120.454 E.09567
G3 X114.051 Y120.841 I-2.139 J-1.3 E.01895
G1 X112.495 Y119.285 E.08595
G3 X112.352 Y119.82 I-3.749 J-.72 E.02164
G1 X113.715 Y121.183 E.0753
G1 X113.34 Y121.486 E.01883
G1 X112.178 Y120.324 E.06422
G1 X111.987 Y120.811 E.02044
G1 X112.901 Y121.725 E.0505
G3 X112.447 Y121.949 I-1.442 J-2.351 E.0198
G1 X111.749 Y121.251 E.03856
G3 X111.451 Y121.631 I-1.587 J-.936 E.01892
G1 X112.107 Y122.287 E.03621
; WIPE_START
G1 X111.451 Y121.631 E-.35225
G1 X111.532 Y121.555 E-.04219
G1 X111.749 Y121.251 E-.14197
G1 X112.165 Y121.667 E-.2236
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.534 Y121.51 Z.6 F42000
G1 X97.795 Y121.371 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X97.767 Y121.409 E.00175
G2 X97.566 Y121.728 I1.426 J1.124 E.0141
G2 X97.486 Y122.766 I2.582 J.72 E.03901
G2 X97.757 Y124.672 I9.763 J-.417 E.07182
G1 X97.891 Y125.093 E.01643
G2 X98.686 Y125.725 I1.549 J-1.131 E.03829
G2 X99.439 Y125.824 I.734 J-2.668 E.0284
G2 X101.995 Y125.593 I-.13 J-15.678 E.09568
G2 X103.697 Y124.412 I-.884 J-3.091 E.07856
G3 X104.272 Y123.81 I7.467 J6.557 E.03102
G3 X104.532 Y123.983 I.028 J.238 E.01266
G3 X104.573 Y124.711 I-1.26 J.437 E.0275
G3 X104.089 Y126.09 I-2.626 J-.148 E.05514
G3 X103.802 Y126.49 I-1.545 J-.804 E.01841
G2 X98.681 Y126.271 I-4.268 J39.835 E.19103
G2 X94.069 Y126.447 I-.168 J56.268 E.17198
G3 X93.179 Y126.392 I-.299 J-2.409 E.03338
G1 X92.858 Y126.243 E.0132
G2 X93.952 Y125.533 I-.922 J-2.619 E.04904
G2 X94.384 Y124.281 I-1.825 J-1.329 E.05004
G2 X94.474 Y122.769 I-16.386 J-1.736 E.05644
G2 X94.371 Y117.545 I-72.138 J-1.194 E.19465
G1 X94.287 Y116.4 E.04277
G2 X93.766 Y115.209 I-2.081 J.2 E.04924
G2 X92.873 Y114.653 I-1.685 J1.714 E.03951
G1 X92.743 Y114.593 E.00531
G3 X92.983 Y114.238 I.394 J.007 E.01688
G3 X95.866 Y114.027 I2.322 J11.97 E.10792
G3 X99.153 Y114.345 I.22 J14.897 E.12324
G1 X99.265 Y114.388 E.00448
G1 X99.246 Y114.595 E.00773
G2 X98.601 Y114.732 I1.122 J6.864 E.02455
G2 X97.964 Y115.241 I.808 J1.664 E.03065
G2 X97.483 Y117.347 I3.965 J2.013 E.08124
G2 X97.503 Y119.024 I649.569 J-7.024 E.06247
G2 X97.844 Y119.883 I2.146 J-.353 E.03468
G2 X98.665 Y120.241 I1.334 J-1.942 E.03357
G2 X100.081 Y120.036 I.36 J-2.511 E.05403
G2 X100.499 Y119.771 I-1.794 J-3.294 E.01844
G2 X101.13 Y118.561 I-1.245 J-1.418 E.05201
G1 X101.153 Y118.398 E.00612
G1 X101.364 Y118.375 E.0079
G3 X101.707 Y120.044 I-3.817 J1.654 E.06392
G3 X101.748 Y121.494 I-200.251 J6.315 E.05404
G3 X101.524 Y122.281 I-1.27 J.063 E.03101
G3 X101.193 Y122.559 I-1.575 J-1.537 E.0161
G2 X100.866 Y121.565 I-3.21 J.507 E.03914
G2 X100.522 Y121.162 I-2.136 J1.476 E.01976
G2 X99.198 Y120.857 I-1.15 J1.965 E.05141
G2 X98.092 Y121.089 I.031 J2.898 E.04235
G1 X97.839 Y121.33 E.01301
M204 S6000
G1 X98.11 Y121.695 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X97.928 Y122.282 I.711 J.542 E.02336
G2 X98.196 Y124.543 I10.316 J-.075 E.08497
G1 X98.296 Y124.858 E.01232
G2 X98.965 Y125.33 I1.046 J-.774 E.03103
G2 X99.922 Y125.353 I.584 J-4.389 E.03573
G2 X101.882 Y125.148 I-.347 J-12.777 E.07345
G2 X103.124 Y124.374 I-.615 J-2.37 E.05535
G3 X104.002 Y123.435 I11.713 J10.074 E.04788
G3 X104.962 Y123.822 I.32 J.591 E.04402
G3 X105.028 Y124.761 I-1.596 J.584 E.03554
G3 X104.474 Y126.336 I-3.069 J-.194 E.06298
G3 X104.057 Y126.867 I-1.642 J-.859 E.02529
G3 X103.737 Y126.943 I-.288 J-.502 E.01244
G2 X98.683 Y126.728 I-4.203 J39.32 E.18853
G2 X94.09 Y126.903 I-.167 J55.907 E.17123
G3 X93.096 Y126.849 I-.332 J-3.056 E.03723
G3 X92.502 Y126.438 I.267 J-1.021 E.02748
G3 X92.515 Y125.963 I.43 J-.226 E.01851
G3 X93.082 Y125.64 I1.374 J1.753 E.0244
G2 X93.879 Y124.646 I-.628 J-1.319 E.04909
G2 X94.017 Y122.765 I-13.502 J-1.937 E.07029
G2 X93.915 Y117.576 I-71.618 J-1.191 E.19335
G1 X93.833 Y116.462 E.04162
G2 X93.442 Y115.532 I-1.629 J.138 E.03821
G2 X92.608 Y115.034 I-1.537 J1.629 E.03645
G3 X92.314 Y114.368 I.234 J-.501 E.02959
G3 X92.852 Y113.797 I.804 J.218 E.03046
G3 X95.87 Y113.57 I2.45 J12.428 E.11298
G3 X99.175 Y113.87 I.228 J15.883 E.12381
G3 X99.687 Y114.13 I-.184 J.997 E.02172
G3 X99.796 Y114.737 I-.628 J.425 E.02367
G3 X99.465 Y115.027 I-.401 J-.125 E.01723
G2 X98.764 Y115.163 I.816 J6.057 E.02661
G2 X98.355 Y115.489 I.517 J1.067 E.01962
G2 X97.94 Y117.346 I3.489 J1.755 E.07158
G2 X97.978 Y119.107 I25.293 J.339 E.06561
G2 X98.183 Y119.552 I1.431 J-.386 E.01835
G2 X99.041 Y119.803 I.792 J-1.118 E.03392
G2 X100.498 Y119.061 I.097 J-1.613 E.06387
G2 X100.679 Y118.482 I-1.69 J-.847 E.02271
G3 X100.833 Y117.705 I2.754 J.14 E.02959
G1 X100.858 Y117.679 E.00133
G3 X101.602 Y117.843 I.287 J.467 E.03137
G1 X101.682 Y117.949 E.00495
G3 X102.164 Y120.031 I-4.202 J2.07 E.08031
G3 X102.205 Y121.512 I-147.536 J4.767 E.05519
G3 X101.864 Y122.587 I-1.705 J.051 E.04279
G3 X101.22 Y123.072 I-2.23 J-2.287 E.0301
G3 X100.75 Y122.639 I.094 J-.574 E.02521
G2 X100.54 Y121.92 I-11.397 J2.93 E.02791
G2 X100.243 Y121.535 I-1.3 J.696 E.0182
G2 X99.207 Y121.314 I-.864 J1.519 E.0401
G2 X98.327 Y121.493 I.008 J2.304 E.03365
G2 X98.148 Y121.649 I.494 J.745 E.00887
; WIPE_START
G1 X98.044 Y121.792 E-.06712
G1 X97.958 Y122.012 E-.08992
G1 X97.928 Y122.282 E-.10318
G1 X97.98 Y123.236 E-.36303
G1 X98.027 Y123.593 E-.13675
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.57 Y120.579 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.204874
G1 F3000
M204 S500
G1 X99.403 Y120.548 E.01099
; LINE_WIDTH: 0.222901
G1 X99.753 Y120.53 E.00515
M204 S6000
G1 X99.77 Y120.597 F42000
; LINE_WIDTH: 0.164216
G1 F3000
M204 S500
G1 X99.684 Y120.571 E.00089
; LINE_WIDTH: 0.18156
G1 X99.673 Y120.568 E.00013
; LINE_WIDTH: 0.215246
G1 X99.618 Y120.537 E.00089
G1 X99.637 Y120.511 E.00045
; LINE_WIDTH: 0.191319
G1 X99.643 Y120.505 E.0001
; LINE_WIDTH: 0.162332
G1 X99.69 Y120.469 E.00058
; LINE_WIDTH: 0.120664
G1 X99.832 Y120.413 E.00097
M204 S6000
G1 X99.77 Y120.597 F42000
; LINE_WIDTH: 0.122045
G1 F3000
M204 S500
G1 X99.947 Y120.654 E.0012
; WIPE_START
G1 X99.77 Y120.597 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.934 Y120.643 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.175448
G1 F3000
M204 S500
G1 X98.618 Y120.531 E.00362
; LINE_WIDTH: 0.156286
G1 X98.505 Y120.488 E.00112
; LINE_WIDTH: 0.120713
G1 X98.392 Y120.444 E.00077
; WIPE_START
G1 X98.505 Y120.488 E-.76
; WIPE_END
M73 P64 R5
G1 E-.04 F1800
M204 S6000
G1 X101.107 Y119.432 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123278
G1 F3000
M204 S500
G2 X101.215 Y119.279 I-3.423 J-2.531 E.00122
; LINE_WIDTH: 0.175304
G1 X101.303 Y119.153 E.00166
; LINE_WIDTH: 0.184856
G2 X101.307 Y118.936 I-1.941 J-.145 E.00251
; WIPE_START
G1 X101.303 Y119.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.539 Y120.463 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54948
G1 F6300
M204 S500
G1 X100.939 Y119.862 E.03505
G3 X100.559 Y120.198 I-.835 J-.561 E.02118
G1 X101.563 Y121.203 E.05865
M204 S6000
G1 X101.147 Y121.546 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.121504
G1 F3000
M204 S500
G1 X101.246 Y121.693 E.00113
; LINE_WIDTH: 0.166963
G1 X101.299 Y121.777 E.00101
; LINE_WIDTH: 0.185869
G1 X101.432 Y121.997 E.00299
; WIPE_START
G1 X101.299 Y121.777 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.33 Y124.087 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.165018
G1 F3000
M204 S500
G3 X104.102 Y124.748 I-6.263 J-1.79 E.00696
; WIPE_START
G1 X104.33 Y124.087 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.074 Y125.757 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53277
G1 F6300
M204 S500
G1 X103.504 Y125.187 E.03217
G3 X103.125 Y125.501 I-1.929 J-1.942 E.01967
G1 X103.808 Y126.183 E.03855
; WIPE_START
G1 X103.125 Y125.501 E-.36698
G1 X103.504 Y125.187 E-.18696
G1 X103.887 Y125.57 E-.20606
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.643 Y125.91 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.34751
G1 F3000
M204 S500
G1 X102.075 Y125.963 E.01417
; LINE_WIDTH: 0.324362
G1 X101.906 Y125.971 E.00389
; LINE_WIDTH: 0.286879
G1 X101.734 Y125.979 E.00342
; LINE_WIDTH: 0.251876
G1 X101.572 Y125.988 E.00276
; LINE_WIDTH: 0.219365
G1 X101.409 Y125.997 E.00236
; LINE_WIDTH: 0.180639
G1 X101.156 Y126.008 E.00283
; LINE_WIDTH: 0.155139
G1 X101.117 Y126.01 E.00036
; LINE_WIDTH: 0.127875
G1 X100.694 Y126.025 E.00293
; WIPE_START
G1 X101.117 Y126.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.779 Y126.017 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.138641
G1 F3000
M204 S500
G3 X98.368 Y125.951 I.751 J-6.065 E.00325
M204 S6000
G1 X98.25 Y125.785 F42000
; LINE_WIDTH: 0.134714
G1 F3000
M204 S500
G2 X98.576 Y126.043 I3.798 J-4.443 E.00311
; WIPE_START
G1 X98.25 Y125.785 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.925 Y125.922 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.112073
G1 F3000
M204 S500
G1 X93.854 Y126.001 E.0006
; LINE_WIDTH: 0.138946
G1 X93.781 Y126.074 E.00081
; LINE_WIDTH: 0.184402
G1 X93.619 Y126.231 E.00261
; WIPE_START
G1 X93.781 Y126.074 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.542 Y118.445 Z.6 F42000
G1 X93.423 Y114.626 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109979
G1 F3000
M204 S500
G1 X93.327 Y114.552 E.00066
; LINE_WIDTH: 0.139361
G1 X93.149 Y114.439 E.00165
; WIPE_START
G1 X93.327 Y114.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.118 Y114.246 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51238
G1 F6300
M204 S500
G1 X97.759 Y114.887 E.03471
G1 X97.631 Y115.031 E.00737
G1 X97.515 Y115.306 E.01144
G1 X96.643 Y114.435 E.04715
G1 X95.963 Y114.418 E.02604
G1 X97.33 Y115.785 E.07396
G2 X97.187 Y116.307 I2.022 J.832 E.02074
G1 X95.299 Y114.419 E.10217
G1 X94.638 Y114.422 E.02526
G1 X97.112 Y116.896 E.13382
G2 X97.103 Y117.55 I3.471 J.376 E.02509
G1 X94.025 Y114.473 E.16651
G1 X93.959 Y114.478 E.00256
G1 X94.003 Y114.512 E.00212
G1 X93.819 Y114.749 E.01148
G1 X94.044 Y114.934 E.01115
G3 X94.457 Y115.568 I-1.352 J1.332 E.02913
G1 X97.108 Y118.22 E.14345
G1 X97.114 Y118.889 E.02561
G1 X94.68 Y116.456 E.13167
G1 X94.733 Y117.172 E.02749
G1 X97.984 Y120.423 E.17587
G1 X97.879 Y120.696 E.01118
G1 X97.947 Y120.728 E.00287
G1 X97.887 Y120.748 E.00242
G1 X97.763 Y120.866 E.00653
G1 X94.778 Y117.881 E.16147
G1 X94.816 Y118.583 E.02689
G1 X97.43 Y121.198 E.14144
G2 X97.192 Y121.623 I1.428 J1.082 E.01871
G1 X94.839 Y119.27 E.12729
G1 X94.852 Y119.947 E.02592
G1 X97.088 Y122.183 E.12094
G1 X97.106 Y122.865 E.02609
G1 X94.862 Y120.621 E.12138
G1 X94.86 Y121.283 E.02532
G1 X97.174 Y123.596 E.12516
G2 X97.286 Y124.373 I10.376 J-1.108 E.03002
G1 X94.858 Y121.945 E.13136
G1 X94.856 Y122.607 E.02532
G1 X97.87 Y125.635 E.16343
G1 X97.659 Y125.889 E.01265
G1 X97.669 Y125.897 E.00051
G1 X97.484 Y125.899 E.00707
G1 X94.851 Y123.266 E.14246
G1 X94.813 Y123.891 E.02399
G1 X96.83 Y125.909 E.10914
G1 X96.198 Y125.941 E.0242
G1 X94.747 Y124.49 E.07851
G1 X94.707 Y124.843 E.01361
G1 X94.632 Y125.039 E.008
G1 X95.567 Y125.973 E.05055
G1 X94.935 Y126.005 E.0242
G1 X94.281 Y125.351 E.03538
; WIPE_START
G1 X94.935 Y126.005 E-.35139
G1 X95.567 Y125.973 E-.24042
G1 X95.254 Y125.66 E-.16818
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.238 Y118.29 Z.6 F42000
G1 X98.217 Y114.653 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117864
G1 F3000
M204 S500
G1 X98.329 Y114.562 E.00088
; LINE_WIDTH: 0.158308
G1 X98.405 Y114.502 E.00091
; LINE_WIDTH: 0.175001
G1 X98.55 Y114.478 E.00159
M204 S6000
G1 X99.48 Y114.761 F42000
; LINE_WIDTH: 0.112381
G1 F3000
M204 S500
G1 X99.586 Y114.53 E.00144
M204 S6000
G1 X99.536 Y114.577 F42000
; LINE_WIDTH: 0.155527
G1 F3000
M204 S500
G3 X99.491 Y114.766 I-.641 J-.052 E.00179
M204 S6000
G1 X99.536 Y114.577 F42000
; LINE_WIDTH: 0.146327
G1 F3000
M204 S500
G1 X99.53 Y114.487 E.00076
; LINE_WIDTH: 0.113842
G2 X99.519 Y114.366 I-.769 J.007 E.0007
; OBJECT_ID: 941
; WIPE_START
G1 X99.53 Y114.487 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 783
M625
; start printing object, unique label id: 941
M624 BAAAAAAAAAA=
M204 S6000
G1 X107.08 Y113.368 Z.6 F42000
G1 X155.843 Y106.139 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X155.817 Y106.169 E.00145
G2 X155.68 Y106.309 I.887 J1.001 E.00732
G2 X155.475 Y107.445 I1.377 J.835 E.04395
G3 X153.695 Y107.011 I1.484 J-9.961 E.06835
G3 X151.876 Y106.353 I4.725 J-15.914 E.07207
G1 X151.491 Y106.154 E.01615
G2 X152.433 Y105.3 I-1.287 J-2.367 E.04778
G2 X152.605 Y104.203 I-3.297 J-1.08 E.04156
G2 X152.456 Y100.696 I-35.659 J-.239 E.13078
G1 X152.378 Y100.215 E.01817
G2 X151.706 Y99.33 I-1.675 J.574 E.04208
G3 X152.504 Y98.891 I.765 J.446 E.03564
G3 X153.135 Y98.889 I.331 J5.606 E.02352
G3 X154.795 Y98.956 I-12.019 J320.156 E.06189
G3 X155.911 Y99.162 I-1.247 J9.869 E.04229
G1 X156.194 Y99.277 E.01135
G2 X155.612 Y100.294 I6.398 J4.334 E.04367
G2 X155.503 Y101.331 I4.585 J1.007 E.03893
G2 X155.505 Y103.719 I94.113 J1.106 E.08897
G2 X155.849 Y105.303 I4.468 J-.139 E.06069
G2 X156.42 Y105.863 I2.748 J-2.235 E.02986
G2 X155.965 Y106.055 I.285 J1.307 E.01851
G1 X155.892 Y106.105 E.0033
; WIPE_START
G1 X155.817 Y106.169 E-.03729
G1 X155.68 Y106.309 E-.07458
G1 X155.57 Y106.502 E-.08435
G1 X155.506 Y106.692 E-.07643
G1 X155.476 Y106.85 E-.06098
G1 X155.45 Y107.097 E-.09426
G1 X155.475 Y107.445 E-.13255
G1 X154.957 Y107.358 E-.19957
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.408 Y106.119 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G2 X158.35 Y105.922 I-.102 J-2.829 E.03601
G2 X159.122 Y105.159 I-1.039 J-1.824 E.04088
G2 X159.519 Y102.772 I-5.713 J-2.177 E.0907
G2 X159.379 Y100.607 I-7.32 J-.615 E.08113
G2 X159.018 Y99.542 I-9.51 J2.631 E.04191
G1 X158.657 Y99.142 E.02008
G3 X160.02 Y98.927 I1.415 J4.545 E.05159
G3 X161.094 Y98.927 I.535 J46.529 E.04001
G3 X163.077 Y99.182 I-.012 J7.918 E.07465
G1 X163.277 Y99.274 E.00821
G2 X162.573 Y100.126 I5.731 J5.453 E.0412
G2 X162.359 Y101.05 I2.149 J.984 E.03556
G1 X162.219 Y104.576 E.13143
G3 X161.959 Y106.195 I-5.784 J-.099 E.06129
G3 X160.933 Y107.189 I-1.773 J-.802 E.05448
G3 X159.439 Y107.445 I-1.178 J-2.396 E.05723
G3 X158.435 Y107.17 I.036 J-2.104 E.03918
G3 X157.635 Y106.358 I2.775 J-3.535 E.04257
G1 X157.45 Y106.163 E.01004
; WIPE_START
G1 X158.003 Y106.043 E-.21519
G1 X158.35 Y105.922 E-.13963
G1 X158.509 Y105.83 E-.06991
G1 X158.67 Y105.704 E-.07749
G1 X158.924 Y105.428 E-.14244
G1 X159.104 Y105.184 E-.11534
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X156.123 Y106.5 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X155.909 Y107.104 I.633 J.565 E.02449
G3 X155.904 Y107.65 I-2.388 J.253 E.02037
G3 X155.544 Y107.913 I-.37 J-.129 E.01768
G3 X153.561 Y107.448 I1.32 J-10.093 E.07599
G3 X151.477 Y106.661 I3.323 J-11.953 E.08306
G3 X151.064 Y106.354 I.391 J-.955 E.01938
G3 X151.296 Y105.736 I.422 J-.194 E.02732
G2 X152.015 Y105.091 I-.981 J-1.817 E.0363
G2 X152.148 Y104.201 I-2.703 J-.861 E.03368
G2 X152.003 Y100.76 I-35.436 J-.232 E.12831
G1 X151.936 Y100.346 E.01563
G2 X151.3 Y99.605 I-1.388 J.547 E.03705
G3 X151.136 Y99.404 I.426 J-.517 E.00973
G1 X151.131 Y99.373 E.00118
G3 X151.779 Y98.623 I1.869 J.962 E.03727
G3 X152.905 Y98.424 I.931 J1.98 E.04309
G1 X153.157 Y98.433 E.00938
G3 X154.839 Y98.501 I-8.827 J238.64 E.0627
G3 X156.048 Y98.724 I-1.33 J10.572 E.04583
G3 X156.54 Y99.027 I-.195 J.867 E.02189
G3 X156.623 Y99.418 I-.548 J.321 E.01515
G3 X156.304 Y99.947 I-6.662 J-3.658 E.02303
M73 P65 R5
G2 X156.049 Y100.44 I4.672 J2.725 E.02067
G2 X155.96 Y101.333 I3.939 J.845 E.0335
G2 X155.962 Y103.706 I93.365 J1.103 E.08837
G2 X156.25 Y105.066 I3.844 J-.103 E.05206
G2 X156.953 Y105.592 I1.19 J-.86 E.03322
G2 X158.254 Y105.45 I.469 J-1.724 E.04988
G2 X158.71 Y104.948 I-1.429 J-1.756 E.02535
G2 X159.062 Y102.763 I-5.213 J-1.961 E.08296
G2 X158.936 Y100.719 I-7.044 J-.592 E.07656
G2 X158.62 Y99.783 I-8.488 J2.344 E.03682
G3 X158.208 Y99.289 I1.821 J-1.937 E.02401
G3 X158.392 Y98.803 I.532 J-.076 E.02021
G3 X158.892 Y98.607 I.648 J.92 E.02021
G3 X160.011 Y98.47 I1.106 J4.381 E.0421
G3 X162.326 Y98.562 I.562 J15.015 E.08638
G3 X163.145 Y98.716 I-2.466 J15.408 E.03103
G3 X163.596 Y98.994 I-.215 J.852 E.02005
G3 X163.685 Y99.474 I-.671 J.373 E.01852
G3 X163.469 Y99.735 I-.762 J-.41 E.01271
G2 X162.977 Y100.347 I4.043 J3.751 E.02926
G2 X162.816 Y101.076 I1.678 J.755 E.02801
G1 X162.676 Y104.6 E.13135
G3 X162.386 Y106.364 I-6.327 J-.133 E.0668
G3 X161.141 Y107.596 I-2.184 J-.961 E.0668
G3 X159.392 Y107.899 I-1.387 J-2.811 E.06706
G3 X158.179 Y107.549 I.082 J-2.558 E.04749
G3 X157.187 Y106.55 I3.81 J-4.776 E.05256
G2 X156.648 Y106.292 I-.844 J1.072 E.02246
G2 X156.173 Y106.467 I.181 J1.222 E.01896
M204 S6000
G1 X156.819 Y106.106 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.14993
G1 F3000
M204 S500
G1 X156.897 Y105.878 E.0021
G1 X157.047 Y105.886 E.00131
; LINE_WIDTH: 0.112473
G1 X157.164 Y105.887 E.00066
M204 S6000
G1 X157.141 Y106.197 F42000
; LINE_WIDTH: 0.163687
G1 F3000
M204 S500
G1 X156.803 Y105.973 E.00399
; WIPE_START
G1 X157.141 Y106.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X155.572 Y99.972 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.52817
G1 F6300
M204 S500
G1 X154.97 Y99.37 E.03366
G2 X154.23 Y99.316 I-.885 J7.017 E.02937
G1 X155.215 Y100.302 E.05509
G2 X155.13 Y100.902 I3.056 J.742 E.02403
G1 X153.53 Y99.302 E.08947
G2 X152.819 Y99.278 I-.543 J5.586 E.02811
G1 X155.117 Y101.576 E.12848
G1 X155.117 Y102.262 E.02713
G1 X152.568 Y99.713 E.14253
G1 X152.754 Y100.106 E.01717
G1 X152.838 Y100.669 E.02251
G1 X155.117 Y102.948 E.12746
G1 X155.117 Y103.635 E.02713
G1 X152.91 Y101.428 E.12342
G3 X152.945 Y102.149 I-13.188 J1.008 E.02857
G1 X155.175 Y104.379 E.12468
G2 X155.45 Y105.34 I6.498 J-1.341 E.03959
G1 X152.976 Y102.866 E.13835
G3 X152.984 Y103.56 I-10.299 J.462 E.02745
G1 X155.43 Y106.007 E.13679
G2 X155.18 Y106.443 I1.187 J.971 E.01997
G1 X152.99 Y104.253 E.12244
G3 X152.932 Y104.881 I-4.109 J-.063 E.02497
G1 X155.025 Y106.974 E.11702
G3 X154.07 Y106.705 I1.795 J-8.213 E.03924
G1 X152.8 Y105.435 E.07103
G1 X152.79 Y105.476 E.00165
G1 X152.507 Y105.828 E.01789
G1 X153.403 Y106.725 E.05012
; WIPE_START
G1 X152.507 Y105.828 E-.4817
G1 X152.79 Y105.476 E-.17192
G1 X152.8 Y105.435 E-.01582
G1 X152.969 Y105.604 E-.09056
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.137 Y101.109 Z.6 F42000
G1 X161.827 Y99.148 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.52432
G1 F6300
M204 S500
G1 X162.396 Y99.718 E.03157
G1 X162.224 Y99.943 E.0111
G1 X162.154 Y100.156 E.00883
G1 X161.323 Y99.325 E.0461
G2 X160.632 Y99.315 I-.464 J8.126 E.02711
G1 X162.007 Y100.691 E.0763
G2 X161.959 Y101.323 I4.828 J.689 E.02489
G1 X159.955 Y99.32 E.11114
G2 X159.37 Y99.372 I-.029 J2.992 E.0231
G1 X159.394 Y99.439 E.00279
G1 X161.931 Y101.976 E.14075
G1 X161.903 Y102.629 E.02563
G1 X159.737 Y100.462 E.12018
G3 X159.883 Y101.29 I-4.108 J1.154 E.03301
G1 X161.875 Y103.281 E.1105
G1 X161.847 Y103.934 E.02563
G1 X159.917 Y102.005 E.10705
G3 X159.911 Y102.679 I-8.746 J.251 E.02645
G1 X161.819 Y104.587 E.10587
G3 X161.776 Y105.225 I-4.116 J.044 E.02511
G1 X159.893 Y103.342 E.10445
G3 X159.839 Y103.968 I-3.876 J-.024 E.02468
G1 X161.668 Y105.798 E.10149
G3 X161.471 Y106.282 I-1.193 J-.204 E.02065
G1 X159.724 Y104.534 E.09694
G3 X159.562 Y105.053 I-3.017 J-.654 E.02136
G1 X161.134 Y106.625 E.08719
G1 X160.695 Y106.868 E.01965
G1 X159.34 Y105.512 E.07519
G3 X159.036 Y105.889 I-1.591 J-.975 E.01904
G1 X160.173 Y107.026 E.06309
G1 X159.661 Y107.075 E.02018
G1 X159.527 Y107.061 E.00526
G1 X158.656 Y106.19 E.04831
G1 X158.312 Y106.36 E.01508
G1 X158.177 Y106.392 E.00542
G1 X158.974 Y107.188 E.04417
; WIPE_START
G1 X158.177 Y106.392 E-.42788
G1 X158.312 Y106.36 E-.05248
G1 X158.656 Y106.19 E-.14606
G1 X158.905 Y106.439 E-.13358
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.356 Y105.315 Z.6 F42000
G1 X146.481 Y104.589 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X146.716 Y104.979 I-.509 J.571 E.01721
G3 X146.38 Y106.39 I-1.481 J.392 E.05626
G3 X144.803 Y106.742 I-1.063 J-1.057 E.06355
G3 X143.856 Y105.53 I.672 J-1.501 E.05959
G3 X144.077 Y104.562 I1.002 J-.281 E.03854
G3 X144.793 Y104.373 I.652 J1.017 E.02803
G1 X145.828 Y104.373 E.03857
G1 X146.013 Y104.396 E.00693
G3 X146.435 Y104.551 I-.041 J.764 E.01701
; WIPE_START
G1 X146.625 Y104.754 E-.10549
G1 X146.716 Y104.979 E-.09235
G1 X146.775 Y105.271 E-.11315
G1 X146.731 Y105.693 E-.16122
G1 X146.697 Y105.83 E-.0536
G1 X146.59 Y106.074 E-.10127
G1 X146.396 Y106.365 E-.13292
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.611 Y103.134 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X143.634 Y103.16 E.0013
G2 X143.745 Y103.314 I1.197 J-.749 E.00704
G2 X144.489 Y103.608 I.792 J-.913 E.03038
G1 X149.25 Y103.608 E.17732
G3 X149.41 Y104.475 I-1.062 J.645 E.03357
G3 X148.932 Y105.766 I-2.689 J-.263 E.05186
G3 X147.74 Y106.893 I-2.774 J-1.739 E.06176
G3 X145.778 Y107.503 I-2.054 J-3.148 E.07751
G1 X145.73 Y107.258 E.00933
G2 X147.209 Y105.585 I-.414 J-1.857 E.08889
G1 X147.236 Y105.247 E.01262
G2 X146.922 Y104.378 I-1.783 J.153 E.0348
G2 X146.086 Y103.945 I-.977 J.861 E.03591
G1 X145.857 Y103.916 E.00858
G2 X144.576 Y103.922 I-.536 J22.082 E.04774
G2 X143.774 Y104.203 I.278 J2.077 E.03185
G2 X143.405 Y105.607 I1.086 J1.036 E.05647
G2 X144.65 Y107.173 I2.068 J-.366 E.07764
G1 X144.904 Y107.247 E.00986
G1 X144.855 Y107.494 E.00938
G3 X142.179 Y106.304 I.554 J-4.85 E.11076
G3 X141.601 Y105.677 I6.977 J-7.013 E.03177
G3 X140.873 Y104.193 I3.703 J-2.739 E.06191
G3 X140.738 Y103.12 I9.377 J-1.722 E.04031
G3 X142.182 Y99.901 I4.37 J.027 E.13526
G3 X143.656 Y99.076 I3.591 J4.684 E.06315
G3 X145.497 Y98.878 I1.485 J5.174 E.06931
G3 X147.509 Y99.364 I-.117 J4.887 E.07765
G3 X148.427 Y99.903 I-6.076 J11.409 E.03965
G3 X148.904 Y100.395 I-.786 J1.239 E.02577
G1 X148.961 Y100.559 E.00645
G1 X148.811 Y100.681 E.00723
G2 X146.434 Y99.97 I-2.507 J4.055 E.09347
G2 X143.688 Y101.604 I.102 J3.295 E.12424
G2 X143.428 Y102.569 I3.803 J1.543 E.03734
G2 X143.555 Y103.017 I1.403 J-.158 E.0174
G1 X143.585 Y103.08 E.00262
M204 S6000
G1 X144.016 Y102.908 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X144.274 Y103.11 I.493 J-.366 E.01234
G2 X144.517 Y103.151 I.303 J-1.036 E.00921
G1 X149.215 Y103.151 E.17499
G3 X149.725 Y103.539 I-.014 J.548 E.02549
G3 X149.838 Y104.743 I-1.747 J.771 E.04582
G3 X147.98 Y107.282 I-3.696 J-.755 E.12089
G3 X145.907 Y107.949 I-2.232 J-3.379 E.08213
G3 X141.685 Y106.456 I-.562 J-5.126 E.17254
G3 X141.05 Y105.665 I3.283 J-3.285 E.03787
G3 X140.316 Y103.56 I3.352 J-2.349 E.08406
G3 X140.333 Y102.459 I4.514 J-.483 E.04111
G3 X141.891 Y99.546 I4.735 J.659 E.12565
G3 X143.521 Y98.639 I3.901 J5.09 E.06971
G3 X145.535 Y98.423 I1.62 J5.608 E.07582
M73 P66 R5
G3 X147.716 Y98.957 I-.149 J5.329 E.08427
G3 X148.691 Y99.529 I-6.408 J12.04 E.04214
G3 X149.328 Y100.225 I-1.034 J1.585 E.03548
G3 X149.451 Y100.672 I-2.787 J1.008 E.0173
G3 X149.066 Y101.291 I-.763 J-.046 E.02829
G3 X148.794 Y101.216 I-.041 J-.382 E.01077
G2 X146.442 Y100.429 I-2.512 J3.597 E.09363
G2 X144.098 Y101.806 I.095 J2.844 E.10558
M73 P66 R4
G2 X143.895 Y102.562 I3.124 J1.248 E.0292
G2 X143.982 Y102.859 I.614 J-.019 E.01167
M204 S6000
G1 X144.107 Y103.785 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.144481
G1 F3000
M204 S500
G1 X143.799 Y103.786 E.00254
; WIPE_START
G1 X144.107 Y103.785 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.159 Y106.453 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.299071
G1 F3000
M204 S500
G1 X143.554 Y106.778 E.01068
; LINE_WIDTH: 0.272276
G1 X143.932 Y107.06 E.00882
M204 S6000
G1 X143.957 Y107.046 F42000
; LINE_WIDTH: 0.144644
G1 F3000
M204 S500
G1 X143.089 Y106.506 E.00847
; WIPE_START
G1 X143.957 Y107.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.599 Y107.142 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.208047
G1 F3000
M204 S500
G1 X146.903 Y106.968 E.00471
; LINE_WIDTH: 0.239182
G1 X146.956 Y106.935 E.00099
; LINE_WIDTH: 0.275474
G2 X147.46 Y106.532 I-2.938 J-4.189 E.01224
M204 S6000
G1 X147.431 Y106.509 F42000
; LINE_WIDTH: 0.435676
G1 F3000
M204 S500
G3 X146.792 Y107.105 I-9.405 J-9.464 E.02798
; WIPE_START
G1 X147.431 Y106.509 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.929 Y104.027 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.117141
G1 F3000
M204 S500
G1 X146.864 Y103.961 E.00056
; LINE_WIDTH: 0.144239
G2 X146.742 Y103.878 I-.163 J.107 E.00125
; LINE_WIDTH: 0.113921
G1 X146.663 Y103.86 E.00046
; WIPE_START
G1 X146.742 Y103.878 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.164 Y104.849 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54313
G1 F6300
M204 S500
G1 X148.312 Y103.997 E.04912
G1 X147.604 Y103.997 E.02883
G1 X148.803 Y105.196 E.0691
G3 X148.544 Y105.643 I-1.817 J-.753 E.02116
G1 X147.452 Y104.552 E.06294
G1 X147.53 Y104.742 E.0084
G1 X147.628 Y105.228 E.02021
G1 X147.609 Y105.416 E.00768
G1 X148.222 Y106.029 E.03535
G1 X147.942 Y106.299 E.01587
G1 X147.845 Y106.36 E.00463
G1 X147.347 Y105.861 E.02874
; WIPE_START
G1 X147.845 Y106.36 E-.26791
G1 X147.942 Y106.299 E-.0432
G1 X148.222 Y106.029 E-.148
G1 X147.662 Y105.469 E-.30091
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.003 Y101.063 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191303
G1 F3000
M204 S500
G1 X148.995 Y101.008 E.00067
; LINE_WIDTH: 0.21744
G1 X148.986 Y100.954 E.00079
; LINE_WIDTH: 0.209498
G2 X149.105 Y100.827 I-.795 J-.869 E.00237
; LINE_WIDTH: 0.157573
G2 X149.226 Y100.656 I-.963 J-.807 E.00196
; WIPE_START
G1 X149.105 Y100.827 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X148.291 Y100.12 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.11285
G1 F3000
M204 S500
G1 X148.158 Y100.053 E.00085
; LINE_WIDTH: 0.141098
G1 X148.005 Y99.98 E.00136
; LINE_WIDTH: 0.178707
G1 X147.841 Y99.902 E.00201
; LINE_WIDTH: 0.215774
G1 X147.71 Y99.846 E.00201
; LINE_WIDTH: 0.252234
G1 X147.572 Y99.788 E.00255
; LINE_WIDTH: 0.286813
G1 X147.456 Y99.743 E.00248
; LINE_WIDTH: 0.321262
G1 X147.316 Y99.69 E.00338
; LINE_WIDTH: 0.35378
G1 X147.214 Y99.657 E.00273
; LINE_WIDTH: 0.386226
G1 X147.085 Y99.616 E.00377
; LINE_WIDTH: 0.420035
G1 X146.974 Y99.586 E.00353
; LINE_WIDTH: 0.45549
G1 X146.825 Y99.551 E.00516
; LINE_WIDTH: 0.492466
G1 X146.691 Y99.525 E.00498
; LINE_WIDTH: 0.531019
G2 X146.448 Y99.487 I-.841 J4.574 E.00979
; LINE_WIDTH: 0.567412
G2 X146.318 Y99.479 I-.161 J1.468 E.00557
; LINE_WIDTH: 0.594813
G1 X145.979 Y99.469 E.01523
M204 S6000
G1 X145.66 Y99.903 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5138
G1 F6300
M204 S500
G1 X145.02 Y99.262 E.03474
G2 X144.411 Y99.319 I.095 J4.322 E.0235
G1 X145.003 Y99.912 E.03215
G1 X144.581 Y100.155 E.01872
G1 X143.853 Y99.427 E.0395
G2 X143.374 Y99.614 I.68 J2.439 E.01975
G1 X144.186 Y100.426 E.04404
G1 X143.845 Y100.751 E.01807
G1 X142.951 Y99.857 E.04854
G2 X142.549 Y100.121 I2.495 J4.225 E.01845
G1 X143.539 Y101.111 E.05371
G2 X143.298 Y101.536 I1.439 J1.095 E.01881
G1 X142.197 Y100.435 E.05975
G2 X141.894 Y100.798 I1.971 J1.955 E.01816
G1 X143.141 Y102.045 E.06765
G1 X143.03 Y102.572 E.02068
G1 X143.038 Y102.608 E.00141
G1 X141.636 Y101.205 E.07611
G1 X141.584 Y101.286 E.00368
G1 X141.424 Y101.659 E.01558
G1 X143.41 Y103.646 E.1078
G1 X143.411 Y104.04 E.01512
G1 X143.295 Y104.196 E.00747
G1 X141.249 Y102.151 E.11102
G2 X141.157 Y102.725 I2.905 J.759 E.02235
G1 X143.066 Y104.633 E.10358
G2 X142.976 Y105.209 I1.776 J.573 E.02246
G1 X141.15 Y103.383 E.0991
G2 X141.269 Y104.169 I6.891 J-.647 E.03051
G1 X143.022 Y105.921 E.09508
G1 X143.003 Y105.909 E.00084
G1 X142.767 Y106.289 E.01716
G3 X142.563 Y106.128 I.667 J-1.054 E.00995
G1 X141.358 Y104.923 E.06542
; WIPE_START
G1 X142.563 Y106.128 E-.64787
G1 X142.767 Y106.289 E-.09839
G1 X142.786 Y106.258 E-.01374
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.813 Y103.153 Z.6 F42000
G1 X130.712 Y100.882 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X130.49 Y100.997 E.0093
G2 X129.559 Y99.618 I-31.098 J19.99 E.06197
G2 X128.937 Y99.159 I-1.804 J1.796 E.02891
G1 X128.97 Y98.951 E.00785
G3 X130.35 Y98.903 I1.559 J25.206 E.05142
G3 X130.858 Y99.114 I.07 J.55 E.02143
G2 X130.463 Y100.006 I1.333 J1.125 E.03683
G2 X130.689 Y100.826 I3.966 J-.654 E.03177
; WIPE_START
G1 X130.49 Y100.997 E-.09967
G1 X129.559 Y99.618 E-.63215
G1 X129.503 Y99.569 E-.02818
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.781 Y103.521 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X135.906 Y103.876 E.01403
G1 X135.98 Y104.014 E.00581
G1 X136.443 Y104.709 E.03112
G1 X136.279 Y104.868 E.00851
G2 X135.949 Y104.656 I-1.075 J1.307 E.01463
G1 X135.473 Y104.442 E.01944
G2 X134.615 Y104.93 I.832 J2.461 E.03702
G2 X134.021 Y105.785 I2.318 J2.243 E.03894
G2 X133.885 Y106.256 I3.118 J1.161 E.01828
G2 X134.163 Y107.069 I1.401 J-.026 E.03253
G1 X134.267 Y107.245 E.00762
G3 X133.363 Y107.404 I-1.324 J-4.891 E.03424
G3 X129.879 Y107.346 I-1.451 J-17.572 E.12999
G3 X129.02 Y107.189 I2.932 J-18.405 E.03252
G1 X129.006 Y106.979 E.00785
G2 X130.233 Y106.196 I-.781 J-2.578 E.05492
G2 X130.597 Y105.793 I-4.058 J-4.035 E.02023
G1 X131.726 Y104.388 E.06714
G2 X132.026 Y103.759 I-1.408 J-1.059 E.02612
G2 X131.851 Y103.205 I-1.766 J.255 E.02174
G1 X131.189 Y102.112 E.04761
G1 X131.382 Y101.962 E.00909
G2 X131.863 Y102.373 I1.669 J-1.467 E.02367
G1 X132.401 Y102.679 E.02304
G2 X133.089 Y102.365 I-1.627 J-4.479 E.02821
G2 X133.614 Y101.858 I-1.335 J-1.909 E.02729
G2 X134.156 Y100.929 I-2.895 J-2.307 E.0402
G2 X134.295 Y100.356 I-4.449 J-1.385 E.02195
G2 X134.031 Y99.566 I-1.692 J.125 E.03135
G2 X133.44 Y99.115 I-1.472 J1.317 E.02788
G3 X136.394 Y98.924 I2.416 J14.459 E.11047
G1 X136.711 Y98.926 E.01178
G3 X138.842 Y99.155 I-.118 J11.145 E.07994
G1 X139.152 Y99.274 E.01238
G2 X138.183 Y99.873 I1.941 J4.22 E.04253
G2 X137.03 Y101.332 I9.822 J8.949 E.06933
G2 X135.975 Y102.932 I29.181 J20.376 E.07139
G2 X135.759 Y103.456 I2.143 J1.195 E.02114
G1 X135.762 Y103.464 E.00034
; WIPE_START
G1 X135.906 Y103.876 E-.16594
G1 X135.98 Y104.014 E-.05931
G1 X136.443 Y104.709 E-.31747
G1 X136.279 Y104.868 E-.08684
G1 X135.99 Y104.682 E-.13043
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.021 Y105.921 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X137.228 Y105.814 E.00868
G1 X137.414 Y106.063 E.0116
G1 X137.932 Y106.732 E.03151
G2 X138.652 Y107.245 I1.671 J-1.58 E.03314
G1 X138.609 Y107.453 E.00789
G3 X137.05 Y107.395 I-.548 J-6.244 E.05827
G1 X136.786 Y107.33 E.01011
G2 X137.159 Y106.4 I-2.13 J-1.392 E.03756
G2 X137.04 Y105.977 I-4.719 J1.095 E.01634
; WIPE_START
G1 X137.228 Y105.814 E-.0947
G1 X137.414 Y106.063 E-.1183
G1 X137.932 Y106.732 E-.32143
G1 X138.278 Y107.033 E-.17425
G1 X138.395 Y107.1 E-.05132
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.245 Y103.462 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X136.372 Y103.778 I1.059 J-.242 E.01275
G2 X138.271 Y106.423 I27.676 J-17.869 E.12133
G2 X139.179 Y106.996 I1.926 J-2.045 E.04022
G3 X139.474 Y107.188 I-1.05 J1.94 E.01314
G1 X139.497 Y107.227 E.00165
G3 X139.195 Y107.772 I-.477 J.093 E.02521
G3 X138.358 Y107.923 I-.873 J-2.444 E.03181
G3 X136.95 Y107.841 I-.335 J-6.347 E.05265
G1 X136.636 Y107.764 E.01205
G3 X136.271 Y107.344 I.175 J-.521 E.02172
G3 X136.474 Y106.963 I.858 J.213 E.01624
G2 X136.687 Y106.405 I-1.497 J-.891 E.02235
G2 X136.4 Y105.728 I-1.67 J.307 E.02761
G2 X135.848 Y105.122 I-2 J1.268 E.03067
G2 X135.472 Y104.942 I-1.285 J2.204 E.01557
G2 X134.65 Y105.611 I.508 J1.464 E.04027
G2 X134.349 Y106.287 I1.194 J.936 E.02784
G2 X134.553 Y106.83 I1.064 J-.09 E.02187
G3 X134.735 Y107.265 I-1.016 J.68 E.01766
G3 X134.347 Y107.699 I-.479 J-.037 E.02328
G3 X133.414 Y107.858 I-1.426 J-5.517 E.03532
G3 X129.81 Y107.798 I-1.502 J-17.991 E.13446
G3 X128.683 Y107.566 I1.41 J-9.692 E.0429
G3 X128.135 Y107.028 I.112 J-.662 E.03044
G3 X128.463 Y106.652 I.408 J.024 E.01999
G2 X129.566 Y106.196 I-.572 J-2.949 E.04476
G2 X130.246 Y105.501 I-4.152 J-4.738 E.03627
G1 X131.363 Y104.109 E.06646
G2 X131.548 Y103.735 I-.844 J-.648 E.01565
G2 X131.445 Y103.417 I-1.014 J.153 E.01249
G2 X129.212 Y99.92 I-43.833 J25.52 E.15458
G2 X128.37 Y99.458 I-1.129 J1.06 E.03639
G3 X127.95 Y99.31 I.073 J-.875 E.01676
G1 X127.91 Y99.248 E.00275
G3 X128.187 Y98.663 I.442 J-.148 E.02663
G3 X129.677 Y98.468 I1.253 J3.78 E.05631
G3 X130.37 Y98.447 I.572 J7.344 E.02583
G3 X131.299 Y98.96 I.058 J.993 E.04172
G1 X131.38 Y99.088 E.00564
G3 X131.141 Y99.493 I-.766 J-.181 E.01778
G2 X130.933 Y100.011 I1.253 J.803 E.02091
G2 X131.464 Y101.26 I2.852 J-.474 E.05105
G2 X132.428 Y102.168 I1.776 J-.92 E.05029
G2 X133.245 Y101.589 I-.435 J-1.477 E.03798
G2 X133.771 Y100.613 I-2.225 J-1.828 E.04157
G1 X133.83 Y100.344 E.01026
G2 X133.374 Y99.614 I-.817 J.004 E.03372
M73 P67 R4
G3 X133.063 Y99.378 I.258 J-.663 E.01476
G3 X133.085 Y99.005 I.38 J-.164 E.01443
G3 X133.464 Y98.685 I.457 J.157 E.0194
G3 X134.04 Y98.566 I.631 J1.603 E.022
G3 X136.718 Y98.469 I2.019 J18.652 E.09989
G3 X138.965 Y98.713 I-.135 J11.745 E.08432
G3 X139.446 Y98.988 I-.263 J1.016 E.02087
G3 X139.562 Y99.345 I-1.336 J.635 E.01403
G3 X139.281 Y99.727 I-.402 J-.001 E.01892
G2 X138.239 Y100.506 I.895 J2.285 E.04904
G2 X137.408 Y101.589 I11.499 J9.677 E.05086
G2 X136.373 Y103.159 I28.649 J20.017 E.07006
G2 X136.263 Y103.405 I1.241 J.701 E.01005
; WIPE_START
G1 X136.372 Y103.778 E-.14779
G1 X137.136 Y104.925 E-.52354
G1 X137.277 Y105.111 E-.08867
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.227 Y99.516 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.125504
G1 F3000
M204 S500
G1 X138.449 Y99.316 E.00201
; WIPE_START
G1 X138.227 Y99.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.186 Y99.128 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50682
G1 F6300
M204 S500
G1 X137.79 Y99.733 E.03233
G2 X137.489 Y100.087 I5.74 J5.194 E.0176
G1 X136.717 Y99.315 E.04127
G2 X136.06 Y99.315 I-.333 J8.151 E.02482
G1 X137.193 Y100.448 E.06057
G2 X136.915 Y100.826 I2.849 J2.386 E.01775
G1 X135.404 Y99.315 E.08077
G1 X134.772 Y99.339 E.02391
G1 X136.644 Y101.211 E.10008
G1 X136.383 Y101.606 E.0179
G1 X134.57 Y99.793 E.09692
G1 X134.62 Y99.935 E.0057
G1 X134.691 Y100.372 E.01671
G1 X134.652 Y100.531 E.00619
G1 X136.122 Y102.001 E.07858
G1 X135.861 Y102.396 E.0179
G1 X134.523 Y101.058 E.07151
G1 X134.314 Y101.505 E.01865
G1 X135.61 Y102.801 E.06928
G2 X135.416 Y103.263 I1.408 J.862 E.01902
G1 X134.053 Y101.9 E.07289
G3 X133.771 Y102.273 I-1.666 J-.964 E.01775
G1 X135.545 Y104.048 E.09488
G1 X135.475 Y104.016 E.00293
G1 X135.047 Y104.206 E.01769
G1 X133.432 Y102.591 E.08631
G3 X133.012 Y102.827 I-.722 J-.796 E.01837
G1 X134.619 Y104.434 E.08592
G1 X134.512 Y104.499 E.00474
G1 X134.269 Y104.74 E.01294
G1 X132.561 Y103.032 E.09131
G1 X132.378 Y103.116 E.00763
G1 X132.18 Y102.999 E.00869
G3 X132.356 Y103.483 I-1.707 J.894 E.01951
G1 X133.977 Y105.105 E.0867
G2 X133.728 Y105.511 I1.147 J.985 E.0181
G1 X132.315 Y104.098 E.07554
G3 X132.094 Y104.533 I-1.139 J-.304 E.01858
G1 X133.556 Y105.995 E.07817
G1 X133.489 Y106.225 E.00906
G1 X133.542 Y106.637 E.01568
G1 X131.808 Y104.903 E.09268
G1 X131.514 Y105.265 E.01763
G1 X133.265 Y107.016 E.09361
G3 X132.652 Y107.059 I-.559 J-3.611 E.02328
G1 X131.22 Y105.628 E.07652
G1 X130.926 Y105.99 E.01763
G1 X132.001 Y107.064 E.05743
G1 X131.343 Y107.062 E.02487
G1 X130.624 Y106.344 E.03842
G1 X130.292 Y106.668 E.01754
G1 X130.874 Y107.249 E.03109
; WIPE_START
G1 X130.292 Y106.668 E-.3125
G1 X130.624 Y106.344 E-.1763
G1 X131.129 Y106.848 E-.2712
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.761 Y106.917 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119115
G1 F3000
M204 S500
G1 X129.567 Y107.061 E.0015
; WIPE_START
G1 X129.761 Y106.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.237 Y100.153 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.125607
G1 F3000
M204 S500
G1 X130.176 Y100.015 E.00101
; LINE_WIDTH: 0.15691
G1 X129.913 Y99.141 E.00848
; WIPE_START
G1 X130.176 Y100.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.369 Y104.968 Z.6 F42000
G1 X123.153 Y106.006 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X123.128 Y105.995 E.00101
G1 X122.717 Y105.874 E.01597
G2 X121.925 Y106.323 I.466 J1.745 E.03431
G2 X121.685 Y106.883 I1.034 J.774 E.0229
G1 X121.62 Y107.468 E.02192
G3 X118.793 Y106.908 I.553 J-10.206 E.10769
G3 X117.544 Y106.321 I1.663 J-5.157 E.05155
G2 X118.189 Y106.004 I-1.288 J-3.445 E.02682
G2 X118.649 Y105.514 I-1.091 J-1.482 E.02518
G2 X118.826 Y104.727 I-2.849 J-1.056 E.03011
G2 X118.662 Y101.007 I-27.69 J-.638 E.1388
G2 X117.796 Y99.721 I-1.714 J.219 E.05988
G3 X117.555 Y99.495 I.549 J-.83 E.01236
G3 X117.658 Y99.264 I.141 J-.076 E.01092
G3 X118.349 Y99.075 I1.115 J2.717 E.02673
G3 X120.253 Y98.925 I1.674 J9.113 E.07126
G1 X120.54 Y98.926 E.0107
G3 X123.04 Y99.147 I.194 J12.08 E.09365
G3 X123.345 Y99.389 I-.188 J.551 E.01479
G1 X123.299 Y99.539 E.00587
G2 X122.448 Y99.874 I3.86 J11.071 E.03405
G1 X122.161 Y100.051 E.01257
G2 X121.73 Y100.91 I1.319 J1.199 E.03625
G2 X121.654 Y104.214 I15.367 J2.007 E.12332
G1 X121.715 Y104.648 E.01631
G2 X122.35 Y105.431 I1.159 J-.291 E.03878
G2 X122.85 Y105.56 I.778 J-1.98 E.01926
G2 X123.637 Y105.238 I-.247 J-1.727 E.03199
G3 X124.496 Y104.517 I3.136 J2.865 E.04191
G3 X125.404 Y104.472 I.522 J1.363 E.03442
G3 X126.16 Y107.091 I-.467 J1.554 E.12057
G3 X125.022 Y107.418 I-.85 J-.815 E.04624
G3 X123.953 Y106.774 I.12 J-1.407 E.04812
G2 X123.462 Y106.177 I-3.662 J2.514 E.02884
G2 X123.301 Y106.07 I-.683 J.855 E.00722
G1 X123.208 Y106.03 E.00376
M204 S6000
G1 X122.972 Y106.425 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X122.737 Y106.356 I-.428 J1.029 E.00914
G2 X122.28 Y106.615 I.327 J1.113 E.01975
G2 X122.136 Y106.961 I.636 J.466 E.01409
G3 X121.972 Y107.876 I-3.432 J-.144 E.03473
G1 X121.926 Y107.899 E.00191
G3 X121.604 Y107.925 I-.246 J-1.031 E.01208
G3 X118.652 Y107.343 I.579 J-10.707 E.11246
G3 X117.511 Y106.825 I1.577 J-4.987 E.04678
G3 X117.169 Y106.281 I.328 J-.586 E.02496
G3 X117.507 Y105.834 I.499 J.026 E.02215
G2 X118.239 Y105.297 I-.43 J-1.353 E.03442
G2 X118.369 Y104.705 I-2.184 J-.791 E.02264
G2 X118.209 Y101.076 I-27.075 J-.623 E.1354
G2 X117.528 Y100.091 I-1.28 J.158 E.04639
G3 X117.121 Y99.641 I.539 J-.896 E.02294
G3 X117.147 Y99.133 I.56 J-.226 E.01958
G3 X117.462 Y98.85 I.472 J.21 E.01622
G3 X118.256 Y98.627 I1.281 J3.03 E.03081
G3 X120.545 Y98.469 I1.831 J9.884 E.08562
G3 X123.004 Y98.662 I.04 J15.296 E.09198
G3 X123.778 Y99.27 I-.143 J.979 E.03838
G3 X123.708 Y99.74 I-.641 J.144 E.01812
G3 X123.326 Y100.024 I-.491 J-.261 E.0183
G2 X122.673 Y100.272 I2.11 J6.552 E.02604
G1 X122.474 Y100.395 E.00871
G2 X122.181 Y100.995 I.92 J.821 E.02518
G2 X122.108 Y104.158 I14.92 J1.927 E.11806
G1 X122.16 Y104.528 E.01391
G2 X122.844 Y105.091 I.708 J-.163 E.03552
G2 X123.344 Y104.885 I-.148 J-1.069 E.02035
G3 X124.286 Y104.108 I3.396 J3.155 E.04563
G3 X125.495 Y104.024 I.732 J1.798 E.04588
G3 X126.932 Y105.447 I-.549 J1.992 E.07872
G3 X126.484 Y107.418 I-1.957 J.592 E.07874
G3 X124.944 Y107.868 I-1.188 J-1.203 E.06227
G3 X123.597 Y107.06 I.191 J-1.845 E.06042
G2 X123.177 Y106.536 I-3.805 J2.622 E.02504
G2 X123.027 Y106.449 I-.632 J.917 E.00645
M204 S6000
G1 X123.398 Y105.836 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.117406
G1 F3000
M204 S500
G1 X123.302 Y105.773 E.00069
; LINE_WIDTH: 0.143748
G1 X123.279 Y105.748 E.00028
; LINE_WIDTH: 0.117216
G3 X123.36 Y105.689 I.156 J.129 E.00061
; WIPE_START
G1 X123.279 Y105.748 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.345 Y105.726 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.55321
G1 F6300
M204 S500
G1 X125.649 Y105.03 E.04092
G2 X125.38 Y104.869 I-.51 J.546 E.01313
G2 X124.737 Y104.84 I-.387 J1.45 E.02696
G1 X126.152 Y106.254 E.08316
G3 X125.928 Y106.752 I-1.937 J-.573 E.02276
G1 X124.319 Y105.143 E.09459
G1 X123.941 Y105.486 E.02124
G1 X125.486 Y107.031 E.09086
G1 X125.257 Y107.06 E.00957
G3 X124.638 Y106.905 I.216 J-2.177 E.02664
G1 X123.597 Y105.865 E.0612
; WIPE_START
G1 X124.638 Y106.905 E-.55927
G1 X124.929 Y107.004 E-.11685
G1 X125.147 Y107.041 E-.08388
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.267 Y106.254 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122408
G1 F3000
M204 S500
G1 X118.11 Y106.373 E.00127
; WIPE_START
G1 X118.267 Y106.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.046 Y99.583 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.1219
G1 F3000
M204 S500
G2 X117.825 Y99.44 I-.308 J.233 E.00173
; WIPE_START
G1 X117.903 Y99.457 E-.22418
G1 X118.046 Y99.583 E-.53582
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.914 Y100.081 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50505
G1 F6300
M204 S500
G1 X121.168 Y99.334 E.03976
G2 X120.495 Y99.315 I-.547 J7.586 E.02533
M73 P68 R4
G1 X121.511 Y100.331 E.05409
G1 X121.35 Y100.824 E.01952
G1 X119.851 Y99.324 E.07987
G2 X119.22 Y99.347 I-.149 J4.496 E.02377
G1 X121.283 Y101.41 E.10985
G2 X121.238 Y102.018 I7.488 J.862 E.02298
G1 X118.638 Y99.419 E.13844
G1 X118.555 Y99.433 E.0032
G1 X118.63 Y99.501 E.00382
G1 X118.428 Y99.734 E.01164
G1 X118.699 Y100.018 E.01476
G1 X118.836 Y100.27 E.01083
G1 X121.23 Y102.664 E.12746
G1 X121.227 Y103.315 E.02452
G1 X119.066 Y101.154 E.11511
G1 X119.134 Y101.876 E.02731
G1 X121.246 Y103.987 E.11245
G2 X121.334 Y104.729 I6.411 J-.388 E.02816
G1 X119.179 Y102.574 E.11478
G1 X119.2 Y103.249 E.02543
G1 X121.829 Y105.878 E.14
G2 X121.523 Y106.225 I.989 J1.178 E.0175
G1 X119.218 Y103.92 E.12275
G1 X119.215 Y104.571 E.02451
G1 X121.332 Y106.687 E.11271
G2 X121.276 Y107.048 I1.478 J.415 E.01378
G1 X121.016 Y107.025 E.00981
G1 X119.159 Y105.168 E.0989
G1 X119.007 Y105.67 E.01974
G1 X120.232 Y106.895 E.06524
G1 X119.355 Y106.671 E.03412
G1 X118.582 Y105.898 E.04117
; WIPE_START
G1 X119.355 Y106.671 E-.41542
G1 X120.232 Y106.895 E-.34426
G1 X120.232 Y106.895 E-.00031
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.157 Y99.509 Z.6 F42000
G1 X122.165 Y99.478 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.36648
G1 F3000
M204 S500
G1 X122.966 Y99.363 E.02133
M204 S6000
G1 X123.008 Y99.378 F42000
; LINE_WIDTH: 0.252294
G1 F3000
M204 S500
G1 X122.161 Y99.461 E.01453
M204 S6000
G1 X122.148 Y99.405 F42000
; LINE_WIDTH: 0.159155
G1 F3000
M204 S500
G1 X123.05 Y99.395 E.00855
; WIPE_START
G1 X122.148 Y99.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.542 Y100.041 Z.6 F42000
G1 X111.994 Y100.254 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X112.011 Y100.28 E.00116
G3 X112.231 Y100.585 I-1.107 J1.032 E.01404
G3 X112.447 Y101.644 I-2.396 J1.039 E.04054
G3 X111.708 Y105.381 I-10.747 J-.182 E.14264
G3 X110.975 Y106.445 I-2.387 J-.861 E.04865
G3 X110.017 Y106.801 I-1.283 J-1.986 E.03836
G3 X108.653 Y106.178 I.013 J-1.834 E.05753
G3 X108.406 Y105.752 I3.699 J-2.436 E.01836
G3 X108.249 Y104.331 I2.546 J-.999 E.05387
G3 X108.78 Y101.796 I13.509 J1.506 E.09662
G3 X109.168 Y100.774 I7.195 J2.143 E.04075
G3 X110.47 Y99.788 I1.543 J.685 E.06349
G1 X110.793 Y99.723 E.01228
G1 X111.223 Y99.833 E.01653
G3 X111.877 Y100.153 I-.319 J1.48 E.02742
G1 X111.949 Y100.215 E.00351
M204 S6000
G1 X111.676 Y100.594 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X111.759 Y100.684 I-.871 J.885 E.00458
G3 X111.989 Y101.651 I-1.723 J.92 E.03741
G3 X111.401 Y104.916 I-11.148 J-.324 E.12402
G3 X110.793 Y106.003 I-2.665 J-.776 E.0468
G3 X109.991 Y106.338 I-1.038 J-1.359 E.03272
G3 X109.492 Y106.246 I.08 J-1.833 E.01896
G3 X108.686 Y104.994 I.604 J-1.275 E.05841
G3 X108.909 Y103.111 I8.079 J.005 E.07078
G3 X109.575 Y100.983 I9.864 J1.915 E.08322
G3 X110.57 Y100.234 I1.142 J.483 E.04859
G1 X110.781 Y100.191 E.00804
G1 X111.097 Y100.272 E.01214
G3 X111.632 Y100.553 I-.292 J1.207 E.02274
; WIPE_START
G1 X111.759 Y100.684 E-.06944
G1 X111.823 Y100.793 E-.04788
G1 X111.915 Y101.044 E-.10172
G1 X111.967 Y101.366 E-.12397
G1 X111.989 Y101.651 E-.10843
G1 X111.942 Y102.461 E-.30855
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.693 Y101.132 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X106.511 Y100.015 I4.104 J2.147 E.05178
G3 X108.059 Y99.112 I3.871 J4.86 E.06697
G3 X109.849 Y98.857 I1.966 J7.386 E.06748
G1 X110.063 Y98.873 E.00802
G3 X112.096 Y99.242 I-.247 J7.144 E.07722
G3 X113.73 Y100.149 I-4.016 J9.164 E.06971
G3 X114.925 Y101.427 I-4.12 J5.051 E.06538
G3 X115.348 Y102.805 I-3.344 J1.779 E.05399
G1 X115.41 Y103.243 E.01649
G3 X113.547 Y106.719 I-4.349 J-.094 E.15247
G3 X111.943 Y107.413 I-2.843 J-4.366 E.0654
G3 X110.776 Y107.536 I-1.742 J-10.943 E.04371
G3 X108.704 Y107.224 I.34 J-9.29 E.07821
G3 X107.258 Y106.453 I2.022 J-5.532 E.06125
G1 X106.812 Y106.143 E.02024
G3 X105.693 Y104.703 I4.059 J-4.31 E.0682
G3 X105.372 Y103.346 I4.052 J-1.673 E.05213
G1 X105.324 Y102.872 E.01775
G3 X105.567 Y101.391 I5.925 J.214 E.05604
G3 X105.665 Y101.186 I4.23 J1.888 E.00849
M204 S6000
G1 X105.28 Y100.921 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X105.903 Y100.021 I3.55 J1.793 E.04089
G1 X106.2 Y99.675 E.01701
G3 X107.913 Y98.679 I4.222 J5.287 E.07406
G3 X109.851 Y98.399 I2.125 J7.853 E.0731
G1 X110.1 Y98.418 E.00933
G3 X112.262 Y98.816 I-.283 J7.593 E.08215
G3 X114.008 Y99.784 I-4.234 J9.699 E.07445
G3 X115.236 Y101.065 I-4.73 J5.761 E.06625
G3 X115.756 Y102.475 I-3.057 J1.929 E.05639
G3 X115.87 Y103.228 I-14.825 J2.633 E.02836
G3 X113.803 Y107.099 I-4.795 J-.072 E.16979
G3 X112.032 Y107.862 I-3.119 J-4.804 E.07216
G3 X110.774 Y107.994 I-1.859 J-11.6 E.04713
G3 X108.768 Y107.721 I.436 J-10.687 E.07552
G3 X107.002 Y106.831 I1.844 J-5.858 E.07399
G1 X106.512 Y106.491 E.02219
G3 X105.369 Y105.074 I4.676 J-4.944 E.06802
G3 X104.918 Y103.399 I4.097 J-2 E.06504
G1 X104.865 Y102.875 E.01961
G3 X105.137 Y101.235 I6.471 J.234 E.06206
G3 X105.253 Y100.975 I3.692 J1.479 E.01062
; WIPE_START
G1 X105.442 Y100.631 E-.14903
G1 X105.903 Y100.021 E-.29037
G1 X106.2 Y99.675 E-.17352
G1 X106.516 Y99.452 E-.14708
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.879 Y99.126 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50685
G1 F6300
M204 S500
G1 X109.52 Y99.767 E.03428
G2 X109.168 Y100.071 I.957 J1.468 E.01764
G1 X108.499 Y99.402 E.03577
G2 X107.996 Y99.555 I.327 J1.97 E.01993
G1 X108.9 Y100.459 E.04832
G1 X108.68 Y100.895 E.01846
G1 X107.56 Y99.775 E.05984
G2 X107.161 Y100.032 I2.5 J4.332 E.01796
G1 X108.516 Y101.387 E.07247
G1 X108.353 Y101.88 E.01963
G1 X106.776 Y100.303 E.08432
G1 X106.476 Y100.659 E.0176
G1 X108.215 Y102.398 E.09298
G1 X108.085 Y102.924 E.02048
G1 X106.194 Y101.034 E.10107
G2 X105.964 Y101.46 I2.481 J1.616 E.01832
G1 X107.979 Y103.474 E.10771
G2 X107.892 Y104.043 I3.736 J.863 E.02178
G1 X105.821 Y101.973 E.11068
G2 X105.747 Y102.555 I3.49 J.743 E.02219
G1 X107.84 Y104.647 E.11188
G2 X107.88 Y105.343 I3.637 J.14 E.0264
G1 X105.753 Y103.217 E.11367
G2 X105.869 Y103.989 I5.724 J-.461 E.0295
G1 X107.93 Y106.05 E.11022
G1 X107.559 Y106.11 E.01422
G1 X107.572 Y106.192 E.00315
G3 X107.08 Y105.856 I4.331 J-6.865 E.02254
G1 X105.886 Y104.662 E.06385
; WIPE_START
G1 X107.08 Y105.856 E-.64175
G1 X107.337 Y106.032 E-.11825
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.043 Y106.674 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490674
G1 F3000
M204 S500
G1 X108.433 Y106.611 E.01441
G1 X108.552 Y106.692 E.00523
; LINE_WIDTH: 0.462456
G1 X108.589 Y106.716 E.00152
; LINE_WIDTH: 0.436232
G1 X108.693 Y106.778 E.0039
; LINE_WIDTH: 0.3945
G1 X108.828 Y106.85 E.00437
; LINE_WIDTH: 0.351929
G1 X108.974 Y106.917 E.00405
; LINE_WIDTH: 0.309113
G1 X109.172 Y106.989 E.00458
; LINE_WIDTH: 0.261134
G2 X110.153 Y107.132 I.99 J-3.357 E.01768
; LINE_WIDTH: 0.308173
G1 X110.251 Y107.126 E.00213
; LINE_WIDTH: 0.346481
G1 X110.4 Y107.115 E.00368
; LINE_WIDTH: 0.387191
G1 X110.507 Y107.104 E.00301
; LINE_WIDTH: 0.422908
G1 X110.606 Y107.095 E.0031
; LINE_WIDTH: 0.443186
G1 X111.028 Y107.046 E.01386
M204 S6000
G1 X111.018 Y107.021 F42000
; LINE_WIDTH: 0.513467
G1 F3000
M204 S500
G1 X109.979 Y107.24 E.04073
; WIPE_START
G1 X111.018 Y107.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.429 Y99.956 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.526659
G1 F3000
M204 S500
G2 X112.098 Y99.741 I-1.973 J2.673 E.0156
; LINE_WIDTH: 0.485639
G1 X111.935 Y99.654 E.00665
; LINE_WIDTH: 0.445647
G1 X111.62 Y99.525 E.01118
; LINE_WIDTH: 0.407427
G1 X111.521 Y99.493 E.00308
G2 X111.231 Y99.418 I-1.348 J4.59 E.00889
; LINE_WIDTH: 0.373517
G2 X110.714 Y99.333 I-.7 J2.652 E.01416
; LINE_WIDTH: 0.397662
G1 X110.602 Y99.339 E.00324
; LINE_WIDTH: 0.431691
G1 X110.489 Y99.344 E.00355
; LINE_WIDTH: 0.467217
G1 X110.367 Y99.35 E.00422
; LINE_WIDTH: 0.498926
G1 X110.159 Y99.366 E.00779
; LINE_WIDTH: 0.525407
G1 X109.95 Y99.383 E.00824
; WIPE_START
G1 X110.159 Y99.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.937 Y99.882 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5223
G1 F6300
M204 S500
G1 X114.272 Y101.216 E.07374
G3 X114.738 Y101.925 I-1.607 J1.563 E.03331
G3 X114.897 Y102.519 I-2.334 J.943 E.02408
G1 X112.671 Y100.293 E.12296
G1 X112.585 Y100.421 E.00602
G1 X112.736 Y100.833 E.01712
M73 P69 R4
G1 X112.776 Y101.076 E.00963
G1 X115.014 Y103.314 E.12366
G3 X114.948 Y103.926 I-3.466 J-.065 E.02407
G1 X112.828 Y101.806 E.11711
G3 X112.785 Y102.441 I-4.788 J-.006 E.02487
G1 X114.798 Y104.454 E.1112
G1 X114.593 Y104.927 E.02014
G1 X112.716 Y103.05 E.1037
G3 X112.61 Y103.622 I-3.301 J-.318 E.02274
G1 X114.342 Y105.354 E.09567
G3 X114.051 Y105.741 I-2.139 J-1.3 E.01895
G1 X112.495 Y104.185 E.08595
G3 X112.352 Y104.72 I-3.749 J-.72 E.02164
G1 X113.715 Y106.083 E.0753
G1 X113.34 Y106.386 E.01883
G1 X112.178 Y105.224 E.06422
G1 X111.987 Y105.711 E.02044
G1 X112.901 Y106.625 E.0505
G3 X112.447 Y106.849 I-1.442 J-2.351 E.0198
G1 X111.749 Y106.151 E.03856
G3 X111.451 Y106.531 I-1.587 J-.936 E.01892
G1 X112.107 Y107.187 E.03621
; WIPE_START
G1 X111.451 Y106.531 E-.35225
G1 X111.532 Y106.455 E-.04219
G1 X111.749 Y106.151 E-.14197
G1 X112.165 Y106.567 E-.2236
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.534 Y106.41 Z.6 F42000
G1 X97.795 Y106.271 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X97.767 Y106.309 E.00175
G2 X97.566 Y106.628 I1.426 J1.124 E.0141
G2 X97.486 Y107.666 I2.582 J.72 E.03901
G2 X97.757 Y109.572 I9.763 J-.417 E.07182
G1 X97.891 Y109.992 E.01643
G2 X98.686 Y110.625 I1.549 J-1.131 E.03829
G2 X99.439 Y110.724 I.734 J-2.668 E.0284
G2 X101.995 Y110.493 I-.13 J-15.678 E.09568
G2 X103.697 Y109.312 I-.884 J-3.091 E.07856
G3 X104.272 Y108.71 I7.467 J6.557 E.03102
G3 X104.532 Y108.883 I.028 J.238 E.01266
G3 X104.573 Y109.611 I-1.26 J.437 E.0275
G3 X104.089 Y110.99 I-2.626 J-.148 E.05514
G3 X103.802 Y111.39 I-1.545 J-.804 E.01841
G2 X98.681 Y111.171 I-4.268 J39.835 E.19103
G2 X94.069 Y111.346 I-.168 J56.268 E.17198
G3 X93.179 Y111.292 I-.299 J-2.409 E.03338
G1 X92.858 Y111.143 E.0132
G2 X93.952 Y110.433 I-.922 J-2.619 E.04904
G2 X94.384 Y109.181 I-1.825 J-1.329 E.05004
G2 X94.474 Y107.669 I-16.386 J-1.736 E.05644
G2 X94.371 Y102.445 I-72.138 J-1.194 E.19465
G1 X94.287 Y101.3 E.04277
G2 X93.766 Y100.109 I-2.081 J.2 E.04924
G2 X92.873 Y99.553 I-1.685 J1.714 E.03951
G1 X92.743 Y99.493 E.00531
G3 X92.983 Y99.137 I.394 J.007 E.01688
G3 X95.866 Y98.927 I2.322 J11.97 E.10792
G3 X99.153 Y99.245 I.22 J14.897 E.12324
G1 X99.265 Y99.288 E.00448
G1 X99.246 Y99.495 E.00773
G2 X98.601 Y99.632 I1.122 J6.864 E.02455
G2 X97.964 Y100.141 I.808 J1.664 E.03065
G2 X97.483 Y102.247 I3.965 J2.013 E.08124
G2 X97.503 Y103.924 I649.569 J-7.024 E.06247
G2 X97.844 Y104.783 I2.146 J-.353 E.03468
G2 X98.665 Y105.14 I1.334 J-1.942 E.03357
G2 X100.081 Y104.936 I.36 J-2.511 E.05403
G2 X100.499 Y104.671 I-1.794 J-3.294 E.01844
G2 X101.13 Y103.461 I-1.245 J-1.418 E.05201
G1 X101.153 Y103.298 E.00612
G1 X101.364 Y103.275 E.0079
G3 X101.707 Y104.944 I-3.817 J1.654 E.06392
G3 X101.748 Y106.394 I-200.251 J6.315 E.05404
G3 X101.524 Y107.181 I-1.27 J.063 E.03101
G3 X101.193 Y107.459 I-1.575 J-1.537 E.0161
G2 X100.866 Y106.465 I-3.21 J.507 E.03914
G2 X100.522 Y106.062 I-2.136 J1.476 E.01976
G2 X99.198 Y105.757 I-1.15 J1.965 E.05141
G2 X98.092 Y105.989 I.031 J2.898 E.04235
G1 X97.839 Y106.23 E.01301
M204 S6000
G1 X98.11 Y106.595 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X97.928 Y107.182 I.711 J.542 E.02336
G2 X98.196 Y109.443 I10.316 J-.075 E.08497
G1 X98.296 Y109.758 E.01232
G2 X98.965 Y110.23 I1.046 J-.774 E.03103
G2 X99.922 Y110.253 I.584 J-4.389 E.03573
G2 X101.882 Y110.048 I-.347 J-12.777 E.07345
G2 X103.124 Y109.274 I-.615 J-2.37 E.05535
G3 X104.002 Y108.335 I11.713 J10.074 E.04788
G3 X104.962 Y108.722 I.32 J.591 E.04402
G3 X105.028 Y109.661 I-1.596 J.584 E.03554
G3 X104.474 Y111.236 I-3.069 J-.194 E.06298
G3 X104.057 Y111.767 I-1.642 J-.859 E.02529
G3 X103.737 Y111.843 I-.288 J-.502 E.01244
G2 X98.683 Y111.628 I-4.203 J39.32 E.18853
G2 X94.09 Y111.803 I-.167 J55.907 E.17123
G3 X93.096 Y111.749 I-.332 J-3.056 E.03723
G3 X92.502 Y111.338 I.267 J-1.021 E.02748
G3 X92.515 Y110.863 I.43 J-.226 E.01851
G3 X93.082 Y110.54 I1.374 J1.753 E.0244
G2 X93.879 Y109.546 I-.628 J-1.319 E.04909
G2 X94.017 Y107.665 I-13.502 J-1.937 E.07029
G2 X93.915 Y102.476 I-71.618 J-1.191 E.19335
G1 X93.833 Y101.362 E.04162
G2 X93.442 Y100.431 I-1.629 J.138 E.03821
G2 X92.608 Y99.934 I-1.537 J1.629 E.03645
G3 X92.314 Y99.268 I.234 J-.501 E.02959
G3 X92.852 Y98.697 I.804 J.218 E.03046
G3 X95.87 Y98.47 I2.45 J12.428 E.11298
G3 X99.175 Y98.769 I.228 J15.883 E.12381
G3 X99.687 Y99.03 I-.184 J.997 E.02172
G3 X99.796 Y99.637 I-.628 J.425 E.02367
G3 X99.465 Y99.926 I-.401 J-.125 E.01723
G2 X98.764 Y100.063 I.816 J6.057 E.02661
G2 X98.355 Y100.389 I.517 J1.067 E.01962
G2 X97.94 Y102.246 I3.489 J1.755 E.07158
G2 X97.978 Y104.006 I25.293 J.339 E.06561
G2 X98.183 Y104.452 I1.431 J-.386 E.01835
G2 X99.041 Y104.703 I.792 J-1.118 E.03392
G2 X100.498 Y103.961 I.097 J-1.613 E.06387
G2 X100.679 Y103.381 I-1.69 J-.847 E.02271
G3 X100.833 Y102.605 I2.754 J.14 E.02959
G1 X100.858 Y102.579 E.00133
G3 X101.602 Y102.743 I.287 J.467 E.03137
G1 X101.682 Y102.849 E.00495
G3 X102.164 Y104.931 I-4.202 J2.07 E.08031
G3 X102.205 Y106.412 I-147.536 J4.767 E.05519
G3 X101.864 Y107.487 I-1.705 J.051 E.04279
G3 X101.22 Y107.972 I-2.23 J-2.287 E.0301
G3 X100.75 Y107.539 I.094 J-.574 E.02521
G2 X100.54 Y106.82 I-11.397 J2.93 E.02791
G2 X100.243 Y106.435 I-1.3 J.696 E.0182
G2 X99.207 Y106.214 I-.864 J1.519 E.0401
G2 X98.327 Y106.392 I.008 J2.304 E.03365
G2 X98.148 Y106.549 I.494 J.745 E.00887
; WIPE_START
G1 X98.044 Y106.692 E-.06712
G1 X97.958 Y106.912 E-.08992
G1 X97.928 Y107.182 E-.10318
G1 X97.98 Y108.136 E-.36303
G1 X98.027 Y108.493 E-.13675
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.57 Y105.479 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.204874
G1 F3000
M204 S500
G1 X99.403 Y105.448 E.01099
; LINE_WIDTH: 0.222901
G1 X99.753 Y105.429 E.00515
M204 S6000
G1 X99.77 Y105.497 F42000
; LINE_WIDTH: 0.164216
G1 F3000
M204 S500
G1 X99.684 Y105.471 E.00089
; LINE_WIDTH: 0.18156
G1 X99.673 Y105.468 E.00013
; LINE_WIDTH: 0.215246
G1 X99.618 Y105.437 E.00089
G1 X99.637 Y105.411 E.00045
; LINE_WIDTH: 0.191319
G1 X99.643 Y105.404 E.0001
; LINE_WIDTH: 0.162332
G1 X99.69 Y105.369 E.00058
; LINE_WIDTH: 0.120664
G1 X99.832 Y105.313 E.00097
M204 S6000
G1 X99.77 Y105.497 F42000
; LINE_WIDTH: 0.122045
G1 F3000
M204 S500
G1 X99.947 Y105.554 E.0012
; WIPE_START
G1 X99.77 Y105.497 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.934 Y105.543 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.175448
G1 F3000
M204 S500
G1 X98.618 Y105.431 E.00362
; LINE_WIDTH: 0.156286
G1 X98.505 Y105.388 E.00112
; LINE_WIDTH: 0.120713
G1 X98.392 Y105.344 E.00077
; WIPE_START
G1 X98.505 Y105.388 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.107 Y104.331 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123278
G1 F3000
M204 S500
G2 X101.215 Y104.179 I-3.423 J-2.531 E.00122
; LINE_WIDTH: 0.175304
G1 X101.303 Y104.053 E.00166
; LINE_WIDTH: 0.184856
G2 X101.307 Y103.836 I-1.941 J-.145 E.00251
; WIPE_START
G1 X101.303 Y104.053 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.539 Y105.362 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54948
G1 F6300
M204 S500
G1 X100.939 Y104.762 E.03505
G3 X100.559 Y105.098 I-.835 J-.561 E.02118
G1 X101.563 Y106.103 E.05865
M204 S6000
G1 X101.147 Y106.446 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.121504
G1 F3000
M204 S500
G1 X101.246 Y106.593 E.00113
; LINE_WIDTH: 0.166963
G1 X101.299 Y106.677 E.00101
; LINE_WIDTH: 0.185869
G1 X101.432 Y106.897 E.00299
; WIPE_START
G1 X101.299 Y106.677 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.33 Y108.987 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.165018
G1 F3000
M204 S500
G3 X104.102 Y109.647 I-6.263 J-1.79 E.00696
; WIPE_START
G1 X104.33 Y108.987 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X104.074 Y110.656 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53277
G1 F6300
M204 S500
G1 X103.504 Y110.086 E.03217
G3 X103.125 Y110.4 I-1.929 J-1.942 E.01967
G1 X103.808 Y111.083 E.03855
; WIPE_START
G1 X103.125 Y110.4 E-.36698
G1 X103.504 Y110.086 E-.18696
G1 X103.887 Y110.47 E-.20606
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.643 Y110.81 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.34751
G1 F3000
M204 S500
G1 X102.075 Y110.863 E.01417
; LINE_WIDTH: 0.324362
G1 X101.906 Y110.871 E.00389
; LINE_WIDTH: 0.286879
G1 X101.734 Y110.879 E.00342
; LINE_WIDTH: 0.251876
G1 X101.572 Y110.888 E.00276
; LINE_WIDTH: 0.219365
G1 X101.409 Y110.897 E.00236
; LINE_WIDTH: 0.180639
G1 X101.156 Y110.908 E.00283
; LINE_WIDTH: 0.155139
G1 X101.117 Y110.91 E.00036
; LINE_WIDTH: 0.127875
G1 X100.694 Y110.925 E.00293
; WIPE_START
G1 X101.117 Y110.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.779 Y110.916 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.138641
G1 F3000
M204 S500
G3 X98.368 Y110.851 I.751 J-6.065 E.00325
M204 S6000
G1 X98.25 Y110.684 F42000
; LINE_WIDTH: 0.134714
G1 F3000
M204 S500
G2 X98.576 Y110.943 I3.798 J-4.443 E.00311
; WIPE_START
G1 X98.25 Y110.684 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.925 Y110.822 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.112073
G1 F3000
M204 S500
G1 X93.854 Y110.901 E.0006
; LINE_WIDTH: 0.138946
G1 X93.781 Y110.974 E.00081
; LINE_WIDTH: 0.184402
G1 X93.619 Y111.131 E.00261
; WIPE_START
G1 X93.781 Y110.974 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.542 Y103.345 Z.6 F42000
G1 X93.423 Y99.526 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109979
G1 F3000
M204 S500
G1 X93.327 Y99.451 E.00066
; LINE_WIDTH: 0.139361
G1 X93.149 Y99.339 E.00165
; WIPE_START
G1 X93.327 Y99.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.118 Y99.145 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51238
G1 F6300
M204 S500
G1 X97.759 Y99.787 E.03471
G1 X97.631 Y99.931 E.00737
G1 X97.515 Y100.206 E.01144
G1 X96.643 Y99.335 E.04715
M73 P70 R4
G1 X95.963 Y99.318 E.02604
G1 X97.33 Y100.685 E.07396
G2 X97.187 Y101.207 I2.022 J.832 E.02074
G1 X95.299 Y99.318 E.10217
G1 X94.638 Y99.322 E.02526
G1 X97.112 Y101.796 E.13382
G2 X97.103 Y102.45 I3.471 J.376 E.02509
G1 X94.025 Y99.373 E.16651
G1 X93.959 Y99.378 E.00256
G1 X94.003 Y99.412 E.00212
G1 X93.819 Y99.649 E.01148
G1 X94.044 Y99.834 E.01115
G3 X94.457 Y100.468 I-1.352 J1.332 E.02913
G1 X97.108 Y103.12 E.14345
G1 X97.114 Y103.789 E.02561
G1 X94.68 Y101.355 E.13167
G1 X94.733 Y102.072 E.02749
G1 X97.984 Y105.323 E.17587
G1 X97.879 Y105.596 E.01118
G1 X97.947 Y105.628 E.00287
G1 X97.887 Y105.648 E.00242
G1 X97.763 Y105.766 E.00653
G1 X94.778 Y102.781 E.16147
G1 X94.816 Y103.483 E.02689
G1 X97.43 Y106.097 E.14144
G2 X97.192 Y106.522 I1.428 J1.082 E.01871
G1 X94.839 Y104.17 E.12729
G1 X94.852 Y104.847 E.02592
G1 X97.088 Y107.083 E.12094
G1 X97.106 Y107.764 E.02609
G1 X94.862 Y105.521 E.12138
G1 X94.86 Y106.183 E.02532
G1 X97.174 Y108.496 E.12516
G2 X97.286 Y109.273 I10.376 J-1.108 E.03002
G1 X94.858 Y106.845 E.13136
G1 X94.856 Y107.507 E.02532
G1 X97.87 Y110.534 E.16343
G1 X97.659 Y110.789 E.01265
G1 X97.669 Y110.797 E.00051
G1 X97.484 Y110.799 E.00707
G1 X94.851 Y108.165 E.14246
G1 X94.813 Y108.791 E.02399
G1 X96.83 Y110.809 E.10914
G1 X96.198 Y110.841 E.0242
G1 X94.747 Y109.39 E.07851
G1 X94.707 Y109.743 E.01361
G1 X94.632 Y109.938 E.008
G1 X95.567 Y110.873 E.05055
G1 X94.935 Y110.905 E.0242
G1 X94.281 Y110.251 E.03538
; WIPE_START
G1 X94.935 Y110.905 E-.35139
G1 X95.567 Y110.873 E-.24042
G1 X95.254 Y110.56 E-.16818
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.238 Y103.19 Z.6 F42000
G1 X98.217 Y99.553 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117864
G1 F3000
M204 S500
G1 X98.329 Y99.462 E.00088
; LINE_WIDTH: 0.158308
G1 X98.405 Y99.402 E.00091
; LINE_WIDTH: 0.175001
G1 X98.55 Y99.377 E.00159
M204 S6000
G1 X99.48 Y99.661 F42000
; LINE_WIDTH: 0.112381
G1 F3000
M204 S500
G1 X99.586 Y99.43 E.00144
M204 S6000
G1 X99.536 Y99.477 F42000
; LINE_WIDTH: 0.155527
G1 F3000
M204 S500
G3 X99.491 Y99.666 I-.641 J-.052 E.00179
M204 S6000
G1 X99.536 Y99.477 F42000
; LINE_WIDTH: 0.146327
G1 F3000
M204 S500
G1 X99.53 Y99.387 E.00076
; LINE_WIDTH: 0.113842
G2 X99.519 Y99.266 I-.769 J.007 E.0007
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3000
G1 X99.53 Y99.387 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 941
M625
; layer num/total_layer_count: 2/3
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S170.85
; open powerlost recovery
M1003 S1
; OBJECT_ID: 1070
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.159 J.372 P1  F42000
G1 X116.858 Y153.374 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X116.858 Y153.749 E.01668
G1 X118.305 Y153.749 E.06439
G1 X118.305 Y156.504 E.12252
G1 X116.858 Y156.504 E.06439
G1 X116.858 Y158.915 E.10727
G2 X117.085 Y160.092 I2.609 J.107 E.05382
G2 X118.006 Y160.773 I1.276 J-.764 E.0523
G1 X118.419 Y160.895 E.01917
G2 X119.409 Y160.582 I-.244 J-2.488 E.04651
G2 X119.7 Y160.319 I-.922 J-1.314 E.01747
G1 X122.202 Y162.145 E.13781
G3 X120.713 Y163.305 I-3.801 J-3.347 E.08448
G3 X119.216 Y163.685 I-2.068 J-5.014 E.06893
G1 X118.643 Y163.759 E.02567
G3 X116.702 Y163.396 I.225 J-6.573 E.08816
G3 X115.524 Y162.627 I2.001 J-4.355 E.06283
G1 X115.1 Y162.266 E.02474
G3 X114.045 Y160.595 I6.22 J-5.096 E.08815
G3 X113.72 Y158.997 I5.48 J-1.945 E.07277
G1 X113.674 Y158.406 E.02636
G1 X113.674 Y149.932 E.37694
G1 X116.858 Y149.932 E.1416
G1 X116.858 Y153.314 E.15044
M204 S10000
G1 X117.233 Y153.374 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X118.68 Y153.374 E.05943
G1 X118.68 Y156.878 E.14388
G1 X117.233 Y156.878 E.05943
G1 X117.233 Y158.906 E.08323
G2 X117.415 Y159.913 I2.251 J.113 E.04239
G2 X118.123 Y160.416 I.949 J-.586 E.03664
G1 X118.439 Y160.51 E.01357
G2 X119.282 Y160.206 I-.136 J-1.695 E.03723
G2 X119.592 Y159.777 I-1.095 J-1.119 E.02184
G1 X122.766 Y162.093 E.16133
G3 X121.104 Y163.529 I-5.396 J-4.566 E.09056
G3 X119.269 Y164.056 I-2.4 J-4.9 E.07882
G1 X118.65 Y164.136 E.0256
G3 X116.732 Y163.809 I.288 J-7.486 E.08012
G3 X115.285 Y162.916 I1.866 J-4.643 E.07017
G1 X114.825 Y162.525 E.0248
G3 X113.776 Y160.918 I7.141 J-5.81 E.07891
G3 X113.347 Y159.031 I4.933 J-2.114 E.07993
G1 X113.3 Y158.421 E.02512
G1 X113.3 Y149.557 E.36392
G1 X117.233 Y149.557 E.16149
G1 X117.233 Y153.314 E.15426
; WIPE_START
M204 S6000
G1 X118.68 Y153.374 E-.55053
G1 X118.68 Y153.926 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1070
M625
; object ids of layer 2 start: 701,783,941,1070
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.88
G1 X0 Y131.21 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer2 end: 701,783,941,1070
M625
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
G1 X121.613 Y162.18 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.72 Y160.798 E.09625
G1 X119.424 Y161.007 E.01485
G1 X119.049 Y161.149 E.01649
G1 X118.442 Y161.273 E.02545
G1 X117.633 Y161.02 E.03479
G3 X116.727 Y160.2 I.606 J-1.581 E.05133
G1 X116.559 Y159.712 E.02118
G3 X116.483 Y158.329 I7.147 J-1.089 E.05698
G1 X116.483 Y156.309 E.08295
G1 X116.584 Y156.147 E.00785
G3 X117.93 Y156.129 I.845 J12.83 E.0553
G1 X117.93 Y154.124 E.08231
G1 X116.663 Y154.124 E.05205
G1 X116.537 Y154.073 E.00555
G1 X116.483 Y153.944 E.00576
G1 X116.483 Y150.307 E.14934
G1 X114.049 Y150.307 E.09991
G1 X114.049 Y158.388 E.3318
G1 X114.112 Y159.035 E.02669
G2 X114.751 Y161.135 I4.3 J-.161 E.09112
G1 X115.378 Y162.011 E.04424
G2 X116.851 Y163.05 I4.693 J-5.089 E.07422
G1 X117.501 Y163.24 E.02782
G2 X118.638 Y163.382 I1.846 J-10.208 E.04704
G2 X120.339 Y163.05 I-.945 J-9.389 E.07127
G1 X120.964 Y162.734 E.02875
G1 X121.568 Y162.219 E.03259
M204 S10000
G1 X121.036 Y162.204 F42000
G1 F7144.644
M204 S6000
G1 X119.72 Y161.244 E.06689
G1 X119.254 Y161.458 E.02105
G1 X118.52 Y161.625 E.03094
G1 X118.236 Y161.607 E.01166
G1 X117.399 Y161.32 E.03633
G1 X116.932 Y161.038 E.0224
G1 X116.576 Y160.662 E.02126
G1 X116.386 Y160.317 E.01617
G1 X116.219 Y159.829 E.02118
G3 X116.123 Y158.609 I8.303 J-1.266 E.05031
G1 X116.123 Y156.309 E.09444
G1 X116.287 Y155.921 E.01728
G1 X116.427 Y155.823 E.00703
G1 X116.663 Y155.769 E.00992
G1 X117.57 Y155.769 E.03727
G1 X117.57 Y154.484 E.05275
G1 X116.663 Y154.484 E.03727
G1 X116.427 Y154.43 E.00992
G1 X116.287 Y154.332 E.00703
G1 X116.131 Y154.037 E.01367
G1 X116.123 Y150.667 E.13839
G1 X114.409 Y150.667 E.07036
G1 X114.409 Y158.37 E.3163
G2 X114.526 Y159.53 I89.25 J-8.365 E.04783
G1 X114.707 Y160.249 E.03044
G1 X115.035 Y160.9 E.02997
G2 X115.712 Y161.822 I9.189 J-6.04 E.04698
G2 X117.078 Y162.741 I3.995 J-4.464 E.06783
G1 X117.58 Y162.888 E.02146
G2 X118.75 Y163.004 I1.216 J-6.319 E.04836
G2 X120.176 Y162.722 I-.927 J-8.426 E.05973
G1 X120.603 Y162.535 E.01914
G2 X120.991 Y162.243 I-.794 J-1.464 E.02
M204 S10000
G1 X120.438 Y162.213 F42000
G1 F7144.644
M204 S6000
G1 X119.696 Y161.671 E.03773
G3 X118.592 Y161.977 I-1.596 J-3.613 E.04719
G1 X118.208 Y161.973 E.01577
G1 X117.4 Y161.701 E.03501
G1 X117.09 Y161.568 E.01386
G1 X116.653 Y161.272 E.02167
G1 X116.283 Y160.872 E.02237
M73 P71 R4
G3 X115.797 Y159.333 I2.775 J-1.723 E.06694
G1 X115.763 Y158.609 E.02979
G1 X115.763 Y156.309 E.09444
G1 X116.036 Y155.663 E.0288
G1 X116.27 Y155.499 E.01172
; LINE_WIDTH: 0.437838
G1 F6807.224
G1 X116.373 Y155.452 E.00488
; LINE_WIDTH: 0.473518
G1 F6219.744
G1 X116.476 Y155.406 E.00534
; LINE_WIDTH: 0.523165
G1 F5552.921
G1 X116.58 Y155.359 E.00598
G1 X117.159 Y155.358 E.03062
G1 X117.159 Y154.895 E.02443
G1 X116.58 Y154.894 E.03062
; LINE_WIDTH: 0.509198
G1 F5725.61
G1 X116.476 Y154.847 E.0058
; LINE_WIDTH: 0.473518
G1 F6219.744
G1 X116.373 Y154.8 E.00534
; LINE_WIDTH: 0.420096
G1 F7142.7
G3 X116.036 Y154.59 I.391 J-1.001 E.01641
G1 X115.776 Y154.1 E.0228
G1 X115.763 Y153.944 E.00641
G1 X115.763 Y151.027 E.11981
G1 X114.769 Y151.027 E.04082
G1 X114.769 Y158.353 E.30089
G2 X114.938 Y159.772 I18.85 J-1.525 E.05872
G2 X115.365 Y160.756 I3.464 J-.92 E.04421
G1 X115.912 Y161.52 E.03859
G2 X117.179 Y162.396 I4.114 J-4.597 E.06344
G2 X118.259 Y162.621 I1.335 J-3.711 E.04544
G1 X118.704 Y162.647 E.01831
G2 X120.08 Y162.375 I-.881 J-8.07 E.05767
G1 X120.383 Y162.238 E.01367
; WIPE_START
G1 X120.08 Y162.375 E-.12649
G1 X119.326 Y162.555 E-.29447
G1 X118.704 Y162.647 E-.23898
G1 X118.441 Y162.631 E-.10006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.301 Y159.008 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.613419
G1 F4647.188
M204 S6000
G1 X115.379 Y159.688 E.04322
; LINE_WIDTH: 0.581849
G1 F4928.374
G1 X115.431 Y159.885 E.01211
; LINE_WIDTH: 0.551328
G1 F5234.567
G1 X115.483 Y160.082 E.01141
; LINE_WIDTH: 0.516208
G1 F5637.615
G1 X115.586 Y160.319 E.01346
; LINE_WIDTH: 0.476489
G1 F6175.381
G1 X115.688 Y160.557 E.01229
; LINE_WIDTH: 0.437834
G1 F6807.313
G1 X115.826 Y160.782 E.01137
; LINE_WIDTH: 0.393009
G1 F7723.86
G2 X116.599 Y161.652 I2.373 J-1.33 E.04456
G1 X117.143 Y161.982 E.02416
G1 X117.736 Y162.19 E.02386
; LINE_WIDTH: 0.389074
G1 F7816.248
G1 X118.013 Y162.248 E.01063
; LINE_WIDTH: 0.35396
G1 F8750.194
G2 X118.661 Y162.31 I.481 J-1.611 E.02194
; LINE_WIDTH: 0.396619
G1 F7641.008
G1 X119.266 Y162.203 E.02359
; LINE_WIDTH: 0.436909
G1 F6824.023
G1 X119.583 Y162.117 E.01413
; WIPE_START
G1 X119.266 Y162.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.729 Y155.439 Z.88 F42000
G1 X115.542 Y155.082 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.474508
G1 F6204.886
M204 S6000
G2 X115.534 Y155.171 I-.026 J.043 E.00958
M204 S10000
G1 X116.29 Y155.126 F42000
; LINE_WIDTH: 0.38556
G1 F7900.63
M204 S6000
G1 X116.113 Y155.078 E.00681
G1 X115.786 Y154.848 E.01484
G1 X115.438 Y154.159 E.02867
G1 X115.425 Y153.944 E.00799
G1 X115.425 Y151.365 E.09575
G1 X115.108 Y151.365 E.01177
G2 X115.129 Y155.126 I103.468 J1.289 E.13966
G2 X115.108 Y158.337 I88.293 J2.196 E.11921
; LINE_WIDTH: 0.370234
G1 F8291.053
G1 X115.129 Y158.623 E.01017
; LINE_WIDTH: 0.385639
G1 F7898.721
G1 X115.157 Y158.687 E.00261
; LINE_WIDTH: 0.430019
G1 F6951.122
G1 X115.186 Y158.752 E.00297
; LINE_WIDTH: 0.474398
G1 F6206.533
G1 X115.215 Y158.816 E.00332
; LINE_WIDTH: 0.518779
G1 F5606.027
G1 X115.244 Y158.88 E.00368
; LINE_WIDTH: 0.563159
G1 F5111.473
G1 X115.272 Y158.944 E.00403
; LINE_WIDTH: 0.607539
G1 F4697.102
G1 X115.301 Y159.008 E.00439
G1 X115.323 Y158.941 E.00437
; LINE_WIDTH: 0.563159
G1 F5111.473
G1 X115.344 Y158.875 E.00402
; LINE_WIDTH: 0.518779
G1 F5606.027
G1 X115.366 Y158.808 E.00366
; LINE_WIDTH: 0.474398
G1 F6206.533
G1 X115.388 Y158.742 E.00331
; LINE_WIDTH: 0.430019
G1 F6951.122
G1 X115.41 Y158.675 E.00296
; LINE_WIDTH: 0.376472
G1 F8127.568
G1 X115.431 Y158.609 E.00253
G3 X115.425 Y156.309 I47.379 J-1.29 E.08302
; LINE_WIDTH: 0.406016
G1 F7433.422
G1 X115.786 Y155.404 E.03843
G1 X116.113 Y155.175 E.01577
G1 X116.232 Y155.142 E.00487
; WIPE_START
G1 X116.113 Y155.175 E-.06261
G1 X115.786 Y155.404 E-.20291
G1 X115.425 Y156.309 E-.49448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.04 Y155.8 Z.88 F42000
G1 X126.662 Y155.559 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X126.655 Y155.527 E.00143
G3 X126.81 Y153.561 I2.057 J-.827 E.09093
G3 X128.489 Y152.515 I1.833 J1.072 E.09153
G3 X129.128 Y152.568 I.123 J2.418 E.02862
G3 X130.738 Y155.01 I-.551 J2.115 E.14253
G3 X128.625 Y156.894 I-2.139 J-.273 E.13736
G3 X127.957 Y156.785 I.209 J-3.371 E.03017
G3 X126.807 Y155.835 I.755 J-2.084 E.06768
G1 X126.69 Y155.612 E.01119
M204 S10000
G1 X127.005 Y155.389 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X126.898 Y154.431 I1.68 J-.673 E.04008
G3 X128.53 Y152.888 I1.743 J.209 E.10009
G3 X129.049 Y152.935 I.07 J2.123 E.02145
G3 X130.366 Y154.964 I-.473 J1.748 E.10872
G3 X128.204 Y156.461 I-1.738 J-.2 E.12217
G3 X127.028 Y155.445 I.481 J-1.745 E.06597
; WIPE_START
M204 S6000
G1 X126.922 Y155.127 E-.12714
G1 X126.871 Y154.697 E-.1647
G1 X126.898 Y154.431 E-.10156
G1 X126.957 Y154.128 E-.11731
G1 X127.054 Y153.886 E-.09922
G1 X127.219 Y153.628 E-.11614
G1 X127.274 Y153.558 E-.03392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.994 Y152.724 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X124.072 Y152.567 E.0078
G3 X124.74 Y151.585 I4.411 J2.283 E.05298
G1 X125.072 Y151.186 E.02309
G3 X126.631 Y150.113 I5.063 J5.688 E.08442
G3 X128.569 Y149.726 I2.181 J5.892 E.08826
G3 X128.745 Y149.73 I.078 J.472 E.00784
G3 X130.644 Y150.113 I-.236 J6.075 E.08654
G3 X132.195 Y151.18 I-3.517 J6.774 E.08398
G3 X133.274 Y152.723 I-5.509 J5.003 E.08397
G1 X133.299 Y152.78 E.00278
G3 X133.616 Y154.191 I-4.628 J1.78 E.06456
G1 X133.667 Y154.708 E.02311
G3 X133.311 Y156.597 I-6.498 J-.247 E.08581
G3 X132.53 Y157.827 I-4.56 J-2.033 E.06504
G3 X131.83 Y158.532 I-2.171 J-1.456 E.04448
G3 X130.39 Y159.398 I-3.08 J-3.489 E.07515
G3 X128.729 Y159.675 I-2.156 J-7.82 E.07503
G3 X126.809 Y159.352 I.35 J-7.96 E.08683
G1 X126.748 Y159.329 E.00288
G3 X125.481 Y158.561 I2.021 J-4.767 E.06617
G1 X125.068 Y158.237 E.02333
G3 X124.061 Y156.859 I5.869 J-5.346 E.07607
G3 X123.646 Y155.241 I4.195 J-1.936 E.0747
G1 X123.595 Y154.709 E.02375
G3 X123.934 Y152.86 I7.421 J.405 E.08384
G1 X123.958 Y152.803 E.00275
G1 X123.969 Y152.779 E.0012
M204 S10000
G1 X123.66 Y152.569 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X124.449 Y151.349 I4.581 J2.099 E.05986
G1 X124.807 Y150.918 E.02301
G3 X126.305 Y149.852 I5.815 J6.59 E.07561
G3 X128.082 Y149.398 I2.15 J4.705 E.07572
G3 X128.781 Y149.357 I.528 J3.042 E.0288
G3 X130.796 Y149.77 I-.269 J6.434 E.08482
G3 X132.03 Y150.563 I-2.825 J5.755 E.06037
G1 X132.46 Y150.912 E.02277
G3 X133.533 Y152.395 I-6.387 J5.75 E.07526
G3 X133.988 Y154.15 I-4.238 J2.037 E.07492
G1 X134.044 Y154.708 E.02305
G3 X133.749 Y156.492 I-8.655 J-.514 E.07436
G3 X132.823 Y158.061 I-4.767 J-1.756 E.07523
G1 X132.481 Y158.478 E.02215
G3 X131.018 Y159.54 I-5.761 J-6.398 E.07434
G3 X129.271 Y159.997 I-2.113 J-4.513 E.07454
G1 X128.731 Y160.051 E.02228
G3 X126.871 Y159.768 I.442 J-9.162 E.07742
G3 X125.253 Y158.858 I1.553 J-4.657 E.07668
G1 X124.806 Y158.508 E.02334
G3 X123.726 Y157.028 I6.214 J-5.667 E.07533
G3 X123.274 Y155.282 I4.546 J-2.11 E.07449
G1 X123.218 Y154.709 E.02365
G3 X123.519 Y152.907 I8.567 J.505 E.07515
G3 X123.635 Y152.623 I4.721 J1.761 E.01258
; WIPE_START
M204 S6000
G1 X123.834 Y152.214 E-.17306
G1 X124.091 Y151.818 E-.17937
G1 X124.449 Y151.349 E-.22414
G1 X124.757 Y150.978 E-.18343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.078 Y155.256 Z.88 F42000
G1 X131.079 Y155.257 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X130.769 Y156.045 I-2.09 J-.368 E.035
G1 X130.437 Y156.495 E.02299
G1 X129.976 Y156.868 E.02433
G1 X129.586 Y157.081 E.01824
G1 X129.197 Y157.198 E.0167
G1 X128.647 Y157.269 E.02277
G1 X128.06 Y157.198 E.02425
G1 X127.637 Y157.066 E.01821
G1 X127.283 Y156.867 E.01666
G1 X126.854 Y156.524 E.02255
G1 X126.493 Y156.046 E.0246
G3 X126.119 Y154.717 I2.422 J-1.4 E.05729
G1 X126.185 Y154.134 E.02408
G3 X126.5 Y153.349 I2.08 J.378 E.03494
G1 X126.831 Y152.905 E.02276
G1 X127.28 Y152.537 E.02382
G1 X127.666 Y152.321 E.01819
G1 X128.054 Y152.201 E.01665
G1 X128.604 Y152.127 E.02282
G1 X129.022 Y152.17 E.01724
G1 X129.579 Y152.316 E.02365
G1 X129.973 Y152.532 E.01842
G1 X130.402 Y152.876 E.02257
G1 X130.762 Y153.348 E.0244
G3 X131.143 Y154.674 I-2.401 J1.408 E.05724
G1 X131.086 Y155.197 E.02161
M204 S10000
G1 X131.437 Y155.299 F42000
G1 F7144.644
M204 S6000
G1 X131.302 Y155.792 E.02098
G3 X130.73 Y156.705 I-3.209 J-1.377 E.04443
G1 X130.2 Y157.15 E.02841
G1 X129.692 Y157.425 E.02373
G3 X128.69 Y157.627 I-1.157 J-3.162 E.0421
G1 X128.013 Y157.554 E.02796
G1 X127.517 Y157.407 E.02127
G1 X127.071 Y157.158 E.02094
G1 X126.629 Y156.806 E.02321
G1 X126.204 Y156.26 E.02842
G1 X125.965 Y155.805 E.02108
G3 X125.761 Y154.759 I3.314 J-1.187 E.04392
G1 X125.828 Y154.09 E.0276
G1 X125.962 Y153.606 E.02062
G3 X126.952 Y152.339 I2.827 J1.188 E.0668
G1 X127.437 Y152.032 E.02357
G1 X127.915 Y151.865 E.02078
G1 X128.556 Y151.77 E.02662
G1 X129.091 Y151.816 E.02205
G1 X129.671 Y151.968 E.0246
G1 X130.123 Y152.2 E.02086
G1 X130.627 Y152.595 E.02629
G1 X131.05 Y153.133 E.02812
G1 X131.296 Y153.597 E.02157
G3 X131.443 Y155.239 I-2.947 J1.091 E.0685
M204 S10000
G1 X131.876 Y155.351 F42000
; LINE_WIDTH: 0.566144
G1 F5081.32
M204 S6000
G1 X131.743 Y155.869 E.03091
G1 X131.494 Y156.384 E.03302
G1 X131.076 Y156.961 E.0411
G1 X130.466 Y157.485 E.04644
G1 X130 Y157.757 E.03113
G1 X129.455 Y157.938 E.03318
; LINE_WIDTH: 0.542978
G1 F5325.09
G1 X128.748 Y158.038 E.03937
G1 X127.959 Y157.965 E.04363
G1 X127.441 Y157.824 E.02954
G1 X126.93 Y157.567 E.03154
G1 X126.363 Y157.139 E.03913
G1 X126.185 Y156.96 E.01391
G1 X125.852 Y156.519 E.03044
; LINE_WIDTH: 0.574289
G1 F5000.831
G1 X125.59 Y156.052 E.03144
G1 X125.415 Y155.506 E.03362
G1 X125.322 Y154.811 E.04113
G1 X125.39 Y154.036 E.04563
G1 X125.525 Y153.519 E.03139
G1 X125.778 Y153.006 E.03353
G3 X126.196 Y152.438 I4.501 J2.872 E.04137
G1 X126.685 Y152.009 E.0382
G1 X127.229 Y151.662 E.03781
; LINE_WIDTH: 0.54391
G1 F5314.834
G1 X127.79 Y151.469 E.03275
G3 X128.734 Y151.357 I1.012 J4.491 E.05261
G3 X129.779 Y151.559 I-.325 J4.485 E.05884
G1 X130.329 Y151.828 E.03385
G1 X130.893 Y152.262 E.03927
G1 X131.066 Y152.436 E.01353
G1 X131.398 Y152.873 E.0303
; LINE_WIDTH: 0.582126
G1 F4925.755
G1 X131.663 Y153.338 E.03186
G1 X131.841 Y153.881 E.03403
G1 X131.939 Y154.576 E.04179
G1 X131.881 Y155.291 E.04273
M204 S10000
G1 X132.382 Y155.525 F42000
; LINE_WIDTH: 0.571153
G1 F5031.51
M204 S6000
G2 X132.475 Y154.74 I-25.395 J-3.426 E.04611
G1 X132.393 Y153.972 E.04501
G1 X132.243 Y153.373 E.03599
G1 X132.121 Y153.088 E.0181
G2 X130.393 Y151.294 I-3.895 J2.023 E.14727
G1 X129.891 Y151.085 E.03167
; LINE_WIDTH: 0.541698
G1 F5339.241
G2 X128.785 Y150.891 I-1.531 J5.492 E.06179
G2 X126.976 Y151.242 I-.076 J4.448 E.102
G2 X125.803 Y152.136 I2.823 J4.925 E.08126
G1 X125.464 Y152.568 E.03015
; LINE_WIDTH: 0.574193
G1 F5001.765
G1 X125.145 Y153.091 E.03594
G1 X125.02 Y153.375 E.01823
G1 X124.883 Y153.874 E.03036
G2 X125.125 Y156.304 I4.233 J.806 E.1452
G2 X127.029 Y158.17 I3.717 J-1.89 E.15914
; LINE_WIDTH: 0.544132
G1 F5312.387
G2 X128.445 Y158.491 I1.642 J-3.948 E.08057
G1 X128.807 Y158.506 E.01998
G2 X130.244 Y158.19 I-.493 J-5.662 E.08152
G1 X130.7 Y157.927 E.02905
G2 X131.815 Y156.826 I-2.363 J-3.507 E.08704
; LINE_WIDTH: 0.581885
G1 F4928.033
G1 X132.131 Y156.297 E.03665
G2 X132.366 Y155.583 I-2.502 J-1.221 E.04491
M204 S10000
G1 X132.816 Y155.63 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X132.917 Y154.793 E.03462
G1 X132.832 Y153.919 E.03604
G1 X132.67 Y153.254 E.02812
G1 X132.573 Y152.989 E.01157
G1 X132.265 Y152.451 E.02544
G1 X131.674 Y151.706 E.03907
G1 X130.916 Y151.115 E.03947
G1 X130.392 Y150.825 E.02459
G1 X129.979 Y150.67 E.01809
G2 X128.635 Y150.459 I-1.696 J6.395 E.05598
G2 X127.314 Y150.655 I2.025 J18.191 E.05484
G1 X126.806 Y150.846 E.02229
G2 X125.595 Y151.708 I3.528 J6.237 E.06111
G1 X125.004 Y152.452 E.03904
G1 X124.64 Y153.088 E.03008
G1 X124.45 Y153.768 E.02898
G1 X124.335 Y154.711 E.039
G1 X124.447 Y155.659 E.03921
G1 X124.639 Y156.351 E.02948
G1 X124.989 Y156.961 E.02888
G1 X125.584 Y157.705 E.03911
G1 X126.35 Y158.281 E.03937
G1 X127.018 Y158.641 E.03114
G1 X127.742 Y158.828 E.0307
G1 X128.724 Y158.935 E.04056
G1 X129.648 Y158.822 E.03824
G1 X130.345 Y158.625 E.02973
G1 X130.957 Y158.273 E.029
G1 X131.689 Y157.691 E.03836
G1 X132.265 Y156.957 E.03832
G1 X132.627 Y156.315 E.03028
G1 X132.8 Y155.688 E.0267
M204 S10000
G1 X133.17 Y155.7 F42000
G1 F7144.644
M204 S6000
G1 X133.274 Y154.836 E.03572
G2 X133.168 Y153.7 I-7.825 J.157 E.0469
G1 X132.951 Y152.926 E.033
G1 X132.564 Y152.249 E.03201
G1 X131.929 Y151.448 E.04196
G1 X131.123 Y150.821 E.04195
G1 X130.538 Y150.496 E.02747
G1 X130.054 Y150.318 E.02117
G2 X128.636 Y150.097 I-1.78 J6.742 E.05902
G2 X127.219 Y150.306 I.842 J10.626 E.05887
G1 X126.643 Y150.523 E.02526
G2 X125.339 Y151.452 I3.805 J6.722 E.06587
G1 X124.705 Y152.25 E.04184
G1 X124.305 Y152.948 E.03305
G1 X124.096 Y153.697 E.03193
G1 X123.973 Y154.71 E.04189
G1 X124.093 Y155.729 E.04212
G1 X124.305 Y156.491 E.03246
G1 X124.69 Y157.164 E.03188
G1 X125.331 Y157.966 E.04213
G1 X126.156 Y158.585 E.04235
G1 X126.886 Y158.978 E.03404
G1 X127.677 Y159.183 E.03356
G1 X128.726 Y159.297 E.04334
G1 X129.72 Y159.176 E.04108
G1 X130.486 Y158.96 E.03271
G1 X131.16 Y158.571 E.03194
G1 X131.946 Y157.947 E.0412
G1 X132.565 Y157.158 E.04117
G1 X132.963 Y156.453 E.03323
G1 X133.154 Y155.758 E.02963
; WIPE_START
G1 X132.963 Y156.453 E-.27418
G1 X132.565 Y157.158 E-.30754
G1 X132.275 Y157.527 E-.17828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.872 Y156.789 Z.88 F42000
G1 X141.207 Y156.659 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X141.207 Y159.637 E.1325
G3 X139.07 Y159.444 I-.582 J-5.482 E.09607
G3 X137.961 Y158.767 I1.234 J-3.27 E.05816
G1 X137.628 Y158.486 E.01937
G3 X136.77 Y157.005 I4.559 J-3.63 E.07644
G3 X136.512 Y155.173 I7.209 J-1.947 E.08248
G1 X136.512 Y149.932 E.23312
G1 X139.353 Y149.932 E.12634
G1 X139.353 Y154.426 E.19988
G2 X139.545 Y155.711 I3.327 J.157 E.05817
G2 X140.565 Y156.549 I1.478 J-.758 E.06037
G1 X140.969 Y156.689 E.01901
G1 X141.148 Y156.666 E.00803
M204 S10000
G1 X141.582 Y156.188 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X141.582 Y159.963 E.15498
G3 X138.947 Y159.798 I-.963 J-5.78 E.10936
G3 X137.723 Y159.057 I1.358 J-3.623 E.05908
G1 X137.349 Y158.741 E.02012
G3 X136.415 Y157.125 I4.91 J-3.916 E.07694
G3 X136.167 Y155.675 I5.974 J-1.766 E.06054
G1 X136.137 Y155.184 E.02019
G1 X136.137 Y149.557 E.23104
G1 X139.727 Y149.557 E.1474
G1 X139.727 Y154.421 E.19972
G2 X139.886 Y155.553 I2.999 J.156 E.04722
G2 X140.696 Y156.198 I1.148 J-.612 E.04369
G1 X141.009 Y156.306 E.01359
G2 X141.526 Y156.209 I-.055 J-1.723 E.0217
; WIPE_START
M204 S6000
G1 X141.556 Y158.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.939 Y154.779 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.377688
G1 F8096.438
M204 S6000
G1 X137.97 Y155.203 E.01543
; LINE_WIDTH: 0.405529
G1 F7443.923
G1 X138.001 Y155.628 E.01678
; LINE_WIDTH: 0.442208
G1 F6729.375
G1 X138.066 Y155.919 E.01301
; LINE_WIDTH: 0.487729
G1 F6013.069
G1 X138.131 Y156.211 E.01456
; LINE_WIDTH: 0.527255
G1 F5504.306
G1 X138.188 Y156.358 E.00846
; LINE_WIDTH: 0.560789
G1 F5135.667
G1 X138.246 Y156.506 E.00906
; LINE_WIDTH: 0.604857
G1 F4720.226
G2 X138.399 Y156.816 I.996 J-.301 E.02153
M204 S10000
G1 X139.759 Y157.779 F42000
; LINE_WIDTH: 0.40164
G1 F7528.672
M204 S6000
G1 X139.235 Y157.482 E.02345
G1 X138.909 Y157.227 E.01614
G1 X138.777 Y157.08 E.00768
; LINE_WIDTH: 0.398182
G1 F7605.662
G1 X138.708 Y157.038 E.00315
; LINE_WIDTH: 0.44669
G1 F6651.359
G1 X138.638 Y156.995 E.0036
; LINE_WIDTH: 0.495199
G1 F5909.836
G1 X138.569 Y156.952 E.00405
; LINE_WIDTH: 0.543706
G1 F5317.066
G1 X138.499 Y156.91 E.0045
; LINE_WIDTH: 0.592215
G1 F4832.368
G1 X138.429 Y156.867 E.00496
G1 X138.451 Y156.949 E.00516
; LINE_WIDTH: 0.543706
G1 F5317.066
G1 X138.472 Y157.032 E.00469
; LINE_WIDTH: 0.495199
G1 F5909.836
G1 X138.493 Y157.114 E.00422
; LINE_WIDTH: 0.44669
G1 F6651.359
G1 X138.514 Y157.196 E.00375
; LINE_WIDTH: 0.40349
G1 F7488.118
G1 X138.536 Y157.278 E.00333
G1 X138.796 Y157.58 E.0156
G1 X139.344 Y157.969 E.02635
G1 X139.759 Y158.119 E.01727
G1 X139.759 Y157.839 E.01096
M204 S10000
G1 X140.113 Y157.543 F42000
; LINE_WIDTH: 0.419997
G1 F7144.673
M204 S6000
G3 X139.229 Y157.054 I1.813 J-4.319 E.04155
G1 X138.854 Y156.671 E.02198
G1 X138.58 Y156.228 E.02139
G1 X138.393 Y155.72 E.02222
G3 X138.27 Y154.765 I3.769 J-.97 E.03963
; LINE_WIDTH: 0.444235
G1 F6693.872
G1 X138.242 Y154.636 E.00579
; LINE_WIDTH: 0.492709
G1 F5943.851
G1 X138.214 Y154.508 E.00652
; LINE_WIDTH: 0.564974
G1 F5093.096
G1 X138.185 Y154.379 E.00761
G1 X138.185 Y151.1 E.18887
G1 X137.68 Y151.1 E.02911
G1 X137.68 Y154.379 E.18887
; LINE_WIDTH: 0.541182
G1 F5344.969
G1 X137.656 Y154.512 E.00744
; LINE_WIDTH: 0.492709
G1 F5943.851
G1 X137.631 Y154.645 E.00669
; LINE_WIDTH: 0.420537
G1 F7133.972
G1 X137.607 Y154.779 E.00557
G1 X137.643 Y155.652 E.03597
G2 X137.808 Y156.628 I6.848 J-.655 E.04074
G2 X138.369 Y157.631 I4.531 J-1.878 E.04737
G1 X138.575 Y157.848 E.01229
G1 X139.145 Y158.268 E.02913
G1 X139.569 Y158.442 E.01886
G1 X140.113 Y158.534 E.02266
G1 X140.113 Y157.603 E.03828
M204 S10000
G1 X140.473 Y157.29 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X139.458 Y156.776 I1.317 J-3.855 E.04687
G1 X139.105 Y156.407 E.02096
G1 X138.856 Y155.966 E.0208
G1 X138.712 Y155.516 E.01938
G3 X138.618 Y154.379 I7.615 J-1.205 E.04691
G1 X138.618 Y150.667 E.1524
G1 X137.247 Y150.667 E.05628
G1 X137.247 Y155.148 E.18398
G2 X137.43 Y156.646 I7.335 J-.136 E.06209
G2 X138.175 Y157.985 I5.848 J-2.377 E.06307
G2 X139.107 Y158.653 I2.951 J-3.135 E.04719
G1 X139.501 Y158.796 E.01724
G1 X140.473 Y158.928 E.04025
G1 X140.473 Y157.35 E.06479
M204 S10000
G1 X140.833 Y157.038 F42000
; LINE_WIDTH: 0.419998
G1 F7144.653
M204 S6000
G1 X140.238 Y156.822 E.02596
G1 X139.782 Y156.556 E.02169
G1 X139.412 Y156.216 E.02062
G3 X139.068 Y155.46 I1.584 J-1.178 E.03437
G3 X138.978 Y154.379 I7.238 J-1.148 E.0446
G1 X138.978 Y150.307 E.16717
G1 X136.887 Y150.307 E.08583
G1 X136.887 Y155.16 E.19926
G2 X137.081 Y156.74 I7.736 J-.148 E.06549
G2 X137.907 Y158.231 I5.33 J-1.979 E.07022
G2 X138.853 Y158.938 I3.945 J-4.287 E.04858
G1 X139.321 Y159.128 E.02072
G2 X140.586 Y159.3 I1.511 J-6.352 E.05253
G1 X140.833 Y159.285 E.01014
G1 X140.833 Y157.098 E.08979
; WIPE_START
G1 X140.833 Y159.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.475 Y154.963 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X144.434 Y154.269 E.05565
G3 X143.702 Y153.515 I1.757 J-2.438 E.04699
G3 X143.417 Y152.188 I2.359 J-1.201 E.06103
G1 X143.417 Y149.932 E.10035
G1 X146.257 Y149.932 E.12634
G1 X146.257 Y152.747 E.12522
G2 X146.47 Y153.668 I2.092 J.001 E.0424
G2 X147.262 Y154.199 I1.063 J-.73 E.04343
G1 X147.608 Y154.286 E.01588
G2 X148.473 Y153.919 I-.484 J-2.341 E.04204
G2 X148.94 Y152.831 I-.932 J-1.044 E.05438
G1 X148.95 Y149.932 E.12897
G1 X151.79 Y149.932 E.12634
G1 X151.79 Y152.34 E.10711
G3 X151.557 Y153.635 I-2.953 J.137 E.059
G3 X150.981 Y154.311 I-1.961 J-1.087 E.03977
G1 X150.084 Y154.978 E.04973
G1 X150.991 Y155.648 E.05014
G3 X151.765 Y157.158 I-1.318 J1.629 E.07772
G3 X151.79 Y157.697 I-8.184 J.64 E.02403
G1 X151.79 Y159.452 E.07805
G1 X148.95 Y159.452 E.12634
G1 X148.95 Y157.311 E.09525
G2 X148.732 Y156.387 I-1.926 J-.033 E.04265
G2 X147.948 Y155.864 I-1.058 J.736 E.04293
G1 X147.635 Y155.786 E.01432
G2 X146.596 Y156.282 I.03 J1.401 E.05279
G2 X146.257 Y157.315 I1.355 J1.016 E.04924
G1 X146.257 Y159.452 E.09506
G1 X143.417 Y159.452 E.12634
G1 X143.417 Y157.85 E.07126
G3 X143.704 Y156.488 I2.828 J-.116 E.06257
G3 X144.457 Y155.68 I2.626 J1.693 E.0494
G1 X145.426 Y154.998 E.05267
M204 S10000
G1 X144.812 Y154.972 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X143.816 Y154.246 I3.209 J-5.449 E.05069
G3 X143.375 Y153.702 I3.633 J-3.399 E.02875
G3 X143.042 Y152.195 I2.709 J-1.388 E.06407
G1 X143.042 Y149.557 E.10832
G1 X146.632 Y149.557 E.1474
G1 X146.632 Y152.733 E.13039
G2 X146.851 Y153.556 I1.436 J.059 E.03548
G2 X147.598 Y153.897 I.914 J-1.011 E.03429
G2 X148.339 Y153.532 I-.312 J-1.568 E.03428
G2 X148.566 Y152.805 I-.982 J-.705 E.03182
G1 X148.575 Y149.557 E.13336
G1 X152.165 Y149.557 E.1474
G1 X152.165 Y152.346 E.11451
G3 X151.896 Y153.801 I-3.355 J.131 E.06124
G3 X151.212 Y154.606 I-2.357 J-1.307 E.04366
G1 X150.714 Y154.977 E.0255
G3 X151.548 Y155.653 I-2.622 J4.085 E.04418
G3 X151.89 Y156.156 I-2.886 J2.329 E.02497
G3 X152.165 Y157.692 I-3.356 J1.394 E.06458
G1 X152.165 Y159.827 E.08766
G1 X148.575 Y159.827 E.1474
G1 X148.575 Y157.326 E.10268
G2 X148.351 Y156.501 I-1.419 J-.058 E.03566
G2 X147.615 Y156.167 I-.902 J1.01 E.03371
G2 X146.69 Y156.908 I.027 J.981 E.05223
G2 X146.632 Y157.328 I1.759 J.456 E.01745
G1 X146.632 Y159.827 E.10261
G1 X143.042 Y159.827 E.1474
G1 X143.042 Y157.843 E.08146
G3 X143.375 Y156.302 I3.239 J-.106 E.06538
G3 X144.235 Y155.378 I3.023 J1.949 E.0521
G1 X144.763 Y155.006 E.02651
; WIPE_START
M204 S6000
G1 X144.217 Y154.574 E-.2644
G1 X143.816 Y154.246 E-.19721
G1 X143.655 Y154.068 E-.09104
G1 X143.375 Y153.702 E-.175
G1 X143.341 Y153.624 E-.03235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.848 Y156.886 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.549368
G1 F5255.542
M204 S6000
G2 X144.626 Y157.343 I.813 J.677 E.02864
G2 X144.585 Y158.285 I6.71 J.765 E.05266
G1 X145.09 Y158.285 E.02821
G3 X145.147 Y156.821 I11.317 J-.295 E.08182
G1 X145.203 Y156.566 E.01456
G1 X144.892 Y156.846 E.02333
M204 S10000
G1 X144.512 Y156.635 F42000
; LINE_WIDTH: 0.418997
G1 F7164.587
M204 S6000
G1 X144.324 Y156.928 E.01426
G1 X144.208 Y157.302 E.01605
G2 X144.152 Y158.717 I7.231 J.997 E.05807
G1 X145.523 Y158.717 E.05612
G1 X145.523 Y157.305 E.05781
G1 X145.581 Y156.769 E.02209
G1 X145.699 Y156.402 E.01579
G1 X145.979 Y155.905 E.02333
; LINE_WIDTH: 0.375299
G1 F8157.827
G1 X146.357 Y155.551 E.01862
; LINE_WIDTH: 0.372326
G1 F8235.489
G1 X146.461 Y155.465 E.00483
; LINE_WIDTH: 0.410521
G1 F7337.871
G1 X146.564 Y155.378 E.00542
; LINE_WIDTH: 0.448716
G1 F6616.692
G1 X146.668 Y155.291 E.00601
; LINE_WIDTH: 0.507267
G1 F5750.346
G1 X146.772 Y155.204 E.00691
G3 X147.404 Y155.037 I.723 J1.456 E.03356
G1 X146.87 Y154.891 E.02823
G1 X146.298 Y154.612 E.03247
G1 X146.368 Y154.755 E.00811
G1 X146.4 Y155.01 E.01313
; LINE_WIDTH: 0.486911
G1 F6024.586
G1 X146.34 Y155.091 E.00491
; LINE_WIDTH: 0.448716
G1 F6616.692
G1 X146.28 Y155.172 E.00447
; LINE_WIDTH: 0.410521
G1 F7337.871
G1 X146.22 Y155.253 E.00403
; LINE_WIDTH: 0.374843
G1 F8169.64
G1 X146.16 Y155.334 E.00362
G1 X145.72 Y155.676 E.02
; LINE_WIDTH: 0.415655
G1 F7231.914
G1 X145.26 Y156.013 E.02311
G2 X144.556 Y156.593 I1.959 J3.097 E.03713
M204 S10000
G1 X144.278 Y156.347 F42000
; LINE_WIDTH: 0.419998
G1 F7144.649
M204 S6000
G1 X144.037 Y156.669 E.01655
G1 X143.863 Y157.135 E.02042
G1 X143.792 Y157.864 E.03005
G1 X143.792 Y159.077 E.04982
G1 X145.883 Y159.077 E.08583
G1 X145.883 Y157.305 E.07275
G1 X145.944 Y156.811 E.02045
G1 X146.015 Y156.572 E.01024
G1 X146.286 Y156.071 E.02339
G1 X146.659 Y155.718 E.02108
G1 X147.102 Y155.499 E.02029
G1 X147.613 Y155.409 E.02134
G1 X148.22 Y155.555 E.02562
G1 X148.626 Y155.752 E.01852
G1 X148.929 Y156.02 E.0166
G1 X149.067 Y156.218 E.00991
G1 X149.225 Y156.596 E.01683
G1 X149.323 Y157.277 E.02825
G3 X149.325 Y159.077 I-375.258 J1.277 E.0739
G1 X151.415 Y159.077 E.08583
G2 X151.392 Y157.2 I-21.734 J-.674 E.07709
G1 X151.25 Y156.604 E.02519
G1 X151.039 Y156.22 E.01798
G1 X150.788 Y155.972 E.01449
G1 X149.651 Y155.122 E.05828
G1 X149.579 Y154.986 E.00634
G1 X149.625 Y154.857 E.0056
G3 X150.746 Y154.018 I99.823 J132.218 E.05749
G2 X151.218 Y153.465 I-1.61 J-1.851 E.02997
G1 X151.378 Y152.926 E.0231
G1 X151.405 Y152.587 E.01394
G1 X151.414 Y150.307 E.09362
M73 P72 R4
G1 X149.325 Y150.307 E.08577
G1 X149.325 Y152.593 E.09386
G1 X149.286 Y153.136 E.02236
G3 X149.021 Y153.869 I-1.765 J-.224 E.03225
G1 X148.687 Y154.227 E.02012
G1 X148.311 Y154.435 E.01766
G1 X147.669 Y154.66 E.02794
G1 X147.564 Y154.663 E.00429
G1 X146.976 Y154.503 E.02502
G1 X146.548 Y154.283 E.01976
G1 X146.257 Y154.016 E.01622
G1 X146.044 Y153.653 E.01729
G1 X145.933 Y153.259 E.01678
G1 X145.883 Y152.757 E.02071
G1 X145.883 Y150.307 E.10061
G1 X143.794 Y150.307 E.08577
G1 X143.802 Y152.428 E.0871
G1 X143.893 Y152.954 E.02192
G1 X144.031 Y153.327 E.01633
G1 X144.288 Y153.635 E.01644
G1 X144.706 Y153.999 E.02276
G1 X145.919 Y154.81 E.05992
G1 X145.988 Y154.896 E.00455
G1 X145.986 Y155.027 E.00537
G1 X145.682 Y155.276 E.01613
G1 X144.687 Y155.977 E.04998
G1 X144.323 Y156.306 E.02015
; WIPE_START
G1 X144.687 Y155.977 E-.18652
G1 X145.682 Y155.276 E-.46257
G1 X145.908 Y155.091 E-.11091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.157 Y153.359 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556764
G1 F5177.286
M204 S6000
G3 X145.091 Y151.349 I13.681 J-1.455 E.11403
G1 X145.091 Y151.098 E.01424
G1 X144.588 Y151.098 E.02853
G3 X144.592 Y152.366 I-640.551 J2.665 E.07182
G1 X144.628 Y152.683 E.01807
G1 X144.788 Y153.028 E.02157
G1 X145.113 Y153.319 E.02471
M204 S10000
G1 X145.846 Y154.291 F42000
; LINE_WIDTH: 0.494546
G1 F5918.712
M204 S6000
G1 X145.931 Y154.332 E.00468
; LINE_WIDTH: 0.521801
G1 F5569.329
G1 X146.016 Y154.372 E.00498
; LINE_WIDTH: 0.51619
G1 F5637.841
G1 X145.929 Y154.209 E.00965
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X145.842 Y154.045 E.00884
; LINE_WIDTH: 0.420412
G1 F7136.446
G1 X145.755 Y153.881 E.00763
G1 X145.595 Y153.4 E.02085
G3 X145.523 Y152.365 I4.915 J-.864 E.04273
G1 X145.523 Y150.667 E.06979
G1 X144.155 Y150.667 E.05622
G1 X144.162 Y152.406 E.0715
G1 X144.231 Y152.83 E.01763
G1 X144.407 Y153.226 E.01785
G1 X144.857 Y153.662 E.02574
G1 X145.359 Y154.003 E.02495
; LINE_WIDTH: 0.435228
G1 F6854.584
G1 X145.577 Y154.132 E.01082
; LINE_WIDTH: 0.465688
G1 F6339.814
G1 X145.794 Y154.261 E.0117
M204 S10000
G1 X146.016 Y154.372 F42000
; LINE_WIDTH: 0.526658
G1 F5511.346
M204 S6000
G1 X146.232 Y154.552 E.01494
M204 S10000
G1 X147.581 Y155.05 F42000
; LINE_WIDTH: 0.422372
G1 F7097.841
M204 S6000
G1 X147.793 Y155.067 E.00876
G1 X148.314 Y155.208 E.0223
G1 X148.863 Y155.478 E.0253
G1 X149.232 Y155.801 E.02026
G1 X149.396 Y156.074 E.01317
G1 X149.581 Y156.545 E.02093
G1 X149.679 Y157.226 E.02844
G3 X149.684 Y158.717 I-68.867 J.997 E.06163
G1 X151.055 Y158.717 E.05665
G2 X151.025 Y157.196 I-13.645 J-.494 E.06293
G1 X150.882 Y156.641 E.0237
G1 X150.616 Y156.293 E.0181
G2 X149.425 Y155.424 I-13.439 J17.177 E.06094
G1 X149.259 Y155.189 E.01188
G1 X149.219 Y155.001 E.00798
G1 X149.296 Y154.68 E.01361
G3 X150.52 Y153.738 I11.101 J13.154 E.0639
G1 X150.824 Y153.394 E.01896
G1 X150.923 Y153.195 E.00918
G1 X151.041 Y152.657 E.02275
G1 X151.052 Y150.667 E.08226
G1 X149.685 Y150.667 E.05653
G1 X149.685 Y152.593 E.0796
G1 X149.645 Y153.162 E.02356
G1 X149.525 Y153.656 E.02104
G1 X149.293 Y154.115 E.02124
G1 X148.881 Y154.537 E.02436
G1 X148.43 Y154.775 E.02109
G1 X147.64 Y155.036 E.0344
M204 S10000
G1 X148.859 Y154.972 F42000
; LINE_WIDTH: 0.472908
G1 F6228.934
M204 S6000
G2 X148.85 Y155.061 I-.026 J.043 E.00949
M204 S10000
G1 X149.953 Y156.325 F42000
; LINE_WIDTH: 0.554853
G1 F5197.28
M204 S6000
G3 X150.117 Y158.285 I-6.945 J1.568 E.11138
G1 X150.622 Y158.285 E.02852
G2 X150.576 Y157.088 I-8.255 J-.278 E.06767
G1 X150.484 Y156.801 E.01701
G1 X150.32 Y156.598 E.01471
G1 X150.001 Y156.36 E.02243
M204 S10000
G1 X149.99 Y153.598 F42000
; LINE_WIDTH: 0.560412
G1 F5139.537
M204 S6000
G1 X150.362 Y153.298 E.02726
G1 X150.512 Y153.073 E.01544
G1 X150.615 Y152.584 E.02852
G3 X150.619 Y151.098 I811.857 J1.601 E.08482
G1 X150.116 Y151.098 E.02875
G3 X150.115 Y152.583 I-810.726 J.126 E.08477
G1 X150.073 Y153.192 E.03483
G1 X150.002 Y153.539 E.02022
; WIPE_START
G1 X150.073 Y153.192 E-.13465
G1 X150.115 Y152.583 E-.23185
G1 X150.115 Y151.548 E-.3935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.377 Y153.899 Z.88 F42000
G1 X161.879 Y155.356 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X159.477 Y155.356 E.10687
G3 X159.455 Y154.628 I2.909 J-.451 E.03248
G1 X164.521 Y154.628 E.22534
G1 X164.527 Y154.778 E.00667
G3 X164.208 Y156.623 I-7.557 J-.356 E.08347
G1 X164.185 Y156.68 E.00274
G3 X163.421 Y157.899 I-4.46 J-1.946 E.06422
G1 X163.115 Y158.275 E.02157
G3 X161.539 Y159.336 I-4.308 J-4.699 E.08483
G3 X160.117 Y159.641 I-1.742 J-4.664 E.06491
G1 X159.623 Y159.686 E.02208
G3 X157.73 Y159.358 I.362 J-7.719 E.08568
G1 X157.671 Y159.335 E.0028
G3 X156.428 Y158.563 I2.017 J-4.638 E.06534
G1 X156.021 Y158.236 E.02322
G3 X154.947 Y156.687 I5.503 J-4.964 E.08405
G1 X154.923 Y156.63 E.00275
G3 X154.61 Y155.211 I4.686 J-1.778 E.0649
G1 X154.56 Y154.686 E.02344
G3 X154.886 Y152.821 I7.496 J.352 E.08442
G1 X154.909 Y152.764 E.00276
G3 X155.677 Y151.548 I4.481 J1.98 E.06418
G1 X156.004 Y151.149 E.02298
G3 X157.566 Y150.097 I4.965 J5.687 E.08395
G3 X159.52 Y149.726 I2.155 J6.011 E.08885
G3 X159.679 Y149.728 I.074 J.462 E.00711
G3 X161.515 Y150.1 I-.19 J5.649 E.08372
G1 X161.616 Y150.147 E.00493
G3 X162.271 Y150.517 I-4.471 J8.69 E.03349
G1 X160.788 Y152.3 E.10317
G2 X159.709 Y151.94 I-1.327 J2.185 E.05098
G2 X158.606 Y152.265 I.068 J2.267 E.05173
G2 X158.019 Y152.839 I2.378 J3.018 E.03661
G2 X157.487 Y155.285 I3.153 J1.966 E.11355
G2 X158.042 Y156.839 I3.285 J-.298 E.07422
G2 X159.083 Y157.607 I1.78 J-1.324 E.05838
G2 X159.755 Y157.723 I1.112 J-4.449 E.03036
G2 X160.86 Y157.396 I-.355 J-3.232 E.05151
G2 X161.539 Y156.433 I-1.038 J-1.453 E.05345
G1 X161.861 Y155.414 E.04755
M204 S10000
G1 X161.368 Y155.731 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X159.198 Y155.731 E.08908
G3 X159.152 Y154.253 I2.592 J-.821 E.06148
G1 X164.875 Y154.253 E.23498
G3 X164.818 Y155.626 I-5.076 J.478 E.05656
G3 X163.899 Y157.893 I-4.146 J-.361 E.10198
G3 X163.382 Y158.542 I-13.615 J-10.318 E.03406
G3 X161.92 Y159.575 I-5.629 J-6.413 E.07364
G3 X160.156 Y160.014 I-2.083 J-4.615 E.07504
G1 X159.623 Y160.062 E.02197
G3 X157.786 Y159.773 I.457 J-8.896 E.07649
G3 X156.196 Y158.858 I1.555 J-4.539 E.07579
G1 X155.756 Y158.504 E.02321
G3 X154.687 Y157.015 I6.387 J-5.711 E.0754
G3 X154.237 Y155.251 I4.61 J-2.116 E.07516
G1 X154.183 Y154.686 E.02327
G3 X154.472 Y152.872 I8.648 J.444 E.07557
G3 X155.384 Y151.314 I4.397 J1.53 E.0746
G1 X155.74 Y150.881 E.02303
G3 X157.242 Y149.834 I5.714 J6.599 E.07532
G3 X159.035 Y149.393 I2.129 J4.796 E.07619
G3 X159.713 Y149.354 I.495 J2.671 E.02797
G3 X161.666 Y149.756 I-.189 J5.862 E.08228
G1 X161.777 Y149.808 E.00501
G3 X162.829 Y150.433 I-3.678 J7.394 E.05028
G1 X160.839 Y152.824 E.12775
G2 X159.702 Y152.319 I-1.253 J1.288 E.05215
G2 X158.711 Y152.655 I.03 J1.717 E.04365
G2 X158.329 Y153.054 I2.701 J2.972 E.02271
G2 X157.836 Y154.86 I2.777 J1.727 E.07792
G2 X158.348 Y156.618 I3.029 J.072 E.07636
G2 X159.191 Y157.248 I1.454 J-1.066 E.04387
G2 X159.746 Y157.344 I.963 J-3.916 E.02314
G2 X160.657 Y157.08 I-.19 J-2.363 E.03923
G2 X161.185 Y156.31 I-.823 J-1.129 E.03905
G1 X161.35 Y155.788 E.02246
; WIPE_START
M204 S6000
G1 X159.35 Y155.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.199 Y154.992 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.398159
G1 F7606.201
M204 S6000
G1 X159.639 Y154.992 E.09871
; WIPE_START
G1 X161.639 Y154.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.446 Y150.953 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465223
G1 F6347.091
M204 S6000
G1 X160.175 Y150.907 E.01269
; LINE_WIDTH: 0.450164
G1 F6592.138
G2 X159.05 Y150.905 I-.567 J2.581 E.05045
; LINE_WIDTH: 0.485689
G1 F6041.891
G1 X158.799 Y150.96 E.01251
; LINE_WIDTH: 0.513808
G1 F5667.435
G1 X158.547 Y151.015 E.01334
; LINE_WIDTH: 0.550379
G1 F5244.71
G1 X158.336 Y151.096 E.01267
; LINE_WIDTH: 0.595398
G1 F4803.626
G1 X158.124 Y151.177 E.01383
; WIPE_START
G1 X158.336 Y151.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.361 Y157.389 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.488011
G1 F6009.099
M204 S6000
G1 X162.555 Y157.174 E.01416
; LINE_WIDTH: 0.430609
G1 F6940.052
G1 X162.749 Y156.958 E.01226
G2 X163.165 Y156.25 I-5.749 J-3.851 E.03473
; LINE_WIDTH: 0.444891
G1 F6682.463
G1 X163.207 Y156.016 E.01042
; LINE_WIDTH: 0.471547
G1 F6249.546
G1 X163.248 Y155.782 E.01115
G1 X162.943 Y156.102 E.02075
; LINE_WIDTH: 0.425139
G1 F7044.045
G1 X162.765 Y156.195 E.00836
G1 X162.583 Y156.772 E.0252
; LINE_WIDTH: 0.446096
G1 F6661.603
G1 X162.482 Y157.052 E.01313
; LINE_WIDTH: 0.488011
G1 F6009.099
G1 X162.381 Y157.333 E.01455
; WIPE_START
G1 X162.482 Y157.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.178 Y157.639 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.568352
G1 F5059.245
M204 S6000
G1 X157.333 Y157.772 E.01184
; LINE_WIDTH: 0.530998
G1 F5460.553
G1 X157.488 Y157.905 E.01097
; LINE_WIDTH: 0.493645
G1 F5931.009
G1 X157.643 Y158.038 E.0101
; LINE_WIDTH: 0.453984
G1 F6528.208
G1 X157.835 Y158.165 E.01035
; LINE_WIDTH: 0.412014
G1 F7306.752
G1 X158.027 Y158.293 E.00925
M204 S10000
G1 X155.835 Y155.535 F42000
; LINE_WIDTH: 0.551498
G1 F5232.756
M204 S6000
G1 X155.988 Y156.158 E.03597
; LINE_WIDTH: 0.522026
G1 F5566.616
G1 X156.129 Y156.445 E.01683
; LINE_WIDTH: 0.492461
G1 F5947.253
G1 X156.27 Y156.731 E.01576
; LINE_WIDTH: 0.461884
G1 F6399.852
G1 X156.425 Y156.956 E.01248
; LINE_WIDTH: 0.430294
G1 F6945.959
G1 X156.58 Y157.18 E.0115
; LINE_WIDTH: 0.400979
G1 F7543.28
G1 X156.802 Y157.476 E.01438
; LINE_WIDTH: 0.412405
G1 F7298.638
G1 X156.896 Y157.517 E.00412
; LINE_WIDTH: 0.462297
G1 F6393.269
G1 X156.99 Y157.557 E.00471
; LINE_WIDTH: 0.51219
G1 F5687.727
G1 X157.084 Y157.598 E.00529
; LINE_WIDTH: 0.562082
G1 F5122.432
G1 X157.178 Y157.639 E.00587
; LINE_WIDTH: 0.56418
G1 F5101.117
G1 X157.114 Y157.498 E.00892
; LINE_WIDTH: 0.518482
G1 F5609.65
G1 X157.051 Y157.356 E.00811
; LINE_WIDTH: 0.472785
G1 F6230.802
G1 X156.988 Y157.214 E.0073
; LINE_WIDTH: 0.43811
G1 F6802.343
G2 X156.643 Y156.543 I-5.056 J2.176 E.03258
; LINE_WIDTH: 0.492461
G1 F5947.253
G1 X156.546 Y156.293 E.0132
; LINE_WIDTH: 0.522026
G1 F5566.616
G1 X156.45 Y156.044 E.0141
; LINE_WIDTH: 0.567724
G1 F5065.5
G3 X156.424 Y153.618 I4.974 J-1.266 E.14181
G1 X156.675 Y152.941 E.04182
; LINE_WIDTH: 0.520141
G1 F5589.424
G1 X156.856 Y152.621 E.01933
; LINE_WIDTH: 0.485606
G1 F6043.062
G1 X157.038 Y152.3 E.01788
; LINE_WIDTH: 0.453059
G1 F6543.575
G1 X157.268 Y152.05 E.01521
; LINE_WIDTH: 0.422498
G1 F7095.358
G1 X157.497 Y151.801 E.01403
; LINE_WIDTH: 0.385763
G1 F7895.689
G1 X157.824 Y151.525 E.01588
; LINE_WIDTH: 0.38693
G1 F7867.498
G1 X157.863 Y151.461 E.00281
; LINE_WIDTH: 0.432175
G1 F6910.844
G1 X157.902 Y151.396 E.0032
; LINE_WIDTH: 0.477419
G1 F6161.619
G1 X157.941 Y151.332 E.00358
; LINE_WIDTH: 0.522662
G1 F5558.957
G1 X157.979 Y151.267 E.00397
; LINE_WIDTH: 0.567906
G1 F5063.681
G1 X158.018 Y151.203 E.00436
G1 X157.944 Y151.218 E.00438
; LINE_WIDTH: 0.522662
G1 F5558.957
G1 X157.87 Y151.233 E.00399
; LINE_WIDTH: 0.477419
G1 F6161.619
G1 X157.796 Y151.248 E.0036
; LINE_WIDTH: 0.432175
G1 F6910.844
G1 X157.722 Y151.263 E.00321
; LINE_WIDTH: 0.401904
G1 F7522.863
G1 X157.648 Y151.278 E.00295
G1 X156.932 Y151.827 E.03519
; LINE_WIDTH: 0.455173
G1 F6508.546
G1 X156.696 Y152.08 E.01555
; LINE_WIDTH: 0.482599
G1 F6086.077
G1 X156.519 Y152.33 E.01477
; LINE_WIDTH: 0.511118
G1 F5701.237
G1 X156.341 Y152.579 E.01577
; LINE_WIDTH: 0.538351
G1 F5376.605
G1 X156.18 Y152.881 E.01864
; LINE_WIDTH: 0.582861
G1 F4918.83
G1 X156.019 Y153.182 E.02038
G1 X155.852 Y153.793 E.0378
G1 X155.753 Y154.654 E.05164
G1 X155.829 Y155.476 E.04922
M204 S10000
G1 X155.411 Y155.638 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X155.606 Y156.348 E.03025
G1 X155.954 Y156.962 E.029
G1 X156.542 Y157.709 E.03902
G1 X157.295 Y158.289 E.03902
G1 X157.947 Y158.649 E.03058
; LINE_WIDTH: 0.438085
G1 F6802.781
G1 X158.147 Y158.683 E.00876
; LINE_WIDTH: 0.474259
G1 F6208.631
G1 X158.347 Y158.718 E.0096
; LINE_WIDTH: 0.504722
G1 F5783.261
G2 X159.6 Y158.909 I4.768 J-26.988 E.06426
G1 X160.528 Y158.805 E.04738
G1 X161.212 Y158.608 E.0361
; LINE_WIDTH: 0.546671
G1 F5284.675
G1 X161.82 Y158.262 E.03885
G1 X162.094 Y158.046 E.01936
; LINE_WIDTH: 0.540407
G1 F5353.592
G1 X162.247 Y157.958 E.00965
; LINE_WIDTH: 0.492243
G1 F5950.246
G1 X162.399 Y157.87 E.00869
; LINE_WIDTH: 0.420726
G1 F7130.227
G1 X162.552 Y157.782 E.00725
G1 X163.035 Y157.18 E.03178
G2 X163.515 Y156.343 I-4.204 J-2.965 E.03976
G1 X163.681 Y155.718 E.0266
G1 X163.721 Y155.363 E.01469
G1 X162.933 Y155.363 E.03241
G1 X162.883 Y155.613 E.01049
G1 X162.651 Y155.861 E.01398
G1 X162.476 Y155.905 E.0074
G3 X162.019 Y157.173 I-6.713 J-1.704 E.05555
; LINE_WIDTH: 0.44408
G1 F6696.574
G1 X161.936 Y157.335 E.00797
; LINE_WIDTH: 0.492243
G1 F5950.246
G1 X161.853 Y157.497 E.00897
; LINE_WIDTH: 0.5394
G1 F5364.835
G1 X161.771 Y157.659 E.00995
G1 X161.36 Y158.004 E.02935
G1 X161.06 Y158.167 E.01864
; LINE_WIDTH: 0.511438
G1 F5697.194
G1 X160.578 Y158.346 E.02648
; LINE_WIDTH: 0.487344
G1 F6018.477
G1 X159.869 Y158.477 E.03514
G1 X159.656 Y158.485 E.01037
G1 X159.067 Y158.401 E.029
; LINE_WIDTH: 0.519278
G1 F5599.923
G1 X158.572 Y158.264 E.02692
; LINE_WIDTH: 0.518948
G1 F5603.951
G1 X158.373 Y158.116 E.01297
; LINE_WIDTH: 0.479369
G1 F6132.963
G1 X158.175 Y157.967 E.01185
; LINE_WIDTH: 0.420247
G1 F7139.721
G1 X157.977 Y157.819 E.01018
G1 X157.496 Y157.331 E.02815
G3 X156.727 Y154.907 I3.576 J-2.468 E.10604
G3 X157.068 Y153.085 I4.594 J-.083 E.07669
G1 X157.379 Y152.477 E.02802
G3 X158.157 Y151.683 I3.477 J2.628 E.04583
G1 X158.641 Y151.42 E.02262
G1 X159.267 Y151.263 E.02651
G1 X159.773 Y151.207 E.02094
G3 X160.592 Y151.386 I-4.766 J23.646 E.03443
G1 X161.126 Y150.744 E.03434
G2 X159.946 Y150.5 I-1.377 J3.684 E.0497
G1 X159.544 Y150.462 E.01661
G2 X158.247 Y150.645 I1.211 J13.254 E.05385
G1 X157.733 Y150.833 E.02247
G2 X156.528 Y151.673 I3.416 J6.187 E.06046
G1 X155.949 Y152.411 E.03854
G1 X155.594 Y153.043 E.0298
G1 X155.409 Y153.729 E.02919
G1 X155.3 Y154.685 E.03954
G1 X155.404 Y155.578 E.03693
M204 S10000
G1 X155.056 Y155.707 F42000
; LINE_WIDTH: 0.419998
G1 F7144.65
M204 S6000
G1 X155.271 Y156.486 E.03321
G1 X155.655 Y157.163 E.03195
G1 X156.287 Y157.967 E.04198
G1 X157.097 Y158.591 E.04199
G1 X157.812 Y158.985 E.03351
G1 X158.584 Y159.191 E.03282
G1 X159.623 Y159.308 E.04294
G1 X160.619 Y159.197 E.04113
G1 X161.397 Y158.987 E.03309
G1 X162.072 Y158.61 E.03175
G1 X162.848 Y158.008 E.04032
G1 X163.449 Y157.234 E.04022
G1 X163.835 Y156.539 E.03266
G1 X164.036 Y155.785 E.03204
G1 X164.124 Y155.003 E.03229
G1 X162.573 Y155.003 E.06366
G1 X162.557 Y155.462 E.01885
G1 X162.479 Y155.545 E.00465
G1 X162.206 Y155.566 E.01126
G1 X161.894 Y156.554 E.04253
G1 X161.665 Y157.061 E.02284
G1 X161.482 Y157.338 E.01363
G1 X161.083 Y157.697 E.02203
G1 X160.498 Y157.955 E.02624
G1 X159.794 Y158.097 E.02949
G1 X159.128 Y158.005 E.0276
G3 X158.073 Y157.409 I.514 J-2.14 E.05042
G1 X157.727 Y157.044 E.02064
G1 X157.326 Y156.237 E.037
G3 X157.21 Y153.753 I4.371 J-1.448 E.10338
G3 X157.698 Y152.643 I4.419 J1.279 E.04993
G1 X158.117 Y152.181 E.02562
G3 X158.767 Y151.757 I1.521 J1.623 E.03203
G3 X159.75 Y151.567 I1.246 J3.804 E.0412
G1 X160.487 Y151.728 E.03097
G1 X160.696 Y151.823 E.00944
G1 X161.698 Y150.619 E.0643
G1 X161.114 Y150.349 E.02643
G2 X159.987 Y150.142 I-1.436 J4.654 E.04714
G1 X159.512 Y150.103 E.0196
G2 X158.155 Y150.295 I1.294 J14.028 E.05627
G1 X157.574 Y150.508 E.02541
G2 X156.271 Y151.416 I3.696 J6.688 E.06531
G1 X155.648 Y152.21 E.04144
G1 X155.258 Y152.906 E.03276
G1 X155.054 Y153.661 E.03211
G1 X154.937 Y154.686 E.04233
G1 X155.049 Y155.647 E.03974
; WIPE_START
G1 X154.937 Y154.686 E-.36782
G1 X155.054 Y153.661 E-.39173
G1 X155.055 Y153.66 E-.00045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y154.903 Z.88 F42000
G1 X172.436 Y156.528 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X172.523 Y156.428 E.00589
G2 X172.811 Y155.701 I-.934 J-.79 E.0354
G1 X172.838 Y155.411 E.01295
G1 X172.838 Y149.932 E.24372
G1 X175.678 Y149.932 E.12634
G1 X175.678 Y154.974 E.22426
G3 X175.444 Y156.843 I-7.505 J.008 E.08404
G3 X174.723 Y158.227 I-6.271 J-2.387 E.06956
G3 X173.442 Y159.257 I-4.581 J-4.388 E.07332
G3 X171.894 Y159.638 I-1.783 J-3.911 E.0713
G3 X171.047 Y159.629 I-.402 J-2.172 E.03794
G3 X169.455 Y159.137 I.221 J-3.538 E.07481
G3 X168.538 Y158.423 I5.733 J-8.301 E.05173
G3 X167.615 Y157.003 I4.176 J-3.725 E.07565
G3 X167.316 Y155.283 I6.299 J-1.979 E.07786
G1 X167.316 Y149.932 E.23801
G1 X170.157 Y149.932 E.12634
G1 X170.157 Y155.409 E.24363
G2 X170.373 Y156.308 I1.912 J.016 E.04154
G2 X171.172 Y156.831 I1.013 J-.677 E.04366
G1 X171.491 Y156.907 E.0146
G2 X172.293 Y156.639 I-.297 J-2.22 E.03782
G2 X172.389 Y156.564 I-.704 J-1.001 E.00541
M204 S10000
G1 X172.174 Y156.26 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X172.439 Y155.654 I-.633 J-.638 E.0278
G1 X172.463 Y155.394 E.01076
G1 X172.463 Y149.557 E.23964
G1 X176.053 Y149.557 E.1474
G1 X176.053 Y154.982 E.22275
G3 X175.855 Y156.776 I-8.57 J-.041 E.07423
G3 X175.279 Y158.04 I-5.095 J-1.556 E.05719
G1 X175.016 Y158.466 E.02058
G3 X173.615 Y159.59 I-4.923 J-4.705 E.07396
G3 X171.935 Y160.011 I-1.95 J-4.223 E.07154
G1 X171.503 Y160.051 E.01779
G3 X169.895 Y159.773 I.367 J-6.906 E.06719
G3 X168.649 Y159.007 I1.599 J-3.997 E.06031
G1 X168.267 Y158.684 E.02056
G3 X167.335 Y157.303 I4.836 J-4.265 E.0686
G3 X166.986 Y155.81 I4.208 J-1.77 E.06323
G1 X166.941 Y155.299 E.02105
G1 X166.941 Y149.557 E.23577
G1 X170.531 Y149.557 E.1474
G1 X170.531 Y155.393 E.23961
G2 X170.753 Y156.194 I1.403 J.044 E.03465
G1 X170.791 Y156.232 E.00223
G2 X171.492 Y156.522 I.903 J-1.196 E.03147
G2 X172.124 Y156.294 I-.16 J-1.437 E.02785
; WIPE_START
M204 S6000
G1 X172.3 Y156.11 E-.09697
G1 X172.35 Y156.012 E-.04166
G1 X172.439 Y155.654 E-.13996
G1 X172.463 Y155.394 E-.09955
G1 X172.463 Y154.389 E-.38186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.484 Y155.213 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.556513
G1 F5179.903
M204 S6000
G1 X168.605 Y156.234 E.05824
G1 X168.75 Y156.694 E.02731
; LINE_WIDTH: 0.533173
G1 F5435.458
G2 X169.392 Y157.635 I4.029 J-2.062 E.06161
G1 X169.981 Y158.09 E.04016
G1 X170.356 Y158.298 E.02318
G2 X171.48 Y158.519 I1.452 J-4.409 E.06197
G1 X172.112 Y158.444 E.03435
; LINE_WIDTH: 0.561026
G1 F5133.235
G1 X172.751 Y158.277 E.03772
G1 X173.082 Y158.1 E.02147
G2 X173.829 Y157.452 I-2.087 J-3.162 E.05666
G2 X174.45 Y155.917 I-2.764 J-2.012 E.09558
G2 X174.511 Y154.942 I-8.61 J-1.028 E.0559
G1 X174.511 Y151.1 E.21957
G1 X174.006 Y151.1 E.02888
G1 X174.006 Y154.942 E.21957
G3 X173.922 Y156.086 I-5.353 J.185 E.06569
G1 X173.689 Y156.743 E.03984
G1 X173.422 Y157.162 E.02839
G1 X173.093 Y157.489 E.02651
G1 X172.589 Y157.789 E.03351
G1 X172.306 Y157.898 E.01733
; LINE_WIDTH: 0.534652
G1 F5418.514
G1 X171.728 Y158.031 E.03215
G1 X171.388 Y158.051 E.01843
G3 X170.312 Y157.743 I.798 J-4.813 E.06072
G1 X169.873 Y157.447 E.02864
G1 X169.481 Y157.019 E.03144
G1 X169.184 Y156.478 E.03341
G1 X169.094 Y156.168 E.01746
G1 X169.008 Y155.557 E.0334
; LINE_WIDTH: 0.565056
G1 F5092.261
G1 X168.989 Y155.198 E.02075
G1 X168.989 Y151.1 E.23608
G1 X168.484 Y151.1 E.02911
G1 X168.484 Y155.153 E.23352
M204 S10000
G1 X168.051 Y155.24 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X168.189 Y156.351 E.04596
G1 X168.349 Y156.844 E.02128
G2 X169.07 Y157.907 I7.399 J-4.242 E.05277
G1 X169.853 Y158.517 E.04078
G1 X170.226 Y158.704 E.01715
G2 X171.435 Y158.928 I1.453 J-4.478 E.05062
G2 X172.665 Y158.768 I-.171 J-6.142 E.05101
G1 X173.059 Y158.619 E.01728
G1 X173.554 Y158.289 E.02443
G1 X174.075 Y157.825 E.02867
G1 X174.382 Y157.367 E.02261
G1 X174.711 Y156.683 E.03119
G2 X174.943 Y154.973 I-6.836 J-1.797 E.07103
G1 X174.944 Y150.667 E.17679
G1 X173.573 Y150.667 E.05628
G1 X173.573 Y155.422 E.19526
G1 X173.516 Y155.951 E.02182
G1 X173.293 Y156.596 E.02803
G1 X172.961 Y157.04 E.02274
G3 X171.625 Y157.631 I-1.852 J-2.379 E.06059
G1 X171.341 Y157.626 E.01169
G1 X170.611 Y157.414 E.0312
G1 X170.166 Y157.158 E.02109
G1 X169.791 Y156.755 E.0226
G1 X169.563 Y156.29 E.02129
G1 X169.427 Y155.496 E.03306
G1 X169.422 Y150.667 E.19827
G1 X168.051 Y150.667 E.05628
G1 X168.051 Y155.18 E.1853
M204 S10000
G1 X167.691 Y155.262 F42000
G1 F7144.644
M204 S6000
G1 X167.836 Y156.429 E.04828
G1 X168.018 Y156.989 E.02418
G1 X168.27 Y157.435 E.02103
G1 X168.81 Y158.161 E.03714
G1 X169.656 Y158.82 E.04404
G1 X170.117 Y159.047 E.02109
G1 X170.8 Y159.217 E.02892
M73 P72 R3
G1 X171.396 Y159.285 E.02461
G1 X172.196 Y159.223 E.03296
G1 X172.759 Y159.117 E.02353
G1 X173.237 Y158.932 E.02102
G2 X174.17 Y158.227 I-2.232 J-3.925 E.04814
G1 X174.43 Y157.988 E.01451
G2 X175.086 Y156.727 I-5.043 J-3.427 E.05851
G1 X175.234 Y156.017 E.02978
G2 X175.303 Y154.965 I-13.241 J-1.397 E.04329
G1 X175.303 Y150.307 E.19126
G1 X173.213 Y150.307 E.08583
G1 X173.213 Y155.422 E.21003
G1 X173.155 Y155.926 E.0208
G1 X172.956 Y156.471 E.02386
G1 X172.636 Y156.849 E.02031
G1 X172.154 Y157.118 E.02266
G1 X171.536 Y157.282 E.02626
G3 X170.666 Y157.048 I1.364 J-6.799 E.03703
G1 X170.301 Y156.8 E.01812
G1 X170.037 Y156.477 E.0171
G1 X169.873 Y156.054 E.01864
G1 X169.783 Y155.44 E.02549
G3 X169.782 Y150.307 I453.762 J-2.688 E.21075
G1 X167.691 Y150.307 E.08583
G1 X167.691 Y155.202 E.201
; OBJECT_ID: 701
; WIPE_START
G1 X167.691 Y153.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1070
M625
; start printing object, unique label id: 701
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.413 Y150.905 Z.88 F42000
G1 X116.858 Y137.16 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X116.858 Y137.535 E.01668
G1 X118.305 Y137.535 E.06439
G1 X118.305 Y140.289 E.12252
G1 X116.858 Y140.289 E.06439
G1 X116.858 Y142.701 E.10727
G2 X117.085 Y143.878 I2.609 J.107 E.05382
G2 X118.006 Y144.558 I1.276 J-.764 E.0523
G1 X118.42 Y144.681 E.01917
G2 X119.409 Y144.367 I-.244 J-2.488 E.04651
G2 X119.7 Y144.105 I-.922 J-1.314 E.01747
G1 X122.202 Y145.931 E.13781
G3 X120.713 Y147.091 I-3.801 J-3.347 E.08448
G3 X119.216 Y147.47 I-2.068 J-5.014 E.06893
G1 X118.643 Y147.544 E.02567
G3 X116.702 Y147.181 I.225 J-6.573 E.08816
G3 X115.524 Y146.412 I2.001 J-4.355 E.06283
G1 X115.1 Y146.052 E.02474
G3 X114.045 Y144.381 I6.22 J-5.096 E.08815
G3 X113.72 Y142.782 I5.48 J-1.945 E.07277
G1 X113.674 Y142.192 E.02636
G1 X113.674 Y133.718 E.37694
G1 X116.858 Y133.718 E.1416
G1 X116.858 Y137.1 E.15044
M204 S10000
G1 X117.233 Y137.16 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X118.68 Y137.16 E.05943
G1 X118.68 Y140.664 E.14388
G1 X117.233 Y140.664 E.05943
G1 X117.233 Y142.691 E.08323
G2 X117.415 Y143.698 I2.251 J.113 E.04239
G2 X118.123 Y144.202 I.949 J-.586 E.03664
G1 X118.439 Y144.296 E.01357
G2 X119.282 Y143.991 I-.136 J-1.695 E.03723
G2 X119.592 Y143.562 I-1.095 J-1.119 E.02184
M73 P73 R3
G1 X122.766 Y145.878 E.16133
G3 X121.104 Y147.314 I-5.396 J-4.566 E.09056
G3 X119.269 Y147.841 I-2.4 J-4.9 E.07882
G1 X118.65 Y147.922 E.0256
G3 X116.732 Y147.595 I.288 J-7.486 E.08012
G3 X115.285 Y146.702 I1.866 J-4.643 E.07017
G1 X114.825 Y146.31 E.0248
G3 X113.776 Y144.704 I7.141 J-5.81 E.07891
G3 X113.347 Y142.816 I4.933 J-2.114 E.07993
G1 X113.3 Y142.206 E.02512
G1 X113.3 Y133.343 E.36392
G1 X117.233 Y133.343 E.16149
G1 X117.233 Y137.1 E.15426
; WIPE_START
M204 S6000
G1 X118.68 Y137.16 E-.55053
G1 X118.68 Y137.711 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.236 Y144.903 Z.88 F42000
G1 X121.613 Y145.965 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.72 Y144.583 E.09625
G1 X119.424 Y144.792 E.01485
G1 X119.049 Y144.934 E.01649
G1 X118.442 Y145.059 E.02545
G1 X117.633 Y144.806 E.03479
G3 X116.727 Y143.986 I.606 J-1.581 E.05133
G1 X116.559 Y143.498 E.02118
G3 X116.483 Y142.114 I7.147 J-1.089 E.05698
G1 X116.483 Y140.094 E.08295
G1 X116.584 Y139.932 E.00785
G3 X117.93 Y139.914 I.845 J12.83 E.0553
G1 X117.93 Y137.91 E.08231
G1 X116.663 Y137.91 E.05205
G1 X116.537 Y137.859 E.00555
G1 X116.483 Y137.73 E.00576
G1 X116.483 Y134.093 E.14934
G1 X114.049 Y134.093 E.09991
G1 X114.049 Y142.173 E.3318
G1 X114.112 Y142.82 E.02669
G2 X114.751 Y144.92 I4.3 J-.161 E.09112
G1 X115.378 Y145.796 E.04424
G2 X116.851 Y146.835 I4.693 J-5.089 E.07422
G1 X117.501 Y147.026 E.02782
G2 X118.638 Y147.167 I1.846 J-10.208 E.04704
G2 X120.339 Y146.836 I-.945 J-9.389 E.07127
G1 X120.964 Y146.519 E.02875
G1 X121.568 Y146.004 E.03259
M204 S10000
G1 X121.036 Y145.99 F42000
G1 F7144.644
M204 S6000
G1 X119.72 Y145.029 E.06689
G1 X119.254 Y145.243 E.02105
G1 X118.52 Y145.41 E.03094
G1 X118.236 Y145.392 E.01166
G1 X117.399 Y145.106 E.03633
G1 X116.932 Y144.823 E.0224
G1 X116.576 Y144.448 E.02126
G1 X116.386 Y144.103 E.01617
G1 X116.219 Y143.615 E.02118
G3 X116.123 Y142.394 I8.303 J-1.266 E.05031
G1 X116.123 Y140.094 E.09444
G1 X116.287 Y139.707 E.01728
G1 X116.427 Y139.608 E.00703
G1 X116.663 Y139.554 E.00992
G1 X117.57 Y139.554 E.03727
G1 X117.57 Y138.27 E.05275
G1 X116.663 Y138.27 E.03727
G1 X116.427 Y138.215 E.00992
G1 X116.287 Y138.117 E.00703
G1 X116.131 Y137.823 E.01367
G1 X116.123 Y134.453 E.13839
G1 X114.409 Y134.453 E.07036
G1 X114.409 Y142.156 E.3163
G2 X114.526 Y143.315 I89.25 J-8.365 E.04783
G1 X114.707 Y144.034 E.03044
G1 X115.035 Y144.686 E.02997
G2 X115.712 Y145.608 I9.189 J-6.04 E.04698
G2 X117.078 Y146.527 I3.995 J-4.464 E.06783
G1 X117.58 Y146.674 E.02146
G2 X118.75 Y146.79 I1.216 J-6.319 E.04836
G2 X120.176 Y146.507 I-.927 J-8.426 E.05973
G1 X120.603 Y146.32 E.01914
G2 X120.991 Y146.029 I-.794 J-1.464 E.02
M204 S10000
G1 X120.438 Y145.999 F42000
G1 F7144.644
M204 S6000
G1 X119.696 Y145.457 E.03773
G3 X118.592 Y145.763 I-1.596 J-3.613 E.04719
G1 X118.208 Y145.758 E.01577
G1 X117.4 Y145.487 E.03501
G1 X117.09 Y145.354 E.01386
G1 X116.653 Y145.058 E.02167
G1 X116.283 Y144.657 E.02237
G3 X115.797 Y143.119 I2.775 J-1.723 E.06694
G1 X115.763 Y142.394 E.02979
G1 X115.763 Y140.094 E.09444
G1 X116.036 Y139.448 E.0288
G1 X116.27 Y139.285 E.01172
; LINE_WIDTH: 0.437838
G1 F6807.224
G1 X116.373 Y139.238 E.00488
; LINE_WIDTH: 0.473518
G1 F6219.744
G1 X116.477 Y139.191 E.00534
; LINE_WIDTH: 0.523165
G1 F5552.921
G1 X116.58 Y139.145 E.00598
G1 X117.159 Y139.143 E.03062
G1 X117.159 Y138.681 E.02443
G1 X116.58 Y138.679 E.03062
; LINE_WIDTH: 0.509198
G1 F5725.61
G1 X116.477 Y138.633 E.0058
; LINE_WIDTH: 0.473518
G1 F6219.744
G1 X116.373 Y138.586 E.00534
; LINE_WIDTH: 0.420096
G1 F7142.7
G3 X116.036 Y138.376 I.391 J-1.001 E.01641
G1 X115.776 Y137.885 E.0228
G1 X115.763 Y137.73 E.00641
G1 X115.763 Y134.812 E.11981
G1 X114.769 Y134.812 E.04082
G1 X114.769 Y142.139 E.30089
G2 X114.938 Y143.558 I18.85 J-1.525 E.05872
G2 X115.365 Y144.541 I3.464 J-.92 E.04421
G1 X115.912 Y145.306 E.03859
G2 X117.179 Y146.182 I4.114 J-4.597 E.06344
G2 X118.259 Y146.406 I1.335 J-3.711 E.04544
G1 X118.704 Y146.433 E.01831
G2 X120.08 Y146.161 I-.881 J-8.07 E.05767
G1 X120.383 Y146.023 E.01367
; WIPE_START
G1 X120.08 Y146.161 E-.12649
G1 X119.326 Y146.34 E-.29447
G1 X118.704 Y146.433 E-.23898
G1 X118.441 Y146.417 E-.10006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.301 Y142.794 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.613419
G1 F4647.188
M204 S6000
G1 X115.379 Y143.474 E.04322
; LINE_WIDTH: 0.581849
G1 F4928.374
G1 X115.431 Y143.671 E.01211
; LINE_WIDTH: 0.551328
G1 F5234.567
G1 X115.483 Y143.867 E.01141
; LINE_WIDTH: 0.516208
G1 F5637.615
G1 X115.586 Y144.105 E.01346
; LINE_WIDTH: 0.476489
G1 F6175.381
G1 X115.688 Y144.342 E.01229
; LINE_WIDTH: 0.437834
G1 F6807.313
G1 X115.826 Y144.567 E.01137
; LINE_WIDTH: 0.393009
G1 F7723.86
G2 X116.599 Y145.438 I2.373 J-1.33 E.04456
G1 X117.143 Y145.768 E.02416
G1 X117.736 Y145.976 E.02386
; LINE_WIDTH: 0.389074
G1 F7816.248
G1 X118.013 Y146.034 E.01063
; LINE_WIDTH: 0.35396
G1 F8750.194
G2 X118.661 Y146.096 I.481 J-1.611 E.02194
; LINE_WIDTH: 0.396619
G1 F7641.008
G1 X119.266 Y145.989 E.02359
; LINE_WIDTH: 0.436909
G1 F6824.023
G1 X119.583 Y145.903 E.01413
; WIPE_START
G1 X119.266 Y145.989 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.729 Y139.225 Z.88 F42000
G1 X115.542 Y138.867 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.474508
G1 F6204.886
M204 S6000
G2 X115.534 Y138.957 I-.026 J.043 E.00958
M204 S10000
G1 X116.29 Y138.912 F42000
; LINE_WIDTH: 0.38556
G1 F7900.63
M204 S6000
G1 X116.113 Y138.863 E.00681
G1 X115.786 Y138.634 E.01484
G1 X115.438 Y137.945 E.02867
G1 X115.425 Y137.73 E.00799
G1 X115.425 Y135.151 E.09575
G1 X115.108 Y135.151 E.01177
G2 X115.129 Y138.912 I103.468 J1.289 E.13966
G2 X115.108 Y142.122 I88.293 J2.196 E.11921
; LINE_WIDTH: 0.370234
G1 F8291.053
G1 X115.129 Y142.409 E.01017
; LINE_WIDTH: 0.385639
G1 F7898.721
G1 X115.157 Y142.473 E.00261
; LINE_WIDTH: 0.430019
G1 F6951.122
G1 X115.186 Y142.537 E.00297
; LINE_WIDTH: 0.474398
G1 F6206.533
G1 X115.215 Y142.601 E.00332
; LINE_WIDTH: 0.518779
G1 F5606.027
G1 X115.244 Y142.665 E.00368
; LINE_WIDTH: 0.563159
G1 F5111.473
G1 X115.272 Y142.729 E.00403
; LINE_WIDTH: 0.607539
G1 F4697.102
G1 X115.301 Y142.794 E.00439
G1 X115.323 Y142.727 E.00437
; LINE_WIDTH: 0.563159
G1 F5111.473
G1 X115.344 Y142.66 E.00402
; LINE_WIDTH: 0.518779
G1 F5606.027
G1 X115.366 Y142.594 E.00366
; LINE_WIDTH: 0.474398
G1 F6206.533
G1 X115.388 Y142.527 E.00331
; LINE_WIDTH: 0.430019
G1 F6951.122
G1 X115.41 Y142.461 E.00296
; LINE_WIDTH: 0.376472
G1 F8127.568
G1 X115.431 Y142.394 E.00253
G3 X115.425 Y140.094 I47.379 J-1.29 E.08302
; LINE_WIDTH: 0.406016
G1 F7433.422
G1 X115.786 Y139.19 E.03843
G1 X116.113 Y138.961 E.01577
G1 X116.232 Y138.928 E.00487
; WIPE_START
G1 X116.113 Y138.961 E-.06261
G1 X115.786 Y139.19 E-.20291
G1 X115.425 Y140.094 E-.49448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.04 Y139.586 Z.88 F42000
G1 X126.662 Y139.344 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X126.655 Y139.313 E.00143
G3 X126.81 Y137.347 I2.057 J-.827 E.09093
G3 X128.489 Y136.301 I1.833 J1.072 E.09153
G3 X129.128 Y136.354 I.123 J2.418 E.02862
G3 X130.738 Y138.796 I-.551 J2.115 E.14253
G3 X128.625 Y140.68 I-2.139 J-.273 E.13736
G3 X127.957 Y140.57 I.209 J-3.371 E.03017
G3 X126.807 Y139.62 I.755 J-2.084 E.06768
G1 X126.69 Y139.397 E.01119
M204 S10000
G1 X127.005 Y139.175 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X126.898 Y138.217 I1.68 J-.673 E.04008
G3 X128.53 Y136.674 I1.743 J.209 E.10009
G3 X129.049 Y136.721 I.07 J2.123 E.02145
G3 X130.366 Y138.749 I-.473 J1.748 E.10872
G3 X128.204 Y140.247 I-1.738 J-.2 E.12217
G3 X127.028 Y139.23 I.481 J-1.745 E.06597
; WIPE_START
M204 S6000
G1 X126.922 Y138.913 E-.12714
G1 X126.871 Y138.483 E-.1647
G1 X126.898 Y138.217 E-.10156
G1 X126.957 Y137.914 E-.11731
G1 X127.055 Y137.671 E-.09922
G1 X127.219 Y137.414 E-.11614
G1 X127.274 Y137.343 E-.03392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.994 Y136.51 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X124.072 Y136.353 E.0078
G3 X124.74 Y135.37 I4.411 J2.283 E.05298
G1 X125.072 Y134.971 E.02309
G3 X126.631 Y133.898 I5.063 J5.688 E.08442
G3 X128.569 Y133.512 I2.181 J5.892 E.08826
G3 X128.745 Y133.516 I.078 J.472 E.00784
G3 X130.644 Y133.898 I-.236 J6.075 E.08654
G3 X132.195 Y134.966 I-3.517 J6.774 E.08398
G3 X133.274 Y136.508 I-5.509 J5.003 E.08397
G1 X133.299 Y136.566 E.00278
G3 X133.616 Y137.977 I-4.628 J1.78 E.06456
G1 X133.667 Y138.494 E.02311
G3 X133.311 Y140.382 I-6.498 J-.247 E.08581
G3 X132.53 Y141.612 I-4.56 J-2.033 E.06504
G3 X131.83 Y142.317 I-2.171 J-1.456 E.04448
G3 X130.39 Y143.184 I-3.08 J-3.489 E.07515
G3 X128.729 Y143.46 I-2.156 J-7.82 E.07503
G3 X126.809 Y143.138 I.35 J-7.96 E.08683
G1 X126.748 Y143.114 E.00288
G3 X125.481 Y142.346 I2.021 J-4.767 E.06617
G1 X125.068 Y142.022 E.02333
G3 X124.061 Y140.644 I5.869 J-5.346 E.07607
G3 X123.646 Y139.026 I4.195 J-1.936 E.0747
G1 X123.595 Y138.495 E.02375
G3 X123.934 Y136.646 I7.421 J.405 E.08384
G1 X123.958 Y136.589 E.00275
G1 X123.969 Y136.564 E.0012
M204 S10000
G1 X123.66 Y136.354 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X124.449 Y135.134 I4.581 J2.099 E.05986
G1 X124.807 Y134.703 E.02301
G3 X126.305 Y133.638 I5.815 J6.59 E.07561
G3 X128.082 Y133.183 I2.15 J4.705 E.07572
G3 X128.781 Y133.143 I.528 J3.042 E.0288
G3 X130.796 Y133.555 I-.269 J6.434 E.08482
G3 X132.03 Y134.348 I-2.825 J5.755 E.06037
G1 X132.46 Y134.698 E.02277
G3 X133.533 Y136.18 I-6.387 J5.75 E.07526
G3 X133.988 Y137.935 I-4.238 J2.037 E.07492
G1 X134.044 Y138.494 E.02305
G3 X133.749 Y140.277 I-8.655 J-.514 E.07436
G3 X132.823 Y141.847 I-4.767 J-1.756 E.07523
G1 X132.481 Y142.264 E.02215
G3 X131.018 Y143.326 I-5.761 J-6.398 E.07434
G3 X129.271 Y143.782 I-2.113 J-4.513 E.07454
G1 X128.732 Y143.837 E.02228
G3 X126.871 Y143.554 I.442 J-9.162 E.07742
G3 X125.253 Y142.644 I1.553 J-4.657 E.07668
G1 X124.806 Y142.293 E.02334
G3 X123.726 Y140.814 I6.214 J-5.667 E.07533
G3 X123.274 Y139.067 I4.546 J-2.11 E.07449
G1 X123.218 Y138.494 E.02365
G3 X123.519 Y136.692 I8.567 J.505 E.07515
G3 X123.635 Y136.409 I4.721 J1.761 E.01258
; WIPE_START
M204 S6000
G1 X123.834 Y135.999 E-.17306
G1 X124.091 Y135.603 E-.17937
G1 X124.449 Y135.134 E-.22414
G1 X124.757 Y134.763 E-.18343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.078 Y139.042 Z.88 F42000
G1 X131.08 Y139.043 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X130.769 Y139.83 I-2.09 J-.368 E.035
G1 X130.437 Y140.281 E.02299
G1 X129.976 Y140.654 E.02433
G1 X129.586 Y140.867 E.01824
G1 X129.197 Y140.984 E.0167
G1 X128.647 Y141.055 E.02277
G1 X128.06 Y140.983 E.02425
G1 X127.637 Y140.851 E.01821
G1 X127.283 Y140.653 E.01666
G1 X126.854 Y140.31 E.02255
G1 X126.493 Y139.831 E.0246
G3 X126.119 Y138.502 I2.422 J-1.4 E.05729
G1 X126.185 Y137.92 E.02408
G3 X126.5 Y137.135 I2.08 J.378 E.03494
G1 X126.831 Y136.691 E.02276
G1 X127.28 Y136.323 E.02382
G1 X127.666 Y136.106 E.01819
G1 X128.054 Y135.987 E.01665
G1 X128.604 Y135.912 E.02282
G1 X129.022 Y135.955 E.01724
G1 X129.579 Y136.102 E.02365
G1 X129.973 Y136.317 E.01842
G1 X130.402 Y136.661 E.02257
G1 X130.762 Y137.134 E.0244
G3 X131.143 Y138.46 I-2.401 J1.408 E.05724
G1 X131.086 Y138.983 E.02161
M204 S10000
G1 X131.437 Y139.085 F42000
G1 F7144.644
M204 S6000
G1 X131.302 Y139.578 E.02098
G3 X130.73 Y140.49 I-3.209 J-1.377 E.04443
G1 X130.2 Y140.935 E.02841
G1 X129.692 Y141.211 E.02373
G3 X128.69 Y141.412 I-1.157 J-3.162 E.0421
G1 X128.013 Y141.34 E.02796
G1 X127.517 Y141.192 E.02127
G1 X127.071 Y140.944 E.02094
G1 X126.629 Y140.591 E.02321
G1 X126.204 Y140.045 E.02842
G1 X125.965 Y139.591 E.02108
G3 X125.761 Y138.545 I3.314 J-1.187 E.04392
G1 X125.828 Y137.876 E.0276
G1 X125.962 Y137.392 E.02062
G3 X126.952 Y136.125 I2.827 J1.188 E.0668
G1 X127.437 Y135.818 E.02357
G1 X127.915 Y135.65 E.02078
G1 X128.556 Y135.555 E.02662
G1 X129.091 Y135.602 E.02205
G1 X129.671 Y135.754 E.0246
G1 X130.123 Y135.986 E.02086
G1 X130.627 Y136.38 E.02629
G1 X131.05 Y136.919 E.02812
G1 X131.296 Y137.383 E.02157
G3 X131.443 Y139.025 I-2.947 J1.091 E.0685
M204 S10000
G1 X131.876 Y139.136 F42000
; LINE_WIDTH: 0.566144
G1 F5081.32
M204 S6000
G1 X131.743 Y139.655 E.03091
G1 X131.494 Y140.17 E.03302
G1 X131.076 Y140.746 E.0411
G1 X130.466 Y141.27 E.04644
G1 X130.001 Y141.543 E.03113
G1 X129.455 Y141.724 E.03318
; LINE_WIDTH: 0.542978
G1 F5325.09
G1 X128.748 Y141.824 E.03937
G1 X127.959 Y141.75 E.04363
G1 X127.441 Y141.61 E.02954
G1 X126.93 Y141.353 E.03154
G1 X126.363 Y140.925 E.03913
G1 X126.185 Y140.746 E.01391
G1 X125.852 Y140.305 E.03044
; LINE_WIDTH: 0.574289
G1 F5000.831
G1 X125.59 Y139.837 E.03144
G1 X125.415 Y139.292 E.03362
G1 X125.322 Y138.597 E.04113
G1 X125.39 Y137.822 E.04563
G1 X125.525 Y137.304 E.03139
G1 X125.778 Y136.792 E.03353
G3 X126.196 Y136.224 I4.501 J2.872 E.04137
G1 X126.685 Y135.794 E.0382
G1 X127.229 Y135.448 E.03781
; LINE_WIDTH: 0.54391
G1 F5314.834
G1 X127.79 Y135.255 E.03275
G3 X128.734 Y135.142 I1.012 J4.491 E.05261
G3 X129.779 Y135.344 I-.325 J4.485 E.05884
G1 X130.329 Y135.614 E.03385
G1 X130.893 Y136.048 E.03927
G1 X131.066 Y136.221 E.01353
G1 X131.398 Y136.659 E.0303
; LINE_WIDTH: 0.582126
G1 F4925.755
G1 X131.663 Y137.124 E.03186
G1 X131.841 Y137.667 E.03403
G1 X131.939 Y138.361 E.04179
G1 X131.881 Y139.077 E.04273
M204 S10000
G1 X132.382 Y139.311 F42000
; LINE_WIDTH: 0.571153
G1 F5031.51
M204 S6000
G2 X132.475 Y138.525 I-25.395 J-3.426 E.04611
G1 X132.393 Y137.758 E.04501
G1 X132.243 Y137.159 E.03599
G1 X132.121 Y136.873 E.0181
G2 X130.393 Y135.079 I-3.895 J2.023 E.14727
G1 X129.891 Y134.87 E.03167
; LINE_WIDTH: 0.541698
G1 F5339.241
G2 X128.785 Y134.677 I-1.531 J5.492 E.06179
G2 X126.976 Y135.028 I-.076 J4.448 E.102
G2 X125.803 Y135.921 I2.823 J4.925 E.08126
G1 X125.464 Y136.353 E.03015
; LINE_WIDTH: 0.574193
G1 F5001.765
G1 X125.145 Y136.876 E.03594
G1 X125.02 Y137.161 E.01823
G1 X124.883 Y137.66 E.03036
G2 X125.125 Y140.09 I4.233 J.806 E.1452
G2 X127.029 Y141.955 I3.717 J-1.89 E.15914
; LINE_WIDTH: 0.544132
G1 F5312.387
G2 X128.445 Y142.277 I1.642 J-3.948 E.08057
G1 X128.807 Y142.292 E.01998
G2 X130.244 Y141.975 I-.493 J-5.662 E.08152
G1 X130.7 Y141.713 E.02905
G2 X131.815 Y140.611 I-2.363 J-3.507 E.08704
; LINE_WIDTH: 0.581885
G1 F4928.033
G1 X132.131 Y140.083 E.03665
G2 X132.366 Y139.368 I-2.502 J-1.221 E.04491
M204 S10000
G1 X132.816 Y139.416 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X132.917 Y138.578 E.03462
G1 X132.832 Y137.705 E.03604
G1 X132.67 Y137.039 E.02812
G1 X132.573 Y136.775 E.01157
G1 X132.265 Y136.237 E.02544
G1 X131.674 Y135.491 E.03907
G1 X130.916 Y134.901 E.03947
G1 X130.392 Y134.61 E.02459
G1 X129.979 Y134.456 E.01809
G2 X128.635 Y134.244 I-1.696 J6.395 E.05598
G2 X127.314 Y134.44 I2.025 J18.191 E.05484
G1 X126.806 Y134.632 E.02229
G2 X125.595 Y135.494 I3.528 J6.237 E.06111
G1 X125.004 Y136.238 E.03904
G1 X124.64 Y136.874 E.03008
G1 X124.45 Y137.553 E.02898
G1 X124.335 Y138.496 E.039
G1 X124.447 Y139.445 E.03921
G1 X124.639 Y140.136 E.02948
G1 X124.989 Y140.747 E.02888
G1 X125.584 Y141.491 E.03911
G1 X126.35 Y142.067 E.03937
G1 X127.018 Y142.426 E.03114
G1 X127.742 Y142.614 E.0307
G1 X128.724 Y142.721 E.04056
G1 X129.649 Y142.607 E.03824
G1 X130.345 Y142.411 E.02973
G1 X130.957 Y142.058 E.029
G1 X131.689 Y141.477 E.03836
G1 X132.265 Y140.743 E.03832
G1 X132.627 Y140.101 E.03028
G1 X132.8 Y139.473 E.0267
M204 S10000
G1 X133.17 Y139.485 F42000
G1 F7144.644
M204 S6000
G1 X133.274 Y138.622 E.03572
G2 X133.168 Y137.485 I-7.825 J.157 E.0469
G1 X132.951 Y136.711 E.033
G1 X132.564 Y136.035 E.03201
G1 X131.929 Y135.234 E.04196
G1 X131.123 Y134.606 E.04195
G1 X130.538 Y134.281 E.02747
G1 X130.054 Y134.104 E.02117
G2 X128.636 Y133.882 I-1.78 J6.742 E.05902
G2 X127.219 Y134.091 I.842 J10.626 E.05887
G1 X126.643 Y134.309 E.02526
G2 X125.339 Y135.238 I3.805 J6.722 E.06587
G1 X124.705 Y136.035 E.04184
G1 X124.305 Y136.734 E.03305
G1 X124.096 Y137.483 E.03193
G1 X123.973 Y138.496 E.04189
G1 X124.093 Y139.514 E.04212
G1 X124.305 Y140.276 E.03246
G1 X124.69 Y140.95 E.03188
G1 X125.331 Y141.751 E.04213
G1 X126.156 Y142.371 E.04235
G1 X126.886 Y142.764 E.03404
G1 X127.677 Y142.969 E.03356
G1 X128.726 Y143.083 E.04334
G1 X129.72 Y142.961 E.04108
G1 X130.486 Y142.745 E.03271
G1 X131.16 Y142.357 E.03194
G1 X131.946 Y141.732 E.0412
G1 X132.565 Y140.944 E.04117
G1 X132.963 Y140.239 E.03323
G1 X133.154 Y139.543 E.02963
; WIPE_START
G1 X132.963 Y140.239 E-.27418
G1 X132.565 Y140.944 E-.30754
G1 X132.275 Y141.313 E-.17828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.872 Y140.574 Z.88 F42000
G1 X141.207 Y140.444 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X141.207 Y143.423 E.1325
G3 X139.07 Y143.23 I-.582 J-5.482 E.09607
G3 X137.961 Y142.553 I1.234 J-3.27 E.05816
G1 X137.628 Y142.272 E.01937
G3 X136.77 Y140.79 I4.559 J-3.63 E.07644
G3 X136.512 Y138.959 I7.209 J-1.947 E.08248
G1 X136.512 Y133.718 E.23312
G1 X139.353 Y133.718 E.12634
G1 X139.353 Y138.211 E.19988
G2 X139.545 Y139.496 I3.327 J.157 E.05817
G2 X140.565 Y140.335 I1.478 J-.758 E.06037
G1 X140.969 Y140.474 E.01901
G1 X141.148 Y140.452 E.00803
M204 S10000
G1 X141.582 Y139.974 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X141.582 Y143.748 E.15498
G3 X138.947 Y143.584 I-.963 J-5.78 E.10936
G3 X137.723 Y142.843 I1.358 J-3.623 E.05908
G1 X137.349 Y142.527 E.02012
G3 X136.415 Y140.911 I4.91 J-3.916 E.07694
G3 X136.167 Y139.461 I5.974 J-1.766 E.06054
G1 X136.137 Y138.97 E.02019
G1 X136.137 Y133.343 E.23104
G1 X139.727 Y133.343 E.1474
G1 X139.727 Y138.207 E.19972
G2 X139.886 Y139.339 I2.999 J.156 E.04722
G2 X140.696 Y139.983 I1.148 J-.612 E.04369
G1 X141.009 Y140.091 E.01359
G2 X141.526 Y139.994 I-.055 J-1.723 E.0217
; WIPE_START
M204 S6000
G1 X141.556 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.939 Y138.564 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.377688
G1 F8096.438
M204 S6000
G1 X137.97 Y138.989 E.01543
; LINE_WIDTH: 0.405529
G1 F7443.923
G1 X138.001 Y139.413 E.01678
; LINE_WIDTH: 0.442208
G1 F6729.375
G1 X138.066 Y139.705 E.01301
; LINE_WIDTH: 0.487729
G1 F6013.069
G1 X138.131 Y139.996 E.01456
; LINE_WIDTH: 0.527255
G1 F5504.306
G1 X138.188 Y140.144 E.00846
; LINE_WIDTH: 0.560789
G1 F5135.667
G1 X138.246 Y140.292 E.00906
; LINE_WIDTH: 0.604857
G1 F4720.226
G2 X138.399 Y140.601 I.996 J-.301 E.02153
M204 S10000
G1 X139.759 Y141.564 F42000
; LINE_WIDTH: 0.40164
G1 F7528.672
M204 S6000
G1 X139.235 Y141.268 E.02345
G1 X138.909 Y141.013 E.01614
G1 X138.777 Y140.866 E.00768
; LINE_WIDTH: 0.398182
G1 F7605.662
G1 X138.708 Y140.823 E.00315
; LINE_WIDTH: 0.44669
G1 F6651.359
G1 X138.638 Y140.781 E.0036
; LINE_WIDTH: 0.495199
G1 F5909.836
G1 X138.569 Y140.738 E.00405
; LINE_WIDTH: 0.543706
G1 F5317.066
G1 X138.499 Y140.695 E.0045
; LINE_WIDTH: 0.592215
G1 F4832.368
G1 X138.429 Y140.653 E.00496
G1 X138.451 Y140.735 E.00516
; LINE_WIDTH: 0.543706
G1 F5317.066
G1 X138.472 Y140.817 E.00469
; LINE_WIDTH: 0.495199
G1 F5909.836
G1 X138.493 Y140.899 E.00422
; LINE_WIDTH: 0.44669
G1 F6651.359
G1 X138.514 Y140.982 E.00375
; LINE_WIDTH: 0.40349
G1 F7488.118
G1 X138.536 Y141.064 E.00333
G1 X138.796 Y141.366 E.0156
G1 X139.344 Y141.754 E.02635
G1 X139.759 Y141.904 E.01727
G1 X139.759 Y141.624 E.01096
M204 S10000
G1 X140.113 Y141.328 F42000
; LINE_WIDTH: 0.419997
G1 F7144.673
M204 S6000
G3 X139.229 Y140.839 I1.813 J-4.319 E.04155
G1 X138.854 Y140.457 E.02198
G1 X138.58 Y140.014 E.02139
G1 X138.393 Y139.506 E.02222
G3 X138.27 Y138.551 I3.769 J-.97 E.03963
; LINE_WIDTH: 0.444235
G1 F6693.872
G1 X138.242 Y138.422 E.00579
; LINE_WIDTH: 0.492709
G1 F5943.851
G1 X138.214 Y138.293 E.00652
; LINE_WIDTH: 0.564974
G1 F5093.096
G1 X138.185 Y138.164 E.00761
G1 X138.185 Y134.885 E.18887
G1 X137.68 Y134.885 E.02911
G1 X137.68 Y138.164 E.18887
; LINE_WIDTH: 0.541182
G1 F5344.969
G1 X137.656 Y138.297 E.00744
; LINE_WIDTH: 0.492709
G1 F5943.851
G1 X137.631 Y138.431 E.00669
; LINE_WIDTH: 0.420537
G1 F7133.972
G1 X137.607 Y138.564 E.00557
G1 X137.643 Y139.438 E.03597
G2 X137.808 Y140.414 I6.848 J-.655 E.04074
G2 X138.369 Y141.417 I4.531 J-1.878 E.04737
G1 X138.575 Y141.634 E.01229
G1 X139.145 Y142.054 E.02913
G1 X139.569 Y142.228 E.01886
G1 X140.113 Y142.319 E.02266
G1 X140.113 Y141.388 E.03828
M204 S10000
G1 X140.473 Y141.076 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X139.458 Y140.561 I1.317 J-3.855 E.04687
G1 X139.105 Y140.192 E.02096
G1 X138.856 Y139.751 E.0208
G1 X138.712 Y139.302 E.01938
G3 X138.618 Y138.164 I7.615 J-1.205 E.04691
G1 X138.618 Y134.453 E.1524
G1 X137.247 Y134.453 E.05628
G1 X137.247 Y138.933 E.18398
G2 X137.43 Y140.432 I7.335 J-.136 E.06209
G2 X138.175 Y141.771 I5.848 J-2.377 E.06307
G2 X139.107 Y142.438 I2.951 J-3.135 E.04719
G1 X139.501 Y142.581 E.01724
G1 X140.473 Y142.714 E.04025
G1 X140.473 Y141.136 E.06479
M204 S10000
G1 X140.833 Y140.824 F42000
; LINE_WIDTH: 0.419998
G1 F7144.653
M204 S6000
G1 X140.238 Y140.608 E.02596
G1 X139.782 Y140.342 E.02169
G1 X139.412 Y140.002 E.02062
G3 X139.068 Y139.246 I1.584 J-1.178 E.03437
G3 X138.978 Y138.164 I7.238 J-1.148 E.0446
G1 X138.978 Y134.093 E.16717
G1 X136.887 Y134.093 E.08583
G1 X136.887 Y138.946 E.19926
G2 X137.081 Y140.526 I7.736 J-.148 E.06549
G2 X137.907 Y142.016 I5.33 J-1.979 E.07022
G2 X138.853 Y142.724 I3.945 J-4.287 E.04858
G1 X139.321 Y142.913 E.02072
G2 X140.586 Y143.086 I1.511 J-6.352 E.05253
G1 X140.833 Y143.071 E.01014
G1 X140.833 Y140.884 E.08979
; WIPE_START
G1 X140.833 Y142.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.475 Y138.749 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X144.434 Y138.054 E.05565
G3 X143.702 Y137.3 I1.757 J-2.438 E.04699
G3 X143.417 Y135.974 I2.359 J-1.201 E.06103
G1 X143.417 Y133.718 E.10035
G1 X146.257 Y133.718 E.12634
G1 X146.257 Y136.533 E.12522
G2 X146.47 Y137.453 I2.092 J.001 E.0424
G2 X147.262 Y137.984 I1.063 J-.73 E.04343
G1 X147.608 Y138.072 E.01588
G2 X148.473 Y137.705 I-.484 J-2.341 E.04204
G2 X148.94 Y136.617 I-.932 J-1.044 E.05438
G1 X148.95 Y133.718 E.12897
G1 X151.79 Y133.718 E.12634
G1 X151.79 Y136.126 E.10711
G3 X151.557 Y137.42 I-2.953 J.137 E.059
G3 X150.981 Y138.096 I-1.961 J-1.087 E.03977
G1 X150.084 Y138.764 E.04973
G1 X150.991 Y139.433 E.05014
G3 X151.765 Y140.943 I-1.318 J1.629 E.07772
G3 X151.79 Y141.483 I-8.184 J.64 E.02403
G1 X151.79 Y143.238 E.07805
G1 X148.95 Y143.238 E.12634
G1 X148.95 Y141.096 E.09525
G2 X148.732 Y140.173 I-1.926 J-.033 E.04265
G2 X147.948 Y139.649 I-1.058 J.736 E.04293
G1 X147.635 Y139.572 E.01432
G2 X146.596 Y140.067 I.03 J1.401 E.05279
G2 X146.257 Y141.101 I1.355 J1.016 E.04924
G1 X146.257 Y143.238 E.09506
G1 X143.417 Y143.238 E.12634
M73 P74 R3
G1 X143.417 Y141.636 E.07126
G3 X143.704 Y140.273 I2.828 J-.116 E.06257
G3 X144.457 Y139.465 I2.626 J1.693 E.0494
G1 X145.426 Y138.784 E.05267
M204 S10000
G1 X144.812 Y138.757 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X143.816 Y138.031 I3.209 J-5.449 E.05069
G3 X143.375 Y137.488 I3.633 J-3.399 E.02875
G3 X143.042 Y135.981 I2.709 J-1.388 E.06407
G1 X143.042 Y133.343 E.10832
G1 X146.632 Y133.343 E.1474
G1 X146.632 Y136.518 E.13039
G2 X146.851 Y137.341 I1.436 J.059 E.03548
G2 X147.598 Y137.683 I.914 J-1.011 E.03429
G2 X148.339 Y137.318 I-.312 J-1.568 E.03428
G2 X148.566 Y136.591 I-.982 J-.705 E.03182
G1 X148.575 Y133.343 E.13336
G1 X152.165 Y133.343 E.1474
G1 X152.165 Y136.132 E.11451
G3 X151.896 Y137.586 I-3.355 J.131 E.06124
G3 X151.212 Y138.392 I-2.357 J-1.307 E.04366
G1 X150.714 Y138.763 E.0255
G3 X151.548 Y139.439 I-2.622 J4.085 E.04418
G3 X151.89 Y139.942 I-2.886 J2.329 E.02497
G3 X152.165 Y141.478 I-3.356 J1.394 E.06458
G1 X152.165 Y143.613 E.08766
G1 X148.575 Y143.613 E.1474
G1 X148.575 Y141.112 E.10268
G2 X148.351 Y140.287 I-1.419 J-.058 E.03566
G2 X147.615 Y139.953 I-.902 J1.01 E.03371
G2 X146.69 Y140.693 I.027 J.981 E.05223
G2 X146.632 Y141.114 I1.759 J.456 E.01745
G1 X146.632 Y143.613 E.10261
G1 X143.042 Y143.613 E.1474
G1 X143.042 Y141.629 E.08146
G3 X143.375 Y140.088 I3.239 J-.106 E.06538
G3 X144.235 Y139.163 I3.023 J1.949 E.0521
G1 X144.763 Y138.792 E.02651
; WIPE_START
M204 S6000
G1 X144.217 Y138.36 E-.2644
G1 X143.816 Y138.031 E-.19721
G1 X143.655 Y137.854 E-.09104
G1 X143.375 Y137.488 E-.175
G1 X143.341 Y137.41 E-.03235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.848 Y140.672 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.549368
G1 F5255.542
M204 S6000
G2 X144.626 Y141.129 I.813 J.677 E.02864
G2 X144.585 Y142.07 I6.71 J.765 E.05266
G1 X145.09 Y142.07 E.02821
G3 X145.147 Y140.607 I11.317 J-.295 E.08182
G1 X145.203 Y140.352 E.01456
G1 X144.892 Y140.631 E.02333
M204 S10000
G1 X144.512 Y140.42 F42000
; LINE_WIDTH: 0.418997
G1 F7164.587
M204 S6000
G1 X144.324 Y140.713 E.01426
G1 X144.208 Y141.088 E.01605
G2 X144.152 Y142.503 I7.231 J.997 E.05807
G1 X145.523 Y142.503 E.05612
G1 X145.523 Y141.091 E.05781
G1 X145.582 Y140.555 E.02209
G1 X145.699 Y140.187 E.01579
G1 X145.979 Y139.691 E.02333
; LINE_WIDTH: 0.375299
G1 F8157.827
G1 X146.357 Y139.337 E.01862
; LINE_WIDTH: 0.372326
G1 F8235.489
G1 X146.461 Y139.25 E.00483
; LINE_WIDTH: 0.410521
G1 F7337.871
G1 X146.565 Y139.163 E.00542
; LINE_WIDTH: 0.448716
G1 F6616.692
G1 X146.668 Y139.076 E.00601
; LINE_WIDTH: 0.507267
G1 F5750.346
G1 X146.772 Y138.989 E.00691
G3 X147.404 Y138.822 I.723 J1.456 E.03356
G1 X146.87 Y138.677 E.02823
G1 X146.298 Y138.398 E.03247
G1 X146.368 Y138.54 E.00811
G1 X146.4 Y138.796 E.01313
; LINE_WIDTH: 0.486911
G1 F6024.586
G1 X146.34 Y138.877 E.00491
; LINE_WIDTH: 0.448716
G1 F6616.692
G1 X146.28 Y138.958 E.00447
; LINE_WIDTH: 0.410521
G1 F7337.871
G1 X146.22 Y139.039 E.00403
; LINE_WIDTH: 0.374843
G1 F8169.64
G1 X146.16 Y139.12 E.00362
G1 X145.72 Y139.461 E.02
; LINE_WIDTH: 0.415655
G1 F7231.914
G1 X145.26 Y139.799 E.02311
G2 X144.556 Y140.379 I1.959 J3.097 E.03713
M204 S10000
G1 X144.278 Y140.132 F42000
; LINE_WIDTH: 0.419998
G1 F7144.649
M204 S6000
G1 X144.037 Y140.455 E.01655
G1 X143.863 Y140.921 E.02042
G1 X143.792 Y141.649 E.03005
G1 X143.792 Y142.863 E.04982
G1 X145.883 Y142.863 E.08583
G1 X145.883 Y141.091 E.07275
G1 X145.944 Y140.597 E.02045
G1 X146.015 Y140.358 E.01024
G1 X146.286 Y139.856 E.02339
G1 X146.659 Y139.504 E.02108
G1 X147.102 Y139.284 E.02029
G1 X147.613 Y139.195 E.02134
G1 X148.22 Y139.341 E.02562
G1 X148.626 Y139.537 E.01852
G1 X148.929 Y139.805 E.0166
G1 X149.067 Y140.004 E.00991
G1 X149.225 Y140.382 E.01683
G1 X149.323 Y141.063 E.02825
G3 X149.325 Y142.863 I-375.258 J1.277 E.0739
G1 X151.415 Y142.863 E.08583
G2 X151.392 Y140.986 I-21.734 J-.674 E.07709
G1 X151.25 Y140.389 E.02519
G1 X151.039 Y140.006 E.01798
G1 X150.788 Y139.758 E.01449
G1 X149.651 Y138.908 E.05828
G1 X149.579 Y138.771 E.00634
G1 X149.625 Y138.643 E.0056
G3 X150.746 Y137.804 I99.823 J132.218 E.05749
G2 X151.218 Y137.251 I-1.61 J-1.851 E.02997
G1 X151.378 Y136.711 E.0231
G1 X151.405 Y136.373 E.01394
G1 X151.414 Y134.093 E.09362
G1 X149.325 Y134.093 E.08577
G1 X149.325 Y136.379 E.09386
G1 X149.286 Y136.922 E.02236
G3 X149.022 Y137.654 I-1.765 J-.224 E.03225
G1 X148.687 Y138.013 E.02012
G1 X148.311 Y138.221 E.01766
G1 X147.669 Y138.445 E.02794
G1 X147.564 Y138.448 E.00429
G1 X146.976 Y138.288 E.02502
G1 X146.548 Y138.069 E.01976
G1 X146.257 Y137.802 E.01622
G1 X146.044 Y137.438 E.01729
G1 X145.933 Y137.045 E.01678
G1 X145.883 Y136.543 E.02071
G1 X145.883 Y134.093 E.10061
G1 X143.794 Y134.093 E.08577
G1 X143.802 Y136.214 E.0871
G1 X143.893 Y136.74 E.02192
G1 X144.031 Y137.113 E.01633
G1 X144.288 Y137.421 E.01644
G1 X144.706 Y137.785 E.02276
G1 X145.919 Y138.595 E.05992
G1 X145.988 Y138.682 E.00455
G1 X145.986 Y138.813 E.00537
G1 X145.682 Y139.062 E.01613
G1 X144.687 Y139.763 E.04998
G1 X144.323 Y140.092 E.02015
; WIPE_START
G1 X144.687 Y139.763 E-.18652
G1 X145.682 Y139.062 E-.46257
G1 X145.908 Y138.877 E-.11091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.157 Y137.145 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556764
G1 F5177.286
M204 S6000
G3 X145.091 Y135.135 I13.681 J-1.455 E.11403
G1 X145.091 Y134.884 E.01424
G1 X144.588 Y134.884 E.02853
G3 X144.592 Y136.151 I-640.551 J2.665 E.07182
G1 X144.628 Y136.468 E.01807
G1 X144.788 Y136.813 E.02157
G1 X145.113 Y137.105 E.02471
M204 S10000
G1 X145.846 Y138.077 F42000
; LINE_WIDTH: 0.494546
G1 F5918.712
M204 S6000
G1 X145.931 Y138.117 E.00468
; LINE_WIDTH: 0.521801
G1 F5569.329
G1 X146.016 Y138.158 E.00498
; LINE_WIDTH: 0.51619
G1 F5637.841
G1 X145.929 Y137.994 E.00965
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X145.842 Y137.83 E.00884
; LINE_WIDTH: 0.420412
G1 F7136.446
G1 X145.755 Y137.667 E.00763
G1 X145.595 Y137.185 E.02085
G3 X145.523 Y136.15 I4.915 J-.864 E.04273
G1 X145.523 Y134.453 E.06979
G1 X144.155 Y134.453 E.05622
G1 X144.162 Y136.192 E.0715
G1 X144.231 Y136.615 E.01763
G1 X144.407 Y137.012 E.01785
G1 X144.857 Y137.448 E.02574
G1 X145.359 Y137.788 E.02495
; LINE_WIDTH: 0.435228
G1 F6854.584
G1 X145.577 Y137.917 E.01082
; LINE_WIDTH: 0.465688
G1 F6339.814
G1 X145.794 Y138.046 E.0117
M204 S10000
G1 X146.016 Y138.158 F42000
; LINE_WIDTH: 0.526658
G1 F5511.346
M204 S6000
G1 X146.232 Y138.338 E.01494
M204 S10000
G1 X147.581 Y138.836 F42000
; LINE_WIDTH: 0.422372
G1 F7097.841
M204 S6000
G1 X147.793 Y138.853 E.00876
G1 X148.314 Y138.993 E.0223
G1 X148.863 Y139.264 E.0253
G1 X149.232 Y139.586 E.02026
G1 X149.396 Y139.859 E.01317
G1 X149.581 Y140.331 E.02093
G1 X149.679 Y141.012 E.02844
G3 X149.685 Y142.503 I-68.867 J.997 E.06163
G1 X151.055 Y142.503 E.05665
G2 X151.025 Y140.981 I-13.645 J-.494 E.06293
G1 X150.882 Y140.426 E.0237
G1 X150.616 Y140.079 E.0181
G2 X149.425 Y139.21 I-13.439 J17.177 E.06094
G1 X149.259 Y138.975 E.01188
G1 X149.219 Y138.786 E.00798
G1 X149.296 Y138.466 E.01361
G3 X150.52 Y137.523 I11.101 J13.154 E.0639
G1 X150.824 Y137.179 E.01896
G1 X150.923 Y136.98 E.00918
G1 X151.041 Y136.443 E.02275
G1 X151.052 Y134.453 E.08226
G1 X149.685 Y134.453 E.05653
G1 X149.685 Y136.379 E.0796
G1 X149.645 Y136.947 E.02356
G1 X149.525 Y137.442 E.02104
G1 X149.293 Y137.9 E.02124
G1 X148.881 Y138.322 E.02436
G1 X148.43 Y138.56 E.02109
G1 X147.64 Y138.822 E.0344
M204 S10000
G1 X148.859 Y138.758 F42000
; LINE_WIDTH: 0.472908
G1 F6228.934
M204 S6000
G2 X148.85 Y138.847 I-.026 J.043 E.00949
M204 S10000
G1 X149.953 Y140.11 F42000
; LINE_WIDTH: 0.554853
G1 F5197.28
M204 S6000
G3 X150.117 Y142.07 I-6.945 J1.568 E.11138
G1 X150.622 Y142.07 E.02852
G2 X150.576 Y140.873 I-8.255 J-.278 E.06767
G1 X150.484 Y140.587 E.01701
G1 X150.32 Y140.384 E.01471
G1 X150.001 Y140.146 E.02243
M204 S10000
G1 X149.99 Y137.384 F42000
; LINE_WIDTH: 0.560412
G1 F5139.537
M204 S6000
G1 X150.362 Y137.084 E.02726
G1 X150.512 Y136.859 E.01544
G1 X150.615 Y136.37 E.02852
G3 X150.619 Y134.884 I811.857 J1.601 E.08482
G1 X150.116 Y134.884 E.02875
G3 X150.115 Y136.369 I-810.726 J.126 E.08477
G1 X150.073 Y136.978 E.03483
G1 X150.002 Y137.325 E.02022
; WIPE_START
G1 X150.073 Y136.978 E-.13465
G1 X150.115 Y136.369 E-.23185
G1 X150.115 Y135.333 E-.3935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.377 Y137.684 Z.88 F42000
G1 X161.879 Y139.142 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X159.477 Y139.142 E.10687
G3 X159.455 Y138.414 I2.909 J-.451 E.03248
G1 X164.521 Y138.414 E.22534
G1 X164.527 Y138.564 E.00667
G3 X164.208 Y140.408 I-7.557 J-.356 E.08347
G1 X164.185 Y140.465 E.00274
G3 X163.421 Y141.684 I-4.46 J-1.946 E.06422
G1 X163.115 Y142.061 E.02157
G3 X161.539 Y143.122 I-4.308 J-4.699 E.08483
G3 X160.117 Y143.426 I-1.742 J-4.664 E.06491
G1 X159.623 Y143.471 E.02208
G3 X157.73 Y143.143 I.362 J-7.719 E.08568
G1 X157.671 Y143.12 E.0028
G3 X156.428 Y142.348 I2.017 J-4.638 E.06534
G1 X156.021 Y142.021 E.02322
G3 X154.947 Y140.473 I5.503 J-4.964 E.08405
G1 X154.923 Y140.416 E.00275
G3 X154.61 Y138.996 I4.686 J-1.778 E.0649
G1 X154.56 Y138.472 E.02344
G3 X154.886 Y136.607 I7.496 J.352 E.08442
G1 X154.909 Y136.549 E.00276
G3 X155.677 Y135.334 I4.481 J1.98 E.06418
G1 X156.005 Y134.935 E.02298
G3 X157.566 Y133.883 I4.965 J5.687 E.08395
G3 X159.52 Y133.511 I2.155 J6.011 E.08885
G3 X159.679 Y133.513 I.074 J.462 E.00711
G3 X161.515 Y133.885 I-.19 J5.649 E.08372
G1 X161.616 Y133.932 E.00493
G3 X162.271 Y134.302 I-4.471 J8.69 E.03349
G1 X160.788 Y136.085 E.10317
G2 X159.709 Y135.726 I-1.327 J2.185 E.05098
G2 X158.606 Y136.051 I.068 J2.267 E.05173
G2 X158.019 Y136.625 I2.378 J3.018 E.03661
G2 X157.487 Y139.071 I3.153 J1.966 E.11355
G2 X158.042 Y140.625 I3.285 J-.298 E.07422
G2 X159.083 Y141.393 I1.78 J-1.324 E.05838
G2 X159.755 Y141.508 I1.112 J-4.449 E.03036
G2 X160.86 Y141.182 I-.355 J-3.232 E.05151
G2 X161.539 Y140.218 I-1.038 J-1.453 E.05345
G1 X161.861 Y139.199 E.04755
M204 S10000
G1 X161.368 Y139.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X159.198 Y139.517 E.08908
G3 X159.152 Y138.039 I2.592 J-.821 E.06148
G1 X164.875 Y138.039 E.23498
G3 X164.818 Y139.411 I-5.076 J.478 E.05656
G3 X163.899 Y141.679 I-4.146 J-.361 E.10198
G3 X163.382 Y142.328 I-13.615 J-10.318 E.03406
G3 X161.92 Y143.361 I-5.629 J-6.413 E.07364
G3 X160.156 Y143.799 I-2.083 J-4.615 E.07504
G1 X159.623 Y143.848 E.02197
G3 X157.786 Y143.559 I.457 J-8.896 E.07649
G3 X156.196 Y142.643 I1.555 J-4.539 E.07579
G1 X155.756 Y142.289 E.02321
G3 X154.687 Y140.8 I6.387 J-5.711 E.0754
G3 X154.237 Y139.036 I4.61 J-2.116 E.07516
G1 X154.183 Y138.472 E.02327
G3 X154.472 Y136.658 I8.648 J.444 E.07557
G3 X155.384 Y135.1 I4.397 J1.53 E.0746
G1 X155.74 Y134.666 E.02303
G3 X157.242 Y133.619 I5.714 J6.599 E.07532
G3 X159.035 Y133.179 I2.129 J4.796 E.07619
G3 X159.713 Y133.14 I.495 J2.671 E.02797
G3 X161.666 Y133.542 I-.189 J5.862 E.08228
G1 X161.777 Y133.594 E.00501
G3 X162.829 Y134.218 I-3.678 J7.394 E.05028
G1 X160.839 Y136.61 E.12775
G2 X159.702 Y136.105 I-1.253 J1.288 E.05215
G2 X158.711 Y136.441 I.03 J1.717 E.04365
G2 X158.329 Y136.84 I2.701 J2.972 E.02271
G2 X157.836 Y138.645 I2.777 J1.727 E.07792
G2 X158.348 Y140.403 I3.029 J.072 E.07636
G2 X159.191 Y141.033 I1.454 J-1.066 E.04387
G2 X159.746 Y141.129 I.963 J-3.916 E.02314
G2 X160.657 Y140.865 I-.19 J-2.363 E.03923
G2 X161.185 Y140.096 I-.823 J-1.129 E.03905
G1 X161.35 Y139.574 E.02246
; WIPE_START
M204 S6000
G1 X159.35 Y139.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.199 Y138.778 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.398159
G1 F7606.201
M204 S6000
G1 X159.639 Y138.778 E.09871
; WIPE_START
G1 X161.639 Y138.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.446 Y134.738 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465223
G1 F6347.091
M204 S6000
G1 X160.175 Y134.692 E.01269
; LINE_WIDTH: 0.450164
G1 F6592.138
G2 X159.05 Y134.691 I-.567 J2.581 E.05045
; LINE_WIDTH: 0.485689
G1 F6041.891
G1 X158.799 Y134.746 E.01251
; LINE_WIDTH: 0.513808
G1 F5667.435
G1 X158.547 Y134.801 E.01334
; LINE_WIDTH: 0.550379
G1 F5244.71
G1 X158.336 Y134.882 E.01267
; LINE_WIDTH: 0.595398
G1 F4803.626
G1 X158.124 Y134.963 E.01383
; WIPE_START
G1 X158.336 Y134.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.361 Y141.175 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.488011
G1 F6009.099
M204 S6000
G1 X162.555 Y140.959 E.01416
; LINE_WIDTH: 0.430609
G1 F6940.052
G1 X162.749 Y140.743 E.01226
G2 X163.165 Y140.035 I-5.749 J-3.851 E.03473
; LINE_WIDTH: 0.444891
G1 F6682.463
G1 X163.207 Y139.801 E.01042
; LINE_WIDTH: 0.471547
G1 F6249.546
G1 X163.248 Y139.568 E.01115
G1 X162.943 Y139.888 E.02075
; LINE_WIDTH: 0.425139
G1 F7044.045
G1 X162.765 Y139.98 E.00836
G1 X162.583 Y140.557 E.0252
; LINE_WIDTH: 0.446096
G1 F6661.603
G1 X162.482 Y140.838 E.01313
; LINE_WIDTH: 0.488011
G1 F6009.099
G1 X162.381 Y141.118 E.01455
; WIPE_START
G1 X162.482 Y140.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.178 Y141.425 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.568352
G1 F5059.245
M204 S6000
G1 X157.333 Y141.558 E.01184
; LINE_WIDTH: 0.530998
G1 F5460.553
G1 X157.488 Y141.691 E.01097
; LINE_WIDTH: 0.493645
G1 F5931.009
G1 X157.643 Y141.824 E.0101
; LINE_WIDTH: 0.453984
G1 F6528.208
G1 X157.835 Y141.951 E.01035
; LINE_WIDTH: 0.412014
G1 F7306.752
G1 X158.027 Y142.078 E.00925
M204 S10000
G1 X155.835 Y139.321 F42000
; LINE_WIDTH: 0.551498
G1 F5232.756
M204 S6000
G1 X155.988 Y139.944 E.03597
; LINE_WIDTH: 0.522026
G1 F5566.616
G1 X156.129 Y140.23 E.01683
; LINE_WIDTH: 0.492461
G1 F5947.253
G1 X156.27 Y140.517 E.01576
; LINE_WIDTH: 0.461884
G1 F6399.852
G1 X156.425 Y140.741 E.01248
; LINE_WIDTH: 0.430294
G1 F6945.959
G1 X156.58 Y140.965 E.0115
; LINE_WIDTH: 0.400979
G1 F7543.28
G1 X156.802 Y141.261 E.01438
; LINE_WIDTH: 0.412405
G1 F7298.638
G1 X156.896 Y141.302 E.00412
; LINE_WIDTH: 0.462297
G1 F6393.269
G1 X156.99 Y141.343 E.00471
; LINE_WIDTH: 0.51219
G1 F5687.727
G1 X157.084 Y141.384 E.00529
; LINE_WIDTH: 0.562082
G1 F5122.432
G1 X157.178 Y141.425 E.00587
; LINE_WIDTH: 0.56418
G1 F5101.117
G1 X157.114 Y141.283 E.00892
; LINE_WIDTH: 0.518482
G1 F5609.65
G1 X157.051 Y141.142 E.00811
; LINE_WIDTH: 0.472785
G1 F6230.802
G1 X156.988 Y141 E.0073
; LINE_WIDTH: 0.43811
G1 F6802.343
G2 X156.643 Y140.329 I-5.056 J2.176 E.03258
; LINE_WIDTH: 0.492461
G1 F5947.253
G1 X156.547 Y140.079 E.0132
; LINE_WIDTH: 0.522026
G1 F5566.616
G1 X156.45 Y139.829 E.0141
; LINE_WIDTH: 0.567724
G1 F5065.5
G3 X156.424 Y137.404 I4.974 J-1.266 E.14181
G1 X156.675 Y136.727 E.04182
; LINE_WIDTH: 0.520141
G1 F5589.424
G1 X156.856 Y136.406 E.01933
; LINE_WIDTH: 0.485606
G1 F6043.062
G1 X157.038 Y136.086 E.01788
; LINE_WIDTH: 0.453059
G1 F6543.575
G1 X157.268 Y135.836 E.01521
; LINE_WIDTH: 0.422498
G1 F7095.358
G1 X157.497 Y135.586 E.01403
; LINE_WIDTH: 0.385763
G1 F7895.689
G1 X157.824 Y135.311 E.01588
; LINE_WIDTH: 0.38693
G1 F7867.498
G1 X157.863 Y135.246 E.00281
; LINE_WIDTH: 0.432175
G1 F6910.844
G1 X157.902 Y135.182 E.0032
; LINE_WIDTH: 0.477419
G1 F6161.619
G1 X157.941 Y135.117 E.00358
; LINE_WIDTH: 0.522662
G1 F5558.957
G1 X157.979 Y135.053 E.00397
; LINE_WIDTH: 0.567906
G1 F5063.681
G1 X158.018 Y134.988 E.00436
G1 X157.944 Y135.003 E.00438
; LINE_WIDTH: 0.522662
G1 F5558.957
G1 X157.87 Y135.018 E.00399
; LINE_WIDTH: 0.477419
G1 F6161.619
G1 X157.796 Y135.034 E.0036
; LINE_WIDTH: 0.432175
G1 F6910.844
G1 X157.722 Y135.049 E.00321
; LINE_WIDTH: 0.401904
G1 F7522.863
G1 X157.648 Y135.064 E.00295
G1 X156.932 Y135.613 E.03519
; LINE_WIDTH: 0.455173
G1 F6508.546
G1 X156.696 Y135.866 E.01555
; LINE_WIDTH: 0.482599
G1 F6086.077
G1 X156.519 Y136.115 E.01477
; LINE_WIDTH: 0.511118
G1 F5701.237
G1 X156.341 Y136.365 E.01577
; LINE_WIDTH: 0.538351
G1 F5376.605
G1 X156.18 Y136.666 E.01864
; LINE_WIDTH: 0.582861
G1 F4918.83
G1 X156.019 Y136.968 E.02038
G1 X155.852 Y137.579 E.0378
G1 X155.753 Y138.439 E.05164
G1 X155.829 Y139.261 E.04922
M204 S10000
G1 X155.411 Y139.423 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X155.606 Y140.133 E.03025
G1 X155.954 Y140.748 E.029
G1 X156.542 Y141.495 E.03902
G1 X157.295 Y142.074 E.03902
G1 X157.947 Y142.434 E.03058
; LINE_WIDTH: 0.438085
G1 F6802.781
G1 X158.147 Y142.469 E.00876
; LINE_WIDTH: 0.474259
G1 F6208.631
G1 X158.347 Y142.503 E.0096
; LINE_WIDTH: 0.504722
G1 F5783.261
G2 X159.6 Y142.695 I4.768 J-26.988 E.06426
G1 X160.528 Y142.591 E.04738
G1 X161.212 Y142.394 E.0361
; LINE_WIDTH: 0.546671
G1 F5284.675
G1 X161.82 Y142.048 E.03885
G1 X162.094 Y141.832 E.01936
; LINE_WIDTH: 0.540407
G1 F5353.592
G1 X162.247 Y141.744 E.00965
; LINE_WIDTH: 0.492243
G1 F5950.246
G1 X162.399 Y141.656 E.00869
; LINE_WIDTH: 0.420726
G1 F7130.227
G1 X162.552 Y141.568 E.00725
G1 X163.035 Y140.966 E.03178
G2 X163.515 Y140.128 I-4.204 J-2.965 E.03976
G1 X163.681 Y139.504 E.0266
G1 X163.721 Y139.149 E.01469
G1 X162.933 Y139.149 E.03241
G1 X162.883 Y139.399 E.01049
G1 X162.651 Y139.647 E.01398
G1 X162.476 Y139.691 E.0074
G3 X162.019 Y140.959 I-6.713 J-1.704 E.05555
; LINE_WIDTH: 0.44408
G1 F6696.574
G1 X161.936 Y141.121 E.00797
; LINE_WIDTH: 0.492243
G1 F5950.246
G1 X161.853 Y141.283 E.00897
; LINE_WIDTH: 0.5394
G1 F5364.835
G1 X161.771 Y141.445 E.00995
G1 X161.36 Y141.79 E.02935
G1 X161.06 Y141.952 E.01864
; LINE_WIDTH: 0.511438
G1 F5697.194
G1 X160.578 Y142.132 E.02648
; LINE_WIDTH: 0.487344
G1 F6018.477
G1 X159.869 Y142.262 E.03514
G1 X159.656 Y142.271 E.01037
G1 X159.067 Y142.186 E.029
; LINE_WIDTH: 0.519278
G1 F5599.923
G1 X158.572 Y142.05 E.02692
; LINE_WIDTH: 0.518948
G1 F5603.951
G1 X158.373 Y141.901 E.01297
; LINE_WIDTH: 0.479369
G1 F6132.963
G1 X158.175 Y141.753 E.01185
; LINE_WIDTH: 0.420247
G1 F7139.721
G1 X157.977 Y141.604 E.01018
G1 X157.496 Y141.116 E.02815
G3 X156.727 Y138.692 I3.576 J-2.468 E.10604
G3 X157.068 Y136.87 I4.594 J-.083 E.07669
G1 X157.379 Y136.263 E.02802
G3 X158.157 Y135.468 I3.477 J2.628 E.04583
G1 X158.641 Y135.205 E.02262
G1 X159.267 Y135.049 E.02651
G1 X159.773 Y134.992 E.02094
G3 X160.592 Y135.172 I-4.766 J23.646 E.03443
G1 X161.126 Y134.529 E.03434
G2 X159.946 Y134.285 I-1.377 J3.684 E.0497
G1 X159.544 Y134.247 E.01661
G2 X158.247 Y134.431 I1.211 J13.254 E.05385
G1 X157.733 Y134.618 E.02247
G2 X156.528 Y135.458 I3.416 J6.187 E.06046
G1 X155.949 Y136.196 E.03854
G1 X155.594 Y136.829 E.0298
G1 X155.409 Y137.515 E.02919
G1 X155.3 Y138.471 E.03954
G1 X155.404 Y139.363 E.03693
M204 S10000
G1 X155.056 Y139.492 F42000
; LINE_WIDTH: 0.419998
G1 F7144.65
M204 S6000
G1 X155.271 Y140.272 E.03321
G1 X155.655 Y140.949 E.03195
G1 X156.287 Y141.753 E.04198
G1 X157.097 Y142.376 E.04199
G1 X157.812 Y142.771 E.03351
G1 X158.584 Y142.976 E.03282
G1 X159.623 Y143.094 E.04294
G1 X160.619 Y142.982 E.04113
G1 X161.397 Y142.773 E.03309
G1 X162.072 Y142.395 E.03175
G1 X162.848 Y141.794 E.04032
G1 X163.449 Y141.02 E.04022
G1 X163.835 Y140.325 E.03266
G1 X164.036 Y139.57 E.03204
G1 X164.124 Y138.789 E.03229
G1 X162.573 Y138.789 E.06366
G1 X162.557 Y139.248 E.01885
G1 X162.479 Y139.33 E.00465
G1 X162.206 Y139.352 E.01126
G1 X161.894 Y140.34 E.04253
G1 X161.665 Y140.846 E.02284
G1 X161.482 Y141.123 E.01363
G1 X161.083 Y141.482 E.02203
G1 X160.498 Y141.74 E.02624
G1 X159.794 Y141.883 E.02949
G1 X159.128 Y141.791 E.0276
G3 X158.073 Y141.194 I.514 J-2.14 E.05042
G1 X157.727 Y140.829 E.02064
G1 X157.326 Y140.023 E.037
G3 X157.21 Y137.539 I4.371 J-1.448 E.10338
G3 X157.698 Y136.429 I4.419 J1.279 E.04993
G1 X158.117 Y135.967 E.02562
G3 X158.767 Y135.543 I1.521 J1.623 E.03203
G3 X159.75 Y135.353 I1.246 J3.804 E.0412
G1 X160.487 Y135.514 E.03097
G1 X160.696 Y135.609 E.00944
G1 X161.698 Y134.405 E.0643
G1 X161.114 Y134.135 E.02643
G2 X159.987 Y133.928 I-1.436 J4.654 E.04714
G1 X159.512 Y133.889 E.0196
G2 X158.155 Y134.081 I1.294 J14.028 E.05627
G1 X157.574 Y134.293 E.02541
G2 X156.271 Y135.202 I3.696 J6.688 E.06531
G1 X155.648 Y135.996 E.04144
G1 X155.258 Y136.692 E.03276
G1 X155.054 Y137.447 E.03211
G1 X154.937 Y138.471 E.04233
G1 X155.049 Y139.432 E.03974
; WIPE_START
G1 X154.937 Y138.471 E-.36782
G1 X155.054 Y137.447 E-.39173
G1 X155.055 Y137.446 E-.00045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.585 Y138.688 Z.88 F42000
G1 X172.436 Y140.314 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X172.523 Y140.214 E.00589
G2 X172.811 Y139.487 I-.934 J-.79 E.0354
G1 X172.838 Y139.197 E.01295
G1 X172.838 Y133.718 E.24372
G1 X175.678 Y133.718 E.12634
G1 X175.678 Y138.759 E.22426
G3 X175.444 Y140.629 I-7.505 J.008 E.08404
G3 X174.723 Y142.013 I-6.271 J-2.387 E.06956
G3 X173.442 Y143.043 I-4.581 J-4.388 E.07332
G3 X171.894 Y143.423 I-1.783 J-3.911 E.0713
G3 X171.047 Y143.415 I-.402 J-2.172 E.03794
G3 X169.455 Y142.923 I.221 J-3.538 E.07481
G3 X168.538 Y142.208 I5.733 J-8.301 E.05173
G3 X167.615 Y140.788 I4.176 J-3.725 E.07565
G3 X167.316 Y139.069 I6.299 J-1.979 E.07786
G1 X167.316 Y133.718 E.23801
G1 X170.157 Y133.718 E.12634
G1 X170.157 Y139.195 E.24363
G2 X170.373 Y140.094 I1.912 J.016 E.04154
G2 X171.172 Y140.616 I1.013 J-.677 E.04366
G1 X171.491 Y140.692 E.0146
G2 X172.293 Y140.424 I-.297 J-2.22 E.03782
G2 X172.389 Y140.35 I-.704 J-1.001 E.00541
M204 S10000
G1 X172.174 Y140.046 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X172.439 Y139.44 I-.633 J-.638 E.0278
G1 X172.463 Y139.179 E.01076
G1 X172.463 Y133.343 E.23964
G1 X176.053 Y133.343 E.1474
G1 X176.053 Y138.768 E.22275
G3 X175.855 Y140.561 I-8.57 J-.041 E.07423
G3 X175.279 Y141.825 I-5.095 J-1.556 E.05719
G1 X175.016 Y142.252 E.02058
G3 X173.615 Y143.375 I-4.923 J-4.705 E.07396
G3 X171.935 Y143.796 I-1.95 J-4.223 E.07154
G1 X171.503 Y143.837 E.01779
G3 X169.895 Y143.558 I.367 J-6.906 E.06719
G3 X168.649 Y142.793 I1.599 J-3.997 E.06031
G1 X168.267 Y142.47 E.02056
G3 X167.335 Y141.088 I4.836 J-4.265 E.0686
G3 X166.986 Y139.596 I4.208 J-1.77 E.06323
G1 X166.941 Y139.085 E.02105
G1 X166.941 Y133.343 E.23577
G1 X170.531 Y133.343 E.1474
G1 X170.531 Y139.178 E.23961
G2 X170.753 Y139.98 I1.403 J.044 E.03465
G1 X170.791 Y140.018 E.00223
G2 X171.492 Y140.307 I.903 J-1.196 E.03147
G2 X172.124 Y140.08 I-.16 J-1.437 E.02785
; WIPE_START
M204 S6000
G1 X172.3 Y139.895 E-.09697
G1 X172.35 Y139.798 E-.04166
G1 X172.439 Y139.44 E-.13996
G1 X172.463 Y139.179 E-.09955
G1 X172.463 Y138.174 E-.38186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.484 Y138.999 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.556513
G1 F5179.903
M204 S6000
G1 X168.605 Y140.02 E.05824
G1 X168.75 Y140.48 E.02731
; LINE_WIDTH: 0.533173
G1 F5435.458
G2 X169.392 Y141.42 I4.029 J-2.062 E.06161
G1 X169.981 Y141.875 E.04016
G1 X170.356 Y142.084 E.02318
G2 X171.48 Y142.305 I1.452 J-4.409 E.06197
G1 X172.112 Y142.229 E.03435
; LINE_WIDTH: 0.561026
G1 F5133.235
G1 X172.751 Y142.063 E.03772
G1 X173.082 Y141.886 E.02147
G2 X173.829 Y141.238 I-2.087 J-3.162 E.05666
G2 X174.45 Y139.703 I-2.764 J-2.012 E.09558
G2 X174.511 Y138.727 I-8.61 J-1.028 E.0559
G1 X174.511 Y134.885 E.21957
G1 X174.006 Y134.885 E.02888
G1 X174.006 Y138.727 E.21957
G3 X173.922 Y139.871 I-5.353 J.185 E.06569
G1 X173.689 Y140.528 E.03984
G1 X173.422 Y140.947 E.02839
G1 X173.093 Y141.274 E.02651
G1 X172.589 Y141.574 E.03351
G1 X172.307 Y141.684 E.01733
; LINE_WIDTH: 0.534652
G1 F5418.514
G1 X171.728 Y141.816 E.03215
G1 X171.388 Y141.837 E.01843
G3 X170.312 Y141.528 I.798 J-4.813 E.06072
G1 X169.873 Y141.233 E.02864
G1 X169.481 Y140.804 E.03144
G1 X169.184 Y140.264 E.03341
G1 X169.094 Y139.954 E.01746
G1 X169.008 Y139.343 E.0334
; LINE_WIDTH: 0.565056
G1 F5092.261
G1 X168.989 Y138.983 E.02075
G1 X168.989 Y134.885 E.23608
G1 X168.484 Y134.885 E.02911
G1 X168.484 Y138.939 E.23352
M204 S10000
G1 X168.051 Y139.026 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X168.189 Y140.136 E.04596
M73 P75 R3
G1 X168.349 Y140.629 E.02128
G2 X169.07 Y141.692 I7.399 J-4.242 E.05277
G1 X169.853 Y142.303 E.04078
G1 X170.226 Y142.49 E.01715
G2 X171.435 Y142.713 I1.453 J-4.478 E.05062
G2 X172.665 Y142.554 I-.171 J-6.142 E.05101
G1 X173.059 Y142.405 E.01728
G1 X173.554 Y142.074 E.02443
G1 X174.076 Y141.61 E.02867
G1 X174.382 Y141.153 E.02261
G1 X174.711 Y140.468 E.03119
G2 X174.943 Y138.758 I-6.836 J-1.797 E.07103
G1 X174.944 Y134.453 E.17679
G1 X173.573 Y134.453 E.05628
G1 X173.573 Y139.208 E.19526
G1 X173.516 Y139.736 E.02182
G1 X173.293 Y140.382 E.02803
G1 X172.961 Y140.825 E.02274
G3 X171.625 Y141.417 I-1.852 J-2.379 E.06059
G1 X171.341 Y141.412 E.01169
G1 X170.611 Y141.2 E.0312
G1 X170.166 Y140.944 E.02109
G1 X169.791 Y140.541 E.0226
G1 X169.563 Y140.075 E.02129
G1 X169.427 Y139.281 E.03306
G1 X169.422 Y134.453 E.19827
G1 X168.051 Y134.453 E.05628
G1 X168.051 Y138.966 E.1853
M204 S10000
G1 X167.691 Y139.048 F42000
G1 F7144.644
M204 S6000
G1 X167.836 Y140.215 E.04828
G1 X168.018 Y140.775 E.02418
G1 X168.27 Y141.221 E.02103
G1 X168.81 Y141.946 E.03714
G1 X169.656 Y142.605 E.04404
G1 X170.117 Y142.833 E.02109
G1 X170.8 Y143.003 E.02892
G1 X171.396 Y143.071 E.02461
G1 X172.196 Y143.008 E.03296
G1 X172.759 Y142.902 E.02353
G1 X173.237 Y142.718 E.02102
G2 X174.17 Y142.013 I-2.232 J-3.925 E.04814
G1 X174.43 Y141.774 E.01451
G2 X175.086 Y140.512 I-5.043 J-3.427 E.05851
G1 X175.234 Y139.803 E.02978
G2 X175.303 Y138.751 I-13.241 J-1.397 E.04329
G1 X175.303 Y134.093 E.19126
G1 X173.213 Y134.093 E.08583
G1 X173.213 Y139.208 E.21003
G1 X173.155 Y139.711 E.0208
G1 X172.956 Y140.257 E.02386
G1 X172.636 Y140.635 E.02031
G1 X172.154 Y140.904 E.02266
G1 X171.536 Y141.068 E.02626
G3 X170.666 Y140.834 I1.364 J-6.799 E.03703
G1 X170.301 Y140.585 E.01812
G1 X170.037 Y140.263 E.0171
G1 X169.873 Y139.84 E.01864
G1 X169.783 Y139.225 E.02549
G3 X169.782 Y134.093 I453.762 J-2.688 E.21075
G1 X167.691 Y134.093 E.08583
G1 X167.691 Y138.988 E.201
; OBJECT_ID: 783
; WIPE_START
G1 X167.691 Y136.988 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 701
M625
; start printing object, unique label id: 783
M624 AgAAAAAAAAA=
M204 S10000
G1 X163.202 Y130.816 Z.88 F42000
G1 X156.235 Y121.238 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X156.2 Y121.257 E.00177
G2 X155.936 Y121.419 I.645 J1.349 E.01379
G2 X155.661 Y122.382 I.864 J.768 E.04609
G3 X155.655 Y122.67 I-.721 J.129 E.01289
G1 X155.591 Y122.757 E.00481
G3 X153.971 Y122.399 I.861 J-7.732 E.07393
G3 X151.627 Y121.547 I3.647 J-13.692 E.11111
G1 X151.376 Y121.407 E.01276
G3 X151.413 Y121.072 I.09 J-.159 E.01899
G2 X152.251 Y120.312 I-1.364 J-2.347 E.0507
G2 X152.408 Y119.302 I-3.009 J-.985 E.04566
G2 X152.263 Y115.842 I-37.705 J-.155 E.15413
G1 X152.187 Y115.372 E.02117
G2 X151.433 Y114.478 I-1.685 J.657 E.05294
G3 X151.971 Y113.916 I1.377 J.778 E.03496
G3 X152.957 Y113.786 I.762 J1.966 E.04466
G2 X154.754 Y113.854 I41.593 J-1071.266 E.07999
G3 X155.97 Y114.073 I-.866 J8.284 E.05501
G3 X156.315 Y114.262 I-.125 J.64 E.0178
G3 X156.375 Y114.441 I-1.268 J.524 E.00842
G2 X155.801 Y115.457 I7.202 J4.744 E.05197
G2 X155.7 Y116.382 I4.234 J.928 E.04145
G1 X155.701 Y118.703 E.10326
G2 X156.023 Y120.303 I3.972 J.032 E.07313
G2 X156.906 Y120.949 I1.409 J-1.001 E.04949
G2 X158.376 Y120.781 I.519 J-1.978 E.06734
G2 X158.944 Y120.168 I-1.223 J-1.703 E.03743
G2 X159.315 Y118.318 I-4.939 J-1.953 E.08435
G2 X159.275 Y116.196 I-13.42 J-.809 E.09451
G2 X158.846 Y114.745 I-6.215 J1.05 E.06747
G3 X158.464 Y114.312 I3.656 J-3.603 E.02569
G3 X158.562 Y114.102 I.231 J-.02 E.01078
G3 X158.962 Y113.958 I.478 J.7 E.01912
G3 X160.6 Y113.828 I1.294 J5.914 E.07332
G3 X163.068 Y114.066 I.292 J9.886 E.11058
G3 X163.368 Y114.215 I-.656 J1.686 E.01492
G3 X163.445 Y114.484 I-1.088 J.456 E.01245
G2 X162.747 Y115.323 I5.5 J5.286 E.0486
G2 X162.556 Y116.161 I1.929 J.879 E.03847
G1 X162.416 Y119.687 E.15698
G3 X162.143 Y121.369 I-6.02 J-.114 E.07605
G3 X161.03 Y122.461 I-1.932 J-.854 E.07104
G3 X159.364 Y122.735 I-1.278 J-2.574 E.07625
G3 X158.308 Y122.422 I.053 J-2.114 E.04954
G3 X157.386 Y121.479 I3.907 J-4.744 E.05879
G2 X156.657 Y121.123 I-1.039 J1.202 E.03648
G1 X156.293 Y121.222 E.01679
M204 S10000
G1 X156.348 Y121.595 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X156.13 Y121.772 I.344 J.648 E.01158
G2 X156.035 Y122.361 I.861 J.44 E.02492
G3 X155.895 Y122.976 I-.715 J.16 E.02679
G3 X155.545 Y123.129 I-.352 J-.329 E.01612
G3 X153.867 Y122.759 I.912 J-8.118 E.07068
G3 X151.45 Y121.877 I3.733 J-13.994 E.10578
G1 X151.155 Y121.713 E.01385
G3 X151.189 Y120.772 I.29 J-.461 E.04673
G2 X151.909 Y120.14 I-1.123 J-2.006 E.03962
G2 X152.033 Y119.298 I-2.533 J-.804 E.03507
G2 X151.892 Y115.894 I-37.587 J-.145 E.13995
G1 X151.825 Y115.479 E.01725
G2 X151.453 Y114.965 I-.997 J.329 E.02649
G3 X151.036 Y114.571 I.616 J-1.07 E.02373
G3 X151.014 Y114.442 I.376 J-.131 E.00543
G3 X151.717 Y113.627 I2.033 J1.043 E.04459
G3 X152.965 Y113.411 I1.009 J2.114 E.05266
G2 X154.647 Y113.47 I4.715 J-110.065 E.06911
G3 X156.082 Y113.714 I-.737 J8.665 E.05985
G3 X156.62 Y114.036 I-.265 J1.051 E.0261
G3 X156.753 Y114.403 I-1.619 J.798 E.01604
G3 X156.52 Y114.919 I-.908 J-.1 E.02365
G2 X156.159 Y115.578 I4.355 J2.811 E.03085
G2 X156.075 Y116.384 I3.695 J.794 E.03337
G1 X156.076 Y118.697 E.09495
G2 X156.352 Y120.108 I3.502 J.048 E.05945
G2 X157.46 Y120.639 I1.03 J-.728 E.05271
G2 X158.311 Y120.356 I.033 J-1.323 E.03756
G2 X158.606 Y119.995 I-1.804 J-1.774 E.0192
G2 X158.94 Y118.306 I-4.513 J-1.771 E.07104
G2 X158.904 Y116.252 I-13.073 J-.799 E.08447
G2 X158.52 Y114.943 I-5.653 J.953 E.05612
G3 X158.121 Y114.484 I3.876 J-3.761 E.02499
G3 X158.129 Y114.094 I.478 J-.185 E.0164
G3 X158.441 Y113.737 I.497 J.118 E.02026
G1 X158.545 Y113.68 E.00486
G3 X160.601 Y113.453 I1.706 J6.027 E.08532
G3 X163.178 Y113.705 I.291 J10.319 E.10662
G3 X163.701 Y114.046 I-.255 J.962 E.02606
G3 X163.803 Y114.586 I-.817 J.433 E.0229
G3 X163.535 Y114.934 I-.849 J-.376 E.01822
G2 X163.079 Y115.504 I4 J3.668 E.02997
G2 X162.93 Y116.183 I1.543 J.693 E.02875
G1 X162.79 Y119.706 E.1448
G3 X162.493 Y121.507 I-6.466 J-.142 E.07517
G3 X161.202 Y122.795 I-2.299 J-1.014 E.07665
G3 X159.324 Y123.108 I-1.45 J-2.912 E.07932
G3 X157.974 Y122.64 I.074 J-2.397 E.05958
G3 X157.123 Y121.748 I4.346 J-4.993 E.0507
G1 X157.082 Y121.712 E.00223
G2 X156.643 Y121.511 I-.725 J1.006 E.01995
G2 X156.402 Y121.57 I.049 J.732 E.01025
; WIPE_START
M204 S6000
G1 X156.195 Y121.692 E-.09121
G1 X156.13 Y121.772 E-.03909
G1 X156.088 Y121.853 E-.03473
G1 X156.046 Y122.012 E-.06275
G1 X156.024 Y122.205 E-.07374
G1 X156.035 Y122.361 E-.05937
G1 X156.045 Y122.593 E-.08815
G1 X156.014 Y122.785 E-.0738
G1 X155.895 Y122.976 E-.08578
G1 X155.737 Y123.092 E-.07429
G1 X155.545 Y123.129 E-.07442
G1 X155.538 Y123.128 E-.00267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.994 Y121.242 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.478948
G1 F6139.118
M204 S6000
G1 X160.378 Y121.122 E.01923
G1 X160.688 Y120.908 E.01801
G1 X160.76 Y120.754 E.00812
G1 X160.895 Y120.207 E.02692
; LINE_WIDTH: 0.447009
G1 F6645.892
G1 X160.932 Y119.907 E.01336
; LINE_WIDTH: 0.421448
G1 F7115.975
G1 X160.969 Y119.606 E.01248
; LINE_WIDTH: 0.374578
G1 F8176.525
G2 X161.084 Y117.122 I-71.712 J-4.555 E.08922
; LINE_WIDTH: 0.389933
G1 F7795.87
G1 X161.091 Y116.609 E.01931
; LINE_WIDTH: 0.415684
G1 F7231.341
G1 X161.099 Y116.096 E.02082
; LINE_WIDTH: 0.447888
G1 F6630.812
G1 X161.106 Y115.837 E.01147
; LINE_WIDTH: 0.494749
G1 F5915.951
G3 X161.167 Y115.333 I1.409 J-.087 E.0253
G1 X160.613 Y115.328 E.02746
G1 X160.715 Y115.882 E.02796
; LINE_WIDTH: 0.443339
G1 F6709.533
G1 X160.731 Y116.1 E.00952
; LINE_WIDTH: 0.415684
G1 F7231.341
G1 X160.749 Y116.612 E.02082
; LINE_WIDTH: 0.373342
G1 F8208.782
G3 X160.767 Y117.229 I-9.277 J.586 E.02203
G1 X160.731 Y118.587 E.04857
G1 X160.679 Y119.204 E.02211
; LINE_WIDTH: 0.403154
G1 F7495.456
G1 X160.58 Y119.805 E.02385
; LINE_WIDTH: 0.440129
G1 F6766.205
G1 X160.466 Y120.225 E.01885
; LINE_WIDTH: 0.477247
G1 F6164.146
G1 X160.352 Y120.644 E.02069
G1 X160.146 Y121.042 E.02133
G1 X160.03 Y121.194 E.0091
M204 S10000
G1 X159.136 Y121.578 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X159.692 Y121.662 E.02308
G1 X160.253 Y121.59 E.02323
G1 X160.572 Y121.462 E.01412
G1 X160.932 Y121.216 E.01792
G1 X161.114 Y120.959 E.01295
G1 X161.275 Y120.25 E.02985
G1 X161.323 Y119.624 E.02578
G1 X161.463 Y116.105 E.14459
G1 X161.527 Y115.541 E.02329
G3 X161.715 Y114.956 I25.795 J7.941 E.02523
G2 X160.073 Y114.926 I-1.359 J29.015 E.06744
G3 X160.367 Y116.122 I-7.992 J2.601 E.05062
G3 X160.431 Y117.221 I-13.162 J1.312 E.04523
G1 X160.4 Y118.58 E.05581
G3 X159.979 Y120.527 I-7.059 J-.506 E.08209
G1 X159.796 Y120.856 E.01543
G1 X159.453 Y121.289 E.02268
G1 X159.18 Y121.537 E.01514
M204 S10000
G1 X158.444 Y121.562 F42000
G1 F7144.644
M204 S6000
G1 X158.803 Y121.854 E.01899
G2 X159.75 Y122.019 I1.188 J-4.009 E.03957
G1 X160.322 Y121.944 E.02369
G2 X161.111 Y121.542 I-.597 J-2.145 E.03657
G2 X161.453 Y121.094 I-1.064 J-1.167 E.02326
G1 X161.632 Y120.303 E.03328
G1 X161.682 Y119.644 E.02714
G1 X161.822 Y116.121 E.14477
G1 X161.88 Y115.614 E.02098
G1 X162.035 Y115.135 E.02064
G3 X162.329 Y114.676 I1.441 J.6 E.02253
G2 X160.437 Y114.565 I-1.571 J10.65 E.07792
G1 X159.573 Y114.597 E.03548
G3 X160.008 Y116.143 I-7.562 J2.959 E.06604
G3 X160.071 Y117.213 I-12.719 J1.285 E.04399
G1 X160.04 Y118.581 E.05618
G3 X159.635 Y120.42 I-6.689 J-.506 E.07758
G3 X158.997 Y121.231 I-2.95 J-1.664 E.04252
G1 X158.501 Y121.541 E.02404
M204 S10000
G1 X157.756 Y121.357 F42000
G1 F7144.644
M204 S6000
G2 X158.586 Y122.153 I3.751 J-3.082 E.04735
G1 X158.987 Y122.283 E.01731
G1 X159.666 Y122.387 E.02817
G2 X160.682 Y122.201 I-.022 J-3 E.04261
G1 X161.246 Y121.907 E.02613
G1 X161.561 Y121.615 E.01765
G1 X161.791 Y121.229 E.01845
G1 X161.989 Y120.357 E.0367
G1 X162.042 Y119.665 E.02849
G1 X162.182 Y116.138 E.14496
G1 X162.238 Y115.665 E.01953
G1 X162.401 Y115.174 E.02124
G3 X162.985 Y114.443 I27.243 J21.188 E.03843
G2 X161.047 Y114.204 I-1.987 J8.139 E.08036
G1 X159.976 Y114.206 E.04399
G2 X158.993 Y114.345 I-.028 J3.351 E.04091
G1 X159.198 Y114.615 E.01392
G1 X159.473 Y115.388 E.03367
G1 X159.649 Y116.165 E.03273
G3 X159.711 Y117.204 I-12.161 J1.252 E.04276
G1 X159.68 Y118.566 E.05593
G3 X159.292 Y120.312 I-6.298 J-.484 E.07369
G1 X158.968 Y120.754 E.02249
G3 X157.815 Y121.349 I-1.328 J-1.159 E.05454
; WIPE_START
G1 X157.929 Y121.335 E-.04349
G1 X158.379 Y121.204 E-.17811
G1 X158.664 Y121.03 E-.12705
G1 X158.968 Y120.754 E-.15581
G1 X159.292 Y120.312 E-.20812
G1 X159.329 Y120.193 E-.04741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.853 Y121.227 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F7144.654
M204 S6000
G1 X152.259 Y121.427 E.01858
G1 X153.681 Y121.921 E.06183
G1 X154.986 Y122.284 E.05561
G1 X155.28 Y122.329 E.01221
G1 X155.29 Y122.082 E.01018
G1 X155.408 Y121.539 E.02279
G1 X155.7 Y121.129 E.02067
G1 X156.067 Y120.897 E.01785
G1 X155.722 Y120.53 E.02068
G3 X155.402 Y119.557 I13.239 J-4.898 E.04206
G3 X155.326 Y118.706 I9.079 J-1.238 E.03509
G1 X155.325 Y116.378 E.09559
G3 X155.457 Y115.307 I4.177 J-.032 E.04444
G1 X155.929 Y114.463 E.03971
G1 X154.978 Y114.259 E.03993
G2 X153.549 Y114.192 I-1.146 J9.215 E.05881
G1 X152.68 Y114.16 E.03568
G1 X152.205 Y114.233 E.01975
G2 X151.961 Y114.426 I.147 J.437 E.01303
G1 X152.218 Y114.662 E.01436
G3 X152.559 Y115.323 I-1.471 J1.176 E.03073
G3 X152.755 Y117.636 I-16.695 J2.58 E.09537
G1 X152.783 Y119.304 E.06853
G1 X152.746 Y119.846 E.0223
G1 X152.606 Y120.443 E.02516
G1 X152.145 Y120.997 E.02957
G1 X151.9 Y121.19 E.01284
M204 S10000
G1 X152.506 Y121.132 F42000
; LINE_WIDTH: 0.419998
G1 F7144.659
M204 S6000
G2 X154.958 Y121.902 I7.389 J-19.221 E.1056
G1 X155.027 Y121.539 E.01519
G1 X155.257 Y121.118 E.01971
G1 X155.501 Y120.825 E.01564
G1 X155.337 Y120.566 E.01256
G1 X155.056 Y119.659 E.03901
G3 X154.966 Y118.707 I8.693 J-1.306 E.0393
G1 X154.965 Y116.379 E.09559
G3 X155.081 Y115.304 I4.326 J-.076 E.04449
G1 X155.381 Y114.706 E.02747
G1 X154.89 Y114.608 E.02055
G2 X152.697 Y114.521 I-4.504 J85.216 E.09009
G1 X152.568 Y114.538 E.00537
G1 X152.751 Y114.83 E.01417
G1 X152.915 Y115.27 E.01927
G3 X153.115 Y117.619 I-17.155 J2.641 E.09685
G3 X153.143 Y119.298 I-56.992 J1.804 E.06898
G1 X153.105 Y119.871 E.02357
G1 X152.956 Y120.527 E.02761
G1 X152.836 Y120.758 E.01068
G1 X152.546 Y121.087 E.01801
M204 S10000
G1 X153.122 Y120.964 F42000
; LINE_WIDTH: 0.419998
G1 F7144.658
M204 S6000
G2 X154.681 Y121.452 I4.676 J-12.224 E.06713
G3 X155.042 Y120.792 I2.284 J.82 E.03098
G3 X154.715 Y119.773 I26.472 J-9.045 E.04396
G3 X154.606 Y118.707 I16.277 J-2.199 E.04401
G1 X154.605 Y116.379 E.09559
G3 X154.825 Y114.964 I3.913 J-.116 E.05911
G2 X153.175 Y114.899 I-2.768 J49.081 E.06782
G1 X153.271 Y115.217 E.01364
G3 X153.413 Y116.422 I-8.337 J1.591 E.04984
G3 X153.503 Y119.292 I-41.056 J2.727 E.11796
G1 X153.464 Y119.896 E.02484
G1 X153.305 Y120.611 E.03006
G1 X153.149 Y120.911 E.0139
M204 S10000
G1 X153.623 Y120.757 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G2 X154.477 Y121.021 I3.985 J-11.385 E.03669
G1 X154.639 Y120.746 E.01313
G1 X154.442 Y120.107 E.02746
; LINE_WIDTH: 0.434556
G1 F6866.894
G1 X154.366 Y119.862 E.01096
; LINE_WIDTH: 0.451863
G1 F6563.535
G1 X154.29 Y119.617 E.01147
G3 X154.233 Y117.62 I18.751 J-1.537 E.08933
G1 X154.221 Y116.632 E.04412
; LINE_WIDTH: 0.484924
G1 F6052.77
G1 X154.22 Y115.929 E.03409
; LINE_WIDTH: 0.530779
G1 F5463.102
G1 X154.281 Y115.348 E.0314
G1 X153.715 Y115.337 E.03042
G1 X153.773 Y115.838 E.02705
; LINE_WIDTH: 0.495288
G1 F5908.614
G1 X153.798 Y116.34 E.02496
; LINE_WIDTH: 0.45032
G1 F6589.49
G3 X153.88 Y119.286 I-166.919 J6.124 E.13122
G1 X153.833 Y119.922 E.02837
; LINE_WIDTH: 0.429126
G1 F6967.927
G1 X153.651 Y120.704 E.03383
M204 S10000
G1 X154.158 Y120.444 F42000
; LINE_WIDTH: 0.527368
G1 F5502.972
M204 S6000
G2 X154.156 Y120.546 I-.029 J.05 E.01288
; WIPE_START
G1 X154.1 Y120.546 E-.18608
G1 X154.07 Y120.495 E-.1913
G1 X154.1 Y120.444 E-.19132
G1 X154.158 Y120.444 E-.19129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.597 Y119.405 Z.88 F42000
G1 X146.519 Y119.395 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X146.547 Y119.418 E.00165
G3 X146.677 Y119.505 I-.752 J1.268 E.00693
G3 X147.037 Y120.357 I-1.086 J.962 E.04189
G3 X146.573 Y121.667 I-1.928 J.054 E.06322
G3 X144.715 Y122.087 I-1.256 J-1.235 E.08952
G3 X143.596 Y120.653 I.761 J-1.748 E.08437
G3 X143.904 Y119.459 I1.24 J-.317 E.05721
G3 X144.293 Y119.275 I1.235 J2.113 E.01915
G3 X145.288 Y119.213 I.726 J3.609 E.04448
G1 X145.844 Y119.213 E.02474
G3 X146.325 Y119.311 I-.049 J1.473 E.02195
G1 X146.464 Y119.371 E.00671
M204 S10000
G1 X146.344 Y119.729 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X146.581 Y120.036 I-.384 J.541 E.01613
G3 X146.294 Y121.412 I-1.338 J.439 E.06042
G3 X144.841 Y121.733 I-.978 J-.975 E.06454
G3 X143.966 Y120.592 I.639 J-1.396 E.06144
G3 X144.152 Y119.753 I.866 J-.248 E.03677
G3 X144.41 Y119.633 I.811 J1.397 E.01169
G3 X145.288 Y119.588 I.611 J3.363 E.03619
G1 X145.821 Y119.588 E.02188
G1 X145.974 Y119.607 E.00635
G3 X146.294 Y119.697 I-.013 J.663 E.01379
; WIPE_START
M204 S6000
G1 X146.486 Y119.853 E-.09402
G1 X146.581 Y120.036 E-.0783
G1 X146.66 Y120.377 E-.13309
G1 X146.619 Y120.768 E-.14935
G1 X146.588 Y120.892 E-.04862
G1 X146.491 Y121.116 E-.09259
G1 X146.294 Y121.412 E-.13507
G1 X146.235 Y121.459 E-.02896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.851 Y118.23 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X143.994 Y118.355 E.00847
G2 X144.344 Y118.493 I.483 J-.716 E.01686
G1 X144.502 Y118.511 E.00708
G1 X149.194 Y118.511 E.20868
G3 X149.445 Y118.66 I.01 J.27 E.01373
G3 X149.603 Y119.626 I-1.187 J.69 E.04454
G3 X148.963 Y121.174 I-3.029 J-.348 E.07546
G3 X147.638 Y122.284 I-3.1 J-2.351 E.07756
G3 X145.919 Y122.788 I-1.843 J-3.109 E.08049
G3 X141.444 Y120.897 I-.56 J-4.917 E.22589
G3 X140.718 Y119.487 I4.087 J-2.996 E.07086
G3 X140.69 Y117.067 I4.651 J-1.263 E.10881
G3 X142.057 Y114.848 I4.464 J1.22 E.11749
G3 X143.583 Y113.992 I3.776 J4.945 E.07811
G3 X145.376 Y113.772 I1.659 J6.1 E.0806
G3 X147.409 Y114.196 I-.092 J5.524 E.09294
G3 X148.541 Y114.842 I-5.53 J11.011 E.05802
G3 X149.084 Y115.415 I-.92 J1.415 E.03544
G3 X149.188 Y115.79 I-2.262 J.833 E.0173
G3 X149.006 Y116.145 I-.63 J-.098 E.01808
G2 X146.439 Y115.268 I-2.732 J3.799 E.12246
G2 X143.886 Y116.75 I.107 J3.123 E.13676
G2 X143.629 Y117.666 I2.54 J1.207 E.04251
G2 X143.812 Y118.185 I1.256 J-.15 E.02468
M204 S10000
G1 X144.126 Y117.965 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X144.524 Y118.136 I.37 J-.312 E.01846
G1 X149.223 Y118.136 E.19294
G3 X149.842 Y118.616 I-.031 J.679 E.03423
G3 X149.948 Y119.885 I-1.927 J.801 E.05312
G3 X148.078 Y122.457 I-3.821 J-.812 E.1345
G3 X145.953 Y123.161 I-2.324 J-3.456 E.09305
G3 X141.143 Y121.123 I-.594 J-5.293 E.22419
G3 X140.356 Y119.586 I4.416 J-3.231 E.07116
G3 X140.164 Y118.225 I6.89 J-1.666 E.05654
G3 X141.818 Y114.557 I5.021 J.057 E.16998
G3 X143.304 Y113.692 I4.338 J5.741 E.07077
G3 X144.671 Y113.423 I1.756 J5.318 E.05737
G1 X145.207 Y113.384 E.02206
G1 X145.404 Y113.398 E.00809
G3 X147.467 Y113.812 I-.127 J5.985 E.08686
G3 X148.995 Y114.727 I-2.755 J6.333 E.07332
G3 X149.568 Y115.766 I-.929 J1.189 E.05007
G3 X149.158 Y116.48 I-.992 J-.094 E.03485
G3 X148.739 Y116.417 I-.16 J-.358 E.01835
G2 X146.445 Y115.644 I-2.456 J3.497 E.10081
G2 X144.189 Y116.986 I.073 J2.689 E.1126
G2 X144.012 Y117.66 I3.137 J1.183 E.02863
G2 X144.09 Y117.917 I.485 J-.007 E.01118
M204 S10000
G1 X144.509 Y118.706 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25761
G1 F12000
M204 S6000
G1 X144.599 Y118.758 E.00234
; LINE_WIDTH: 0.30329
G1 F10573.224
G1 X144.69 Y118.81 E.00289
; LINE_WIDTH: 0.348971
G1 F8901.305
G1 X144.78 Y118.862 E.00343
; LINE_WIDTH: 0.373895
G1 F8194.307
G1 X145.856 Y118.862 E.03854
G3 X146.08 Y118.875 I-.102 J3.606 E.00804
; LINE_WIDTH: 0.413119
G1 F7283.866
G1 X146.25 Y118.89 E.00687
; LINE_WIDTH: 0.44509
G1 F6679.009
G3 X146.573 Y118.933 I-.779 J7.054 E.01429
; WIPE_START
G1 X146.25 Y118.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.849 Y121.921 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X146.948 Y122.195 E.01194
G2 X148.072 Y121.566 I-2.861 J-6.433 E.05297
G1 X148.526 Y121.123 E.02602
G1 X148.901 Y120.579 E.02716
G1 X149.159 Y119.983 E.02665
G1 X149.247 Y119.391 E.02458
G1 X149.192 Y119.023 E.01526
G1 X149.134 Y118.898 E.00567
G1 X146.957 Y118.893 E.0894
G1 X146.911 Y119.228 E.01389
G1 X147.105 Y119.43 E.01149
G1 X147.325 Y119.901 E.02136
G1 X147.412 Y120.369 E.01954
G1 X147.312 Y121.085 E.02966
G3 X146.883 Y121.872 I-2.179 J-.679 E.03706
M204 S10000
G1 X147.992 Y119.622 F42000
; LINE_WIDTH: 0.433769
G1 F6881.366
M204 S6000
G1 X148.121 Y120.159 E.02356
G1 X148.131 Y120.416 E.01094
G2 X148.478 Y119.623 I-1.528 J-1.141 E.0372
G1 X148.052 Y119.622 E.01816
M204 S10000
G1 X147.414 Y119.254 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X147.636 Y119.704 E.02063
G1 X147.762 Y120.234 E.02236
G3 X147.664 Y121.166 I-6.168 J-.182 E.03852
G1 X147.545 Y121.47 E.01338
G1 X147.887 Y121.244 E.01679
G1 X148.25 Y120.89 E.02083
G1 X148.585 Y120.403 E.02427
G1 X148.81 Y119.884 E.02326
G1 X148.88 Y119.372 E.02122
G1 X148.863 Y119.257 E.00475
G1 X147.474 Y119.254 E.05702
M204 S10000
G1 X146.571 Y122.254 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467035
G1 F6318.843
M204 S6000
G3 X146.256 Y122.367 I-3.783 J-10.091 E.01553
; LINE_WIDTH: 0.415385
G1 F7237.406
G1 X146.162 Y122.394 E.00395
; LINE_WIDTH: 0.384367
G1 F7929.695
G1 X146.042 Y122.424 E.00459
; LINE_WIDTH: 0.349271
G1 F8892.056
G1 X145.847 Y122.462 E.00656
; LINE_WIDTH: 0.309503
G1 F10309.872
G1 X145.649 Y122.486 E.00567
G3 X144.79 Y122.453 I-.298 J-3.367 E.02452
; LINE_WIDTH: 0.347546
G1 F8945.437
G3 X144.591 Y122.411 I.452 J-2.636 E.00668
; LINE_WIDTH: 0.386749
G1 F7871.874
G3 X144.393 Y122.35 I.8 J-2.969 E.00772
; LINE_WIDTH: 0.420063
G1 F7143.371
G1 X144.324 Y122.323 E.00303
; LINE_WIDTH: 0.462764
G1 F6385.854
G1 X144.222 Y122.28 E.00512
G3 X143.998 Y122.172 I1.728 J-3.836 E.01141
M204 S10000
G1 X142.113 Y117.666 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.508305
G1 F5737.021
M204 S6000
G1 X142.188 Y117.385 E.01485
; LINE_WIDTH: 0.458578
G1 F6452.931
G1 X142.262 Y117.104 E.0132
; LINE_WIDTH: 0.408852
G1 F7372.99
G1 X142.337 Y116.824 E.01156
M204 S10000
G1 X141.978 Y118.225 F42000
; LINE_WIDTH: 0.390846
G1 F7774.362
M204 S6000
G1 X142.043 Y118.571 E.01329
; LINE_WIDTH: 0.437362
G1 F6815.825
G2 X142.166 Y119.174 I8.751 J-1.469 E.02649
G1 X142.267 Y119.348 E.00864
G1 X142.524 Y118.887 E.02272
G1 X142.383 Y118.583 E.01444
; LINE_WIDTH: 0.401388
G1 F7534.218
G1 X142.23 Y117.997 E.02356
; LINE_WIDTH: 0.412177
G1 F7303.363
G1 X142.191 Y117.887 E.00471
; LINE_WIDTH: 0.460573
G1 F6420.786
G1 X142.152 Y117.776 E.00535
; LINE_WIDTH: 0.50897
G1 F5728.523
G1 X142.113 Y117.666 E.006
G1 X142.075 Y117.783 E.00633
; LINE_WIDTH: 0.460573
G1 F6420.786
G1 X142.037 Y117.901 E.00565
; LINE_WIDTH: 0.412177
G1 F7303.363
G1 X142 Y118.019 E.00497
; LINE_WIDTH: 0.380614
G1 F8022.553
G1 X141.984 Y118.165 E.00539
M204 S10000
G1 X141.694 Y118.757 F42000
; LINE_WIDTH: 0.421047
G1 F7123.894
M204 S6000
G1 X141.807 Y119.284 E.02219
G2 X142.318 Y120.23 I4.334 J-1.731 E.04439
G1 X142.471 Y120.396 E.00929
G1 X142.51 Y119.858 E.02221
G1 X142.67 Y119.347 E.02204
G1 X142.974 Y118.884 E.0228
G1 X142.717 Y118.456 E.02057
G1 X142.562 Y117.906 E.02355
G1 X142.534 Y117.581 E.01343
G1 X142.687 Y116.837 E.03127
G1 X142.864 Y116.326 E.02229
; LINE_WIDTH: 0.458469
G1 F6454.708
G1 X142.958 Y116.124 E.01011
G1 X143.298 Y115.661 E.0261
G1 X143.923 Y115.061 E.03939
G1 X143.463 Y115.265 E.02286
G1 X142.777 Y115.71 E.03719
G1 X142.362 Y116.13 E.02685
; LINE_WIDTH: 0.420848
G1 F7127.818
G1 X142.066 Y116.578 E.02208
G1 X141.799 Y117.256 E.03
G2 X141.688 Y118.697 I3.089 J.962 E.05999
M204 S10000
G1 X141.342 Y118.832 F42000
; LINE_WIDTH: 0.419998
G1 F7144.65
M204 S6000
G1 X141.463 Y119.4 E.02384
G2 X142.558 Y121.02 I4.076 J-1.575 E.08096
G1 X143.059 Y121.4 E.02584
G1 X142.89 Y120.842 E.02396
G1 X142.826 Y120.31 E.02199
G1 X142.894 Y119.775 E.02217
G3 X143.463 Y118.879 I2.135 J.727 E.04399
G1 X143.202 Y118.597 E.01577
G1 X143.038 Y118.281 E.01462
G1 X142.892 Y117.719 E.02383
G1 X143.039 Y116.913 E.03366
G1 X143.258 Y116.369 E.02405
G1 X143.607 Y115.883 E.02458
G1 X144.072 Y115.428 E.02673
G3 X145.101 Y114.803 I2.904 J3.617 E.04955
G3 X146.056 Y114.582 I1.16 J2.846 E.04041
G2 X143.807 Y114.696 I-.846 J5.583 E.09307
G1 X143.282 Y114.93 E.0236
G1 X142.531 Y115.416 E.03674
G1 X142.055 Y115.926 E.02864
G1 X141.722 Y116.449 E.02545
G1 X141.383 Y117.336 E.03899
G2 X141.285 Y118.291 I5.006 J.997 E.03949
G1 X141.336 Y118.772 E.01988
M204 S10000
G1 X140.975 Y118.836 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X141.12 Y119.516 E.02853
G2 X141.743 Y120.669 I5.28 J-2.109 E.05392
G1 X142.314 Y121.286 E.03454
G1 X142.838 Y121.691 E.02719
G1 X143.593 Y122.095 E.03516
G1 X143.749 Y121.827 E.01271
G1 X143.413 Y121.306 E.02549
G1 X143.246 Y120.787 E.02237
G1 X143.193 Y120.258 E.02184
G1 X143.235 Y119.891 E.01517
G1 X143.362 Y119.597 E.01314
G1 X143.686 Y119.149 E.02268
G1 X144.022 Y118.979 E.01545
G3 X144.02 Y118.792 I.183 J-.095 E.00798
G1 X143.75 Y118.656 E.01242
G1 X143.512 Y118.415 E.0139
G1 X143.385 Y118.185 E.01078
G1 X143.25 Y117.685 E.0213
G1 X143.391 Y116.988 E.02917
G1 X143.564 Y116.559 E.01899
G1 X143.899 Y116.093 E.02358
G3 X145.364 Y115.094 I2.99 J2.811 E.07339
G1 X145.62 Y115.011 E.01104
; LINE_WIDTH: 0.436935
G1 F6823.541
G1 X145.881 Y114.955 E.01145
; LINE_WIDTH: 0.470809
G1 F6260.783
G1 X146.141 Y114.899 E.01248
; LINE_WIDTH: 0.49241
G1 F5947.949
G1 X146.402 Y114.844 E.01314
G1 X146.909 Y114.892 E.02514
G1 X147.658 Y115.067 E.03793
G1 X147.779 Y114.858 E.01192
G2 X147.084 Y114.501 I-2.463 J3.945 E.03857
; LINE_WIDTH: 0.498493
G1 F5865.418
G1 X146.843 Y114.435 E.01251
; LINE_WIDTH: 0.524184
G1 F5540.737
G1 X146.601 Y114.37 E.01324
; LINE_WIDTH: 0.517523
G1 F5621.408
G1 X146.389 Y114.314 E.01146
; LINE_WIDTH: 0.478514
G1 F6145.495
G1 X146.177 Y114.258 E.01049
; LINE_WIDTH: 0.420524
G1 F7134.235
G1 X145.964 Y114.202 E.00903
G1 X145.25 Y114.139 E.02949
G2 X143.782 Y114.334 I.088 J6.303 E.06104
G1 X143.168 Y114.586 E.02727
G2 X142.298 Y115.138 I13.992 J23.029 E.04238
G1 X141.769 Y115.704 E.03187
G1 X141.399 Y116.286 E.02835
G1 X141.034 Y117.239 E.04195
G2 X140.926 Y118.325 I5.173 J1.063 E.04495
G1 X140.969 Y118.777 E.01865
; WIPE_START
G1 X140.926 Y118.325 E-.17236
G1 X140.939 Y117.934 E-.14869
G1 X141.034 Y117.239 E-.26648
G1 X141.197 Y116.815 E-.17247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.103 Y115.112 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.55059
G1 F5242.448
M204 S6000
G1 X148.477 Y115.335 E.02438
; LINE_WIDTH: 0.505488
G1 F5773.308
G1 X148.547 Y115.382 E.00425
; LINE_WIDTH: 0.47876
G1 F6141.875
G1 X148.636 Y115.448 E.0053
; LINE_WIDTH: 0.445667
G1 F6669.006
G1 X148.705 Y115.506 E.00397
; LINE_WIDTH: 0.394896
G1 F7680.309
G1 X148.986 Y115.809 E.01579
; WIPE_START
G1 X148.705 Y115.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.44 Y117.845 Z.88 F42000
G1 X135.414 Y119.784 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X134.993 Y119.991 E.02087
G2 X134.749 Y120.175 I1.188 J1.825 E.01359
G2 X134.194 Y120.988 I2.388 J2.229 E.04394
G2 X134.086 Y121.366 I3.118 J1.09 E.01749
G2 X134.374 Y122.139 I1.261 J-.029 E.03739
G3 X134.466 Y122.359 I-.783 J.458 E.01064
G3 X134.243 Y122.559 I-.228 J-.03 E.01456
G3 X131.948 Y122.755 I-1.932 J-9.081 E.10269
G3 X128.952 Y122.477 I-.38 J-12.157 E.13418
G3 X128.476 Y122.267 I.17 J-1.031 E.02338
G1 X128.47 Y122.257 E.00055
G3 X128.383 Y122.058 I1.103 J-.601 E.00965
G2 X129.314 Y121.75 I-4.1 J-13.955 E.04362
G2 X130.121 Y121.129 I-1.201 J-2.394 E.04556
G2 X130.471 Y120.737 I-4.121 J-4.03 E.02342
G1 X131.557 Y119.384 E.07716
G2 X131.82 Y118.849 I-1.132 J-.889 E.02671
G2 X131.664 Y118.376 I-1.355 J.185 E.02227
G2 X129.409 Y114.848 I-43.802 J25.504 E.18628
G2 X128.257 Y114.268 I-1.347 J1.241 E.05865
G1 X128.149 Y114.236 E.00502
M73 P76 R3
G1 X128.177 Y114.075 E.00726
G3 X128.746 Y113.886 I.766 J1.355 E.02687
G3 X129.686 Y113.828 I.814 J5.574 E.04195
G3 X130.321 Y113.805 I.584 J7.543 E.02824
G3 X130.902 Y113.972 I.075 J.837 E.02753
G3 X131.097 Y114.224 I-1.281 J1.188 E.01418
G2 X130.666 Y115.108 I1.397 J1.228 E.04426
G2 X131.245 Y116.501 I2.988 J-.426 E.06782
G2 X131.966 Y117.305 I2.027 J-1.093 E.04848
G1 X132.414 Y117.559 E.0229
G2 X133.123 Y117.202 I-1.009 J-2.891 E.03542
G2 X133.969 Y115.965 I-2.448 J-2.581 E.06717
G2 X134.094 Y115.451 I-4.413 J-1.344 E.02355
G2 X133.868 Y114.779 I-1.422 J.105 E.03183
G2 X133.277 Y114.365 I-1.54 J1.567 E.03226
G3 X133.358 Y114.123 I1.455 J.354 E.01135
G3 X133.722 Y113.975 I.752 J1.326 E.01752
G3 X135.455 Y113.829 I1.811 J11.129 E.07745
G3 X137.711 Y113.879 I.55 J26.07 E.10042
G3 X138.894 Y114.064 I-1.654 J14.446 E.05327
G3 X139.24 Y114.253 I-.108 J.607 E.01782
G3 X139.31 Y114.506 I-1.268 J.488 E.01167
G3 X138.824 Y114.763 I-3.335 J-5.709 E.02446
G2 X137.999 Y115.486 I1.277 J2.288 E.04914
G2 X136.934 Y116.93 I10.036 J8.513 E.07989
G1 X136.205 Y118.037 E.05898
G2 X135.967 Y118.553 I1.561 J1.031 E.02533
G2 X136.149 Y119.012 I1.542 J-.344 E.02204
G2 X138.078 Y121.698 I27.509 J-17.72 E.14721
G2 X139.019 Y122.307 I1.942 J-1.973 E.05018
G1 X139.307 Y122.469 E.01471
G3 X138.714 Y122.731 I-.657 J-.688 E.02939
G3 X136.969 Y122.679 I-.703 J-5.758 E.07799
G3 X136.654 Y122.581 I.053 J-.725 E.0148
G3 X136.526 Y122.453 I.622 J-.748 E.00806
G2 X136.957 Y121.498 I-1.796 J-1.385 E.04701
G2 X136.338 Y120.321 I-2.507 J.567 E.05983
G2 X135.847 Y119.926 I-1.367 J1.194 E.02819
G1 X135.47 Y119.758 E.01835
G1 X135.468 Y119.759 E.00011
M204 S10000
G1 X135.47 Y120.168 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X134.934 Y120.532 I.334 J1.07 E.027
G2 X134.467 Y121.393 I1.35 J1.29 E.04071
G2 X134.702 Y121.956 I1.053 J-.11 E.02538
G3 X134.853 Y122.367 I-1.296 J.711 E.01805
G3 X134.586 Y122.823 I-.653 J-.076 E.02236
G3 X133.751 Y123.031 I-.94 J-1.993 E.03557
G3 X130.815 Y123.111 I-1.946 J-17.559 E.12072
G3 X128.641 Y122.774 I.48 J-10.256 E.09049
G3 X128.014 Y122.131 I.166 J-.789 E.0391
G3 X128.416 Y121.646 I.534 J.034 E.02764
G2 X129.495 Y121.206 I-.564 J-2.923 E.04814
G2 X130.182 Y120.497 I-5.147 J-5.685 E.04058
G1 X131.26 Y119.154 E.0707
G2 X131.427 Y118.829 I-.683 J-.556 E.01514
G2 X131.333 Y118.553 I-.79 J.118 E.01202
G2 X129.125 Y115.096 I-43.28 J25.202 E.16848
G2 X128.343 Y114.67 I-1.034 J.966 E.03719
G3 X127.838 Y114.453 I.057 J-.829 E.02303
G3 X128.14 Y113.657 I.518 J-.258 E.03926
G3 X129.673 Y113.453 I1.337 J4.184 E.06383
G3 X130.331 Y113.431 I.594 J7.772 E.02701
G3 X131.419 Y114.033 I.087 J1.129 E.05409
G1 X131.5 Y114.162 E.00624
G3 X131.238 Y114.655 I-.837 J-.128 E.02339
G2 X131.051 Y115.112 I1.115 J.721 E.02037
G2 X131.561 Y116.299 I2.537 J-.387 E.05359
G2 X132.436 Y117.14 I1.589 J-.776 E.05088
G2 X133.16 Y116.609 I-.353 J-1.241 E.03768
G2 X133.613 Y115.846 I-3.138 J-2.375 E.03652
G2 X133.713 Y115.44 I-3.477 J-1.069 E.01714
G2 X133.316 Y114.814 I-.67 J-.015 E.03228
G3 X132.932 Y114.452 I.179 J-.574 E.02238
G3 X132.941 Y114.182 I.269 J-.127 E.01154
G3 X133.418 Y113.68 I.593 J.086 E.03032
G1 X133.637 Y113.609 E.00944
G3 X135.451 Y113.454 I1.904 J11.633 E.07485
G3 X137.749 Y113.506 I.554 J26.345 E.09441
G3 X138.996 Y113.701 I-1.731 J15.122 E.05183
G3 X139.536 Y114.016 I-.295 J1.128 E.02599
G3 X139.64 Y114.645 I-.619 J.425 E.02705
G3 X139.334 Y114.929 I-.486 J-.218 E.01761
G2 X138.285 Y115.729 I.87 J2.229 E.05487
G2 X137.247 Y117.138 I9.757 J8.276 E.07191
G1 X136.523 Y118.236 E.05401
G2 X136.367 Y118.562 I.985 J.671 E.0149
G2 X136.471 Y118.819 I.866 J-.199 E.01143
G2 X138.357 Y121.446 I26.979 J-17.38 E.13282
G2 X139.193 Y121.974 I1.689 J-1.747 E.04093
G3 X139.566 Y122.219 I-.814 J1.645 E.01837
G3 X139.592 Y122.578 I-.314 J.203 E.0154
G3 X139.205 Y122.99 I-.554 J-.133 E.02429
G3 X138.363 Y123.138 I-.88 J-2.535 E.03524
G3 X136.885 Y123.044 I-.34 J-6.331 E.06096
G3 X136.34 Y122.804 I.101 J-.965 E.02487
G3 X136.246 Y122.197 I.254 J-.35 E.02803
G2 X136.568 Y121.505 I-1.311 J-1.033 E.03162
G2 X136.049 Y120.56 I-2.06 J.517 E.04477
G2 X135.527 Y120.187 I-.935 J.758 E.02666
M204 S10000
G1 X135.994 Y119.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.382895
G1 F7965.861
M204 S6000
G3 X136.241 Y119.765 I-3.913 J4.221 E.01278
; LINE_WIDTH: 0.334817
G1 F9359.875
G1 X136.304 Y119.83 E.00282
; LINE_WIDTH: 0.316032
G1 F10046.846
G1 X136.315 Y119.841 E.00046
; LINE_WIDTH: 0.291031
G1 F11134.477
G1 X136.435 Y119.982 E.00487
; LINE_WIDTH: 0.233507
G1 F12000
G1 X137.013 Y120.777 E.01944
; LINE_WIDTH: 0.263954
G1 X137.103 Y120.93 E.00414
; LINE_WIDTH: 0.299514
G1 F10739.991
G3 X137.15 Y121.032 I-.4 J.246 E.00306
G1 X137.163 Y121.418 E.01055
M204 S10000
G1 X137.143 Y122.268 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.531067
G1 F5459.754
M204 S6000
G2 X137.896 Y122.332 I.741 J-4.252 E.04067
G3 X137.932 Y122.141 I.108 J-.079 E.0117
G3 X137.59 Y121.768 I1.038 J-1.296 E.02732
G1 X137.518 Y121.838 E.0054
G1 X137.304 Y121.843 E.01147
G1 X137.164 Y122.212 E.02119
M204 S10000
G1 X138.401 Y122.236 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.122363
G1 F12000
M204 S6000
G1 X138.484 Y122.298 E.00074
; LINE_WIDTH: 0.15121
G1 X138.607 Y122.386 E.00157
; LINE_WIDTH: 0.190648
G1 X138.793 Y122.513 E.00336
; WIPE_START
G1 X138.607 Y122.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.928 Y114.76 Z.88 F42000
G1 X138.94 Y114.457 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.121104
G1 F12000
M204 S6000
G1 X139.077 Y114.376 E.0011
M204 S10000
G1 X133.689 Y114.347 F42000
; LINE_WIDTH: 0.127601
G1 F12000
M204 S6000
G1 X133.552 Y114.24 E.00134
; WIPE_START
G1 X133.689 Y114.347 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.457 Y115.195 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.295931
G1 F10903.168
M204 S6000
G1 X130.463 Y116.06 E.02329
M204 S10000
G1 X130.584 Y116.009 F42000
; LINE_WIDTH: 0.340687
G1 F9164.074
M204 S6000
G1 X130.486 Y115.815 E.00694
; LINE_WIDTH: 0.370978
G1 F8271.21
G1 X130.357 Y115.536 E.0109
M204 S10000
G1 X130.584 Y116.009 F42000
; LINE_WIDTH: 0.294721
G1 F10959.407
M204 S6000
G2 X131.11 Y116.868 I12.346 J-6.959 E.02698
G1 X131.339 Y117.205 E.01089
; LINE_WIDTH: 0.350255
G1 F8861.91
G1 X131.462 Y117.364 E.00664
; LINE_WIDTH: 0.390572
G1 F7780.806
G1 X131.531 Y117.445 E.00403
; LINE_WIDTH: 0.423394
G1 F7077.868
G1 X131.591 Y117.514 E.00376
; LINE_WIDTH: 0.441891
G1 F6734.974
G1 X131.601 Y117.526 E.0007
G1 X131.897 Y117.497 E.01295
M204 S10000
G1 X129.966 Y114.878 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.559419
G1 F5149.748
M204 S6000
G1 X130.106 Y114.753 E.0107
G1 X130.305 Y114.752 E.01135
G3 X130.517 Y114.288 I1.126 J.234 E.02925
G2 X129.571 Y114.271 I-.556 J4.4 E.05399
G1 X129.577 Y114.409 E.00788
G3 X129.932 Y114.828 I-.95 J1.165 E.03149
M204 S10000
G1 X129.063 Y114.294 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12841
G1 F12000
M204 S6000
G1 X128.976 Y114.236 E.00081
; LINE_WIDTH: 0.166675
G2 X128.743 Y114.087 I-3.09 J4.557 E.00337
M204 S10000
G1 X128.632 Y114.125 F42000
; LINE_WIDTH: 0.194328
G1 F12000
M204 S6000
G1 X128.941 Y114.151 E.00474
M204 S10000
G1 X128.931 Y114.141 F42000
; LINE_WIDTH: 0.142408
G1 F12000
M204 S6000
G1 X128.632 Y114.133 E.0028
; WIPE_START
G1 X128.931 Y114.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.759 Y121.729 Z.88 F42000
G1 X129.779 Y121.909 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.651
M204 S6000
G1 X129.796 Y122.247 E.0139
G2 X131.947 Y122.38 I2.016 J-15.056 E.08855
G1 X133.071 Y122.352 E.04616
G1 X133.988 Y122.236 E.03796
G1 X133.792 Y121.845 E.01795
G1 X133.712 Y121.312 E.02212
G1 X133.88 Y120.781 E.02285
G1 X134.072 Y120.426 E.01659
G1 X134.469 Y119.925 E.02625
G1 X134.822 Y119.648 E.01843
G1 X135.394 Y119.38 E.02592
G1 X135.547 Y119.38 E.00628
G1 X135.59 Y119.4 E.00196
G1 X135.811 Y119.172 E.01304
G1 X135.592 Y118.614 E.02463
G1 X135.596 Y118.473 E.00577
G1 X135.877 Y117.855 E.02789
G3 X137.278 Y115.78 I52.495 J33.924 E.10279
G3 X138.083 Y114.826 I12.305 J9.567 E.05127
G1 X138.541 Y114.518 E.02265
G1 X138.483 Y114.421 E.00464
G1 X138.496 Y114.374 E.00201
G2 X136.561 Y114.21 I-2.007 J12.18 E.07984
G2 X134.776 Y114.227 I-.671 J22.705 E.07333
G1 X134.147 Y114.302 E.02597
G3 X134.078 Y114.463 I-.175 J.02 E.00753
G1 X134.303 Y114.767 E.01554
G3 X134.467 Y115.501 I-1.668 J.759 E.03108
G1 X134.329 Y116.071 E.02408
G1 X134.008 Y116.698 E.02895
G1 X133.578 Y117.274 E.0295
G1 X133.199 Y117.606 E.02069
G3 X132.401 Y117.958 I-2.407 J-4.377 E.03587
G1 X132.309 Y117.936 E.00389
G1 X132.24 Y118.036 E.00499
G1 X131.929 Y118.092 E.01295
G1 X132.155 Y118.681 E.02586
G1 X132.201 Y118.892 E.0089
G1 X131.964 Y119.452 E.02496
G3 X130.424 Y121.353 I-29.192 J-22.081 E.10046
G1 X130.044 Y121.718 E.02163
G1 X129.827 Y121.874 E.01095
M204 S10000
G1 X130.312 Y121.96 F42000
; LINE_WIDTH: 0.419998
G1 F7144.663
M204 S6000
G2 X133.044 Y121.993 I1.648 J-23.449 E.11225
G1 X133.449 Y121.941 E.0168
G1 X133.357 Y121.442 E.02086
G1 X133.369 Y121.202 E.00988
G1 X133.532 Y120.67 E.02283
G1 X133.79 Y120.202 E.02195
G1 X134.188 Y119.701 E.02625
G1 X134.655 Y119.329 E.02454
G1 X135.241 Y119.054 E.02658
G1 X135.37 Y119.032 E.00535
G3 X135.222 Y118.492 I1.034 J-.572 E.02323
G1 X135.548 Y117.71 E.03475
G3 X136.986 Y115.57 I45.749 J29.184 E.10588
G3 X137.769 Y114.629 I254.269 J210.767 E.05026
G2 X134.803 Y114.586 I-1.825 J23.753 E.12186
G1 X134.623 Y114.608 E.00746
G3 X134.832 Y115.488 I-2.063 J.955 E.0374
G1 X134.679 Y116.156 E.02812
G1 X134.327 Y116.865 E.0325
G1 X133.865 Y117.49 E.03192
G1 X133.656 Y117.706 E.01234
G1 X133.261 Y117.978 E.01968
G1 X132.628 Y118.269 E.02863
G1 X132.421 Y118.337 E.00893
G1 X132.563 Y118.886 E.02328
G3 X132.175 Y119.781 I-3.277 J-.89 E.04022
G1 X131.042 Y121.2 E.07454
G3 X130.355 Y121.918 I-5.074 J-4.162 E.04087
M204 S10000
G1 X131.126 Y121.647 F42000
; LINE_WIDTH: 0.419998
G1 F7144.662
M204 S6000
G2 X133.017 Y121.633 I.788 J-22.509 E.07765
G1 X133.023 Y121.103 E.02177
G1 X133.214 Y120.502 E.0259
G1 X133.508 Y119.978 E.02468
G1 X133.906 Y119.477 E.02625
G1 X134.322 Y119.115 E.02264
G1 X134.912 Y118.811 E.02725
G1 X134.864 Y118.454 E.01477
G1 X134.941 Y118.175 E.0119
G1 X135.225 Y117.552 E.02811
G3 X136.694 Y115.36 I43.456 J27.536 E.10836
G1 X137.047 Y114.933 E.02274
G2 X135.115 Y114.936 I-.888 J55.945 E.07931
G1 X135.191 Y115.508 E.02369
G1 X135.029 Y116.241 E.03082
G1 X134.646 Y117.031 E.03606
G1 X134.153 Y117.707 E.03433
G1 X133.878 Y117.989 E.01618
G1 X133.47 Y118.278 E.02054
G1 X132.871 Y118.553 E.02708
G1 X132.923 Y118.903 E.01451
G1 X132.85 Y119.217 E.01324
G1 X132.619 Y119.752 E.02392
G1 X132.277 Y120.23 E.02412
G1 X131.166 Y121.602 E.0725
M204 S10000
G1 X131.955 Y121.265 F42000
; LINE_WIDTH: 0.489859
G1 F5983.267
M204 S6000
G1 X132.619 Y121.249 E.03253
G1 X132.643 Y120.995 E.01248
; LINE_WIDTH: 0.510516
G1 F5708.863
G1 X132.736 Y120.647 E.01852
; LINE_WIDTH: 0.551831
G1 F5229.218
G1 X132.828 Y120.299 E.02022
; LINE_WIDTH: 0.583508
G1 F4912.744
G1 X132.858 Y120.219 E.00505
; LINE_WIDTH: 0.577084
G1 F4973.798
G1 X132.675 Y120.42 E.01605
; LINE_WIDTH: 0.542193
G1 F5333.752
G1 X132.492 Y120.622 E.01496
; LINE_WIDTH: 0.495959
G1 F5899.524
G2 X131.993 Y121.218 I4.408 J4.192 E.03869
M204 S10000
G1 X132.858 Y120.219 F42000
; LINE_WIDTH: 0.608369
G1 F4689.992
M204 S6000
G1 X133.118 Y119.744 E.03392
M204 S10000
G1 X133.147 Y119.691 F42000
; LINE_WIDTH: 0.603455
G1 F4732.4
M204 S6000
G1 X133.294 Y119.536 E.01326
; LINE_WIDTH: 0.565948
G1 F5083.281
G1 X133.442 Y119.381 E.01235
; LINE_WIDTH: 0.528442
G1 F5490.361
G1 X133.589 Y119.225 E.01143
; LINE_WIDTH: 0.480656
G1 F6114.186
G1 X134.084 Y118.818 E.03075
G1 X134.489 Y118.578 E.02262
G1 X134.476 Y118.414 E.00789
G1 X134.585 Y118.013 E.01994
G1 X134.886 Y117.371 E.03402
G1 X134.465 Y117.941 E.03403
G3 X133.31 Y118.797 I-2.615 J-2.323 E.06945
G1 X133.307 Y119.097 E.01441
; LINE_WIDTH: 0.528442
G1 F5490.361
G1 X133.259 Y119.276 E.00989
; LINE_WIDTH: 0.565948
G1 F5083.281
G1 X133.211 Y119.454 E.01068
; LINE_WIDTH: 0.603455
G1 F4732.4
G1 X133.163 Y119.633 E.01147
M204 S10000
G1 X134.886 Y117.371 F42000
; LINE_WIDTH: 0.483723
G1 F6069.916
M204 S6000
G1 X135.088 Y117.029 E.01916
; LINE_WIDTH: 0.515833
G1 F5642.253
G1 X135.29 Y116.688 E.02062
M204 S10000
G1 X135.321 Y116.637 F42000
; LINE_WIDTH: 0.502969
G1 F5806.151
M204 S6000
G3 X136.228 Y115.326 I836.545 J577.85 E.08053
G1 X135.578 Y115.322 E.03285
G1 X135.554 Y115.765 E.02237
G3 X135.339 Y116.58 I-5.085 J-.903 E.04263
M204 S10000
G1 X129.416 Y122.162 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.294812
G1 F10955.149
M204 S6000
G3 X128.712 Y122.193 I-1.326 J-22.306 E.01888
; WIPE_START
G1 X129.416 Y122.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.258 Y121.389 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X122.237 Y121.411 E.00136
G2 X122.106 Y121.518 I.851 J1.177 E.00752
G2 X121.877 Y122.032 I.979 J.743 E.02524
G3 X121.772 Y122.767 I-4.213 J-.226 E.0331
G3 X118.731 Y122.195 I.345 J-10.208 E.13819
G3 X117.568 Y121.634 I1.215 J-4.005 E.05766
G3 X117.514 Y121.228 I.145 J-.226 E.02074
G2 X118.081 Y120.939 I-10.268 J-20.821 E.0283
G2 X118.474 Y120.515 I-1.4 J-1.691 E.02579
G2 X118.63 Y119.798 I-3.013 J-1.031 E.03273
G2 X118.467 Y116.137 I-25.617 J-.69 E.16312
G2 X117.68 Y114.981 I-1.517 J.186 E.06463
G1 X117.63 Y114.942 E.00281
G3 X117.335 Y114.53 I.247 J-.488 E.02345
G3 X117.41 Y114.285 I.938 J.153 E.0114
G3 X118.106 Y114.026 I.852 J1.222 E.03337
G3 X120.427 Y113.829 I1.967 J9.396 E.1039
G1 X120.933 Y113.834 E.02249
G3 X122.95 Y114.017 I-.192 J13.31 E.09021
G3 X123.526 Y114.435 I-.108 J.754 E.03293
G3 X123.238 Y114.88 I-.361 J.082 E.02628
G2 X122.295 Y115.3 I.748 J2.947 E.04616
G2 X121.925 Y116.047 I1.168 J1.044 E.03754
G2 X121.845 Y119.246 I15.794 J1.995 E.14258
G1 X121.906 Y119.695 E.02013
G2 X122.57 Y120.398 I.943 J-.225 E.04504
G1 X122.846 Y120.457 E.01254
G2 X123.508 Y120.188 I-.213 J-1.475 E.03212
G3 X124.409 Y119.439 I3.238 J2.978 E.05224
G3 X125.457 Y119.382 I.611 J1.564 E.04751
G3 X126.701 Y121.58 I-.524 J1.747 E.12406
G3 X125.663 Y122.7 I-1.461 J-.312 E.07128
G3 X124.64 Y122.637 I-.397 J-1.89 E.04615
G3 X123.782 Y121.975 I.503 J-1.539 E.04914
G2 X123.329 Y121.424 I-3.321 J2.268 E.03176
G2 X122.722 Y121.182 I-.873 J1.306 E.0293
G2 X122.409 Y121.304 I.366 J1.406 E.01497
G1 X122.311 Y121.36 E.00504
M204 S10000
G1 X122.453 Y121.713 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X122.282 Y121.949 I.396 J.468 E.01212
G2 X122.146 Y122.812 I90.848 J14.673 E.03587
G3 X122.064 Y123.056 I-2.17 J-.597 E.01058
G3 X121.599 Y123.14 I-.34 J-.551 E.01984
G3 X118.615 Y122.552 I.585 J-10.831 E.12531
G3 X117.446 Y122.02 I1.624 J-5.123 E.05286
G3 X117.052 Y121.377 I.406 J-.691 E.03226
G3 X117.432 Y120.844 I.627 J.045 E.02829
G2 X117.99 Y120.525 I-.494 J-1.516 E.0266
G2 X118.222 Y120.057 I-.595 J-.586 E.02179
G2 X118.255 Y119.782 I-1.454 J-.314 E.01139
G2 X118.095 Y116.194 I-25.155 J-.679 E.14762
G2 X117.46 Y115.284 I-1.172 J.142 E.04741
G1 X117.403 Y115.241 E.00296
G3 X116.952 Y114.526 I.452 J-.785 E.03611
G3 X117.141 Y114.027 I1.046 J.111 E.02216
G3 X118.024 Y113.66 I1.078 J1.348 E.03978
G3 X120.428 Y113.454 I2.047 J9.75 E.09931
G1 X120.94 Y113.459 E.02102
G3 X123.028 Y113.649 I-.204 J13.778 E.08618
G3 X123.893 Y114.354 I-.153 J1.071 E.04811
G3 X123.793 Y114.926 I-.726 J.168 E.02449
G3 X123.377 Y115.229 I-.577 J-.356 E.02167
G2 X122.732 Y115.471 I2.451 J7.5 E.02829
G2 X122.408 Y115.788 I.312 J.644 E.01895
G2 X122.294 Y116.116 I1.241 J.613 E.01431
G2 X122.217 Y119.201 I15.419 J1.929 E.12689
G1 X122.271 Y119.597 E.01643
G2 X123.269 Y119.899 I.583 J-.127 E.05201
G3 X124.235 Y119.105 I3.471 J3.239 E.05149
G3 X125.536 Y119.015 I.786 J1.924 E.05448
G3 X127.123 Y120.879 I-.608 J2.126 E.10651
G3 X126.566 Y122.599 I-2.266 J.216 E.07637
G3 X124.917 Y123.081 I-1.269 J-1.281 E.07349
G3 X123.489 Y122.209 I.214 J-1.957 E.07095
G2 X123.099 Y121.722 I-3.512 J2.412 E.02566
G2 X122.741 Y121.578 I-.532 J.805 E.01596
G2 X122.5 Y121.677 I.109 J.604 E.01076
; WIPE_START
M204 S6000
G1 X122.35 Y121.815 E-.07766
G1 X122.282 Y121.949 E-.05723
G1 X122.146 Y122.812 E-.33197
G1 X122.064 Y123.056 E-.09784
G1 X121.966 Y123.107 E-.04175
G1 X121.851 Y123.136 E-.04505
G1 X121.599 Y123.14 E-.09574
G1 X121.566 Y123.138 E-.01276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.208 Y115.627 Z.88 F42000
G1 X120.202 Y115.596 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372689
G1 F8225.939
M204 S6000
G1 X120.143 Y115.629 E.00241
G1 X120.184 Y115.653 E.00167
M204 S10000
G1 X120.364 Y120.673 F42000
; LINE_WIDTH: 0.500008
G1 F5845.219
M204 S6000
G2 X120.359 Y120.769 I-.027 J.046 E.0111
M204 S10000
G1 X120.83 Y120.808 F42000
; LINE_WIDTH: 0.423722
G1 F7071.476
M204 S6000
G1 X120.579 Y120.289 E.02392
G1 X120.455 Y119.888 E.01739
; LINE_WIDTH: 0.423559
G1 F7074.665
G1 X120.42 Y119.447 E.01836
; LINE_WIDTH: 0.405758
G1 F7438.984
G3 X120.38 Y118.208 I8.529 J-.9 E.04891
G3 X120.524 Y115.653 I12.083 J-.599 E.10109
G1 X120.635 Y115.29 E.01498
G1 X119.736 Y115.296 E.03545
G1 X119.904 Y115.913 E.02521
G3 X120.065 Y118.832 I-25.32 J2.86 E.11536
; LINE_WIDTH: 0.391159
G1 F7767.024
G1 X120.072 Y119.369 E.02028
; LINE_WIDTH: 0.421753
G1 F7109.992
G3 X119.835 Y121.001 I-3.564 J.315 E.06864
G2 X120.623 Y121.192 I1.852 J-5.911 E.03348
G1 X120.802 Y120.86 E.01554
M204 S10000
G1 X121.297 Y120.816 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X121.078 Y120.514 E.01532
G1 X120.834 Y119.924 E.02621
G1 X120.724 Y118.967 E.03952
G3 X120.727 Y117.106 I87.496 J-.762 E.07644
G1 X120.836 Y115.928 E.04858
G1 X120.969 Y115.418 E.02164
G1 X121.227 Y114.946 E.02207
G2 X119.493 Y114.938 I-.998 J27.761 E.07119
G1 X119.196 Y114.966 E.01226
G1 X119.374 Y115.339 E.01699
G3 X119.555 Y116.023 I-3.588 J1.316 E.02908
G3 X119.71 Y119.9 I-25.046 J2.943 E.15946
G1 X119.678 Y120.243 E.01415
G1 X119.519 Y120.839 E.02533
G1 X119.308 Y121.225 E.01807
G2 X120.872 Y121.59 I3.515 J-11.525 E.06597
G1 X121.046 Y121.126 E.02037
G1 X121.259 Y120.862 E.01393
M204 S10000
G1 X121.795 Y120.814 F42000
G1 F7144.644
M204 S6000
G1 X121.424 Y120.402 E.02278
G1 X121.187 Y119.853 E.02456
G1 X121.081 Y118.927 E.03825
G3 X121.086 Y117.139 I134.164 J-.573 E.07344
G1 X121.195 Y115.961 E.04858
G1 X121.369 Y115.395 E.02432
G1 X121.704 Y114.865 E.02573
G1 X121.93 Y114.624 E.01359
G1 X120.915 Y114.568 E.04175
G1 X119.475 Y114.578 E.05912
G1 X118.763 Y114.646 E.02935
G1 X118.507 Y114.7 E.01078
G1 X118.854 Y115.09 E.02146
G1 X119.028 Y115.439 E.01601
G3 X119.197 Y116.057 I-3.244 J1.217 E.02635
G3 X119.33 Y120.15 I-23.397 J2.81 E.16835
G1 X119.171 Y120.746 E.02533
G1 X119.074 Y120.941 E.00896
G1 X118.753 Y121.332 E.02075
G1 X118.683 Y121.391 E.00375
G2 X120.621 Y121.926 I4.738 J-13.396 E.0826
G1 X121.143 Y121.977 E.02155
G1 X121.307 Y121.417 E.02395
G1 X121.414 Y121.228 E.00893
G1 X121.751 Y120.854 E.02065
M204 S10000
G1 X122.726 Y120.805 F42000
; LINE_WIDTH: 0.419699
G1 F7150.59
M204 S6000
G1 X122.272 Y120.691 E.01919
G1 X122.04 Y120.554 E.01105
G1 X121.72 Y120.188 E.01997
G1 X121.537 Y119.767 E.0188
G1 X121.439 Y118.888 E.03631
G3 X121.444 Y117.172 I368.083 J.211 E.07038
G1 X121.553 Y115.994 E.04854
G1 X121.68 Y115.577 E.01789
G1 X122.008 Y115.057 E.02522
G1 X122.517 Y114.739 E.02462
G3 X123.114 Y114.509 I28.139 J72.394 E.02624
G1 X122.878 Y114.388 E.01091
G2 X120.246 Y114.213 I-2.348 J15.423 E.10834
G2 X117.865 Y114.468 I-.279 J8.629 E.09855
G1 X117.743 Y114.528 E.00557
G3 X118.538 Y115.261 I-2.329 J3.32 E.0445
G1 X118.683 Y115.539 E.01285
G3 X118.839 Y116.092 I-2.897 J1.117 E.0236
G3 X118.989 Y119.955 I-24.816 J2.903 E.15879
G1 X118.824 Y120.653 E.02944
G1 X118.519 Y121.058 E.02077
G3 X117.946 Y121.433 I-1.165 J-1.154 E.02832
G1 X118.623 Y121.762 E.03088
G2 X120.598 Y122.288 I5.095 J-15.151 E.08392
G1 X121.457 Y122.367 E.03538
G1 X121.514 Y121.943 E.01755
G1 X121.685 Y121.465 E.02082
G1 X122.044 Y121.08 E.02159
G1 X122.667 Y120.814 E.02779
M204 S10000
G1 X122.726 Y120.805 F42000
; LINE_WIDTH: 0.405389
G1 F7446.941
M204 S6000
G1 X122.76 Y120.814 E.0014
M204 S10000
G1 X125.306 Y121.161 F42000
; LINE_WIDTH: 0.396239
G1 F7649.646
M204 S6000
G1 X125.213 Y120.885 E.01117
G1 X125.011 Y120.782 E.00871
G1 X124.819 Y120.939 E.00952
G1 X125.05 Y121.228 E.01417
G1 X125.265 Y121.278 E.00848
G1 X125.286 Y121.218 E.00242
M204 S10000
G1 X125.629 Y120.949 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X125.437 Y120.612 E.01594
G1 X125.12 Y120.439 E.01482
G1 X124.925 Y120.429 E.00803
G1 X124.339 Y120.895 E.03076
G1 X124.807 Y121.482 E.03084
G1 X125.024 Y121.579 E.00975
G1 X125.34 Y121.627 E.01315
G1 X125.538 Y121.522 E.0092
G1 X125.65 Y121.213 E.01349
G1 X125.634 Y121.009 E.0084
M204 S10000
G1 X125.995 Y120.958 F42000
G1 F7144.644
M204 S6000
G1 X125.813 Y120.498 E.02029
G2 X125.326 Y120.114 I-1.209 J1.033 E.02564
G1 X124.861 Y120.074 E.01917
G1 X124.563 Y120.224 E.01369
G1 X123.799 Y120.879 E.04133
G1 X124.014 Y121.065 E.01167
G1 X124.555 Y121.743 E.0356
G1 X124.745 Y121.884 E.00971
G1 X125.266 Y122.005 E.02196
G1 X125.544 Y121.959 E.01157
G1 X125.827 Y121.736 E.0148
G1 X125.989 Y121.38 E.01604
G2 X125.997 Y121.018 I-.972 J-.204 E.01498
M204 S10000
G1 X126.322 Y120.731 F42000
; LINE_WIDTH: 0.419461
G1 F7155.324
M204 S6000
G1 X126.118 Y120.301 E.01951
G1 X125.916 Y120.063 E.01283
G1 X125.463 Y119.775 E.02198
G1 X124.958 Y119.709 E.0209
G1 X124.673 Y119.741 E.01174
G1 X124.235 Y120.032 E.02154
G1 X123.592 Y120.589 E.03491
G3 X122.881 Y120.848 I-1.165 J-2.093 E.03115
G1 X123.396 Y121.022 E.02228
G1 X123.733 Y121.29 E.01764
G1 X124.303 Y122.004 E.03746
G1 X124.59 Y122.217 E.01468
G1 X125.254 Y122.371 E.02793
G1 X125.681 Y122.301 E.01773
G1 X126.035 Y122.06 E.01759
G1 X126.239 Y121.716 E.01637
G2 X126.39 Y121.134 I-1.833 J-.784 E.02474
G1 X126.332 Y120.79 E.01429
; WIPE_START
G1 X126.39 Y121.134 E-.13243
G1 X126.362 Y121.32 E-.07127
G1 X126.239 Y121.716 E-.15773
G1 X126.035 Y122.06 E-.15175
G1 X125.681 Y122.301 E-.16306
G1 X125.463 Y122.337 E-.08376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.625 Y118.946 Z.88 F42000
G1 X111.97 Y115.645 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X112.053 Y115.77 E.00665
G3 X112.249 Y116.747 I-2.196 J.95 E.04467
G3 X111.576 Y120.283 I-11.121 J-.287 E.16083
G3 X110.996 Y121.269 I-2.669 J-.907 E.05122
G3 X110.007 Y121.701 I-1.239 J-1.488 E.04865
G3 X108.806 Y121.153 I-.006 J-1.575 E.06059
G3 X108.415 Y119.916 I1.743 J-1.23 E.05863
G3 X109.27 Y116.118 I12.183 J.745 E.1739
G3 X110.576 Y115.068 I1.501 J.53 E.0785
G1 X110.787 Y115.025 E.00962
G1 X111.161 Y115.12 E.01714
G3 X111.917 Y115.573 I-.263 J1.299 E.03995
G1 X111.935 Y115.597 E.00135
M204 S10000
G1 X111.663 Y115.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X111.874 Y116.753 I-1.617 J.853 E.03855
G3 X111.226 Y120.147 I-10.731 J-.288 E.14252
G3 X110.782 Y120.95 I-2.297 J-.747 E.0379
G3 X109.984 Y121.322 I-.977 J-1.055 E.03672
G3 X109.101 Y120.916 I-.011 J-1.141 E.04122
G3 X108.791 Y119.917 I1.382 J-.977 E.04366
G3 X109.42 Y116.784 I11.996 J.78 E.1316
G3 X109.703 Y116.087 I3.394 J.97 E.03093
G3 X110.651 Y115.435 I1.047 J.508 E.04943
G1 X110.778 Y115.409 E.00532
G1 X111.058 Y115.481 E.01187
G3 X111.625 Y115.802 I-.232 J1.071 E.02717
; WIPE_START
M204 S6000
G1 X111.765 Y116.047 E-.10731
G1 X111.802 Y116.168 E-.04809
G1 X111.853 Y116.48 E-.11988
G1 X111.874 Y116.753 E-.10406
G1 X111.825 Y117.585 E-.31701
G1 X111.802 Y117.751 E-.06365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.397 Y116.385 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G3 X106.217 Y115.152 I3.814 J1.65 E.06622
G1 X106.375 Y114.97 E.01071
G3 X107.948 Y114.042 I4.233 J5.372 E.08149
G3 X109.971 Y113.769 I1.939 J6.736 E.09111
G3 X112.159 Y114.155 I-.207 J7.56 E.0992
G3 X113.85 Y115.092 I-4.05 J9.311 E.08611
G3 X115.091 Y116.419 I-4.282 J5.244 E.08109
G3 X115.543 Y117.876 I-3.345 J1.837 E.0683
G1 X115.609 Y118.338 E.02075
G3 X113.658 Y121.982 I-4.55 J-.09 E.19087
G3 X111.959 Y122.711 I-2.96 J-4.556 E.08267
G3 X110.776 Y122.834 I-1.841 J-11.992 E.05292
G3 X108.655 Y122.515 I.212 J-8.629 E.09563
G3 X107.144 Y121.713 I2.163 J-5.901 E.07636
G1 X106.683 Y121.393 E.02495
G3 X105.512 Y119.883 I4.158 J-4.432 E.08535
G3 X105.168 Y118.39 I4.496 J-1.824 E.06844
G1 X105.126 Y117.973 E.01864
G3 X105.379 Y116.442 I6.162 J.233 E.06923
M204 S10000
G1 X105.047 Y116.248 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X105.932 Y114.909 I4.164 J1.789 E.06625
G1 X106.121 Y114.691 E.01189
G3 X107.826 Y113.687 I4.518 J5.724 E.08148
G3 X109.417 Y113.412 I1.895 J6.221 E.06648
G3 X110 Y113.395 I.351 J2.05 E.02402
G3 X112.294 Y113.806 I-.235 J7.925 E.09603
G3 X114.078 Y114.792 I-4.224 J9.743 E.08381
G3 X115.314 Y116.074 I-4.968 J6.025 E.07329
G3 X115.913 Y117.818 I-3.382 J2.138 E.0764
G1 X115.986 Y118.324 E.02099
G3 X113.868 Y122.295 I-4.949 J-.089 E.19181
G3 X112.028 Y123.08 I-3.181 J-4.905 E.08254
G3 X110.774 Y123.21 I-1.933 J-12.532 E.05179
G3 X108.748 Y122.935 I.455 J-10.947 E.08407
G3 X106.933 Y122.024 I1.66 J-5.569 E.0838
G1 X106.437 Y121.679 E.02479
G3 X105.25 Y120.197 I4.715 J-4.993 E.07825
G3 X104.795 Y118.432 I4.404 J-2.075 E.07526
G1 X104.749 Y117.975 E.01884
G3 X105.029 Y116.306 I6.578 J.246 E.06971
; WIPE_START
M204 S6000
G1 X105.186 Y115.941 E-.15091
G1 X105.382 Y115.614 E-.14494
G1 X105.676 Y115.217 E-.18747
G1 X105.932 Y114.909 E-.15213
G1 X106.121 Y114.691 E-.11003
G1 X106.153 Y114.668 E-.01453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.001 Y117.364 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.380479
G1 F8025.933
M204 S6000
G1 X107.08 Y117.049 E.01187
M204 S10000
G1 X107.868 Y115.716 F42000
; LINE_WIDTH: 0.424333
G1 F7059.615
M204 S6000
G1 X107.358 Y116.061 E.02561
G1 X106.89 Y116.658 E.03148
G1 X106.725 Y117.019 E.01652
G1 X106.664 Y117.443 E.01778
; LINE_WIDTH: 0.485674
G1 F6042.103
G1 X106.658 Y117.704 E.0127
; LINE_WIDTH: 0.546768
G1 F5283.616
G2 X106.814 Y119.012 I5.523 J.007 E.07328
G1 X106.933 Y119.308 E.01773
G1 X107.042 Y118.501 E.04517
; LINE_WIDTH: 0.555124
G1 F5194.438
G1 X107.177 Y117.812 E.03968
; LINE_WIDTH: 0.53769
G1 F5384.045
G1 X107.24 Y117.637 E.01015
; LINE_WIDTH: 0.490613
G1 F5972.774
G1 X107.304 Y117.461 E.00915
; LINE_WIDTH: 0.422469
G1 F7095.945
G2 X107.557 Y116.597 I-5.437 J-2.064 E.03728
G1 X107.848 Y115.773 E.03613
M204 S10000
G1 X108.663 Y114.995 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X108.205 Y115.12 E.01949
G1 X107.757 Y115.357 E.02079
G1 X107.115 Y115.791 E.03183
G1 X106.599 Y116.446 E.03425
G1 X106.382 Y116.896 E.02051
G2 X106.227 Y117.968 I5.693 J1.375 E.04452
G2 X106.403 Y119.125 I6.905 J-.463 E.04813
G1 X106.57 Y119.526 E.01784
G2 X107.387 Y120.543 I5.05 J-3.224 E.05367
G3 X107.344 Y119.52 I3.3 J-.65 E.04219
G3 X108.244 Y115.735 I14.412 J1.424 E.16026
G1 X108.555 Y115.146 E.02733
G1 X108.628 Y115.044 E.00516
M204 S10000
M73 P77 R3
G1 X109.881 Y114.501 F42000
G1 F7144.644
M204 S6000
G2 X108.464 Y114.658 I.703 J12.781 E.05859
G1 X108.043 Y114.799 E.01822
G1 X107.556 Y115.059 E.02266
G1 X106.872 Y115.52 E.03388
G2 X106.237 Y116.347 I4.262 J3.934 E.04287
G1 X106.035 Y116.799 E.02031
G2 X105.865 Y117.97 I5.796 J1.441 E.04866
G2 X106.056 Y119.221 I7.466 J-.498 E.05205
G1 X106.257 Y119.705 E.02154
G1 X106.615 Y120.213 E.02547
G1 X107.138 Y120.804 E.03243
G2 X108.132 Y121.457 I4.307 J-5.471 E.04886
G1 X107.95 Y121.137 E.01508
G1 X107.755 Y120.59 E.02386
G1 X107.684 Y119.98 E.02523
G3 X107.949 Y117.982 I10.67 J.4 E.08288
G3 X108.583 Y115.856 I13.036 J2.729 E.09121
G1 X108.87 Y115.32 E.02497
G1 X109.261 Y114.873 E.02437
G1 X109.826 Y114.525 E.02725
; WIPE_START
G1 X109.261 Y114.873 E-.25221
G1 X108.87 Y115.32 E-.22556
G1 X108.583 Y115.856 E-.23105
G1 X108.538 Y115.983 E-.05118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.498 Y118.195 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.416091
G1 F7223.057
M204 S6000
G3 X112.188 Y119.627 I-20.993 J-3.787 E.05948
G3 X111.697 Y120.928 I-8.312 J-2.398 E.05654
G1 X111.419 Y121.359 E.02085
G1 X111.089 Y121.682 E.01873
G1 X110.701 Y121.892 E.01795
G3 X109.988 Y122.064 I-1.166 J-3.282 E.02985
G1 X109.29 Y121.937 E.02878
; LINE_WIDTH: 0.422135
G1 F7102.487
G1 X108.877 Y121.739 E.01894
G1 X108.499 Y121.37 E.02181
G1 X108.285 Y121.006 E.01743
G1 X108.105 Y120.481 E.02294
G1 X108.041 Y119.938 E.02258
G3 X108.3 Y118.059 I10.776 J.529 E.07843
G3 X108.922 Y115.977 I12.625 J2.634 E.08987
G1 X109.185 Y115.494 E.02274
G1 X109.526 Y115.118 E.02094
G1 X109.97 Y114.852 E.02138
G1 X110.746 Y114.639 E.03323
; LINE_WIDTH: 0.469534
G1 F6280.273
G1 X110.929 Y114.659 E.00862
G3 X111.675 Y114.877 I-1.106 J5.168 E.0363
; LINE_WIDTH: 0.468591
G1 F6294.769
G1 X111.861 Y115.021 E.01098
; LINE_WIDTH: 0.421135
G1 F7122.155
G3 X112.298 Y115.449 I-.918 J1.375 E.02532
G1 X112.521 Y115.958 E.02291
G1 X112.617 Y116.669 E.02956
G3 X112.504 Y118.136 I-10.746 J-.086 E.06063
M204 S10000
G1 X114.061 Y118.616 F42000
; LINE_WIDTH: 0.528537
G1 F5489.248
M204 S6000
G1 X114.085 Y118.407 E.01124
G2 X113.871 Y117.366 I-4.317 J.347 E.0569
G1 X113.737 Y117.15 E.01359
G3 X113.459 Y119.174 I-11.071 J-.49 E.10932
G3 X113.108 Y120.486 I-9.689 J-1.889 E.07265
G1 X113.501 Y120.053 E.03125
G2 X113.913 Y119.288 I-2.284 J-1.725 E.0466
G1 X114.048 Y118.674 E.0336
M204 S10000
G1 X114.453 Y118.881 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X114.497 Y118.449 E.01784
G2 X114.273 Y117.268 I-4.318 J.206 E.04953
G1 X114.066 Y116.874 E.01825
G2 X113.264 Y116.04 I-4.085 J3.128 E.04763
G1 X113.338 Y116.635 E.02459
G3 X113.054 Y119.089 I-11.284 J-.061 E.10166
G3 X112.35 Y121.242 I-9.593 J-1.943 E.09321
G1 X112.187 Y121.496 E.01237
G2 X113.073 Y121.048 I-2.887 J-6.809 E.0408
G1 X113.539 Y120.642 E.02537
G2 X114.437 Y118.939 I-2.413 J-2.36 E.08013
M204 S10000
G1 X114.801 Y119.012 F42000
G1 F7144.644
M204 S6000
G2 X114.763 Y117.705 I-3.033 J-.566 E.05412
G1 X114.596 Y117.081 E.02653
G1 X114.339 Y116.639 E.02098
G2 X113.4 Y115.677 I-4.72 J3.663 E.05532
G2 X112.531 Y115.157 I-5.377 J8.021 E.04161
G1 X112.85 Y115.814 E.02997
G1 X112.974 Y116.625 E.03369
G3 X112.702 Y119.016 I-11.783 J-.131 E.09897
G3 X112.048 Y121.047 I-7.875 J-1.413 E.08791
G1 X111.722 Y121.554 E.02474
G1 X111.269 Y121.993 E.02588
G1 X111.136 Y122.07 E.00633
G1 X112.042 Y121.935 E.0376
G1 X112.539 Y121.748 E.02182
G1 X113.25 Y121.367 E.03312
G1 X113.65 Y121.039 E.02127
G1 X114.116 Y120.522 E.02855
G2 X114.784 Y119.07 I-3.36 J-2.425 E.06605
M204 S10000
G1 X115.156 Y119.082 F42000
G1 F7144.644
M204 S6000
G2 X115.129 Y117.681 I-3.625 J-.633 E.05789
G1 X114.933 Y116.948 E.03117
G1 X114.695 Y116.501 E.0208
G2 X113.621 Y115.39 I-5.441 J4.188 E.06358
G2 X112.405 Y114.674 I-7.421 J11.208 E.05794
; LINE_WIDTH: 0.436196
G1 F6836.951
G1 X112.134 Y114.586 E.01226
; LINE_WIDTH: 0.470565
G1 F6264.491
G2 X111.027 Y114.274 I-3.49 J10.261 E.05385
; LINE_WIDTH: 0.422193
G1 F7101.351
G1 X109.966 Y114.148 E.04414
G1 X109.465 Y114.161 E.0207
G1 X108.385 Y114.306 E.04503
G2 X107.403 Y114.728 I.864 J3.364 E.04433
G1 X106.63 Y115.25 E.03855
G2 X105.964 Y116.096 I5.346 J4.893 E.04451
G1 X105.724 Y116.601 E.02312
G2 X105.553 Y118.422 I4.483 J1.339 E.07602
G1 X105.69 Y119.228 E.03377
G1 X105.854 Y119.726 E.02165
G2 X106.929 Y121.107 I5.623 J-3.265 E.07254
G2 X108.275 Y121.954 I6.128 J-8.25 E.06576
G1 X108.762 Y122.135 E.02146
; LINE_WIDTH: 0.419918
G1 F7146.24
G1 X109.603 Y122.351 E.03565
G2 X110.757 Y122.457 I1.758 J-12.817 E.04758
G2 X112.132 Y122.285 I-.785 J-11.9 E.05692
G1 X112.688 Y122.077 E.02436
G1 X113.45 Y121.669 E.03549
G2 X115.139 Y119.14 I-2.531 J-3.518 E.12754
; WIPE_START
G1 X115 Y119.609 E-.18583
G1 X114.772 Y120.147 E-.22212
G1 X114.58 Y120.472 E-.14344
G1 X114.268 Y120.916 E-.20618
G1 X114.264 Y120.921 E-.00243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.636 Y121.201 Z.88 F42000
G1 X97.924 Y121.522 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X97.9 Y121.548 E.00159
G2 X97.672 Y122.42 I.993 J.726 E.04103
G2 X97.94 Y124.593 I10.883 J-.238 E.09757
G1 X98.066 Y124.992 E.01863
G2 X98.93 Y125.588 I1.273 J-.921 E.04761
G2 X100.001 Y125.61 I.636 J-4.973 E.04776
G2 X101.945 Y125.401 I-.424 J-13.092 E.08706
G2 X103.313 Y124.553 I-.689 J-2.637 E.07267
G3 X104.197 Y123.626 I5.965 J4.805 E.05703
G3 X104.508 Y123.648 I.088 J.986 E.01397
G3 X104.802 Y124.379 I-.552 J.647 E.03645
G3 X104.534 Y125.699 I-4.076 J-.14 E.0602
G3 X103.927 Y126.639 I-3.835 J-1.813 E.04989
G3 X103.754 Y126.684 I-.172 J-.308 E.00803
G2 X98.682 Y126.468 I-4.232 J39.814 E.226
G2 X94.139 Y126.64 I-.177 J55.315 E.20226
G3 X93.173 Y126.601 I-.36 J-3 E.04319
G3 X92.737 Y126.33 I.41 J-1.148 E.02302
G3 X92.701 Y126.143 I1.441 J-.376 E.00846
G3 X93.205 Y125.869 I1.233 J1.667 E.02561
G2 X94.133 Y124.705 I-.768 J-1.565 E.06844
G2 X94.277 Y122.7 I-13.873 J-2.002 E.08949
G2 X94.187 Y117.754 I-65.017 J-1.297 E.22009
G1 X94.091 Y116.427 E.05922
G2 X93.599 Y115.322 I-1.86 J.166 E.05476
G2 X92.713 Y114.796 I-1.656 J1.78 E.04621
G3 X92.558 Y114.524 I.099 J-.237 E.01496
G3 X92.929 Y114.047 I.56 J.052 E.02841
G3 X95.598 Y113.828 I2.213 J10.604 E.11945
G1 X96.211 Y113.833 E.02723
G3 X99.109 Y114.122 I-.045 J15.149 E.12979
G3 X99.475 Y114.278 I-.569 J1.838 E.01773
G3 X99.545 Y114.659 I-.473 J.283 E.01759
G3 X99.407 Y114.772 I-.168 J-.063 E.00829
G2 X98.672 Y114.917 I.844 J6.234 E.03334
G2 X98.132 Y115.349 I.707 J1.436 E.03101
G2 X97.68 Y117.326 I3.754 J1.898 E.09109
G2 X97.701 Y119.012 I418.753 J-4.22 E.07499
G2 X97.992 Y119.742 I1.845 J-.311 E.03524
G2 X99.331 Y120.046 I1.035 J-1.455 E.06272
G2 X100.832 Y118.97 I-.132 J-1.77 E.08641
G2 X101.01 Y117.988 I-6.35 J-1.655 E.04445
G1 X101.045 Y117.835 E.00696
G3 X101.454 Y118.078 I.003 J.461 E.02224
G3 X101.906 Y120.089 I-3.98 J1.95 E.0925
G3 X101.945 Y121.487 I-44.602 J1.967 E.06222
G3 X101.662 Y122.421 I-1.417 J.081 E.04434
G3 X101.195 Y122.786 I-1.784 J-1.805 E.02644
G3 X100.994 Y122.551 I.087 J-.277 E.0145
G2 X100.785 Y121.829 I-10.525 J2.662 E.03343
G2 X100.404 Y121.325 I-1.579 J.796 E.02829
G2 X99.402 Y121.054 I-.946 J1.515 E.04682
G2 X98.193 Y121.263 I-.143 J2.777 E.05505
G1 X97.968 Y121.48 E.01393
M204 S10000
G1 X98.197 Y121.786 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X98.047 Y122.408 I.697 J.498 E.02696
G2 X98.3 Y124.489 I10.568 J-.231 E.0862
G1 X98.398 Y124.799 E.01338
G2 X99.436 Y125.252 I.903 J-.655 E.04878
G2 X101.853 Y125.036 I-.113 J-14.915 E.09973
G2 X103.04 Y124.295 I-.584 J-2.257 E.05834
G3 X103.933 Y123.342 I11.784 J10.139 E.05366
G3 X105.069 Y123.779 I.387 J.69 E.05704
G3 X105.141 Y124.786 I-1.727 J.629 E.042
G3 X104.564 Y126.409 I-3.181 J-.216 E.07161
G3 X104.12 Y126.964 I-1.7 J-.905 E.02937
G3 X103.728 Y127.058 I-.352 J-.607 E.01677
G2 X98.683 Y126.843 I-4.207 J39.494 E.20747
G2 X94.157 Y127.015 I-.177 J55.015 E.18601
G3 X93.056 Y126.957 I-.381 J-3.268 E.04551
G3 X92.393 Y126.476 I.294 J-1.103 E.03439
G3 X92.43 Y125.882 I.543 J-.264 E.02558
G3 X93.029 Y125.538 I1.331 J1.622 E.02847
G2 X93.766 Y124.619 I-.566 J-1.21 E.05008
G2 X93.902 Y122.697 I-13.351 J-1.911 E.07918
G2 X93.813 Y117.779 I-64.618 J-1.294 E.20203
G1 X93.719 Y116.477 E.05359
G2 X93.338 Y115.591 I-1.483 J.113 E.04035
G2 X92.547 Y115.132 I-1.588 J1.827 E.03776
G3 X92.18 Y114.524 I.272 J-.578 E.0309
G3 X92.82 Y113.686 I.909 J.031 E.0462
G3 X95.6 Y113.453 I2.321 J11.017 E.11482
G1 X96.217 Y113.459 E.02533
G3 X99.202 Y113.758 I-.055 J15.599 E.12339
G3 X99.775 Y114.056 I-.292 J1.262 E.02681
G3 X99.918 Y114.733 I-.782 J.519 E.02913
G3 X99.489 Y115.139 I-.565 J-.168 E.02541
G2 X98.805 Y115.271 I.752 J5.73 E.02862
G2 X98.454 Y115.552 I.463 J.94 E.01859
G2 X98.055 Y117.326 I3.364 J1.687 E.07541
G2 X98.092 Y119.087 I25.763 J.348 E.07234
G2 X98.269 Y119.47 I1.262 J-.35 E.0174
G2 X99.039 Y119.688 I.7 J-1.006 E.03347
G2 X100.393 Y119.014 I.096 J-1.504 E.06506
G2 X100.57 Y118.438 I-1.66 J-.827 E.02484
G3 X100.718 Y117.672 I2.91 J.165 E.03214
G3 X101.329 Y117.512 I.413 J.333 E.02775
G3 X101.782 Y117.891 I-.291 J.809 E.02479
G3 X102.28 Y120.079 I-4.345 J2.14 E.09298
G3 X102.32 Y121.5 I-44.268 J1.948 E.05836
G3 X101.939 Y122.675 I-1.788 J.069 E.0518
G3 X101.246 Y123.199 I-2.352 J-2.388 E.03575
G3 X100.677 Y122.772 I.118 J-.75 E.03043
G1 X100.656 Y122.718 E.00236
G2 X100.444 Y121.986 I-19.082 J5.134 E.03132
G2 X100.174 Y121.629 I-1.119 J.566 E.01848
G2 X99.397 Y121.429 I-.709 J1.149 E.03343
G2 X98.386 Y121.594 I-.144 J2.301 E.04243
G2 X98.233 Y121.738 I.508 J.69 E.00864
; WIPE_START
M204 S6000
G1 X98.095 Y121.953 E-.0973
G1 X98.053 Y122.15 E-.07654
G1 X98.047 Y122.408 E-.09802
G1 X98.101 Y123.29 E-.33576
G1 X98.155 Y123.688 E-.15239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.307 Y118.849 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35564
G1 F8700.432
M204 S6000
G1 X101.234 Y118.113 E.02492
M204 S10000
G1 X101.218 Y118.095 F42000
; LINE_WIDTH: 0.252378
G1 F12000
M204 S6000
G1 X101.32 Y118.85 E.01672
M204 S10000
G1 X101.414 Y118.862 F42000
; LINE_WIDTH: 0.16068
G1 F12000
M204 S6000
G2 X101.193 Y118.073 I-14.954 J3.768 E.0094
; WIPE_START
G1 X101.414 Y118.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.117 Y115.619 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373269
G1 F8210.694
M204 S6000
G1 X95.721 Y115.62 E.01416
G1 X95.883 Y116.22 E.02219
; LINE_WIDTH: 0.40132
G1 F7535.731
G1 X95.915 Y116.41 E.00753
G1 X96.066 Y115.807 E.02421
; LINE_WIDTH: 0.362429
G1 F8505.089
G1 X96.102 Y115.677 E.00464
M204 S10000
G1 X95.915 Y116.41 F42000
; LINE_WIDTH: 0.417639
G1 F7191.801
M204 S6000
G1 X95.914 Y116.526 E.00472
; WIPE_START
G1 X95.915 Y116.41 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.571 Y121.282 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F7167.711
M204 S6000
G2 X101.521 Y119.833 I-212.202 J6.615 E.05934
G1 X101.432 Y119.246 E.02431
G1 X101.183 Y119.302 E.01044
G1 X101.108 Y119.259 E.00357
G3 X100.544 Y119.951 I-2.704 J-1.627 E.03667
G1 X99.99 Y120.274 E.02624
G3 X98.852 Y120.413 I-1.018 J-3.594 E.04711
G1 X98.293 Y120.326 E.02316
G1 X97.849 Y120.091 E.02055
G1 X97.687 Y119.968 E.00833
G1 X97.424 Y119.466 E.02321
G1 X97.326 Y119.035 E.01807
G1 X97.31 Y117.049 E.0813
G3 X97.47 Y116.024 I3.902 J.084 E.04259
G1 X97.799 Y115.174 E.0373
G1 X98.247 Y114.727 E.0259
G1 X98.569 Y114.555 E.01493
G1 X98.955 Y114.476 E.01613
G2 X96.203 Y114.208 I-3.045 J17.01 E.11332
G1 X94.631 Y114.211 E.06434
G1 X93.772 Y114.282 E.03524
G1 X92.996 Y114.44 E.03242
G1 X92.963 Y114.485 E.00228
G1 X93.308 Y114.644 E.01556
G1 X93.714 Y114.927 E.02025
G1 X94.096 Y115.333 E.02282
G1 X94.268 Y115.655 E.01495
G1 X94.458 Y116.351 E.02954
G3 X94.644 Y119.781 I-67.528 J5.386 E.14062
G1 X94.645 Y123.156 E.13811
G3 X94.492 Y124.816 I-17.03 J-.73 E.06824
G1 X94.313 Y125.285 E.02057
G1 X94.073 Y125.663 E.01833
G1 X93.655 Y126.031 E.02276
G1 X93.297 Y126.237 E.01691
G1 X93.755 Y126.275 E.0188
G1 X96.892 Y126.115 E.12854
G1 X98.381 Y126.102 E.06095
G1 X98.405 Y125.781 E.01321
G1 X98.26 Y125.698 E.00684
G1 X97.768 Y125.222 E.02802
G1 X97.478 Y124.258 E.04118
G1 X97.328 Y123.077 E.04872
G1 X97.293 Y122.28 E.03266
G1 X97.377 Y121.735 E.02259
G1 X97.624 Y121.291 E.02077
G1 X98.035 Y120.92 E.02269
G1 X98.544 Y120.759 E.02183
; LINE_WIDTH: 0.39319
G1 F7719.646
G1 X99.044 Y120.711 E.01909
G1 X99.959 Y120.748 E.03482
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X100.1 Y120.774 E.00586
G1 X100.596 Y121 E.0224
G1 X100.928 Y121.352 E.01987
G1 X101.179 Y121.81 E.02145
G1 X101.299 Y122.224 E.0177
G1 X101.415 Y122.115 E.00653
G1 X101.53 Y121.816 E.01317
G1 X101.566 Y121.342 E.01952
M204 S10000
G1 X101.159 Y120.998 F42000
; LINE_WIDTH: 0.507118
G1 F5752.251
M204 S6000
G1 X101.121 Y119.931 E.05445
G1 X100.79 Y120.275 E.02432
G1 X100.433 Y120.482 E.02103
G1 X100.807 Y120.655 E.02097
G1 X101.116 Y120.957 E.02204
M204 S10000
G1 X97.963 Y120.565 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X97.587 Y120.358 E.01765
G1 X97.368 Y120.135 E.01282
G1 X97.105 Y119.633 E.02328
G1 X96.977 Y119.142 E.02082
G3 X96.95 Y117.052 I154.131 J-3.016 E.08583
G3 X97.112 Y115.959 I4.472 J.103 E.04546
G1 X97.468 Y115.034 E.04072
G3 X97.785 Y114.67 I1.035 J.582 E.01996
G2 X94.646 Y114.571 I-2.341 J24.503 E.12905
G1 X93.92 Y114.631 E.02993
G1 X94.358 Y115.086 E.02594
G1 X94.573 Y115.451 E.01738
G3 X94.874 Y117.061 I-4.875 J1.747 E.06756
G3 X95.004 Y120.149 I-59.116 J4.031 E.12692
G1 X95.005 Y123.156 E.12344
G3 X94.829 Y124.944 I-14.192 J-.497 E.07381
G1 X94.65 Y125.414 E.02064
G1 X94.352 Y125.885 E.02288
G1 X96.873 Y125.756 E.10366
G3 X97.793 Y125.748 I5.337 J541.152 E.03777
G1 X97.517 Y125.48 E.01576
G1 X97.339 Y125.113 E.01678
G1 X97.127 Y124.341 E.03287
G3 X96.934 Y122.295 I16.616 J-2.607 E.08442
G1 X97.022 Y121.677 E.02561
G1 X97.277 Y121.159 E.02372
G1 X97.642 Y120.773 E.02182
G1 X97.909 Y120.589 E.01332
M204 S10000
G1 X97.314 Y120.59 F42000
; LINE_WIDTH: 0.419998
G1 F7144.654
M204 S6000
G1 X97.087 Y120.368 E.01304
G1 X96.786 Y119.8 E.0264
G1 X96.627 Y119.229 E.02433
G3 X96.59 Y117.055 I29.788 J-1.596 E.0893
G3 X97.105 Y114.968 I5.445 J.236 E.08881
G2 X94.693 Y114.931 I-1.614 J26.447 E.09907
G1 X94.963 Y115.466 E.02458
G1 X95.152 Y116.162 E.02963
G3 X95.364 Y120.149 I-42.58 J4.259 E.16401
G1 X95.365 Y123.156 E.12344
G3 X95.165 Y125.072 I-12.951 J-.382 E.07917
G1 X95.005 Y125.491 E.0184
G1 X97.063 Y125.394 E.08456
G1 X96.784 Y124.448 E.04048
G3 X96.574 Y122.31 I16.001 J-2.649 E.08829
G1 X96.667 Y121.62 E.02857
G1 X96.772 Y121.32 E.01305
G1 X97.057 Y120.846 E.02273
G1 X97.271 Y120.632 E.01242
M204 S10000
G1 X96.804 Y120.59 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X96.467 Y119.966 E.02909
; LINE_WIDTH: 0.444041
G1 F6697.257
G1 X96.348 Y119.642 E.01515
; LINE_WIDTH: 0.507226
G1 F5750.866
G1 X96.229 Y119.317 E.01764
G1 X96.196 Y118.688 E.03211
; LINE_WIDTH: 0.534189
G1 F5423.806
G2 X96.162 Y117.058 I-168.495 J2.709 E.0882
; LINE_WIDTH: 0.534307
G1 F5422.457
G1 X96.201 Y116.853 E.01129
; LINE_WIDTH: 0.488584
G1 F6001.07
G1 X96.24 Y116.648 E.0102
; LINE_WIDTH: 0.421234
G1 F7120.209
G3 X96.39 Y115.875 I109.168 J20.732 E.03243
G1 X96.575 Y115.305 E.02468
G2 X95.278 Y115.29 I-.932 J23.682 E.05345
G3 X95.55 Y116.437 I-5.381 J1.882 E.04865
; LINE_WIDTH: 0.44325
G1 F6711.08
G1 X95.588 Y116.626 E.00843
; LINE_WIDTH: 0.489754
G1 F5984.729
G1 X95.625 Y116.815 E.00945
; LINE_WIDTH: 0.53124
G1 F5457.759
G1 X95.663 Y117.004 E.01036
G3 X95.764 Y119.349 I-103.673 J5.63 E.12618
; LINE_WIDTH: 0.505607
G1 F5771.768
G1 X95.75 Y119.616 E.01357
; LINE_WIDTH: 0.471364
G1 F6252.334
G1 X95.737 Y119.883 E.01252
; LINE_WIDTH: 0.42428
G1 F7060.644
G2 X95.724 Y120.95 I10.71 J.664 E.04436
; LINE_WIDTH: 0.439237
G1 F6782.118
G1 X95.743 Y121.138 E.00821
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X95.763 Y121.327 E.00904
; LINE_WIDTH: 0.50446
G1 F5786.67
G1 X95.782 Y121.516 E.00962
G2 X95.765 Y123.1 I18.325 J.988 E.08034
; LINE_WIDTH: 0.480554
G1 F6115.678
G1 X95.724 Y123.521 E.02028
; LINE_WIDTH: 0.422297
G1 F7099.309
G3 X95.525 Y125.104 I-19.608 J-1.66 E.06594
G1 X96.575 Y125.05 E.04347
G3 X96.355 Y124.009 I4.237 J-1.438 E.04407
; LINE_WIDTH: 0.441299
G1 F6745.439
G1 X96.285 Y123.612 E.01754
; LINE_WIDTH: 0.491619
G1 F5958.855
G1 X96.214 Y123.215 E.01985
G1 X96.182 Y122.326 E.0438
; LINE_WIDTH: 0.497636
G1 F5876.913
G1 X96.218 Y121.94 E.01936
; LINE_WIDTH: 0.522831
G1 F5556.932
G1 X96.254 Y121.554 E.02047
; LINE_WIDTH: 0.51619
G1 F5637.841
G1 X96.386 Y121.304 E.0147
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X96.518 Y121.054 E.01346
; LINE_WIDTH: 0.431167
G1 F6929.607
G3 X96.769 Y120.639 I1.649 J.711 E.02062
M204 S10000
G1 X96.401 Y120.567 F42000
; LINE_WIDTH: 0.375279
G1 F8158.344
M204 S6000
G3 X96.061 Y119.847 I2.98 J-1.843 E.02871
G1 X96.062 Y121.271 E.0512
G3 X96.371 Y120.619 I1.89 J.498 E.02606
M204 S10000
G1 X96.059 Y124.602 F42000
; LINE_WIDTH: 0.546008
G1 F5291.877
M204 S6000
G2 X96.059 Y124.707 I-.025 J.052 E.0129
M204 S10000
G1 X98.763 Y126.018 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.525477
G1 F5525.343
M204 S6000
G2 X99.056 Y126.04 I.648 J-6.787 E.0156
G1 X100.384 Y126.033 E.07052
; LINE_WIDTH: 0.579641
G1 F4949.31
G1 X101.101 Y126.011 E.04249
; WIPE_START
G1 X100.384 Y126.033 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.378 Y124.095 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X104.325 Y124.009 E.00412
G3 X103.174 Y125.197 I-11.443 J-9.938 E.06797
G1 X102.649 Y125.531 E.02552
G1 X102.058 Y125.759 E.02603
G1 X101.469 Y125.846 E.02441
G1 X101.481 Y126.134 E.01184
G3 X103.724 Y126.305 I-4.456 J73.076 E.09236
G2 X104.238 Y125.436 I-5.31 J-3.729 E.04148
G1 X104.343 Y125.049 E.0165
G1 X104.425 Y124.379 E.0277
G1 X104.388 Y124.154 E.00936
M204 S10000
G1 X103.98 Y124.93 F42000
; LINE_WIDTH: 0.449309
G1 F6606.62
M204 S6000
G3 X102.848 Y125.848 I-3.189 J-2.773 E.06504
G2 X103.535 Y125.914 I2.09 J-18.151 E.03066
G1 X103.8 Y125.49 E.0222
G1 X103.973 Y124.989 E.02351
; OBJECT_ID: 941
; WIPE_START
G1 X103.8 Y125.49 E-.20123
G1 X103.535 Y125.914 E-.19001
G1 X102.848 Y125.848 E-.26233
G1 X103.085 Y125.699 E-.10644
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 783
M625
; start printing object, unique label id: 941
M624 BAAAAAAAAAA=
M204 S10000
G1 X110.248 Y123.063 Z.88 F42000
G1 X156.235 Y106.138 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X156.2 Y106.157 E.00177
G2 X155.936 Y106.319 I.645 J1.349 E.01379
G2 X155.661 Y107.282 I.864 J.768 E.04609
G3 X155.655 Y107.57 I-.721 J.129 E.01289
G1 X155.591 Y107.657 E.00481
G3 X153.971 Y107.298 I.861 J-7.732 E.07393
G3 X151.627 Y106.446 I3.647 J-13.692 E.11111
G1 X151.376 Y106.307 E.01276
G3 X151.413 Y105.972 I.09 J-.159 E.01899
G2 X152.251 Y105.212 I-1.364 J-2.347 E.0507
G2 X152.408 Y104.202 I-3.009 J-.985 E.04566
G2 X152.263 Y100.741 I-37.705 J-.155 E.15413
G1 X152.187 Y100.272 E.02117
G2 X151.433 Y99.378 I-1.685 J.657 E.05294
G3 X151.971 Y98.816 I1.377 J.778 E.03496
G3 X152.957 Y98.685 I.762 J1.966 E.04466
G2 X154.754 Y98.754 I41.593 J-1071.266 E.07999
G3 X155.97 Y98.973 I-.866 J8.284 E.05501
G3 X156.315 Y99.162 I-.125 J.64 E.0178
G3 X156.375 Y99.341 I-1.268 J.524 E.00842
G2 X155.801 Y100.357 I7.202 J4.744 E.05197
G2 X155.7 Y101.282 I4.234 J.928 E.04145
G1 X155.701 Y103.603 E.10326
G2 X156.023 Y105.203 I3.972 J.032 E.07313
G2 X156.906 Y105.848 I1.409 J-1.001 E.04949
G2 X158.376 Y105.68 I.519 J-1.978 E.06734
G2 X158.944 Y105.067 I-1.223 J-1.703 E.03743
G2 X159.315 Y103.218 I-4.939 J-1.953 E.08435
G2 X159.275 Y101.096 I-13.42 J-.809 E.09451
G2 X158.846 Y99.645 I-6.215 J1.05 E.06747
G3 X158.464 Y99.212 I3.656 J-3.603 E.02569
G3 X158.562 Y99.002 I.231 J-.02 E.01078
G3 X158.962 Y98.858 I.478 J.7 E.01912
G3 X160.6 Y98.727 I1.294 J5.914 E.07332
G3 X163.068 Y98.965 I.292 J9.886 E.11058
G3 X163.368 Y99.115 I-.656 J1.686 E.01492
G3 X163.445 Y99.384 I-1.088 J.456 E.01245
G2 X162.747 Y100.223 I5.5 J5.286 E.0486
G2 X162.556 Y101.06 I1.929 J.879 E.03847
G1 X162.416 Y104.587 E.15698
G3 X162.143 Y106.269 I-6.02 J-.114 E.07605
G3 X161.03 Y107.361 I-1.932 J-.854 E.07104
G3 X159.364 Y107.635 I-1.278 J-2.574 E.07625
G3 X158.308 Y107.322 I.053 J-2.114 E.04954
G3 X157.386 Y106.379 I3.907 J-4.744 E.05879
G2 X156.657 Y106.023 I-1.039 J1.202 E.03648
G1 X156.293 Y106.122 E.01679
M204 S10000
G1 X156.348 Y106.495 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X156.13 Y106.671 I.344 J.648 E.01158
G2 X156.035 Y107.261 I.861 J.44 E.02492
G3 X155.895 Y107.876 I-.715 J.16 E.02679
G3 X155.545 Y108.029 I-.352 J-.329 E.01612
G3 X153.867 Y107.658 I.912 J-8.118 E.07068
G3 X151.45 Y106.777 I3.733 J-13.994 E.10578
G1 X151.155 Y106.613 E.01385
G3 X151.189 Y105.671 I.29 J-.461 E.04673
G2 X151.909 Y105.04 I-1.123 J-2.006 E.03962
G2 X152.033 Y104.198 I-2.533 J-.804 E.03507
G2 X151.892 Y100.794 I-37.587 J-.145 E.13995
G1 X151.825 Y100.379 E.01725
G2 X151.453 Y99.864 I-.997 J.329 E.02649
G3 X151.036 Y99.471 I.616 J-1.07 E.02373
G3 X151.014 Y99.342 I.376 J-.131 E.00543
G3 X151.717 Y98.527 I2.033 J1.043 E.04459
G3 X152.965 Y98.31 I1.009 J2.114 E.05266
G2 X154.647 Y98.37 I4.715 J-110.065 E.06911
G3 X156.082 Y98.614 I-.737 J8.665 E.05985
G3 X156.62 Y98.936 I-.265 J1.051 E.0261
G3 X156.753 Y99.302 I-1.619 J.798 E.01604
G3 X156.52 Y99.819 I-.908 J-.1 E.02365
G2 X156.159 Y100.477 I4.355 J2.811 E.03085
G2 X156.075 Y101.284 I3.695 J.794 E.03337
G1 X156.076 Y103.597 E.09495
G2 X156.352 Y105.007 I3.502 J.048 E.05945
G2 X157.46 Y105.539 I1.03 J-.728 E.05271
G2 X158.311 Y105.256 I.033 J-1.323 E.03756
G2 X158.606 Y104.895 I-1.804 J-1.774 E.0192
G2 X158.94 Y103.206 I-4.513 J-1.771 E.07104
G2 X158.904 Y101.151 I-13.073 J-.799 E.08447
G2 X158.52 Y99.843 I-5.653 J.953 E.05612
G3 X158.121 Y99.383 I3.876 J-3.761 E.02499
G3 X158.129 Y98.994 I.478 J-.185 E.0164
G3 X158.441 Y98.637 I.497 J.118 E.02026
G1 X158.545 Y98.58 E.00486
G3 X160.601 Y98.353 I1.706 J6.027 E.08532
G3 X163.178 Y98.605 I.291 J10.319 E.10662
G3 X163.701 Y98.946 I-.255 J.962 E.02606
G3 X163.803 Y99.486 I-.817 J.433 E.0229
G3 X163.535 Y99.834 I-.849 J-.376 E.01822
G2 X163.079 Y100.403 I4 J3.668 E.02997
G2 X162.93 Y101.083 I1.543 J.693 E.02875
G1 X162.79 Y104.606 E.1448
G3 X162.493 Y106.407 I-6.466 J-.142 E.07517
G3 X161.202 Y107.695 I-2.299 J-1.014 E.07665
G3 X159.324 Y108.008 I-1.45 J-2.912 E.07932
G3 X157.974 Y107.54 I.074 J-2.397 E.05958
G3 X157.123 Y106.647 I4.346 J-4.993 E.0507
G1 X157.082 Y106.612 E.00223
G2 X156.643 Y106.411 I-.725 J1.006 E.01995
G2 X156.402 Y106.469 I.049 J.732 E.01025
; WIPE_START
M204 S6000
G1 X156.195 Y106.592 E-.09121
G1 X156.13 Y106.671 E-.03909
G1 X156.088 Y106.753 E-.03473
G1 X156.046 Y106.912 E-.06275
G1 X156.024 Y107.105 E-.07374
G1 X156.035 Y107.261 E-.05937
G1 X156.045 Y107.493 E-.08815
G1 X156.014 Y107.685 E-.0738
G1 X155.895 Y107.876 E-.08578
G1 X155.737 Y107.992 E-.07429
G1 X155.545 Y108.029 E-.07442
G1 X155.538 Y108.028 E-.00267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.994 Y106.142 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.478948
G1 F6139.118
M204 S6000
G1 X160.378 Y106.022 E.01923
G1 X160.688 Y105.808 E.01801
G1 X160.76 Y105.654 E.00812
G1 X160.895 Y105.107 E.02692
; LINE_WIDTH: 0.447009
G1 F6645.892
G1 X160.932 Y104.807 E.01336
; LINE_WIDTH: 0.421448
G1 F7115.975
G1 X160.969 Y104.506 E.01248
; LINE_WIDTH: 0.374578
G1 F8176.525
G2 X161.084 Y102.022 I-71.712 J-4.555 E.08922
; LINE_WIDTH: 0.389933
G1 F7795.87
G1 X161.091 Y101.509 E.01931
; LINE_WIDTH: 0.415684
G1 F7231.341
G1 X161.099 Y100.996 E.02082
; LINE_WIDTH: 0.447888
G1 F6630.812
G1 X161.106 Y100.736 E.01147
; LINE_WIDTH: 0.494749
G1 F5915.951
G3 X161.167 Y100.233 I1.409 J-.087 E.0253
G1 X160.613 Y100.228 E.02746
G1 X160.715 Y100.782 E.02796
; LINE_WIDTH: 0.443339
G1 F6709.533
G1 X160.731 Y100.999 E.00952
; LINE_WIDTH: 0.415684
G1 F7231.341
G1 X160.749 Y101.512 E.02082
; LINE_WIDTH: 0.373342
G1 F8208.782
G3 X160.767 Y102.128 I-9.277 J.586 E.02203
G1 X160.731 Y103.487 E.04857
G1 X160.679 Y104.104 E.02211
; LINE_WIDTH: 0.403154
G1 F7495.456
G1 X160.58 Y104.705 E.02385
; LINE_WIDTH: 0.440129
G1 F6766.205
G1 X160.466 Y105.125 E.01885
; LINE_WIDTH: 0.477247
G1 F6164.146
G1 X160.352 Y105.544 E.02069
G1 X160.146 Y105.942 E.02133
G1 X160.03 Y106.094 E.0091
M204 S10000
G1 X159.136 Y106.477 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X159.692 Y106.562 E.02308
G1 X160.253 Y106.49 E.02323
G1 X160.572 Y106.362 E.01412
G1 X160.932 Y106.116 E.01792
G1 X161.114 Y105.859 E.01295
G1 X161.275 Y105.15 E.02985
G1 X161.323 Y104.523 E.02578
G1 X161.463 Y101.005 E.14459
G1 X161.527 Y100.441 E.02329
G3 X161.715 Y99.856 I25.795 J7.941 E.02523
G2 X160.073 Y99.825 I-1.359 J29.015 E.06744
G3 X160.367 Y101.021 I-7.992 J2.601 E.05062
G3 X160.431 Y102.121 I-13.162 J1.312 E.04523
G1 X160.4 Y103.48 E.05581
G3 X159.979 Y105.427 I-7.059 J-.506 E.08209
G1 X159.796 Y105.756 E.01543
G1 X159.453 Y106.189 E.02268
G1 X159.18 Y106.437 E.01514
M204 S10000
G1 X158.444 Y106.461 F42000
G1 F7144.644
M204 S6000
G1 X158.803 Y106.753 E.01899
G2 X159.75 Y106.919 I1.188 J-4.009 E.03957
G1 X160.322 Y106.843 E.02369
G2 X161.111 Y106.442 I-.597 J-2.145 E.03657
G2 X161.453 Y105.994 I-1.064 J-1.167 E.02326
G1 X161.632 Y105.203 E.03328
G1 X161.682 Y104.544 E.02714
G1 X161.822 Y101.021 E.14477
G1 X161.88 Y100.513 E.02098
G1 X162.035 Y100.035 E.02064
G3 X162.329 Y99.575 I1.441 J.6 E.02253
G2 X160.437 Y99.465 I-1.571 J10.65 E.07792
G1 X159.573 Y99.497 E.03548
G3 X160.008 Y101.043 I-7.562 J2.959 E.06604
G3 X160.071 Y102.113 I-12.719 J1.285 E.04399
G1 X160.04 Y103.48 E.05618
M73 P78 R3
G3 X159.635 Y105.32 I-6.689 J-.506 E.07758
G3 X158.997 Y106.131 I-2.95 J-1.664 E.04252
G1 X158.501 Y106.441 E.02404
M204 S10000
G1 X157.756 Y106.256 F42000
G1 F7144.644
M204 S6000
G2 X158.586 Y107.053 I3.751 J-3.082 E.04735
G1 X158.987 Y107.183 E.01731
G1 X159.666 Y107.287 E.02817
G2 X160.682 Y107.101 I-.022 J-3 E.04261
G1 X161.246 Y106.807 E.02613
G1 X161.561 Y106.515 E.01765
G1 X161.791 Y106.129 E.01845
G1 X161.989 Y105.257 E.0367
G1 X162.042 Y104.565 E.02849
G1 X162.182 Y101.038 E.14496
G1 X162.238 Y100.565 E.01953
G1 X162.401 Y100.074 E.02124
G3 X162.985 Y99.343 I27.243 J21.188 E.03843
G2 X161.047 Y99.104 I-1.987 J8.139 E.08036
G1 X159.976 Y99.106 E.04399
G2 X158.993 Y99.245 I-.028 J3.351 E.04091
G1 X159.198 Y99.515 E.01392
G1 X159.473 Y100.287 E.03367
G1 X159.649 Y101.065 E.03273
G3 X159.711 Y102.104 I-12.161 J1.252 E.04276
G1 X159.68 Y103.466 E.05593
G3 X159.292 Y105.212 I-6.298 J-.484 E.07369
G1 X158.968 Y105.654 E.02249
G3 X157.815 Y106.249 I-1.328 J-1.159 E.05454
; WIPE_START
G1 X157.929 Y106.235 E-.04349
G1 X158.379 Y106.104 E-.17811
G1 X158.664 Y105.929 E-.12705
G1 X158.968 Y105.654 E-.15581
G1 X159.292 Y105.212 E-.20812
G1 X159.329 Y105.093 E-.04741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.853 Y106.127 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F7144.654
M204 S6000
G1 X152.259 Y106.327 E.01858
G1 X153.681 Y106.82 E.06183
G1 X154.986 Y107.184 E.05561
G1 X155.28 Y107.229 E.01221
G1 X155.29 Y106.981 E.01018
G1 X155.408 Y106.439 E.02279
G1 X155.7 Y106.029 E.02067
G1 X156.067 Y105.797 E.01785
G1 X155.722 Y105.43 E.02068
G3 X155.402 Y104.457 I13.239 J-4.898 E.04206
G3 X155.326 Y103.606 I9.079 J-1.238 E.03509
G1 X155.325 Y101.278 E.09559
G3 X155.457 Y100.207 I4.177 J-.032 E.04444
G1 X155.929 Y99.363 E.03971
G1 X154.978 Y99.159 E.03993
G2 X153.549 Y99.092 I-1.146 J9.215 E.05881
G1 X152.68 Y99.06 E.03568
G1 X152.205 Y99.133 E.01975
G2 X151.961 Y99.326 I.147 J.437 E.01303
G1 X152.218 Y99.562 E.01436
G3 X152.559 Y100.223 I-1.471 J1.176 E.03073
G3 X152.755 Y102.536 I-16.695 J2.58 E.09537
G1 X152.783 Y104.204 E.06853
G1 X152.746 Y104.746 E.0223
G1 X152.606 Y105.342 E.02516
G1 X152.145 Y105.896 E.02957
G1 X151.9 Y106.09 E.01284
M204 S10000
G1 X152.506 Y106.032 F42000
; LINE_WIDTH: 0.419998
G1 F7144.659
M204 S6000
G2 X154.958 Y106.802 I7.389 J-19.221 E.1056
G1 X155.027 Y106.439 E.01519
G1 X155.257 Y106.017 E.01971
G1 X155.501 Y105.725 E.01564
G1 X155.337 Y105.466 E.01256
G1 X155.056 Y104.559 E.03901
G3 X154.966 Y103.606 I8.693 J-1.306 E.0393
G1 X154.965 Y101.278 E.09559
G3 X155.081 Y100.204 I4.326 J-.076 E.04449
G1 X155.381 Y99.605 E.02747
G1 X154.89 Y99.508 E.02055
G2 X152.697 Y99.421 I-4.504 J85.216 E.09009
G1 X152.568 Y99.438 E.00537
G1 X152.751 Y99.73 E.01417
G1 X152.915 Y100.17 E.01927
G3 X153.115 Y102.519 I-17.155 J2.641 E.09685
G3 X153.143 Y104.198 I-56.992 J1.804 E.06898
G1 X153.105 Y104.771 E.02357
G1 X152.956 Y105.427 E.02761
G1 X152.836 Y105.657 E.01068
G1 X152.546 Y105.987 E.01801
M204 S10000
G1 X153.122 Y105.864 F42000
; LINE_WIDTH: 0.419998
G1 F7144.658
M204 S6000
G2 X154.681 Y106.352 I4.676 J-12.224 E.06713
G3 X155.042 Y105.692 I2.284 J.82 E.03098
G3 X154.715 Y104.673 I26.472 J-9.045 E.04396
G3 X154.606 Y103.607 I16.277 J-2.199 E.04401
G1 X154.605 Y101.279 E.09559
G3 X154.825 Y99.864 I3.913 J-.116 E.05911
G2 X153.175 Y99.799 I-2.768 J49.081 E.06782
G1 X153.271 Y100.117 E.01364
G3 X153.413 Y101.321 I-8.337 J1.591 E.04984
G3 X153.503 Y104.192 I-41.056 J2.727 E.11796
G1 X153.464 Y104.796 E.02484
G1 X153.305 Y105.511 E.03006
G1 X153.149 Y105.811 E.0139
M204 S10000
G1 X153.623 Y105.657 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G2 X154.477 Y105.921 I3.985 J-11.385 E.03669
G1 X154.639 Y105.646 E.01313
G1 X154.442 Y105.007 E.02746
; LINE_WIDTH: 0.434556
G1 F6866.894
G1 X154.366 Y104.762 E.01096
; LINE_WIDTH: 0.451863
G1 F6563.535
G1 X154.29 Y104.516 E.01147
G3 X154.233 Y102.519 I18.751 J-1.537 E.08933
G1 X154.221 Y101.532 E.04412
; LINE_WIDTH: 0.484924
G1 F6052.77
G1 X154.22 Y100.829 E.03409
; LINE_WIDTH: 0.530779
G1 F5463.102
G1 X154.281 Y100.247 E.0314
G1 X153.715 Y100.237 E.03042
G1 X153.773 Y100.737 E.02705
; LINE_WIDTH: 0.495288
G1 F5908.614
G1 X153.798 Y101.24 E.02496
; LINE_WIDTH: 0.45032
G1 F6589.49
G3 X153.88 Y104.186 I-166.919 J6.124 E.13122
G1 X153.833 Y104.821 E.02837
; LINE_WIDTH: 0.429126
G1 F6967.927
G1 X153.651 Y105.604 E.03383
M204 S10000
G1 X154.158 Y105.344 F42000
; LINE_WIDTH: 0.527368
G1 F5502.972
M204 S6000
G2 X154.156 Y105.445 I-.029 J.05 E.01288
; WIPE_START
G1 X154.1 Y105.445 E-.18608
G1 X154.07 Y105.395 E-.1913
G1 X154.1 Y105.344 E-.19132
G1 X154.158 Y105.344 E-.19129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.597 Y104.305 Z.88 F42000
G1 X146.519 Y104.294 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X146.547 Y104.318 E.00165
G3 X146.677 Y104.405 I-.752 J1.268 E.00693
G3 X147.037 Y105.257 I-1.086 J.962 E.04189
G3 X146.573 Y106.566 I-1.928 J.054 E.06322
G3 X144.715 Y106.987 I-1.256 J-1.235 E.08952
G3 X143.596 Y105.553 I.761 J-1.748 E.08437
G3 X143.904 Y104.359 I1.24 J-.317 E.05721
G3 X144.293 Y104.175 I1.235 J2.113 E.01915
G3 X145.288 Y104.113 I.726 J3.609 E.04448
G1 X145.844 Y104.113 E.02474
G3 X146.325 Y104.211 I-.049 J1.473 E.02195
G1 X146.464 Y104.271 E.00671
M204 S10000
G1 X146.344 Y104.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X146.581 Y104.936 I-.384 J.541 E.01613
G3 X146.294 Y106.311 I-1.338 J.439 E.06042
G3 X144.841 Y106.633 I-.978 J-.975 E.06454
G3 X143.966 Y105.492 I.639 J-1.396 E.06144
G3 X144.152 Y104.653 I.866 J-.248 E.03677
G3 X144.41 Y104.532 I.811 J1.397 E.01169
G3 X145.288 Y104.488 I.611 J3.363 E.03619
G1 X145.821 Y104.488 E.02188
G1 X145.974 Y104.507 E.00635
G3 X146.294 Y104.597 I-.013 J.663 E.01379
; WIPE_START
M204 S6000
G1 X146.486 Y104.753 E-.09402
G1 X146.581 Y104.936 E-.0783
G1 X146.66 Y105.277 E-.13309
G1 X146.619 Y105.668 E-.14935
G1 X146.588 Y105.792 E-.04862
G1 X146.491 Y106.016 E-.09259
G1 X146.294 Y106.311 E-.13507
G1 X146.235 Y106.359 E-.02896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.851 Y103.13 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X143.994 Y103.255 E.00847
G2 X144.344 Y103.392 I.483 J-.716 E.01686
G1 X144.502 Y103.411 E.00708
G1 X149.194 Y103.411 E.20868
G3 X149.445 Y103.56 I.01 J.27 E.01373
G3 X149.603 Y104.526 I-1.187 J.69 E.04454
G3 X148.963 Y106.073 I-3.029 J-.348 E.07546
G3 X147.638 Y107.184 I-3.1 J-2.351 E.07756
G3 X145.919 Y107.687 I-1.843 J-3.109 E.08049
G3 X141.444 Y105.797 I-.56 J-4.917 E.22589
G3 X140.718 Y104.386 I4.087 J-2.996 E.07086
G3 X140.69 Y101.967 I4.651 J-1.263 E.10881
G3 X142.057 Y99.748 I4.464 J1.22 E.11749
G3 X143.583 Y98.892 I3.776 J4.945 E.07811
G3 X145.376 Y98.672 I1.659 J6.1 E.0806
G3 X147.409 Y99.096 I-.092 J5.524 E.09294
G3 X148.541 Y99.742 I-5.53 J11.011 E.05802
G3 X149.084 Y100.315 I-.92 J1.415 E.03544
G3 X149.188 Y100.689 I-2.262 J.833 E.0173
G3 X149.006 Y101.045 I-.63 J-.098 E.01808
G2 X146.439 Y100.168 I-2.732 J3.799 E.12246
G2 X143.886 Y101.65 I.107 J3.123 E.13676
G2 X143.629 Y102.566 I2.54 J1.207 E.04251
G2 X143.812 Y103.085 I1.256 J-.15 E.02468
M204 S10000
G1 X144.126 Y102.865 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X144.524 Y103.036 I.37 J-.312 E.01846
G1 X149.223 Y103.036 E.19294
G3 X149.842 Y103.516 I-.031 J.679 E.03423
G3 X149.948 Y104.784 I-1.927 J.801 E.05312
G3 X148.078 Y107.357 I-3.821 J-.812 E.1345
G3 X145.953 Y108.061 I-2.324 J-3.456 E.09305
G3 X141.143 Y106.022 I-.594 J-5.293 E.22419
G3 X140.356 Y104.486 I4.416 J-3.231 E.07116
G3 X140.164 Y103.125 I6.89 J-1.666 E.05654
G3 X141.818 Y99.457 I5.021 J.057 E.16998
G3 X143.304 Y98.592 I4.338 J5.741 E.07077
G3 X144.671 Y98.323 I1.756 J5.318 E.05737
G1 X145.207 Y98.283 E.02206
G1 X145.404 Y98.298 E.00809
G3 X147.467 Y98.712 I-.127 J5.985 E.08686
G3 X148.995 Y99.627 I-2.755 J6.333 E.07332
G3 X149.568 Y100.666 I-.929 J1.189 E.05007
G3 X149.158 Y101.38 I-.992 J-.094 E.03485
G3 X148.739 Y101.317 I-.16 J-.358 E.01835
G2 X146.445 Y100.544 I-2.456 J3.497 E.10081
G2 X144.189 Y101.886 I.073 J2.689 E.1126
G2 X144.012 Y102.56 I3.137 J1.183 E.02863
G2 X144.09 Y102.817 I.485 J-.007 E.01118
M204 S10000
G1 X144.509 Y103.606 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.25761
G1 F12000
M204 S6000
G1 X144.599 Y103.658 E.00234
; LINE_WIDTH: 0.30329
G1 F10573.224
G1 X144.69 Y103.71 E.00289
; LINE_WIDTH: 0.348971
G1 F8901.305
G1 X144.78 Y103.762 E.00343
; LINE_WIDTH: 0.373895
G1 F8194.307
G1 X145.856 Y103.762 E.03854
G3 X146.08 Y103.775 I-.102 J3.606 E.00804
; LINE_WIDTH: 0.413119
G1 F7283.866
G1 X146.25 Y103.79 E.00687
; LINE_WIDTH: 0.44509
G1 F6679.009
G3 X146.573 Y103.833 I-.779 J7.054 E.01429
; WIPE_START
G1 X146.25 Y103.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.849 Y106.821 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X146.948 Y107.094 E.01194
G2 X148.072 Y106.466 I-2.861 J-6.433 E.05297
G1 X148.526 Y106.023 E.02602
G1 X148.901 Y105.479 E.02716
G1 X149.159 Y104.883 E.02665
G1 X149.247 Y104.291 E.02458
G1 X149.192 Y103.923 E.01526
G1 X149.134 Y103.798 E.00567
G1 X146.957 Y103.792 E.0894
G1 X146.911 Y104.128 E.01389
G1 X147.105 Y104.33 E.01149
G1 X147.325 Y104.801 E.02136
G1 X147.412 Y105.269 E.01954
G1 X147.312 Y105.985 E.02966
G3 X146.883 Y106.772 I-2.179 J-.679 E.03706
M204 S10000
G1 X147.992 Y104.522 F42000
; LINE_WIDTH: 0.433769
G1 F6881.366
M204 S6000
G1 X148.121 Y105.059 E.02356
G1 X148.131 Y105.315 E.01094
G2 X148.478 Y104.523 I-1.528 J-1.141 E.0372
G1 X148.052 Y104.522 E.01816
M204 S10000
G1 X147.414 Y104.153 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X147.636 Y104.604 E.02063
G1 X147.762 Y105.134 E.02236
G3 X147.664 Y106.066 I-6.168 J-.182 E.03852
G1 X147.545 Y106.37 E.01338
G1 X147.887 Y106.144 E.01679
G1 X148.25 Y105.79 E.02083
G1 X148.585 Y105.303 E.02427
G1 X148.81 Y104.784 E.02326
G1 X148.88 Y104.272 E.02122
G1 X148.863 Y104.157 E.00475
G1 X147.474 Y104.154 E.05702
M204 S10000
G1 X146.571 Y107.154 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467035
G1 F6318.843
M204 S6000
G3 X146.256 Y107.267 I-3.783 J-10.091 E.01553
; LINE_WIDTH: 0.415385
G1 F7237.406
G1 X146.162 Y107.294 E.00395
; LINE_WIDTH: 0.384367
G1 F7929.695
G1 X146.042 Y107.324 E.00459
; LINE_WIDTH: 0.349271
G1 F8892.056
G1 X145.847 Y107.361 E.00656
; LINE_WIDTH: 0.309503
G1 F10309.872
G1 X145.649 Y107.386 E.00567
G3 X144.79 Y107.353 I-.298 J-3.367 E.02452
; LINE_WIDTH: 0.347546
G1 F8945.437
G3 X144.591 Y107.311 I.452 J-2.636 E.00668
; LINE_WIDTH: 0.386749
G1 F7871.874
G3 X144.393 Y107.25 I.8 J-2.969 E.00772
; LINE_WIDTH: 0.420063
G1 F7143.371
G1 X144.324 Y107.223 E.00303
; LINE_WIDTH: 0.462764
G1 F6385.854
G1 X144.222 Y107.18 E.00512
G3 X143.998 Y107.071 I1.728 J-3.836 E.01141
M204 S10000
G1 X142.113 Y102.565 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.508305
G1 F5737.021
M204 S6000
G1 X142.188 Y102.285 E.01485
; LINE_WIDTH: 0.458578
G1 F6452.931
G1 X142.262 Y102.004 E.0132
; LINE_WIDTH: 0.408852
G1 F7372.99
G1 X142.337 Y101.723 E.01156
M204 S10000
G1 X141.978 Y103.125 F42000
; LINE_WIDTH: 0.390846
G1 F7774.362
M204 S6000
G1 X142.043 Y103.471 E.01329
; LINE_WIDTH: 0.437362
G1 F6815.825
G2 X142.166 Y104.074 I8.751 J-1.469 E.02649
G1 X142.267 Y104.248 E.00864
G1 X142.524 Y103.787 E.02272
G1 X142.383 Y103.482 E.01444
; LINE_WIDTH: 0.401388
G1 F7534.218
G1 X142.23 Y102.897 E.02356
; LINE_WIDTH: 0.412177
G1 F7303.363
G1 X142.191 Y102.786 E.00471
; LINE_WIDTH: 0.460573
G1 F6420.786
G1 X142.152 Y102.676 E.00535
; LINE_WIDTH: 0.50897
G1 F5728.523
G1 X142.113 Y102.565 E.006
G1 X142.075 Y102.683 E.00633
; LINE_WIDTH: 0.460573
G1 F6420.786
G1 X142.037 Y102.801 E.00565
; LINE_WIDTH: 0.412177
G1 F7303.363
G1 X142 Y102.919 E.00497
; LINE_WIDTH: 0.380614
G1 F8022.553
G1 X141.984 Y103.065 E.00539
M204 S10000
G1 X141.694 Y103.657 F42000
; LINE_WIDTH: 0.421047
G1 F7123.894
M204 S6000
G1 X141.807 Y104.184 E.02219
G2 X142.318 Y105.13 I4.334 J-1.731 E.04439
G1 X142.471 Y105.296 E.00929
G1 X142.51 Y104.758 E.02221
G1 X142.67 Y104.247 E.02204
G1 X142.974 Y103.784 E.0228
G1 X142.717 Y103.356 E.02057
G1 X142.562 Y102.806 E.02355
G1 X142.534 Y102.481 E.01343
G1 X142.687 Y101.737 E.03127
G1 X142.864 Y101.225 E.02229
; LINE_WIDTH: 0.458469
G1 F6454.708
G1 X142.958 Y101.024 E.01011
G1 X143.298 Y100.561 E.0261
G1 X143.923 Y99.961 E.03939
G1 X143.463 Y100.165 E.02286
G1 X142.777 Y100.609 E.03719
G1 X142.362 Y101.03 E.02685
; LINE_WIDTH: 0.420848
G1 F7127.818
G1 X142.066 Y101.478 E.02208
G1 X141.799 Y102.156 E.03
G2 X141.688 Y103.597 I3.089 J.962 E.05999
M204 S10000
G1 X141.342 Y103.732 F42000
; LINE_WIDTH: 0.419998
G1 F7144.65
M204 S6000
G1 X141.463 Y104.3 E.02384
G2 X142.558 Y105.92 I4.076 J-1.575 E.08096
G1 X143.059 Y106.3 E.02584
G1 X142.89 Y105.742 E.02396
G1 X142.826 Y105.21 E.02199
G1 X142.894 Y104.674 E.02217
G3 X143.463 Y103.778 I2.135 J.727 E.04399
G1 X143.202 Y103.497 E.01577
G1 X143.038 Y103.181 E.01462
G1 X142.892 Y102.619 E.02383
G1 X143.039 Y101.812 E.03366
G1 X143.258 Y101.269 E.02405
G1 X143.607 Y100.783 E.02458
G1 X144.072 Y100.328 E.02673
G3 X145.101 Y99.703 I2.904 J3.617 E.04955
G3 X146.056 Y99.482 I1.16 J2.846 E.04041
G2 X143.807 Y99.596 I-.846 J5.583 E.09307
G1 X143.282 Y99.829 E.0236
G1 X142.531 Y100.316 E.03674
G1 X142.055 Y100.825 E.02864
G1 X141.722 Y101.349 E.02545
G1 X141.383 Y102.235 E.03899
G2 X141.285 Y103.191 I5.006 J.997 E.03949
G1 X141.336 Y103.672 E.01988
M204 S10000
G1 X140.975 Y103.736 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X141.12 Y104.416 E.02853
G2 X141.743 Y105.569 I5.28 J-2.109 E.05392
G1 X142.314 Y106.186 E.03454
G1 X142.838 Y106.591 E.02719
G1 X143.593 Y106.995 E.03516
G1 X143.749 Y106.727 E.01271
G1 X143.413 Y106.206 E.02549
G1 X143.246 Y105.687 E.02237
G1 X143.193 Y105.158 E.02184
G1 X143.235 Y104.791 E.01517
G1 X143.362 Y104.497 E.01314
G1 X143.686 Y104.049 E.02268
G1 X144.022 Y103.879 E.01545
G3 X144.02 Y103.692 I.183 J-.095 E.00798
G1 X143.75 Y103.556 E.01242
G1 X143.512 Y103.315 E.0139
G1 X143.385 Y103.085 E.01078
G1 X143.25 Y102.584 E.0213
G1 X143.391 Y101.888 E.02917
G1 X143.564 Y101.459 E.01899
G1 X143.899 Y100.993 E.02358
G3 X145.364 Y99.994 I2.99 J2.811 E.07339
G1 X145.62 Y99.911 E.01104
; LINE_WIDTH: 0.436935
G1 F6823.541
G1 X145.881 Y99.855 E.01145
; LINE_WIDTH: 0.470809
G1 F6260.783
G1 X146.141 Y99.799 E.01248
; LINE_WIDTH: 0.49241
G1 F5947.949
G1 X146.402 Y99.743 E.01314
G1 X146.909 Y99.791 E.02514
G1 X147.658 Y99.967 E.03793
G1 X147.779 Y99.758 E.01192
G2 X147.084 Y99.401 I-2.463 J3.945 E.03857
; LINE_WIDTH: 0.498493
G1 F5865.418
G1 X146.843 Y99.335 E.01251
; LINE_WIDTH: 0.524184
G1 F5540.737
G1 X146.601 Y99.269 E.01324
; LINE_WIDTH: 0.517523
G1 F5621.408
G1 X146.389 Y99.214 E.01146
; LINE_WIDTH: 0.478514
G1 F6145.495
G1 X146.177 Y99.158 E.01049
; LINE_WIDTH: 0.420524
G1 F7134.235
G1 X145.964 Y99.102 E.00903
G1 X145.25 Y99.039 E.02949
G2 X143.782 Y99.234 I.088 J6.303 E.06104
G1 X143.168 Y99.486 E.02727
G2 X142.298 Y100.038 I13.992 J23.029 E.04238
G1 X141.769 Y100.604 E.03187
G1 X141.399 Y101.186 E.02835
G1 X141.034 Y102.139 E.04195
G2 X140.926 Y103.225 I5.173 J1.063 E.04495
G1 X140.969 Y103.676 E.01865
; WIPE_START
G1 X140.926 Y103.225 E-.17236
G1 X140.939 Y102.834 E-.14869
G1 X141.034 Y102.139 E-.26648
G1 X141.197 Y101.715 E-.17247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.103 Y100.012 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.55059
G1 F5242.448
M204 S6000
G1 X148.477 Y100.235 E.02438
; LINE_WIDTH: 0.505488
G1 F5773.308
G1 X148.547 Y100.281 E.00425
; LINE_WIDTH: 0.47876
G1 F6141.875
G1 X148.636 Y100.348 E.0053
; LINE_WIDTH: 0.445667
G1 F6669.006
G1 X148.705 Y100.406 E.00397
; LINE_WIDTH: 0.394896
G1 F7680.309
G1 X148.986 Y100.709 E.01579
; WIPE_START
G1 X148.705 Y100.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.44 Y102.745 Z.88 F42000
G1 X135.414 Y104.684 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X134.993 Y104.891 E.02087
G2 X134.749 Y105.075 I1.188 J1.825 E.01359
G2 X134.194 Y105.887 I2.388 J2.229 E.04394
G2 X134.086 Y106.265 I3.118 J1.09 E.01749
G2 X134.374 Y107.039 I1.261 J-.029 E.03739
G3 X134.466 Y107.259 I-.783 J.458 E.01064
G3 X134.243 Y107.459 I-.228 J-.03 E.01456
G3 X131.948 Y107.655 I-1.932 J-9.081 E.10269
G3 X128.952 Y107.377 I-.38 J-12.157 E.13418
G3 X128.476 Y107.167 I.17 J-1.031 E.02338
G1 X128.47 Y107.157 E.00055
G3 X128.383 Y106.958 I1.103 J-.601 E.00965
G2 X129.314 Y106.65 I-4.1 J-13.955 E.04362
G2 X130.121 Y106.029 I-1.201 J-2.394 E.04556
G2 X130.471 Y105.636 I-4.121 J-4.03 E.02342
G1 X131.557 Y104.284 E.07716
G2 X131.82 Y103.749 I-1.132 J-.889 E.02671
G2 X131.664 Y103.276 I-1.355 J.185 E.02227
G2 X129.409 Y99.748 I-43.802 J25.504 E.18628
G2 X128.257 Y99.168 I-1.347 J1.241 E.05865
G1 X128.149 Y99.136 E.00502
G1 X128.177 Y98.975 E.00726
G3 X128.746 Y98.785 I.766 J1.355 E.02687
G3 X129.686 Y98.728 I.814 J5.574 E.04195
G3 X130.321 Y98.705 I.584 J7.543 E.02824
G3 X130.902 Y98.872 I.075 J.837 E.02753
G3 X131.097 Y99.124 I-1.281 J1.188 E.01418
G2 X130.666 Y100.008 I1.397 J1.228 E.04426
G2 X131.245 Y101.401 I2.988 J-.426 E.06782
G2 X131.966 Y102.205 I2.027 J-1.093 E.04848
G1 X132.414 Y102.459 E.0229
G2 X133.123 Y102.102 I-1.009 J-2.891 E.03542
G2 X133.969 Y100.865 I-2.448 J-2.581 E.06717
G2 X134.094 Y100.35 I-4.413 J-1.344 E.02355
G2 X133.868 Y99.679 I-1.422 J.105 E.03183
G2 X133.277 Y99.265 I-1.54 J1.567 E.03226
G3 X133.358 Y99.023 I1.455 J.354 E.01135
G3 X133.722 Y98.875 I.752 J1.326 E.01752
G3 X135.455 Y98.729 I1.811 J11.129 E.07745
G3 X137.711 Y98.779 I.55 J26.07 E.10042
G3 X138.894 Y98.964 I-1.654 J14.446 E.05327
G3 X139.24 Y99.153 I-.108 J.607 E.01782
G3 X139.31 Y99.405 I-1.268 J.488 E.01167
G3 X138.824 Y99.663 I-3.335 J-5.709 E.02446
G2 X137.999 Y100.386 I1.277 J2.288 E.04914
G2 X136.934 Y101.83 I10.036 J8.513 E.07989
G1 X136.205 Y102.937 E.05898
G2 X135.967 Y103.452 I1.561 J1.031 E.02533
G2 X136.149 Y103.911 I1.542 J-.344 E.02204
G2 X138.078 Y106.598 I27.509 J-17.72 E.14721
G2 X139.019 Y107.206 I1.942 J-1.973 E.05018
G1 X139.307 Y107.369 E.01471
G3 X138.714 Y107.631 I-.657 J-.688 E.02939
G3 X136.969 Y107.579 I-.703 J-5.758 E.07799
G3 X136.654 Y107.481 I.053 J-.725 E.0148
G3 X136.526 Y107.353 I.622 J-.748 E.00806
G2 X136.957 Y106.398 I-1.796 J-1.385 E.04701
G2 X136.338 Y105.221 I-2.507 J.567 E.05983
G2 X135.847 Y104.826 I-1.367 J1.194 E.02819
G1 X135.47 Y104.658 E.01835
G1 X135.468 Y104.659 E.00011
M204 S10000
G1 X135.47 Y105.068 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X134.934 Y105.432 I.334 J1.07 E.027
G2 X134.467 Y106.293 I1.35 J1.29 E.04071
G2 X134.702 Y106.856 I1.053 J-.11 E.02538
G3 X134.853 Y107.266 I-1.296 J.711 E.01805
G3 X134.586 Y107.723 I-.653 J-.076 E.02236
G3 X133.751 Y107.931 I-.94 J-1.993 E.03557
G3 X130.815 Y108.011 I-1.946 J-17.559 E.12072
G3 X128.641 Y107.673 I.48 J-10.256 E.09049
G3 X128.014 Y107.031 I.166 J-.789 E.0391
G3 X128.416 Y106.546 I.534 J.034 E.02764
G2 X129.495 Y106.106 I-.564 J-2.923 E.04814
G2 X130.182 Y105.397 I-5.147 J-5.685 E.04058
G1 X131.26 Y104.054 E.0707
G2 X131.427 Y103.728 I-.683 J-.556 E.01514
G2 X131.333 Y103.453 I-.79 J.118 E.01202
G2 X129.125 Y99.996 I-43.28 J25.202 E.16848
G2 X128.343 Y99.57 I-1.034 J.966 E.03719
G3 X127.838 Y99.352 I.057 J-.829 E.02303
G3 X128.14 Y98.557 I.518 J-.258 E.03926
G3 X129.673 Y98.353 I1.337 J4.184 E.06383
G3 X130.331 Y98.33 I.594 J7.772 E.02701
G3 X131.419 Y98.933 I.087 J1.129 E.05409
G1 X131.5 Y99.062 E.00624
G3 X131.238 Y99.555 I-.837 J-.128 E.02339
G2 X131.051 Y100.012 I1.115 J.721 E.02037
G2 X131.561 Y101.198 I2.537 J-.387 E.05359
G2 X132.436 Y102.04 I1.589 J-.776 E.05088
G2 X133.16 Y101.509 I-.353 J-1.241 E.03768
G2 X133.613 Y100.745 I-3.138 J-2.375 E.03652
G2 X133.713 Y100.34 I-3.477 J-1.069 E.01714
G2 X133.316 Y99.713 I-.67 J-.015 E.03228
G3 X132.932 Y99.352 I.179 J-.574 E.02238
G3 X132.941 Y99.082 I.269 J-.127 E.01154
G3 X133.418 Y98.58 I.593 J.086 E.03032
G1 X133.637 Y98.508 E.00944
G3 X135.451 Y98.354 I1.904 J11.633 E.07485
G3 X137.749 Y98.406 I.554 J26.345 E.09441
G3 X138.996 Y98.601 I-1.731 J15.122 E.05183
G3 X139.536 Y98.916 I-.295 J1.128 E.02599
G3 X139.64 Y99.545 I-.619 J.425 E.02705
G3 X139.334 Y99.829 I-.486 J-.218 E.01761
G2 X138.285 Y100.629 I.87 J2.229 E.05487
G2 X137.247 Y102.037 I9.757 J8.276 E.07191
G1 X136.523 Y103.136 E.05401
G2 X136.367 Y103.462 I.985 J.671 E.0149
G2 X136.471 Y103.719 I.866 J-.199 E.01143
G2 X138.357 Y106.345 I26.979 J-17.38 E.13282
G2 X139.193 Y106.874 I1.689 J-1.747 E.04093
G3 X139.566 Y107.119 I-.814 J1.645 E.01837
G3 X139.592 Y107.478 I-.314 J.203 E.0154
G3 X139.205 Y107.89 I-.554 J-.133 E.02429
G3 X138.363 Y108.038 I-.88 J-2.535 E.03524
G3 X136.885 Y107.944 I-.34 J-6.331 E.06096
G3 X136.34 Y107.703 I.101 J-.965 E.02487
G3 X136.246 Y107.097 I.254 J-.35 E.02803
G2 X136.568 Y106.405 I-1.311 J-1.033 E.03162
G2 X136.049 Y105.46 I-2.06 J.517 E.04477
G2 X135.527 Y105.087 I-.935 J.758 E.02666
M204 S10000
G1 X135.994 Y104.422 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.382895
G1 F7965.861
M204 S6000
G3 X136.241 Y104.665 I-3.913 J4.221 E.01278
; LINE_WIDTH: 0.334817
G1 F9359.875
G1 X136.304 Y104.73 E.00282
; LINE_WIDTH: 0.316032
G1 F10046.846
G1 X136.315 Y104.741 E.00046
; LINE_WIDTH: 0.291031
G1 F11134.477
G1 X136.435 Y104.882 E.00487
; LINE_WIDTH: 0.233507
G1 F12000
G1 X137.013 Y105.677 E.01944
; LINE_WIDTH: 0.263954
G1 X137.103 Y105.83 E.00414
; LINE_WIDTH: 0.299514
G1 F10739.991
G3 X137.15 Y105.932 I-.4 J.246 E.00306
G1 X137.163 Y106.318 E.01055
M204 S10000
G1 X137.143 Y107.168 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.531067
G1 F5459.754
M204 S6000
G2 X137.896 Y107.232 I.741 J-4.252 E.04067
G3 X137.932 Y107.041 I.108 J-.079 E.0117
G3 X137.59 Y106.668 I1.038 J-1.296 E.02732
G1 X137.518 Y106.737 E.0054
G1 X137.304 Y106.743 E.01147
G1 X137.164 Y107.112 E.02119
M204 S10000
G1 X138.401 Y107.135 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.122363
G1 F12000
M204 S6000
G1 X138.484 Y107.198 E.00074
; LINE_WIDTH: 0.15121
G1 X138.607 Y107.285 E.00157
; LINE_WIDTH: 0.190648
G1 X138.793 Y107.413 E.00336
; WIPE_START
G1 X138.607 Y107.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.928 Y99.66 Z.88 F42000
G1 X138.94 Y99.357 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.121104
G1 F12000
M204 S6000
G1 X139.077 Y99.276 E.0011
M204 S10000
G1 X133.689 Y99.247 F42000
; LINE_WIDTH: 0.127601
G1 F12000
M204 S6000
G1 X133.552 Y99.14 E.00134
; WIPE_START
G1 X133.689 Y99.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.457 Y100.094 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.295931
G1 F10903.168
M204 S6000
G1 X130.463 Y100.96 E.02329
M204 S10000
G1 X130.584 Y100.908 F42000
; LINE_WIDTH: 0.294721
G1 F10959.407
M204 S6000
G2 X131.11 Y101.768 I12.346 J-6.959 E.02698
G1 X131.339 Y102.105 E.01089
; LINE_WIDTH: 0.350255
G1 F8861.91
G1 X131.462 Y102.264 E.00664
; LINE_WIDTH: 0.390572
G1 F7780.806
G1 X131.531 Y102.345 E.00403
; LINE_WIDTH: 0.423394
G1 F7077.868
G1 X131.591 Y102.413 E.00376
; LINE_WIDTH: 0.441891
G1 F6734.974
G1 X131.601 Y102.425 E.0007
G1 X131.897 Y102.397 E.01295
M204 S10000
G1 X130.584 Y100.908 F42000
; LINE_WIDTH: 0.340687
G1 F9164.074
M204 S6000
G1 X130.486 Y100.715 E.00694
; LINE_WIDTH: 0.370978
G1 F8271.21
G1 X130.357 Y100.436 E.0109
M204 S10000
G1 X129.966 Y99.778 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.559419
G1 F5149.748
M204 S6000
G1 X130.106 Y99.653 E.0107
G1 X130.305 Y99.652 E.01135
G3 X130.517 Y99.188 I1.126 J.234 E.02925
G2 X129.571 Y99.171 I-.556 J4.4 E.05399
G1 X129.577 Y99.309 E.00788
G3 X129.932 Y99.728 I-.95 J1.165 E.03149
M204 S10000
G1 X129.063 Y99.194 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12841
G1 F12000
M204 S6000
G1 X128.976 Y99.136 E.00081
; LINE_WIDTH: 0.166675
G2 X128.743 Y98.987 I-3.09 J4.557 E.00337
M204 S10000
G1 X128.632 Y99.025 F42000
; LINE_WIDTH: 0.194328
G1 F12000
M204 S6000
G1 X128.941 Y99.051 E.00474
M204 S10000
G1 X128.931 Y99.041 F42000
; LINE_WIDTH: 0.142408
G1 F12000
M204 S6000
G1 X128.632 Y99.033 E.0028
; WIPE_START
G1 X128.931 Y99.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.759 Y106.628 Z.88 F42000
G1 X129.779 Y106.808 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.651
M204 S6000
G1 X129.796 Y107.146 E.0139
G2 X131.947 Y107.28 I2.016 J-15.056 E.08855
G1 X133.071 Y107.252 E.04616
G1 X133.988 Y107.136 E.03796
G1 X133.792 Y106.745 E.01795
G1 X133.712 Y106.212 E.02212
G1 X133.88 Y105.681 E.02285
G1 X134.072 Y105.325 E.01659
G1 X134.469 Y104.825 E.02625
G1 X134.822 Y104.548 E.01843
G1 X135.394 Y104.279 E.02592
G1 X135.547 Y104.28 E.00628
G1 X135.59 Y104.3 E.00196
G1 X135.811 Y104.072 E.01304
G1 X135.592 Y103.514 E.02463
G1 X135.596 Y103.373 E.00577
G1 X135.877 Y102.755 E.02789
G3 X137.278 Y100.68 I52.495 J33.924 E.10279
G3 X138.083 Y99.726 I12.305 J9.567 E.05127
G1 X138.541 Y99.418 E.02265
G1 X138.483 Y99.321 E.00464
G1 X138.496 Y99.274 E.00201
G2 X136.561 Y99.11 I-2.007 J12.18 E.07984
G2 X134.776 Y99.127 I-.671 J22.705 E.07333
G1 X134.147 Y99.202 E.02597
G3 X134.078 Y99.363 I-.175 J.02 E.00753
G1 X134.303 Y99.667 E.01554
G3 X134.467 Y100.401 I-1.668 J.759 E.03108
G1 X134.329 Y100.971 E.02408
G1 X134.008 Y101.598 E.02895
G1 X133.578 Y102.174 E.0295
G1 X133.199 Y102.506 E.02069
G3 X132.401 Y102.858 I-2.407 J-4.377 E.03587
G1 X132.309 Y102.836 E.00389
G1 X132.24 Y102.936 E.00499
G1 X131.929 Y102.992 E.01295
G1 X132.155 Y103.58 E.02586
G1 X132.201 Y103.792 E.0089
G1 X131.964 Y104.352 E.02496
G3 X130.424 Y106.253 I-29.192 J-22.081 E.10046
G1 X130.044 Y106.618 E.02163
G1 X129.827 Y106.773 E.01095
M204 S10000
G1 X130.312 Y106.86 F42000
; LINE_WIDTH: 0.419998
G1 F7144.663
M204 S6000
G2 X133.044 Y106.893 I1.648 J-23.449 E.11225
G1 X133.449 Y106.841 E.0168
G1 X133.357 Y106.342 E.02086
G1 X133.369 Y106.101 E.00988
G1 X133.532 Y105.57 E.02283
G1 X133.79 Y105.102 E.02195
G1 X134.188 Y104.601 E.02625
G1 X134.655 Y104.229 E.02454
G1 X135.241 Y103.954 E.02658
G1 X135.37 Y103.932 E.00535
G3 X135.222 Y103.392 I1.034 J-.572 E.02323
G1 X135.548 Y102.61 E.03475
G3 X136.986 Y100.47 I45.749 J29.184 E.10588
G3 X137.769 Y99.529 I254.269 J210.768 E.05026
G2 X134.803 Y99.486 I-1.825 J23.753 E.12186
G1 X134.623 Y99.508 E.00746
G3 X134.832 Y100.388 I-2.063 J.955 E.0374
G1 X134.679 Y101.056 E.02812
G1 X134.327 Y101.765 E.0325
G1 X133.865 Y102.39 E.03192
G1 X133.656 Y102.606 E.01234
G1 X133.261 Y102.878 E.01968
G1 X132.628 Y103.169 E.02863
G1 X132.421 Y103.237 E.00893
G1 X132.563 Y103.785 E.02328
G3 X132.175 Y104.681 I-3.277 J-.89 E.04022
G1 X131.042 Y106.099 E.07454
G3 X130.355 Y106.818 I-5.074 J-4.162 E.04087
M204 S10000
G1 X131.126 Y106.547 F42000
; LINE_WIDTH: 0.419998
G1 F7144.662
M204 S6000
G2 X133.017 Y106.533 I.788 J-22.509 E.07765
G1 X133.023 Y106.003 E.02177
G1 X133.214 Y105.402 E.0259
G1 X133.508 Y104.878 E.02468
G1 X133.906 Y104.377 E.02625
G1 X134.322 Y104.015 E.02264
G1 X134.912 Y103.711 E.02725
G1 X134.864 Y103.354 E.01477
G1 X134.941 Y103.075 E.0119
G1 X135.225 Y102.452 E.02811
G3 X136.694 Y100.26 I43.456 J27.536 E.10836
G1 X137.047 Y99.833 E.02274
G2 X135.115 Y99.836 I-.888 J55.945 E.07931
G1 X135.191 Y100.408 E.02369
G1 X135.029 Y101.14 E.03082
G1 X134.646 Y101.931 E.03606
G1 X134.153 Y102.606 E.03433
G1 X133.878 Y102.889 E.01618
G1 X133.47 Y103.178 E.02054
G1 X132.871 Y103.453 E.02708
G1 X132.923 Y103.803 E.01451
G1 X132.85 Y104.117 E.01324
G1 X132.619 Y104.651 E.02392
G1 X132.277 Y105.129 E.02412
G1 X131.166 Y106.502 E.0725
M204 S10000
G1 X131.955 Y106.165 F42000
; LINE_WIDTH: 0.489859
G1 F5983.267
M204 S6000
G1 X132.619 Y106.148 E.03253
G1 X132.643 Y105.895 E.01248
; LINE_WIDTH: 0.510516
G1 F5708.863
M73 P79 R3
G1 X132.736 Y105.547 E.01852
; LINE_WIDTH: 0.551831
G1 F5229.218
G1 X132.828 Y105.198 E.02022
; LINE_WIDTH: 0.583508
G1 F4912.744
G1 X132.858 Y105.119 E.00505
; LINE_WIDTH: 0.577084
G1 F4973.798
G1 X132.675 Y105.32 E.01605
; LINE_WIDTH: 0.542193
G1 F5333.752
G1 X132.492 Y105.522 E.01496
; LINE_WIDTH: 0.495959
G1 F5899.524
G2 X131.993 Y106.118 I4.408 J4.192 E.03869
M204 S10000
G1 X132.858 Y105.119 F42000
; LINE_WIDTH: 0.608369
G1 F4689.992
M204 S6000
G1 X133.118 Y104.643 E.03392
M204 S10000
G1 X133.147 Y104.591 F42000
; LINE_WIDTH: 0.603455
G1 F4732.4
M204 S6000
G1 X133.294 Y104.436 E.01326
; LINE_WIDTH: 0.565948
G1 F5083.281
G1 X133.442 Y104.281 E.01235
; LINE_WIDTH: 0.528442
G1 F5490.361
G1 X133.589 Y104.125 E.01143
; LINE_WIDTH: 0.480656
G1 F6114.186
G1 X134.084 Y103.718 E.03075
G1 X134.489 Y103.477 E.02262
G1 X134.476 Y103.314 E.00789
G1 X134.585 Y102.913 E.01994
G1 X134.886 Y102.27 E.03402
G1 X134.465 Y102.841 E.03403
G3 X133.31 Y103.697 I-2.615 J-2.323 E.06945
G1 X133.307 Y103.997 E.01441
; LINE_WIDTH: 0.528442
G1 F5490.361
G1 X133.259 Y104.176 E.00989
; LINE_WIDTH: 0.565948
G1 F5083.281
G1 X133.211 Y104.354 E.01068
; LINE_WIDTH: 0.603455
G1 F4732.4
G1 X133.163 Y104.533 E.01147
M204 S10000
G1 X134.886 Y102.27 F42000
; LINE_WIDTH: 0.483723
G1 F6069.916
M204 S6000
G1 X135.088 Y101.929 E.01916
; LINE_WIDTH: 0.515833
G1 F5642.253
G1 X135.29 Y101.588 E.02062
M204 S10000
G1 X135.321 Y101.536 F42000
; LINE_WIDTH: 0.502969
G1 F5806.151
M204 S6000
G3 X136.228 Y100.226 I836.545 J577.85 E.08053
G1 X135.578 Y100.222 E.03285
G1 X135.554 Y100.664 E.02237
G3 X135.339 Y101.479 I-5.085 J-.903 E.04263
M204 S10000
G1 X129.416 Y107.062 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.294812
G1 F10955.149
M204 S6000
G3 X128.712 Y107.092 I-1.326 J-22.306 E.01888
; WIPE_START
G1 X129.416 Y107.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.258 Y106.289 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X122.237 Y106.311 E.00136
G2 X122.106 Y106.418 I.851 J1.177 E.00752
G2 X121.877 Y106.931 I.979 J.743 E.02524
G3 X121.772 Y107.667 I-4.213 J-.226 E.0331
G3 X118.731 Y107.095 I.345 J-10.208 E.13819
G3 X117.568 Y106.534 I1.215 J-4.005 E.05766
G3 X117.514 Y106.128 I.145 J-.226 E.02074
G2 X118.081 Y105.839 I-10.268 J-20.821 E.0283
G2 X118.474 Y105.415 I-1.4 J-1.691 E.02579
G2 X118.63 Y104.698 I-3.013 J-1.031 E.03273
G2 X118.467 Y101.037 I-25.617 J-.69 E.16312
G2 X117.68 Y99.88 I-1.517 J.186 E.06463
G1 X117.63 Y99.842 E.00281
G3 X117.335 Y99.43 I.247 J-.488 E.02345
G3 X117.41 Y99.185 I.938 J.153 E.0114
G3 X118.106 Y98.926 I.852 J1.222 E.03337
G3 X120.427 Y98.729 I1.967 J9.396 E.1039
G1 X120.933 Y98.733 E.02249
G3 X122.95 Y98.917 I-.192 J13.31 E.09021
G3 X123.526 Y99.335 I-.108 J.754 E.03293
G3 X123.238 Y99.78 I-.361 J.082 E.02628
G2 X122.295 Y100.2 I.748 J2.947 E.04616
G2 X121.925 Y100.947 I1.168 J1.044 E.03754
G2 X121.845 Y104.146 I15.794 J1.995 E.14258
G1 X121.906 Y104.594 E.02013
G2 X122.57 Y105.298 I.943 J-.225 E.04504
G1 X122.846 Y105.357 E.01254
G2 X123.508 Y105.088 I-.213 J-1.475 E.03212
G3 X124.409 Y104.339 I3.238 J2.978 E.05224
G3 X125.457 Y104.282 I.611 J1.564 E.04751
G3 X126.701 Y106.48 I-.524 J1.747 E.12406
G3 X125.663 Y107.6 I-1.461 J-.312 E.07128
G3 X124.64 Y107.537 I-.397 J-1.89 E.04615
G3 X123.782 Y106.875 I.503 J-1.539 E.04914
G2 X123.329 Y106.324 I-3.321 J2.268 E.03176
G2 X122.722 Y106.082 I-.873 J1.306 E.0293
G2 X122.409 Y106.204 I.366 J1.406 E.01497
G1 X122.311 Y106.26 E.00504
M204 S10000
G1 X122.453 Y106.613 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X122.282 Y106.849 I.396 J.468 E.01212
G2 X122.146 Y107.712 I90.848 J14.673 E.03587
G3 X122.064 Y107.956 I-2.17 J-.597 E.01058
G3 X121.599 Y108.04 I-.34 J-.551 E.01984
G3 X118.615 Y107.452 I.585 J-10.831 E.12531
G3 X117.446 Y106.92 I1.624 J-5.123 E.05286
G3 X117.052 Y106.277 I.406 J-.691 E.03226
G3 X117.432 Y105.743 I.627 J.045 E.02829
G2 X117.99 Y105.425 I-.494 J-1.516 E.0266
G2 X118.222 Y104.957 I-.595 J-.586 E.02179
G2 X118.255 Y104.682 I-1.454 J-.314 E.01139
G2 X118.095 Y101.094 I-25.155 J-.679 E.14762
G2 X117.46 Y100.184 I-1.172 J.142 E.04741
G1 X117.403 Y100.141 E.00296
G3 X116.952 Y99.426 I.452 J-.785 E.03611
G3 X117.141 Y98.927 I1.046 J.111 E.02216
G3 X118.024 Y98.56 I1.078 J1.348 E.03978
G3 X120.428 Y98.354 I2.047 J9.75 E.09931
G1 X120.94 Y98.359 E.02102
G3 X123.028 Y98.549 I-.204 J13.778 E.08618
G3 X123.893 Y99.254 I-.153 J1.071 E.04811
G3 X123.793 Y99.826 I-.726 J.168 E.02449
G3 X123.377 Y100.128 I-.577 J-.356 E.02167
G2 X122.732 Y100.371 I2.451 J7.5 E.02829
G2 X122.408 Y100.688 I.312 J.644 E.01895
G2 X122.294 Y101.016 I1.241 J.613 E.01431
G2 X122.217 Y104.101 I15.419 J1.929 E.12689
G1 X122.271 Y104.497 E.01643
G2 X123.269 Y104.798 I.583 J-.127 E.05201
G3 X124.235 Y104.004 I3.471 J3.239 E.05149
G3 X125.536 Y103.915 I.786 J1.924 E.05448
G3 X127.123 Y105.779 I-.608 J2.126 E.10651
G3 X126.566 Y107.499 I-2.266 J.216 E.07637
G3 X124.917 Y107.981 I-1.269 J-1.281 E.07349
G3 X123.489 Y107.109 I.214 J-1.957 E.07095
G2 X123.099 Y106.622 I-3.512 J2.412 E.02566
G2 X122.741 Y106.478 I-.532 J.805 E.01596
G2 X122.5 Y106.577 I.109 J.604 E.01076
; WIPE_START
M204 S6000
G1 X122.35 Y106.715 E-.07766
G1 X122.282 Y106.849 E-.05723
G1 X122.146 Y107.712 E-.33197
G1 X122.064 Y107.956 E-.09784
G1 X121.966 Y108.007 E-.04175
G1 X121.851 Y108.035 E-.04505
G1 X121.599 Y108.04 E-.09574
G1 X121.566 Y108.037 E-.01276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.208 Y100.527 Z.88 F42000
G1 X120.202 Y100.495 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372689
G1 F8225.939
M204 S6000
G1 X120.143 Y100.529 E.00241
G1 X120.184 Y100.553 E.00167
M204 S10000
G1 X120.364 Y105.573 F42000
; LINE_WIDTH: 0.500008
G1 F5845.219
M204 S6000
G2 X120.359 Y105.669 I-.027 J.046 E.0111
M204 S10000
G1 X120.83 Y105.707 F42000
; LINE_WIDTH: 0.423722
G1 F7071.476
M204 S6000
G1 X120.579 Y105.189 E.02392
G1 X120.455 Y104.788 E.01739
; LINE_WIDTH: 0.423559
G1 F7074.665
G1 X120.42 Y104.346 E.01836
; LINE_WIDTH: 0.405758
G1 F7438.984
G3 X120.38 Y103.108 I8.529 J-.9 E.04891
G3 X120.524 Y100.553 I12.083 J-.599 E.10109
G1 X120.635 Y100.19 E.01498
G1 X119.736 Y100.196 E.03545
G1 X119.904 Y100.813 E.02521
G3 X120.065 Y103.732 I-25.32 J2.86 E.11536
; LINE_WIDTH: 0.391159
G1 F7767.024
G1 X120.072 Y104.269 E.02028
; LINE_WIDTH: 0.421753
G1 F7109.992
G3 X119.835 Y105.901 I-3.564 J.315 E.06864
G2 X120.623 Y106.092 I1.852 J-5.911 E.03348
G1 X120.802 Y105.76 E.01554
M204 S10000
G1 X121.297 Y105.715 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X121.078 Y105.414 E.01532
G1 X120.834 Y104.824 E.02621
G1 X120.724 Y103.867 E.03952
G3 X120.727 Y102.006 I87.496 J-.762 E.07644
G1 X120.836 Y100.827 E.04858
G1 X120.969 Y100.318 E.02164
G1 X121.227 Y99.846 E.02207
G2 X119.493 Y99.838 I-.998 J27.761 E.07119
G1 X119.196 Y99.866 E.01226
G1 X119.374 Y100.239 E.01699
G3 X119.555 Y100.923 I-3.588 J1.316 E.02908
G3 X119.71 Y104.8 I-25.046 J2.943 E.15946
G1 X119.678 Y105.143 E.01415
G1 X119.519 Y105.739 E.02533
G1 X119.308 Y106.125 E.01807
G2 X120.872 Y106.49 I3.515 J-11.525 E.06597
G1 X121.046 Y106.026 E.02037
G1 X121.259 Y105.762 E.01393
M204 S10000
G1 X121.795 Y105.714 F42000
G1 F7144.644
M204 S6000
G1 X121.424 Y105.302 E.02278
G1 X121.187 Y104.753 E.02456
G1 X121.081 Y103.827 E.03825
G3 X121.086 Y102.039 I134.164 J-.573 E.07344
G1 X121.195 Y100.861 E.04858
G1 X121.369 Y100.294 E.02432
G1 X121.704 Y99.765 E.02573
G1 X121.93 Y99.523 E.01359
G1 X120.915 Y99.468 E.04175
G1 X119.475 Y99.478 E.05912
G1 X118.763 Y99.546 E.02935
G1 X118.507 Y99.6 E.01078
G1 X118.854 Y99.99 E.02146
G1 X119.028 Y100.339 E.01601
G3 X119.197 Y100.957 I-3.244 J1.217 E.02635
G3 X119.33 Y105.05 I-23.397 J2.81 E.16835
G1 X119.171 Y105.646 E.02533
G1 X119.074 Y105.841 E.00896
G1 X118.753 Y106.231 E.02075
G1 X118.683 Y106.291 E.00375
G2 X120.621 Y106.825 I4.738 J-13.396 E.0826
G1 X121.143 Y106.876 E.02155
G1 X121.307 Y106.316 E.02395
G1 X121.414 Y106.128 E.00893
G1 X121.751 Y105.754 E.02065
M204 S10000
G1 X122.726 Y105.705 F42000
; LINE_WIDTH: 0.419699
G1 F7150.59
M204 S6000
G1 X122.272 Y105.591 E.01919
G1 X122.04 Y105.454 E.01105
G1 X121.72 Y105.087 E.01997
G1 X121.537 Y104.667 E.0188
G1 X121.439 Y103.787 E.03631
G3 X121.444 Y102.072 I368.083 J.211 E.07038
G1 X121.553 Y100.894 E.04854
G1 X121.68 Y100.476 E.01789
G1 X122.008 Y99.957 E.02522
G1 X122.517 Y99.639 E.02462
G3 X123.114 Y99.409 I28.139 J72.394 E.02624
G1 X122.878 Y99.288 E.01091
G2 X120.246 Y99.113 I-2.348 J15.423 E.10834
G2 X117.865 Y99.368 I-.279 J8.629 E.09855
G1 X117.743 Y99.427 E.00557
G3 X118.538 Y100.161 I-2.329 J3.32 E.0445
G1 X118.683 Y100.439 E.01285
G3 X118.839 Y100.992 I-2.897 J1.117 E.0236
G3 X118.989 Y104.855 I-24.816 J2.903 E.15879
G1 X118.824 Y105.553 E.02944
G1 X118.519 Y105.958 E.02077
G3 X117.946 Y106.333 I-1.165 J-1.154 E.02832
G1 X118.623 Y106.661 E.03088
G2 X120.598 Y107.188 I5.095 J-15.151 E.08392
G1 X121.457 Y107.267 E.03538
G1 X121.514 Y106.843 E.01755
G1 X121.685 Y106.365 E.02082
G1 X122.044 Y105.98 E.02159
G1 X122.667 Y105.714 E.02779
M204 S10000
G1 X122.726 Y105.705 F42000
; LINE_WIDTH: 0.405389
G1 F7446.941
M204 S6000
G1 X122.76 Y105.714 E.0014
M204 S10000
G1 X125.306 Y106.061 F42000
; LINE_WIDTH: 0.396239
G1 F7649.646
M204 S6000
G1 X125.213 Y105.785 E.01117
G1 X125.011 Y105.682 E.00871
G1 X124.819 Y105.839 E.00952
G1 X125.05 Y106.127 E.01417
G1 X125.265 Y106.177 E.00848
G1 X125.286 Y106.118 E.00242
M204 S10000
G1 X125.629 Y105.849 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X125.437 Y105.511 E.01594
G1 X125.12 Y105.339 E.01482
G1 X124.925 Y105.328 E.00803
G1 X124.339 Y105.795 E.03076
G1 X124.807 Y106.381 E.03084
G1 X125.024 Y106.479 E.00975
G1 X125.34 Y106.527 E.01315
G1 X125.538 Y106.422 E.0092
G1 X125.65 Y106.113 E.01349
G1 X125.634 Y105.909 E.0084
M204 S10000
G1 X125.995 Y105.858 F42000
G1 F7144.644
M204 S6000
G1 X125.813 Y105.398 E.02029
G2 X125.326 Y105.014 I-1.209 J1.033 E.02564
G1 X124.861 Y104.974 E.01917
G1 X124.563 Y105.124 E.01369
G1 X123.799 Y105.779 E.04133
G1 X124.014 Y105.965 E.01167
G1 X124.555 Y106.643 E.0356
G1 X124.745 Y106.783 E.00971
G1 X125.266 Y106.904 E.02196
G1 X125.544 Y106.858 E.01157
G1 X125.827 Y106.636 E.0148
G1 X125.989 Y106.28 E.01604
G2 X125.997 Y105.918 I-.972 J-.204 E.01498
M204 S10000
G1 X126.322 Y105.631 F42000
; LINE_WIDTH: 0.419461
G1 F7155.324
M204 S6000
G1 X126.118 Y105.201 E.01951
G1 X125.916 Y104.963 E.01283
G1 X125.463 Y104.675 E.02198
G1 X124.958 Y104.609 E.0209
G1 X124.673 Y104.641 E.01174
G1 X124.235 Y104.932 E.02154
G1 X123.592 Y105.489 E.03491
G3 X122.881 Y105.748 I-1.165 J-2.093 E.03115
G1 X123.396 Y105.922 E.02228
G1 X123.733 Y106.189 E.01764
G1 X124.303 Y106.904 E.03746
G1 X124.59 Y107.117 E.01468
G1 X125.254 Y107.271 E.02793
G1 X125.681 Y107.201 E.01773
G1 X126.035 Y106.959 E.01759
G1 X126.239 Y106.616 E.01637
G2 X126.39 Y106.034 I-1.833 J-.784 E.02474
G1 X126.332 Y105.69 E.01429
; WIPE_START
G1 X126.39 Y106.034 E-.13243
G1 X126.362 Y106.219 E-.07127
G1 X126.239 Y106.616 E-.15773
G1 X126.035 Y106.959 E-.15175
G1 X125.681 Y107.201 E-.16306
G1 X125.463 Y107.237 E-.08376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.625 Y103.846 Z.88 F42000
G1 X111.97 Y100.545 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X112.053 Y100.67 E.00665
G3 X112.249 Y101.647 I-2.196 J.95 E.04467
G3 X111.576 Y105.183 I-11.121 J-.287 E.16083
G3 X110.996 Y106.169 I-2.669 J-.907 E.05122
G3 X110.007 Y106.601 I-1.239 J-1.488 E.04865
G3 X108.806 Y106.053 I-.006 J-1.575 E.06059
G3 X108.415 Y104.816 I1.743 J-1.23 E.05863
G3 X109.27 Y101.018 I12.183 J.745 E.1739
G3 X110.576 Y99.968 I1.501 J.53 E.0785
G1 X110.787 Y99.925 E.00962
G1 X111.161 Y100.02 E.01714
G3 X111.917 Y100.472 I-.263 J1.299 E.03995
G1 X111.935 Y100.497 E.00135
M204 S10000
G1 X111.663 Y100.748 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X111.874 Y101.652 I-1.617 J.853 E.03855
G3 X111.226 Y105.047 I-10.731 J-.288 E.14252
G3 X110.782 Y105.85 I-2.297 J-.747 E.0379
G3 X109.984 Y106.221 I-.977 J-1.055 E.03672
G3 X109.101 Y105.816 I-.011 J-1.141 E.04122
G3 X108.791 Y104.817 I1.382 J-.977 E.04366
G3 X109.42 Y101.684 I11.996 J.78 E.1316
G3 X109.703 Y100.987 I3.394 J.97 E.03093
G3 X110.651 Y100.335 I1.047 J.508 E.04943
G1 X110.778 Y100.309 E.00532
G1 X111.058 Y100.381 E.01187
G3 X111.625 Y100.702 I-.232 J1.071 E.02717
; WIPE_START
M204 S6000
G1 X111.765 Y100.947 E-.10731
G1 X111.802 Y101.068 E-.04809
G1 X111.853 Y101.379 E-.11988
G1 X111.874 Y101.652 E-.10406
G1 X111.825 Y102.485 E-.31701
G1 X111.802 Y102.651 E-.06365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.397 Y101.284 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G3 X106.217 Y100.052 I3.814 J1.65 E.06622
G1 X106.375 Y99.87 E.01071
G3 X107.948 Y98.941 I4.233 J5.372 E.08149
G3 X109.971 Y98.669 I1.939 J6.736 E.09111
G3 X112.159 Y99.055 I-.207 J7.56 E.0992
G3 X113.85 Y99.991 I-4.05 J9.311 E.08611
G3 X115.091 Y101.319 I-4.282 J5.244 E.08109
G3 X115.543 Y102.776 I-3.345 J1.837 E.0683
G1 X115.609 Y103.238 E.02075
G3 X113.658 Y106.882 I-4.55 J-.09 E.19087
G3 X111.959 Y107.611 I-2.96 J-4.556 E.08267
G3 X110.776 Y107.734 I-1.841 J-11.992 E.05292
G3 X108.655 Y107.415 I.212 J-8.629 E.09563
G3 X107.144 Y106.613 I2.163 J-5.901 E.07636
G1 X106.683 Y106.293 E.02495
G3 X105.512 Y104.783 I4.158 J-4.432 E.08535
G3 X105.168 Y103.29 I4.496 J-1.824 E.06844
G1 X105.126 Y102.873 E.01864
G3 X105.379 Y101.342 I6.162 J.233 E.06923
M204 S10000
G1 X105.047 Y101.148 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X105.932 Y99.809 I4.164 J1.789 E.06625
G1 X106.121 Y99.59 E.01189
G3 X107.826 Y98.587 I4.518 J5.724 E.08148
G3 X109.417 Y98.312 I1.895 J6.221 E.06648
G3 X110 Y98.295 I.351 J2.05 E.02402
G3 X112.294 Y98.705 I-.235 J7.925 E.09603
G3 X114.078 Y99.692 I-4.224 J9.743 E.08381
G3 X115.314 Y100.974 I-4.968 J6.025 E.07329
G3 X115.913 Y102.718 I-3.382 J2.138 E.0764
G1 X115.986 Y103.224 E.02099
G3 X113.868 Y107.195 I-4.949 J-.089 E.19181
G3 X112.028 Y107.98 I-3.181 J-4.905 E.08254
G3 X110.774 Y108.11 I-1.933 J-12.532 E.05179
G3 X108.748 Y107.835 I.455 J-10.947 E.08407
G3 X106.933 Y106.923 I1.66 J-5.569 E.0838
G1 X106.437 Y106.579 E.02479
G3 X105.25 Y105.096 I4.715 J-4.993 E.07825
G3 X104.795 Y103.332 I4.404 J-2.075 E.07526
G1 X104.749 Y102.875 E.01884
G3 X105.029 Y101.206 I6.578 J.246 E.06971
; WIPE_START
M204 S6000
G1 X105.186 Y100.841 E-.15091
G1 X105.382 Y100.514 E-.14494
G1 X105.676 Y100.117 E-.18747
G1 X105.932 Y99.809 E-.15213
G1 X106.121 Y99.59 E-.11003
G1 X106.153 Y99.568 E-.01453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.001 Y102.264 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.380479
G1 F8025.933
M204 S6000
G1 X107.08 Y101.949 E.01187
M204 S10000
G1 X107.868 Y100.616 F42000
; LINE_WIDTH: 0.424333
G1 F7059.615
M204 S6000
G1 X107.358 Y100.961 E.02561
G1 X106.89 Y101.557 E.03148
G1 X106.725 Y101.919 E.01652
G1 X106.664 Y102.342 E.01778
; LINE_WIDTH: 0.485674
G1 F6042.103
G1 X106.658 Y102.604 E.0127
; LINE_WIDTH: 0.546768
G1 F5283.616
G2 X106.814 Y103.911 I5.523 J.007 E.07328
G1 X106.933 Y104.208 E.01773
G1 X107.042 Y103.401 E.04517
; LINE_WIDTH: 0.555124
G1 F5194.438
G1 X107.177 Y102.712 E.03968
; LINE_WIDTH: 0.53769
G1 F5384.045
G1 X107.24 Y102.536 E.01015
; LINE_WIDTH: 0.490613
G1 F5972.774
G1 X107.304 Y102.361 E.00915
; LINE_WIDTH: 0.422469
G1 F7095.945
G2 X107.557 Y101.497 I-5.437 J-2.064 E.03728
G1 X107.848 Y100.673 E.03613
M204 S10000
G1 X108.663 Y99.895 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X108.205 Y100.02 E.01949
G1 X107.757 Y100.257 E.02079
G1 X107.115 Y100.691 E.03183
G1 X106.599 Y101.346 E.03425
G1 X106.382 Y101.796 E.02051
G2 X106.227 Y102.868 I5.693 J1.375 E.04452
G2 X106.403 Y104.025 I6.905 J-.463 E.04813
G1 X106.57 Y104.426 E.01784
G2 X107.387 Y105.443 I5.05 J-3.224 E.05367
G3 X107.344 Y104.42 I3.3 J-.65 E.04219
G3 X108.244 Y100.634 I14.412 J1.424 E.16026
G1 X108.555 Y100.046 E.02733
G1 X108.628 Y99.944 E.00516
M204 S10000
G1 X109.881 Y99.401 F42000
G1 F7144.644
M204 S6000
G2 X108.464 Y99.558 I.703 J12.781 E.05859
G1 X108.043 Y99.699 E.01822
G1 X107.556 Y99.958 E.02266
G1 X106.872 Y100.42 E.03388
G2 X106.237 Y101.247 I4.262 J3.934 E.04287
G1 X106.035 Y101.699 E.02031
G2 X105.865 Y102.869 I5.796 J1.441 E.04866
G2 X106.056 Y104.121 I7.466 J-.498 E.05205
G1 X106.257 Y104.605 E.02154
G1 X106.615 Y105.112 E.02547
G1 X107.138 Y105.704 E.03243
G2 X108.132 Y106.357 I4.307 J-5.471 E.04886
G1 X107.95 Y106.037 E.01508
G1 X107.755 Y105.49 E.02386
G1 X107.684 Y104.88 E.02523
G3 X107.949 Y102.882 I10.67 J.4 E.08288
G3 X108.583 Y100.756 I13.036 J2.729 E.09121
G1 X108.87 Y100.22 E.02497
G1 X109.261 Y99.773 E.02437
G1 X109.826 Y99.425 E.02725
; WIPE_START
G1 X109.261 Y99.773 E-.25221
G1 X108.87 Y100.22 E-.22556
G1 X108.583 Y100.756 E-.23105
G1 X108.538 Y100.882 E-.05118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.498 Y103.095 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.416091
G1 F7223.057
M204 S6000
G3 X112.188 Y104.527 I-20.993 J-3.787 E.05948
G3 X111.697 Y105.827 I-8.312 J-2.398 E.05654
G1 X111.419 Y106.259 E.02085
G1 X111.089 Y106.582 E.01873
M73 P79 R2
G1 X110.701 Y106.792 E.01795
G3 X109.988 Y106.964 I-1.166 J-3.282 E.02985
G1 X109.29 Y106.837 E.02878
; LINE_WIDTH: 0.422135
G1 F7102.487
G1 X108.877 Y106.639 E.01894
G1 X108.499 Y106.27 E.02181
G1 X108.285 Y105.906 E.01743
G1 X108.105 Y105.381 E.02294
G1 X108.041 Y104.838 E.02258
G3 X108.3 Y102.959 I10.776 J.529 E.07843
G3 X108.922 Y100.877 I12.625 J2.634 E.08987
G1 X109.185 Y100.393 E.02274
G1 X109.526 Y100.018 E.02094
G1 X109.97 Y99.752 E.02138
G1 X110.746 Y99.539 E.03323
; LINE_WIDTH: 0.469534
G1 F6280.273
G1 X110.929 Y99.559 E.00862
G3 X111.675 Y99.776 I-1.106 J5.168 E.0363
; LINE_WIDTH: 0.468591
G1 F6294.769
G1 X111.861 Y99.921 E.01098
; LINE_WIDTH: 0.421135
G1 F7122.155
G3 X112.298 Y100.348 I-.918 J1.375 E.02532
G1 X112.521 Y100.858 E.02291
G1 X112.617 Y101.569 E.02956
G3 X112.504 Y103.036 I-10.746 J-.086 E.06063
M204 S10000
G1 X114.061 Y103.515 F42000
; LINE_WIDTH: 0.528537
G1 F5489.248
M204 S6000
G1 X114.085 Y103.306 E.01124
G2 X113.871 Y102.266 I-4.317 J.347 E.0569
G1 X113.737 Y102.05 E.01359
G3 X113.459 Y104.074 I-11.071 J-.49 E.10932
G3 X113.108 Y105.386 I-9.689 J-1.889 E.07265
G1 X113.501 Y104.953 E.03125
G2 X113.913 Y104.188 I-2.284 J-1.725 E.0466
G1 X114.048 Y103.574 E.0336
M204 S10000
G1 X114.453 Y103.781 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X114.497 Y103.349 E.01784
G2 X114.273 Y102.168 I-4.318 J.206 E.04953
G1 X114.066 Y101.774 E.01825
G2 X113.264 Y100.94 I-4.085 J3.128 E.04763
G1 X113.338 Y101.534 E.02459
G3 X113.054 Y103.989 I-11.284 J-.061 E.10166
G3 X112.35 Y106.142 I-9.593 J-1.943 E.09321
G1 X112.187 Y106.396 E.01237
G2 X113.073 Y105.947 I-2.887 J-6.809 E.0408
G1 X113.539 Y105.541 E.02537
G2 X114.437 Y103.839 I-2.413 J-2.36 E.08013
M204 S10000
G1 X114.801 Y103.912 F42000
G1 F7144.644
M204 S6000
G2 X114.763 Y102.605 I-3.033 J-.566 E.05412
G1 X114.596 Y101.98 E.02653
G1 X114.339 Y101.539 E.02098
G2 X113.4 Y100.576 I-4.72 J3.663 E.05532
G2 X112.531 Y100.057 I-5.377 J8.021 E.04161
G1 X112.85 Y100.714 E.02997
G1 X112.974 Y101.525 E.03369
G3 X112.702 Y103.915 I-11.783 J-.131 E.09897
G3 X112.048 Y105.947 I-7.875 J-1.413 E.08791
G1 X111.722 Y106.454 E.02474
G1 X111.269 Y106.893 E.02588
G1 X111.136 Y106.97 E.00633
G1 X112.042 Y106.835 E.0376
G1 X112.539 Y106.648 E.02182
G1 X113.25 Y106.267 E.03312
G1 X113.65 Y105.938 E.02127
G1 X114.116 Y105.422 E.02855
G2 X114.784 Y103.97 I-3.36 J-2.425 E.06605
M204 S10000
G1 X115.156 Y103.982 F42000
G1 F7144.644
M204 S6000
G2 X115.129 Y102.581 I-3.625 J-.633 E.05789
G1 X114.933 Y101.848 E.03117
G1 X114.695 Y101.401 E.0208
G2 X113.621 Y100.29 I-5.441 J4.188 E.06358
G2 X112.405 Y99.574 I-7.421 J11.208 E.05794
; LINE_WIDTH: 0.436196
G1 F6836.951
G1 X112.134 Y99.486 E.01226
; LINE_WIDTH: 0.470565
G1 F6264.491
G2 X111.027 Y99.174 I-3.49 J10.261 E.05385
; LINE_WIDTH: 0.422193
G1 F7101.351
G1 X109.966 Y99.047 E.04414
G1 X109.465 Y99.061 E.0207
G1 X108.385 Y99.206 E.04503
G2 X107.403 Y99.628 I.864 J3.364 E.04433
G1 X106.63 Y100.15 E.03855
G2 X105.964 Y100.996 I5.346 J4.893 E.04451
G1 X105.724 Y101.501 E.02312
G2 X105.553 Y103.322 I4.483 J1.339 E.07602
G1 X105.69 Y104.128 E.03377
G1 X105.854 Y104.625 E.02165
G2 X106.929 Y106.007 I5.623 J-3.265 E.07254
G2 X108.275 Y106.854 I6.128 J-8.25 E.06576
G1 X108.762 Y107.035 E.02146
; LINE_WIDTH: 0.419918
G1 F7146.24
G1 X109.603 Y107.251 E.03565
G2 X110.757 Y107.356 I1.758 J-12.817 E.04758
G2 X112.132 Y107.185 I-.785 J-11.9 E.05692
G1 X112.688 Y106.976 E.02436
G1 X113.45 Y106.569 E.03549
G2 X115.139 Y104.04 I-2.531 J-3.518 E.12754
; WIPE_START
G1 X115 Y104.509 E-.18583
G1 X114.772 Y105.047 E-.22212
G1 X114.58 Y105.372 E-.14344
G1 X114.268 Y105.816 E-.20618
G1 X114.264 Y105.82 E-.00243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.636 Y106.101 Z.88 F42000
G1 X97.924 Y106.422 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X97.9 Y106.448 E.00159
G2 X97.672 Y107.32 I.993 J.726 E.04103
G2 X97.94 Y109.493 I10.883 J-.238 E.09757
G1 X98.066 Y109.892 E.01863
G2 X98.93 Y110.488 I1.273 J-.921 E.04761
G2 X100.001 Y110.51 I.636 J-4.973 E.04776
G2 X101.945 Y110.301 I-.424 J-13.092 E.08706
G2 X103.313 Y109.453 I-.689 J-2.637 E.07267
G3 X104.197 Y108.526 I5.965 J4.805 E.05703
G3 X104.508 Y108.548 I.088 J.986 E.01397
G3 X104.802 Y109.279 I-.552 J.647 E.03645
G3 X104.534 Y110.599 I-4.076 J-.14 E.0602
G3 X103.927 Y111.539 I-3.835 J-1.813 E.04989
G3 X103.754 Y111.583 I-.172 J-.308 E.00803
G2 X98.682 Y111.368 I-4.232 J39.814 E.226
G2 X94.139 Y111.54 I-.177 J55.315 E.20226
G3 X93.173 Y111.501 I-.36 J-3 E.04319
G3 X92.737 Y111.23 I.41 J-1.148 E.02302
G3 X92.701 Y111.043 I1.441 J-.376 E.00846
G3 X93.205 Y110.769 I1.233 J1.667 E.02561
G2 X94.133 Y109.605 I-.768 J-1.565 E.06844
G2 X94.277 Y107.6 I-13.873 J-2.002 E.08949
G2 X94.187 Y102.654 I-65.017 J-1.297 E.22009
G1 X94.091 Y101.326 E.05922
G2 X93.599 Y100.222 I-1.86 J.166 E.05476
G2 X92.713 Y99.696 I-1.656 J1.78 E.04621
G3 X92.558 Y99.424 I.099 J-.237 E.01496
G3 X92.929 Y98.947 I.56 J.052 E.02841
G3 X95.598 Y98.728 I2.213 J10.604 E.11945
G1 X96.211 Y98.733 E.02723
G3 X99.109 Y99.022 I-.045 J15.149 E.12979
G3 X99.475 Y99.178 I-.569 J1.838 E.01773
G3 X99.545 Y99.559 I-.473 J.283 E.01759
G3 X99.407 Y99.672 I-.168 J-.063 E.00829
G2 X98.672 Y99.817 I.844 J6.234 E.03334
G2 X98.132 Y100.249 I.707 J1.436 E.03101
G2 X97.68 Y102.226 I3.754 J1.898 E.09109
G2 X97.701 Y103.911 I418.753 J-4.22 E.07499
G2 X97.992 Y104.642 I1.845 J-.311 E.03524
G2 X99.331 Y104.946 I1.035 J-1.455 E.06272
G2 X100.832 Y103.87 I-.132 J-1.77 E.08641
G2 X101.01 Y102.888 I-6.35 J-1.655 E.04445
G1 X101.045 Y102.735 E.00696
G3 X101.454 Y102.978 I.003 J.461 E.02224
G3 X101.906 Y104.989 I-3.98 J1.95 E.0925
G3 X101.945 Y106.387 I-44.602 J1.967 E.06222
G3 X101.662 Y107.321 I-1.417 J.081 E.04434
G3 X101.195 Y107.686 I-1.784 J-1.805 E.02644
G3 X100.994 Y107.451 I.087 J-.277 E.0145
G2 X100.785 Y106.729 I-10.525 J2.662 E.03343
G2 X100.404 Y106.224 I-1.579 J.796 E.02829
G2 X99.402 Y105.954 I-.946 J1.515 E.04682
G2 X98.193 Y106.163 I-.143 J2.777 E.05505
G1 X97.968 Y106.38 E.01393
M204 S10000
G1 X98.197 Y106.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X98.047 Y107.308 I.697 J.498 E.02696
G2 X98.3 Y109.389 I10.568 J-.231 E.0862
G1 X98.398 Y109.699 E.01338
G2 X99.436 Y110.151 I.903 J-.655 E.04878
G2 X101.853 Y109.936 I-.113 J-14.915 E.09973
G2 X103.04 Y109.195 I-.584 J-2.257 E.05834
G3 X103.933 Y108.241 I11.784 J10.139 E.05366
G3 X105.069 Y108.679 I.387 J.69 E.05704
G3 X105.141 Y109.686 I-1.727 J.629 E.042
G3 X104.564 Y111.309 I-3.181 J-.216 E.07161
G3 X104.12 Y111.864 I-1.7 J-.905 E.02937
G3 X103.728 Y111.957 I-.352 J-.607 E.01677
G2 X98.683 Y111.743 I-4.207 J39.494 E.20747
G2 X94.157 Y111.915 I-.177 J55.015 E.18601
G3 X93.056 Y111.857 I-.381 J-3.268 E.04551
G3 X92.393 Y111.376 I.294 J-1.103 E.03439
G3 X92.43 Y110.782 I.543 J-.264 E.02558
G3 X93.029 Y110.437 I1.331 J1.622 E.02847
G2 X93.766 Y109.519 I-.566 J-1.21 E.05008
G2 X93.902 Y107.597 I-13.351 J-1.911 E.07918
G2 X93.813 Y102.679 I-64.618 J-1.294 E.20203
G1 X93.719 Y101.377 E.05359
G2 X93.338 Y100.491 I-1.483 J.113 E.04035
G2 X92.547 Y100.032 I-1.588 J1.827 E.03776
G3 X92.18 Y99.424 I.272 J-.578 E.0309
G3 X92.82 Y98.586 I.909 J.031 E.0462
G3 X95.6 Y98.353 I2.321 J11.017 E.11482
G1 X96.217 Y98.358 E.02533
G3 X99.202 Y98.657 I-.055 J15.599 E.12339
G3 X99.775 Y98.955 I-.292 J1.262 E.02681
G3 X99.918 Y99.633 I-.782 J.519 E.02913
G3 X99.489 Y100.039 I-.565 J-.168 E.02541
G2 X98.805 Y100.171 I.752 J5.73 E.02862
G2 X98.454 Y100.451 I.463 J.94 E.01859
G2 X98.055 Y102.226 I3.364 J1.687 E.07541
G2 X98.092 Y103.987 I25.763 J.348 E.07234
G2 X98.269 Y104.37 I1.262 J-.35 E.0174
G2 X99.039 Y104.588 I.7 J-1.006 E.03347
G2 X100.393 Y103.914 I.096 J-1.504 E.06506
G2 X100.57 Y103.338 I-1.66 J-.827 E.02484
G3 X100.718 Y102.572 I2.91 J.165 E.03214
G3 X101.329 Y102.412 I.413 J.333 E.02775
G3 X101.782 Y102.791 I-.291 J.809 E.02479
G3 X102.28 Y104.979 I-4.345 J2.14 E.09298
G3 X102.32 Y106.4 I-44.268 J1.948 E.05836
G3 X101.939 Y107.575 I-1.788 J.069 E.0518
G3 X101.246 Y108.099 I-2.352 J-2.388 E.03575
G3 X100.677 Y107.672 I.118 J-.75 E.03043
G1 X100.656 Y107.618 E.00236
G2 X100.444 Y106.886 I-19.082 J5.134 E.03132
G2 X100.174 Y106.529 I-1.119 J.566 E.01848
G2 X99.397 Y106.329 I-.709 J1.149 E.03343
G2 X98.386 Y106.494 I-.144 J2.301 E.04243
G2 X98.233 Y106.638 I.508 J.69 E.00864
; WIPE_START
M204 S6000
G1 X98.095 Y106.853 E-.0973
G1 X98.053 Y107.05 E-.07654
G1 X98.047 Y107.308 E-.09802
G1 X98.101 Y108.19 E-.33576
G1 X98.155 Y108.587 E-.15239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.307 Y103.749 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35564
G1 F8700.432
M204 S6000
G1 X101.234 Y103.013 E.02492
M204 S10000
G1 X101.218 Y102.995 F42000
; LINE_WIDTH: 0.252378
G1 F12000
M204 S6000
M73 P80 R2
G1 X101.32 Y103.75 E.01672
M204 S10000
G1 X101.414 Y103.761 F42000
; LINE_WIDTH: 0.16068
G1 F12000
M204 S6000
G2 X101.193 Y102.973 I-14.954 J3.768 E.0094
; WIPE_START
G1 X101.414 Y103.761 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.117 Y100.519 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373269
G1 F8210.694
M204 S6000
G1 X95.721 Y100.52 E.01416
G1 X95.883 Y101.119 E.02219
; LINE_WIDTH: 0.40132
G1 F7535.731
G1 X95.915 Y101.31 E.00753
G1 X96.066 Y100.707 E.02421
; LINE_WIDTH: 0.362429
G1 F8505.089
G1 X96.102 Y100.577 E.00464
M204 S10000
G1 X95.915 Y101.31 F42000
; LINE_WIDTH: 0.417639
G1 F7191.801
M204 S6000
G1 X95.914 Y101.426 E.00472
; WIPE_START
G1 X95.915 Y101.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.571 Y106.182 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.41884
G1 F7167.711
M204 S6000
G2 X101.521 Y104.733 I-212.202 J6.615 E.05934
G1 X101.432 Y104.145 E.02431
G1 X101.183 Y104.202 E.01044
G1 X101.108 Y104.159 E.00357
G3 X100.544 Y104.851 I-2.704 J-1.627 E.03667
G1 X99.99 Y105.174 E.02624
G3 X98.852 Y105.313 I-1.018 J-3.594 E.04711
G1 X98.293 Y105.226 E.02316
G1 X97.849 Y104.991 E.02055
G1 X97.687 Y104.868 E.00833
G1 X97.424 Y104.366 E.02321
G1 X97.326 Y103.935 E.01807
G1 X97.31 Y101.949 E.0813
G3 X97.47 Y100.924 I3.902 J.084 E.04259
G1 X97.799 Y100.074 E.0373
G1 X98.247 Y99.627 E.0259
G1 X98.569 Y99.455 E.01493
G1 X98.955 Y99.376 E.01613
G2 X96.203 Y99.108 I-3.045 J17.01 E.11332
G1 X94.631 Y99.111 E.06434
G1 X93.772 Y99.182 E.03524
G1 X92.996 Y99.34 E.03242
G1 X92.963 Y99.385 E.00228
G1 X93.308 Y99.544 E.01556
G1 X93.714 Y99.826 E.02025
G1 X94.096 Y100.232 E.02282
G1 X94.268 Y100.555 E.01495
G1 X94.458 Y101.251 E.02954
G3 X94.644 Y104.681 I-67.528 J5.386 E.14062
G1 X94.645 Y108.056 E.13811
G3 X94.492 Y109.715 I-17.03 J-.73 E.06824
G1 X94.313 Y110.185 E.02057
G1 X94.073 Y110.563 E.01833
G1 X93.655 Y110.931 E.02276
G1 X93.297 Y111.136 E.01691
G1 X93.755 Y111.175 E.0188
G1 X96.892 Y111.015 E.12854
G1 X98.381 Y111.002 E.06095
G1 X98.405 Y110.68 E.01321
G1 X98.26 Y110.598 E.00684
G1 X97.768 Y110.122 E.02802
G1 X97.478 Y109.158 E.04118
G1 X97.328 Y107.977 E.04872
G1 X97.293 Y107.18 E.03266
G1 X97.377 Y106.635 E.02259
G1 X97.624 Y106.191 E.02077
G1 X98.035 Y105.819 E.02269
G1 X98.544 Y105.659 E.02183
; LINE_WIDTH: 0.39319
G1 F7719.646
G1 X99.044 Y105.61 E.01909
G1 X99.959 Y105.648 E.03482
; LINE_WIDTH: 0.419998
G1 F7144.644
G1 X100.1 Y105.674 E.00586
G1 X100.596 Y105.9 E.0224
G1 X100.928 Y106.252 E.01987
G1 X101.179 Y106.71 E.02145
G1 X101.299 Y107.124 E.0177
G1 X101.415 Y107.015 E.00653
G1 X101.53 Y106.715 E.01317
G1 X101.566 Y106.242 E.01952
M204 S10000
G1 X101.159 Y105.898 F42000
; LINE_WIDTH: 0.507118
G1 F5752.251
M204 S6000
G1 X101.121 Y104.831 E.05445
G1 X100.79 Y105.175 E.02432
G1 X100.433 Y105.382 E.02103
G1 X100.807 Y105.555 E.02097
G1 X101.116 Y105.856 E.02204
M204 S10000
G1 X97.963 Y105.465 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X97.587 Y105.258 E.01765
G1 X97.368 Y105.035 E.01282
G1 X97.105 Y104.533 E.02328
G1 X96.977 Y104.042 E.02082
G3 X96.95 Y101.951 I154.131 J-3.016 E.08583
G3 X97.112 Y100.859 I4.472 J.103 E.04546
G1 X97.468 Y99.934 E.04072
G3 X97.785 Y99.57 I1.035 J.582 E.01996
G2 X94.646 Y99.471 I-2.341 J24.503 E.12905
G1 X93.92 Y99.531 E.02993
G1 X94.358 Y99.986 E.02594
G1 X94.573 Y100.351 E.01738
G3 X94.874 Y101.961 I-4.875 J1.747 E.06756
G3 X95.004 Y105.049 I-59.116 J4.031 E.12692
G1 X95.005 Y108.056 E.12344
G3 X94.829 Y109.844 I-14.192 J-.497 E.07381
G1 X94.65 Y110.313 E.02064
G1 X94.352 Y110.784 E.02288
G1 X96.873 Y110.656 E.10366
G3 X97.793 Y110.647 I5.337 J541.152 E.03777
G1 X97.517 Y110.38 E.01576
G1 X97.339 Y110.013 E.01678
G1 X97.127 Y109.24 E.03287
G3 X96.934 Y107.195 I16.616 J-2.607 E.08442
G1 X97.022 Y106.577 E.02561
G1 X97.277 Y106.059 E.02372
G1 X97.642 Y105.673 E.02182
G1 X97.909 Y105.488 E.01332
M204 S10000
G1 X97.314 Y105.49 F42000
; LINE_WIDTH: 0.419998
G1 F7144.654
M204 S6000
G1 X97.087 Y105.268 E.01304
G1 X96.786 Y104.699 E.0264
G1 X96.627 Y104.128 E.02433
G3 X96.59 Y101.954 I29.788 J-1.596 E.0893
G3 X97.105 Y99.868 I5.445 J.236 E.08881
G2 X94.693 Y99.831 I-1.614 J26.447 E.09907
G1 X94.963 Y100.366 E.02458
G1 X95.152 Y101.062 E.02963
G3 X95.364 Y105.049 I-42.58 J4.259 E.16401
G1 X95.365 Y108.056 E.12344
G3 X95.165 Y109.972 I-12.951 J-.382 E.07917
G1 X95.005 Y110.391 E.0184
G1 X97.063 Y110.294 E.08456
G1 X96.784 Y109.348 E.04048
G3 X96.574 Y107.21 I16.001 J-2.649 E.08829
G1 X96.667 Y106.52 E.02857
G1 X96.772 Y106.22 E.01305
G1 X97.057 Y105.746 E.02273
G1 X97.271 Y105.532 E.01242
M204 S10000
G1 X96.804 Y105.49 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X96.467 Y104.866 E.02909
; LINE_WIDTH: 0.444041
G1 F6697.257
G1 X96.348 Y104.542 E.01515
; LINE_WIDTH: 0.507226
G1 F5750.866
G1 X96.229 Y104.217 E.01764
G1 X96.196 Y103.588 E.03211
; LINE_WIDTH: 0.534189
G1 F5423.806
G2 X96.162 Y101.958 I-168.495 J2.709 E.0882
; LINE_WIDTH: 0.534307
G1 F5422.457
G1 X96.201 Y101.753 E.01129
; LINE_WIDTH: 0.488584
G1 F6001.07
G1 X96.24 Y101.548 E.0102
; LINE_WIDTH: 0.421234
G1 F7120.209
G3 X96.39 Y100.775 I109.168 J20.732 E.03243
G1 X96.575 Y100.205 E.02468
G2 X95.278 Y100.19 I-.932 J23.682 E.05345
G3 X95.55 Y101.337 I-5.381 J1.882 E.04865
; LINE_WIDTH: 0.44325
G1 F6711.08
G1 X95.588 Y101.526 E.00843
; LINE_WIDTH: 0.489754
G1 F5984.729
G1 X95.625 Y101.715 E.00945
; LINE_WIDTH: 0.53124
G1 F5457.759
G1 X95.663 Y101.904 E.01036
G3 X95.764 Y104.249 I-103.673 J5.63 E.12618
; LINE_WIDTH: 0.505607
G1 F5771.768
G1 X95.75 Y104.516 E.01357
; LINE_WIDTH: 0.471364
G1 F6252.334
G1 X95.737 Y104.782 E.01252
; LINE_WIDTH: 0.42428
G1 F7060.644
G2 X95.724 Y105.85 I10.71 J.664 E.04436
; LINE_WIDTH: 0.439237
G1 F6782.118
G1 X95.743 Y106.038 E.00821
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X95.763 Y106.227 E.00904
; LINE_WIDTH: 0.50446
G1 F5786.67
G1 X95.782 Y106.416 E.00962
G2 X95.765 Y108 I18.325 J.988 E.08034
; LINE_WIDTH: 0.480554
G1 F6115.678
G1 X95.724 Y108.421 E.02028
; LINE_WIDTH: 0.422297
G1 F7099.309
G3 X95.525 Y110.004 I-19.608 J-1.66 E.06594
G1 X96.575 Y109.95 E.04347
G3 X96.355 Y108.909 I4.237 J-1.438 E.04407
; LINE_WIDTH: 0.441299
G1 F6745.439
G1 X96.285 Y108.512 E.01754
; LINE_WIDTH: 0.491619
G1 F5958.855
G1 X96.214 Y108.115 E.01985
G1 X96.182 Y107.226 E.0438
; LINE_WIDTH: 0.497636
G1 F5876.913
G1 X96.218 Y106.84 E.01936
; LINE_WIDTH: 0.522831
G1 F5556.932
G1 X96.254 Y106.454 E.02047
; LINE_WIDTH: 0.51619
G1 F5637.841
G1 X96.386 Y106.204 E.0147
; LINE_WIDTH: 0.477713
G1 F6157.267
G1 X96.518 Y105.954 E.01346
; LINE_WIDTH: 0.431167
G1 F6929.607
G3 X96.769 Y105.538 I1.649 J.711 E.02062
M204 S10000
G1 X96.401 Y105.467 F42000
; LINE_WIDTH: 0.375279
G1 F8158.344
M204 S6000
G3 X96.061 Y104.746 I2.98 J-1.843 E.02871
G1 X96.062 Y106.17 E.0512
G3 X96.371 Y105.519 I1.89 J.498 E.02606
M204 S10000
G1 X96.059 Y109.502 F42000
; LINE_WIDTH: 0.546008
G1 F5291.877
M204 S6000
G2 X96.059 Y109.607 I-.025 J.052 E.0129
M204 S10000
G1 X98.763 Y110.918 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.525477
G1 F5525.343
M204 S6000
G2 X99.056 Y110.94 I.648 J-6.787 E.0156
G1 X100.384 Y110.933 E.07052
; LINE_WIDTH: 0.579641
G1 F4949.31
G1 X101.101 Y110.911 E.04249
; WIPE_START
G1 X100.384 Y110.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.378 Y108.994 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X104.325 Y108.909 E.00412
G3 X103.174 Y110.097 I-11.443 J-9.938 E.06797
G1 X102.649 Y110.431 E.02552
G1 X102.058 Y110.659 E.02603
G1 X101.469 Y110.745 E.02441
G1 X101.481 Y111.033 E.01184
G3 X103.724 Y111.205 I-4.456 J73.076 E.09236
G2 X104.238 Y110.336 I-5.31 J-3.729 E.04148
G1 X104.343 Y109.948 E.0165
G1 X104.425 Y109.279 E.0277
G1 X104.388 Y109.054 E.00936
M204 S10000
G1 X103.98 Y109.83 F42000
; LINE_WIDTH: 0.449309
G1 F6606.62
M204 S6000
G3 X102.848 Y110.748 I-3.189 J-2.773 E.06504
G2 X103.535 Y110.814 I2.09 J-18.15 E.03066
G1 X103.8 Y110.39 E.0222
G1 X103.973 Y109.889 E.02351
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F6606.62
G1 X103.8 Y110.39 E-.20123
G1 X103.535 Y110.814 E-.19001
G1 X102.848 Y110.748 E-.26233
G1 X103.085 Y110.599 E-.10644
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 941
M625
; layer num/total_layer_count: 3/3
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S160.65
; OBJECT_ID: 1070
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
M204 S10000
G17
G3 Z.88 I-1.155 J.382 P1  F42000
G1 X117.233 Y153.374 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X118.68 Y153.374 E.05943
G1 X118.68 Y156.878 E.14388
G1 X117.233 Y156.878 E.05943
G1 X117.233 Y158.906 E.08324
G2 X117.415 Y159.914 I2.418 J.082 E.04241
G2 X118.117 Y160.414 I.95 J-.591 E.0363
G1 X118.439 Y160.51 E.01381
G2 X119.279 Y160.209 I-.138 J-1.706 E.03705
G2 X119.592 Y159.777 I-1.118 J-1.141 E.02203
G1 X122.767 Y162.093 E.16134
G3 X121.129 Y163.515 I-5.577 J-4.768 E.0894
G3 X119.318 Y164.049 I-2.389 J-4.772 E.07792
G1 X118.65 Y164.136 E.02764
G3 X116.708 Y163.801 I.257 J-7.282 E.08117
G3 X115.113 Y162.772 I2.169 J-5.114 E.07832
G1 X114.825 Y162.525 E.01556
G3 X113.705 Y160.754 I6.164 J-5.14 E.0863
G3 X113.348 Y159.045 I5.515 J-2.042 E.07195
G1 X113.3 Y158.42 E.02571
G1 X113.3 Y149.557 E.36392
G1 X117.233 Y149.557 E.16149
G1 X117.233 Y153.314 E.15426
; WIPE_START
M204 S6000
G1 X118.68 Y153.374 E-.55053
G1 X118.68 Y153.926 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1070
M625
; object ids of layer 3 start: 701,783,941,1070
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.16
G1 X0 Y131.21 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer3 end: 701,783,941,1070
M625
; start printing object, unique label id: 1070
M624 CAAAAAAAAAA=
G1 X117.033 Y150.326 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X116.463 Y149.757 E.03584
G1 X115.912 Y149.757
G1 X117.033 Y150.878 E.07052
G1 X117.033 Y151.429
G1 X115.361 Y149.757 E.10521
G1 X114.809 Y149.757
G1 X117.033 Y151.981 E.1399
G1 X117.033 Y152.532
G1 X114.258 Y149.757 E.17459
G1 X113.706 Y149.757
G1 X117.033 Y153.083 E.20928
G1 X118.075 Y153.574
G1 X118.481 Y153.98 E.02553
G1 X118.481 Y154.531
G1 X117.523 Y153.574 E.06022
; WIPE_START
M204 S6000
G1 X118.481 Y154.531 E-.51442
G1 X118.481 Y153.98 E-.20954
G1 X118.414 Y153.912 E-.03604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.481 Y155.082 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X113.499 Y150.101 E.31338
G1 X113.499 Y150.652
G1 X118.481 Y155.634 E.31338
G1 X118.481 Y156.185
G1 X113.499 Y151.203 E.31338
G1 X113.499 Y151.755
G1 X118.423 Y156.679 E.30976
G1 X117.872 Y156.679
G1 X113.499 Y152.306 E.27508
G1 X113.499 Y152.858
G1 X117.32 Y156.679 E.24039
G1 X117.033 Y156.943
G1 X113.499 Y153.409 E.22232
G1 X113.499 Y153.961
G1 X117.033 Y157.495 E.22232
G1 X117.033 Y158.046
G1 X113.499 Y154.512 E.22232
G1 X113.499 Y155.063
G1 X117.033 Y158.598 E.22232
G1 X117.046 Y159.162
G1 X113.499 Y155.615 E.22312
G1 X113.499 Y156.166
G1 X117.163 Y159.831 E.23052
; WIPE_START
M204 S6000
G1 X115.749 Y158.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.632 Y160.093 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X122.063 Y162.525 E.15296
G1 X121.781 Y162.794
G1 X119.374 Y160.387 E.15142
G1 X119.016 Y160.581
M73 P81 R2
G1 X121.477 Y163.041 E.15477
G1 X121.146 Y163.262
G1 X118.571 Y160.687 E.16199
G1 X117.858 Y160.525
G1 X120.788 Y163.456 E.18433
G1 X120.392 Y163.611
G1 X113.499 Y156.718 E.43362
G1 X113.499 Y157.269
G1 X119.95 Y163.72 E.40584
G1 X119.494 Y163.816
G1 X113.499 Y157.82 E.37715
G1 X113.499 Y158.372
G1 X119.011 Y163.884 E.34674
G1 X118.496 Y163.92
G1 X113.542 Y158.966 E.31161
G1 X113.614 Y159.589
G1 X117.882 Y163.858 E.26853
G1 X117.204 Y163.731
G1 X113.757 Y160.284 E.21682
G1 X114.188 Y161.266
G1 X116.321 Y163.4 E.13421
; WIPE_START
M204 S6000
G1 X114.907 Y161.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.794 Y160.59 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.230198
G1 F12000
M204 S6000
G1 X117.702 Y160.529 E.00214
; LINE_WIDTH: 0.208938
G1 X117.583 Y160.432 E.0026
; LINE_WIDTH: 0.170155
G3 X117.279 Y160.142 I1.903 J-2.306 E.00528
; LINE_WIDTH: 0.187505
G1 X117.213 Y160.055 E.00158
; LINE_WIDTH: 0.216841
G1 X117.148 Y159.968 E.00194
G1 X117.152 Y159.937 E.00057
; LINE_WIDTH: 0.187437
G1 X117.173 Y159.821 E.00171
M204 S10000
G1 X116.98 Y159.372 F42000
; LINE_WIDTH: 0.145407
G1 F12000
M204 S6000
G1 X117.06 Y159.148 E.00232
; WIPE_START
G1 X116.98 Y159.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.408 Y152.186 Z1.16 F42000
G1 X113.532 Y149.737 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.168898
G1 F12000
M204 S6000
G1 X113.532 Y149.931 E.00241
G1 X113.572 Y150.028 E.0013
; WIPE_START
G1 X113.532 Y149.931 E-.26588
G1 X113.532 Y149.737 E-.49412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.475 Y157.311 Z1.16 F42000
G1 X115.122 Y162.508 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.114816
G1 F12000
M204 S6000
G3 X114.896 Y162.281 I.802 J-1.024 E.002
; WIPE_START
G1 X115.122 Y162.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.789 Y163.619 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.130189
G1 F12000
M204 S6000
G1 X116.679 Y163.544 E.00106
; LINE_WIDTH: 0.17682
G1 X116.569 Y163.469 E.00177
; LINE_WIDTH: 0.234924
G1 X116.459 Y163.394 E.00266
G1 X116.318 Y163.42 E.00286
; WIPE_START
G1 X116.459 Y163.394 E-.39402
G1 X116.569 Y163.469 E-.36598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.956 Y163.348 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.12318
G1 F12000
M204 S6000
G3 X120.83 Y163.44 I-.62 J-.715 E.00113
; WIPE_START
G1 X120.956 Y163.348 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.352 Y162.258 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.404324
G1 F7469.978
M204 S6000
G1 X122.105 Y162.047 E.01277
; LINE_WIDTH: 0.358562
G1 F8615.255
G1 X121.858 Y161.835 E.01107
; LINE_WIDTH: 0.312801
G1 F10175.306
G1 X121.611 Y161.624 E.00937
; LINE_WIDTH: 0.26704
G1 F12000
G1 X121.364 Y161.413 E.00768
; LINE_WIDTH: 0.221279
G1 X121.117 Y161.201 E.00598
; LINE_WIDTH: 0.175517
G1 X120.87 Y160.99 E.00428
; LINE_WIDTH: 0.129756
G1 X120.623 Y160.778 E.00258
; WIPE_START
G1 X120.87 Y160.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.366 Y155.694 Z1.16 F42000
G1 X129.191 Y152.972 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X130.211 Y155.512 I-.657 J1.739 E.12632
G3 X126.896 Y154.96 I-1.579 J-.748 E.18558
G3 X128.574 Y152.883 I1.763 J-.292 E.12382
G3 X129.133 Y152.956 I-.027 J2.377 E.02318
; WIPE_START
M204 S6000
G1 X129.426 Y153.074 E-.1199
G1 X129.547 Y153.15 E-.05431
G1 X129.877 Y153.414 E-.16073
G1 X130.136 Y153.763 E-.16512
G1 X130.262 Y154.005 E-.10366
G1 X130.339 Y154.271 E-.10518
G1 X130.355 Y154.404 E-.05111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.805 Y158.508 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X123.672 Y156.918 I5.922 J-5.421 E.08035
G3 X123.276 Y155.302 I4.597 J-1.983 E.06865
G1 X123.218 Y154.709 E.02448
G3 X123.515 Y152.921 I8.64 J.514 E.07454
G3 X124.446 Y151.353 I4.721 J1.742 E.0753
G1 X124.807 Y150.918 E.02321
G3 X126.295 Y149.858 I5.845 J6.627 E.07515
G3 X128.082 Y149.398 I2.156 J4.678 E.07619
G1 X128.68 Y149.348 E.02464
G3 X130.619 Y149.698 I-.279 J7.093 E.08115
G3 X132.032 Y150.564 I-2.029 J4.894 E.06834
G1 X132.46 Y150.912 E.02266
G3 X133.526 Y152.381 I-6.45 J5.8 E.07463
G3 X133.988 Y154.144 I-4.546 J2.134 E.07524
G1 X134.044 Y154.708 E.02329
G3 X133.75 Y156.487 I-8.707 J-.521 E.07417
G3 X132.815 Y158.071 I-4.8 J-1.768 E.07593
G1 X132.481 Y158.478 E.02164
G3 X131.025 Y159.536 I-5.81 J-6.463 E.07403
G3 X129.264 Y159.998 I-2.128 J-4.532 E.07515
G1 X128.732 Y160.051 E.02199
G3 X126.884 Y159.772 I.449 J-9.231 E.07683
G3 X125.255 Y158.86 I1.71 J-4.965 E.07709
G1 X124.853 Y158.545 E.02098
; WIPE_START
M204 S6000
G1 X124.091 Y157.616 E-.45632
G1 X123.834 Y157.223 E-.17844
G1 X123.68 Y156.932 E-.12524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.873 Y151.339 Z1.16 F42000
G1 X130.297 Y149.805 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X133.594 Y153.102 E.20744
G1 X133.737 Y153.796
G1 X129.595 Y149.654 E.26058
G1 X128.968 Y149.579
G1 X133.815 Y154.426 E.30492
G1 X133.811 Y154.973
G1 X128.409 Y149.571 E.33985
G1 X127.91 Y149.623
G1 X133.752 Y155.465 E.36751
G1 X133.68 Y155.945
G1 X127.431 Y149.696 E.39307
G1 X126.986 Y149.802
G1 X133.566 Y156.382 E.41394
G1 X133.416 Y156.784
G1 X130.324 Y153.692 E.19453
G1 X130.566 Y154.485
G1 X133.227 Y157.146 E.16736
G1 X133.01 Y157.481
G1 X130.553 Y155.024 E.15456
G1 X130.449 Y155.471
G1 X132.768 Y157.79 E.14585
G1 X132.525 Y158.099
G1 X130.25 Y155.823 E.14313
G1 X130.012 Y156.137
G1 X132.268 Y158.393 E.14189
G1 X131.961 Y158.637
G1 X129.705 Y156.381 E.14194
G1 X129.352 Y156.579
G1 X131.654 Y158.882 E.14482
G1 X131.335 Y159.114
G1 X128.903 Y156.682 E.15298
G1 X128.351 Y156.682
G1 X130.99 Y159.321 E.16603
G1 X130.618 Y159.5
G1 X127.278 Y156.159 E.21012
; WIPE_START
M204 S6000
G1 X128.692 Y157.574 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.56 Y152.928 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X126.581 Y149.948 E.18746
G1 X126.216 Y150.135
G1 X128.787 Y152.706 E.16176
G1 X128.256 Y152.727
G1 X125.876 Y150.346 E.14976
G1 X125.554 Y150.576
G1 X127.832 Y152.854 E.14329
G1 X127.496 Y153.069
G1 X125.248 Y150.821 E.14144
G1 X124.942 Y151.067
G1 X127.202 Y153.327 E.14215
G1 X126.966 Y153.643
G1 X124.692 Y151.368 E.14307
G1 X124.449 Y151.677
G1 X126.789 Y154.016 E.14716
G1 X126.697 Y154.476
G1 X124.214 Y151.993 E.15619
G1 X123.998 Y152.329
G1 X126.71 Y155.041 E.1706
G1 X127.211 Y156.092
G1 X123.813 Y152.695 E.21371
G1 X123.672 Y153.105
G1 X130.2 Y159.633 E.41067
G1 X129.742 Y159.727
G1 X123.566 Y153.55 E.38854
G1 X123.501 Y154.037
G1 X129.251 Y159.787 E.36172
G1 X128.759 Y159.847
G1 X123.441 Y154.529 E.33456
G1 X123.456 Y155.095
G1 X128.149 Y159.788 E.2952
G1 X127.523 Y159.713
G1 X123.538 Y155.728 E.25069
G1 X123.708 Y156.449
G1 X126.777 Y159.519 E.19308
; WIPE_START
M204 S6000
G1 X125.363 Y158.104 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.666 Y153.8 Z1.16 F42000
G1 X133.407 Y152.611 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124315
G1 F12000
M204 S6000
G1 X133.34 Y152.518 E.00084
; LINE_WIDTH: 0.159174
G1 X133.273 Y152.424 E.0013
; LINE_WIDTH: 0.194034
G1 X133.206 Y152.33 E.00176
; LINE_WIDTH: 0.234848
G1 X133.065 Y152.157 E.00444
; LINE_WIDTH: 0.281613
G1 F11607.86
G1 X132.925 Y151.984 E.00563
; LINE_WIDTH: 0.32567
G1 F9682.242
G1 X132.684 Y151.714 E.01097
; LINE_WIDTH: 0.367013
G1 F8378.041
G1 X132.443 Y151.443 E.01268
; LINE_WIDTH: 0.408356
G1 F7383.484
G1 X132.202 Y151.173 E.01439
; LINE_WIDTH: 0.40622
G1 F7429.046
G1 X131.927 Y150.93 E.01451
; LINE_WIDTH: 0.360646
G1 F8555.523
G1 X131.651 Y150.687 E.0126
; LINE_WIDTH: 0.315072
G1 F10084.678
G1 X131.376 Y150.444 E.01069
; LINE_WIDTH: 0.267396
G1 F12000
M73 P82 R2
G1 X131.2 Y150.302 E.00534
; LINE_WIDTH: 0.217606
G1 X131.023 Y150.161 E.00406
; LINE_WIDTH: 0.171265
G1 X130.906 Y150.077 E.00183
; LINE_WIDTH: 0.128339
G1 X130.789 Y149.993 E.00112
; WIPE_START
G1 X130.906 Y150.077 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.389 Y153.627 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.238483
G1 F12000
M204 S6000
G1 X130.225 Y153.438 E.0051
; LINE_WIDTH: 0.215213
G2 X129.706 Y152.928 I-2.312 J1.836 E.01291
; LINE_WIDTH: 0.242205
G1 X129.549 Y152.94 E.00328
; WIPE_START
G1 X129.706 Y152.928 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.278 Y156.755 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.159185
G1 F12000
M204 S6000
G1 X128.033 Y156.621 E.00315
M204 S10000
G1 X127.221 Y156.082 F42000
; LINE_WIDTH: 0.150937
G1 F12000
M204 S6000
G1 X127.22 Y156.15 E.0007
G1 X127.106 Y156.264 E.00167
; WIPE_START
G1 X127.22 Y156.15 E-.53636
G1 X127.221 Y156.082 E-.22364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.223 Y159.27 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.130784
G1 F12000
M204 S6000
G1 X126.056 Y159.139 E.00172
; LINE_WIDTH: 0.178593
G1 X125.889 Y159.007 E.00288
; LINE_WIDTH: 0.226498
G1 X125.662 Y158.814 E.00566
; LINE_WIDTH: 0.274522
G1 F11991.71
G1 X125.435 Y158.621 E.00729
; LINE_WIDTH: 0.314372
G1 F10112.44
G1 X125.237 Y158.446 E.00766
; LINE_WIDTH: 0.346088
G1 F8991.03
G1 X125.04 Y158.271 E.00861
; LINE_WIDTH: 0.342061
G1 F9119.438
G1 X124.797 Y158 E.01171
; LINE_WIDTH: 0.302252
G1 F10618.565
G1 X124.554 Y157.728 E.01006
; LINE_WIDTH: 0.262443
G1 F12000
G1 X124.311 Y157.457 E.00841
; LINE_WIDTH: 0.219552
G1 X124.17 Y157.284 E.00406
; LINE_WIDTH: 0.173536
G1 X124.029 Y157.111 E.00289
; LINE_WIDTH: 0.128695
G1 X123.936 Y156.982 E.00125
; WIPE_START
G1 X124.029 Y157.111 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.385 Y159.543 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.111278
G1 F12000
M204 S6000
G1 X130.227 Y159.63 E.00105
; WIPE_START
G1 X130.385 Y159.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.155 Y159.21 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.119189
G1 F12000
M204 S6000
G3 X131.046 Y159.293 I-.771 J-.893 E.00093
; WIPE_START
G1 X131.155 Y159.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.658 Y153.993 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117804
G1 F12000
M204 S6000
G1 X133.757 Y153.795 E.00146
; WIPE_START
G1 X133.658 Y153.993 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y156.029 Z1.16 F42000
G1 X141.582 Y156.187 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X141.582 Y159.962 E.15502
G3 X138.697 Y159.7 I-.967 J-5.364 E.12041
G3 X137.349 Y158.742 I2.707 J-5.235 E.06812
G3 X136.413 Y157.121 I5.48 J-4.245 E.07707
G3 X136.163 Y155.619 I6.087 J-1.786 E.06268
G1 X136.137 Y155.184 E.01788
G1 X136.137 Y149.557 E.23105
G1 X139.727 Y149.557 E.1474
G1 X139.727 Y154.422 E.19973
G2 X139.89 Y155.561 I2.926 J.165 E.04759
G2 X140.703 Y156.2 I1.154 J-.631 E.04365
G1 X141.009 Y156.306 E.01326
G2 X141.525 Y156.206 I-.152 J-2.174 E.02167
; WIPE_START
M204 S6000
G1 X141.556 Y158.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.679 Y150.808 Z1.16 F42000
G1 X139.528 Y150.213 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X139.072 Y149.757 E.02871
G1 X138.52 Y149.757
G1 X139.528 Y150.765 E.0634
G1 X139.528 Y151.316
G1 X137.969 Y149.757 E.09809
G1 X137.417 Y149.757
G1 X139.528 Y151.867 E.13278
G1 X139.528 Y152.419
G1 X136.866 Y149.757 E.16747
G1 X136.337 Y149.779
G1 X139.528 Y152.97 E.20075
G1 X139.528 Y153.522
G1 X136.337 Y150.331 E.20075
G1 X136.337 Y150.882
G1 X139.528 Y154.073 E.20075
G1 X139.536 Y154.633
G1 X136.337 Y151.433 E.20127
G1 X136.337 Y151.985
G1 X139.59 Y155.237 E.20462
; WIPE_START
M204 S6000
G1 X138.175 Y153.823 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.795 Y156.443 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.383 Y157.031 E.03697
G1 X141.383 Y157.582
G1 X136.337 Y152.536 E.31743
G1 X136.337 Y153.088
G1 X141.383 Y158.134 E.31743
G1 X141.383 Y158.685
G1 X136.337 Y153.639 E.31743
G1 X136.337 Y154.19
G1 X141.383 Y159.236 E.31743
G1 X141.382 Y159.787
G1 X136.337 Y154.742 E.31738
G1 X136.344 Y155.3
G1 X140.878 Y159.834 E.28522
G1 X140.324 Y159.831
G1 X136.39 Y155.897 E.24747
G1 X136.473 Y156.532
G1 X139.697 Y159.757 E.20286
G1 X138.986 Y159.597
G1 X136.714 Y157.325 E.14293
; WIPE_START
M204 S6000
G1 X138.128 Y158.739 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.367 Y159.283 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11591
G1 F12000
M204 S6000
G1 X138.288 Y159.22 E.00065
; LINE_WIDTH: 0.140379
G1 X138.123 Y159.077 E.00199
; LINE_WIDTH: 0.171271
G1 X137.959 Y158.935 E.00276
; LINE_WIDTH: 0.211334
G1 X137.549 Y158.56 E.00958
; LINE_WIDTH: 0.21444
G1 X137.395 Y158.374 E.00425
; LINE_WIDTH: 0.171418
G1 X137.241 Y158.189 E.00307
; LINE_WIDTH: 0.128396
G1 X137.086 Y158.003 E.00188
; WIPE_START
G1 X137.241 Y158.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.728 Y156.51 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.203017
G1 F12000
M204 S6000
G1 X140.61 Y156.433 E.0023
; LINE_WIDTH: 0.178111
G1 X140.496 Y156.355 E.00186
; LINE_WIDTH: 0.130625
G1 X140.381 Y156.278 E.00111
M204 S10000
G1 X139.685 Y155.589 F42000
; LINE_WIDTH: 0.20633
G1 F12000
M204 S6000
G1 X139.557 Y155.375 E.00416
G1 X139.602 Y155.226 E.00261
; WIPE_START
G1 X139.557 Y155.375 E-.29274
G1 X139.685 Y155.589 E-.46726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.778 Y157.261 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.229747
G1 F12000
M204 S6000
G1 X136.556 Y156.94 E.00756
; WIPE_START
G1 X136.778 Y157.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.118 Y155.169 Z1.16 F42000
G1 X144.812 Y154.971 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X143.722 Y154.146 I2.865 J-4.917 E.05627
G3 X143.375 Y153.702 I4.942 J-4.22 E.02313
G3 X143.042 Y152.195 I2.856 J-1.42 E.064
G1 X143.042 Y149.557 E.10831
G1 X146.632 Y149.557 E.1474
G1 X146.632 Y152.733 E.13038
G2 X146.851 Y153.556 I1.452 J.055 E.03551
G2 X147.599 Y153.897 I.911 J-1.009 E.03429
G2 X148.281 Y153.59 I-.333 J-1.651 E.03096
G2 X148.567 Y152.777 I-.825 J-.747 E.03636
G1 X148.575 Y149.557 E.1322
G1 X152.165 Y149.557 E.1474
G1 X152.165 Y152.346 E.11451
G3 X151.896 Y153.8 I-3.35 J.132 E.06123
G3 X151.233 Y154.59 I-2.449 J-1.383 E.04258
G1 X150.714 Y154.978 E.02657
G3 X151.626 Y155.751 I-2.305 J3.642 E.04927
G3 X151.89 Y156.156 I-3.354 J2.468 E.01984
G3 X152.165 Y157.692 I-3.584 J1.435 E.06451
G1 X152.165 Y159.827 E.08767
G1 X148.575 Y159.827 E.1474
G1 X148.575 Y157.326 E.10267
G2 X148.352 Y156.502 I-1.423 J-.058 E.03564
G2 X147.615 Y156.167 I-.898 J1 E.03373
G2 X146.687 Y156.916 I.036 J.994 E.05249
G2 X146.632 Y157.328 I1.871 J.46 E.01711
G1 X146.632 Y159.827 E.10259
G1 X143.042 Y159.827 E.1474
G1 X143.042 Y157.843 E.08145
G3 X143.376 Y156.302 I3.335 J-.085 E.06536
G3 X144.2 Y155.404 I2.928 J1.86 E.05033
G1 X144.763 Y155.006 E.02829
; WIPE_START
M204 S6000
G1 X144.116 Y154.502 E-.31153
G1 X143.971 Y154.387 E-.07036
G1 X143.722 Y154.146 E-.13172
G1 X143.375 Y153.702 E-.214
G1 X143.342 Y153.624 E-.03239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.191 Y150.255 Z1.16 F42000
G1 X151.203 Y149.757 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X151.965 Y150.519 E.04798
G1 X151.965 Y151.071
G1 X150.651 Y149.757 E.08266
G1 X150.1 Y149.757
G1 X151.965 Y151.622 E.11735
G1 X151.965 Y152.174
G1 X149.548 Y149.757 E.15204
G1 X148.997 Y149.757
G1 X151.948 Y152.707 E.18563
G1 X151.878 Y153.189
G1 X148.773 Y150.084 E.19532
G1 X148.772 Y150.634
G1 X151.75 Y153.612 E.18735
G1 X151.544 Y153.958
G1 X148.77 Y151.184 E.17447
G1 X148.769 Y151.734
G1 X151.294 Y154.259 E.15883
G1 X150.999 Y154.516
G1 X148.768 Y152.285 E.14036
G1 X148.761 Y152.829
G1 X150.683 Y154.752 E.12092
; WIPE_START
M204 S6000
G1 X149.269 Y153.337 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.751 Y156.371 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X148.682 Y153.302 E.19308
G1 X148.485 Y153.656
G1 X151.93 Y157.101 E.21669
G1 X151.96 Y157.683
G1 X148.177 Y153.9 E.23797
G1 X147.773 Y154.046
G1 X151.962 Y158.235 E.26352
G1 X151.963 Y158.788
G1 X147.157 Y153.982 E.30235
; WIPE_START
M204 S6000
G1 X148.571 Y155.396 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.433 Y150.501 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X145.689 Y149.757 E.04682
G1 X145.137 Y149.757
G1 X146.433 Y151.052 E.08151
G1 X146.433 Y151.604
G1 X144.586 Y149.757 E.1162
G1 X144.034 Y149.757
G1 X146.433 Y152.155 E.15089
G1 X146.433 Y152.707
G1 X143.483 Y149.757 E.18558
G1 X143.243 Y150.069
G1 X146.519 Y153.344 E.20605
; WIPE_START
M204 S6000
G1 X145.105 Y151.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.245 Y150.622 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X151.964 Y159.341 E.54849
G1 X151.7 Y159.628
G1 X148.608 Y156.536 E.1945
G1 X148.768 Y157.248
G1 X151.148 Y159.628 E.1497
G1 X150.597 Y159.628
G1 X148.774 Y157.805 E.11465
G1 X148.774 Y158.357
G1 X150.045 Y159.628 E.07996
G1 X149.494 Y159.628
G1 X148.774 Y158.908 E.04527
; WIPE_START
M204 S6000
G1 X149.494 Y159.628 E-.38676
G1 X150.045 Y159.628 E-.20954
G1 X149.741 Y159.323 E-.16371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.241 Y156.169 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X143.247 Y151.175 E.31415
G1 X143.249 Y151.728
G1 X147.504 Y155.984 E.26772
G1 X147.078 Y156.109
G1 X143.25 Y152.281 E.24078
G1 X143.302 Y152.885
G1 X146.772 Y156.355 E.2183
G1 X146.564 Y156.698
G1 X144.97 Y155.103 E.10031
G1 X144.647 Y155.332
G1 X146.456 Y157.141 E.11382
G1 X146.433 Y157.669
G1 X144.324 Y155.56 E.13267
G1 X144.029 Y155.817
G1 X146.433 Y158.221 E.15121
G1 X146.433 Y158.772
G1 X143.774 Y156.114 E.16724
G1 X143.539 Y156.429
G1 X146.433 Y159.324 E.18207
G1 X146.185 Y159.628
M73 P83 R2
G1 X143.385 Y156.827 E.1762
G1 X143.287 Y157.281
G1 X145.634 Y159.628 E.14761
G1 X145.083 Y159.628
G1 X143.252 Y157.797 E.11514
G1 X143.249 Y158.346
G1 X144.531 Y159.628 E.08063
G1 X143.98 Y159.628
G1 X143.247 Y158.894 E.04612
; WIPE_START
M204 S6000
G1 X143.98 Y159.628 E-.39399
G1 X144.531 Y159.628 E-.20954
G1 X144.24 Y159.336 E-.15647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.9 Y154.788 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13162
G1 F12000
M204 S6000
G1 X144.695 Y154.619 E.00217
; LINE_WIDTH: 0.181106
G1 X144.489 Y154.449 E.00368
; LINE_WIDTH: 0.230592
G1 X144.284 Y154.28 E.00518
; LINE_WIDTH: 0.272965
G3 X143.854 Y153.861 I2.93 J-3.437 E.01459
; LINE_WIDTH: 0.257954
G1 X143.728 Y153.716 E.00433
; LINE_WIDTH: 0.23194
G1 X143.601 Y153.572 E.00376
; LINE_WIDTH: 0.200253
G1 X143.544 Y153.485 E.00166
; LINE_WIDTH: 0.1629
G1 X143.486 Y153.399 E.00122
; LINE_WIDTH: 0.125547
G1 X143.428 Y153.313 E.00078
; WIPE_START
G1 X143.486 Y153.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.545 Y156.744 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.120354
G1 F12000
M204 S6000
G1 X146.483 Y156.836 E.00076
G1 X146.501 Y156.91 E.00052
; WIPE_START
G1 X146.483 Y156.836 E-.31013
G1 X146.545 Y156.744 E-.44987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.676 Y156.467 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.238814
G1 F12000
M204 S6000
G2 X148.308 Y156.102 I-1.831 J1.478 E.0106
; WIPE_START
G1 X148.473 Y156.246 E-.31987
G1 X148.676 Y156.467 E-.44013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.092 Y154.046 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.223344
G1 F12000
M204 S6000
G1 X146.987 Y153.972 E.00239
; LINE_WIDTH: 0.194075
G1 X146.874 Y153.891 E.00214
; LINE_WIDTH: 0.169004
G1 X146.765 Y153.796 E.00179
G3 X146.581 Y153.594 I7.106 J-6.653 E.0034
; LINE_WIDTH: 0.196664
G1 X146.518 Y153.501 E.00175
; LINE_WIDTH: 0.22206
G1 X146.455 Y153.408 E.00207
; WIPE_START
G1 X146.518 Y153.501 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.066 Y154.635 Z1.16 F42000
G1 X161.368 Y155.731 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X159.198 Y155.731 E.08911
G3 X159.153 Y154.253 I2.467 J-.815 E.06156
G1 X164.875 Y154.253 E.23493
G3 X164.843 Y155.409 I-4.702 J.45 E.04757
G3 X164.203 Y157.456 I-4.416 J-.258 E.08895
G3 X163.382 Y158.542 I-11.195 J-7.606 E.05593
G3 X161.923 Y159.574 I-5.654 J-6.447 E.07349
G3 X160.142 Y160.015 I-2.098 J-4.653 E.07575
G1 X159.623 Y160.062 E.02141
G3 X157.801 Y159.778 I.465 J-8.97 E.07586
G3 X156.2 Y158.861 I1.707 J-4.834 E.07614
G1 X155.756 Y158.504 E.02342
G3 X154.695 Y157.03 I6.454 J-5.764 E.07471
G3 X154.238 Y155.261 I4.587 J-2.128 E.07544
G1 X154.183 Y154.686 E.02368
G3 X154.467 Y152.888 I8.734 J.454 E.07489
G3 X155.379 Y151.321 I4.676 J1.674 E.07489
G1 X155.74 Y150.881 E.02336
G3 X157.233 Y149.838 I5.775 J6.682 E.0749
G3 X159.037 Y149.393 I2.136 J4.776 E.07671
G1 X159.627 Y149.347 E.0243
G3 X161.489 Y149.683 I-.341 J7.205 E.07791
G3 X162.829 Y150.433 I-3.066 J7.054 E.06314
G1 X160.839 Y152.824 E.12773
G2 X159.702 Y152.319 I-1.249 J1.283 E.05217
G2 X158.805 Y152.584 I.072 J1.898 E.03878
G2 X158.083 Y153.53 I1.298 J1.737 E.04949
G2 X157.853 Y155.156 I3.231 J1.288 E.06809
G2 X158.348 Y156.618 I2.884 J-.162 E.06414
G2 X159.081 Y157.211 I1.59 J-1.216 E.03908
G2 X159.746 Y157.344 I.99 J-3.229 E.02789
G2 X160.739 Y157.023 I-.153 J-2.171 E.04328
G2 X161.175 Y156.337 I-1.015 J-1.127 E.03377
G1 X161.35 Y155.788 E.02366
; WIPE_START
M204 S6000
G1 X159.351 Y155.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.17 Y154.453 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X164.685 Y154.967 E.03237
G1 X164.634 Y155.468
G1 X163.619 Y154.453 E.06385
G1 X163.067 Y154.453
G1 X164.565 Y155.951 E.09422
G1 X164.46 Y156.397
G1 X162.516 Y154.453 E.12232
G1 X161.964 Y154.453
G1 X164.32 Y156.809 E.1482
G1 X164.137 Y157.177
G1 X161.413 Y154.453 E.17136
G1 X160.862 Y154.453
G1 X163.923 Y157.514 E.19259
G1 X163.685 Y157.827
G1 X161.58 Y155.723 E.13238
G1 X161.447 Y156.141
G1 X163.444 Y158.138 E.12559
G1 X163.192 Y158.437
G1 X161.306 Y156.552 E.1186
G1 X161.114 Y156.911
G1 X162.881 Y158.678 E.11116
G1 X162.571 Y158.919
G1 X160.844 Y157.193 E.10859
G1 X160.483 Y157.383
G1 X162.249 Y159.149 E.11112
G1 X161.902 Y159.353
G1 X160.043 Y157.494 E.11692
G1 X159.509 Y157.512
G1 X161.525 Y159.528 E.12682
G1 X161.104 Y159.658
G1 X158.581 Y157.135 E.15868
; WIPE_START
M204 S6000
G1 X159.995 Y158.549 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.389 Y155.532 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X160.31 Y154.453 E.06787
G1 X159.759 Y154.453
G1 X160.838 Y155.532 E.06787
G1 X160.286 Y155.532
G1 X159.293 Y154.539 E.06247
G1 X159.277 Y155.074
G1 X159.735 Y155.532 E.02879
; WIPE_START
M204 S6000
G1 X159.277 Y155.074 E-.24591
G1 X159.293 Y154.539 E-.20357
G1 X159.871 Y155.117 E-.31052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.222 Y150.85 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X161.154 Y149.782 E.06719
G1 X160.465 Y149.645
G1 X161.971 Y151.151 E.09478
G1 X161.721 Y151.452
G1 X159.841 Y149.572 E.11826
G1 X159.291 Y149.573
G1 X161.471 Y151.753 E.13714
G1 X161.22 Y152.054
G1 X158.792 Y149.626 E.15275
G1 X158.314 Y149.7
G1 X160.97 Y152.355 E.16704
G1 X160.323 Y152.26
G1 X157.871 Y149.808 E.15428
G1 X157.469 Y149.957
G1 X159.639 Y152.127 E.13651
G1 X159.17 Y152.21
G1 X157.1 Y150.139 E.13023
G1 X156.76 Y150.351
G1 X158.777 Y152.368 E.12688
G1 X158.47 Y152.613
G1 X156.448 Y150.59 E.12725
G1 X156.135 Y150.829
G1 X158.203 Y152.897 E.13008
G1 X158.004 Y153.249
G1 X155.834 Y151.08 E.13648
G1 X155.586 Y151.383
G1 X157.834 Y153.63 E.14139
G1 X157.712 Y154.061
G1 X155.347 Y151.695 E.1488
G1 X155.118 Y152.018
G1 X157.658 Y154.558 E.15978
G1 X157.655 Y155.106
G1 X154.91 Y152.361 E.17264
G1 X154.736 Y152.739
G1 X157.747 Y155.75 E.18941
G1 X158.222 Y156.776
G1 X154.6 Y153.153 E.2279
G1 X154.506 Y153.611
G1 X160.642 Y159.747 E.38601
G1 X160.146 Y159.803
G1 X154.45 Y154.106 E.35834
G1 X154.394 Y154.602
G1 X159.65 Y159.858 E.33067
G1 X159.036 Y159.795
G1 X154.432 Y155.191 E.28962
G1 X154.519 Y155.83
G1 X158.404 Y159.715 E.24438
G1 X157.644 Y159.507
G1 X154.72 Y156.583 E.18395
; WIPE_START
M204 S6000
G1 X156.134 Y157.997 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.839 Y152.052 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120856
G1 F12000
M204 S6000
G2 X159.662 Y152.127 I.328 J1.019 E.00134
; WIPE_START
G1 X159.839 Y152.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.519 Y157.197 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.267412
G1 F12000
M204 S6000
G1 X158.16 Y156.838 E.012
; WIPE_START
G1 X158.519 Y157.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.665 Y155.638 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.127681
G1 F12000
M204 S6000
G1 X161.647 Y155.562 E.00061
G1 X161.517 Y155.404 E.00157
; WIPE_START
G1 X161.647 Y155.562 E-.54867
G1 X161.665 Y155.638 E-.21133
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.836 Y159.666 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.116812
G1 F12000
M204 S6000
G1 X160.663 Y159.749 E.00124
; WIPE_START
G1 X160.836 Y159.666 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.028 Y159.196 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.120953
G1 F12000
M204 S6000
G1 X156.922 Y159.111 E.00094
; LINE_WIDTH: 0.149116
G1 X156.816 Y159.027 E.00138
; LINE_WIDTH: 0.185285
G1 X156.592 Y158.835 E.00421
; LINE_WIDTH: 0.229503
G1 X156.369 Y158.643 E.0057
; LINE_WIDTH: 0.266008
G1 X156.171 Y158.465 E.00624
; LINE_WIDTH: 0.294818
G1 F10954.843
G1 X155.974 Y158.288 E.00711
; LINE_WIDTH: 0.287618
G1 F11301.493
G1 X155.73 Y158.014 E.00952
; LINE_WIDTH: 0.24443
G1 F12000
G1 X155.487 Y157.74 E.00771
; LINE_WIDTH: 0.201242
G1 X155.243 Y157.466 E.0059
; LINE_WIDTH: 0.161448
G1 X155.129 Y157.324 E.0021
; LINE_WIDTH: 0.125063
G1 X155.015 Y157.183 E.00135
M204 S10000
G1 X154.774 Y156.529 F42000
; LINE_WIDTH: 0.11588
G1 F12000
M204 S6000
G1 X154.6 Y156.21 E.00231
; WIPE_START
G1 X154.774 Y156.529 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.023 Y152.198 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.115699
G1 F12000
M204 S6000
G1 X154.938 Y152.304 E.00086
; WIPE_START
G1 X155.023 Y152.198 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.46 Y150.595 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.317477
G1 F9990.447
M204 S6000
G1 X162.294 Y150.463 E.00623
; LINE_WIDTH: 0.280028
G1 F11691.501
G1 X162.128 Y150.331 E.00532
; LINE_WIDTH: 0.24258
G1 F12000
G1 X161.962 Y150.198 E.00442
; LINE_WIDTH: 0.204365
G1 X161.855 Y150.122 E.00216
; LINE_WIDTH: 0.165369
G1 X161.749 Y150.045 E.00157
; LINE_WIDTH: 0.126372
G1 X161.643 Y149.968 E.00099
; WIPE_START
G1 X161.749 Y150.045 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.337 Y153.9 Z1.16 F42000
G1 X172.245 Y156.187 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X172.463 Y155.394 I-1.224 J-.762 E.03424
G1 X172.463 Y149.557 E.23965
G1 X176.053 Y149.557 E.1474
G1 X176.053 Y154.982 E.22274
G3 X175.855 Y156.776 I-8.57 J-.041 E.07424
G3 X175.285 Y158.03 I-5.095 J-1.557 E.0567
G1 X175.016 Y158.467 E.02108
G3 X173.596 Y159.599 I-4.976 J-4.78 E.07478
G3 X172.132 Y159.989 I-1.778 J-3.74 E.06258
G1 X171.503 Y160.051 E.02596
G3 X169.901 Y159.775 I.377 J-6.966 E.06689
G3 X168.647 Y159.005 I1.507 J-3.862 E.06076
G1 X168.267 Y158.684 E.02041
G3 X167.334 Y157.301 I5.79 J-4.908 E.06864
G3 X166.984 Y155.79 I4.244 J-1.779 E.06398
G1 X166.941 Y155.3 E.02022
G1 X166.941 Y149.557 E.23578
G1 X170.531 Y149.557 E.1474
G1 X170.531 Y155.393 E.23961
G2 X170.753 Y156.195 I1.403 J.043 E.03469
G2 X171.184 Y156.445 I.66 J-.641 E.02072
G1 X171.49 Y156.522 E.01295
M73 P84 R2
G2 X172.2 Y156.226 I-.136 J-1.325 E.03203
; WIPE_START
M204 S6000
G1 X172.305 Y156.102 E-.06157
G1 X172.391 Y155.896 E-.08487
G1 X172.437 Y155.668 E-.08865
G1 X172.463 Y155.394 E-.10455
G1 X172.463 Y154.288 E-.42036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.854 Y150.146 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X175.465 Y149.757 E.02446
G1 X174.914 Y149.757
G1 X175.854 Y150.697 E.05915
G1 X175.854 Y151.248
G1 X174.362 Y149.757 E.09384
G1 X173.811 Y149.757
G1 X175.854 Y151.8 E.12852
G1 X175.854 Y152.351
G1 X173.259 Y149.757 E.16321
G1 X172.708 Y149.757
G1 X175.854 Y152.903 E.1979
G1 X175.854 Y153.454
G1 X172.663 Y150.263 E.20075
G1 X172.663 Y150.814
G1 X175.854 Y154.005 E.20075
G1 X175.854 Y154.557
G1 X172.663 Y151.366 E.20075
G1 X172.663 Y151.917
G1 X175.848 Y155.103 E.20039
G1 X175.82 Y155.626
G1 X172.663 Y152.469 E.19863
G1 X172.663 Y153.02
G1 X175.774 Y156.131 E.19571
G1 X175.69 Y156.599
G1 X172.663 Y153.571 E.19046
G1 X172.663 Y154.123
G1 X175.562 Y157.022 E.1824
G1 X175.395 Y157.407
G1 X172.663 Y154.674 E.17189
G1 X172.663 Y155.226
G1 X175.204 Y157.767 E.15987
G1 X174.997 Y158.111
G1 X172.626 Y155.74 E.14916
G1 X172.496 Y156.162
G1 X174.763 Y158.429 E.14262
G1 X174.477 Y158.694
G1 X172.241 Y156.459 E.14063
G1 X171.864 Y156.633
G1 X174.182 Y158.95 E.1458
G1 X173.871 Y159.191
G1 X171.38 Y156.7 E.1567
; WIPE_START
M204 S6000
G1 X172.794 Y158.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.543 Y150.821 Z1.16 F42000
G1 X170.332 Y150.138 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X169.951 Y149.757 E.02398
G1 X169.399 Y149.757
G1 X170.332 Y150.689 E.05866
G1 X170.332 Y151.241
G1 X168.848 Y149.757 E.09335
G1 X168.297 Y149.757
G1 X170.332 Y151.792 E.12804
G1 X170.332 Y152.343
G1 X167.745 Y149.757 E.16273
G1 X167.194 Y149.757
G1 X170.332 Y152.895 E.19742
G1 X170.332 Y153.446
G1 X167.141 Y150.255 E.20075
G1 X167.141 Y150.807
G1 X170.332 Y153.998 E.20075
G1 X170.332 Y154.549
G1 X167.141 Y151.358 E.20075
G1 X167.141 Y151.909
G1 X170.332 Y155.101 E.20075
G1 X170.363 Y155.683
G1 X167.141 Y152.461 E.20269
G1 X167.141 Y153.012
G1 X173.527 Y159.399 E.40174
G1 X173.142 Y159.565
G1 X167.141 Y153.564 E.3775
G1 X167.141 Y154.115
G1 X172.714 Y159.688 E.35056
G1 X172.243 Y159.769
G1 X167.141 Y154.667 E.32098
G1 X167.141 Y155.218
G1 X171.747 Y159.824 E.28973
G1 X171.188 Y159.816
G1 X167.193 Y155.821 E.25131
G1 X167.283 Y156.463
G1 X170.544 Y159.724 E.20511
G1 X169.771 Y159.503
G1 X167.555 Y157.286 E.13944
; WIPE_START
M204 S6000
G1 X168.969 Y158.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.938 Y158.976 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122357
G1 F12000
M204 S6000
G1 X168.688 Y158.749 E.0024
; LINE_WIDTH: 0.144484
G3 X168.143 Y158.181 I2.084 J-2.543 E.0076
; WIPE_START
G1 X168.438 Y158.522 E-.43437
G1 X168.688 Y158.749 E-.32563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.307 Y156.773 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.134118
G1 F12000
M204 S6000
G3 X171.023 Y156.592 I2.109 J-3.616 E.00284
; WIPE_START
G1 X171.307 Y156.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X167.6 Y157.241 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.11463
G1 F12000
M204 S6000
G1 X167.38 Y156.86 E.00274
; OBJECT_ID: 701
; WIPE_START
G1 X167.6 Y157.241 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1070
M625
; start printing object, unique label id: 701
M624 AQAAAAAAAAA=
M204 S10000
G1 X160.51 Y154.414 Z1.16 F42000
G1 X117.233 Y137.16 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X118.68 Y137.16 E.05943
G1 X118.68 Y140.664 E.14388
G1 X117.233 Y140.664 E.05943
G1 X117.233 Y142.691 E.08324
G2 X117.415 Y143.7 I2.418 J.082 E.04241
G2 X118.117 Y144.2 I.95 J-.591 E.0363
G1 X118.439 Y144.296 E.01381
G2 X119.279 Y143.994 I-.138 J-1.706 E.03705
G2 X119.592 Y143.562 I-1.118 J-1.141 E.02203
G1 X122.767 Y145.879 E.16134
G3 X121.129 Y147.301 I-5.577 J-4.768 E.0894
G3 X119.318 Y147.834 I-2.389 J-4.772 E.07792
G1 X118.65 Y147.922 E.02764
G3 X116.708 Y147.586 I.257 J-7.282 E.08117
G3 X115.113 Y146.557 I2.169 J-5.114 E.07832
G1 X114.825 Y146.311 E.01556
G3 X113.705 Y144.54 I6.164 J-5.14 E.0863
G3 X113.348 Y142.83 I5.515 J-2.042 E.07195
G1 X113.3 Y142.206 E.02571
G1 X113.3 Y133.343 E.36392
G1 X117.233 Y133.343 E.16149
G1 X117.233 Y137.1 E.15426
; WIPE_START
M204 S6000
G1 X118.68 Y137.16 E-.55053
G1 X118.68 Y137.711 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.033 Y134.112 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X116.464 Y133.542 E.03584
G1 X115.912 Y133.542
G1 X117.033 Y134.663 E.07052
G1 X117.033 Y135.215
G1 X115.361 Y133.542 E.10521
G1 X114.809 Y133.542
G1 X117.033 Y135.766 E.1399
G1 X117.033 Y136.318
G1 X114.258 Y133.542 E.17459
G1 X113.706 Y133.542
G1 X117.033 Y136.869 E.20928
G1 X118.075 Y137.359
G1 X118.481 Y137.765 E.02553
G1 X118.481 Y138.316
G1 X117.523 Y137.359 E.06022
; WIPE_START
M204 S6000
G1 X118.481 Y138.316 E-.51442
G1 X118.481 Y137.765 E-.20954
G1 X118.414 Y137.698 E-.03604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.481 Y138.868 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X113.499 Y133.886 E.31338
G1 X113.499 Y134.438
G1 X118.481 Y139.419 E.31338
G1 X118.481 Y139.971
G1 X113.499 Y134.989 E.31338
G1 X113.499 Y135.54
G1 X118.423 Y140.465 E.30976
G1 X117.872 Y140.465
G1 X113.499 Y136.092 E.27508
G1 X113.499 Y136.643
G1 X117.32 Y140.465 E.24039
G1 X117.033 Y140.729
G1 X113.499 Y137.195 E.22232
G1 X113.499 Y137.746
G1 X117.033 Y141.28 E.22232
G1 X117.033 Y141.832
G1 X113.499 Y138.298 E.22232
G1 X113.499 Y138.849
G1 X117.033 Y142.383 E.22232
G1 X117.046 Y142.947
G1 X113.499 Y139.4 E.22312
G1 X113.499 Y139.952
G1 X117.163 Y143.616 E.23052
; WIPE_START
M204 S6000
G1 X115.749 Y142.202 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.632 Y143.879 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X122.063 Y146.311 E.15296
G1 X121.781 Y146.58
G1 X119.374 Y144.173 E.15142
G1 X119.016 Y144.366
G1 X121.477 Y146.827 E.15477
G1 X121.146 Y147.047
G1 X118.571 Y144.472 E.16199
G1 X117.858 Y144.311
G1 X120.788 Y147.241 E.18433
G1 X120.392 Y147.396
G1 X113.499 Y140.503 E.43362
G1 X113.499 Y141.055
G1 X119.95 Y147.506 E.40584
G1 X119.494 Y147.601
G1 X113.499 Y141.606 E.37715
G1 X113.499 Y142.157
G1 X119.011 Y147.669 E.34674
G1 X118.496 Y147.706
G1 X113.542 Y142.752 E.31161
G1 X113.614 Y143.375
G1 X117.882 Y147.644 E.26853
G1 X117.204 Y147.517
G1 X113.757 Y144.07 E.21682
M73 P85 R2
G1 X114.188 Y145.052
G1 X116.321 Y147.185 E.13421
; WIPE_START
M204 S6000
G1 X114.907 Y145.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.794 Y144.376 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.230198
G1 F12000
M204 S6000
G1 X117.702 Y144.314 E.00214
; LINE_WIDTH: 0.208938
G1 X117.583 Y144.217 E.0026
; LINE_WIDTH: 0.170155
G3 X117.279 Y143.928 I1.903 J-2.306 E.00528
; LINE_WIDTH: 0.187505
G1 X117.213 Y143.841 E.00158
; LINE_WIDTH: 0.216841
G1 X117.148 Y143.754 E.00194
G1 X117.152 Y143.722 E.00057
; LINE_WIDTH: 0.187437
G1 X117.173 Y143.607 E.00171
M204 S10000
G1 X116.98 Y143.157 F42000
; LINE_WIDTH: 0.145407
G1 F12000
M204 S6000
G1 X117.06 Y142.933 E.00232
; WIPE_START
G1 X116.98 Y143.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.408 Y135.971 Z1.16 F42000
G1 X113.532 Y133.523 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.168898
G1 F12000
M204 S6000
G1 X113.532 Y133.717 E.00241
G1 X113.572 Y133.814 E.0013
; WIPE_START
G1 X113.532 Y133.717 E-.26588
G1 X113.532 Y133.523 E-.49412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.475 Y141.097 Z1.16 F42000
G1 X115.122 Y146.293 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.114816
G1 F12000
M204 S6000
G3 X114.896 Y146.067 I.802 J-1.024 E.002
; WIPE_START
G1 X115.122 Y146.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.789 Y147.404 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.130189
G1 F12000
M204 S6000
G1 X116.679 Y147.329 E.00106
; LINE_WIDTH: 0.17682
G1 X116.569 Y147.254 E.00177
; LINE_WIDTH: 0.234924
G1 X116.459 Y147.179 E.00266
G1 X116.318 Y147.206 E.00286
; WIPE_START
G1 X116.459 Y147.179 E-.39402
G1 X116.569 Y147.254 E-.36598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.956 Y147.134 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.12318
G1 F12000
M204 S6000
G3 X120.83 Y147.226 I-.62 J-.715 E.00113
; WIPE_START
G1 X120.956 Y147.134 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.352 Y146.044 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.404324
G1 F7469.978
M204 S6000
G1 X122.105 Y145.832 E.01277
; LINE_WIDTH: 0.358562
G1 F8615.255
G1 X121.858 Y145.621 E.01107
; LINE_WIDTH: 0.312801
G1 F10175.306
G1 X121.611 Y145.41 E.00937
; LINE_WIDTH: 0.26704
G1 F12000
G1 X121.364 Y145.198 E.00768
; LINE_WIDTH: 0.221279
G1 X121.117 Y144.987 E.00598
; LINE_WIDTH: 0.175517
G1 X120.87 Y144.775 E.00428
; LINE_WIDTH: 0.129756
G1 X120.623 Y144.564 E.00258
; WIPE_START
G1 X120.87 Y144.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.366 Y139.479 Z1.16 F42000
G1 X129.191 Y136.757 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X130.211 Y139.297 I-.657 J1.739 E.12632
G3 X126.896 Y138.746 I-1.579 J-.748 E.18558
G3 X128.574 Y136.669 I1.763 J-.292 E.12382
G3 X129.133 Y136.742 I-.027 J2.377 E.02318
; WIPE_START
M204 S6000
G1 X129.426 Y136.859 E-.1199
G1 X129.547 Y136.935 E-.05431
G1 X129.877 Y137.2 E-.16073
G1 X130.136 Y137.548 E-.16512
G1 X130.262 Y137.79 E-.10366
G1 X130.339 Y138.056 E-.10518
G1 X130.355 Y138.19 E-.05111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.805 Y142.293 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X123.672 Y140.704 I5.922 J-5.421 E.08035
G3 X123.276 Y139.087 I4.597 J-1.983 E.06865
G1 X123.218 Y138.494 E.02448
G3 X123.515 Y136.706 I8.64 J.514 E.07454
G3 X124.446 Y135.138 I4.721 J1.742 E.0753
G1 X124.807 Y134.703 E.02321
G3 X126.295 Y133.643 I5.845 J6.627 E.07515
G3 X128.082 Y133.183 I2.156 J4.678 E.07619
G1 X128.68 Y133.133 E.02464
G3 X130.619 Y133.483 I-.279 J7.093 E.08115
G3 X132.032 Y134.35 I-2.029 J4.894 E.06834
G1 X132.46 Y134.698 E.02266
G3 X133.526 Y136.166 I-6.45 J5.8 E.07463
G3 X133.988 Y137.929 I-4.546 J2.134 E.07524
G1 X134.044 Y138.494 E.02329
G3 X133.75 Y140.273 I-8.707 J-.521 E.07417
G3 X132.815 Y141.856 I-4.8 J-1.768 E.07593
G1 X132.481 Y142.264 E.02164
G3 X131.025 Y143.322 I-5.81 J-6.463 E.07403
G3 X129.264 Y143.783 I-2.128 J-4.532 E.07515
G1 X128.732 Y143.837 E.02199
G3 X126.884 Y143.558 I.449 J-9.231 E.07683
G3 X125.255 Y142.646 I1.71 J-4.965 E.07709
G1 X124.853 Y142.33 E.02098
; WIPE_START
M204 S6000
G1 X124.091 Y141.402 E-.45632
G1 X123.834 Y141.009 E-.17844
G1 X123.68 Y140.718 E-.12524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.873 Y135.124 Z1.16 F42000
G1 X130.297 Y133.59 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X133.594 Y136.888 E.20744
G1 X133.737 Y137.582
G1 X129.595 Y133.44 E.26058
G1 X128.968 Y133.364
G1 X133.815 Y138.211 E.30492
G1 X133.811 Y138.759
G1 X128.409 Y133.356 E.33985
G1 X127.91 Y133.409
G1 X133.752 Y139.251 E.36751
G1 X133.68 Y139.73
G1 X127.431 Y133.482 E.39307
G1 X126.986 Y133.588
G1 X133.566 Y140.168 E.41394
G1 X133.416 Y140.57
G1 X130.324 Y137.477 E.19453
G1 X130.566 Y138.271
G1 X133.227 Y140.931 E.16736
G1 X133.01 Y141.267
G1 X130.553 Y138.809 E.15456
G1 X130.449 Y139.257
G1 X132.768 Y141.575 E.14585
G1 X132.525 Y141.884
G1 X130.25 Y139.609 E.14313
G1 X130.012 Y139.923
G1 X132.268 Y142.178 E.14189
G1 X131.961 Y142.423
G1 X129.705 Y140.166 E.14194
G1 X129.352 Y140.365
G1 X131.654 Y142.667 E.14482
G1 X131.335 Y142.9
G1 X128.903 Y140.468 E.15298
G1 X128.351 Y140.467
G1 X130.991 Y143.106 E.16603
G1 X130.618 Y143.285
G1 X127.278 Y139.945 E.21012
; WIPE_START
M204 S6000
G1 X128.692 Y141.359 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.56 Y136.714 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X126.581 Y133.734 E.18746
G1 X126.216 Y133.92
G1 X128.787 Y136.492 E.16176
G1 X128.256 Y136.512
G1 X125.876 Y134.132 E.14976
G1 X125.554 Y134.361
G1 X127.832 Y136.639 E.14329
G1 X127.496 Y136.855
G1 X125.248 Y134.606 E.14144
G1 X124.942 Y134.853
G1 X127.202 Y137.112 E.14215
G1 X126.966 Y137.428
G1 X124.692 Y135.154 E.14307
G1 X124.449 Y135.463
G1 X126.789 Y137.802 E.14716
G1 X126.697 Y138.262
G1 X124.214 Y135.779 E.15619
G1 X123.998 Y136.114
G1 X126.71 Y138.826 E.1706
G1 X127.211 Y139.878
G1 X123.813 Y136.481 E.21371
G1 X123.672 Y136.89
G1 X130.2 Y143.419 E.41067
G1 X129.742 Y143.512
G1 X123.566 Y137.336 E.38854
G1 X123.501 Y137.822
G1 X129.251 Y143.572 E.36172
G1 X128.759 Y143.632
G1 X123.441 Y138.314 E.33456
G1 X123.456 Y138.881
G1 X128.149 Y143.573 E.2952
G1 X127.523 Y143.499
G1 X123.538 Y139.514 E.25069
G1 X123.708 Y140.235
G1 X126.777 Y143.304 E.19308
; WIPE_START
M204 S6000
G1 X125.363 Y141.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.666 Y137.586 Z1.16 F42000
G1 X133.407 Y136.397 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124315
G1 F12000
M204 S6000
G1 X133.34 Y136.303 E.00084
; LINE_WIDTH: 0.159174
G1 X133.273 Y136.21 E.0013
; LINE_WIDTH: 0.194034
G1 X133.206 Y136.116 E.00176
; LINE_WIDTH: 0.234848
G1 X133.065 Y135.943 E.00444
; LINE_WIDTH: 0.281613
G1 F11607.86
G1 X132.925 Y135.769 E.00563
; LINE_WIDTH: 0.32567
G1 F9682.242
G1 X132.684 Y135.499 E.01097
; LINE_WIDTH: 0.367013
G1 F8378.041
G1 X132.443 Y135.229 E.01268
; LINE_WIDTH: 0.408356
G1 F7383.484
G1 X132.202 Y134.959 E.01439
; LINE_WIDTH: 0.40622
G1 F7429.046
G1 X131.927 Y134.716 E.01451
; LINE_WIDTH: 0.360646
G1 F8555.523
G1 X131.651 Y134.472 E.0126
; LINE_WIDTH: 0.315072
G1 F10084.678
G1 X131.376 Y134.229 E.01069
; LINE_WIDTH: 0.267396
G1 F12000
G1 X131.2 Y134.088 E.00534
; LINE_WIDTH: 0.217606
G1 X131.023 Y133.947 E.00406
; LINE_WIDTH: 0.171265
G1 X130.906 Y133.863 E.00183
; LINE_WIDTH: 0.128339
G1 X130.789 Y133.778 E.00112
; WIPE_START
G1 X130.906 Y133.863 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.389 Y137.413 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.238483
G1 F12000
M204 S6000
G1 X130.225 Y137.223 E.0051
; LINE_WIDTH: 0.215213
G2 X129.706 Y136.714 I-2.312 J1.836 E.01291
; LINE_WIDTH: 0.242205
G1 X129.549 Y136.726 E.00328
; WIPE_START
G1 X129.706 Y136.714 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.278 Y140.541 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.159185
G1 F12000
M204 S6000
G1 X128.033 Y140.407 E.00315
M204 S10000
G1 X127.221 Y139.868 F42000
; LINE_WIDTH: 0.150937
G1 F12000
M204 S6000
G1 X127.22 Y139.935 E.0007
G1 X127.106 Y140.049 E.00167
; WIPE_START
G1 X127.22 Y139.935 E-.53636
G1 X127.221 Y139.868 E-.22364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.223 Y143.056 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.130784
G1 F12000
M204 S6000
G1 X126.056 Y142.924 E.00172
; LINE_WIDTH: 0.178593
G1 X125.889 Y142.793 E.00288
; LINE_WIDTH: 0.226498
G1 X125.662 Y142.6 E.00566
; LINE_WIDTH: 0.274522
G1 F11991.71
G1 X125.435 Y142.406 E.00729
; LINE_WIDTH: 0.314372
G1 F10112.44
G1 X125.237 Y142.231 E.00766
; LINE_WIDTH: 0.346088
G1 F8991.03
G1 X125.04 Y142.056 E.00861
; LINE_WIDTH: 0.342061
G1 F9119.438
G1 X124.797 Y141.785 E.01171
; LINE_WIDTH: 0.302252
G1 F10618.565
G1 X124.554 Y141.514 E.01006
; LINE_WIDTH: 0.262443
G1 F12000
G1 X124.311 Y141.243 E.00841
; LINE_WIDTH: 0.219552
G1 X124.17 Y141.07 E.00406
; LINE_WIDTH: 0.173536
G1 X124.03 Y140.897 E.00289
; LINE_WIDTH: 0.128695
G1 X123.936 Y140.767 E.00125
; WIPE_START
G1 X124.03 Y140.897 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.385 Y143.328 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.111278
G1 F12000
M204 S6000
G1 X130.227 Y143.415 E.00105
; WIPE_START
G1 X130.385 Y143.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.155 Y142.995 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.119189
G1 F12000
M204 S6000
G3 X131.046 Y143.079 I-.771 J-.893 E.00093
; WIPE_START
G1 X131.155 Y142.995 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.658 Y137.778 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117804
G1 F12000
M204 S6000
G1 X133.757 Y137.581 E.00146
; WIPE_START
G1 X133.658 Y137.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y139.815 Z1.16 F42000
G1 X141.582 Y139.972 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X141.582 Y143.748 E.15502
G3 X138.697 Y143.485 I-.967 J-5.364 E.12041
G3 X137.349 Y142.527 I2.707 J-5.235 E.06812
G3 X136.413 Y140.907 I5.48 J-4.245 E.07707
G3 X136.163 Y139.405 I6.087 J-1.786 E.06268
G1 X136.137 Y138.97 E.01788
G1 X136.137 Y133.343 E.23105
G1 X139.727 Y133.343 E.1474
G1 X139.727 Y138.207 E.19973
G2 X139.89 Y139.347 I2.926 J.165 E.04759
G2 X140.703 Y139.986 I1.154 J-.631 E.04365
G1 X141.009 Y140.091 E.01326
G2 X141.525 Y139.992 I-.152 J-2.174 E.02167
; WIPE_START
M204 S6000
G1 X141.556 Y141.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P86 R2
G1 X139.679 Y134.593 Z1.16 F42000
G1 X139.528 Y133.999 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X139.072 Y133.542 E.02871
G1 X138.52 Y133.542
G1 X139.528 Y134.55 E.0634
G1 X139.528 Y135.102
G1 X137.969 Y133.542 E.09809
G1 X137.417 Y133.542
G1 X139.528 Y135.653 E.13278
G1 X139.528 Y136.204
G1 X136.866 Y133.542 E.16747
G1 X136.337 Y133.565
G1 X139.528 Y136.756 E.20075
G1 X139.528 Y137.307
G1 X136.337 Y134.116 E.20075
G1 X136.337 Y134.667
G1 X139.528 Y137.859 E.20075
G1 X139.536 Y138.418
G1 X136.337 Y135.219 E.20127
G1 X136.337 Y135.77
G1 X139.59 Y139.023 E.20462
; WIPE_START
M204 S6000
G1 X138.175 Y137.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.795 Y140.229 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.383 Y140.816 E.03697
G1 X141.383 Y141.368
G1 X136.337 Y136.322 E.31743
G1 X136.337 Y136.873
G1 X141.383 Y141.919 E.31743
G1 X141.383 Y142.471
G1 X136.337 Y137.425 E.31743
G1 X136.337 Y137.976
G1 X141.383 Y143.022 E.31743
G1 X141.382 Y143.573
G1 X136.337 Y138.527 E.31738
G1 X136.344 Y139.086
G1 X140.878 Y143.62 E.28522
G1 X140.324 Y143.617
G1 X136.39 Y139.683 E.24747
G1 X136.473 Y140.317
G1 X139.697 Y143.542 E.20286
G1 X138.986 Y143.382
G1 X136.714 Y141.11 E.14293
; WIPE_START
M204 S6000
G1 X138.128 Y142.524 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.367 Y143.069 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11591
G1 F12000
M204 S6000
G1 X138.288 Y143.005 E.00065
; LINE_WIDTH: 0.140379
G1 X138.123 Y142.863 E.00199
; LINE_WIDTH: 0.171271
G1 X137.959 Y142.72 E.00276
; LINE_WIDTH: 0.211334
G1 X137.549 Y142.346 E.00958
; LINE_WIDTH: 0.21444
G1 X137.395 Y142.16 E.00425
; LINE_WIDTH: 0.171418
G1 X137.241 Y141.974 E.00307
; LINE_WIDTH: 0.128396
G1 X137.086 Y141.789 E.00188
; WIPE_START
G1 X137.241 Y141.974 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.728 Y140.296 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.203017
G1 F12000
M204 S6000
G1 X140.61 Y140.219 E.0023
; LINE_WIDTH: 0.178111
G1 X140.496 Y140.141 E.00186
; LINE_WIDTH: 0.130625
G1 X140.381 Y140.063 E.00111
M204 S10000
G1 X139.685 Y139.375 F42000
; LINE_WIDTH: 0.20633
G1 F12000
M204 S6000
G1 X139.557 Y139.161 E.00416
G1 X139.602 Y139.011 E.00261
; WIPE_START
G1 X139.557 Y139.161 E-.29274
G1 X139.685 Y139.375 E-.46726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.778 Y141.046 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.229747
G1 F12000
M204 S6000
G1 X136.556 Y140.725 E.00756
; WIPE_START
G1 X136.778 Y141.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.118 Y138.954 Z1.16 F42000
G1 X144.812 Y138.757 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X143.722 Y137.931 I2.865 J-4.917 E.05627
G3 X143.375 Y137.488 I4.942 J-4.22 E.02313
G3 X143.042 Y135.981 I2.856 J-1.42 E.064
G1 X143.042 Y133.343 E.10831
G1 X146.632 Y133.343 E.1474
G1 X146.632 Y136.518 E.13038
G2 X146.851 Y137.342 I1.452 J.055 E.03551
G2 X147.599 Y137.683 I.911 J-1.009 E.03429
G2 X148.281 Y137.376 I-.333 J-1.651 E.03096
G2 X148.567 Y136.562 I-.825 J-.747 E.03636
G1 X148.575 Y133.343 E.1322
G1 X152.165 Y133.343 E.1474
G1 X152.165 Y136.132 E.11451
G3 X151.896 Y137.586 I-3.35 J.132 E.06123
G3 X151.233 Y138.376 I-2.449 J-1.383 E.04258
G1 X150.714 Y138.763 E.02657
G3 X151.626 Y139.537 I-2.305 J3.642 E.04927
G3 X151.89 Y139.942 I-3.354 J2.468 E.01984
G3 X152.165 Y141.477 I-3.584 J1.435 E.06451
G1 X152.165 Y143.613 E.08767
G1 X148.575 Y143.613 E.1474
G1 X148.575 Y141.112 E.10267
G2 X148.352 Y140.287 I-1.423 J-.058 E.03564
G2 X147.615 Y139.953 I-.898 J1 E.03373
G2 X146.687 Y140.702 I.036 J.994 E.05249
G2 X146.632 Y141.114 I1.871 J.46 E.01711
G1 X146.632 Y143.613 E.10259
G1 X143.042 Y143.613 E.1474
G1 X143.042 Y141.629 E.08145
G3 X143.376 Y140.088 I3.335 J-.085 E.06536
G3 X144.2 Y139.189 I2.928 J1.86 E.05033
G1 X144.763 Y138.791 E.02829
; WIPE_START
M204 S6000
G1 X144.116 Y138.287 E-.31153
G1 X143.971 Y138.173 E-.07036
G1 X143.722 Y137.931 E-.13172
G1 X143.375 Y137.488 E-.214
G1 X143.342 Y137.409 E-.03239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.191 Y134.04 Z1.16 F42000
G1 X151.203 Y133.542 Z1.16
G1 Z.76
M73 P86 R1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X151.965 Y134.305 E.04798
G1 X151.965 Y134.856
G1 X150.651 Y133.542 E.08266
G1 X150.1 Y133.542
G1 X151.965 Y135.408 E.11735
G1 X151.965 Y135.959
G1 X149.548 Y133.542 E.15204
G1 X148.997 Y133.542
G1 X151.948 Y136.493 E.18563
G1 X151.878 Y136.975
G1 X148.773 Y133.87 E.19532
G1 X148.772 Y134.42
G1 X151.75 Y137.398 E.18735
G1 X151.544 Y137.743
G1 X148.77 Y134.97 E.17447
G1 X148.769 Y135.52
G1 X151.294 Y138.045 E.15883
G1 X150.999 Y138.301
G1 X148.768 Y136.07 E.14036
G1 X148.761 Y136.615
G1 X150.683 Y138.537 E.12092
; WIPE_START
M204 S6000
G1 X149.269 Y137.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.751 Y140.157 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X148.682 Y137.087 E.19308
G1 X148.485 Y137.442
G1 X151.93 Y140.886 E.21669
G1 X151.96 Y141.468
G1 X148.177 Y137.685 E.23797
G1 X147.773 Y137.832
G1 X151.962 Y142.021 E.26352
G1 X151.963 Y142.574
G1 X147.157 Y137.767 E.30235
; WIPE_START
M204 S6000
G1 X148.571 Y139.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.433 Y134.287 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X145.689 Y133.542 E.04682
G1 X145.137 Y133.542
G1 X146.433 Y134.838 E.08151
G1 X146.433 Y135.389
G1 X144.586 Y133.542 E.1162
G1 X144.034 Y133.542
G1 X146.433 Y135.941 E.15089
G1 X146.433 Y136.492
G1 X143.483 Y133.542 E.18558
G1 X143.243 Y133.854
G1 X146.519 Y137.13 E.20605
; WIPE_START
M204 S6000
G1 X145.105 Y135.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.245 Y134.407 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X151.964 Y143.126 E.54849
G1 X151.7 Y143.413
G1 X148.608 Y140.321 E.1945
G1 X148.768 Y141.033
G1 X151.148 Y143.413 E.1497
G1 X150.597 Y143.413
G1 X148.774 Y141.591 E.11465
G1 X148.774 Y142.142
G1 X150.045 Y143.413 E.07996
G1 X149.494 Y143.413
G1 X148.774 Y142.693 E.04527
; WIPE_START
M204 S6000
G1 X149.494 Y143.413 E-.38676
G1 X150.045 Y143.413 E-.20954
G1 X149.741 Y143.109 E-.16371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.241 Y139.954 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X143.247 Y134.96 E.31415
G1 X143.249 Y135.514
G1 X147.504 Y139.769 E.26772
G1 X147.078 Y139.894
G1 X143.25 Y136.067 E.24078
G1 X143.302 Y136.67
G1 X146.772 Y140.14 E.2183
G1 X146.564 Y140.484
G1 X144.97 Y138.889 E.10031
G1 X144.647 Y139.117
G1 X146.456 Y140.927 E.11382
G1 X146.433 Y141.455
G1 X144.324 Y139.346 E.13267
G1 X144.029 Y139.603
G1 X146.433 Y142.006 E.15121
G1 X146.433 Y142.558
G1 X143.774 Y139.899 E.16724
G1 X143.539 Y140.215
G1 X146.433 Y143.109 E.18207
G1 X146.185 Y143.413
G1 X143.385 Y140.612 E.1762
G1 X143.287 Y141.067
G1 X145.634 Y143.413 E.14761
G1 X145.083 Y143.413
G1 X143.252 Y141.583 E.11514
G1 X143.249 Y142.131
G1 X144.531 Y143.413 E.08063
G1 X143.98 Y143.413
G1 X143.247 Y142.68 E.04612
; WIPE_START
M204 S6000
G1 X143.98 Y143.413 E-.39399
G1 X144.531 Y143.413 E-.20954
G1 X144.24 Y143.122 E-.15647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.9 Y138.574 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13162
G1 F12000
M204 S6000
G1 X144.695 Y138.404 E.00217
; LINE_WIDTH: 0.181106
G1 X144.489 Y138.235 E.00368
; LINE_WIDTH: 0.230592
G1 X144.284 Y138.066 E.00518
; LINE_WIDTH: 0.272965
G3 X143.854 Y137.647 I2.93 J-3.437 E.01459
; LINE_WIDTH: 0.257954
G1 X143.728 Y137.502 E.00433
; LINE_WIDTH: 0.23194
G1 X143.601 Y137.357 E.00376
; LINE_WIDTH: 0.200253
G1 X143.544 Y137.271 E.00166
; LINE_WIDTH: 0.1629
G1 X143.486 Y137.185 E.00122
; LINE_WIDTH: 0.125547
G1 X143.428 Y137.098 E.00078
; WIPE_START
G1 X143.486 Y137.185 E-.76
; WIPE_END
M73 P87 R1
G1 E-.04 F1800
M204 S10000
G1 X146.545 Y140.53 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.120354
G1 F12000
M204 S6000
G1 X146.483 Y140.621 E.00076
G1 X146.501 Y140.696 E.00052
; WIPE_START
G1 X146.483 Y140.621 E-.31013
G1 X146.545 Y140.53 E-.44987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.676 Y140.253 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.238814
G1 F12000
M204 S6000
G2 X148.308 Y139.887 I-1.831 J1.478 E.0106
; WIPE_START
G1 X148.473 Y140.031 E-.31987
G1 X148.676 Y140.253 E-.44013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.092 Y137.832 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.223344
G1 F12000
M204 S6000
G1 X146.987 Y137.758 E.00239
; LINE_WIDTH: 0.194075
G1 X146.874 Y137.676 E.00214
; LINE_WIDTH: 0.169004
G1 X146.765 Y137.582 E.00179
G3 X146.581 Y137.38 I7.106 J-6.653 E.0034
; LINE_WIDTH: 0.196664
G1 X146.518 Y137.287 E.00175
; LINE_WIDTH: 0.22206
G1 X146.455 Y137.194 E.00207
; WIPE_START
G1 X146.518 Y137.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.066 Y138.42 Z1.16 F42000
G1 X161.368 Y139.517 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X159.198 Y139.517 E.08911
G3 X159.153 Y138.039 I2.467 J-.815 E.06156
G1 X164.875 Y138.039 E.23493
G3 X164.843 Y139.194 I-4.702 J.45 E.04757
G3 X164.203 Y141.241 I-4.416 J-.258 E.08895
G3 X163.382 Y142.328 I-11.195 J-7.606 E.05593
G3 X161.923 Y143.359 I-5.654 J-6.447 E.07349
G3 X160.142 Y143.801 I-2.098 J-4.653 E.07575
G1 X159.623 Y143.848 E.02141
G3 X157.801 Y143.563 I.465 J-8.97 E.07586
G3 X156.2 Y142.647 I1.707 J-4.834 E.07614
G1 X155.756 Y142.289 E.02342
G3 X154.695 Y140.815 I6.454 J-5.764 E.07471
G3 X154.238 Y139.046 I4.587 J-2.128 E.07544
G1 X154.183 Y138.472 E.02368
G3 X154.467 Y136.673 I8.734 J.454 E.07489
G3 X155.379 Y135.106 I4.676 J1.674 E.07489
G1 X155.74 Y134.666 E.02336
G3 X157.233 Y133.624 I5.775 J6.682 E.0749
G3 X159.037 Y133.179 I2.136 J4.776 E.07671
G1 X159.627 Y133.132 E.0243
G3 X161.489 Y133.469 I-.341 J7.205 E.07791
G3 X162.829 Y134.218 I-3.066 J7.054 E.06314
G1 X160.839 Y136.609 E.12773
G2 X159.702 Y136.105 I-1.249 J1.283 E.05217
G2 X158.805 Y136.369 I.072 J1.898 E.03878
G2 X158.083 Y137.316 I1.298 J1.737 E.04949
G2 X157.853 Y138.942 I3.231 J1.288 E.06809
G2 X158.348 Y140.403 I2.884 J-.162 E.06414
G2 X159.081 Y140.996 I1.59 J-1.216 E.03908
G2 X159.746 Y141.129 I.99 J-3.229 E.02789
G2 X160.739 Y140.808 I-.153 J-2.171 E.04328
G2 X161.175 Y140.123 I-1.015 J-1.127 E.03377
G1 X161.35 Y139.574 E.02366
; WIPE_START
M204 S6000
G1 X159.351 Y139.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.17 Y138.238 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X164.685 Y138.753 E.03237
G1 X164.634 Y139.253
G1 X163.619 Y138.238 E.06385
G1 X163.067 Y138.238
G1 X164.565 Y139.736 E.09422
G1 X164.46 Y140.183
G1 X162.516 Y138.238 E.12232
G1 X161.964 Y138.238
G1 X164.32 Y140.594 E.1482
G1 X164.137 Y140.962
G1 X161.413 Y138.238 E.17136
G1 X160.862 Y138.238
G1 X163.923 Y141.3 E.19259
G1 X163.685 Y141.613
G1 X161.58 Y139.508 E.13238
G1 X161.447 Y139.927
G1 X163.444 Y141.923 E.12559
G1 X163.192 Y142.223
G1 X161.306 Y140.337 E.1186
G1 X161.114 Y140.696
G1 X162.881 Y142.464 E.11116
G1 X162.571 Y142.704
G1 X160.844 Y140.978 E.10859
G1 X160.483 Y141.168
G1 X162.249 Y142.935 E.11112
G1 X161.902 Y143.138
G1 X160.043 Y141.28 E.11692
G1 X159.509 Y141.298
G1 X161.525 Y143.314 E.12682
G1 X161.104 Y143.443
G1 X158.581 Y140.921 E.15868
; WIPE_START
M204 S6000
G1 X159.995 Y142.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.389 Y139.317 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X160.31 Y138.238 E.06787
G1 X159.759 Y138.238
G1 X160.838 Y139.317 E.06787
G1 X160.286 Y139.317
G1 X159.293 Y138.324 E.06247
G1 X159.277 Y138.86
G1 X159.735 Y139.317 E.02879
; WIPE_START
M204 S6000
G1 X159.277 Y138.86 E-.24591
G1 X159.293 Y138.324 E-.20357
G1 X159.871 Y138.902 E-.31052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.222 Y134.636 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X161.154 Y133.568 E.06719
G1 X160.465 Y133.43
G1 X161.971 Y134.937 E.09478
G1 X161.721 Y135.238
G1 X159.841 Y133.358 E.11826
G1 X159.291 Y133.359
G1 X161.471 Y135.539 E.13714
G1 X161.22 Y135.84
G1 X158.792 Y133.412 E.15275
G1 X158.314 Y133.485
G1 X160.97 Y136.141 E.16704
G1 X160.323 Y136.046
G1 X157.871 Y133.593 E.15428
G1 X157.469 Y133.743
G1 X159.639 Y135.913 E.13651
G1 X159.17 Y135.995
G1 X157.1 Y133.925 E.13023
G1 X156.76 Y134.137
G1 X158.777 Y136.154 E.12688
G1 X158.47 Y136.399
G1 X156.448 Y134.376 E.12725
G1 X156.135 Y134.615
G1 X158.203 Y136.683 E.13008
G1 X158.004 Y137.035
G1 X155.834 Y134.865 E.13648
G1 X155.586 Y135.168
G1 X157.834 Y137.416 E.14139
G1 X157.712 Y137.846
G1 X155.347 Y135.481 E.1488
G1 X155.118 Y135.803
G1 X157.658 Y138.343 E.15978
G1 X157.655 Y138.891
G1 X154.91 Y136.147 E.17264
G1 X154.736 Y136.524
G1 X157.747 Y139.535 E.18941
G1 X158.222 Y140.562
G1 X154.6 Y136.939 E.2279
G1 X154.506 Y137.397
G1 X160.642 Y143.533 E.38601
G1 X160.146 Y143.588
G1 X154.45 Y137.892 E.35834
G1 X154.394 Y138.387
G1 X159.65 Y143.644 E.33067
G1 X159.036 Y143.581
G1 X154.432 Y138.977 E.28962
G1 X154.519 Y139.616
G1 X158.404 Y143.501 E.24438
G1 X157.644 Y143.292
G1 X154.72 Y140.368 E.18395
; WIPE_START
M204 S6000
G1 X156.134 Y141.782 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.839 Y135.838 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120856
G1 F12000
M204 S6000
G2 X159.662 Y135.913 I.328 J1.019 E.00134
; WIPE_START
G1 X159.839 Y135.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.519 Y140.983 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.267412
G1 F12000
M204 S6000
G1 X158.16 Y140.624 E.012
; WIPE_START
G1 X158.519 Y140.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.665 Y139.423 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.127681
G1 F12000
M204 S6000
G1 X161.647 Y139.347 E.00061
G1 X161.517 Y139.19 E.00157
; WIPE_START
G1 X161.647 Y139.347 E-.54867
G1 X161.665 Y139.423 E-.21133
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.836 Y143.451 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.116812
G1 F12000
M204 S6000
G1 X160.663 Y143.535 E.00124
; WIPE_START
G1 X160.836 Y143.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.028 Y142.981 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.120953
G1 F12000
M204 S6000
G1 X156.922 Y142.897 E.00094
; LINE_WIDTH: 0.149116
G1 X156.816 Y142.813 E.00138
; LINE_WIDTH: 0.185285
G1 X156.592 Y142.62 E.00421
; LINE_WIDTH: 0.229503
G1 X156.369 Y142.428 E.0057
; LINE_WIDTH: 0.266008
G1 X156.171 Y142.251 E.00624
; LINE_WIDTH: 0.294818
G1 F10954.843
G1 X155.974 Y142.074 E.00711
; LINE_WIDTH: 0.287618
G1 F11301.493
G1 X155.73 Y141.8 E.00952
; LINE_WIDTH: 0.24443
G1 F12000
G1 X155.487 Y141.525 E.00771
; LINE_WIDTH: 0.201242
G1 X155.243 Y141.251 E.0059
; LINE_WIDTH: 0.161448
G1 X155.129 Y141.11 E.0021
; LINE_WIDTH: 0.125063
G1 X155.015 Y140.968 E.00135
M204 S10000
G1 X154.774 Y140.314 F42000
; LINE_WIDTH: 0.11588
G1 F12000
M204 S6000
G1 X154.6 Y139.996 E.00231
; WIPE_START
G1 X154.774 Y140.314 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.023 Y135.984 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.115699
G1 F12000
M204 S6000
G1 X154.938 Y136.09 E.00086
; WIPE_START
G1 X155.023 Y135.984 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.46 Y134.381 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.317477
G1 F9990.447
M204 S6000
G1 X162.294 Y134.248 E.00623
; LINE_WIDTH: 0.280028
G1 F11691.501
G1 X162.128 Y134.116 E.00532
; LINE_WIDTH: 0.24258
G1 F12000
G1 X161.962 Y133.984 E.00442
; LINE_WIDTH: 0.204365
G1 X161.855 Y133.907 E.00216
; LINE_WIDTH: 0.165369
G1 X161.749 Y133.83 E.00157
; LINE_WIDTH: 0.126372
G1 X161.643 Y133.753 E.00099
; WIPE_START
G1 X161.749 Y133.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.337 Y137.685 Z1.16 F42000
G1 X172.245 Y139.972 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X172.463 Y139.179 I-1.224 J-.762 E.03424
G1 X172.463 Y133.343 E.23965
G1 X176.053 Y133.343 E.1474
G1 X176.053 Y138.768 E.22274
G3 X175.855 Y140.561 I-8.57 J-.041 E.07424
G3 X175.285 Y141.815 I-5.095 J-1.557 E.0567
G1 X175.016 Y142.252 E.02108
G3 X173.596 Y143.385 I-4.976 J-4.78 E.07478
G3 X172.132 Y143.774 I-1.778 J-3.74 E.06258
G1 X171.503 Y143.837 E.02596
G3 X169.901 Y143.561 I.377 J-6.966 E.06689
G3 X168.647 Y142.791 I1.507 J-3.862 E.06076
G1 X168.267 Y142.47 E.02041
G3 X167.334 Y141.087 I5.79 J-4.908 E.06864
G3 X166.984 Y139.576 I4.244 J-1.779 E.06398
G1 X166.941 Y139.085 E.02022
G1 X166.941 Y133.343 E.23578
G1 X170.531 Y133.343 E.1474
G1 X170.531 Y139.178 E.23961
G2 X170.753 Y139.981 I1.403 J.043 E.03469
G2 X171.184 Y140.23 I.66 J-.641 E.02072
G1 X171.49 Y140.308 E.01295
G2 X172.2 Y140.012 I-.136 J-1.325 E.03203
; WIPE_START
M204 S6000
G1 X172.305 Y139.888 E-.06157
G1 X172.391 Y139.682 E-.08487
G1 X172.437 Y139.453 E-.08865
G1 X172.463 Y139.179 E-.10455
G1 X172.463 Y138.073 E-.42036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.854 Y133.931 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X175.465 Y133.542 E.02446
G1 X174.914 Y133.542
G1 X175.854 Y134.482 E.05915
G1 X175.854 Y135.034
G1 X174.362 Y133.542 E.09384
G1 X173.811 Y133.542
G1 X175.854 Y135.585 E.12852
G1 X175.854 Y136.137
G1 X173.259 Y133.542 E.16321
G1 X172.708 Y133.542
G1 X175.854 Y136.688 E.1979
G1 X175.854 Y137.24
G1 X172.663 Y134.048 E.20075
G1 X172.663 Y134.6
G1 X175.854 Y137.791 E.20075
G1 X175.854 Y138.342
G1 X172.663 Y135.151 E.20075
G1 X172.663 Y135.703
G1 X175.848 Y138.888 E.20039
G1 X175.82 Y139.412
G1 X172.663 Y136.254 E.19863
G1 X172.663 Y136.806
G1 X175.774 Y139.917 E.19571
G1 X175.69 Y140.385
G1 X172.663 Y137.357 E.19046
G1 X172.663 Y137.908
G1 X175.562 Y140.808 E.1824
G1 X175.395 Y141.192
G1 X172.663 Y138.46 E.17189
G1 X172.663 Y139.011
G1 X175.204 Y141.553 E.15987
G1 X174.997 Y141.897
G1 X172.626 Y139.526 E.14916
G1 X172.496 Y139.947
G1 X174.763 Y142.214 E.14262
G1 X174.477 Y142.48
G1 X172.241 Y140.244 E.14063
M73 P88 R1
G1 X171.864 Y140.418
G1 X174.182 Y142.736 E.1458
G1 X173.871 Y142.976
G1 X171.38 Y140.485 E.1567
; WIPE_START
M204 S6000
G1 X172.794 Y141.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.543 Y134.607 Z1.16 F42000
G1 X170.332 Y133.923 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X169.951 Y133.542 E.02398
G1 X169.399 Y133.542
G1 X170.332 Y134.475 E.05866
G1 X170.332 Y135.026
G1 X168.848 Y133.542 E.09335
G1 X168.297 Y133.542
G1 X170.332 Y135.578 E.12804
G1 X170.332 Y136.129
G1 X167.745 Y133.542 E.16273
G1 X167.194 Y133.542
G1 X170.332 Y136.68 E.19742
G1 X170.332 Y137.232
G1 X167.141 Y134.041 E.20075
G1 X167.141 Y134.592
G1 X170.332 Y137.783 E.20075
G1 X170.332 Y138.335
G1 X167.141 Y135.144 E.20075
G1 X167.141 Y135.695
G1 X170.332 Y138.886 E.20075
G1 X170.363 Y139.468
G1 X167.141 Y136.246 E.20269
G1 X167.141 Y136.798
G1 X173.527 Y143.184 E.40174
G1 X173.142 Y143.35
G1 X167.141 Y137.349 E.3775
G1 X167.141 Y137.901
G1 X172.714 Y143.473 E.35056
G1 X172.243 Y143.555
G1 X167.141 Y138.452 E.32098
G1 X167.141 Y139.003
G1 X171.747 Y143.609 E.28973
G1 X171.188 Y143.602
G1 X167.193 Y139.607 E.25131
G1 X167.283 Y140.249
G1 X170.544 Y143.509 E.20511
G1 X169.771 Y143.288
G1 X167.555 Y141.072 E.13944
; WIPE_START
M204 S6000
G1 X168.969 Y142.486 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.938 Y142.762 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122357
G1 F12000
M204 S6000
G1 X168.688 Y142.535 E.0024
; LINE_WIDTH: 0.144484
G3 X168.143 Y141.966 I2.084 J-2.543 E.0076
; WIPE_START
G1 X168.438 Y142.307 E-.43437
G1 X168.688 Y142.535 E-.32563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.307 Y140.559 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.134118
G1 F12000
M204 S6000
G3 X171.023 Y140.378 I2.109 J-3.616 E.00284
; WIPE_START
G1 X171.307 Y140.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X167.6 Y141.027 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.11463
G1 F12000
M204 S6000
G1 X167.38 Y140.645 E.00274
; OBJECT_ID: 783
; WIPE_START
G1 X167.6 Y141.027 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 701
M625
; start printing object, unique label id: 783
M624 AgAAAAAAAAA=
M204 S10000
G1 X163.863 Y134.371 Z1.16 F42000
G1 X156.642 Y121.511 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X156.178 Y121.708 I.137 J.969 E.02096
G2 X156.035 Y122.361 I.799 J.516 E.02805
G3 X155.976 Y122.865 I-.881 J.151 E.02112
G3 X155.545 Y123.129 I-.425 J-.21 E.02187
G3 X153.737 Y122.721 I1.072 J-8.96 E.07625
G3 X151.48 Y121.894 I3.897 J-14.12 E.0988
G1 X151.155 Y121.713 E.01528
G3 X151.229 Y120.742 I.308 J-.464 E.04861
G2 X151.909 Y120.14 I-.928 J-1.731 E.03762
G2 X152.033 Y119.293 I-2.517 J-.803 E.0353
G2 X151.895 Y115.914 I-34.95 J-.26 E.1389
G1 X151.825 Y115.479 E.01808
G2 X151.279 Y114.835 I-1.16 J.43 E.03537
G3 X151.023 Y114.528 I.3 J-.51 E.01678
G3 X151.014 Y114.442 I.407 J-.085 E.00355
G3 X151.711 Y113.63 I2.055 J1.06 E.04434
G3 X152.893 Y113.409 I.998 J2.061 E.04997
G1 X153.029 Y113.412 E.00556
G2 X154.728 Y113.476 I9.147 J-223.228 E.06984
G3 X156.083 Y113.715 I-1.045 J9.881 E.05652
G3 X156.631 Y114.054 I-.261 J1.033 E.0269
G3 X156.747 Y114.481 I-.822 J.454 E.01833
G3 X156.502 Y114.947 I-1.082 J-.273 E.02184
G2 X156.159 Y115.578 I4.403 J2.797 E.02948
G2 X156.075 Y116.326 I3.656 J.791 E.03096
G1 X156.076 Y118.758 E.09988
G2 X156.351 Y120.107 I3.688 J-.049 E.05685
G2 X157.459 Y120.639 I1.026 J-.719 E.05275
G2 X158.24 Y120.417 I.004 J-1.472 E.03375
G2 X158.737 Y119.591 I-.873 J-1.088 E.04043
G2 X158.947 Y117.861 I-4.914 J-1.474 E.07191
G2 X158.865 Y116.027 I-8.185 J-.555 E.07555
G2 X158.519 Y114.943 I-8.085 J1.984 E.04674
G3 X158.101 Y114.435 I1.925 J-2.011 E.02708
G3 X158.372 Y113.778 I.61 J-.133 E.03106
G1 X158.546 Y113.68 E.00819
G3 X160.121 Y113.454 I1.496 J4.828 E.06561
G3 X162.533 Y113.58 I.547 J12.683 E.09932
G3 X163.178 Y113.705 I-3.79 J21.233 E.02695
G3 X163.674 Y114.003 I-.304 J1.068 E.02407
G3 X163.768 Y114.665 I-.594 J.421 E.02851
G3 X163.23 Y115.296 I-42.152 J-35.375 E.03402
G2 X162.93 Y116.182 I1.052 J.85 E.03925
G1 X162.79 Y119.706 E.1448
G3 X162.493 Y121.507 I-6.469 J-.142 E.07518
G3 X161.211 Y122.79 I-2.288 J-1.004 E.07624
G3 X159.999 Y123.116 I-1.32 J-2.493 E.05196
G3 X159.052 Y123.073 I-.299 J-3.838 E.03903
G3 X157.666 Y122.36 I.235 J-2.162 E.06545
G2 X157.052 Y121.686 I-27.372 J24.297 E.03742
G2 X156.701 Y121.525 I-.636 J.921 E.01596
; WIPE_START
M204 S6000
G1 X156.341 Y121.596 E-.13953
G1 X156.178 Y121.708 E-.07507
G1 X156.082 Y121.869 E-.07135
G1 X156.052 Y121.977 E-.04236
G1 X156.024 Y122.207 E-.08827
G1 X156.035 Y122.361 E-.05859
G1 X156.033 Y122.703 E-.12985
G1 X155.976 Y122.865 E-.06527
G1 X155.895 Y122.976 E-.05238
G1 X155.817 Y123.037 E-.03734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.368 Y116.91 Z1.16 F42000
G1 X162.669 Y113.812 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X163.519 Y114.662 E.05348
G1 X163.255 Y114.95
G1 X162.013 Y113.707 E.07815
G1 X161.429 Y113.675
G1 X163.014 Y115.259 E.09968
G1 X162.823 Y115.62
G1 X160.857 Y113.654 E.12367
G1 X160.307 Y113.655
G1 X162.744 Y116.092 E.1533
G1 X162.721 Y116.621
G1 X159.769 Y113.669 E.18574
G1 X159.268 Y113.72
G1 X162.699 Y117.15 E.21581
G1 X162.677 Y117.679
G1 X158.819 Y113.822 E.24266
G1 X158.428 Y113.982
G1 X162.654 Y118.208 E.26585
G1 X162.632 Y118.737
G1 X158.367 Y114.472 E.2683
G1 X158.965 Y115.622
G1 X162.609 Y119.266 E.22927
G1 X162.584 Y119.792
G1 X159.108 Y116.317 E.21862
G1 X159.154 Y116.914
G1 X162.545 Y120.305 E.21332
G1 X162.476 Y120.787
G1 X159.153 Y117.464 E.20901
G1 X159.144 Y118.007
G1 X162.362 Y121.225 E.20243
G1 X162.207 Y121.621
G1 X159.126 Y118.54 E.19376
G1 X159.072 Y119.037
G1 X161.987 Y121.952 E.18338
G1 X161.712 Y122.229
G1 X158.97 Y119.487 E.17249
G1 X158.843 Y119.911
G1 X161.39 Y122.458 E.16023
G1 X161.03 Y122.65
G1 X158.65 Y120.269 E.14977
G1 X158.381 Y120.552
G1 X160.638 Y122.809 E.14196
G1 X160.172 Y122.894
G1 X158.021 Y120.744 E.13528
G1 X157.555 Y120.829
G1 X159.665 Y122.939 E.13274
G1 X159.031 Y122.856
G1 X156.945 Y120.771 E.13119
; WIPE_START
M204 S6000
G1 X158.36 Y122.185 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.433 Y114.8 Z1.16 F42000
G1 X156.413 Y114.724 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X155.48 Y113.791 E.05874
G1 X154.835 Y113.698
G1 X156.199 Y115.062 E.08581
G1 X156.013 Y115.427
G1 X154.24 Y113.654 E.11151
G1 X153.679 Y113.644
G1 X155.907 Y115.872 E.14015
G1 X155.876 Y116.392
G1 X153.099 Y113.616 E.17465
G1 X152.55 Y113.618
G1 X155.876 Y116.944 E.20921
G1 X155.876 Y117.496
G1 X152.072 Y113.692 E.2393
G1 X151.709 Y113.88
G1 X155.877 Y118.048 E.26217
G1 X155.877 Y118.599
G1 X151.443 Y114.165 E.27893
G1 X151.897 Y115.171
G1 X155.903 Y119.177 E.252
G1 X156.072 Y119.897
G1 X152.093 Y115.918 E.25033
G1 X152.146 Y116.523
G1 X157.118 Y121.495 E.31275
G1 X156.434 Y121.362
G1 X152.178 Y117.107 E.26773
G1 X152.205 Y117.684
G1 X156.069 Y121.548 E.24306
G1 X155.871 Y121.902
G1 X152.217 Y118.248 E.22981
G1 X152.226 Y118.808
G1 X155.836 Y122.418 E.22711
G1 X155.724 Y122.857
G1 X152.228 Y119.362 E.21987
G1 X152.179 Y119.865
G1 X155.198 Y122.883 E.18989
G1 X154.485 Y122.722
G1 X152.048 Y120.284 E.15336
G1 X151.792 Y120.58
G1 X153.718 Y122.506 E.12116
G1 X152.904 Y122.243
G1 X151.475 Y120.814 E.0899
G1 X151.162 Y121.053
G1 X152.037 Y121.928 E.05504
; WIPE_START
M204 S6000
M73 P89 R1
G1 X151.162 Y121.053 E-.47019
G1 X151.475 Y120.814 E-.14945
G1 X151.736 Y121.075 E-.14036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.646 Y122.79 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191636
G1 F12000
M204 S6000
G1 X158.487 Y122.674 E.00295
; LINE_WIDTH: 0.22557
G1 X158.328 Y122.559 E.00371
; LINE_WIDTH: 0.263588
G1 X158.132 Y122.392 E.00599
; LINE_WIDTH: 0.282094
G1 F11582.702
G3 X157.256 Y121.496 I9.616 J-10.282 E.03174
; LINE_WIDTH: 0.24333
G1 F12000
G1 X157.237 Y121.496 E.0004
; LINE_WIDTH: 0.215923
G1 X157.218 Y121.495 E.00034
; LINE_WIDTH: 0.184182
G1 X157.112 Y121.501 E.0015
; WIPE_START
G1 X157.218 Y121.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.173 Y121.682 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117499
G1 F12000
M204 S6000
G1 X162.117 Y121.758 E.00062
G1 X162.124 Y121.807 E.00033
; WIPE_START
G1 X162.117 Y121.758 E-.26138
G1 X162.173 Y121.682 E-.49862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.629 Y114.411 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.249688
G1 F12000
M204 S6000
G2 X163.33 Y114.07 I-.991 J.567 E.0099
; LINE_WIDTH: 0.215909
G1 X163.184 Y113.969 E.00316
; LINE_WIDTH: 0.167677
G1 X163.037 Y113.867 E.00218
; WIPE_START
G1 X163.184 Y113.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.202 Y118.465 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.136223
G1 F12000
M204 S6000
G1 X159.124 Y118.262 E.00189
; WIPE_START
G1 X159.202 Y118.465 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.951 Y120.765 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.207436
G1 F12000
M204 S6000
G1 X156.806 Y120.796 E.00248
; LINE_WIDTH: 0.196358
G1 X156.697 Y120.717 E.0021
; LINE_WIDTH: 0.153172
G1 X156.581 Y120.632 E.00153
; LINE_WIDTH: 0.123025
G1 X156.362 Y120.426 E.00216
G3 X155.985 Y119.984 I1.902 J-2.002 E.00418
; WIPE_START
G1 X156.167 Y120.222 E-.25797
G1 X156.362 Y120.426 E-.24283
G1 X156.581 Y120.632 E-.2592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.983 Y115.484 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110242
G1 F12000
M204 S6000
G2 X155.909 Y115.599 I.697 J.526 E.00078
; WIPE_START
G1 X155.983 Y115.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.557 Y114.501 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.30411
G1 F10537.717
M204 S6000
G2 X156.344 Y114.193 I-1.446 J.771 E.01046
G1 X156.295 Y114.149 E.00185
; LINE_WIDTH: 0.29592
G1 F10903.684
G1 X156.152 Y114.05 E.00467
; LINE_WIDTH: 0.253883
G1 F12000
G1 X156.009 Y113.951 E.00383
; LINE_WIDTH: 0.211847
G1 X155.867 Y113.853 E.003
; WIPE_START
G1 X156.009 Y113.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.453 Y114.73 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.197675
G1 F12000
M204 S6000
G1 X151.291 Y114.494 E.0045
G1 X151.206 Y114.502 E.00134
; WIPE_START
G1 X151.291 Y114.494 E-.1743
G1 X151.453 Y114.73 E-.5857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.304 Y119.162 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.125548
G1 F12000
M204 S6000
G1 X152.211 Y119.379 E.00176
; WIPE_START
G1 X152.304 Y119.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.447 Y121.642 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.119695
G1 F12000
M204 S6000
G1 X151.367 Y121.583 E.00067
; LINE_WIDTH: 0.155723
G3 X151.088 Y121.314 I.81 J-1.123 E.00425
; WIPE_START
G1 X151.222 Y121.461 E-.38815
G1 X151.367 Y121.583 E-.37185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.437 Y122.089 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.22225
G1 F12000
M204 S6000
G1 X152.102 Y121.864 E.00747
; WIPE_START
G1 X152.437 Y122.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.091 Y120.017 Z1.16 F42000
G1 X144.153 Y119.752 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X144.795 Y119.588 I.576 J.914 E.02762
G1 X145.82 Y119.588 E.04212
G1 X145.951 Y119.604 E.00542
G3 X146.594 Y120.073 I-.001 J.676 E.03492
G3 X146.294 Y121.412 I-1.363 J.398 E.05879
G3 X144.841 Y121.733 I-.974 J-.955 E.06466
G3 X143.963 Y120.57 I.638 J-1.395 E.06236
G3 X144.115 Y119.798 I.859 J-.231 E.03344
; WIPE_START
M204 S6000
G1 X144.411 Y119.632 E-.12881
G1 X144.631 Y119.592 E-.08514
G1 X144.795 Y119.588 E-.06207
G1 X145.82 Y119.588 E-.38979
G1 X145.951 Y119.604 E-.05019
G1 X146.065 Y119.626 E-.04398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.139 Y117.976 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G2 X144.326 Y118.105 I.369 J-.333 E.0094
G2 X144.525 Y118.136 I.269 J-1.061 E.0083
G1 X149.223 Y118.136 E.1929
G3 X149.762 Y118.455 I-.005 J.625 E.02693
G3 X149.972 Y119.704 I-1.63 J.916 E.05306
G3 X149.265 Y121.396 I-3.436 J-.443 E.0762
G3 X147.854 Y122.592 I-3.323 J-2.487 E.0766
G3 X145.995 Y123.157 I-2.044 J-3.385 E.08061
G3 X141.646 Y121.681 I-.644 J-5.247 E.19506
G3 X141.143 Y121.122 I8.735 J-8.375 E.0309
G3 X140.403 Y119.74 I5.325 J-3.74 E.06453
G3 X140.385 Y116.783 I4.883 J-1.508 E.12319
G3 X141.818 Y114.557 I4.815 J1.527 E.10998
G3 X143.431 Y113.647 I4.12 J5.42 E.07627
G3 X145.239 Y113.386 I1.896 J6.734 E.07522
G3 X147.188 Y113.7 I-.137 J7.046 E.08133
G3 X148.987 Y114.72 I-2.568 J6.626 E.08519
G3 X149.567 Y115.765 I-.992 J1.235 E.05035
G3 X149.112 Y116.497 I-.868 J-.032 E.03702
G3 X148.872 Y116.484 I-.103 J-.316 E.01009
G3 X148.175 Y116.075 I7.047 J-12.824 E.03318
G2 X146.443 Y115.644 I-1.964 J4.2 E.07374
G2 X144.225 Y116.911 I.096 J2.744 E.10907
G2 X144.012 Y117.661 I2.603 J1.147 E.03213
G2 X144.102 Y117.929 I.496 J-.018 E.01178
; WIPE_START
M204 S6000
G1 X144.191 Y118.039 E-.05379
G1 X144.326 Y118.105 E-.05709
G1 X144.525 Y118.136 E-.07671
G1 X146.031 Y118.136 E-.57242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.996 Y118.336 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X149.783 Y119.122 E.04945
G1 X149.771 Y119.662
G1 X148.445 Y118.336 E.08342
G1 X147.894 Y118.336
G1 X149.69 Y120.132 E.11299
G1 X149.536 Y120.53
G1 X147.342 Y118.336 E.13801
G1 X146.791 Y118.336
G1 X149.35 Y120.895 E.16101
G1 X149.127 Y121.224
G1 X146.239 Y118.336 E.18166
G1 X145.688 Y118.336
G1 X148.891 Y121.539 E.20148
G1 X148.615 Y121.814
G1 X146.76 Y119.96 E.11666
G1 X146.838 Y120.589
G1 X148.315 Y122.066 E.0929
G1 X147.98 Y122.282
G1 X146.743 Y121.046 E.07776
G1 X146.546 Y121.4
G1 X147.632 Y122.486 E.06833
G1 X147.256 Y122.661
G1 X146.28 Y121.685 E.06141
G1 X145.94 Y121.897
G1 X146.848 Y122.804 E.05709
G1 X146.397 Y122.905
G1 X145.492 Y122 E.05693
G1 X144.891 Y121.95
G1 X145.905 Y122.964 E.06379
; WIPE_START
M204 S6000
G1 X144.891 Y121.95 E-.54497
G1 X145.454 Y121.997 E-.21503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.279 Y119.478 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X145.136 Y118.336 E.07186
G1 X144.585 Y118.336
G1 X145.637 Y119.388 E.06621
; WIPE_START
M204 S6000
G1 X144.585 Y118.336 E-.56559
G1 X145.097 Y118.336 E-.19441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.441 Y114.023 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X149.339 Y115.922 E.11942
G1 X149.122 Y116.256
G1 X146.628 Y113.761 E.15692
G1 X145.974 Y113.659
G1 X148.171 Y115.856 E.13819
G1 X147.334 Y115.57
G1 X145.362 Y113.599 E.12405
G1 X144.825 Y113.613
G1 X146.68 Y115.468 E.11669
G1 X146.142 Y115.481
G1 X144.325 Y113.665 E.11427
G1 X143.859 Y113.75
G1 X145.679 Y115.57 E.11446
G1 X145.283 Y115.725
G1 X143.422 Y113.865 E.11706
G1 X143.038 Y114.032
G1 X144.938 Y115.931 E.11949
G1 X144.618 Y116.164
G1 X142.683 Y114.228 E.12174
G1 X142.343 Y114.44
G1 X144.335 Y116.431 E.12529
G1 X144.096 Y116.744
G1 X142.016 Y114.664 E.13087
G1 X141.729 Y114.928
G1 X143.925 Y117.125 E.13818
G1 X143.826 Y117.577
G1 X141.462 Y115.213 E.14869
G1 X141.229 Y115.531
G1 X145.086 Y119.388 E.24266
G1 X144.55 Y119.404
G1 X141.014 Y115.868 E.22246
G1 X140.824 Y116.229
G1 X144.135 Y119.54 E.20829
G1 X143.865 Y119.822
G1 X140.659 Y116.615 E.20171
G1 X140.52 Y117.028
G1 X143.741 Y120.249 E.20263
G1 X143.836 Y120.895
G1 X140.433 Y117.492 E.21405
G1 X140.382 Y117.993
G1 X145.387 Y122.998 E.31482
G1 X144.799 Y122.961
G1 X140.395 Y118.558 E.27704
G1 X140.475 Y119.189
G1 X144.129 Y122.843 E.22984
G1 X143.292 Y122.557
G1 X140.71 Y119.975 E.16244
; WIPE_START
M204 S6000
G1 X142.124 Y121.389 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.116 Y116.661 Z1.16 F42000
G1 X148.734 Y116.173 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.125903
G1 F12000
M204 S6000
G1 X148.595 Y116.063 E.00133
; LINE_WIDTH: 0.164564
G1 X148.452 Y115.949 E.00218
; LINE_WIDTH: 0.198566
G1 X148.343 Y115.871 E.00212
; LINE_WIDTH: 0.226674
G1 X148.235 Y115.793 E.00255
; WIPE_START
G1 X148.343 Y115.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.239 Y121.546 Z1.16 F42000
G1 X142.641 Y122.21 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.116235
G1 F12000
M204 S6000
G1 X142.572 Y122.159 E.00056
; LINE_WIDTH: 0.143619
G1 X142.424 Y122.036 E.00183
; LINE_WIDTH: 0.179707
G1 X142.276 Y121.914 E.00262
; LINE_WIDTH: 0.215021
G3 X141.341 Y120.975 I9.888 J-10.782 E.02343
; LINE_WIDTH: 0.17086
G1 X141.218 Y120.82 E.0025
; LINE_WIDTH: 0.12821
G1 X141.095 Y120.665 E.00154
; WIPE_START
G1 X141.218 Y120.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.901 Y121.939 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.211847
G1 F12000
M204 S6000
G1 X144.745 Y121.972 E.00276
; LINE_WIDTH: 0.191146
G1 X144.634 Y121.892 E.00204
; LINE_WIDTH: 0.146224
G1 X144.518 Y121.808 E.00141
; LINE_WIDTH: 0.115438
G1 X144.357 Y121.66 E.00138
M204 S10000
G1 X144.128 Y121.433 F42000
; LINE_WIDTH: 0.123015
G1 F12000
M204 S6000
G1 X144.031 Y121.312 E.00112
; LINE_WIDTH: 0.155995
G1 X143.929 Y121.184 E.00178
; LINE_WIDTH: 0.189261
G1 X143.85 Y121.072 E.00203
; LINE_WIDTH: 0.221063
G1 X143.771 Y120.959 E.00253
; WIPE_START
G1 X143.85 Y121.072 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.642 Y118.678 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.126722
G1 F12000
M204 S6000
G1 X149.57 Y118.572 E.00097
; LINE_WIDTH: 0.155762
G2 X149.339 Y118.342 I-1.447 J1.221 E.00357
; WIPE_START
G1 X149.57 Y118.572 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.751 Y119.969 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.172302
G1 F12000
M204 S6000
G1 X146.771 Y119.864 E.00136
; LINE_WIDTH: 0.1929
G1 X146.774 Y119.843 E.00032
; LINE_WIDTH: 0.207548
G1 X146.777 Y119.822 E.00036
G2 X146.348 Y119.409 I-1.568 J1.202 E.01005
M204 S10000
G1 X145.905 Y119.399 F42000
; LINE_WIDTH: 0.140577
G1 F12000
M204 S6000
G1 X145.714 Y119.312 E.00193
; WIPE_START
G1 X145.905 Y119.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.598 Y118.323 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.140503
G1 F12000
M204 S6000
G1 X144.378 Y118.404 E.00215
; WIPE_START
G1 X144.598 Y118.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.338 Y115.598 Z1.16 F42000
M73 P90 R1
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.208745
G1 F12000
M204 S6000
G1 X149.214 Y115.421 E.00366
; LINE_WIDTH: 0.253395
G1 X149.09 Y115.244 E.00476
; LINE_WIDTH: 0.281902
G1 F11592.752
G2 X148.597 Y114.763 I-3.912 J3.521 E.01745
; LINE_WIDTH: 0.235362
G1 F12000
G1 X148.443 Y114.642 E.00391
; LINE_WIDTH: 0.190523
G1 X148.29 Y114.521 E.00291
; LINE_WIDTH: 0.152799
G1 X148.194 Y114.448 E.00128
; LINE_WIDTH: 0.122184
G1 X148.097 Y114.375 E.00086
; WIPE_START
G1 X148.194 Y114.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.232 Y117.578 Z1.16 F42000
G1 X135.471 Y120.168 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X134.93 Y120.537 I.332 J1.068 E.02732
G2 X134.467 Y121.391 I1.395 J1.309 E.04034
G2 X134.682 Y121.921 I1.023 J-.108 E.02376
G3 X134.853 Y122.367 I-1.463 J.817 E.01969
G3 X134.61 Y122.809 I-.693 J-.092 E.02122
G3 X134.194 Y122.965 I-1.019 J-2.096 E.01823
G3 X131.948 Y123.13 I-2.024 J-12.13 E.09261
G3 X128.862 Y122.841 I-.37 J-12.671 E.12758
G3 X128.22 Y122.547 I.273 J-1.441 E.0293
G3 X128.014 Y122.131 I.889 J-.699 E.01916
G3 X128.244 Y121.719 I.546 J.035 E.02004
G3 X128.866 Y121.521 I1.229 J2.788 E.02683
G2 X129.879 Y120.84 I-.751 J-2.211 E.05074
G2 X130.211 Y120.462 I-4.2 J-4.027 E.02065
G2 X131.317 Y119.079 I-23.76 J-20.118 E.07273
G2 X131.427 Y118.829 I-.696 J-.457 E.01127
G2 X131.318 Y118.528 I-.878 J.15 E.01321
G2 X129.125 Y115.096 I-42.683 J24.856 E.16727
G2 X128.17 Y114.633 I-1.131 J1.117 E.04444
G3 X127.824 Y114.431 I.11 J-.586 E.01676
G3 X127.922 Y113.803 I.551 J-.236 E.02751
G3 X128.418 Y113.578 I.669 J.811 E.02262
G3 X129.674 Y113.453 I1.027 J3.958 E.05203
G3 X130.437 Y113.435 I.541 J6.65 E.03137
G3 X131.428 Y114.047 I.008 J1.097 E.05045
G1 X131.5 Y114.162 E.00557
G3 X131.242 Y114.65 I-.887 J-.158 E.02303
G2 X131.052 Y115.112 I1.133 J.736 E.02064
G2 X131.561 Y116.299 I2.601 J-.414 E.05358
G2 X132.436 Y117.14 I1.589 J-.777 E.05089
G2 X133.127 Y116.656 I-.411 J-1.32 E.03519
G2 X133.612 Y115.849 I-2.824 J-2.247 E.03876
G2 X133.712 Y115.44 I-3.391 J-1.052 E.01732
G2 X133.316 Y114.813 I-.672 J-.013 E.03225
G3 X132.936 Y114.463 I.186 J-.583 E.0219
G3 X132.938 Y114.192 I.266 J-.133 E.01155
G3 X133.409 Y113.683 I.594 J.078 E.03036
G1 X133.637 Y113.609 E.00984
G3 X135.525 Y113.453 I1.86 J11.061 E.07789
G3 X137.97 Y113.531 I.536 J21.582 E.1005
G3 X138.996 Y113.701 I-2.124 J15.978 E.04269
G3 X139.522 Y113.995 I-.307 J1.168 E.025
G3 X139.662 Y114.559 I-.639 J.458 E.02443
G3 X139.482 Y114.839 I-.375 J-.043 E.01417
G2 X138.825 Y115.203 I20.708 J38.099 E.03084
G2 X138.236 Y115.786 I1.33 J1.933 E.03418
G2 X137.387 Y116.926 I11.455 J9.421 E.05838
G1 X136.524 Y118.235 E.06439
G2 X136.368 Y118.565 I.983 J.663 E.01506
G2 X136.471 Y118.819 I.858 J-.198 E.01127
G2 X138.357 Y121.446 I29.336 J-19.073 E.13284
G2 X139.128 Y121.94 I1.465 J-1.435 E.03794
G3 X139.545 Y122.193 I-1.474 J2.908 E.02003
G3 X139.599 Y122.549 I-.282 J.225 E.0155
G3 X139.243 Y122.978 I-.586 J-.124 E.02381
G3 X138.187 Y123.141 I-.993 J-2.942 E.04406
G3 X136.595 Y122.972 I-.281 J-4.955 E.06605
G3 X136.153 Y122.44 I.249 J-.655 E.02969
G3 X136.404 Y121.958 I1.23 J.334 E.02245
G2 X136.568 Y121.504 I-1.407 J-.763 E.0199
G2 X136.264 Y120.837 I-1.498 J.28 E.03039
G2 X135.717 Y120.28 I-1.586 J1.009 E.03227
G1 X135.526 Y120.193 E.00865
; WIPE_START
M204 S6000
G1 X135.176 Y120.31 E-.14024
G1 X135.011 Y120.444 E-.08071
G1 X134.93 Y120.537 E-.04702
G1 X134.698 Y120.839 E-.1447
G1 X134.58 Y121.035 E-.08684
G1 X134.467 Y121.391 E-.14205
G1 X134.504 Y121.612 E-.08489
G1 X134.548 Y121.688 E-.03355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.398 Y114.736 Z1.16 F42000
G1 X131.221 Y114.346 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X130.527 Y113.652 E.04365
G1 X129.967 Y113.644
G1 X130.997 Y114.674 E.06478
G1 X130.853 Y115.081
G1 X129.427 Y113.655 E.0897
G1 X128.915 Y113.694
G1 X131.065 Y115.844 E.13523
; WIPE_START
M204 S6000
G1 X129.651 Y114.43 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.28 Y114.65 Z1.16 F42000
G1 X139.303 Y114.708 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.4 Y113.805 E.05684
G1 X137.759 Y113.715
G1 X138.943 Y114.9 E.07451
G1 X138.609 Y115.117
G1 X137.163 Y113.671 E.09096
G1 X136.599 Y113.658
G1 X138.322 Y115.382 E.1084
G1 X138.067 Y115.678
G1 X136.045 Y113.656 E.12722
G1 X135.492 Y113.654
G1 X137.822 Y115.984 E.14657
G1 X137.584 Y116.298
G1 X134.956 Y113.67 E.16533
G1 X134.442 Y113.707
G1 X137.357 Y116.622 E.18334
G1 X137.133 Y116.949
G1 X133.95 Y113.766 E.20022
G1 X133.5 Y113.868
G1 X136.913 Y117.281 E.21471
G1 X136.694 Y117.614
G1 X133.181 Y114.101 E.22098
; WIPE_START
M204 S6000
G1 X134.596 Y115.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.904 Y115.375 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X136.475 Y117.946 E.16175
G1 X136.266 Y118.288
G1 X133.819 Y115.841 E.15393
G1 X133.654 Y116.227
G1 X136.262 Y118.836 E.16411
; WIPE_START
M204 S6000
G1 X134.848 Y117.422 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.436 Y120.561 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X133.43 Y116.555 E.25198
G1 X133.203 Y116.879
G1 X139.128 Y122.804 E.37273
G1 X138.685 Y122.913
G1 X136.142 Y120.369 E.16002
G1 X136.764 Y121.543
G1 X138.159 Y122.939 E.08781
G1 X137.603 Y122.933
G1 X136.626 Y121.957 E.06141
G1 X136.419 Y122.301
G1 X136.965 Y122.847 E.03437
; WIPE_START
M204 S6000
G1 X136.419 Y122.301 E-.2936
G1 X136.626 Y121.957 E-.15262
G1 X137.21 Y122.541 E-.31377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.044 Y120.271 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.91 Y117.138 E.19711
G1 X132.535 Y117.314
G1 X135.266 Y120.045 E.17178
G1 X134.926 Y120.257
G1 X128.45 Y113.781 E.40738
G1 X128.679 Y114.561
G1 X128.065 Y113.947 E.03858
; WIPE_START
M204 S6000
G1 X128.679 Y114.561 E-.32962
G1 X128.45 Y113.781 E-.30886
G1 X128.676 Y114.007 E-.12152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.697 Y115.579 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X134.671 Y120.553 E.31289
G1 X134.443 Y120.877
G1 X130.713 Y117.146 E.23465
; WIPE_START
M204 S6000
G1 X132.127 Y118.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.539 Y118.524 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X134.293 Y121.278 E.17327
G1 X134.514 Y122.05
G1 X131.537 Y119.074 E.18725
G1 X131.314 Y119.402
G1 X134.527 Y122.614 E.20211
G1 X134.133 Y122.772
G1 X131.069 Y119.708 E.19274
G1 X130.824 Y120.015
G1 X133.653 Y122.844 E.17796
G1 X133.146 Y122.888
G1 X130.579 Y120.321 E.16144
G1 X130.333 Y120.626
G1 X132.627 Y122.92 E.14433
G1 X132.079 Y122.923
G1 X130.075 Y120.92 E.12605
G1 X129.797 Y121.193
G1 X131.53 Y122.926 E.10901
G1 X130.965 Y122.912
G1 X129.494 Y121.442 E.09248
G1 X129.136 Y121.635
G1 X130.38 Y122.879 E.07826
G1 X129.747 Y122.797
G1 X128.716 Y121.767 E.0648
G1 X128.314 Y121.916
G1 X129.075 Y122.677 E.04784
; WIPE_START
M204 S6000
G1 X128.314 Y121.916 E-.4087
G1 X128.716 Y121.767 E-.16298
G1 X129.067 Y122.117 E-.18832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.685 Y121.652 Z1.16 F42000
G1 X138.19 Y121.56 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126015
G1 F12000
M204 S6000
G1 X137.986 Y121.325 E.00234
; LINE_WIDTH: 0.164277
G1 X137.782 Y121.091 E.00369
; LINE_WIDTH: 0.202539
G1 X137.578 Y120.857 E.00505
; LINE_WIDTH: 0.240801
G1 X137.373 Y120.623 E.0064
; WIPE_START
G1 X137.578 Y120.857 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.345 Y122.678 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.376798
G1 F8119.194
M204 S6000
G1 X139.266 Y122.428 E.0095
G1 X139.11 Y122.302 E.00724
; LINE_WIDTH: 0.334595
G1 F9367.473
G1 X139 Y122.222 E.00426
; LINE_WIDTH: 0.292401
G1 F11068.83
G1 X138.89 Y122.141 E.00361
; LINE_WIDTH: 0.250208
G1 F12000
G1 X138.78 Y122.061 E.00295
; LINE_WIDTH: 0.208014
G1 X138.67 Y121.981 E.0023
; LINE_WIDTH: 0.164773
G1 X138.555 Y121.897 E.00171
; LINE_WIDTH: 0.123071
G1 X138.349 Y121.717 E.00196
; WIPE_START
G1 X138.555 Y121.897 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.94 Y122.418 Z1.16 F42000
G1 X128.66 Y122.574 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.165454
G1 F12000
M204 S6000
G1 X128.449 Y122.419 E.00314
; LINE_WIDTH: 0.178641
G3 X128.214 Y122.137 I.773 J-.886 E.00499
; WIPE_START
G1 X128.449 Y122.419 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.659 Y122.385 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.237268
G1 F12000
M204 S6000
G1 X134.508 Y122.188 E.00502
G1 X134.528 Y122.036 E.0031
; WIPE_START
G1 X134.508 Y122.188 E-.29009
G1 X134.659 Y122.385 E-.46991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.687 Y119.506 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.128752
G1 F12000
M204 S6000
G1 X136.541 Y119.329 E.0018
; LINE_WIDTH: 0.172515
G1 X136.396 Y119.151 E.00294
; LINE_WIDTH: 0.216395
G1 X136.251 Y118.974 E.00409
G1 X136.254 Y118.941 E.00059
; LINE_WIDTH: 0.186691
G1 X136.271 Y118.828 E.00165
; WIPE_START
G1 X136.254 Y118.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.426 Y114.206 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.198583
G1 F12000
M204 S6000
G1 X138.754 Y113.86 E.01194
M204 S10000
G1 X139.49 Y114.476 F42000
; LINE_WIDTH: 0.32981
G1 F9533.637
M204 S6000
G1 X139.255 Y114.185 E.0115
G1 X138.861 Y113.861 E.01569
; WIPE_START
G1 X139.255 Y114.185 E-.43852
G1 X139.49 Y114.476 E-.32148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.418 Y114.642 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121224
G1 F12000
M204 S6000
G1 X133.309 Y114.555 E.00097
; LINE_WIDTH: 0.155357
G3 X133.093 Y114.341 I.418 J-.636 E.00332
; WIPE_START
G1 X133.2 Y114.468 E-.41257
G1 X133.309 Y114.555 E-.34743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.972 Y115.306 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.187458
G1 F12000
M204 S6000
G2 X133.819 Y115.028 I-2.96 J1.445 E.00462
M204 S10000
G1 X133.915 Y115.662 F42000
; LINE_WIDTH: 0.114025
G1 F12000
M204 S6000
G3 X133.83 Y115.804 I-2.693 J-1.51 E.00102
; WIPE_START
G1 X133.915 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.484 Y117.338 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121245
G1 F12000
M204 S6000
G3 X132.403 Y117.383 I-.12 J-.123 E.00065
; LINE_WIDTH: 0.132481
G1 X132.217 Y117.243 E.00191
; WIPE_START
G1 X132.403 Y117.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.604 Y118.458 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220183
G1 F12000
M204 S6000
G1 X131.465 Y118.28 E.00414
; LINE_WIDTH: 0.174864
G1 X131.325 Y118.102 E.00297
; LINE_WIDTH: 0.129544
G1 X131.185 Y117.924 E.00179
M204 S10000
G1 X130.776 Y117.084 F42000
; LINE_WIDTH: 0.227245
G1 F12000
M204 S6000
G1 X130.613 Y116.881 E.00497
; LINE_WIDTH: 0.179101
G1 X130.45 Y116.677 E.00354
; LINE_WIDTH: 0.130957
G1 X130.287 Y116.474 E.0021
; WIPE_START
G1 X130.45 Y116.677 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.412 Y116.437 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.125987
G1 F12000
M204 S6000
G1 X131.289 Y116.286 E.00146
; LINE_WIDTH: 0.164584
G1 X131.164 Y116.131 E.00237
; LINE_WIDTH: 0.197009
G1 X131.108 Y116.056 E.00147
; LINE_WIDTH: 0.221178
G1 X131.051 Y115.982 E.00172
G1 X131.075 Y115.834 E.00276
; WIPE_START
G1 X131.051 Y115.982 E-.46744
G1 X131.108 Y116.056 E-.29256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.76 Y115.517 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.235332
G1 F12000
M204 S6000
G1 X129.604 Y115.33 E.00486
; LINE_WIDTH: 0.196387
G1 X129.449 Y115.143 E.00378
; LINE_WIDTH: 0.149496
G2 X129.113 Y114.78 I-2.597 J2.077 E.00505
; LINE_WIDTH: 0.171284
G1 X128.895 Y114.597 E.0036
; LINE_WIDTH: 0.202272
G2 X128.791 Y114.528 I-.666 J.88 E.00203
M204 S10000
G1 X128.261 Y114.463 F42000
; LINE_WIDTH: 0.186928
G1 F12000
M204 S6000
G1 X128.045 Y114.304 E.00388
G3 X127.964 Y114.166 I.391 J-.322 E.00232
; WIPE_START
G1 X128.045 Y114.304 E-.28318
G1 X128.261 Y114.463 E-.47682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.677 Y119.667 Z1.16 F42000
G1 X122.435 Y119.894 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X123.263 Y119.903 I.419 J-.424 E.03762
G3 X124.234 Y119.105 I4.098 J3.996 E.05169
G3 X125.558 Y119.02 I.785 J1.875 E.0555
G3 X127.086 Y121.592 I-.631 J2.115 E.13495
G3 X126.566 Y122.599 I-2.229 J-.513 E.04705
G3 X124.909 Y123.079 I-1.268 J-1.278 E.07386
G3 X123.547 Y122.281 I.169 J-1.851 E.06697
G2 X123.092 Y121.717 I-3.987 J2.745 E.02979
G2 X122.739 Y121.578 I-.539 J.853 E.01566
G2 X122.335 Y121.835 I.227 J.802 E.01996
G2 X122.202 Y122.513 I1.559 J.658 E.02857
G3 X122.065 Y123.056 I-2.751 J-.408 E.02305
G3 X121.599 Y123.14 I-.353 J-.626 E.01978
G3 X117.962 Y122.297 I.568 J-10.719 E.15408
G3 X117.319 Y121.915 I1.427 J-3.135 E.03076
G3 X117.052 Y121.377 I.437 J-.553 E.0255
G3 X117.507 Y120.807 I.681 J.077 E.0316
G2 X118.136 Y120.342 I-.366 J-1.154 E.03272
G2 X118.258 Y119.6 I-1.685 J-.656 E.03111
G2 X118.062 Y116.023 I-21.482 J-.616 E.14724
G2 X117.447 Y115.274 I-1.204 J.361 E.04083
G3 X117.005 Y114.757 I.556 J-.923 E.02843
G3 X116.986 Y114.366 I.529 J-.222 E.01642
G3 X117.482 Y113.814 I.686 J.119 E.0321
G1 X117.623 Y113.754 E.00631
G3 X120.289 Y113.453 I2.361 J8.97 E.11054
G1 X120.938 Y113.459 E.02663
G3 X123.028 Y113.649 I-.202 J13.77 E.08626
G3 X123.879 Y114.302 I-.172 J1.106 E.04594
G3 X123.369 Y115.232 I-.704 J.218 E.04858
G2 X122.735 Y115.469 I1.993 J6.285 E.02781
G2 X122.394 Y115.812 I.334 J.673 E.02022
G2 X122.294 Y116.117 I1.365 J.618 E.01321
G2 X122.21 Y119.147 I15.571 J1.945 E.12464
G1 X122.271 Y119.597 E.01864
G2 X122.394 Y119.85 I.582 J-.127 E.01165
; WIPE_START
M204 S6000
G1 X122.501 Y119.961 E-.05855
G1 X122.673 Y120.037 E-.07175
G1 X122.843 Y120.073 E-.06574
G1 X123.012 Y120.035 E-.0659
G1 X123.18 Y119.962 E-.06964
G1 X123.263 Y119.903 E-.03884
G1 X123.775 Y119.43 E-.26483
G1 X124.043 Y119.24 E-.12476
; WIPE_END
M73 P91 R1
G1 E-.04 F1800
M204 S10000
G1 X123.007 Y113.851 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X123.71 Y114.555 E.04426
G1 X123.531 Y114.927
G1 X122.367 Y113.763 E.07322
G1 X121.755 Y113.703
G1 X123.145 Y115.093 E.08745
G1 X122.743 Y115.242
G1 X121.172 Y113.671 E.09884
G1 X120.609 Y113.66
G1 X122.4 Y115.451 E.11265
G1 X122.189 Y115.791
G1 X120.061 Y113.663 E.13388
G1 X119.513 Y113.666
G1 X122.081 Y116.234 E.16157
G1 X122.028 Y116.733
G1 X118.996 Y113.7 E.19077
G1 X118.511 Y113.767
G1 X121.996 Y117.252 E.21921
G1 X121.985 Y117.793
G1 X118.054 Y113.862 E.24727
G1 X117.615 Y113.974
G1 X121.988 Y118.346 E.27505
G1 X121.991 Y118.901
G1 X117.272 Y114.183 E.29682
G1 X117.184 Y114.646
G1 X122.062 Y119.524 E.30688
; WIPE_START
M204 S6000
G1 X120.648 Y118.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.996 Y119.149 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X126.941 Y121.094 E.12235
G1 X126.879 Y121.584
G1 X124.517 Y119.222 E.14861
G1 X124.151 Y119.407
G1 X126.726 Y121.982 E.16199
G1 X126.524 Y122.331
G1 X123.837 Y119.644 E.16902
G1 X123.55 Y119.909
G1 X126.236 Y122.595 E.16894
G1 X125.892 Y122.802
G1 X123.242 Y120.153 E.16668
G1 X122.807 Y120.269
G1 X125.446 Y122.908 E.16599
G1 X124.848 Y122.861
G1 X118.308 Y116.321 E.41139
G1 X118.367 Y116.932
G1 X122.832 Y121.397 E.28087
G1 X122.398 Y121.514
G1 X118.411 Y117.527 E.25081
G1 X118.433 Y118.1
G1 X122.133 Y121.801 E.23278
G1 X122.028 Y122.247
G1 X118.455 Y118.674 E.22475
G1 X118.454 Y119.224
G1 X121.953 Y122.723 E.22013
G1 X121.611 Y122.932
G1 X118.452 Y119.773 E.19872
G1 X118.373 Y120.246
G1 X121.02 Y122.893 E.16652
G1 X120.379 Y122.804
G1 X118.184 Y120.608 E.13811
G1 X117.874 Y120.849
G1 X119.667 Y122.643 E.11284
G1 X118.901 Y122.428
G1 X117.508 Y121.035 E.08766
; WIPE_START
M204 S6000
G1 X118.901 Y122.428 E-.74886
G1 X118.929 Y122.436 E-.01114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.011 Y122.735 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113213
G1 F12000
M204 S6000
G1 X119.727 Y122.584 E.00195
; WIPE_START
G1 X120.011 Y122.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.431 Y122.748 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.127456
G1 F12000
M204 S6000
G1 X124.317 Y122.666 E.00108
; LINE_WIDTH: 0.168603
G1 X124.203 Y122.584 E.00174
; LINE_WIDTH: 0.206814
G3 X123.824 Y122.217 I2.517 J-2.984 E.00884
; LINE_WIDTH: 0.185595
G1 X123.606 Y121.968 E.00474
; LINE_WIDTH: 0.132341
G1 X123.385 Y121.717 E.00276
G2 X123.213 Y121.543 I-1.095 J.913 E.00202
; LINE_WIDTH: 0.139344
G1 X123.108 Y121.468 E.00117
; LINE_WIDTH: 0.183485
G1 X122.992 Y121.385 E.00201
; LINE_WIDTH: 0.214189
G1 X122.898 Y121.33 E.0019
; WIPE_START
G1 X122.992 Y121.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.905 Y120.692 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.319112
G1 F9927.397
M204 S6000
G1 X126.754 Y120.489 E.00748
; LINE_WIDTH: 0.354064
G1 F8747.098
G1 X126.602 Y120.286 E.00849
; LINE_WIDTH: 0.389015
G1 F7817.636
G1 X126.451 Y120.083 E.0095
; LINE_WIDTH: 0.413292
G1 F7280.303
G2 X125.823 Y119.483 I-2.76 J2.259 E.0351
; LINE_WIDTH: 0.352509
G1 F8793.588
G1 X125.61 Y119.329 E.00876
; LINE_WIDTH: 0.323356
G1 F9767.355
G1 X125.398 Y119.175 E.00788
; WIPE_START
G1 X125.61 Y119.329 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.734 Y120.342 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.16974
G1 F12000
M204 S6000
G1 X122.596 Y120.258 E.00202
; LINE_WIDTH: 0.151961
G1 X122.52 Y120.206 E.00098
; LINE_WIDTH: 0.121906
G1 X122.443 Y120.153 E.00066
M204 S10000
G1 X122.188 Y119.898 F42000
; LINE_WIDTH: 0.129602
G1 F12000
M204 S6000
G1 X122.11 Y119.785 E.00108
; LINE_WIDTH: 0.175038
G1 X122.033 Y119.673 E.00179
; LINE_WIDTH: 0.199228
G1 X122.072 Y119.514 E.0026
; WIPE_START
G1 X122.033 Y119.673 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.561 Y114 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117836
G1 F12000
M204 S6000
G1 X117.45 Y114.084 E.00092
; WIPE_START
G1 X117.561 Y114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.384 Y121.588 Z1.16 F42000
G1 X118.46 Y122.288 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.112132
G1 F12000
M204 S6000
G1 X118.421 Y122.264 E.00027
; LINE_WIDTH: 0.136753
G1 X118.337 Y122.208 E.00088
; LINE_WIDTH: 0.175478
G1 X118.253 Y122.152 E.00133
; LINE_WIDTH: 0.214203
G1 X118.17 Y122.095 E.00177
; LINE_WIDTH: 0.252929
G1 X118.086 Y122.039 E.00222
; LINE_WIDTH: 0.291881
G1 F11093.651
G1 X117.978 Y121.959 E.00355
; LINE_WIDTH: 0.331062
G1 F9489.587
G1 X117.87 Y121.879 E.00415
; LINE_WIDTH: 0.370243
G1 F8290.797
G1 X117.762 Y121.799 E.00475
; LINE_WIDTH: 0.409424
G1 F7360.915
G1 X117.655 Y121.719 E.00535
; LINE_WIDTH: 0.430057
G1 F6950.391
G3 X117.276 Y121.251 I.958 J-1.163 E.02559
; WIPE_START
G1 X117.47 Y121.539 E-.43638
G1 X117.655 Y121.719 E-.32362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.203 Y116.377 Z1.16 F42000
G1 X111.661 Y115.846 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X111.874 Y116.753 I-1.624 J.859 E.03867
G3 X111.252 Y120.083 I-10.798 J-.294 E.13968
G3 X110.762 Y120.972 I-2.375 J-.728 E.04195
G3 X109.985 Y121.322 I-.945 J-1.061 E.03555
G3 X109.103 Y120.917 I-.026 J-1.109 E.04125
G3 X108.791 Y119.918 I1.26 J-.941 E.04381
G3 X109.4 Y116.843 I11.995 J.778 E.12907
G3 X109.881 Y115.816 I3.052 J.802 E.04683
G3 X110.713 Y115.423 I.929 J.888 E.03864
G3 X110.921 Y115.445 I.081 J.232 E.00888
G3 X111.621 Y115.801 I-.153 J1.166 E.03288
; WIPE_START
M204 S6000
G1 X111.717 Y115.937 E-.06323
G1 X111.797 Y116.15 E-.08634
G1 X111.853 Y116.481 E-.12774
G1 X111.874 Y116.753 E-.10341
G1 X111.824 Y117.599 E-.32226
G1 X111.803 Y117.748 E-.05702
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.122 Y114.69 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X107.803 Y113.695 I4.613 J5.873 E.08045
G3 X109.249 Y113.424 I1.858 J5.925 E.06054
G1 X109.872 Y113.385 E.02564
G3 X112.074 Y113.726 I-.255 J8.918 E.09173
G3 X113.555 Y114.461 I-2.679 J7.266 E.06801
G1 X114.078 Y114.792 E.02541
G3 X115.31 Y116.069 I-5.007 J6.064 E.07303
G3 X115.863 Y117.522 I-3.096 J2.01 E.06429
G3 X115.986 Y118.324 I-14.613 J2.647 E.03333
G3 X113.868 Y122.295 I-4.942 J-.086 E.19182
G3 X112.397 Y122.992 I-3.898 J-6.324 E.06697
G3 X109.841 Y123.131 I-1.62 J-6.192 E.10582
G3 X106.928 Y122.02 I.504 J-5.697 E.12964
G1 X106.437 Y121.679 E.02455
G3 X105.244 Y120.185 I4.704 J-4.982 E.07877
G3 X104.789 Y118.373 I4.528 J-2.1 E.07717
G1 X104.749 Y117.975 E.01642
G3 X105.009 Y116.355 I7.277 J.335 E.06754
G3 X105.91 Y114.935 I4.098 J1.605 E.06946
G1 X106.082 Y114.736 E.01082
; WIPE_START
M204 S6000
G1 X107.054 Y114.057 E-.45032
G1 X107.454 Y113.841 E-.17275
G1 X107.786 Y113.702 E-.13694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.871 Y116.541 Z1.16 F42000
G1 X115.451 Y116.773 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X113.112 Y114.434 E.14714
G1 X112.063 Y113.936
G1 X115.65 Y117.523 E.22567
G1 X115.76 Y118.185
G1 X111.326 Y113.751 E.27893
G1 X110.691 Y113.667
G1 X115.751 Y118.727 E.3183
G1 X115.687 Y119.215
G1 X110.079 Y113.606 E.3528
G1 X109.528 Y113.607
G1 X111.276 Y115.355 E.10997
G1 X110.613 Y115.243
G1 X109.021 Y113.651 E.10014
G1 X108.535 Y113.717
G1 X110.178 Y115.36 E.10335
G1 X109.839 Y115.572
G1 X108.089 Y113.822 E.11013
G1 X107.678 Y113.962
G1 X109.596 Y115.88 E.12066
G1 X109.406 Y116.241
G1 X107.313 Y114.149 E.13163
G1 X106.966 Y114.353
G1 X109.258 Y116.645 E.1442
G1 X109.124 Y117.062
G1 X106.632 Y114.571 E.15673
G1 X106.311 Y114.801
G1 X108.999 Y117.489 E.16912
G1 X108.891 Y117.932
G1 X106.044 Y115.086 E.17906
G1 X105.797 Y115.39
G1 X108.79 Y118.383 E.18827
G1 X108.701 Y118.846
G1 X105.568 Y115.713 E.19709
G1 X105.357 Y116.053
G1 X108.643 Y119.339 E.20674
G1 X108.597 Y119.845
G1 X105.199 Y116.446 E.2138
G1 X105.083 Y116.882
G1 X108.664 Y120.462 E.22525
; WIPE_START
M204 S6000
G1 X107.249 Y119.048 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.969 Y116.048 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X115.576 Y119.655 E.22694
G1 X115.422 Y120.052
G1 X112.069 Y116.699 E.21093
G1 X112.046 Y117.227
G1 X115.249 Y120.43 E.20151
G1 X115.04 Y120.773
G1 X112.006 Y117.739 E.19089
G1 X111.938 Y118.222
G1 X114.818 Y121.102 E.1812
G1 X114.572 Y121.408
G1 X111.842 Y118.678 E.17172
G1 X111.746 Y119.133
G1 X114.294 Y121.681 E.16029
G1 X113.996 Y121.935
G1 X111.632 Y119.571 E.14871
G1 X111.497 Y119.987
G1 X113.679 Y122.169 E.13728
G1 X113.319 Y122.36
G1 X111.342 Y120.383 E.12437
G1 X111.162 Y120.755
G1 X112.959 Y122.552 E.11302
G1 X112.575 Y122.719
G1 X110.933 Y121.077 E.10328
G1 X110.625 Y121.321
G1 X112.153 Y122.849 E.09612
G1 X111.677 Y122.925
G1 X110.223 Y121.47 E.0915
G1 X109.685 Y121.483
G1 X111.181 Y122.979 E.09412
G1 X110.649 Y122.999
G1 X105.009 Y117.359 E.3548
G1 X104.961 Y117.862
G1 X110.047 Y122.948 E.31998
G1 X109.416 Y122.869
G1 X105.002 Y118.455 E.27764
G1 X105.097 Y119.101
G1 X108.703 Y122.707 E.22683
G1 X107.724 Y122.28
G1 X105.337 Y119.892 E.15019
; WIPE_START
M204 S6000
G1 X106.751 Y121.307 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.187 Y117.204 Z1.16 F42000
G1 X115.021 Y116.036 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132931
G1 F12000
M204 S6000
M73 P92 R1
G2 X113.902 Y114.918 I-15.654 J14.562 E.01314
; WIPE_START
G1 X114.745 Y115.73 E-.56226
G1 X115.021 Y116.036 E-.19774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.837 Y122.052 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110649
G1 F12000
M204 S6000
G1 X113.747 Y122.133 E.0007
; WIPE_START
G1 X113.837 Y122.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.868 Y121.729 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.122564
G1 F12000
M204 S6000
G1 X106.73 Y121.615 E.00128
; LINE_WIDTH: 0.155074
G1 X106.591 Y121.5 E.00195
G1 X106.067 Y120.956 E.00819
; LINE_WIDTH: 0.123964
G1 X105.834 Y120.697 E.00254
M204 S10000
G1 X105.401 Y119.828 F42000
; LINE_WIDTH: 0.21735
G1 F12000
M204 S6000
G1 X105.29 Y119.662 E.00359
; LINE_WIDTH: 0.18481
G1 X105.178 Y119.496 E.00285
; WIPE_START
G1 X105.29 Y119.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.962 Y116.055 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.188891
G1 F12000
M204 S6000
G2 X111.99 Y115.91 I-1.319 J-.338 E.00217
; LINE_WIDTH: 0.207027
G1 X111.922 Y115.817 E.00193
; LINE_WIDTH: 0.170862
G1 X111.848 Y115.717 E.00157
; LINE_WIDTH: 0.1579
G1 X111.754 Y115.612 E.00157
G2 X111.353 Y115.278 I-3.471 J3.758 E.00583
; WIPE_START
G1 X111.754 Y115.612 E-.5985
G1 X111.848 Y115.717 E-.1615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.612 Y121.556 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.160831
G1 F12000
M204 S6000
G1 X109.447 Y121.451 E.00225
; LINE_WIDTH: 0.134075
G1 X109.328 Y121.367 E.00123
; LINE_WIDTH: 0.108362
G1 X109.296 Y121.34 E.00023
M204 S10000
G1 X108.878 Y120.924 F42000
; LINE_WIDTH: 0.131301
G1 F12000
M204 S6000
G1 X108.768 Y120.776 E.00149
; LINE_WIDTH: 0.180163
G1 X108.657 Y120.629 E.00252
; LINE_WIDTH: 0.214692
G1 X108.597 Y120.528 E.00207
M204 S10000
G1 X108.61 Y119.832 F42000
; LINE_WIDTH: 0.131855
G1 F12000
M204 S6000
G1 X108.522 Y120.045 E.00189
; WIPE_START
G1 X108.61 Y119.832 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.121 Y121.302 Z1.16 F42000
G1 X98.124 Y121.89 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X98.044 Y122.313 I.699 J.352 E.01791
G2 X98.292 Y124.463 I10.674 J-.144 E.08901
G1 X98.398 Y124.8 E.01447
G2 X99.437 Y125.252 I.899 J-.647 E.04883
G2 X101.853 Y125.036 I-.129 J-15.084 E.09973
G2 X103.04 Y124.295 I-.583 J-2.254 E.05832
G3 X103.932 Y123.342 I11.651 J10.014 E.05365
G3 X105.072 Y123.785 I.386 J.693 E.05729
G3 X105.139 Y124.8 I-1.775 J.628 E.04228
G3 X104.557 Y126.421 I-3.18 J-.228 E.07161
G3 X104.116 Y126.966 I-1.669 J-.896 E.02896
G3 X103.728 Y127.058 I-.351 J-.621 E.0166
G2 X98.683 Y126.843 I-4.214 J39.648 E.20747
G2 X93.945 Y127.024 I.266 J69.021 E.19472
G3 X92.946 Y126.915 I-.262 J-2.221 E.04163
G3 X92.389 Y126.466 I.286 J-.925 E.03005
G3 X92.429 Y125.883 I.532 J-.256 E.02514
G3 X93.027 Y125.538 I1.349 J1.652 E.02845
G2 X93.766 Y124.619 I-.562 J-1.208 E.05015
G2 X93.902 Y122.62 I-13.375 J-1.916 E.08237
G2 X93.719 Y116.477 I-61.788 J-1.227 E.25243
G2 X93.407 Y115.663 I-1.753 J.204 E.03617
G2 X92.67 Y115.189 I-1.36 J1.305 E.0363
G3 X92.212 Y114.296 I.199 J-.666 E.04606
G3 X92.821 Y113.686 I.909 J.298 E.03672
G3 X95.6 Y113.453 I2.321 J11.016 E.11479
G1 X96.304 Y113.46 E.02894
G3 X99.202 Y113.757 I-.135 J15.563 E.11977
G3 X99.77 Y114.048 I-.261 J1.21 E.02649
G3 X99.918 Y114.733 I-.751 J.522 E.02954
G3 X99.488 Y115.139 I-.564 J-.167 E.02545
G2 X98.803 Y115.272 I.733 J5.617 E.02869
G2 X98.454 Y115.552 I.484 J.961 E.01851
G2 X98.055 Y117.302 I3.356 J1.684 E.07442
G2 X98.075 Y118.98 I114.431 J-.502 E.06889
G2 X98.269 Y119.471 I1.273 J-.22 E.02183
G2 X99.039 Y119.688 I.699 J-1.009 E.03344
G2 X100.387 Y119.023 I.093 J-1.512 E.06458
G2 X100.575 Y118.409 I-1.736 J-.865 E.02649
G3 X100.722 Y117.664 I2.668 J.141 E.03127
G3 X101.014 Y117.492 I.348 J.258 E.01429
G3 X101.337 Y117.514 I.123 J.591 E.01347
G3 X101.782 Y117.891 I-.314 J.822 E.0244
G3 X102.282 Y120.139 I-4.387 J2.154 E.09545
G3 X102.321 Y121.481 I-160.997 J5.336 E.05514
G3 X101.926 Y122.689 I-1.769 J.09 E.05337
G3 X101.247 Y123.2 I-2.498 J-2.613 E.03497
G3 X100.627 Y122.632 I.117 J-.75 E.03658
G2 X100.403 Y121.906 I-3.01 J.531 E.03131
G2 X100.172 Y121.628 I-1.404 J.932 E.01483
G2 X99.398 Y121.429 I-.702 J1.127 E.03334
G2 X98.385 Y121.594 I-.14 J2.336 E.04248
G2 X98.153 Y121.838 I.439 J.648 E.01393
; WIPE_START
M204 S6000
G1 X98.062 Y122.081 E-.09858
G1 X98.044 Y122.313 E-.08867
G1 X98.058 Y122.759 E-.16933
G1 X98.106 Y123.336 E-.22013
G1 X98.17 Y123.814 E-.18329
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.422 Y116.285 Z1.16 F42000
G1 X99.673 Y114.78 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X98.784 Y113.891 E.05592
G1 X98.132 Y113.79
G1 X99.305 Y114.963 E.0738
G1 X98.849 Y115.059
G1 X97.507 Y113.717 E.08439
G1 X96.928 Y113.689
G1 X98.477 Y115.238 E.09744
G1 X98.238 Y115.55
G1 X96.349 Y113.662 E.11882
G1 X95.793 Y113.657
G1 X98.079 Y115.943 E.14384
G1 X97.952 Y116.367
G1 X95.239 Y113.654 E.17067
G1 X94.696 Y113.663
G1 X97.879 Y116.846 E.20024
G1 X97.863 Y117.381
G1 X94.17 Y113.688 E.2323
G1 X93.672 Y113.741
G1 X97.865 Y117.935 E.26382
G1 X97.868 Y118.489
G1 X93.201 Y113.822 E.29358
G1 X92.761 Y113.934
G1 X97.889 Y119.062 E.32257
; WIPE_START
M204 S6000
G1 X96.475 Y117.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.964 Y117.725 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X101.85 Y118.611 E.05575
G1 X102.017 Y119.33
G1 X100.815 Y118.128 E.07561
G1 X100.736 Y118.6
G1 X102.076 Y119.94 E.08426
G1 X102.097 Y120.512
G1 X100.606 Y119.022 E.09376
G1 X100.383 Y119.35
G1 X102.117 Y121.084 E.10913
G1 X102.112 Y121.63
G1 X100.082 Y119.601 E.12765
G1 X99.717 Y119.787
G1 X102.026 Y122.096 E.14523
G1 X101.848 Y122.469
G1 X99.254 Y119.875 E.1632
G1 X98.689 Y119.862
G1 X100.293 Y121.466 E.1009
G1 X99.515 Y121.239
G1 X92.475 Y114.199 E.44281
; WIPE_START
M204 S6000
G1 X93.89 Y115.614 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.843 Y116.119 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X98.971 Y121.246 E.32257
G1 X98.52 Y121.347
G1 X93.939 Y116.766 E.28814
G1 X93.982 Y117.361
G1 X98.159 Y121.537 E.26274
G1 X97.926 Y121.856
G1 X94.022 Y117.952 E.24556
G1 X94.044 Y118.525
G1 X97.854 Y122.335 E.23968
G1 X97.871 Y122.903
G1 X94.065 Y119.098 E.2394
G1 X94.087 Y119.671
G1 X97.936 Y123.52 E.24216
G1 X98.019 Y124.155
G1 X94.096 Y120.232 E.24681
G1 X94.096 Y120.783
G1 X98.294 Y124.98 E.26404
; WIPE_START
M204 S6000
G1 X96.879 Y123.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.313 Y121.486 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X101.567 Y122.74 E.07888
; WIPE_START
M204 S6000
G1 X100.313 Y121.486 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.019 Y123.537 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X104.967 Y124.486 E.05965
G1 X104.914 Y124.984
G1 X103.743 Y123.813 E.07363
G1 X103.48 Y124.101
G1 X104.814 Y125.435 E.08395
G1 X104.658 Y125.831
G1 X103.22 Y124.393 E.09045
G1 X102.939 Y124.663
G1 X104.458 Y126.182 E.09555
G1 X104.246 Y126.521
G1 X102.631 Y124.907 E.10155
G1 X102.266 Y125.093
G1 X103.983 Y126.81 E.10802
G1 X103.451 Y126.829
G1 X101.858 Y125.237 E.10018
G1 X101.38 Y125.31
G1 X102.846 Y126.776 E.09224
G1 X102.251 Y126.732
G1 X100.889 Y125.37 E.08568
G1 X100.383 Y125.416
G1 X101.66 Y126.693 E.08031
G1 X101.086 Y126.67
G1 X99.852 Y125.436 E.07763
G1 X99.312 Y125.447
G1 X100.519 Y126.654 E.07593
G1 X99.959 Y126.646
G1 X98.466 Y125.153 E.09395
; WIPE_START
M204 S6000
G1 X99.88 Y126.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.407 Y126.645 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X94.096 Y121.334 E.33408
G1 X94.096 Y121.886
G1 X98.854 Y126.644 E.29933
G1 X98.306 Y126.647
G1 X94.096 Y122.437 E.2648
G1 X94.096 Y122.989
G1 X97.758 Y126.651 E.23039
G1 X97.218 Y126.662
G1 X94.074 Y123.518 E.1978
G1 X94.033 Y124.028
G1 X96.682 Y126.677 E.16665
G1 X96.148 Y126.694
G1 X93.977 Y124.524 E.13653
G1 X93.853 Y124.951
G1 X95.625 Y126.723 E.11148
G1 X95.102 Y126.752
G1 X93.656 Y125.305 E.091
G1 X93.362 Y125.563
G1 X94.579 Y126.78 E.0766
G1 X94.057 Y126.809
G1 X93.015 Y125.767 E.06554
G1 X92.658 Y125.962
G1 X93.521 Y126.825 E.0543
; WIPE_START
M204 S6000
G1 X92.658 Y125.962 E-.46383
G1 X93.015 Y125.767 E-.15444
G1 X93.279 Y126.031 E-.14173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.237 Y125.522 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153632
G1 F12000
M204 S6000
G3 X99.092 Y125.452 I.807 J-1.831 E.00171
; LINE_WIDTH: 0.120165
G1 X99.032 Y125.419 E.00047
; WIPE_START
G1 X99.092 Y125.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.3 Y122.952 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.373321
G1 F8209.328
M204 S6000
M73 P93 R1
G1 X101.051 Y122.73 E.01193
G1 X100.733 Y122.31 E.01883
; WIPE_START
G1 X101.051 Y122.73 E-.46526
G1 X101.3 Y122.952 E-.29474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.516 Y117.843 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.115769
G1 F12000
M204 S6000
G1 X101.232 Y117.695 E.00203
M204 S10000
G1 X101.673 Y118.105 F42000
; LINE_WIDTH: 0.164739
G1 F12000
M204 S6000
G2 X101.261 Y117.683 I-2.255 J1.791 E.00705
; WIPE_START
G1 X101.463 Y117.869 E-.35322
G1 X101.673 Y118.105 E-.40678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.61 Y119.942 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.122165
G1 F12000
M204 S6000
G3 X98.301 Y119.721 I2.432 J-3.722 E.00269
M204 S10000
G1 X98.699 Y119.852 F42000
; LINE_WIDTH: 0.142536
G1 F12000
M204 S6000
G1 X98.469 Y119.917 E.00225
M204 S10000
G1 X97.831 Y119.28 F42000
; LINE_WIDTH: 0.146452
G1 F12000
M204 S6000
G1 X97.9 Y119.05 E.00236
M204 S10000
G1 X98.036 Y119.456 F42000
; LINE_WIDTH: 0.12123
G1 F12000
M204 S6000
G1 X97.973 Y119.37 E.00075
; LINE_WIDTH: 0.160115
G3 X97.813 Y119.138 I2.303 J-1.759 E.00322
; WIPE_START
G1 X97.973 Y119.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.749 Y114.52 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.25017
G1 F12000
M204 S6000
G2 X99.504 Y114.191 I-1.102 J.561 E.00894
G1 X99.173 Y113.939 E.00902
; WIPE_START
G1 X99.504 Y114.191 E-.38268
G1 X99.749 Y114.52 E-.37732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.702 Y113.961 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110702
G1 F12000
M204 S6000
G1 X92.603 Y114.052 E.00077
; WIPE_START
G1 X92.702 Y113.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.228 Y115.259 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.124547
G1 F12000
M204 S6000
G1 X93.044 Y115.103 E.00177
; LINE_WIDTH: 0.166893
G1 X92.937 Y115.029 E.0016
; LINE_WIDTH: 0.214381
G1 X92.829 Y114.954 E.00231
; LINE_WIDTH: 0.26187
G1 X92.721 Y114.88 E.00302
; LINE_WIDTH: 0.319173
G1 F9925.068
G3 X92.366 Y114.495 I.584 J-.894 E.01562
; WIPE_START
G1 X92.546 Y114.734 E-.43037
G1 X92.613 Y114.806 E-.14088
G1 X92.721 Y114.88 E-.18875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.916 Y116.045 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.167991
G1 F12000
M204 S6000
G1 X93.804 Y115.879 E.00247
; LINE_WIDTH: 0.15152
G1 X93.741 Y115.792 E.00113
; LINE_WIDTH: 0.121763
G1 X93.677 Y115.705 E.00076
M204 S10000
G1 X93.893 Y115.892 F42000
; LINE_WIDTH: 0.141832
G1 F12000
M204 S6000
G1 X93.83 Y116.132 E.00231
; WIPE_START
G1 X93.893 Y115.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.091 Y117.745 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.142056
G1 F12000
M204 S6000
G1 X94.006 Y117.969 E.00224
; WIPE_START
G1 X94.091 Y117.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.311 Y125.337 Z1.16 F42000
G1 X93.163 Y126.787 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.194193
G1 F12000
M204 S6000
G1 X92.993 Y126.665 E.0032
; LINE_WIDTH: 0.234624
G1 X92.824 Y126.542 E.00417
; LINE_WIDTH: 0.261871
G3 X92.516 Y126.214 I1.439 J-1.666 E.01037
; WIPE_START
G1 X92.824 Y126.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.445 Y126.113 Z1.16 F42000
G1 X104.639 Y125.877 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121623
G1 F12000
M204 S6000
G3 X104.549 Y125.997 I-.833 J-.528 E.00105
; WIPE_START
G1 X104.639 Y125.877 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.969 Y124.114 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.287589
G1 F11302.954
M204 S6000
G1 X104.824 Y123.921 E.00628
; LINE_WIDTH: 0.322859
G1 F9785.844
G2 X104.322 Y123.432 I-1.407 J.941 E.02116
; OBJECT_ID: 941
; WIPE_START
G1 X104.558 Y123.612 E-.32004
G1 X104.678 Y123.727 E-.17948
G1 X104.824 Y123.921 E-.26048
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 783
M625
; start printing object, unique label id: 941
M624 BAAAAAAAAAA=
M204 S10000
G1 X112.054 Y121.477 Z1.16 F42000
G1 X156.642 Y106.411 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X156.178 Y106.608 I.137 J.969 E.02096
G2 X156.035 Y107.261 I.799 J.516 E.02805
G3 X155.976 Y107.765 I-.881 J.151 E.02112
G3 X155.545 Y108.029 I-.425 J-.21 E.02187
G3 X153.737 Y107.621 I1.072 J-8.96 E.07625
G3 X151.48 Y106.793 I3.897 J-14.12 E.0988
G1 X151.155 Y106.612 E.01528
M73 P93 R0
G3 X151.229 Y105.642 I.308 J-.464 E.04861
G2 X151.909 Y105.04 I-.928 J-1.731 E.03762
G2 X152.033 Y104.193 I-2.517 J-.803 E.0353
G2 X151.895 Y100.814 I-34.95 J-.26 E.1389
G1 X151.825 Y100.379 E.01808
G2 X151.279 Y99.735 I-1.16 J.43 E.03537
G3 X151.023 Y99.428 I.3 J-.51 E.01678
G3 X151.014 Y99.342 I.407 J-.085 E.00355
G3 X151.711 Y98.53 I2.055 J1.06 E.04434
G3 X152.893 Y98.308 I.998 J2.061 E.04997
G1 X153.029 Y98.312 E.00556
G2 X154.728 Y98.375 I9.147 J-223.228 E.06984
G3 X156.083 Y98.614 I-1.045 J9.881 E.05652
G3 X156.631 Y98.954 I-.261 J1.033 E.0269
G3 X156.747 Y99.381 I-.822 J.454 E.01833
G3 X156.502 Y99.847 I-1.082 J-.273 E.02184
G2 X156.159 Y100.478 I4.403 J2.797 E.02948
G2 X156.075 Y101.226 I3.656 J.791 E.03096
G1 X156.076 Y103.658 E.09988
G2 X156.351 Y105.007 I3.688 J-.049 E.05685
G2 X157.459 Y105.539 I1.026 J-.719 E.05275
G2 X158.24 Y105.317 I.004 J-1.472 E.03375
G2 X158.737 Y104.491 I-.873 J-1.088 E.04043
G2 X158.947 Y102.761 I-4.914 J-1.474 E.07191
G2 X158.865 Y100.926 I-8.185 J-.555 E.07555
G2 X158.519 Y99.843 I-8.085 J1.984 E.04674
G3 X158.101 Y99.335 I1.925 J-2.011 E.02708
G3 X158.372 Y98.678 I.61 J-.133 E.03106
G1 X158.546 Y98.579 E.00819
G3 X160.121 Y98.354 I1.496 J4.828 E.06561
G3 X162.533 Y98.48 I.547 J12.683 E.09932
G3 X163.178 Y98.605 I-3.79 J21.233 E.02695
G3 X163.674 Y98.903 I-.304 J1.068 E.02407
G3 X163.768 Y99.565 I-.594 J.421 E.02851
G3 X163.23 Y100.196 I-42.152 J-35.375 E.03402
G2 X162.93 Y101.082 I1.052 J.85 E.03925
G1 X162.79 Y104.606 E.1448
G3 X162.493 Y106.407 I-6.469 J-.142 E.07518
G3 X161.211 Y107.69 I-2.288 J-1.004 E.07624
G3 X159.999 Y108.016 I-1.32 J-2.493 E.05196
G3 X159.052 Y107.973 I-.299 J-3.838 E.03903
G3 X157.666 Y107.26 I.235 J-2.162 E.06545
G2 X157.052 Y106.586 I-27.372 J24.297 E.03742
G2 X156.701 Y106.425 I-.636 J.921 E.01596
; WIPE_START
M204 S6000
G1 X156.341 Y106.496 E-.13953
G1 X156.178 Y106.608 E-.07507
G1 X156.082 Y106.769 E-.07135
G1 X156.052 Y106.877 E-.04236
G1 X156.024 Y107.107 E-.08827
G1 X156.035 Y107.261 E-.05859
G1 X156.033 Y107.603 E-.12985
G1 X155.976 Y107.765 E-.06527
G1 X155.895 Y107.876 E-.05238
G1 X155.817 Y107.937 E-.03734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.368 Y101.81 Z1.16 F42000
G1 X162.669 Y98.712 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X163.519 Y99.562 E.05348
G1 X163.255 Y99.85
G1 X162.013 Y98.607 E.07815
G1 X161.429 Y98.575
G1 X163.014 Y100.159 E.09968
G1 X162.823 Y100.519
G1 X160.857 Y98.554 E.12367
G1 X160.307 Y98.555
G1 X162.744 Y100.992 E.1533
G1 X162.721 Y101.521
G1 X159.769 Y98.569 E.18574
G1 X159.268 Y98.619
G1 X162.699 Y102.05 E.21581
G1 X162.677 Y102.579
G1 X158.819 Y98.722 E.24266
G1 X158.428 Y98.882
G1 X162.654 Y103.108 E.26585
G1 X162.632 Y103.637
G1 X158.367 Y99.372 E.2683
G1 X158.965 Y100.522
G1 X162.609 Y104.166 E.22927
G1 X162.584 Y104.692
G1 X159.108 Y101.217 E.21862
G1 X159.154 Y101.813
G1 X162.545 Y105.204 E.21332
G1 X162.476 Y105.687
G1 X159.153 Y102.364 E.20901
G1 X159.144 Y102.907
G1 X162.362 Y106.125 E.20243
G1 X162.207 Y106.52
G1 X159.126 Y103.44 E.19376
G1 X159.072 Y103.937
G1 X161.987 Y106.852 E.18338
G1 X161.712 Y107.129
G1 X158.97 Y104.387 E.17249
G1 X158.843 Y104.811
G1 X161.39 Y107.358 E.16023
G1 X161.03 Y107.55
G1 X158.65 Y105.169 E.14977
G1 X158.381 Y105.452
G1 X160.638 Y107.709 E.14196
G1 X160.172 Y107.794
G1 X158.021 Y105.644 E.13528
G1 X157.555 Y105.728
G1 X159.665 Y107.839 E.13274
G1 X159.031 Y107.756
G1 X156.945 Y105.671 E.13119
; WIPE_START
M204 S6000
G1 X158.36 Y107.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.433 Y99.7 Z1.16 F42000
G1 X156.413 Y99.624 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X155.48 Y98.691 E.05874
G1 X154.835 Y98.598
G1 X156.199 Y99.962 E.08581
G1 X156.013 Y100.326
G1 X154.24 Y98.554 E.11151
G1 X153.679 Y98.544
G1 X155.907 Y100.772 E.14015
G1 X155.876 Y101.292
G1 X153.099 Y98.516 E.17465
G1 X152.55 Y98.518
G1 X155.876 Y101.844 E.20921
G1 X155.876 Y102.396
G1 X152.072 Y98.592 E.2393
G1 X151.709 Y98.78
G1 X155.877 Y102.947 E.26217
G1 X155.877 Y103.499
G1 X151.443 Y99.065 E.27893
G1 X151.897 Y100.071
G1 X155.903 Y104.077 E.252
G1 X156.072 Y104.797
G1 X152.093 Y100.818 E.25033
G1 X152.146 Y101.423
G1 X157.118 Y106.394 E.31275
G1 X156.434 Y106.262
G1 X152.178 Y102.006 E.26773
G1 X152.205 Y102.584
G1 X156.069 Y106.448 E.24306
G1 X155.871 Y106.801
G1 X152.217 Y103.148 E.22981
G1 X152.226 Y103.708
G1 X155.836 Y107.318 E.22711
G1 X155.724 Y107.757
G1 X152.228 Y104.262 E.21987
G1 X152.179 Y104.764
G1 X155.198 Y107.783 E.18989
G1 X154.485 Y107.622
G1 X152.048 Y105.184 E.15336
G1 X151.792 Y105.479
G1 X153.718 Y107.405 E.12116
G1 X152.904 Y107.143
G1 X151.475 Y105.714 E.0899
G1 X151.162 Y105.953
G1 X152.037 Y106.828 E.05504
; WIPE_START
M204 S6000
G1 X151.162 Y105.953 E-.47019
G1 X151.475 Y105.714 E-.14945
G1 X151.736 Y105.975 E-.14036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.646 Y107.69 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191636
G1 F12000
M204 S6000
G1 X158.487 Y107.574 E.00295
; LINE_WIDTH: 0.22557
G1 X158.328 Y107.458 E.00371
; LINE_WIDTH: 0.263588
G1 X158.132 Y107.292 E.00599
; LINE_WIDTH: 0.282094
G1 F11582.702
G3 X157.256 Y106.396 I9.616 J-10.282 E.03174
; LINE_WIDTH: 0.24333
G1 F12000
G1 X157.237 Y106.396 E.0004
; LINE_WIDTH: 0.215923
G1 X157.218 Y106.395 E.00034
; LINE_WIDTH: 0.184182
G1 X157.112 Y106.401 E.0015
; WIPE_START
G1 X157.218 Y106.395 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.173 Y106.582 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117499
G1 F12000
M204 S6000
G1 X162.117 Y106.658 E.00062
G1 X162.124 Y106.707 E.00033
; WIPE_START
G1 X162.117 Y106.658 E-.26138
G1 X162.173 Y106.582 E-.49862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.629 Y99.311 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.249688
G1 F12000
M204 S6000
G2 X163.33 Y98.969 I-.991 J.567 E.0099
; LINE_WIDTH: 0.215909
G1 X163.184 Y98.868 E.00316
; LINE_WIDTH: 0.167677
G1 X163.037 Y98.767 E.00218
; WIPE_START
G1 X163.184 Y98.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.202 Y103.365 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.136223
G1 F12000
M204 S6000
G1 X159.124 Y103.162 E.00189
; WIPE_START
G1 X159.202 Y103.365 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.951 Y105.665 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.207436
G1 F12000
M204 S6000
G1 X156.806 Y105.696 E.00248
; LINE_WIDTH: 0.196358
M73 P94 R0
G1 X156.697 Y105.617 E.0021
; LINE_WIDTH: 0.153172
G1 X156.581 Y105.531 E.00153
; LINE_WIDTH: 0.123025
G1 X156.362 Y105.326 E.00216
G3 X155.985 Y104.884 I1.902 J-2.002 E.00418
; WIPE_START
G1 X156.167 Y105.121 E-.25797
G1 X156.362 Y105.326 E-.24283
G1 X156.581 Y105.531 E-.2592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.983 Y100.384 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110242
G1 F12000
M204 S6000
G2 X155.909 Y100.499 I.697 J.526 E.00078
; WIPE_START
G1 X155.983 Y100.384 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.557 Y99.401 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.30411
G1 F10537.717
M204 S6000
G2 X156.344 Y99.092 I-1.446 J.771 E.01046
G1 X156.295 Y99.048 E.00185
; LINE_WIDTH: 0.29592
G1 F10903.684
G1 X156.152 Y98.95 E.00467
; LINE_WIDTH: 0.253883
G1 F12000
G1 X156.009 Y98.851 E.00383
; LINE_WIDTH: 0.211847
G1 X155.867 Y98.753 E.003
; WIPE_START
G1 X156.009 Y98.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.453 Y99.63 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.197675
G1 F12000
M204 S6000
G1 X151.291 Y99.393 E.0045
G1 X151.206 Y99.401 E.00134
; WIPE_START
G1 X151.291 Y99.393 E-.1743
G1 X151.453 Y99.63 E-.5857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.304 Y104.062 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.125548
G1 F12000
M204 S6000
G1 X152.211 Y104.279 E.00176
; WIPE_START
G1 X152.304 Y104.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.447 Y106.542 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.119695
G1 F12000
M204 S6000
G1 X151.367 Y106.483 E.00067
; LINE_WIDTH: 0.155723
G3 X151.088 Y106.214 I.81 J-1.123 E.00425
; WIPE_START
G1 X151.222 Y106.361 E-.38815
G1 X151.367 Y106.483 E-.37185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.437 Y106.988 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.22225
G1 F12000
M204 S6000
G1 X152.102 Y106.764 E.00747
; WIPE_START
G1 X152.437 Y106.988 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.091 Y104.916 Z1.16 F42000
G1 X144.153 Y104.652 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X144.795 Y104.488 I.576 J.914 E.02762
G1 X145.82 Y104.488 E.04212
G1 X145.951 Y104.504 E.00542
G3 X146.594 Y104.973 I-.001 J.676 E.03492
G3 X146.294 Y106.311 I-1.363 J.398 E.05879
G3 X144.841 Y106.633 I-.974 J-.955 E.06466
G3 X143.963 Y105.47 I.638 J-1.395 E.06236
G3 X144.115 Y104.698 I.859 J-.231 E.03344
; WIPE_START
M204 S6000
G1 X144.411 Y104.532 E-.12881
G1 X144.631 Y104.492 E-.08514
G1 X144.795 Y104.488 E-.06207
G1 X145.82 Y104.488 E-.38979
G1 X145.951 Y104.504 E-.05019
G1 X146.065 Y104.526 E-.04398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.139 Y102.876 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G2 X144.326 Y103.005 I.369 J-.333 E.0094
G2 X144.525 Y103.036 I.269 J-1.061 E.0083
G1 X149.223 Y103.036 E.1929
G3 X149.762 Y103.354 I-.005 J.625 E.02693
G3 X149.972 Y104.604 I-1.63 J.916 E.05306
G3 X149.265 Y106.296 I-3.436 J-.443 E.0762
G3 X147.854 Y107.492 I-3.323 J-2.487 E.0766
G3 X145.995 Y108.057 I-2.044 J-3.385 E.08061
G3 X141.646 Y106.581 I-.644 J-5.247 E.19506
G3 X141.143 Y106.022 I8.735 J-8.375 E.0309
G3 X140.403 Y104.64 I5.325 J-3.74 E.06453
G3 X140.385 Y101.683 I4.883 J-1.508 E.12319
G3 X141.818 Y99.457 I4.815 J1.527 E.10998
G3 X143.431 Y98.547 I4.12 J5.42 E.07627
G3 X145.239 Y98.286 I1.896 J6.734 E.07522
G3 X147.188 Y98.6 I-.137 J7.046 E.08133
G3 X148.987 Y99.62 I-2.568 J6.626 E.08519
G3 X149.567 Y100.665 I-.992 J1.235 E.05035
G3 X149.112 Y101.397 I-.868 J-.032 E.03702
G3 X148.872 Y101.384 I-.103 J-.316 E.01009
G3 X148.175 Y100.975 I7.047 J-12.823 E.03318
G2 X146.443 Y100.544 I-1.964 J4.2 E.07374
G2 X144.225 Y101.81 I.096 J2.744 E.10907
G2 X144.012 Y102.561 I2.603 J1.147 E.03213
G2 X144.102 Y102.829 I.496 J-.018 E.01178
; WIPE_START
M204 S6000
G1 X144.191 Y102.939 E-.05379
G1 X144.326 Y103.005 E-.05709
G1 X144.525 Y103.036 E-.07671
G1 X146.031 Y103.036 E-.57242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.996 Y103.236 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X149.783 Y104.022 E.04945
G1 X149.771 Y104.562
G1 X148.445 Y103.236 E.08342
G1 X147.894 Y103.236
G1 X149.69 Y105.032 E.11299
G1 X149.536 Y105.43
G1 X147.342 Y103.236 E.13801
G1 X146.791 Y103.236
G1 X149.35 Y105.795 E.16101
G1 X149.127 Y106.123
G1 X146.239 Y103.236 E.18166
G1 X145.688 Y103.236
G1 X148.891 Y106.439 E.20148
G1 X148.615 Y106.714
G1 X146.76 Y104.86 E.11666
G1 X146.838 Y105.489
G1 X148.315 Y106.965 E.0929
G1 X147.98 Y107.182
G1 X146.743 Y105.946 E.07776
G1 X146.546 Y106.299
G1 X147.632 Y107.385 E.06833
G1 X147.256 Y107.561
G1 X146.28 Y106.585 E.06141
G1 X145.94 Y106.796
G1 X146.848 Y107.704 E.05709
G1 X146.397 Y107.805
G1 X145.492 Y106.9 E.05693
G1 X144.891 Y106.85
G1 X145.905 Y107.864 E.06379
; WIPE_START
M204 S6000
G1 X144.891 Y106.85 E-.54497
G1 X145.454 Y106.897 E-.21503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.279 Y104.378 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X145.136 Y103.236 E.07186
G1 X144.585 Y103.236
G1 X145.637 Y104.288 E.06621
; WIPE_START
M204 S6000
G1 X144.585 Y103.236 E-.56559
G1 X145.097 Y103.236 E-.19441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.441 Y98.923 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X149.339 Y100.821 E.11942
G1 X149.122 Y101.156
G1 X146.628 Y98.661 E.15692
G1 X145.974 Y98.559
G1 X148.171 Y100.756 E.13819
G1 X147.334 Y100.47
G1 X145.362 Y98.498 E.12405
G1 X144.825 Y98.513
G1 X146.68 Y100.368 E.11669
G1 X146.142 Y100.381
G1 X144.325 Y98.565 E.11427
G1 X143.859 Y98.65
G1 X145.679 Y100.47 E.11446
G1 X145.283 Y100.625
G1 X143.422 Y98.764 E.11706
G1 X143.038 Y98.932
G1 X144.938 Y100.831 E.11949
G1 X144.618 Y101.063
G1 X142.683 Y99.128 E.12174
G1 X142.343 Y99.339
G1 X144.335 Y101.331 E.12529
G1 X144.096 Y101.644
G1 X142.016 Y99.563 E.13087
G1 X141.729 Y99.828
G1 X143.925 Y102.025 E.13818
G1 X143.826 Y102.477
G1 X141.462 Y100.113 E.14869
G1 X141.229 Y100.431
G1 X145.086 Y104.288 E.24266
G1 X144.55 Y104.304
G1 X141.014 Y100.768 E.22246
G1 X140.824 Y101.129
G1 X144.135 Y104.44 E.20829
G1 X143.865 Y104.722
G1 X140.659 Y101.515 E.20171
G1 X140.52 Y101.928
G1 X143.741 Y105.149 E.20263
G1 X143.836 Y105.795
G1 X140.433 Y102.392 E.21405
G1 X140.382 Y102.893
G1 X145.387 Y107.898 E.31482
G1 X144.799 Y107.861
G1 X140.395 Y103.457 E.27704
G1 X140.475 Y104.089
G1 X144.129 Y107.742 E.22984
G1 X143.292 Y107.457
G1 X140.71 Y104.875 E.16244
; WIPE_START
M204 S6000
G1 X142.124 Y106.289 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.116 Y101.561 Z1.16 F42000
G1 X148.734 Y101.073 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.125903
G1 F12000
M204 S6000
G1 X148.595 Y100.963 E.00133
; LINE_WIDTH: 0.164564
G1 X148.452 Y100.849 E.00218
; LINE_WIDTH: 0.198566
G1 X148.343 Y100.771 E.00212
; LINE_WIDTH: 0.226674
G1 X148.235 Y100.692 E.00255
; WIPE_START
G1 X148.343 Y100.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.239 Y106.446 Z1.16 F42000
G1 X142.641 Y107.11 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.116235
G1 F12000
M204 S6000
G1 X142.572 Y107.059 E.00056
; LINE_WIDTH: 0.143619
G1 X142.424 Y106.936 E.00183
; LINE_WIDTH: 0.179707
G1 X142.276 Y106.814 E.00262
; LINE_WIDTH: 0.215021
G3 X141.341 Y105.875 I9.888 J-10.782 E.02343
; LINE_WIDTH: 0.17086
G1 X141.218 Y105.72 E.0025
; LINE_WIDTH: 0.12821
G1 X141.095 Y105.565 E.00154
; WIPE_START
G1 X141.218 Y105.72 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.901 Y106.839 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.211847
G1 F12000
M204 S6000
G1 X144.745 Y106.872 E.00276
; LINE_WIDTH: 0.191146
G1 X144.634 Y106.792 E.00204
; LINE_WIDTH: 0.146224
G1 X144.518 Y106.708 E.00141
; LINE_WIDTH: 0.115438
G1 X144.357 Y106.56 E.00138
M204 S10000
G1 X144.128 Y106.333 F42000
; LINE_WIDTH: 0.123015
G1 F12000
M204 S6000
G1 X144.031 Y106.211 E.00112
; LINE_WIDTH: 0.155995
G1 X143.929 Y106.084 E.00178
; LINE_WIDTH: 0.189261
G1 X143.85 Y105.972 E.00203
; LINE_WIDTH: 0.221063
G1 X143.771 Y105.859 E.00253
; WIPE_START
G1 X143.85 Y105.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.642 Y103.578 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.126722
G1 F12000
M204 S6000
G1 X149.57 Y103.472 E.00097
; LINE_WIDTH: 0.155762
G2 X149.339 Y103.242 I-1.447 J1.221 E.00357
; WIPE_START
G1 X149.57 Y103.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.751 Y104.869 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.172302
G1 F12000
M204 S6000
G1 X146.771 Y104.764 E.00136
; LINE_WIDTH: 0.1929
G1 X146.774 Y104.743 E.00032
; LINE_WIDTH: 0.207548
G1 X146.777 Y104.722 E.00036
G2 X146.348 Y104.309 I-1.568 J1.202 E.01005
M204 S10000
G1 X145.905 Y104.299 F42000
; LINE_WIDTH: 0.140577
G1 F12000
M204 S6000
G1 X145.714 Y104.212 E.00193
; WIPE_START
G1 X145.905 Y104.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.598 Y103.223 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.140503
G1 F12000
M204 S6000
G1 X144.378 Y103.304 E.00215
; WIPE_START
G1 X144.598 Y103.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.338 Y100.498 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.208745
G1 F12000
M204 S6000
G1 X149.214 Y100.321 E.00366
; LINE_WIDTH: 0.253395
G1 X149.09 Y100.144 E.00476
; LINE_WIDTH: 0.281902
G1 F11592.752
G2 X148.597 Y99.663 I-3.912 J3.521 E.01745
; LINE_WIDTH: 0.235362
G1 F12000
G1 X148.443 Y99.542 E.00391
; LINE_WIDTH: 0.190523
G1 X148.29 Y99.42 E.00291
; LINE_WIDTH: 0.152799
G1 X148.194 Y99.348 E.00128
; LINE_WIDTH: 0.122184
G1 X148.097 Y99.275 E.00086
; WIPE_START
G1 X148.194 Y99.348 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.232 Y102.477 Z1.16 F42000
G1 X135.471 Y105.067 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X134.93 Y105.437 I.332 J1.068 E.02732
G2 X134.467 Y106.291 I1.395 J1.309 E.04034
G2 X134.682 Y106.82 I1.023 J-.108 E.02376
G3 X134.853 Y107.267 I-1.463 J.817 E.01969
G3 X134.61 Y107.709 I-.693 J-.092 E.02122
G3 X134.194 Y107.864 I-1.019 J-2.096 E.01823
G3 X131.948 Y108.03 I-2.024 J-12.13 E.09261
G3 X128.862 Y107.741 I-.37 J-12.671 E.12758
G3 X128.22 Y107.446 I.273 J-1.441 E.0293
G3 X128.014 Y107.031 I.889 J-.699 E.01916
G3 X128.244 Y106.619 I.546 J.035 E.02004
G3 X128.866 Y106.421 I1.229 J2.788 E.02683
G2 X129.879 Y105.74 I-.751 J-2.211 E.05074
G2 X130.211 Y105.362 I-4.2 J-4.027 E.02065
G2 X131.317 Y103.978 I-23.76 J-20.118 E.07273
G2 X131.427 Y103.729 I-.696 J-.457 E.01127
G2 X131.318 Y103.428 I-.878 J.15 E.01321
G2 X129.125 Y99.996 I-42.683 J24.856 E.16727
G2 X128.17 Y99.533 I-1.131 J1.117 E.04444
G3 X127.824 Y99.331 I.11 J-.586 E.01676
G3 X127.922 Y98.703 I.551 J-.236 E.02751
G3 X128.418 Y98.478 I.669 J.811 E.02262
G3 X129.674 Y98.353 I1.027 J3.958 E.05203
G3 X130.437 Y98.335 I.541 J6.65 E.03137
G3 X131.428 Y98.947 I.008 J1.097 E.05045
G1 X131.5 Y99.062 E.00557
G3 X131.242 Y99.55 I-.887 J-.158 E.02303
G2 X131.052 Y100.012 I1.133 J.736 E.02064
G2 X131.561 Y101.199 I2.601 J-.414 E.05358
G2 X132.436 Y102.04 I1.589 J-.777 E.05089
G2 X133.127 Y101.556 I-.411 J-1.32 E.03519
G2 X133.612 Y100.749 I-2.824 J-2.247 E.03876
G2 X133.712 Y100.34 I-3.391 J-1.052 E.01732
G2 X133.316 Y99.713 I-.672 J-.013 E.03225
G3 X132.936 Y99.363 I.186 J-.583 E.0219
G3 X132.938 Y99.092 I.266 J-.133 E.01155
G3 X133.409 Y98.583 I.594 J.078 E.03036
G1 X133.637 Y98.508 E.00984
G3 X135.525 Y98.353 I1.86 J11.061 E.07789
G3 X137.97 Y98.431 I.536 J21.582 E.1005
G3 X138.996 Y98.601 I-2.124 J15.978 E.04269
G3 X139.522 Y98.895 I-.307 J1.168 E.025
G3 X139.662 Y99.459 I-.639 J.458 E.02443
G3 X139.482 Y99.739 I-.375 J-.043 E.01417
G2 X138.825 Y100.103 I20.708 J38.099 E.03084
G2 X138.236 Y100.686 I1.33 J1.933 E.03418
G2 X137.387 Y101.825 I11.455 J9.421 E.05838
G1 X136.524 Y103.134 E.06439
G2 X136.368 Y103.465 I.983 J.663 E.01506
G2 X136.471 Y103.719 I.858 J-.198 E.01127
G2 X138.357 Y106.346 I29.336 J-19.073 E.13284
G2 X139.128 Y106.84 I1.465 J-1.435 E.03794
G3 X139.545 Y107.092 I-1.474 J2.908 E.02003
G3 X139.599 Y107.449 I-.282 J.225 E.0155
G3 X139.243 Y107.878 I-.586 J-.124 E.02381
G3 X138.187 Y108.04 I-.993 J-2.942 E.04406
G3 X136.595 Y107.872 I-.281 J-4.955 E.06605
G3 X136.153 Y107.34 I.249 J-.655 E.02969
G3 X136.404 Y106.858 I1.23 J.334 E.02245
G2 X136.568 Y106.404 I-1.407 J-.763 E.0199
G2 X136.264 Y105.737 I-1.498 J.28 E.03039
G2 X135.717 Y105.18 I-1.586 J1.009 E.03227
G1 X135.526 Y105.092 E.00865
; WIPE_START
M204 S6000
G1 X135.176 Y105.209 E-.14024
G1 X135.011 Y105.344 E-.08071
G1 X134.93 Y105.437 E-.04702
G1 X134.698 Y105.739 E-.1447
G1 X134.58 Y105.935 E-.08684
G1 X134.467 Y106.291 E-.14205
G1 X134.504 Y106.511 E-.08489
G1 X134.548 Y106.588 E-.03355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.398 Y99.636 Z1.16 F42000
G1 X131.221 Y99.245 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X130.527 Y98.552 E.04365
G1 X129.967 Y98.544
G1 X130.997 Y99.574 E.06478
G1 X130.853 Y99.981
G1 X129.427 Y98.555 E.0897
G1 X128.915 Y98.594
G1 X131.065 Y100.744 E.13523
; WIPE_START
M204 S6000
G1 X129.651 Y99.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.28 Y99.55 Z1.16 F42000
G1 X139.303 Y99.608 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.4 Y98.705 E.05684
G1 X137.759 Y98.615
G1 X138.943 Y99.8 E.07451
G1 X138.609 Y100.017
G1 X137.163 Y98.571 E.09096
G1 X136.599 Y98.558
G1 X138.322 Y100.281 E.1084
G1 X138.067 Y100.578
G1 X136.045 Y98.555 E.12722
G1 X135.492 Y98.554
G1 X137.822 Y100.884 E.14657
G1 X137.584 Y101.198
G1 X134.956 Y98.57 E.16533
G1 X134.442 Y98.607
G1 X137.357 Y101.522 E.18334
G1 X137.133 Y101.849
G1 X133.95 Y98.666 E.20022
G1 X133.5 Y98.768
G1 X136.913 Y102.181 E.21471
G1 X136.694 Y102.513
G1 X133.181 Y99.001 E.22098
; WIPE_START
M204 S6000
M73 P95 R0
G1 X134.596 Y100.415 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.904 Y100.274 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X136.475 Y102.846 E.16175
G1 X136.266 Y103.188
G1 X133.819 Y100.741 E.15393
G1 X133.654 Y101.127
G1 X136.262 Y103.736 E.16411
; WIPE_START
M204 S6000
G1 X134.848 Y102.322 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.436 Y105.46 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X133.43 Y101.455 E.25198
G1 X133.203 Y101.779
G1 X139.128 Y107.704 E.37273
G1 X138.685 Y107.813
G1 X136.142 Y105.269 E.16002
G1 X136.764 Y106.443
G1 X138.159 Y107.838 E.08781
G1 X137.603 Y107.833
G1 X136.626 Y106.857 E.06141
G1 X136.419 Y107.201
G1 X136.965 Y107.747 E.03437
; WIPE_START
M204 S6000
G1 X136.419 Y107.201 E-.2936
G1 X136.626 Y106.857 E-.15262
G1 X137.21 Y107.441 E-.31377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.044 Y105.171 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.91 Y102.038 E.19711
G1 X132.535 Y102.214
G1 X135.266 Y104.945 E.17178
G1 X134.926 Y105.156
G1 X128.45 Y98.681 E.40738
G1 X128.679 Y99.461
G1 X128.065 Y98.847 E.03858
; WIPE_START
M204 S6000
G1 X128.679 Y99.461 E-.32962
G1 X128.45 Y98.681 E-.30886
G1 X128.676 Y98.907 E-.12152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.697 Y100.479 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X134.671 Y105.453 E.31289
G1 X134.443 Y105.776
G1 X130.713 Y102.046 E.23465
; WIPE_START
M204 S6000
G1 X132.127 Y103.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.539 Y103.424 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X134.293 Y106.178 E.17327
G1 X134.514 Y106.95
G1 X131.537 Y103.973 E.18725
G1 X131.314 Y104.302
G1 X134.527 Y107.514 E.20211
G1 X134.133 Y107.672
G1 X131.069 Y104.608 E.19274
G1 X130.824 Y104.915
G1 X133.653 Y107.743 E.17796
G1 X133.146 Y107.787
G1 X130.579 Y105.221 E.16144
G1 X130.333 Y105.526
G1 X132.627 Y107.82 E.14433
G1 X132.079 Y107.823
G1 X130.075 Y105.819 E.12605
G1 X129.797 Y106.093
G1 X131.53 Y107.826 E.10901
G1 X130.965 Y107.812
G1 X129.494 Y106.342 E.09248
G1 X129.136 Y106.535
G1 X130.38 Y107.779 E.07826
G1 X129.747 Y107.697
G1 X128.716 Y106.667 E.0648
G1 X128.314 Y106.816
G1 X129.075 Y107.577 E.04784
; WIPE_START
M204 S6000
G1 X128.314 Y106.816 E-.4087
G1 X128.716 Y106.667 E-.16298
G1 X129.067 Y107.017 E-.18832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.685 Y106.551 Z1.16 F42000
G1 X138.19 Y106.459 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126015
G1 F12000
M204 S6000
G1 X137.986 Y106.225 E.00234
; LINE_WIDTH: 0.164277
G1 X137.782 Y105.991 E.00369
; LINE_WIDTH: 0.202539
G1 X137.578 Y105.757 E.00505
; LINE_WIDTH: 0.240801
G1 X137.373 Y105.523 E.0064
; WIPE_START
G1 X137.578 Y105.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.345 Y107.578 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.376798
G1 F8119.194
M204 S6000
G1 X139.266 Y107.327 E.0095
G1 X139.11 Y107.202 E.00724
; LINE_WIDTH: 0.334595
G1 F9367.473
G1 X139 Y107.121 E.00426
; LINE_WIDTH: 0.292401
G1 F11068.83
G1 X138.89 Y107.041 E.00361
; LINE_WIDTH: 0.250208
G1 F12000
G1 X138.78 Y106.961 E.00295
; LINE_WIDTH: 0.208014
G1 X138.67 Y106.881 E.0023
; LINE_WIDTH: 0.164773
G1 X138.555 Y106.796 E.00171
; LINE_WIDTH: 0.123071
G1 X138.349 Y106.617 E.00196
; WIPE_START
G1 X138.555 Y106.796 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.94 Y107.318 Z1.16 F42000
G1 X128.66 Y107.474 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.165454
G1 F12000
M204 S6000
G1 X128.449 Y107.319 E.00314
; LINE_WIDTH: 0.178641
G3 X128.214 Y107.037 I.773 J-.886 E.00499
; WIPE_START
G1 X128.449 Y107.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.659 Y107.285 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.237268
G1 F12000
M204 S6000
G1 X134.508 Y107.088 E.00502
G1 X134.528 Y106.936 E.0031
; WIPE_START
G1 X134.508 Y107.088 E-.29009
G1 X134.659 Y107.285 E-.46991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.687 Y104.406 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.128752
G1 F12000
M204 S6000
G1 X136.541 Y104.228 E.0018
; LINE_WIDTH: 0.172515
G1 X136.396 Y104.051 E.00294
; LINE_WIDTH: 0.216395
G1 X136.251 Y103.874 E.00409
G1 X136.254 Y103.841 E.00059
; LINE_WIDTH: 0.186691
G1 X136.271 Y103.728 E.00165
; WIPE_START
G1 X136.254 Y103.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.426 Y99.106 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.198583
G1 F12000
M204 S6000
G1 X138.754 Y98.76 E.01194
M204 S10000
G1 X139.49 Y99.376 F42000
; LINE_WIDTH: 0.32981
G1 F9533.637
M204 S6000
G1 X139.255 Y99.085 E.0115
G1 X138.861 Y98.761 E.01569
; WIPE_START
G1 X139.255 Y99.085 E-.43852
G1 X139.49 Y99.376 E-.32148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.418 Y99.542 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121224
G1 F12000
M204 S6000
G1 X133.309 Y99.455 E.00097
; LINE_WIDTH: 0.155357
G3 X133.093 Y99.241 I.418 J-.636 E.00332
; WIPE_START
G1 X133.2 Y99.368 E-.41257
G1 X133.309 Y99.455 E-.34743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.972 Y100.206 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.187458
G1 F12000
M204 S6000
G2 X133.819 Y99.927 I-2.96 J1.445 E.00462
M204 S10000
G1 X133.915 Y100.562 F42000
; LINE_WIDTH: 0.114025
G1 F12000
M204 S6000
G3 X133.83 Y100.704 I-2.693 J-1.51 E.00102
; WIPE_START
G1 X133.915 Y100.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.484 Y102.238 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121245
G1 F12000
M204 S6000
G3 X132.403 Y102.283 I-.12 J-.123 E.00065
; LINE_WIDTH: 0.132481
G1 X132.217 Y102.143 E.00191
; WIPE_START
G1 X132.403 Y102.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.604 Y103.358 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220183
G1 F12000
M204 S6000
G1 X131.465 Y103.18 E.00414
; LINE_WIDTH: 0.174864
G1 X131.325 Y103.002 E.00297
; LINE_WIDTH: 0.129544
G1 X131.185 Y102.823 E.00179
M204 S10000
G1 X130.776 Y101.984 F42000
; LINE_WIDTH: 0.227245
G1 F12000
M204 S6000
G1 X130.613 Y101.78 E.00497
; LINE_WIDTH: 0.179101
G1 X130.45 Y101.577 E.00354
; LINE_WIDTH: 0.130957
G1 X130.287 Y101.374 E.0021
; WIPE_START
G1 X130.45 Y101.577 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.412 Y101.337 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.125987
G1 F12000
M204 S6000
G1 X131.289 Y101.185 E.00146
; LINE_WIDTH: 0.164584
G1 X131.164 Y101.031 E.00237
; LINE_WIDTH: 0.197009
G1 X131.108 Y100.956 E.00147
; LINE_WIDTH: 0.221178
G1 X131.051 Y100.882 E.00172
G1 X131.075 Y100.734 E.00276
; WIPE_START
G1 X131.051 Y100.882 E-.46744
G1 X131.108 Y100.956 E-.29256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.76 Y100.416 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.235332
G1 F12000
M204 S6000
G1 X129.604 Y100.229 E.00486
; LINE_WIDTH: 0.196387
G1 X129.449 Y100.043 E.00378
; LINE_WIDTH: 0.149496
G2 X129.113 Y99.68 I-2.597 J2.077 E.00505
; LINE_WIDTH: 0.171284
G1 X128.895 Y99.497 E.0036
; LINE_WIDTH: 0.202272
G2 X128.791 Y99.428 I-.666 J.88 E.00203
M204 S10000
G1 X128.261 Y99.363 F42000
; LINE_WIDTH: 0.186928
G1 F12000
M204 S6000
G1 X128.045 Y99.204 E.00388
G3 X127.964 Y99.066 I.391 J-.322 E.00232
; WIPE_START
G1 X128.045 Y99.204 E-.28318
G1 X128.261 Y99.363 E-.47682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.677 Y104.567 Z1.16 F42000
G1 X122.435 Y104.794 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X123.263 Y104.802 I.419 J-.424 E.03762
G3 X124.234 Y104.005 I4.098 J3.996 E.05169
G3 X125.558 Y103.92 I.785 J1.875 E.0555
G3 X127.086 Y106.491 I-.631 J2.115 E.13495
G3 X126.566 Y107.499 I-2.229 J-.513 E.04705
G3 X124.909 Y107.979 I-1.268 J-1.278 E.07386
G3 X123.547 Y107.181 I.169 J-1.851 E.06697
G2 X123.092 Y106.616 I-3.987 J2.745 E.02979
G2 X122.739 Y106.478 I-.539 J.853 E.01566
G2 X122.335 Y106.735 I.227 J.802 E.01996
G2 X122.202 Y107.413 I1.559 J.658 E.02857
G3 X122.065 Y107.956 I-2.751 J-.408 E.02305
G3 X121.599 Y108.04 I-.353 J-.626 E.01978
G3 X117.962 Y107.197 I.568 J-10.719 E.15408
G3 X117.319 Y106.815 I1.427 J-3.135 E.03076
G3 X117.052 Y106.277 I.437 J-.553 E.0255
G3 X117.507 Y105.707 I.681 J.077 E.0316
G2 X118.136 Y105.242 I-.366 J-1.154 E.03272
G2 X118.258 Y104.5 I-1.685 J-.656 E.03111
G2 X118.062 Y100.923 I-21.482 J-.616 E.14724
G2 X117.447 Y100.174 I-1.204 J.361 E.04083
G3 X117.005 Y99.657 I.556 J-.923 E.02843
G3 X116.986 Y99.266 I.529 J-.222 E.01642
G3 X117.482 Y98.714 I.686 J.119 E.0321
G1 X117.623 Y98.654 E.00631
G3 X120.289 Y98.353 I2.361 J8.97 E.11054
G1 X120.938 Y98.358 E.02663
G3 X123.028 Y98.549 I-.202 J13.77 E.08626
G3 X123.879 Y99.202 I-.172 J1.106 E.04594
G3 X123.369 Y100.131 I-.704 J.218 E.04858
G2 X122.735 Y100.369 I1.993 J6.285 E.02781
G2 X122.394 Y100.712 I.334 J.673 E.02022
G2 X122.294 Y101.017 I1.365 J.618 E.01321
G2 X122.21 Y104.047 I15.571 J1.945 E.12464
G1 X122.271 Y104.497 E.01864
G2 X122.394 Y104.749 I.582 J-.127 E.01165
; WIPE_START
M204 S6000
G1 X122.501 Y104.861 E-.05855
G1 X122.673 Y104.937 E-.07175
G1 X122.843 Y104.973 E-.06574
G1 X123.012 Y104.935 E-.0659
G1 X123.18 Y104.862 E-.06964
G1 X123.263 Y104.802 E-.03884
G1 X123.775 Y104.329 E-.26483
G1 X124.043 Y104.14 E-.12476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.007 Y98.751 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X123.71 Y99.455 E.04426
G1 X123.531 Y99.827
G1 X122.367 Y98.663 E.07322
G1 X121.755 Y98.603
G1 X123.145 Y99.993 E.08745
G1 X122.743 Y100.142
G1 X121.172 Y98.571 E.09884
G1 X120.609 Y98.56
G1 X122.4 Y100.351 E.11265
G1 X122.189 Y100.691
G1 X120.061 Y98.563 E.13388
G1 X119.513 Y98.566
G1 X122.081 Y101.134 E.16157
G1 X122.028 Y101.633
G1 X118.996 Y98.6 E.19077
G1 X118.511 Y98.667
G1 X121.996 Y102.152 E.21921
G1 X121.985 Y102.692
G1 X118.054 Y98.762 E.24727
G1 X117.615 Y98.874
G1 X121.988 Y103.246 E.27505
G1 X121.991 Y103.801
G1 X117.272 Y99.083 E.29682
G1 X117.184 Y99.545
G1 X122.062 Y104.424 E.30688
; WIPE_START
M204 S6000
G1 X120.648 Y103.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.996 Y104.049 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X126.941 Y105.994 E.12235
G1 X126.879 Y106.484
G1 X124.517 Y104.122 E.14861
G1 X124.151 Y104.307
G1 X126.726 Y106.882 E.16199
G1 X126.524 Y107.231
G1 X123.837 Y104.544 E.16902
G1 X123.55 Y104.809
G1 X126.236 Y107.494 E.16894
G1 X125.892 Y107.702
G1 X123.242 Y105.053 E.16668
G1 X122.807 Y105.169
G1 X125.446 Y107.808 E.16599
G1 X124.848 Y107.761
G1 X118.308 Y101.221 E.41139
G1 X118.367 Y101.832
G1 X122.832 Y106.297 E.28087
G1 X122.398 Y106.413
G1 X118.411 Y102.426 E.25081
G1 X118.433 Y103
G1 X122.133 Y106.701 E.23278
G1 X122.028 Y107.147
G1 X118.455 Y103.574 E.22475
G1 X118.454 Y104.124
G1 X121.953 Y107.623 E.22013
G1 X121.611 Y107.832
G1 X118.452 Y104.673 E.19872
G1 X118.373 Y105.146
G1 X121.02 Y107.793 E.16652
M73 P96 R0
G1 X120.379 Y107.704
G1 X118.184 Y105.508 E.13811
G1 X117.874 Y105.749
G1 X119.667 Y107.543 E.11284
G1 X118.901 Y107.328
G1 X117.508 Y105.935 E.08766
; WIPE_START
M204 S6000
G1 X118.901 Y107.328 E-.74886
G1 X118.929 Y107.336 E-.01114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.011 Y107.635 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113213
G1 F12000
M204 S6000
G1 X119.727 Y107.484 E.00195
; WIPE_START
G1 X120.011 Y107.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.431 Y107.648 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.127456
G1 F12000
M204 S6000
G1 X124.317 Y107.566 E.00108
; LINE_WIDTH: 0.168603
G1 X124.203 Y107.483 E.00174
; LINE_WIDTH: 0.206814
G3 X123.824 Y107.117 I2.517 J-2.984 E.00884
; LINE_WIDTH: 0.185595
G1 X123.606 Y106.868 E.00474
; LINE_WIDTH: 0.132341
G1 X123.385 Y106.617 E.00276
G2 X123.213 Y106.443 I-1.095 J.913 E.00202
; LINE_WIDTH: 0.139344
G1 X123.108 Y106.368 E.00117
; LINE_WIDTH: 0.183485
G1 X122.992 Y106.285 E.00201
; LINE_WIDTH: 0.214189
G1 X122.898 Y106.23 E.0019
; WIPE_START
G1 X122.992 Y106.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.905 Y105.592 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.319112
G1 F9927.397
M204 S6000
G1 X126.754 Y105.389 E.00748
; LINE_WIDTH: 0.354064
G1 F8747.098
G1 X126.602 Y105.186 E.00849
; LINE_WIDTH: 0.389015
G1 F7817.636
G1 X126.451 Y104.983 E.0095
; LINE_WIDTH: 0.413292
G1 F7280.303
G2 X125.823 Y104.383 I-2.76 J2.259 E.0351
; LINE_WIDTH: 0.352509
G1 F8793.588
G1 X125.61 Y104.229 E.00876
; LINE_WIDTH: 0.323356
G1 F9767.355
G1 X125.398 Y104.075 E.00788
; WIPE_START
G1 X125.61 Y104.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.734 Y105.242 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.16974
G1 F12000
M204 S6000
G1 X122.596 Y105.158 E.00202
; LINE_WIDTH: 0.151961
G1 X122.52 Y105.105 E.00098
; LINE_WIDTH: 0.121906
G1 X122.443 Y105.053 E.00066
M204 S10000
G1 X122.188 Y104.798 F42000
; LINE_WIDTH: 0.129602
G1 F12000
M204 S6000
G1 X122.11 Y104.685 E.00108
; LINE_WIDTH: 0.175038
G1 X122.033 Y104.573 E.00179
; LINE_WIDTH: 0.199228
G1 X122.072 Y104.414 E.0026
; WIPE_START
G1 X122.033 Y104.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.561 Y98.9 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.117836
G1 F12000
M204 S6000
G1 X117.45 Y98.984 E.00092
; WIPE_START
G1 X117.561 Y98.9 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.384 Y106.488 Z1.16 F42000
G1 X118.46 Y107.188 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.112132
G1 F12000
M204 S6000
G1 X118.421 Y107.164 E.00027
; LINE_WIDTH: 0.136753
G1 X118.337 Y107.108 E.00088
; LINE_WIDTH: 0.175478
G1 X118.253 Y107.052 E.00133
; LINE_WIDTH: 0.214203
G1 X118.17 Y106.995 E.00177
; LINE_WIDTH: 0.252929
G1 X118.086 Y106.939 E.00222
; LINE_WIDTH: 0.291881
G1 F11093.651
G1 X117.978 Y106.859 E.00355
; LINE_WIDTH: 0.331062
G1 F9489.587
G1 X117.87 Y106.779 E.00415
; LINE_WIDTH: 0.370243
G1 F8290.797
G1 X117.762 Y106.699 E.00475
; LINE_WIDTH: 0.409424
G1 F7360.915
G1 X117.655 Y106.619 E.00535
; LINE_WIDTH: 0.430057
G1 F6950.391
G3 X117.276 Y106.151 I.958 J-1.163 E.02559
; WIPE_START
G1 X117.47 Y106.438 E-.43638
G1 X117.655 Y106.619 E-.32362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.203 Y101.277 Z1.16 F42000
G1 X111.661 Y100.746 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X111.874 Y101.653 I-1.624 J.859 E.03867
G3 X111.252 Y104.983 I-10.798 J-.294 E.13968
G3 X110.762 Y105.872 I-2.375 J-.728 E.04195
G3 X109.985 Y106.221 I-.945 J-1.061 E.03555
G3 X109.103 Y105.817 I-.026 J-1.109 E.04125
G3 X108.791 Y104.818 I1.26 J-.941 E.04381
G3 X109.4 Y101.743 I11.995 J.778 E.12907
G3 X109.881 Y100.716 I3.052 J.802 E.04683
G3 X110.713 Y100.323 I.929 J.888 E.03864
G3 X110.921 Y100.345 I.081 J.232 E.00888
G3 X111.621 Y100.701 I-.153 J1.166 E.03288
; WIPE_START
M204 S6000
G1 X111.717 Y100.837 E-.06323
G1 X111.797 Y101.05 E-.08634
G1 X111.853 Y101.381 E-.12774
G1 X111.874 Y101.653 E-.10341
G1 X111.824 Y102.499 E-.32226
G1 X111.803 Y102.648 E-.05702
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.122 Y99.59 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X107.803 Y98.595 I4.613 J5.873 E.08045
G3 X109.249 Y98.324 I1.858 J5.925 E.06054
G1 X109.872 Y98.285 E.02564
G3 X112.074 Y98.626 I-.255 J8.918 E.09173
G3 X113.555 Y99.361 I-2.679 J7.266 E.06801
G1 X114.078 Y99.692 E.02541
G3 X115.31 Y100.969 I-5.007 J6.064 E.07303
G3 X115.863 Y102.422 I-3.096 J2.01 E.06429
G3 X115.986 Y103.224 I-14.613 J2.647 E.03333
G3 X113.868 Y107.194 I-4.942 J-.086 E.19182
G3 X112.397 Y107.891 I-3.898 J-6.324 E.06697
G3 X109.841 Y108.031 I-1.62 J-6.192 E.10582
G3 X106.928 Y106.92 I.504 J-5.697 E.12964
G1 X106.437 Y106.579 E.02455
G3 X105.244 Y105.085 I4.704 J-4.982 E.07877
G3 X104.789 Y103.273 I4.528 J-2.1 E.07717
G1 X104.749 Y102.875 E.01642
G3 X105.009 Y101.254 I7.277 J.335 E.06754
G3 X105.91 Y99.835 I4.098 J1.605 E.06946
G1 X106.082 Y99.636 E.01082
; WIPE_START
M204 S6000
G1 X107.054 Y98.957 E-.45032
G1 X107.454 Y98.741 E-.17275
G1 X107.786 Y98.602 E-.13694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.871 Y101.44 Z1.16 F42000
G1 X115.451 Y101.673 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X113.112 Y99.334 E.14714
G1 X112.063 Y98.836
G1 X115.65 Y102.423 E.22567
G1 X115.76 Y103.084
G1 X111.326 Y98.65 E.27893
G1 X110.691 Y98.567
G1 X115.751 Y103.627 E.3183
G1 X115.687 Y104.114
G1 X110.079 Y98.506 E.3528
G1 X109.528 Y98.506
G1 X111.276 Y100.255 E.10997
G1 X110.613 Y100.143
G1 X109.021 Y98.551 E.10014
G1 X108.535 Y98.616
G1 X110.178 Y100.259 E.10335
G1 X109.839 Y100.472
G1 X108.089 Y98.722 E.11013
G1 X107.678 Y98.862
G1 X109.596 Y100.78 E.12066
G1 X109.406 Y101.141
G1 X107.313 Y99.049 E.13163
G1 X106.966 Y99.253
G1 X109.258 Y101.545 E.1442
G1 X109.124 Y101.962
G1 X106.632 Y99.471 E.15673
G1 X106.311 Y99.701
G1 X108.999 Y102.389 E.16912
G1 X108.891 Y102.832
G1 X106.044 Y99.986 E.17906
G1 X105.797 Y100.29
G1 X108.79 Y103.283 E.18827
G1 X108.701 Y103.746
G1 X105.568 Y100.613 E.19709
G1 X105.357 Y100.952
G1 X108.643 Y104.239 E.20674
G1 X108.597 Y104.744
G1 X105.199 Y101.346 E.2138
G1 X105.083 Y101.781
G1 X108.664 Y105.362 E.22525
; WIPE_START
M204 S6000
G1 X107.249 Y103.948 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.969 Y100.947 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X115.576 Y104.555 E.22694
G1 X115.422 Y104.952
G1 X112.069 Y101.599 E.21093
G1 X112.046 Y102.127
G1 X115.249 Y105.33 E.20151
G1 X115.04 Y105.673
G1 X112.006 Y102.638 E.19089
G1 X111.938 Y103.122
G1 X114.818 Y106.002 E.1812
G1 X114.572 Y106.308
G1 X111.842 Y103.578 E.17172
G1 X111.746 Y104.033
G1 X114.294 Y106.581 E.16029
G1 X113.996 Y106.835
G1 X111.632 Y104.471 E.14871
G1 X111.497 Y104.887
G1 X113.679 Y107.069 E.13728
G1 X113.319 Y107.26
G1 X111.342 Y105.283 E.12437
G1 X111.162 Y105.655
G1 X112.959 Y107.451 E.11302
G1 X112.575 Y107.619
G1 X110.933 Y105.977 E.10328
G1 X110.625 Y106.22
G1 X112.153 Y107.748 E.09612
G1 X111.677 Y107.824
G1 X110.223 Y106.37 E.0915
G1 X109.685 Y106.383
G1 X111.181 Y107.879 E.09412
G1 X110.649 Y107.899
G1 X105.009 Y102.259 E.3548
G1 X104.961 Y102.762
G1 X110.047 Y107.848 E.31998
G1 X109.416 Y107.769
G1 X105.002 Y103.355 E.27764
G1 X105.097 Y104.001
G1 X108.703 Y107.607 E.22683
G1 X107.724 Y107.18
G1 X105.337 Y104.792 E.15019
; WIPE_START
M204 S6000
G1 X106.751 Y106.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.187 Y102.104 Z1.16 F42000
G1 X115.021 Y100.935 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132931
G1 F12000
M204 S6000
G2 X113.902 Y99.818 I-15.654 J14.562 E.01314
; WIPE_START
G1 X114.745 Y100.63 E-.56226
G1 X115.021 Y100.935 E-.19774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.837 Y106.951 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110649
G1 F12000
M204 S6000
G1 X113.747 Y107.033 E.0007
; WIPE_START
G1 X113.837 Y106.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.868 Y106.629 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.122564
G1 F12000
M204 S6000
G1 X106.73 Y106.515 E.00128
; LINE_WIDTH: 0.155074
G1 X106.591 Y106.4 E.00195
G1 X106.067 Y105.855 E.00819
; LINE_WIDTH: 0.123964
G1 X105.834 Y105.597 E.00254
M204 S10000
G1 X105.401 Y104.728 F42000
; LINE_WIDTH: 0.21735
G1 F12000
M204 S6000
G1 X105.29 Y104.562 E.00359
; LINE_WIDTH: 0.18481
G1 X105.178 Y104.396 E.00285
; WIPE_START
G1 X105.29 Y104.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.962 Y100.955 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.188891
G1 F12000
M204 S6000
G2 X111.99 Y100.81 I-1.319 J-.338 E.00217
; LINE_WIDTH: 0.207027
G1 X111.922 Y100.717 E.00193
; LINE_WIDTH: 0.170862
G1 X111.848 Y100.617 E.00157
; LINE_WIDTH: 0.1579
G1 X111.754 Y100.512 E.00157
G2 X111.353 Y100.178 I-3.471 J3.758 E.00583
; WIPE_START
G1 X111.754 Y100.512 E-.5985
G1 X111.848 Y100.617 E-.1615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.612 Y106.456 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.160831
G1 F12000
M204 S6000
G1 X109.447 Y106.351 E.00225
; LINE_WIDTH: 0.134075
G1 X109.328 Y106.267 E.00123
; LINE_WIDTH: 0.108362
G1 X109.296 Y106.24 E.00023
M204 S10000
G1 X108.878 Y105.823 F42000
; LINE_WIDTH: 0.131301
G1 F12000
M204 S6000
G1 X108.768 Y105.676 E.00149
; LINE_WIDTH: 0.180163
G1 X108.657 Y105.529 E.00252
; LINE_WIDTH: 0.214692
G1 X108.597 Y105.428 E.00207
M204 S10000
G1 X108.61 Y104.731 F42000
; LINE_WIDTH: 0.131855
G1 F12000
M204 S6000
G1 X108.522 Y104.945 E.00189
; WIPE_START
G1 X108.61 Y104.731 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.121 Y106.202 Z1.16 F42000
G1 X98.124 Y106.79 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X98.044 Y107.213 I.699 J.352 E.01791
G2 X98.292 Y109.363 I10.674 J-.144 E.08901
G1 X98.398 Y109.699 E.01447
G2 X99.437 Y110.151 I.899 J-.647 E.04883
G2 X101.853 Y109.936 I-.129 J-15.084 E.09973
G2 X103.04 Y109.195 I-.583 J-2.254 E.05832
G3 X103.932 Y108.242 I11.651 J10.014 E.05365
G3 X105.072 Y108.685 I.386 J.693 E.05729
M73 P97 R0
G3 X105.139 Y109.699 I-1.775 J.628 E.04228
G3 X104.557 Y111.32 I-3.18 J-.228 E.07161
G3 X104.116 Y111.866 I-1.669 J-.896 E.02896
G3 X103.728 Y111.957 I-.351 J-.621 E.0166
G2 X98.683 Y111.743 I-4.214 J39.648 E.20747
G2 X93.945 Y111.924 I.266 J69.021 E.19472
G3 X92.946 Y111.814 I-.262 J-2.221 E.04163
G3 X92.389 Y111.366 I.286 J-.925 E.03005
G3 X92.429 Y110.782 I.532 J-.256 E.02514
G3 X93.027 Y110.438 I1.349 J1.652 E.02845
G2 X93.766 Y109.519 I-.562 J-1.208 E.05015
G2 X93.902 Y107.519 I-13.375 J-1.916 E.08237
G2 X93.719 Y101.377 I-61.788 J-1.227 E.25243
G2 X93.407 Y100.563 I-1.753 J.204 E.03617
G2 X92.67 Y100.089 I-1.36 J1.305 E.0363
G3 X92.212 Y99.196 I.199 J-.666 E.04606
G3 X92.821 Y98.585 I.909 J.298 E.03672
G3 X95.6 Y98.353 I2.321 J11.016 E.11479
G1 X96.304 Y98.36 E.02894
G3 X99.202 Y98.657 I-.135 J15.563 E.11977
G3 X99.77 Y98.948 I-.261 J1.21 E.02649
G3 X99.918 Y99.633 I-.751 J.522 E.02954
G3 X99.488 Y100.039 I-.564 J-.167 E.02545
G2 X98.803 Y100.172 I.733 J5.617 E.02869
G2 X98.454 Y100.452 I.484 J.961 E.01851
G2 X98.055 Y102.202 I3.356 J1.684 E.07442
G2 X98.075 Y103.88 I114.431 J-.502 E.06889
G2 X98.269 Y104.371 I1.273 J-.22 E.02183
G2 X99.039 Y104.588 I.699 J-1.009 E.03344
G2 X100.387 Y103.923 I.093 J-1.512 E.06458
G2 X100.575 Y103.309 I-1.736 J-.865 E.02649
G3 X100.722 Y102.564 I2.668 J.141 E.03127
G3 X101.014 Y102.392 I.348 J.258 E.01429
G3 X101.337 Y102.414 I.123 J.591 E.01347
G3 X101.782 Y102.791 I-.314 J.822 E.0244
G3 X102.282 Y105.039 I-4.387 J2.154 E.09545
G3 X102.321 Y106.381 I-160.997 J5.336 E.05514
G3 X101.926 Y107.589 I-1.769 J.09 E.05337
G3 X101.247 Y108.1 I-2.498 J-2.613 E.03497
G3 X100.627 Y107.532 I.117 J-.75 E.03658
G2 X100.403 Y106.805 I-3.01 J.531 E.03131
G2 X100.172 Y106.528 I-1.404 J.932 E.01483
G2 X99.398 Y106.329 I-.702 J1.127 E.03334
G2 X98.385 Y106.494 I-.14 J2.336 E.04248
G2 X98.153 Y106.738 I.439 J.648 E.01393
; WIPE_START
M204 S6000
G1 X98.062 Y106.981 E-.09858
G1 X98.044 Y107.213 E-.08867
G1 X98.058 Y107.659 E-.16933
G1 X98.106 Y108.236 E-.22013
G1 X98.17 Y108.714 E-.18329
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.422 Y101.185 Z1.16 F42000
G1 X99.673 Y99.679 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X98.784 Y98.79 E.05592
G1 X98.132 Y98.69
G1 X99.305 Y99.863 E.0738
G1 X98.849 Y99.959
G1 X97.507 Y98.617 E.08439
G1 X96.928 Y98.589
G1 X98.477 Y100.138 E.09744
G1 X98.238 Y100.45
G1 X96.349 Y98.561 E.11882
G1 X95.793 Y98.557
G1 X98.079 Y100.843 E.14384
G1 X97.952 Y101.267
G1 X95.239 Y98.554 E.17067
G1 X94.696 Y98.563
G1 X97.879 Y101.746 E.20024
G1 X97.863 Y102.281
G1 X94.17 Y98.588 E.2323
G1 X93.672 Y98.641
G1 X97.865 Y102.835 E.26382
G1 X97.868 Y103.389
G1 X93.201 Y98.722 E.29358
G1 X92.761 Y98.834
G1 X97.889 Y103.961 E.32257
; WIPE_START
M204 S6000
G1 X96.475 Y102.547 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.964 Y102.625 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X101.85 Y103.511 E.05575
G1 X102.017 Y104.23
G1 X100.815 Y103.028 E.07561
G1 X100.736 Y103.5
G1 X102.076 Y104.84 E.08426
G1 X102.097 Y105.412
G1 X100.606 Y103.922 E.09376
G1 X100.383 Y104.249
G1 X102.117 Y105.984 E.10913
G1 X102.112 Y106.53
G1 X100.082 Y104.501 E.12765
G1 X99.717 Y104.687
G1 X102.026 Y106.996 E.14523
G1 X101.848 Y107.369
G1 X99.254 Y104.775 E.1632
G1 X98.689 Y104.762
G1 X100.293 Y106.366 E.1009
G1 X99.515 Y106.138
G1 X92.475 Y99.099 E.44281
; WIPE_START
M204 S6000
G1 X93.89 Y100.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.843 Y101.018 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X98.971 Y106.146 E.32257
G1 X98.52 Y106.247
G1 X93.939 Y101.666 E.28814
G1 X93.982 Y102.26
G1 X98.159 Y106.437 E.26274
G1 X97.926 Y106.755
G1 X94.022 Y102.852 E.24556
G1 X94.044 Y103.425
G1 X97.854 Y107.235 E.23968
G1 X97.871 Y107.803
G1 X94.065 Y103.998 E.2394
G1 X94.087 Y104.57
G1 X97.936 Y108.42 E.24216
G1 X98.019 Y109.055
G1 X94.096 Y105.131 E.24681
G1 X94.096 Y105.683
G1 X98.294 Y109.88 E.26404
; WIPE_START
M204 S6000
G1 X96.879 Y108.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.313 Y106.386 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X101.567 Y107.639 E.07888
; WIPE_START
M204 S6000
G1 X100.313 Y106.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.019 Y108.437 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X104.967 Y109.385 E.05965
G1 X104.914 Y109.884
G1 X103.743 Y108.713 E.07363
G1 X103.48 Y109.001
G1 X104.814 Y110.335 E.08395
G1 X104.658 Y110.73
G1 X103.22 Y109.292 E.09045
G1 X102.939 Y109.563
G1 X104.458 Y111.082 E.09555
G1 X104.246 Y111.421
G1 X102.631 Y109.807 E.10155
G1 X102.266 Y109.993
G1 X103.983 Y111.71 E.10802
G1 X103.451 Y111.729
G1 X101.858 Y110.137 E.10018
G1 X101.38 Y110.21
G1 X102.846 Y111.676 E.09224
G1 X102.251 Y111.632
G1 X100.889 Y110.27 E.08568
G1 X100.383 Y110.316
G1 X101.66 Y111.592 E.08031
G1 X101.086 Y111.57
G1 X99.852 Y110.336 E.07763
G1 X99.312 Y110.347
G1 X100.519 Y111.554 E.07593
G1 X99.959 Y111.546
G1 X98.466 Y110.052 E.09395
; WIPE_START
M204 S6000
G1 X99.88 Y111.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.407 Y111.545 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X94.096 Y106.234 E.33408
G1 X94.096 Y106.786
G1 X98.854 Y111.544 E.29933
G1 X98.306 Y111.546
G1 X94.096 Y107.337 E.2648
G1 X94.096 Y107.888
G1 X97.758 Y111.551 E.23039
G1 X97.218 Y111.562
G1 X94.074 Y108.418 E.1978
G1 X94.033 Y108.928
G1 X96.682 Y111.577 E.16665
G1 X96.148 Y111.594
G1 X93.977 Y109.424 E.13653
G1 X93.853 Y109.851
G1 X95.625 Y111.623 E.11148
G1 X95.102 Y111.652
G1 X93.656 Y110.205 E.091
G1 X93.362 Y110.463
G1 X94.579 Y111.68 E.0766
G1 X94.057 Y111.709
G1 X93.015 Y110.667 E.06554
G1 X92.658 Y110.862
G1 X93.521 Y111.725 E.0543
; WIPE_START
M204 S6000
G1 X92.658 Y110.862 E-.46383
G1 X93.015 Y110.667 E-.15444
G1 X93.279 Y110.931 E-.14173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.237 Y110.422 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153632
G1 F12000
M204 S6000
G3 X99.092 Y110.351 I.807 J-1.831 E.00171
; LINE_WIDTH: 0.120165
G1 X99.032 Y110.319 E.00047
; WIPE_START
G1 X99.092 Y110.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.3 Y107.852 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.373321
G1 F8209.328
M204 S6000
G1 X101.051 Y107.63 E.01193
G1 X100.733 Y107.21 E.01883
; WIPE_START
G1 X101.051 Y107.63 E-.46526
G1 X101.3 Y107.852 E-.29474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.516 Y102.743 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.115769
G1 F12000
M204 S6000
G1 X101.232 Y102.594 E.00203
M204 S10000
G1 X101.673 Y103.005 F42000
; LINE_WIDTH: 0.164739
G1 F12000
M204 S6000
G2 X101.261 Y102.583 I-2.255 J1.791 E.00705
; WIPE_START
G1 X101.463 Y102.768 E-.35322
G1 X101.673 Y103.005 E-.40678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.61 Y104.841 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.122165
G1 F12000
M204 S6000
G3 X98.301 Y104.621 I2.432 J-3.722 E.00269
M204 S10000
G1 X98.699 Y104.752 F42000
; LINE_WIDTH: 0.142536
G1 F12000
M204 S6000
G1 X98.469 Y104.817 E.00225
M204 S10000
G1 X97.831 Y104.179 F42000
; LINE_WIDTH: 0.146452
G1 F12000
M204 S6000
G1 X97.9 Y103.95 E.00236
M204 S10000
G1 X98.036 Y104.356 F42000
; LINE_WIDTH: 0.12123
G1 F12000
M204 S6000
G1 X97.973 Y104.27 E.00075
; LINE_WIDTH: 0.160115
G3 X97.813 Y104.038 I2.303 J-1.759 E.00322
; WIPE_START
G1 X97.973 Y104.27 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.749 Y99.42 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.25017
G1 F12000
M204 S6000
G2 X99.504 Y99.09 I-1.102 J.561 E.00894
G1 X99.173 Y98.839 E.00902
; WIPE_START
G1 X99.504 Y99.09 E-.38268
G1 X99.749 Y99.42 E-.37732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.702 Y98.861 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.110702
G1 F12000
M204 S6000
G1 X92.603 Y98.951 E.00077
; WIPE_START
G1 X92.702 Y98.861 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.228 Y100.159 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.124547
G1 F12000
M204 S6000
G1 X93.044 Y100.003 E.00177
; LINE_WIDTH: 0.166893
G1 X92.937 Y99.929 E.0016
; LINE_WIDTH: 0.214381
G1 X92.829 Y99.854 E.00231
; LINE_WIDTH: 0.26187
G1 X92.721 Y99.78 E.00302
; LINE_WIDTH: 0.319173
G1 F9925.068
G3 X92.366 Y99.395 I.584 J-.894 E.01562
; WIPE_START
G1 X92.546 Y99.634 E-.43037
G1 X92.613 Y99.705 E-.14088
G1 X92.721 Y99.78 E-.18875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.916 Y100.945 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.167991
G1 F12000
M204 S6000
G1 X93.804 Y100.779 E.00247
; LINE_WIDTH: 0.15152
G1 X93.741 Y100.692 E.00113
; LINE_WIDTH: 0.121763
G1 X93.677 Y100.605 E.00076
M204 S10000
G1 X93.893 Y100.792 F42000
; LINE_WIDTH: 0.141832
G1 F12000
M204 S6000
G1 X93.83 Y101.032 E.00231
; WIPE_START
G1 X93.893 Y100.792 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.091 Y102.644 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.142056
G1 F12000
M204 S6000
G1 X94.006 Y102.869 E.00224
; WIPE_START
G1 X94.091 Y102.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.311 Y110.237 Z1.16 F42000
G1 X93.163 Y111.687 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.194193
G1 F12000
M204 S6000
G1 X92.993 Y111.564 E.0032
; LINE_WIDTH: 0.234624
G1 X92.824 Y111.441 E.00417
; LINE_WIDTH: 0.261871
G3 X92.516 Y111.114 I1.439 J-1.666 E.01037
; WIPE_START
G1 X92.824 Y111.441 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.445 Y111.013 Z1.16 F42000
G1 X104.639 Y110.777 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121623
G1 F12000
M204 S6000
G3 X104.549 Y110.897 I-.833 J-.528 E.00105
; WIPE_START
G1 X104.639 Y110.777 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.969 Y109.014 Z1.16 F42000
G1 Z.76
M73 P98 R0
G1 E.8 F1800
; LINE_WIDTH: 0.287589
G1 F11302.954
M204 S6000
G1 X104.824 Y108.821 E.00628
; LINE_WIDTH: 0.322859
G1 F9785.844
G2 X104.322 Y108.331 I-1.407 J.941 E.02116
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F9785.844
G1 X104.558 Y108.512 E-.32004
G1 X104.678 Y108.627 E-.17948
G1 X104.824 Y108.821 E-.26048
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 941
M625
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.26 F900 ; lower z a little
G1 X0 Y131.21 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z100.76 F600
    G1 Z98.76

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

