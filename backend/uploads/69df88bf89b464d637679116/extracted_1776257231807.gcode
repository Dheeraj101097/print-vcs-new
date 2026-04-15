; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 1m 52s; total estimated time: 9m 3s
; total layer number: 4
; total filament length [mm] : 169.37
; total filament volume [cm^3] : 407.38
; total filament weight [g] : 0.51
; model label id: 671,839
; filament_density: 1.24,1.24,1.24,1.24,1.24,1.24
; filament_diameter: 1.75,1.75,1.75,1.75,1.75,1.75
; max_z_height: 1.04
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
; different_settings_to_system = enable_support;inner_wall_speed;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;support_style;;;;;;;
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
; enable_support = 1
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
; filament_colour = #FFFFFF;#FFFF00;#FF0000;#080808;#FF8000;#FFFFFF
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
; flush_volumes_matrix = 0,326,354,169,339,152,399,0,348,212,223,399,678,632,0,185,408,678,639,542,484,0,621,639,549,406,224,202,0,549,152,326,354,169,339,0
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
; inner_wall_speed = 230
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
; skeleton_infill_density = 10%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 10%
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
; sparse_infill_density = 10%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
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
; support_style = tree_slim
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
M73 P0 R9
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
M73 P1 R8
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
G1 E5 F200
M104 S220
G92 E0
M73 P16 R7
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P19 R7
G1 X-48.2 F3000
M73 P21 R7
G1 X-28.5 F30000 ;wipe and shake
M73 P22 R7
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
M73 P25 R6
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
    
M73 P26 R6
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
M73 P27 R6
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
M73 P75 R2
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
M73 P76 R2
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
M73 P77 R2
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
    G29 A1 X125.361 Y90.1346 I40.8929 J77.3672
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
; layer num/total_layer_count: 1/4
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 671
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
G1 X161.733 Y100.757 F42000
M204 S6000
M73 P78 R1
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X163.423 Y100.751 I.798 J-14.202 E.06299
G1 X163.43 Y92.092 E.32251
G2 X163.874 Y92.092 I.222 J-27.983 E.01653
G1 X163.88 Y92.259 E.00622
G1 X163.88 Y100.751 E.31629
G2 X165.496 Y100.757 I.855 J-13.242 E.06023
G1 X165.502 Y92.093 E.3227
G2 X165.948 Y92.093 I.224 J-32.634 E.01659
G1 X165.954 Y100.183 E.30133
G2 X165.932 Y101.347 I46.179 J1.445 E.04334
G1 X161.298 Y101.347 E.1726
M73 P79 R1
G2 X161.276 Y100.183 I-46.201 J.281 E.04334
G1 X161.282 Y92.093 E.30133
G2 X161.728 Y92.093 I.221 J-32.634 E.01659
G1 X161.733 Y100.697 E.32047
; WIPE_START
G1 X162.768 Y100.779 E-.3945
G1 X163.423 Y100.751 E-.2492
G1 X163.424 Y100.445 E-.1163
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 671
M625
; object ids of layer 1 start: 671,839
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128.818 F18000 ; move to safe pos
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


; object ids of this layer1 end: 671,839
M625
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
G1 X161.523 Y101.048 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.166688
G1 F3000
M204 S500
G1 X162.388 Y101.063 E.00873
G3 X164.503 Y101.062 I1.069 J29.068 E.02133
G1 X165.707 Y101.048 E.01214
; WIPE_START
G1 X164.503 Y101.062 E-.45756
G1 X163.707 Y101.045 E-.30245
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.848 Y108.676 Z.6 F42000
G1 X163.899 Y111.482 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X165.928 Y111.516 I1.62 J-36.401 E.0756
G1 X165.928 Y112.08 E.021
G1 X161.301 Y112.08 E.17235
G1 X161.301 Y111.516 E.021
G2 X163.442 Y111.483 I.443 J-40.339 E.07976
G1 X163.442 Y103.895 E.28261
G2 X161.301 Y103.862 I-1.698 J40.306 E.07976
G1 X161.301 Y103.269 E.02209
G1 X165.928 Y103.269 E.17235
G1 X165.928 Y103.862 E.02209
G2 X163.899 Y103.896 I-.409 J36.461 E.0756
M73 P80 R1
G1 X163.899 Y111.422 E.28034
; WIPE_START
G1 X165.019 Y111.515 E-.4268
G1 X165.895 Y111.516 E-.3332
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X165.7 Y111.798 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16204
G1 F3000
M204 S500
G1 X164.595 Y111.794 E.01073
G2 X162.28 Y111.798 I-1.103 J35.513 E.02248
G1 X161.53 Y111.798 E.00728
; WIPE_START
G1 X162.28 Y111.798 E-.28502
G1 X163.53 Y111.78 E-.47498
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.724 Y104.364 Z.6 F42000
G1 X161.53 Y103.566 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.19121
G1 F3000
M204 S500
G1 X162.28 Y103.566 E.00906
G2 X164.594 Y103.57 I1.212 J-35.509 E.02797
G1 X165.7 Y103.566 E.01336
; WIPE_START
G1 X164.594 Y103.57 E-.4201
G1 X163.7 Y103.586 E-.3399
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X164.413 Y111.185 Z.6 F42000
G1 X165.42 Y121.91 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X165.496 Y121.63 I-.476 J-.28 E.01094
G1 X165.502 Y114.022 E.28339
G2 X165.948 Y114.022 I.223 J-32.596 E.01658
G1 X165.954 Y114.199 E.00661
G1 X165.953 Y121.614 E.27616
G3 X165.625 Y122.498 I-1.196 J.059 E.03611
G3 X164.7 Y122.746 I-.8 J-1.135 E.03641
G1 X162.45 Y122.746 E.08381
G3 X161.276 Y121.613 I-.069 J-1.103 E.06836
G1 X161.282 Y114.022 E.28275
G2 X161.727 Y114.022 I.223 J-32.596 E.01658
G1 X161.733 Y121.629 E.28334
G2 X162.278 Y122.189 I.533 J.027 E.03265
G2 X164.98 Y122.182 I1.142 J-73.386 E.10065
G2 X165.387 Y121.96 I-.036 J-.551 E.01781
M204 S6000
G1 X165.599 Y122.109 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13261
G1 F3000
M204 S500
G1 X165.547 Y122.19 E.0007
G3 X164.847 Y122.466 I-.664 J-.657 E.00566
G3 X162.217 Y122.455 I-1.09 J-50.39 E.01923
G1 X162.131 Y122.441 E.00064
G3 X161.995 Y122.396 I.428 J-1.552 E.00105
; WIPE_START
G1 X162.131 Y122.441 E-.05432
G1 X162.217 Y122.455 E-.03305
G1 X162.716 Y122.471 E-.18986
G1 X163.986 Y122.468 E-.48277
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.304 Y125.612 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X162.812 Y125.299 I-.555 J.33 E.02254
G2 X161.863 Y125.556 I-.257 J.934 E.0384
G2 X161.733 Y125.977 I.726 J.453 E.0166
G1 X161.728 Y133.683 E.28703
G2 X161.282 Y133.683 I-.225 J32.492 E.01661
G1 X161.276 Y126.266 E.27627
G3 X161.365 Y125.341 I2.834 J-.194 E.03477
G3 X162.271 Y124.679 I.958 J.36 E.04423
G3 X162.642 Y124.664 I.287 J2.438 E.01382
G3 X163.56 Y125.032 I.042 J1.226 E.03796
G3 X163.851 Y125.995 I-1.306 J.919 E.0381
G1 X163.851 Y132.538 E.24368
G2 X164.651 Y133.308 I.743 J.029 E.04674
G2 X165.389 Y132.968 I.043 J-.879 E.03146
G2 X165.496 Y132.539 I-.926 J-.458 E.01662
G1 X165.502 Y124.83 E.28713
G2 X165.948 Y124.83 I.223 J-32.322 E.01662
G1 X165.953 Y132.526 E.28663
G3 X165.468 Y133.629 I-1.318 J.078 E.04662
G3 X163.808 Y133.604 I-.809 J-1.385 E.06499
G3 X163.403 Y132.768 I.682 J-.846 E.03574
G1 X163.393 Y125.982 E.25277
G2 X163.332 Y125.665 I-.644 J-.039 E.01213
M204 S6000
G1 X163.5 Y125.443 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116626
G1 F3000
M204 S500
G2 X163.416 Y125.307 I-.96 J.501 E.00096
; LINE_WIDTH: 0.158599
G2 X163.298 Y125.183 I-.869 J.708 E.00161
; LINE_WIDTH: 0.197747
G2 X161.801 Y125.2 I-.736 J1.101 E.02008
G1 X161.697 Y125.311 E.00192
; LINE_WIDTH: 0.143724
G1 X161.62 Y125.434 E.00119
; LINE_WIDTH: 0.112931
G2 X161.571 Y125.544 I1.064 J.537 E.00069
; WIPE_START
G1 X161.62 Y125.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.64 Y132.794 Z.6 F42000
G1 X163.715 Y133.068 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.128615
G1 F3000
M204 S500
M73 P81 R1
G2 X164.324 Y133.538 I.801 J-.406 E.00555
G1 X164.443 Y133.561 E.00084
G2 X165.51 Y133.231 I.224 J-1.167 E.00812
; WIPE_START
G1 X165.315 Y133.403 E-.09876
G1 X165.074 Y133.515 E-.10096
G1 X164.789 Y133.57 E-.11031
G1 X164.443 Y133.561 E-.13169
G1 X164.324 Y133.538 E-.04587
G1 X164.099 Y133.454 E-.09134
G1 X163.935 Y133.348 E-.07422
G1 X163.821 Y133.234 E-.0611
G1 X163.757 Y133.133 E-.04574
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X164.924 Y140.675 Z.6 F42000
G1 X165.496 Y144.375 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X163.289 Y144.375 I-1.107 J-23.82 E.08226
G1 X163.288 Y137.863 E.24255
G3 X163.346 Y136.805 I7.528 J-.117 E.03948
G1 X163.372 Y136.708 E.00374
G3 X163.855 Y136.318 I.674 J.339 E.02384
G1 X164.34 Y136.29 E.01812
G3 X164.848 Y136.294 I.217 J5.165 E.01893
G3 X165.497 Y137.081 I-.043 J.696 E.04262
G1 X165.496 Y144.315 E.26942
; WIPE_START
G1 X164.393 Y144.406 E-.42088
G1 X163.501 Y144.381 E-.33912
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X162.874 Y136.985 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X163.097 Y136.311 E.02642
G3 X163.756 Y135.755 I.831 J.316 E.03354
G3 X164.283 Y135.752 I.294 J6.38 E.01965
G3 X165.247 Y135.754 I.453 J12.929 E.03591
G3 X165.929 Y136.514 I-.11 J.785 E.04131
G3 X165.954 Y137.098 I-7.745 J.62 E.02176
G1 X165.954 Y143.841 E.25115
G2 X165.931 Y144.965 I37.364 J1.301 E.0419
G1 X161.301 Y144.965 E.17245
G1 X161.301 Y144.408 E.02073
G2 X162.832 Y144.375 I.131 J-28.9 E.05702
G1 X162.831 Y137.915 E.24061
G2 X162.417 Y136.93 I-1.294 J-.035 E.04101
G2 X161.886 Y136.509 I-2.163 J2.179 E.02532
G2 X161.301 Y136.325 I-.961 J2.035 E.02291
G1 X161.301 Y135.796 E.0197
G3 X162.398 Y136.255 I-.201 J2.018 E.04496
G1 X162.548 Y136.417 E.0082
G1 X162.844 Y136.933 E.02215
M204 S6000
G1 X163.05 Y137.264 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.114923
G1 F3000
M204 S500
G1 X163.03 Y137.361 E.00058
G2 X163.04 Y137.514 I.261 J.061 E.00091
; WIPE_START
G1 X163.03 Y137.361 E-.46158
G1 X163.05 Y137.264 E-.29842
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X163.429 Y136.248 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.114665
G1 F3000
M204 S500
G3 X163.521 Y136.161 I.973 J.935 E.00074
; LINE_WIDTH: 0.136364
G3 X163.749 Y136.048 I.32 J.356 E.00197
G3 X164.283 Y136.023 I.377 J2.33 E.00408
G1 X164.877 Y136.024 E.00452
G1 X165.051 Y136.041 E.00133
; LINE_WIDTH: 0.182247
G1 X165.196 Y136.064 E.00167
; LINE_WIDTH: 0.236985
G3 X165.432 Y136.173 I-.097 J.519 E.00416
G1 X165.479 Y136.215 E.001
; LINE_WIDTH: 0.211789
G3 X165.584 Y136.354 I-.703 J.639 E.00239
; LINE_WIDTH: 0.165496
G3 X165.64 Y136.473 I-1.768 J.903 E.00131
; LINE_WIDTH: 0.119044
G1 X165.682 Y136.617 E.00093
; WIPE_START
G1 X165.64 Y136.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.994 Y136.276 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109117
G1 F3000
M204 S500
G2 X161.529 Y136.106 I-1.008 J2.043 E.00267
; WIPE_START
G1 X161.741 Y136.17 E-.33956
G1 X161.994 Y136.276 E-.42044
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.573 Y143.896 Z.6 F42000
G1 X161.53 Y144.686 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.160064
G1 F3000
M204 S500
G3 X163.976 Y144.683 I1.326 J69.988 E.02336
G1 X165.707 Y144.666 E.01652
; WIPE_START
G1 X163.976 Y144.683 E-.65757
G1 X163.707 Y144.678 E-.10243
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X162.612 Y152.231 Z.6 F42000
G1 X162.15 Y155.412 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X161.733 Y154.539 I.47 J-.761 E.03809
G1 X161.733 Y148.412 E.22821
G3 X162.609 Y147.415 I.88 J-.111 E.05586
G3 X164.618 Y147.415 I1.007 J531.932 E.07482
G3 X164.859 Y147.443 I-.001 J1.042 E.00908
G3 X165.497 Y148.412 I-.245 J.855 E.04706
G1 X165.494 Y154.663 E.2328
G3 X164.621 Y155.544 I-.855 J.026 E.05169
G1 X162.491 Y155.537 E.07931
G3 X162.202 Y155.442 I.129 J-.885 E.01138
; WIPE_START
G1 X161.955 Y155.261 E-.11638
G1 X161.822 Y155.054 E-.09369
G1 X161.773 Y154.927 E-.05178
G1 X161.745 Y154.779 E-.057
G1 X161.733 Y154.539 E-.0914
G1 X161.733 Y153.618 E-.34975
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X165.347 Y146.999 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G3 X165.931 Y147.889 I-.385 J.89 E.042
G3 X165.954 Y148.466 I-8.181 J.607 E.02151
G1 X165.953 Y154.567 E.22724
G3 X165.878 Y155.43 I-3.795 J.101 E.03232
G3 X164.915 Y156.116 I-.906 J-.252 E.04763
G1 X162.317 Y156.116 E.09674
G3 X161.3 Y155.155 I-.048 J-.967 E.05821
G3 X161.276 Y154.567 I11.686 J-.77 E.02194
G1 X161.276 Y148.466 E.22724
G3 X161.385 Y147.507 I3.123 J-.131 E.0361
G3 X162.315 Y146.918 I.865 J.336 E.04389
G1 X163.205 Y146.918 E.03315
G1 X164.985 Y146.919 E.06632
G3 X165.291 Y146.977 I-.023 J.969 E.01162
M204 S6000
G1 X165.076 Y147.214 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.189301
G1 F3000
M204 S500
G3 X165.471 Y147.457 I-.187 J.747 E.00562
; LINE_WIDTH: 0.174689
G3 X165.571 Y147.604 I-.493 J.445 E.00191
G1 X165.603 Y147.668 E.00078
; LINE_WIDTH: 0.123017
G3 X165.651 Y147.79 I-1.535 J.669 E.00085
G1 X165.673 Y147.875 E.00057
M204 S6000
G1 X165.076 Y147.214 F42000
; LINE_WIDTH: 0.137258
G1 F3000
M204 S500
G1 X165.029 Y147.203 E.00037
G2 X164.92 Y147.185 I-.289 J1.35 E.00085
; LINE_WIDTH: 0.109677
G1 X164.813 Y147.175 E.00058
; WIPE_START
G1 X164.92 Y147.185 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X162.421 Y147.173 Z.6 F42000
G1 Z.2
M73 P82 R1
G1 E.8 F1800
; LINE_WIDTH: 0.119562
G1 F3000
M204 S500
G1 X162.223 Y147.198 E.00125
; LINE_WIDTH: 0.163285
G2 X162.023 Y147.262 I.139 J.784 E.00206
; LINE_WIDTH: 0.193071
G1 X161.931 Y147.309 E.00127
G2 X161.655 Y147.613 I.429 J.667 E.00508
; LINE_WIDTH: 0.144559
G1 X161.635 Y147.653 E.00037
G2 X161.589 Y147.765 I1.415 J.642 E.00101
; LINE_WIDTH: 0.111378
G1 X161.555 Y147.88 E.00067
; WIPE_START
G1 X161.589 Y147.765 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.548 Y155.05 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.114578
G1 F3000
M204 S500
G1 X161.574 Y155.166 E.00069
; LINE_WIDTH: 0.149575
G2 X161.617 Y155.287 I1.512 J-.461 E.00112
; LINE_WIDTH: 0.191774
G1 X161.682 Y155.42 E.00179
; LINE_WIDTH: 0.249395
G2 X162.131 Y155.776 I.647 J-.355 E.0099
; LINE_WIDTH: 0.214948
G2 X162.293 Y155.809 I.415 J-1.597 E.00232
; LINE_WIDTH: 0.160544
G2 X164.634 Y155.83 I1.521 J-40.236 E.02244
G1 X164.909 Y155.812 E.00264
; LINE_WIDTH: 0.209478
G1 X165.076 Y155.781 E.00231
; LINE_WIDTH: 0.249791
G2 X165.519 Y155.47 I-.172 J-.714 E.00934
G1 X165.528 Y155.456 E.00029
; LINE_WIDTH: 0.200541
G2 X165.603 Y155.314 I-2.194 J-1.248 E.00205
; LINE_WIDTH: 0.154612
G2 X165.652 Y155.178 I-1.649 J-.674 E.00132
; LINE_WIDTH: 0.115579
G1 X165.68 Y155.057 E.00073
; WIPE_START
G1 X165.652 Y155.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X165.548 Y162.81 Z.6 F42000
G1 X165.496 Y166.586 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X163.289 Y166.587 I-1.107 J-23.821 E.08226
G1 X163.289 Y159.413 E.26718
G3 X163.921 Y158.543 I.781 J-.097 E.04412
G3 X164.654 Y158.536 I.421 J5.489 E.02731
G3 X165.496 Y159.411 I.031 J.813 E.05108
G1 X165.496 Y166.526 E.26501
; WIPE_START
G1 X164.393 Y166.618 E-.42088
G1 X163.501 Y166.593 E-.33912
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X162.832 Y166.586 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X162.832 Y159.663 E.25788
G3 X162.939 Y158.694 I2.67 J-.194 E.03651
G3 X163.99 Y158.006 I1.053 J.462 E.04948
G3 X164.801 Y158.002 I.454 J10.661 E.03021
G3 X165.803 Y158.434 I.046 J1.273 E.042
G3 X165.937 Y158.875 I-.746 J.468 E.01738
G3 X165.953 Y159.82 I-15.485 J.744 E.03518
G1 X165.954 Y166.059 E.23237
G2 X165.931 Y167.177 I36.47 J1.287 E.04168
G1 X161.301 Y167.177 E.17245
G1 X161.301 Y166.62 E.02074
G2 X162.772 Y166.589 I.131 J-28.9 E.05478
; WIPE_START
G1 X162.789 Y164.589 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X161.53 Y166.898 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.160449
G1 F3000
M204 S500
G3 X163.976 Y166.895 I1.326 J70.054 E.02343
G1 X165.707 Y166.878 E.01657
; WIPE_START
G1 X163.976 Y166.895 E-.65756
G1 X163.707 Y166.89 E-.10244
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X165.37 Y159.44 Z.6 F42000
G1 X165.576 Y158.517 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.120297
G1 F3000
M204 S500
G3 X165.686 Y158.976 I-4.603 J1.349 E.00298
M204 S6000
G1 X165.703 Y158.973 F42000
; LINE_WIDTH: 0.171044
G1 F3000
M204 S500
G2 X165.59 Y158.682 I-.995 J.22 E.00327
; LINE_WIDTH: 0.202773
G1 X165.486 Y158.55 E.0022
G2 X165.17 Y158.357 I-.655 J.717 E.00484
; LINE_WIDTH: 0.146524
G1 X165.1 Y158.331 E.00064
G2 X164.792 Y158.273 I-.407 J1.312 E.00265
; LINE_WIDTH: 0.116967
G1 X164.661 Y158.269 E.00079
G2 X163.723 Y158.319 I-.267 J3.825 E.00568
G2 X163.227 Y158.684 I.251 J.86 E.0038
; OBJECT_ID: 839
; WIPE_START
G1 X163.33 Y158.555 E-.07391
G1 X163.452 Y158.45 E-.07189
G1 X163.581 Y158.374 E-.0669
G1 X163.723 Y158.319 E-.06787
G1 X164.008 Y158.271 E-.12898
G1 X164.661 Y158.269 E-.29172
G1 X164.792 Y158.273 E-.05874
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 671
M625
; start printing object, unique label id: 839
M624 AgAAAAAAAAA=
M204 S6000
G1 X160.616 Y151.885 Z.6 F42000
G1 X126.118 Y99.12 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X127.808 Y99.115 I.798 J-14.202 E.06299
G1 X127.815 Y90.456 E.32251
G2 X128.259 Y90.456 I.222 J-27.983 E.01653
G1 X128.266 Y90.623 E.00622
G1 X128.266 Y99.115 E.31629
G2 X129.882 Y99.12 I.855 J-13.242 E.06023
G1 X129.887 Y90.456 E.3227
G2 X130.333 Y90.456 I.224 J-32.634 E.01659
G1 X130.339 Y98.547 E.30133
G2 X130.317 Y99.71 I46.179 J1.445 E.04334
G1 X125.683 Y99.71 E.1726
G2 X125.661 Y98.547 I-46.201 J.281 E.04334
G1 X125.667 Y90.456 E.30133
G2 X126.113 Y90.456 I.221 J-32.634 E.01659
G1 X126.118 Y99.06 E.32047
M204 S6000
G1 X125.908 Y99.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.166688
G1 F3000
M204 S500
G1 X126.773 Y99.427 E.00873
G3 X128.888 Y99.426 I1.069 J29.068 E.02133
G1 X130.092 Y99.412 E.01214
; WIPE_START
G1 X128.888 Y99.426 E-.45756
G1 X128.093 Y99.409 E-.30245
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.233 Y107.04 Z.6 F42000
G1 X128.284 Y109.846 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X130.314 Y109.88 I1.62 J-36.401 E.0756
G1 X130.314 Y110.444 E.021
G1 X125.686 Y110.444 E.17235
G1 X125.686 Y109.88 E.021
G2 X127.827 Y109.846 I.443 J-40.339 E.07976
G1 X127.827 Y102.259 E.28261
G2 X125.686 Y102.226 I-1.698 J40.306 E.07976
G1 X125.686 Y101.633 E.02209
G1 X130.314 Y101.633 E.17235
M73 P83 R1
G1 X130.314 Y102.226 E.02209
G2 X128.284 Y102.259 I-.409 J36.461 E.0756
G1 X128.284 Y109.786 E.28034
; WIPE_START
G1 X129.404 Y109.879 E-.4268
G1 X130.281 Y109.88 E-.3332
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.085 Y110.162 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16204
G1 F3000
M204 S500
G1 X128.98 Y110.158 E.01073
G2 X126.665 Y110.161 I-1.103 J35.513 E.02248
G1 X125.915 Y110.162 E.00728
; WIPE_START
G1 X126.665 Y110.161 E-.28502
G1 X127.915 Y110.143 E-.47498
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.109 Y102.727 Z.6 F42000
G1 X125.915 Y101.929 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.19121
G1 F3000
M204 S500
G1 X126.665 Y101.93 E.00906
G2 X128.98 Y101.933 I1.212 J-35.509 E.02797
G1 X130.085 Y101.929 E.01336
; WIPE_START
G1 X128.98 Y101.933 E-.4201
G1 X128.085 Y101.949 E-.3399
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.798 Y109.548 Z.6 F42000
G1 X129.805 Y120.274 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X129.881 Y119.994 I-.476 J-.28 E.01094
G1 X129.888 Y112.385 E.28339
G2 X130.333 Y112.385 I.223 J-32.596 E.01658
G1 X130.339 Y112.563 E.00661
G1 X130.338 Y119.977 E.27616
G3 X130.01 Y120.862 I-1.196 J.059 E.03611
G3 X129.086 Y121.109 I-.8 J-1.135 E.03641
G1 X126.835 Y121.109 E.08381
G3 X125.661 Y119.977 I-.069 J-1.103 E.06836
G1 X125.667 Y112.385 E.28275
G2 X126.112 Y112.385 I.223 J-32.596 E.01658
G1 X126.118 Y119.993 E.28334
G2 X126.663 Y120.553 I.533 J.027 E.03265
G2 X129.365 Y120.545 I1.142 J-73.386 E.10065
G2 X129.772 Y120.324 I-.036 J-.551 E.01781
M204 S6000
G1 X129.984 Y120.473 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13261
G1 F3000
M204 S500
G1 X129.932 Y120.554 E.0007
G3 X129.233 Y120.83 I-.664 J-.657 E.00566
G3 X126.602 Y120.818 I-1.09 J-50.39 E.01923
G1 X126.516 Y120.804 E.00064
G3 X126.38 Y120.76 I.428 J-1.552 E.00105
; WIPE_START
G1 X126.516 Y120.804 E-.05432
G1 X126.602 Y120.818 E-.03305
G1 X127.101 Y120.835 E-.18986
G1 X128.371 Y120.832 E-.48277
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.689 Y123.976 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X127.197 Y123.663 I-.555 J.33 E.02254
G2 X126.248 Y123.919 I-.257 J.934 E.0384
G2 X126.119 Y124.341 I.726 J.453 E.0166
G1 X126.113 Y132.047 E.28703
G2 X125.667 Y132.047 I-.225 J32.492 E.01661
G1 X125.661 Y124.63 E.27627
G3 X125.75 Y123.705 I2.834 J-.194 E.03477
G3 X126.656 Y123.043 I.958 J.36 E.04423
G3 X127.027 Y123.027 I.287 J2.438 E.01382
G3 X127.945 Y123.396 I.042 J1.226 E.03796
G3 X128.236 Y124.359 I-1.306 J.919 E.0381
G1 X128.236 Y130.901 E.24368
G2 X129.036 Y131.672 I.743 J.029 E.04674
G2 X129.774 Y131.332 I.043 J-.879 E.03146
G2 X129.881 Y130.902 I-.926 J-.458 E.01662
G1 X129.887 Y123.194 E.28713
G2 X130.333 Y123.194 I.223 J-32.322 E.01662
G1 X130.338 Y130.889 E.28663
G3 X129.853 Y131.992 I-1.318 J.078 E.04662
G3 X128.193 Y131.967 I-.809 J-1.385 E.06499
G3 X127.788 Y131.132 I.682 J-.846 E.03574
G1 X127.779 Y124.345 E.25277
G2 X127.717 Y124.029 I-.644 J-.039 E.01213
M204 S6000
G1 X127.885 Y123.806 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116626
G1 F3000
M204 S500
G2 X127.801 Y123.671 I-.96 J.501 E.00096
; LINE_WIDTH: 0.158599
G2 X127.683 Y123.547 I-.869 J.708 E.00161
; LINE_WIDTH: 0.197747
G2 X126.186 Y123.564 I-.736 J1.101 E.02008
G1 X126.082 Y123.675 E.00192
; LINE_WIDTH: 0.143724
G1 X126.005 Y123.798 E.00119
; LINE_WIDTH: 0.112931
G2 X125.956 Y123.908 I1.064 J.537 E.00069
; WIPE_START
G1 X126.005 Y123.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.025 Y131.158 Z.6 F42000
G1 X128.1 Y131.431 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.128615
M73 P84 R1
G1 F3000
M204 S500
G2 X128.709 Y131.902 I.801 J-.406 E.00555
G1 X128.828 Y131.925 E.00084
G2 X129.895 Y131.595 I.224 J-1.167 E.00812
; WIPE_START
G1 X129.701 Y131.767 E-.09876
G1 X129.459 Y131.879 E-.10096
G1 X129.174 Y131.933 E-.11031
G1 X128.828 Y131.925 E-.13169
G1 X128.709 Y131.902 E-.04587
G1 X128.484 Y131.817 E-.09134
G1 X128.32 Y131.711 E-.07422
G1 X128.206 Y131.598 E-.0611
G1 X128.142 Y131.496 E-.04574
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.309 Y139.039 Z.6 F42000
G1 X129.882 Y142.738 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X127.674 Y142.739 I-1.107 J-23.82 E.08226
G1 X127.673 Y136.227 E.24255
G3 X127.731 Y135.169 I7.528 J-.117 E.03948
G1 X127.757 Y135.072 E.00374
G3 X128.24 Y134.681 I.674 J.339 E.02384
G1 X128.725 Y134.654 E.01812
G3 X129.234 Y134.657 I.217 J5.165 E.01893
G3 X129.882 Y135.445 I-.043 J.696 E.04262
G1 X129.882 Y142.678 E.26942
; WIPE_START
G1 X128.778 Y142.77 E-.42088
G1 X127.886 Y142.745 E-.33912
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.259 Y135.348 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X127.482 Y134.675 E.02642
G3 X128.141 Y134.118 I.831 J.316 E.03354
G3 X128.668 Y134.116 I.294 J6.38 E.01965
G3 X129.632 Y134.118 I.453 J12.929 E.03591
G3 X130.314 Y134.878 I-.11 J.785 E.04131
G3 X130.339 Y135.461 I-7.745 J.62 E.02176
G1 X130.339 Y142.204 E.25115
G2 X130.316 Y143.329 I37.364 J1.301 E.0419
G1 X125.686 Y143.329 E.17245
G1 X125.686 Y142.772 E.02073
G2 X127.217 Y142.738 I.131 J-28.9 E.05702
G1 X127.217 Y136.279 E.24061
G2 X126.802 Y135.294 I-1.294 J-.035 E.04101
G2 X126.271 Y134.872 I-2.163 J2.179 E.02532
G2 X125.686 Y134.688 I-.961 J2.035 E.02291
G1 X125.686 Y134.16 E.0197
G3 X126.783 Y134.619 I-.201 J2.018 E.04496
G1 X126.933 Y134.781 E.0082
G1 X127.229 Y135.296 E.02215
M204 S6000
G1 X127.435 Y135.628 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.114923
G1 F3000
M204 S500
G1 X127.415 Y135.725 E.00058
G2 X127.425 Y135.877 I.261 J.061 E.00091
; WIPE_START
G1 X127.415 Y135.725 E-.46158
G1 X127.435 Y135.628 E-.29842
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.814 Y134.612 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.114665
G1 F3000
M204 S500
G3 X127.906 Y134.525 I.973 J.935 E.00074
; LINE_WIDTH: 0.136364
G3 X128.135 Y134.411 I.32 J.356 E.00197
G3 X128.668 Y134.386 I.377 J2.33 E.00408
G1 X129.262 Y134.388 E.00452
G1 X129.436 Y134.404 E.00133
; LINE_WIDTH: 0.182247
G1 X129.581 Y134.427 E.00167
; LINE_WIDTH: 0.236985
G3 X129.817 Y134.537 I-.097 J.519 E.00416
G1 X129.864 Y134.579 E.001
; LINE_WIDTH: 0.211789
G3 X129.969 Y134.717 I-.703 J.639 E.00239
; LINE_WIDTH: 0.165496
G3 X130.025 Y134.836 I-1.768 J.904 E.00131
; LINE_WIDTH: 0.119044
G1 X130.067 Y134.98 E.00093
; WIPE_START
G1 X130.025 Y134.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.379 Y134.639 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109117
G1 F3000
M204 S500
G2 X125.915 Y134.47 I-1.008 J2.043 E.00267
; WIPE_START
G1 X126.127 Y134.533 E-.33956
G1 X126.379 Y134.639 E-.42044
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.959 Y142.26 Z.6 F42000
G1 X125.915 Y143.05 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.160064
G1 F3000
M204 S500
G3 X128.362 Y143.046 I1.326 J69.988 E.02336
G1 X130.092 Y143.03 E.01652
; WIPE_START
G1 X128.362 Y143.046 E-.65757
G1 X128.092 Y143.042 E-.10243
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.997 Y150.595 Z.6 F42000
G1 X126.535 Y153.776 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X126.118 Y152.902 I.47 J-.761 E.03809
G1 X126.118 Y146.776 E.22821
G3 X126.994 Y145.778 I.88 J-.111 E.05586
G3 X129.003 Y145.778 I1.007 J531.932 E.07482
G3 X129.244 Y145.807 I-.001 J1.042 E.00908
G3 X129.882 Y146.776 I-.245 J.855 E.04706
G1 X129.879 Y153.026 E.2328
G3 X129.006 Y153.908 I-.855 J.026 E.05169
G1 X126.876 Y153.9 E.07931
G3 X126.587 Y153.806 I.129 J-.885 E.01138
; WIPE_START
G1 X126.341 Y153.625 E-.11638
G1 X126.207 Y153.417 E-.09369
G1 X126.158 Y153.29 E-.05178
G1 X126.13 Y153.143 E-.057
G1 X126.118 Y152.902 E-.0914
G1 X126.118 Y151.982 E-.34975
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.732 Y145.362 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G3 X130.316 Y146.252 I-.385 J.89 E.042
G3 X130.339 Y146.829 I-8.181 J.607 E.02151
G1 X130.339 Y152.931 E.22724
G3 X130.263 Y153.793 I-3.795 J.101 E.03232
G3 X129.3 Y154.479 I-.906 J-.252 E.04763
G1 X126.703 Y154.479 E.09674
G3 X125.686 Y153.519 I-.048 J-.967 E.05821
G3 X125.662 Y152.93 I11.686 J-.77 E.02194
G1 X125.661 Y146.829 E.22724
G3 X125.77 Y145.87 I3.123 J-.131 E.0361
G3 X126.7 Y145.281 I.865 J.336 E.04389
G1 X127.59 Y145.282 E.03315
G1 X129.371 Y145.283 E.06632
G3 X129.676 Y145.34 I-.023 J.969 E.01162
M204 S6000
G1 X129.461 Y145.578 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.189301
G1 F3000
M204 S500
M73 P85 R1
G3 X129.856 Y145.821 I-.187 J.747 E.00562
; LINE_WIDTH: 0.174689
G3 X129.956 Y145.967 I-.493 J.445 E.00191
G1 X129.988 Y146.032 E.00078
; LINE_WIDTH: 0.123017
G3 X130.036 Y146.153 I-1.535 J.669 E.00085
G1 X130.058 Y146.239 E.00057
M204 S6000
G1 X129.461 Y145.578 F42000
; LINE_WIDTH: 0.137258
G1 F3000
M204 S500
G1 X129.414 Y145.567 E.00037
G2 X129.305 Y145.548 I-.289 J1.35 E.00085
; LINE_WIDTH: 0.109677
G1 X129.198 Y145.539 E.00058
; WIPE_START
G1 X129.305 Y145.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.806 Y145.536 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.119562
G1 F3000
M204 S500
G1 X126.608 Y145.562 E.00125
; LINE_WIDTH: 0.163285
G2 X126.408 Y145.625 I.139 J.784 E.00206
; LINE_WIDTH: 0.193071
G1 X126.316 Y145.673 E.00127
G2 X126.04 Y145.976 I.429 J.667 E.00508
; LINE_WIDTH: 0.144559
G1 X126.02 Y146.016 E.00037
G2 X125.974 Y146.129 I1.415 J.642 E.00101
; LINE_WIDTH: 0.111378
G1 X125.94 Y146.244 E.00067
; WIPE_START
G1 X125.974 Y146.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.934 Y153.414 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.114578
G1 F3000
M204 S500
G1 X125.96 Y153.529 E.00069
; LINE_WIDTH: 0.149575
G2 X126.002 Y153.651 I1.512 J-.461 E.00112
; LINE_WIDTH: 0.191774
G1 X126.067 Y153.784 E.00179
; LINE_WIDTH: 0.249395
G2 X126.516 Y154.139 I.647 J-.355 E.0099
; LINE_WIDTH: 0.214948
G2 X126.678 Y154.173 I.415 J-1.597 E.00232
; LINE_WIDTH: 0.160544
G2 X129.019 Y154.193 I1.521 J-40.236 E.02244
G1 X129.294 Y154.176 E.00264
; LINE_WIDTH: 0.209478
G1 X129.462 Y154.145 E.00231
; LINE_WIDTH: 0.249791
G2 X129.904 Y153.833 I-.172 J-.714 E.00934
G1 X129.913 Y153.819 E.00029
; LINE_WIDTH: 0.200541
G2 X129.988 Y153.678 I-2.194 J-1.248 E.00205
; LINE_WIDTH: 0.154612
G2 X130.037 Y153.542 I-1.649 J-.674 E.00132
; LINE_WIDTH: 0.115579
G1 X130.065 Y153.421 E.00073
; WIPE_START
G1 X130.037 Y153.542 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.933 Y161.174 Z.6 F42000
G1 X129.882 Y164.95 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X127.674 Y164.95 I-1.107 J-23.821 E.08226
G1 X127.674 Y157.777 E.26718
G3 X128.306 Y156.907 I.781 J-.097 E.04412
G3 X129.039 Y156.9 I.421 J5.489 E.02731
G3 X129.881 Y157.775 I.031 J.813 E.05108
G1 X129.882 Y164.89 E.26501
; WIPE_START
G1 X128.778 Y164.981 E-.42088
G1 X127.886 Y164.956 E-.33912
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.217 Y164.95 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X127.217 Y158.026 E.25788
G3 X127.324 Y157.058 I2.67 J-.194 E.03651
G3 X128.375 Y156.37 I1.053 J.462 E.04948
G3 X129.186 Y156.366 I.454 J10.661 E.03021
G3 X130.188 Y156.798 I.046 J1.273 E.042
G3 X130.322 Y157.239 I-.746 J.468 E.01738
G3 X130.339 Y158.183 I-15.485 J.744 E.03518
G1 X130.339 Y164.422 E.23237
G2 X130.316 Y165.541 I36.47 J1.287 E.04168
G1 X125.686 Y165.54 E.17245
G1 X125.686 Y164.984 E.02074
G2 X127.157 Y164.953 I.131 J-28.9 E.05478
; WIPE_START
G1 X127.174 Y162.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.915 Y165.262 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.160449
G1 F3000
M204 S500
G3 X128.362 Y165.258 I1.326 J70.054 E.02343
G1 X130.092 Y165.242 E.01657
; WIPE_START
G1 X128.362 Y165.258 E-.65756
G1 X128.092 Y165.253 E-.10244
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.755 Y157.804 Z.6 F42000
G1 X129.961 Y156.881 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.120297
G1 F3000
M204 S500
G3 X130.071 Y157.34 I-4.603 J1.349 E.00298
M204 S6000
G1 X130.089 Y157.336 F42000
; LINE_WIDTH: 0.171044
G1 F3000
M204 S500
G2 X129.975 Y157.046 I-.995 J.22 E.00327
; LINE_WIDTH: 0.202773
G1 X129.871 Y156.913 E.0022
G2 X129.556 Y156.721 I-.655 J.717 E.00484
; LINE_WIDTH: 0.146524
G1 X129.485 Y156.695 E.00064
G2 X129.178 Y156.637 I-.407 J1.312 E.00265
; LINE_WIDTH: 0.116967
G1 X129.046 Y156.633 E.00079
G2 X128.108 Y156.682 I-.267 J3.825 E.00568
G2 X127.612 Y157.048 I.251 J.86 E.0038
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3000
G1 X127.715 Y156.919 E-.07391
G1 X127.838 Y156.814 E-.07189
G1 X127.967 Y156.738 E-.0669
G1 X128.108 Y156.682 E-.06787
G1 X128.393 Y156.635 E-.12898
G1 X129.046 Y156.633 E-.29172
G1 X129.178 Y156.637 E-.05874
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 839
M625
; layer num/total_layer_count: 2/4
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 671
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I1.051 J.613 P1  F42000
G1 X161.823 Y100.675 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.337 Y100.675 E.06217
G1 X163.337 Y91.981 E.35699
G1 X163.966 Y91.981 E.02584
G1 X163.966 Y100.675 E.35699
G1 X165.407 Y100.675 E.05913
G1 X165.407 Y91.981 E.35699
G1 X166.043 Y91.981 E.02615
G1 X166.043 Y101.461 E.38924
G1 X161.186 Y101.461 E.19944
G1 X161.186 Y91.981 E.38924
G1 X161.823 Y91.981 E.02615
G1 X161.823 Y100.615 E.35453
; WIPE_START
M204 S6000
G1 X163.337 Y100.675 E-.57582
G1 X163.337 Y100.191 E-.18418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
; stop printing object, unique label id: 671
M625
; object ids of layer 2 start: 671,839
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.88
G1 X0 Y128.818 F18000 ; move to safe pos
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


; object ids of this layer2 end: 671,839
M625
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
G1 X163.652 Y100.909 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X163.652 Y92.168 E.25374
; WIPE_START
G1 X163.652 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.725 Y92.168 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.322089
G1 F9814.613
M204 S6000
G1 X165.725 Y100.863 E.25987
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X165.706 Y100.913 E.00174
; LINE_WIDTH: 0.380387
G1 F8028.215
G1 X165.686 Y100.964 E.00198
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X165.667 Y101.014 E.00222
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X165.647 Y101.065 E.00253
G1 X165.594 Y101.068 E.0025
G1 X163.779 Y101.068 E.08495
; LINE_WIDTH: 0.490334
G1 F5976.651
M73 P86 R1
G1 X163.652 Y101.048 E.00632
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X163.652 Y101.002 E.00225
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X163.652 Y100.956 E.00199
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X163.652 Y100.909 E.00173
M204 S10000
G1 X163.652 Y101.048 F42000
; LINE_WIDTH: 0.471951
G1 F6243.413
M204 S6000
G1 X163.525 Y101.068 E.00605
G1 X161.582 Y101.065 E.09126
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X161.563 Y101.014 E.00245
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X161.544 Y100.964 E.00222
; LINE_WIDTH: 0.380386
G1 F8028.251
G1 X161.524 Y100.913 E.00198
; LINE_WIDTH: 0.322209
G1 F9810.116
G1 X161.505 Y100.863 E.00162
G1 X161.505 Y92.168 E.25999
; WIPE_START
G1 X161.505 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.594 Y101.723 Z.88 F42000
G1 X163.989 Y111.401 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X166.043 Y111.401 E.08435
G1 X166.043 Y112.195 E.03258
G1 X161.186 Y112.195 E.19944
G1 X161.186 Y111.401 E.03258
G1 X163.352 Y111.401 E.08894
G1 X163.352 Y103.977 E.30486
G1 X161.186 Y103.977 E.08894
G1 X161.186 Y103.154 E.03378
G1 X166.043 Y103.154 E.19944
G1 X166.043 Y103.977 E.03378
G1 X163.989 Y103.977 E.08435
G1 X163.989 Y111.341 E.3024
M204 S10000
G1 X163.671 Y111.589 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X163.671 Y111.636 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X163.671 Y111.683 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
G1 X163.671 Y111.731 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X163.671 Y111.778 E.00226
G1 X163.802 Y111.798 E.00636
G1 X165.856 Y111.798 E.09848
M204 S10000
G1 X161.374 Y111.798 F42000
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X163.54 Y111.798 E.10374
G1 X163.671 Y111.778 E.00635
M204 S10000
G1 X163.671 Y111.589 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X163.671 Y103.748 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X163.671 Y103.707 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X163.671 Y103.666 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X163.671 Y103.625 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X163.671 Y103.584 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X163.54 Y103.565 E.00678
G1 X161.374 Y103.565 E.11093
M204 S10000
G1 X163.671 Y103.584 F42000
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X163.802 Y103.565 E.00678
G1 X165.856 Y103.565 E.10522
; WIPE_START
G1 X163.856 Y103.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.464 Y111.173 Z.88 F42000
G1 X165.32 Y121.876 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X165.407 Y121.631 I-.402 J-.279 E.01076
G1 X165.407 Y113.91 E.31704
G1 X166.043 Y113.91 E.02615
G1 X166.043 Y121.617 E.31644
G3 X165.702 Y122.583 I-1.234 J.108 E.0434
G3 X164.702 Y122.861 I-.875 J-1.213 E.0435
G1 X162.447 Y122.861 E.09259
G3 X161.186 Y121.616 I-.082 J-1.178 E.08227
G1 X161.186 Y113.91 E.31642
G1 X161.823 Y113.91 E.02615
G1 X161.823 Y121.628 E.31691
G2 X162.283 Y122.083 I.451 J.004 E.02963
G1 X164.868 Y122.083 E.10615
G2 X165.283 Y121.923 I.05 J-.486 E.01895
M204 S10000
G1 X165.609 Y122.101 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.384669
G1 F7922.303
M204 S6000
G2 X165.67 Y121.961 I-1.136 J-.58 E.00567
; LINE_WIDTH: 0.3225
G1 F9799.241
G1 X165.71 Y121.803 E.00487
G1 X165.725 Y121.612 E.00572
G1 X165.725 Y114.097 E.22497
; WIPE_START
G1 X165.725 Y116.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.504 Y114.097 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.323052
G1 F9778.649
M204 S6000
G1 X161.504 Y121.611 E.2254
G2 X161.59 Y122.017 I.983 J.005 E.01255
G1 X161.645 Y122.114 E.00334
; LINE_WIDTH: 0.391606
G1 F7756.536
G2 X161.961 Y122.385 I.633 J-.419 E.01594
; LINE_WIDTH: 0.458718
G1 F6450.671
G2 X162.456 Y122.472 I.417 J-.919 E.02313
G1 X164.697 Y122.472 E.10192
G2 X165.309 Y122.375 I.089 J-1.42 E.0284
G1 X165.464 Y122.279 E.00828
; LINE_WIDTH: 0.433604
G1 F6884.393
G1 X165.609 Y122.101 E.00979
; WIPE_START
G1 X165.464 Y122.279 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.56 Y129.858 Z.88 F42000
G1 X164.181 Y133.045 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X164.633 Y133.195 I.423 J-.515 E.02003
G2 X165.407 Y132.538 I.095 J-.672 E.04706
G1 X165.407 Y124.718 E.32109
G1 X166.043 Y124.718 E.02615
G1 X166.043 Y132.529 E.32069
G3 X165.681 Y133.602 I-1.53 J.082 E.04766
G3 X164.499 Y133.955 I-.995 J-1.176 E.05212
G3 X163.347 Y133.109 I-.009 J-1.195 E.06291
G3 X163.307 Y132.78 I1.423 J-.337 E.01363
G1 X163.307 Y125.982 E.27914
G2 X162.796 Y125.407 I-.571 J-.007 E.03465
G2 X162.022 Y125.546 I-.23 J.943 E.03327
G2 X161.824 Y125.966 I.386 J.438 E.01957
G1 X161.823 Y133.795 E.32148
G1 X161.186 Y133.795 E.02615
G1 X161.186 Y125.784 E.32895
G3 X162.288 Y124.561 I1.143 J-.077 E.0754
G3 X162.616 Y124.548 I.261 J2.43 E.01346
G3 X163.652 Y124.964 I.068 J1.331 E.04729
G3 X163.937 Y125.992 I-1.327 J.922 E.04465
G1 X163.937 Y132.539 E.26881
G2 X164.136 Y133.005 I.667 J-.009 E.02135
M204 S10000
G1 X163.723 Y133.084 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.401794
G1 F7525.268
M204 S6000
G3 X163.67 Y132.948 I1.445 J-.637 E.00571
; LINE_WIDTH: 0.362479
G1 F8503.666
G3 X163.636 Y132.774 I1.262 J-.335 E.00612
; LINE_WIDTH: 0.315959
G1 F10049.732
G1 X163.622 Y132.544 E.0067
G1 X163.622 Y125.996 E.19115
G1 X163.6 Y125.736 E.00761
G1 X163.565 Y125.598 E.00417
; LINE_WIDTH: 0.384099
G1 F7936.262
G2 X163.499 Y125.432 I-2.286 J.819 E.00657
; LINE_WIDTH: 0.431108
G1 F6930.701
G1 X163.49 Y125.416 E.00079
G2 X163.418 Y125.304 I-2.013 J1.213 E.00564
; LINE_WIDTH: 0.477002
G1 F6167.772
G1 X163.301 Y125.181 E.00809
; LINE_WIDTH: 0.52048
G1 F5585.311
G2 X161.797 Y125.198 I-.739 J1.11 E.08393
G1 X161.701 Y125.3 E.00733
; LINE_WIDTH: 0.464727
G1 F6354.879
G1 X161.619 Y125.43 E.00712
; LINE_WIDTH: 0.426848
G1 F7011.212
G2 X161.568 Y125.547 I1.34 J.648 E.00535
; LINE_WIDTH: 0.383002
G1 F7963.201
G1 X161.557 Y125.58 E.00129
G2 X161.526 Y125.712 I1.684 J.461 E.00496
; LINE_WIDTH: 0.322952
G1 F9782.364
G1 X161.505 Y125.959 E.00744
G1 X161.505 Y133.608 E.22938
; WIPE_START
G1 X161.505 Y131.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.723 Y133.084 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.456441
G1 F6487.726
M204 S6000
G2 X164.204 Y133.504 I.758 J-.383 E.0296
M73 P87 R1
G1 X164.317 Y133.539 E.00534
; LINE_WIDTH: 0.446614
G1 F6652.675
G1 X164.437 Y133.562 E.00538
G2 X165.488 Y133.259 I.238 J-1.15 E.0502
G1 X165.539 Y133.192 E.00371
; LINE_WIDTH: 0.389963
G1 F7795.178
G2 X165.639 Y133.004 I-.646 J-.462 E.00805
; LINE_WIDTH: 0.322843
G1 F9786.444
G2 X165.717 Y132.684 I-1.074 J-.431 E.00991
G1 X165.725 Y124.906 E.23315
; WIPE_START
G1 X165.723 Y126.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.703 Y134.47 Z.88 F42000
G1 X163.379 Y144.294 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.386 Y136.812 E.30719
G3 X163.986 Y136.401 I.536 J.138 E.03259
G1 X164.71 Y136.401 E.02975
G3 X165.407 Y137.08 I.074 J.621 E.04578
G1 X165.407 Y144.294 E.2962
G1 X163.439 Y144.294 E.0808
M204 S10000
G1 X162.741 Y144.294 F42000
G1 F7144.614
M204 S5000
G1 X162.741 Y137.916 E.26187
G2 X161.656 Y136.52 I-1.422 J-.014 E.07837
G2 X161.186 Y136.42 I-1.49 J5.832 E.01971
G1 X161.186 Y135.663 E.03109
G3 X162.289 Y136.043 I-.201 J2.376 E.04838
G3 X162.566 Y136.36 I-.907 J1.072 E.01735
G1 X162.868 Y136.876 E.02455
G3 X163.158 Y136.071 I4.383 J1.126 E.03518
G3 X163.832 Y135.637 I.68 J.316 E.0347
G1 X165.241 Y135.639 E.05788
G3 X166.037 Y136.487 I-.082 J.873 E.05217
G1 X166.043 Y145.08 E.35282
G1 X161.186 Y145.08 E.19944
G1 X161.186 Y144.294 E.03227
G1 X162.681 Y144.294 E.06139
M204 S10000
G1 X163.06 Y144.482 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322991
G1 F9780.912
M204 S6000
G1 X163.06 Y137.913 E.19702
G1 X163.046 Y137.579 E.01
; LINE_WIDTH: 0.36431
G1 F8452.487
G3 X163.05 Y137.373 I.519 J-.094 E.0072
; LINE_WIDTH: 0.323774
G1 F9751.874
G1 X163.069 Y137.253 E.00366
; LINE_WIDTH: 0.285058
G1 F11430.111
G1 X163.088 Y137.133 E.00312
; LINE_WIDTH: 0.246342
G1 F12000
G1 X163.108 Y137.013 E.00259
; LINE_WIDTH: 0.207626
G1 X163.127 Y136.893 E.00205
; LINE_WIDTH: 0.16232
G1 X163.19 Y136.643 E.003
G1 X163.244 Y136.51 E.00168
; LINE_WIDTH: 0.193792
G1 X163.31 Y136.389 E.00209
; LINE_WIDTH: 0.226661
G3 X163.671 Y135.848 I5.146 J3.047 E.01238
M204 S10000
G1 X163.285 Y136.24 F42000
; LINE_WIDTH: 0.450307
G1 F6589.711
M204 S6000
G3 X163.669 Y136.056 I1.453 J2.539 E.01897
G1 X163.696 Y136.047 E.00126
G3 X165.038 Y136.037 I.72 J6.717 E.05982
; LINE_WIDTH: 0.502766
G1 F5808.802
G3 X165.194 Y136.06 I-.409 J3.302 E.00796
; LINE_WIDTH: 0.558396
G1 F5160.329
G1 X165.35 Y136.112 E.00934
G1 X165.498 Y136.23 E.01078
; LINE_WIDTH: 0.526024
G1 F5518.853
G3 X165.573 Y136.33 I-.791 J.667 E.00665
G1 X165.595 Y136.367 E.0023
; LINE_WIDTH: 0.47789
G1 F6154.669
G3 X165.637 Y136.46 I-1.014 J.525 E.00486
G1 X165.65 Y136.491 E.00161
; LINE_WIDTH: 0.426859
G1 F7011.011
G1 X165.685 Y136.626 E.00584
; LINE_WIDTH: 0.394493
G1 F7689.568
G1 X165.692 Y136.661 E.00136
; LINE_WIDTH: 0.361263
G1 F8538.004
G3 X165.717 Y136.862 I-2.167 J.368 E.00698
; LINE_WIDTH: 0.322226
G1 F9809.456
G3 X165.725 Y137.065 I-2.494 J.198 E.00606
G1 X165.725 Y144.482 E.2218
G1 X165.706 Y144.532 E.00162
; LINE_WIDTH: 0.380552
G1 F8024.095
G1 X165.686 Y144.583 E.00198
; LINE_WIDTH: 0.419501
G1 F7154.525
G1 X165.667 Y144.633 E.00222
; LINE_WIDTH: 0.458451
G1 F6454.997
G1 X165.647 Y144.684 E.00246
; LINE_WIDTH: 0.472491
G1 F6235.246
G1 X163.191 Y144.687 E.11554
G1 X163.06 Y144.666 E.00625
G1 X163.06 Y144.62 E.00217
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X163.06 Y144.574 E.00201
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X163.06 Y144.528 E.00176
; LINE_WIDTH: 0.346295
G1 F8984.527
G1 X163.06 Y144.482 E.00151
M204 S10000
G1 X163.06 Y144.666 F42000
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X162.929 Y144.687 E.00625
G1 X161.374 Y144.687 E.0732
; WIPE_START
G1 X162.929 Y144.687 E-.70018
G1 X163.06 Y144.666 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.591 Y137.176 Z.88 F42000
G1 X161.374 Y136.067 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.419781
G1 F7148.971
M204 S6000
G3 X161.93 Y136.236 I-.468 J2.549 E.02391
G1 X162.007 Y136.276 E.00356
; LINE_WIDTH: 0.371373
G1 F8260.705
G1 X162.163 Y136.376 E.0066
; LINE_WIDTH: 0.315251
G1 F10077.609
G3 X162.573 Y136.743 I-2.597 J3.313 E.01601
M204 S10000
G1 X162.706 Y137.022 F42000
; LINE_WIDTH: 0.127418
G1 F12000
M204 S6000
G1 X162.55 Y136.791 E.00214
; LINE_WIDTH: 0.170255
G1 X162.453 Y136.669 E.00196
; LINE_WIDTH: 0.20592
G1 X162.403 Y136.611 E.00128
; LINE_WIDTH: 0.235723
G1 X162.347 Y136.546 E.00172
; LINE_WIDTH: 0.261799
G1 X161.831 Y136.002 E.01725
; WIPE_START
G1 X162.347 Y136.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.194 Y144.177 Z.88 F42000
G1 X161.976 Y155.1 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X161.823 Y154.54 I.67 J-.484 E.02438
G1 X161.829 Y148.289 E.25666
G3 X162.614 Y147.529 I.763 J.003 E.05001
G1 X164.615 Y147.529 E.08214
G3 X165.035 Y147.635 I-.05 J1.08 E.01793
G3 X165.407 Y148.412 I-.502 J.717 E.03694
G1 X165.401 Y154.664 E.25674
G3 X164.616 Y155.43 I-.765 J.001 E.05021
G1 X162.615 Y155.43 E.08215
G3 X162.388 Y155.401 I-.003 J-.891 E.0094
G3 X162.013 Y155.147 I.258 J-.785 E.01884
; WIPE_START
M204 S6000
G1 X161.877 Y154.903 E-.10645
G1 X161.847 Y154.788 E-.04517
G1 X161.823 Y154.54 E-.0947
G1 X161.824 Y153.188 E-.51368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.669 Y155.965 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X165.439 Y156.125 I-.759 J-.846 E.01153
G3 X164.917 Y156.231 I-.51 J-1.172 E.02205
G1 X162.312 Y156.231 E.10695
G3 X161.193 Y155.185 I-.059 J-1.059 E.07027
G1 X161.186 Y147.995 E.29521
G3 X161.875 Y146.874 I1.124 J-.082 E.05771
G3 X162.313 Y146.803 I.46 J1.449 E.01828
G1 X164.971 Y146.804 E.10914
G3 X166.04 Y147.881 I-.002 J1.071 E.06923
G1 X166.044 Y155.038 E.29387
G3 X165.713 Y155.924 I-1.133 J.081 E.04004
M204 S10000
G1 X165.429 Y155.584 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.576505
G1 F4979.373
M204 S6000
G3 X165.331 Y155.666 I-.512 J-.512 E.00753
G1 X165.177 Y155.749 E.01029
; LINE_WIDTH: 0.556301
G1 F5182.109
G3 X165.009 Y155.798 I-.452 J-1.229 E.00992
G1 X164.988 Y155.802 E.00121
; LINE_WIDTH: 0.489885
G1 F5982.9
G3 X164.637 Y155.83 I-.367 J-2.393 E.0173
G3 X162.609 Y155.83 I-1.021 J-57.839 E.09945
G3 X162.43 Y155.824 I.005 J-2.672 E.00877
G1 X162.322 Y155.813 E.00534
; LINE_WIDTH: 0.532896
G1 F5438.637
G1 X162.189 Y155.79 E.00726
; LINE_WIDTH: 0.577931
G1 F4965.657
G3 X161.848 Y155.628 I.184 J-.823 E.0225
G1 X161.815 Y155.598 E.00263
; LINE_WIDTH: 0.56207
G1 F5122.555
G3 X161.746 Y155.521 I.782 J-.763 E.00593
G1 X161.677 Y155.419 E.00705
; LINE_WIDTH: 0.512211
G1 F5687.456
G1 X161.614 Y155.289 E.00747
; LINE_WIDTH: 0.466511
G1 F6326.986
G1 X161.571 Y155.159 E.00633
; LINE_WIDTH: 0.420804
G1 F7128.681
G1 X161.543 Y155.029 E.00548
; LINE_WIDTH: 0.375413
G1 F8154.87
G1 X161.521 Y154.862 E.00606
; LINE_WIDTH: 0.322655
G1 F9793.438
G1 X161.505 Y154.544 E.00954
G1 X161.505 Y148.401 E.184
; LINE_WIDTH: 0.332787
G1 F9429.569
G1 X161.519 Y148.106 E.00918
; LINE_WIDTH: 0.369328
G1 F8315.343
G1 X161.539 Y147.952 E.00548
; LINE_WIDTH: 0.413817
G1 F7269.505
G3 X161.575 Y147.8 I2.175 J.432 E.0063
G1 X161.582 Y147.777 E.001
; LINE_WIDTH: 0.463352
G1 F6376.549
G1 X161.655 Y147.606 E.00854
; LINE_WIDTH: 0.515464
G1 F5646.832
G3 X161.938 Y147.303 I.681 J.354 E.02183
G1 X162.1 Y147.231 E.00918
; LINE_WIDTH: 0.471193
G1 F6254.924
G1 X162.321 Y147.184 E.01062
; LINE_WIDTH: 0.413791
G1 F7270.025
G3 X164.63 Y147.166 I1.544 J51.951 E.09319
G1 X164.921 Y147.184 E.01175
; LINE_WIDTH: 0.465606
G1 F6341.105
G3 X165.077 Y147.214 I-.211 J1.523 E.00732
; LINE_WIDTH: 0.512279
G1 F5686.602
G3 X165.575 Y147.603 I-.179 J.742 E.03362
; LINE_WIDTH: 0.467504
G1 F6311.568
G1 X165.636 Y147.741 E.00699
; LINE_WIDTH: 0.424934
G1 F7047.992
G1 X165.682 Y147.905 E.00711
; LINE_WIDTH: 0.376755
G1 F8120.295
G1 X165.71 Y148.092 E.00684
; LINE_WIDTH: 0.323491
G1 F9762.362
G1 X165.725 Y148.407 E.00949
G1 X165.725 Y154.544 E.18439
G1 X165.711 Y154.848 E.00915
; LINE_WIDTH: 0.373801
G1 F8196.765
G1 X165.687 Y155.032 E.00665
; LINE_WIDTH: 0.424768
G1 F7051.207
G3 X165.66 Y155.156 I-2.017 J-.367 E.00528
G1 X165.653 Y155.181 E.00106
; LINE_WIDTH: 0.472516
G1 F6234.858
G3 X165.609 Y155.307 I-2.727 J-.891 E.0063
; LINE_WIDTH: 0.518938
G1 F5604.073
G3 X165.537 Y155.447 I-1.463 J-.665 E.00821
; LINE_WIDTH: 0.576505
G1 F4979.373
G3 X165.47 Y155.54 I-.62 J-.375 E.00679
; WIPE_START
G1 X165.331 Y155.666 E-.07119
G1 X165.177 Y155.749 E-.06634
G1 X165.009 Y155.798 E-.06654
G1 X164.988 Y155.802 E-.00814
G1 X164.637 Y155.83 E-.13395
G1 X163.548 Y155.83 E-.41384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.857 Y163.349 Z.88 F42000
G1 X165.407 Y166.506 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.379 Y166.506 E.08326
G1 X163.379 Y159.413 E.29122
G3 X163.939 Y158.656 I.689 J-.076 E.04251
G3 X164.666 Y158.65 I.404 J5.579 E.02987
G3 X165.406 Y159.41 I.022 J.719 E.04897
G1 X165.407 Y166.446 E.28887
; WIPE_START
M204 S6000
G1 X163.407 Y166.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.741 Y166.506 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X162.741 Y159.192 E.30029
G3 X163.96 Y157.893 I1.235 J-.063 E.08166
G3 X164.785 Y157.887 I.483 J9.394 E.03386
G3 X165.898 Y158.37 I.055 J1.397 E.05153
G3 X166.043 Y158.864 I-.705 J.476 E.02149
G1 X166.043 Y167.292 E.34605
G1 X161.186 Y167.292 E.19944
G1 X161.186 Y166.506 E.03228
G1 X162.681 Y166.506 E.06139
M204 S10000
G1 X163.06 Y166.693 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.32316
G1 F9774.625
M204 S6000
G1 X163.06 Y159.409 E.21862
G3 X163.076 Y159.123 I2.29 J-.015 E.0086
G1 X163.088 Y159.052 E.00215
; LINE_WIDTH: 0.381722
G1 F7994.899
G1 X163.16 Y158.807 E.00938
; LINE_WIDTH: 0.435865
G1 F6842.982
G3 X163.876 Y158.284 I.816 J.366 E.03974
G1 X164.137 Y158.268 E.01123
; LINE_WIDTH: 0.458608
G1 F6452.454
G3 X165.062 Y158.319 I.266 J3.58 E.04224
G1 X165.165 Y158.353 E.00492
; LINE_WIDTH: 0.52443
G1 F5537.796
G3 X165.489 Y158.548 I-.327 J.913 E.02016
G1 X165.56 Y158.631 E.0058
; LINE_WIDTH: 0.511857
G1 F5691.913
G1 X165.636 Y158.776 E.00845
; LINE_WIDTH: 0.464808
G1 F6353.604
G1 X165.665 Y158.872 E.0046
M204 S10000
G1 X165.582 Y158.315 F42000
; LINE_WIDTH: 0.378209
G1 F8083.202
M204 S6000
G3 X165.717 Y159.21 I-10.93 J2.101 E.03286
; LINE_WIDTH: 0.322597
G1 F9795.6
G3 X165.725 Y159.394 I-2.291 J.186 E.0055
G1 X165.725 Y166.693 E.21859
G1 X165.705 Y166.744 E.00162
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X165.686 Y166.794 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X165.666 Y166.845 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X165.647 Y166.895 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X163.191 Y166.899 E.11564
G1 X163.06 Y166.878 E.00626
G1 X163.06 Y166.832 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X163.06 Y166.785 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X163.06 Y166.739 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X163.06 Y166.693 E.00151
M204 S10000
G1 X163.06 Y166.878 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X162.929 Y166.899 E.00626
G1 X161.374 Y166.899 E.07328
; OBJECT_ID: 839
; WIPE_START
G1 X162.929 Y166.899 E-.70018
G1 X163.06 Y166.878 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 671
M625
; start printing object, unique label id: 839
M624 AgAAAAAAAAA=
M204 S10000
G1 X159.417 Y160.171 Z.88 F42000
G1 X126.208 Y99.039 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.722 Y99.039 E.06217
G1 X127.722 Y90.345 E.35699
G1 X128.352 Y90.345 E.02584
G1 X128.352 Y99.039 E.35699
G1 X129.792 Y99.039 E.05913
G1 X129.792 Y90.345 E.35699
G1 X130.429 Y90.345 E.02615
G1 X130.429 Y99.824 E.38924
G1 X125.571 Y99.824 E.19944
G1 X125.571 Y90.345 E.38924
G1 X126.208 Y90.345 E.02615
G1 X126.208 Y98.979 E.35453
M204 S10000
G1 X125.909 Y99.277 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.380386
G1 F8028.251
M204 S6000
G1 X125.929 Y99.327 E.00198
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X125.948 Y99.378 E.00222
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X125.968 Y99.428 E.00245
; LINE_WIDTH: 0.471951
G1 F6243.413
G1 X127.91 Y99.432 E.09126
G1 X128.037 Y99.412 E.00605
M204 S10000
G1 X125.909 Y99.277 F42000
; LINE_WIDTH: 0.322209
G1 F9810.116
M204 S6000
G1 X125.89 Y99.226 E.00162
G1 X125.89 Y90.532 E.25999
; WIPE_START
G1 X125.89 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.037 Y90.532 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X128.037 Y99.273 E.25374
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X128.037 Y99.319 E.00173
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X128.037 Y99.366 E.00199
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X128.037 Y99.412 E.00225
; LINE_WIDTH: 0.490334
G1 F5976.651
G1 X128.164 Y99.432 E.00632
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X129.979 Y99.432 E.08495
G1 X130.032 Y99.428 E.0025
G1 X130.052 Y99.378 E.00253
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X130.071 Y99.327 E.00222
; LINE_WIDTH: 0.380387
G1 F8028.215
G1 X130.091 Y99.277 E.00198
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X130.11 Y99.226 E.00174
; LINE_WIDTH: 0.322089
G1 F9814.613
G1 X130.11 Y90.532 E.25987
; WIPE_START
G1 X130.11 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.345 Y100.126 Z.88 F42000
G1 X128.374 Y109.765 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X130.429 Y109.765 E.08435
G1 X130.429 Y110.559 E.03258
G1 X125.571 Y110.559 E.19944
G1 X125.571 Y109.765 E.03258
G1 X127.737 Y109.765 E.08894
G1 X127.737 Y102.34 E.30486
G1 X125.571 Y102.34 E.08894
G1 X125.571 Y101.518 E.03378
G1 X130.429 Y101.518 E.19944
G1 X130.429 Y102.34 E.03378
G1 X128.374 Y102.34 E.08435
G1 X128.374 Y109.705 E.3024
M204 S10000
G1 X128.056 Y109.953 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X128.056 Y110 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X128.056 Y110.047 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
M73 P88 R1
G1 X128.056 Y110.094 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X128.056 Y110.141 E.00226
G1 X128.187 Y110.162 E.00636
G1 X130.241 Y110.162 E.09848
M204 S10000
G1 X125.759 Y110.162 F42000
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X127.925 Y110.162 E.10374
G1 X128.056 Y110.141 E.00635
M204 S10000
G1 X128.056 Y109.953 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X128.056 Y102.112 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X128.056 Y102.071 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X128.056 Y102.03 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X128.056 Y101.989 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X128.056 Y101.948 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X127.925 Y101.929 E.00678
G1 X125.759 Y101.929 E.11093
M204 S10000
G1 X128.056 Y101.948 F42000
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X128.187 Y101.929 E.00678
G1 X130.241 Y101.929 E.10522
; WIPE_START
G1 X128.241 Y101.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.85 Y109.537 Z.88 F42000
G1 X129.706 Y120.239 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.792 Y119.995 I-.402 J-.279 E.01076
G1 X129.792 Y112.274 E.31704
G1 X130.429 Y112.274 E.02615
G1 X130.428 Y119.98 E.31644
G3 X130.087 Y120.947 I-1.234 J.108 E.0434
G3 X129.087 Y121.224 I-.875 J-1.213 E.0435
G1 X126.832 Y121.224 E.09259
G3 X125.571 Y119.98 I-.082 J-1.178 E.08227
G1 X125.571 Y112.274 E.31642
G1 X126.208 Y112.274 E.02615
G1 X126.208 Y119.992 E.31691
G2 X126.668 Y120.447 I.451 J.004 E.02963
G1 X129.254 Y120.447 E.10615
G2 X129.668 Y120.286 I.05 J-.486 E.01895
M204 S10000
G1 X129.994 Y120.464 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.384669
G1 F7922.303
M204 S6000
G2 X130.055 Y120.324 I-1.136 J-.58 E.00567
; LINE_WIDTH: 0.3225
G1 F9799.241
G1 X130.096 Y120.166 E.00487
G1 X130.11 Y119.976 E.00572
G1 X130.11 Y112.461 E.22497
; WIPE_START
G1 X130.11 Y114.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.889 Y112.461 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.323052
G1 F9778.649
M204 S6000
G1 X125.889 Y119.974 E.2254
G2 X125.975 Y120.381 I.983 J.005 E.01255
G1 X126.03 Y120.478 E.00334
; LINE_WIDTH: 0.391606
G1 F7756.536
G2 X126.346 Y120.748 I.633 J-.419 E.01594
; LINE_WIDTH: 0.458718
G1 F6450.671
G2 X126.841 Y120.835 I.417 J-.919 E.02313
G1 X129.082 Y120.835 E.10192
G2 X129.694 Y120.739 I.089 J-1.42 E.0284
G1 X129.849 Y120.643 E.00828
; LINE_WIDTH: 0.433604
G1 F6884.393
G1 X129.994 Y120.464 E.00979
; WIPE_START
G1 X129.849 Y120.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.946 Y128.221 Z.88 F42000
G1 X128.566 Y131.408 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.018 Y131.559 I.423 J-.515 E.02003
G2 X129.792 Y130.902 I.095 J-.672 E.04706
G1 X129.792 Y123.082 E.32109
G1 X130.429 Y123.082 E.02615
G1 X130.428 Y130.892 E.32069
G3 X130.066 Y131.966 I-1.53 J.082 E.04766
G3 X128.884 Y132.319 I-.995 J-1.176 E.05212
G3 X127.732 Y131.473 I-.009 J-1.195 E.06291
G3 X127.692 Y131.144 I1.423 J-.337 E.01363
G1 X127.692 Y124.346 E.27914
G2 X127.181 Y123.771 I-.571 J-.007 E.03465
G2 X126.407 Y123.91 I-.23 J.943 E.03327
G2 X126.209 Y124.329 I.386 J.438 E.01957
G1 X126.208 Y132.159 E.32148
G1 X125.571 Y132.159 E.02615
G1 X125.571 Y124.147 E.32895
G3 X126.674 Y122.925 I1.143 J-.077 E.0754
G3 X127.001 Y122.912 I.261 J2.43 E.01346
G3 X128.037 Y123.327 I.068 J1.331 E.04729
G3 X128.322 Y124.355 I-1.327 J.922 E.04465
G1 X128.322 Y130.902 E.26881
G2 X128.521 Y131.368 I.667 J-.009 E.02135
M204 S10000
G1 X128.108 Y131.448 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.401794
G1 F7525.268
M204 S6000
G3 X128.055 Y131.311 I1.445 J-.637 E.00571
; LINE_WIDTH: 0.362479
G1 F8503.666
G3 X128.021 Y131.137 I1.262 J-.335 E.00612
; LINE_WIDTH: 0.315959
G1 F10049.732
G1 X128.007 Y130.908 E.0067
G1 X128.007 Y124.36 E.19115
G1 X127.985 Y124.1 E.00761
G1 X127.95 Y123.961 E.00417
; LINE_WIDTH: 0.384099
G1 F7936.262
G2 X127.884 Y123.796 I-2.286 J.819 E.00657
; LINE_WIDTH: 0.431108
G1 F6930.701
G1 X127.875 Y123.78 E.00079
G2 X127.803 Y123.668 I-2.013 J1.213 E.00564
; LINE_WIDTH: 0.477002
G1 F6167.772
G1 X127.686 Y123.544 E.00809
; LINE_WIDTH: 0.52048
G1 F5585.311
G2 X126.182 Y123.562 I-.739 J1.11 E.08393
G1 X126.086 Y123.664 E.00733
; LINE_WIDTH: 0.464727
G1 F6354.879
G1 X126.004 Y123.794 E.00712
; LINE_WIDTH: 0.426848
G1 F7011.212
G2 X125.953 Y123.911 I1.34 J.648 E.00535
; LINE_WIDTH: 0.383002
G1 F7963.201
G1 X125.942 Y123.944 E.00129
G2 X125.911 Y124.075 I1.684 J.461 E.00496
; LINE_WIDTH: 0.322952
G1 F9782.364
G1 X125.89 Y124.322 E.00744
G1 X125.89 Y131.971 E.22938
; WIPE_START
G1 X125.89 Y129.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.108 Y131.448 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.456441
G1 F6487.726
M204 S6000
G2 X128.589 Y131.867 I.758 J-.383 E.0296
G1 X128.702 Y131.902 E.00534
; LINE_WIDTH: 0.446614
G1 F6652.675
G1 X128.822 Y131.926 E.00538
G2 X129.873 Y131.623 I.238 J-1.15 E.0502
G1 X129.924 Y131.556 E.00371
; LINE_WIDTH: 0.389963
G1 F7795.178
G2 X130.024 Y131.367 I-.646 J-.462 E.00805
; LINE_WIDTH: 0.322843
G1 F9786.444
G2 X130.102 Y131.047 I-1.074 J-.431 E.00991
G1 X130.11 Y123.269 E.23315
; WIPE_START
G1 X130.108 Y125.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.088 Y132.833 Z.88 F42000
G1 X127.764 Y142.658 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.771 Y135.176 E.30719
G3 X128.371 Y134.764 I.536 J.138 E.03259
G1 X129.095 Y134.764 E.02975
G3 X129.792 Y135.444 I.074 J.621 E.04578
G1 X129.792 Y142.658 E.2962
G1 X127.824 Y142.658 E.0808
M204 S10000
G1 X127.127 Y142.658 F42000
G1 F7144.614
M204 S5000
G1 X127.127 Y136.28 E.26187
G2 X126.041 Y134.884 I-1.422 J-.014 E.07837
G2 X125.571 Y134.784 I-1.49 J5.832 E.01971
G1 X125.571 Y134.027 E.03109
G3 X126.674 Y134.406 I-.201 J2.376 E.04838
G3 X126.951 Y134.723 I-.907 J1.072 E.01735
G1 X127.253 Y135.239 E.02455
G3 X127.543 Y134.435 I4.383 J1.126 E.03518
G3 X128.217 Y134.001 I.68 J.316 E.0347
G1 X129.626 Y134.003 E.05788
G3 X130.422 Y134.851 I-.082 J.873 E.05217
G1 X130.429 Y143.444 E.35282
G1 X125.571 Y143.444 E.19944
G1 X125.571 Y142.658 E.03227
G1 X127.067 Y142.658 E.06139
M204 S10000
G1 X127.445 Y142.845 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322991
G1 F9780.912
M204 S6000
G1 X127.445 Y136.276 E.19702
G1 X127.431 Y135.943 E.01
; LINE_WIDTH: 0.36431
G1 F8452.487
G3 X127.435 Y135.737 I.519 J-.094 E.0072
; LINE_WIDTH: 0.323774
G1 F9751.874
G1 X127.454 Y135.617 E.00366
; LINE_WIDTH: 0.285058
G1 F11430.111
G1 X127.474 Y135.496 E.00312
; LINE_WIDTH: 0.246342
G1 F12000
G1 X127.493 Y135.376 E.00259
; LINE_WIDTH: 0.207626
G1 X127.512 Y135.256 E.00205
; LINE_WIDTH: 0.16232
G1 X127.575 Y135.006 E.003
G1 X127.63 Y134.873 E.00168
; LINE_WIDTH: 0.193792
G1 X127.695 Y134.753 E.00209
; LINE_WIDTH: 0.226661
G3 X128.056 Y134.211 I5.146 J3.047 E.01238
M204 S10000
G1 X127.671 Y134.604 F42000
; LINE_WIDTH: 0.450307
G1 F6589.711
M204 S6000
G3 X128.055 Y134.42 I1.453 J2.539 E.01897
G1 X128.081 Y134.41 E.00126
G3 X129.423 Y134.401 I.72 J6.717 E.05982
; LINE_WIDTH: 0.502766
G1 F5808.802
G3 X129.579 Y134.424 I-.409 J3.302 E.00796
; LINE_WIDTH: 0.558396
G1 F5160.329
G1 X129.735 Y134.475 E.00934
G1 X129.883 Y134.593 E.01078
; LINE_WIDTH: 0.526024
G1 F5518.853
G3 X129.958 Y134.694 I-.791 J.667 E.00665
G1 X129.98 Y134.731 E.0023
; LINE_WIDTH: 0.47789
G1 F6154.669
G3 X130.023 Y134.823 I-1.014 J.525 E.00486
G1 X130.035 Y134.855 E.00161
; LINE_WIDTH: 0.426859
G1 F7011.011
G1 X130.07 Y134.99 E.00584
; LINE_WIDTH: 0.394493
G1 F7689.568
G1 X130.078 Y135.024 E.00136
; LINE_WIDTH: 0.361263
G1 F8538.004
G3 X130.102 Y135.226 I-2.167 J.368 E.00698
; LINE_WIDTH: 0.322226
G1 F9809.456
G3 X130.11 Y135.428 I-2.494 J.198 E.00606
G1 X130.11 Y142.845 E.2218
G1 X130.091 Y142.896 E.00162
; LINE_WIDTH: 0.380552
G1 F8024.095
G1 X130.071 Y142.946 E.00198
; LINE_WIDTH: 0.419501
G1 F7154.525
G1 X130.052 Y142.997 E.00222
; LINE_WIDTH: 0.458451
G1 F6454.997
G1 X130.032 Y143.047 E.00246
; LINE_WIDTH: 0.472491
G1 F6235.246
G1 X127.576 Y143.051 E.11554
G1 X127.445 Y143.03 E.00625
G1 X127.445 Y142.984 E.00217
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X127.445 Y142.937 E.00201
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X127.445 Y142.891 E.00176
; LINE_WIDTH: 0.346295
G1 F8984.527
G1 X127.445 Y142.845 E.00151
M204 S10000
G1 X127.445 Y143.03 F42000
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X127.314 Y143.051 E.00625
G1 X125.759 Y143.051 E.0732
; WIPE_START
G1 X127.314 Y143.051 E-.70018
G1 X127.445 Y143.03 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.976 Y135.54 Z.88 F42000
G1 X125.759 Y134.431 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.419781
G1 F7148.971
M204 S6000
G3 X126.315 Y134.599 I-.468 J2.549 E.02391
G1 X126.393 Y134.639 E.00356
; LINE_WIDTH: 0.371373
G1 F8260.705
G1 X126.549 Y134.74 E.0066
; LINE_WIDTH: 0.315251
G1 F10077.609
G3 X126.958 Y135.106 I-2.597 J3.313 E.01601
M204 S10000
G1 X127.091 Y135.385 F42000
; LINE_WIDTH: 0.127418
G1 F12000
M204 S6000
G1 X126.935 Y135.155 E.00214
; LINE_WIDTH: 0.170255
G1 X126.839 Y135.033 E.00196
; LINE_WIDTH: 0.20592
G1 X126.788 Y134.974 E.00128
; LINE_WIDTH: 0.235723
G1 X126.732 Y134.91 E.00172
; LINE_WIDTH: 0.261799
G1 X126.216 Y134.366 E.01725
; WIPE_START
G1 X126.732 Y134.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.58 Y142.541 Z.88 F42000
G1 X126.361 Y153.464 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X126.208 Y152.903 I.67 J-.484 E.02438
G1 X126.214 Y146.652 E.25666
G3 X126.999 Y145.892 I.763 J.003 E.05001
G1 X129 Y145.892 E.08214
G3 X129.42 Y145.999 I-.05 J1.08 E.01793
G3 X129.792 Y146.775 I-.502 J.717 E.03694
G1 X129.786 Y153.028 E.25674
G3 X129.001 Y153.793 I-.765 J.001 E.05021
G1 X127 Y153.793 E.08215
G3 X126.773 Y153.765 I-.003 J-.891 E.0094
G3 X126.398 Y153.511 I.258 J-.785 E.01884
; WIPE_START
M204 S6000
G1 X126.262 Y153.266 E-.10645
G1 X126.232 Y153.151 E-.04517
G1 X126.208 Y152.903 E-.0947
G1 X126.209 Y151.551 E-.51368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.054 Y154.328 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X129.824 Y154.488 I-.759 J-.846 E.01153
G3 X129.302 Y154.594 I-.51 J-1.172 E.02205
G1 X126.697 Y154.594 E.10695
G3 X125.578 Y153.548 I-.059 J-1.059 E.07027
G1 X125.571 Y146.359 E.29521
G3 X126.26 Y145.237 I1.124 J-.082 E.05771
G3 X126.698 Y145.166 I.46 J1.449 E.01828
G1 X129.356 Y145.167 E.10914
G3 X130.425 Y146.244 I-.002 J1.071 E.06923
G1 X130.429 Y153.402 E.29387
G3 X130.098 Y154.287 I-1.133 J.081 E.04004
M204 S10000
G1 X129.814 Y153.948 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.576505
G1 F4979.373
M204 S6000
G3 X129.717 Y154.03 I-.512 J-.512 E.00753
G1 X129.563 Y154.112 E.01029
; LINE_WIDTH: 0.556301
G1 F5182.109
G3 X129.395 Y154.162 I-.452 J-1.229 E.00992
G1 X129.374 Y154.166 E.00121
; LINE_WIDTH: 0.489885
G1 F5982.9
G3 X129.022 Y154.193 I-.366 J-2.393 E.0173
G3 X126.994 Y154.194 I-1.021 J-57.839 E.09945
G3 X126.815 Y154.187 I.005 J-2.672 E.00877
M73 P89 R1
G1 X126.707 Y154.177 E.00534
; LINE_WIDTH: 0.532896
G1 F5438.637
G1 X126.574 Y154.154 E.00726
; LINE_WIDTH: 0.577931
G1 F4965.657
G3 X126.233 Y153.991 I.184 J-.823 E.0225
G1 X126.2 Y153.962 E.00263
; LINE_WIDTH: 0.56207
G1 F5122.555
G3 X126.131 Y153.885 I.782 J-.763 E.00593
G1 X126.063 Y153.782 E.00705
; LINE_WIDTH: 0.512211
G1 F5687.456
G1 X125.999 Y153.652 E.00747
; LINE_WIDTH: 0.466511
G1 F6326.986
G1 X125.956 Y153.523 E.00633
; LINE_WIDTH: 0.420804
M73 P89 R0
G1 F7128.681
G1 X125.928 Y153.392 E.00548
; LINE_WIDTH: 0.375413
G1 F8154.87
G1 X125.906 Y153.225 E.00606
; LINE_WIDTH: 0.322655
G1 F9793.438
G1 X125.89 Y152.907 E.00954
G1 X125.89 Y146.765 E.184
; LINE_WIDTH: 0.332787
G1 F9429.569
G1 X125.904 Y146.47 E.00918
; LINE_WIDTH: 0.369328
G1 F8315.343
G1 X125.924 Y146.316 E.00548
; LINE_WIDTH: 0.413817
G1 F7269.505
G3 X125.96 Y146.164 I2.175 J.432 E.0063
G1 X125.967 Y146.14 E.001
; LINE_WIDTH: 0.463352
G1 F6376.549
G1 X126.04 Y145.969 E.00854
; LINE_WIDTH: 0.515464
G1 F5646.832
G3 X126.324 Y145.667 I.681 J.354 E.02183
G1 X126.485 Y145.594 E.00918
; LINE_WIDTH: 0.471193
G1 F6254.924
G1 X126.706 Y145.547 E.01062
; LINE_WIDTH: 0.413791
G1 F7270.025
G3 X129.016 Y145.53 I1.544 J51.951 E.09319
G1 X129.306 Y145.548 E.01175
; LINE_WIDTH: 0.465606
G1 F6341.105
G3 X129.462 Y145.577 I-.211 J1.523 E.00732
; LINE_WIDTH: 0.512279
G1 F5686.602
G3 X129.96 Y145.967 I-.179 J.742 E.03362
; LINE_WIDTH: 0.467504
G1 F6311.568
G1 X130.021 Y146.104 E.00699
; LINE_WIDTH: 0.424934
G1 F7047.992
G1 X130.067 Y146.268 E.00711
; LINE_WIDTH: 0.376755
G1 F8120.295
G1 X130.095 Y146.456 E.00684
; LINE_WIDTH: 0.323491
G1 F9762.362
G1 X130.11 Y146.771 E.00949
G1 X130.11 Y152.907 E.18439
G1 X130.096 Y153.212 E.00915
; LINE_WIDTH: 0.373801
G1 F8196.765
G1 X130.072 Y153.396 E.00665
; LINE_WIDTH: 0.424768
G1 F7051.207
G3 X130.045 Y153.52 I-2.017 J-.367 E.00528
G1 X130.039 Y153.545 E.00106
; LINE_WIDTH: 0.472516
G1 F6234.858
G3 X129.994 Y153.671 I-2.727 J-.891 E.0063
; LINE_WIDTH: 0.518938
G1 F5604.073
G3 X129.922 Y153.81 I-1.463 J-.665 E.00821
; LINE_WIDTH: 0.576505
G1 F4979.373
G3 X129.855 Y153.904 I-.62 J-.375 E.00679
; WIPE_START
G1 X129.717 Y154.03 E-.07119
G1 X129.563 Y154.112 E-.06634
G1 X129.395 Y154.162 E-.06654
G1 X129.374 Y154.166 E-.00814
G1 X129.022 Y154.193 E-.13395
G1 X127.933 Y154.194 E-.41384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.242 Y161.713 Z.88 F42000
G1 X129.792 Y164.869 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.764 Y164.869 E.08326
G1 X127.764 Y157.776 E.29122
G3 X128.324 Y157.019 I.689 J-.076 E.04251
G3 X129.051 Y157.014 I.404 J5.579 E.02987
G3 X129.791 Y157.774 I.022 J.719 E.04897
G1 X129.792 Y164.809 E.28887
; WIPE_START
M204 S6000
G1 X127.793 Y164.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.127 Y164.869 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X127.127 Y157.556 E.30029
G3 X128.345 Y156.257 I1.235 J-.063 E.08166
G3 X129.17 Y156.251 I.483 J9.394 E.03386
G3 X130.283 Y156.733 I.055 J1.397 E.05153
G3 X130.429 Y157.227 I-.705 J.476 E.02149
G1 X130.429 Y165.655 E.34605
G1 X125.571 Y165.655 E.19944
G1 X125.571 Y164.869 E.03228
G1 X127.067 Y164.869 E.06139
M204 S10000
G1 X127.445 Y165.057 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.32316
G1 F9774.625
M204 S6000
G1 X127.445 Y157.772 E.21862
G3 X127.461 Y157.486 I2.29 J-.015 E.0086
G1 X127.473 Y157.415 E.00215
; LINE_WIDTH: 0.381722
G1 F7994.899
G1 X127.545 Y157.17 E.00938
; LINE_WIDTH: 0.435865
G1 F6842.982
G3 X128.261 Y156.648 I.816 J.366 E.03974
G1 X128.522 Y156.631 E.01123
; LINE_WIDTH: 0.458608
G1 F6452.454
G3 X129.447 Y156.683 I.266 J3.58 E.04224
G1 X129.55 Y156.717 E.00492
; LINE_WIDTH: 0.52443
G1 F5537.796
G3 X129.874 Y156.911 I-.327 J.913 E.02016
G1 X129.946 Y156.994 E.0058
; LINE_WIDTH: 0.511857
G1 F5691.913
G1 X130.021 Y157.14 E.00845
; LINE_WIDTH: 0.464808
G1 F6353.604
G1 X130.05 Y157.235 E.0046
M204 S10000
G1 X129.968 Y156.679 F42000
; LINE_WIDTH: 0.378209
G1 F8083.202
M204 S6000
G3 X130.102 Y157.574 I-10.93 J2.101 E.03286
; LINE_WIDTH: 0.322597
G1 F9795.6
G3 X130.11 Y157.757 I-2.291 J.186 E.0055
G1 X130.11 Y165.057 E.21859
G1 X130.091 Y165.107 E.00162
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X130.071 Y165.158 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X130.052 Y165.208 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X130.032 Y165.259 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X127.576 Y165.262 E.11564
G1 X127.445 Y165.241 E.00626
G1 X127.445 Y165.195 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X127.445 Y165.149 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X127.445 Y165.103 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X127.445 Y165.057 E.00151
M204 S10000
G1 X127.445 Y165.241 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X127.314 Y165.262 E.00626
G1 X125.759 Y165.262 E.07328
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F6226.121
G1 X127.314 Y165.262 E-.70018
G1 X127.445 Y165.241 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 839
M625
; layer num/total_layer_count: 3/4
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 671
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.88 I1.059 J.599 P1  F42000
G1 X163.966 Y100.675 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X165.407 Y100.675 E.05913
G1 X165.407 Y91.981 E.35699
G1 X166.043 Y91.981 E.02615
G1 X166.043 Y101.461 E.38924
G1 X161.186 Y101.461 E.19944
G1 X161.186 Y91.981 E.38924
G1 X161.823 Y91.981 E.02615
G1 X161.823 Y100.675 E.35699
G1 X163.337 Y100.675 E.06217
G1 X163.337 Y91.981 E.35699
G1 X163.966 Y91.981 E.02584
G1 X163.966 Y100.615 E.35453
; WIPE_START
M204 S6000
G1 X165.407 Y100.675 E-.54769
G1 X165.407 Y100.117 E-.21231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
; stop printing object, unique label id: 671
M625
; object ids of layer 3 start: 671,839
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.16
G1 X0 Y128.818 F18000 ; move to safe pos
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


; object ids of this layer3 end: 671,839
M625
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
G1 X165.725 Y100.863 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.322089
G1 F9814.613
M204 S6000
G1 X165.725 Y92.168 E.25987
; WIPE_START
G1 X165.725 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.652 Y92.168 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X163.652 Y100.909 E.25374
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X163.652 Y100.956 E.00173
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X163.652 Y101.002 E.00199
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X163.652 Y101.048 E.00225
; LINE_WIDTH: 0.490334
G1 F5976.651
G1 X163.779 Y101.068 E.00632
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X165.594 Y101.068 E.08495
G1 X165.647 Y101.065 E.0025
G1 X165.667 Y101.014 E.00253
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X165.686 Y100.964 E.00222
; LINE_WIDTH: 0.380387
G1 F8028.215
M73 P90 R0
G1 X165.706 Y100.913 E.00198
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X165.725 Y100.863 E.00174
M204 S10000
G1 X163.652 Y101.048 F42000
; LINE_WIDTH: 0.471951
G1 F6243.413
M204 S6000
G1 X163.525 Y101.068 E.00605
G1 X161.582 Y101.065 E.09126
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X161.563 Y101.014 E.00245
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X161.544 Y100.964 E.00222
; LINE_WIDTH: 0.380386
G1 F8028.251
G1 X161.524 Y100.913 E.00198
; LINE_WIDTH: 0.322209
G1 F9810.116
G1 X161.505 Y100.863 E.00162
G1 X161.505 Y92.168 E.25999
; WIPE_START
G1 X161.505 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.594 Y101.723 Z1.16 F42000
G1 X163.989 Y111.401 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X166.043 Y111.401 E.08435
G1 X166.043 Y112.195 E.03258
G1 X161.186 Y112.195 E.19944
G1 X161.186 Y111.401 E.03258
G1 X163.352 Y111.401 E.08894
G1 X163.352 Y103.977 E.30486
G1 X161.186 Y103.977 E.08894
G1 X161.186 Y103.154 E.03378
G1 X166.043 Y103.154 E.19944
G1 X166.043 Y103.977 E.03378
G1 X163.989 Y103.977 E.08435
G1 X163.989 Y111.341 E.3024
M204 S10000
G1 X163.671 Y111.589 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X163.671 Y111.636 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X163.671 Y111.683 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
G1 X163.671 Y111.731 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X163.671 Y111.778 E.00226
G1 X163.802 Y111.798 E.00636
G1 X165.856 Y111.798 E.09848
M204 S10000
G1 X161.374 Y111.798 F42000
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X163.54 Y111.798 E.10374
G1 X163.671 Y111.778 E.00635
M204 S10000
G1 X163.671 Y111.589 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X163.671 Y103.748 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X163.671 Y103.707 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X163.671 Y103.666 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X163.671 Y103.625 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X163.671 Y103.584 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X163.54 Y103.565 E.00678
G1 X161.374 Y103.565 E.11093
M204 S10000
G1 X163.671 Y103.584 F42000
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X163.802 Y103.565 E.00678
G1 X165.856 Y103.565 E.10522
; WIPE_START
G1 X163.856 Y103.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.424 Y111.177 Z1.16 F42000
G1 X165.23 Y121.969 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X165.407 Y121.632 I-.32 J-.383 E.01601
G1 X165.407 Y113.91 E.31708
G1 X166.043 Y113.91 E.02615
G1 X166.043 Y121.617 E.31644
G3 X165.705 Y122.581 I-1.24 J.106 E.04323
G3 X164.702 Y122.861 I-.879 J-1.213 E.04363
G1 X162.447 Y122.861 E.09262
G3 X161.186 Y121.614 I-.078 J-1.182 E.08227
G1 X161.186 Y113.91 E.31633
G1 X161.823 Y113.91 E.02615
G1 X161.823 Y121.629 E.31693
G2 X162.282 Y122.083 I.466 J-.012 E.0293
G1 X164.869 Y122.083 E.10619
G2 X165.182 Y122.004 I.042 J-.497 E.0135
M204 S10000
G1 X165.58 Y122.15 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.397355
G1 F7624.314
M204 S6000
G2 X165.661 Y121.989 I-2.064 J-1.14 E.0069
; LINE_WIDTH: 0.322658
G1 F9793.336
G2 X165.724 Y121.658 I-1.1 J-.38 E.01012
G1 X165.725 Y114.097 E.22649
; WIPE_START
G1 X165.725 Y116.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.504 Y114.097 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.32208
G1 F9814.941
M204 S6000
G1 X161.513 Y121.752 E.22878
; LINE_WIDTH: 0.343771
G1 F9064.457
G2 X161.64 Y122.108 I.876 J-.112 E.01233
G1 X161.668 Y122.147 E.00156
; LINE_WIDTH: 0.394273
G1 F7694.648
G2 X161.951 Y122.381 I.642 J-.487 E.01414
; LINE_WIDTH: 0.457775
G1 F6465.975
G2 X162.243 Y122.463 I.389 J-.834 E.01379
G1 X162.336 Y122.469 E.00423
G2 X164.698 Y122.472 I1.241 J-55.057 E.10718
G2 X165.449 Y122.291 I.126 J-1.127 E.03577
G1 X165.58 Y122.15 E.00876
; WIPE_START
G1 X165.449 Y122.291 E-.07337
G1 X165.315 Y122.373 E-.05969
G1 X165.167 Y122.426 E-.05992
G1 X164.951 Y122.463 E-.08296
G1 X164.698 Y122.472 E-.09634
G1 X163.678 Y122.471 E-.38772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.042 Y130.095 Z1.16 F42000
G1 X164.183 Y133.055 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X164.609 Y133.195 I.403 J-.509 E.01881
G2 X165.382 Y132.728 I.105 J-.7 E.04021
G2 X165.407 Y132.538 I-.707 J-.187 E.00789
G1 X165.407 Y124.718 E.32108
G1 X166.043 Y124.718 E.02615
G1 X166.043 Y132.528 E.32067
G3 X165.686 Y133.597 I-1.488 J.097 E.04743
G3 X164.495 Y133.955 I-1.005 J-1.179 E.05258
G3 X163.347 Y133.111 I-.005 J-1.196 E.06265
G3 X163.307 Y132.78 I1.419 J-.339 E.01373
G1 X163.307 Y125.982 E.27914
G2 X162.693 Y125.392 I-.61 J.02 E.0387
G2 X161.9 Y125.691 I-.164 J.767 E.03675
G2 X161.824 Y125.945 I.587 J.312 E.01096
G1 X161.823 Y133.795 E.32232
G1 X161.186 Y133.795 E.02615
G1 X161.186 Y125.784 E.32894
G3 X162.31 Y124.559 I1.155 J-.069 E.07616
G3 X162.684 Y124.551 I.254 J3 E.01538
G3 X163.656 Y124.969 I.016 J1.301 E.04472
G3 X163.937 Y125.991 I-1.348 J.921 E.04436
G1 X163.937 Y132.538 E.26882
G2 X164.138 Y133.015 I.649 J.008 E.02185
M204 S10000
G1 X163.722 Y133.084 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.402166
G1 F7517.085
M204 S6000
G3 X163.671 Y132.951 I1.414 J-.625 E.00553
; LINE_WIDTH: 0.362896
G1 F8491.953
G3 X163.636 Y132.773 I1.297 J-.347 E.00629
; LINE_WIDTH: 0.315794
G1 F10056.222
G1 X163.622 Y132.544 E.00668
G1 X163.614 Y125.83 E.19586
G2 X163.574 Y125.629 I-1.895 J.268 E.00598
; LINE_WIDTH: 0.364533
G1 F8446.287
G1 X163.543 Y125.534 E.00348
; LINE_WIDTH: 0.401145
G1 F7539.593
G2 X163.468 Y125.379 I-1.081 J.427 E.0067
; LINE_WIDTH: 0.453319
G1 F6539.241
G1 X163.464 Y125.372 E.00036
G2 X163.367 Y125.243 I-1.302 J.881 E.00725
; LINE_WIDTH: 0.509034
G1 F5727.714
G1 X163.335 Y125.211 E.0023
G2 X163.042 Y125.038 I-.551 J.602 E.01756
; LINE_WIDTH: 0.521621
G1 F5571.504
G2 X161.839 Y125.165 I-.469 J1.33 E.06583
G1 X161.703 Y125.298 E.01005
; LINE_WIDTH: 0.464397
G1 F6360.06
G1 X161.615 Y125.437 E.00755
; LINE_WIDTH: 0.418446
G1 F7175.606
G1 X161.556 Y125.585 E.00652
; LINE_WIDTH: 0.373352
G1 F8208.516
G1 X161.545 Y125.625 E.00148
G2 X161.521 Y125.745 I1.589 J.386 E.0044
; LINE_WIDTH: 0.32313
G1 F9775.741
G1 X161.505 Y125.931 E.0056
G1 X161.505 Y133.608 E.23037
; WIPE_START
G1 X161.505 Y131.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.722 Y133.084 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.456094
G1 F6493.417
M204 S6000
G2 X164.227 Y133.512 I.764 J-.388 E.03073
G1 X164.251 Y133.52 E.00113
; LINE_WIDTH: 0.447257
G1 F6641.634
G2 X164.388 Y133.554 I.503 J-1.746 E.00623
G1 X164.52 Y133.571 E.0059
G2 X165.494 Y133.252 I.177 J-1.107 E.04702
G1 X165.54 Y133.191 E.00338
; LINE_WIDTH: 0.387134
G1 F7862.613
G2 X165.652 Y132.975 I-.76 J-.53 E.0091
; LINE_WIDTH: 0.322642
G1 F9793.925
G2 X165.717 Y132.681 I-1.46 J-.479 E.00904
G1 X165.725 Y124.906 E.23289
; WIPE_START
G1 X165.723 Y126.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.703 Y134.47 Z1.16 F42000
G1 X163.379 Y144.294 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.386 Y136.812 E.30722
G3 X163.985 Y136.401 I.535 J.138 E.03256
G1 X164.712 Y136.401 E.02985
G3 X165.407 Y137.081 I.072 J.621 E.04572
G1 X165.407 Y144.294 E.29617
G1 X163.439 Y144.294 E.0808
M204 S10000
G1 X162.741 Y144.294 F42000
G1 F7144.614
M204 S5000
G1 X162.741 Y137.916 E.26186
G2 X161.624 Y136.511 I-1.429 J-.012 E.07975
G2 X161.186 Y136.421 I-.866 J3.105 E.01835
G1 X161.186 Y135.663 E.03111
G3 X162.29 Y136.043 I-.152 J2.232 E.0485
G3 X162.56 Y136.349 I-.734 J.919 E.01684
G1 X162.876 Y136.891 E.02575
G3 X163.106 Y136.178 I4.986 J1.211 E.03078
G3 X163.832 Y135.637 I.739 J.234 E.03969
G1 X165.22 Y135.638 E.05702
G3 X166.035 Y136.475 I-.061 J.874 E.05247
G1 X166.043 Y145.08 E.35332
G1 X161.186 Y145.08 E.19944
G1 X161.186 Y144.294 E.03227
G1 X162.681 Y144.294 E.06139
M204 S10000
G1 X163.06 Y144.482 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346295
G1 F8984.527
M204 S6000
G1 X163.06 Y144.528 E.00151
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X163.06 Y144.574 E.00176
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X163.06 Y144.62 E.00201
; LINE_WIDTH: 0.472491
G1 F6235.243
G1 X163.06 Y144.666 E.00217
G1 X163.191 Y144.687 E.00625
G1 X165.647 Y144.684 E.11554
; LINE_WIDTH: 0.458437
G1 F6455.231
G1 X165.667 Y144.633 E.00246
; LINE_WIDTH: 0.419497
G1 F7154.616
G1 X165.686 Y144.583 E.00222
; LINE_WIDTH: 0.380557
G1 F8023.964
G1 X165.705 Y144.532 E.00198
; LINE_WIDTH: 0.322423
G1 F9802.084
G1 X165.725 Y144.482 E.00162
G1 X165.725 Y137.075 E.22165
G1 X165.71 Y136.793 E.00847
; LINE_WIDTH: 0.374154
G1 F8187.567
G2 X165.686 Y136.628 I-1.508 J.141 E.00599
; LINE_WIDTH: 0.422538
G1 F7094.589
G1 X165.657 Y136.512 E.00494
; LINE_WIDTH: 0.46761
G1 F6309.915
G1 X165.61 Y136.398 E.0057
; LINE_WIDTH: 0.512401
M73 P91 R0
G1 F5685.071
G1 X165.532 Y136.273 E.00759
; LINE_WIDTH: 0.557087
G1 F5173.915
G1 X165.377 Y136.128 E.01206
G1 X165.205 Y136.063 E.0104
; LINE_WIDTH: 0.512276
G1 F5686.647
G2 X165.079 Y136.041 I-.32 J1.464 E.0066
; LINE_WIDTH: 0.453889
G1 F6529.772
G2 X163.722 Y136.04 I-.69 J8.329 E.06105
G1 X163.664 Y136.058 E.00274
; LINE_WIDTH: 0.433799
G1 F6880.797
G2 X163.587 Y136.099 I.241 J.548 E.00371
; LINE_WIDTH: 0.379207
G1 F8057.919
G1 X163.547 Y136.126 E.00173
G2 X163.23 Y136.38 I2.772 J3.787 E.01481
M204 S10000
G1 X163.662 Y135.848 F42000
; LINE_WIDTH: 0.226209
G1 F12000
M204 S6000
G2 X163.311 Y136.387 I4.835 J3.537 E.01218
; LINE_WIDTH: 0.194861
G1 X163.251 Y136.5 E.00197
; LINE_WIDTH: 0.155445
G1 X163.193 Y136.642 E.00167
G1 X163.133 Y136.892 E.0028
; LINE_WIDTH: 0.195421
G1 X163.114 Y137.018 E.00195
; LINE_WIDTH: 0.233087
G1 X163.095 Y137.143 E.0025
; LINE_WIDTH: 0.270753
G1 X163.077 Y137.268 E.00304
; LINE_WIDTH: 0.308419
G1 F10354.851
G1 X163.058 Y137.393 E.00359
; LINE_WIDTH: 0.348633
G1 F8911.714
G2 X163.056 Y137.743 I.864 J.178 E.01159
G1 X163.057 Y137.754 E.00038
; LINE_WIDTH: 0.322561
G1 F9796.936
G1 X163.06 Y144.482 E.20143
M204 S10000
G1 X163.06 Y144.666 F42000
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X162.929 Y144.687 E.00625
G1 X161.374 Y144.687 E.0732
; WIPE_START
G1 X162.929 Y144.687 E-.70018
G1 X163.06 Y144.666 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.592 Y137.176 Z1.16 F42000
G1 X161.374 Y136.063 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.424515
G1 F7056.096
M204 S6000
G3 X161.901 Y136.223 I-.491 J2.575 E.02297
; LINE_WIDTH: 0.387082
G1 F7863.856
G3 X162.065 Y136.308 I-1.028 J2.18 E.00686
G1 X162.136 Y136.356 E.00322
; LINE_WIDTH: 0.321734
G1 F9827.921
G3 X162.567 Y136.732 I-2.236 J2.99 E.01708
M204 S10000
G1 X162.705 Y137.02 F42000
; LINE_WIDTH: 0.128405
G1 F12000
M204 S6000
G1 X162.543 Y136.782 E.00224
; LINE_WIDTH: 0.173837
G1 X162.444 Y136.657 E.00207
; LINE_WIDTH: 0.211359
G1 X162.392 Y136.598 E.00135
; LINE_WIDTH: 0.242625
G1 X162.334 Y136.532 E.00183
; LINE_WIDTH: 0.267897
G1 X161.822 Y135.998 E.01753
; WIPE_START
G1 X162.334 Y136.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.379 Y144.093 Z1.16 F42000
G1 X164.938 Y155.367 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X164.615 Y155.43 I-.304 J-.704 E.01362
G1 X162.614 Y155.43 E.08215
G3 X162.375 Y155.398 I-.004 J-.88 E.00994
G3 X161.823 Y154.54 I.273 J-.782 E.04513
G1 X161.829 Y148.29 E.25661
G3 X162.615 Y147.529 I.764 J.003 E.05008
G1 X164.615 Y147.529 E.08213
G3 X165.043 Y147.64 I-.051 J1.073 E.01829
G3 X165.407 Y148.412 I-.512 J.713 E.03656
G1 X165.401 Y154.664 E.25671
G3 X164.992 Y155.341 I-.767 J-.001 E.03413
; WIPE_START
M204 S6000
G1 X164.736 Y155.422 E-.10205
G1 X164.615 Y155.43 E-.04617
G1 X163.005 Y155.43 E-.61177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.251 Y148.135 Z1.16 F42000
G1 X165.598 Y147.008 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X166.041 Y147.889 I-.632 J.869 E.04203
G1 X166.044 Y155.038 E.29353
G3 X165.307 Y156.175 I-1.108 J.089 E.05985
G3 X164.916 Y156.231 I-.394 J-1.38 E.01624
G1 X162.313 Y156.231 E.10687
G3 X161.194 Y155.199 I-.062 J-1.056 E.06976
G1 X161.186 Y147.995 E.29579
G3 X161.924 Y146.857 I1.108 J-.09 E.0599
G3 X162.313 Y146.803 I.412 J1.52 E.01617
G1 X164.949 Y146.803 E.1082
G3 X165.549 Y146.975 I.018 J1.074 E.02601
M204 S10000
G1 X165.313 Y147.32 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.512533
G1 F5683.407
M204 S6000
G1 X165.396 Y147.378 E.00521
G3 X165.576 Y147.607 I-.5 J.581 E.01513
; LINE_WIDTH: 0.465828
G1 F6337.635
G1 X165.639 Y147.749 E.00719
; LINE_WIDTH: 0.422828
G1 F7088.918
G3 X165.684 Y147.911 I-1.37 J.465 E.00697
; LINE_WIDTH: 0.376307
G1 F8131.805
G1 X165.709 Y148.089 E.00649
; LINE_WIDTH: 0.323499
G1 F9762.066
G1 X165.725 Y148.407 E.00958
G1 X165.725 Y154.544 E.1844
G1 X165.711 Y154.846 E.0091
; LINE_WIDTH: 0.369735
G1 F8304.403
G1 X165.692 Y155.003 E.00557
; LINE_WIDTH: 0.410625
G1 F7335.691
G1 X165.667 Y155.126 E.00503
; LINE_WIDTH: 0.440498
G1 F6759.627
G1 X165.653 Y155.184 E.00257
; LINE_WIDTH: 0.473919
G1 F6213.719
G1 X165.607 Y155.312 E.00644
; LINE_WIDTH: 0.519006
G1 F5603.245
G1 X165.538 Y155.445 E.00784
; LINE_WIDTH: 0.576595
G1 F4978.505
G3 X165.251 Y155.715 I-.65 J-.403 E.02349
G1 X165.207 Y155.736 E.00285
; LINE_WIDTH: 0.557095
G1 F5173.83
G3 X164.967 Y155.805 I-.384 J-.876 E.01419
; LINE_WIDTH: 0.488645
G1 F6000.207
G1 X164.937 Y155.81 E.00151
G3 X162.593 Y155.83 I-1.552 J-44.721 E.11462
G1 X162.444 Y155.825 E.0073
; LINE_WIDTH: 0.517952
G1 F5616.149
G1 X162.219 Y155.797 E.01181
; LINE_WIDTH: 0.575522
G1 F4988.861
G3 X161.834 Y155.615 I.155 J-.825 E.02532
G1 X161.829 Y155.611 E.00039
; LINE_WIDTH: 0.563318
G1 F5109.853
G3 X161.717 Y155.483 I.819 J-.831 E.00979
G1 X161.677 Y155.418 E.00439
; LINE_WIDTH: 0.511265
G1 F5699.381
G1 X161.613 Y155.284 E.00761
; LINE_WIDTH: 0.465162
G1 F6348.059
G1 X161.572 Y155.162 E.00597
; LINE_WIDTH: 0.420565
G1 F7133.424
G1 X161.543 Y155.027 E.00566
; LINE_WIDTH: 0.37533
G1 F8157.001
G1 X161.521 Y154.863 E.00597
; LINE_WIDTH: 0.322662
G1 F9793.193
G1 X161.505 Y154.544 E.00957
G1 X161.505 Y148.401 E.184
; LINE_WIDTH: 0.332575
G1 F9436.894
G1 X161.519 Y148.109 E.00909
; LINE_WIDTH: 0.368868
G1 F8327.707
G1 X161.539 Y147.953 E.00553
; LINE_WIDTH: 0.410626
G1 F7335.671
G1 X161.575 Y147.799 E.00634
; LINE_WIDTH: 0.457563
G1 F6469.412
G3 X161.623 Y147.67 I1.251 J.393 E.00624
G1 X161.646 Y147.623 E.0024
; LINE_WIDTH: 0.514232
G1 F5662.153
G3 X162.105 Y147.23 I.686 J.337 E.03216
; LINE_WIDTH: 0.473956
G1 F6213.171
G1 X162.285 Y147.188 E.00873
; LINE_WIDTH: 0.414709
G1 F7251.218
G3 X162.598 Y147.166 I.339 J2.627 E.01269
G3 X164.621 Y147.166 I1.007 J64.743 E.08184
G3 X164.935 Y147.186 I-.083 J3.885 E.01274
; LINE_WIDTH: 0.468651
G1 F6293.842
G3 X165.088 Y147.217 I-.306 J1.881 E.00728
; LINE_WIDTH: 0.512533
G1 F5683.407
G3 X165.263 Y147.286 I-.192 J.742 E.00975
G1 X165.264 Y147.286 E.00001
; WIPE_START
G1 X165.396 Y147.378 E-.06114
G1 X165.508 Y147.497 E-.06207
G1 X165.576 Y147.607 E-.04914
G1 X165.639 Y147.749 E-.05906
G1 X165.684 Y147.911 E-.06392
G1 X165.709 Y148.089 E-.06835
G1 X165.725 Y148.407 E-.12112
G1 X165.725 Y149.132 E-.2752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.585 Y156.763 Z1.16 F42000
G1 X165.407 Y166.506 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.379 Y166.506 E.08326
G1 X163.383 Y159.308 E.29551
G3 X164.036 Y158.65 I.646 J-.012 E.04248
G1 X164.643 Y158.65 E.02491
G3 X165.406 Y159.411 I.029 J.734 E.04969
G1 X165.407 Y166.446 E.28884
; WIPE_START
M204 S6000
G1 X163.407 Y166.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.741 Y166.506 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X162.741 Y159.191 E.30035
G3 X164.006 Y157.89 I1.246 J-.054 E.08341
G3 X164.762 Y157.887 I.428 J12.533 E.03105
G3 X165.868 Y158.331 I.067 J1.431 E.05048
G3 X166.043 Y158.863 I-.684 J.52 E.02342
G1 X166.043 Y167.292 E.34607
G1 X161.186 Y167.292 E.19944
G1 X161.186 Y166.506 E.03228
G1 X162.681 Y166.506 E.06139
M204 S10000
G1 X163.06 Y166.693 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322953
G1 F9782.342
M204 S6000
G1 X163.06 Y159.409 E.21843
G1 X163.079 Y159.1 E.00927
; LINE_WIDTH: 0.373857
G1 F8195.307
G3 X163.126 Y158.897 I1.471 J.236 E.00748
G1 X163.145 Y158.844 E.002
; LINE_WIDTH: 0.433482
G1 F6886.652
G3 X163.876 Y158.284 I.826 J.321 E.04126
G1 X164.018 Y158.27 E.00609
; LINE_WIDTH: 0.456713
G1 F6483.285
G1 X164.133 Y158.268 E.0052
G3 X165.148 Y158.346 I.259 J3.252 E.04626
; LINE_WIDTH: 0.523751
G1 F5545.906
G3 X165.566 Y158.639 I-.265 J.823 E.02742
; LINE_WIDTH: 0.509825
G1 F5717.631
G1 X165.637 Y158.78 E.00806
; LINE_WIDTH: 0.462526
G1 F6389.64
G1 X165.665 Y158.873 E.00448
M204 S10000
G1 X165.571 Y158.307 F42000
; LINE_WIDTH: 0.388394
G1 F7832.436
M204 S6000
G3 X165.71 Y159.136 I-11.863 J2.411 E.0315
; LINE_WIDTH: 0.322821
G1 F9787.241
G1 X165.725 Y159.405 E.00807
G1 X165.725 Y166.693 E.21846
G1 X165.705 Y166.744 E.00162
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X165.686 Y166.794 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X165.666 Y166.845 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X165.647 Y166.895 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X163.191 Y166.899 E.11564
G1 X163.06 Y166.878 E.00626
G1 X163.06 Y166.832 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X163.06 Y166.785 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X163.06 Y166.739 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X163.06 Y166.693 E.00151
M204 S10000
G1 X163.06 Y166.878 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X162.929 Y166.899 E.00626
G1 X161.374 Y166.899 E.07328
; OBJECT_ID: 839
; WIPE_START
G1 X162.929 Y166.899 E-.70018
G1 X163.06 Y166.878 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 671
M625
; start printing object, unique label id: 839
M624 AgAAAAAAAAA=
M204 S10000
G1 X159.584 Y160.083 Z1.16 F42000
G1 X128.352 Y99.039 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X129.792 Y99.039 E.05913
G1 X129.792 Y90.345 E.35699
G1 X130.429 Y90.345 E.02615
G1 X130.429 Y99.824 E.38924
G1 X125.571 Y99.824 E.19944
G1 X125.571 Y90.345 E.38924
G1 X126.208 Y90.345 E.02615
G1 X126.208 Y99.039 E.35699
G1 X127.722 Y99.039 E.06217
G1 X127.722 Y90.345 E.35699
G1 X128.352 Y90.345 E.02584
G1 X128.352 Y98.979 E.35453
M204 S10000
G1 X128.037 Y99.273 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X128.037 Y90.532 E.25374
; WIPE_START
G1 X128.037 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.11 Y90.532 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.322089
G1 F9814.613
M204 S6000
G1 X130.11 Y99.226 E.25987
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X130.091 Y99.277 E.00174
; LINE_WIDTH: 0.380387
G1 F8028.215
G1 X130.071 Y99.327 E.00198
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X130.052 Y99.378 E.00222
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X130.032 Y99.428 E.00253
G1 X129.979 Y99.432 E.0025
G1 X128.164 Y99.432 E.08495
; LINE_WIDTH: 0.490334
G1 F5976.651
G1 X128.037 Y99.412 E.00632
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X128.037 Y99.366 E.00225
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X128.037 Y99.319 E.00199
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X128.037 Y99.273 E.00173
M204 S10000
G1 X128.037 Y99.412 F42000
; LINE_WIDTH: 0.471951
G1 F6243.413
M204 S6000
G1 X127.91 Y99.432 E.00605
G1 X125.968 Y99.428 E.09126
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X125.948 Y99.378 E.00245
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X125.929 Y99.327 E.00222
; LINE_WIDTH: 0.380386
G1 F8028.251
G1 X125.909 Y99.277 E.00198
; LINE_WIDTH: 0.322209
G1 F9810.116
G1 X125.89 Y99.226 E.00162
G1 X125.89 Y90.532 E.25999
; WIPE_START
G1 X125.89 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.979 Y100.086 Z1.16 F42000
G1 X128.374 Y109.765 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X130.429 Y109.765 E.08435
G1 X130.429 Y110.559 E.03258
G1 X125.571 Y110.559 E.19944
G1 X125.571 Y109.765 E.03258
G1 X127.737 Y109.765 E.08894
G1 X127.737 Y102.34 E.30486
G1 X125.571 Y102.34 E.08894
G1 X125.571 Y101.518 E.03378
G1 X130.429 Y101.518 E.19944
G1 X130.429 Y102.34 E.03378
G1 X128.374 Y102.34 E.08435
G1 X128.374 Y109.705 E.3024
M204 S10000
G1 X128.056 Y109.953 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X128.056 Y110 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X128.056 Y110.047 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
G1 X128.056 Y110.094 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X128.056 Y110.141 E.00226
G1 X128.187 Y110.162 E.00636
G1 X130.241 Y110.162 E.09848
M204 S10000
G1 X125.759 Y110.162 F42000
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X127.925 Y110.162 E.10374
G1 X128.056 Y110.141 E.00635
M204 S10000
G1 X128.056 Y109.953 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X128.056 Y102.112 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X128.056 Y102.071 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X128.056 Y102.03 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X128.056 Y101.989 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X128.056 Y101.948 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X127.925 Y101.929 E.00678
G1 X125.759 Y101.929 E.11093
M204 S10000
G1 X128.056 Y101.948 F42000
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X128.187 Y101.929 E.00678
G1 X130.241 Y101.929 E.10522
; WIPE_START
G1 X128.241 Y101.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.809 Y109.54 Z1.16 F42000
G1 X129.615 Y120.332 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.792 Y119.996 I-.32 J-.383 E.01601
G1 X129.792 Y112.274 E.31708
G1 X130.429 Y112.274 E.02615
G1 X130.428 Y119.98 E.31644
G3 X130.09 Y120.945 I-1.24 J.106 E.04323
G3 X129.088 Y121.224 I-.879 J-1.213 E.04363
G1 X126.832 Y121.224 E.09262
G3 X125.571 Y119.978 I-.078 J-1.182 E.08227
G1 X125.571 Y112.274 E.31633
G1 X126.208 Y112.274 E.02615
G1 X126.208 Y119.992 E.31693
G2 X126.667 Y120.447 I.466 J-.012 E.0293
G1 X129.254 Y120.447 E.10619
G2 X129.567 Y120.368 I.042 J-.497 E.0135
M204 S10000
G1 X129.965 Y120.513 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.397355
G1 F7624.314
M204 S6000
G2 X130.046 Y120.353 I-2.064 J-1.14 E.0069
; LINE_WIDTH: 0.322658
G1 F9793.336
G2 X130.109 Y120.022 I-1.1 J-.38 E.01012
G1 X130.11 Y112.461 E.22649
; WIPE_START
G1 X130.11 Y114.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.889 Y112.461 Z1.16 F42000
G1 Z.76
M73 P92 R0
G1 E.8 F1800
; LINE_WIDTH: 0.32208
G1 F9814.941
M204 S6000
G1 X125.898 Y120.115 E.22878
; LINE_WIDTH: 0.343771
G1 F9064.457
G2 X126.025 Y120.472 I.876 J-.112 E.01233
G1 X126.054 Y120.51 E.00156
; LINE_WIDTH: 0.394273
G1 F7694.648
G2 X126.337 Y120.745 I.642 J-.487 E.01414
; LINE_WIDTH: 0.457775
G1 F6465.975
G2 X126.628 Y120.826 I.389 J-.834 E.01379
G1 X126.721 Y120.833 E.00423
G2 X129.083 Y120.835 I1.241 J-55.057 E.10718
G2 X129.834 Y120.655 I.126 J-1.127 E.03577
G1 X129.965 Y120.513 E.00876
; WIPE_START
G1 X129.834 Y120.655 E-.07337
G1 X129.7 Y120.736 E-.05969
G1 X129.552 Y120.79 E-.05992
G1 X129.337 Y120.827 E-.08296
G1 X129.083 Y120.835 E-.09634
G1 X128.063 Y120.834 E-.38772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.427 Y128.458 Z1.16 F42000
G1 X128.568 Y131.418 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.994 Y131.558 I.403 J-.509 E.01881
G2 X129.767 Y131.092 I.105 J-.7 E.04021
G2 X129.792 Y130.902 I-.707 J-.187 E.00789
G1 X129.792 Y123.082 E.32108
G1 X130.429 Y123.082 E.02615
G1 X130.428 Y130.892 E.32067
G3 X130.072 Y131.96 I-1.488 J.097 E.04743
G3 X128.88 Y132.319 I-1.005 J-1.179 E.05258
G3 X127.732 Y131.475 I-.005 J-1.196 E.06265
G3 X127.692 Y131.144 I1.419 J-.339 E.01373
G1 X127.692 Y124.345 E.27914
G2 X127.078 Y123.756 I-.61 J.02 E.0387
G2 X126.285 Y124.054 I-.164 J.767 E.03675
G2 X126.21 Y124.309 I.587 J.312 E.01096
G1 X126.208 Y132.159 E.32232
G1 X125.571 Y132.159 E.02615
G1 X125.571 Y124.147 E.32894
G3 X126.695 Y122.922 I1.155 J-.069 E.07616
G3 X127.069 Y122.914 I.254 J3 E.01538
G3 X128.041 Y123.332 I.016 J1.301 E.04472
G3 X128.322 Y124.355 I-1.348 J.921 E.04436
G1 X128.322 Y130.902 E.26882
G2 X128.523 Y131.379 I.649 J.008 E.02185
M204 S10000
G1 X128.107 Y131.447 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.402166
G1 F7517.085
M204 S6000
G3 X128.056 Y131.315 I1.414 J-.625 E.00553
; LINE_WIDTH: 0.362896
G1 F8491.953
G3 X128.021 Y131.136 I1.297 J-.347 E.00629
; LINE_WIDTH: 0.315794
G1 F10056.222
G1 X128.007 Y130.908 E.00668
G1 X127.999 Y124.194 E.19586
G2 X127.959 Y123.992 I-1.895 J.268 E.00598
; LINE_WIDTH: 0.364533
G1 F8446.287
G1 X127.928 Y123.897 E.00348
; LINE_WIDTH: 0.401145
G1 F7539.593
G2 X127.853 Y123.742 I-1.081 J.427 E.0067
; LINE_WIDTH: 0.453319
G1 F6539.241
G1 X127.849 Y123.736 E.00036
G2 X127.752 Y123.607 I-1.302 J.881 E.00725
; LINE_WIDTH: 0.509034
G1 F5727.714
G1 X127.721 Y123.574 E.0023
G2 X127.427 Y123.402 I-.551 J.602 E.01756
; LINE_WIDTH: 0.521621
G1 F5571.504
G2 X126.224 Y123.528 I-.469 J1.33 E.06583
G1 X126.088 Y123.662 E.01005
; LINE_WIDTH: 0.464397
G1 F6360.06
G1 X126 Y123.8 E.00755
; LINE_WIDTH: 0.418446
G1 F7175.606
G1 X125.941 Y123.948 E.00652
; LINE_WIDTH: 0.373352
G1 F8208.516
G1 X125.93 Y123.988 E.00148
G2 X125.906 Y124.109 I1.589 J.386 E.0044
; LINE_WIDTH: 0.32313
G1 F9775.741
G1 X125.891 Y124.295 E.0056
G1 X125.89 Y131.971 E.23037
; WIPE_START
G1 X125.89 Y129.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.107 Y131.447 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.456094
G1 F6493.417
M204 S6000
G2 X128.613 Y131.876 I.764 J-.388 E.03073
G1 X128.636 Y131.884 E.00113
; LINE_WIDTH: 0.447257
G1 F6641.634
G2 X128.773 Y131.918 I.503 J-1.746 E.00623
G1 X128.906 Y131.935 E.0059
G2 X129.88 Y131.616 I.177 J-1.107 E.04702
G1 X129.925 Y131.554 E.00338
; LINE_WIDTH: 0.387134
G1 F7862.613
G2 X130.037 Y131.338 I-.76 J-.53 E.0091
; LINE_WIDTH: 0.322642
G1 F9793.925
G2 X130.102 Y131.044 I-1.46 J-.479 E.00904
G1 X130.11 Y123.269 E.23289
; WIPE_START
G1 X130.108 Y125.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.088 Y132.833 Z1.16 F42000
G1 X127.764 Y142.658 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.771 Y135.175 E.30722
G3 X128.37 Y134.764 I.535 J.138 E.03256
G1 X129.097 Y134.764 E.02985
G3 X129.792 Y135.445 I.072 J.621 E.04572
G1 X129.792 Y142.658 E.29617
G1 X127.824 Y142.658 E.0808
M204 S10000
G1 X127.127 Y142.658 F42000
G1 F7144.614
M204 S5000
G1 X127.127 Y136.28 E.26186
G2 X126.009 Y134.874 I-1.429 J-.011 E.07975
G2 X125.571 Y134.784 I-.866 J3.105 E.01835
G1 X125.571 Y134.026 E.03111
G3 X126.675 Y134.407 I-.152 J2.232 E.0485
G3 X126.945 Y134.713 I-.734 J.919 E.01684
G1 X127.262 Y135.254 E.02575
G3 X127.491 Y134.542 I4.986 J1.211 E.03078
G3 X128.217 Y134.001 I.739 J.234 E.03969
G1 X129.605 Y134.002 E.05702
G3 X130.42 Y134.838 I-.061 J.874 E.05247
G1 X130.429 Y143.444 E.35332
G1 X125.571 Y143.444 E.19944
G1 X125.571 Y142.658 E.03227
G1 X127.067 Y142.658 E.06139
M204 S10000
G1 X127.445 Y142.845 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346295
G1 F8984.527
M204 S6000
G1 X127.445 Y142.891 E.00151
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X127.445 Y142.937 E.00176
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X127.445 Y142.984 E.00201
; LINE_WIDTH: 0.472491
G1 F6235.243
G1 X127.445 Y143.03 E.00217
G1 X127.576 Y143.051 E.00625
G1 X130.032 Y143.047 E.11554
; LINE_WIDTH: 0.458437
G1 F6455.231
G1 X130.052 Y142.997 E.00246
; LINE_WIDTH: 0.419497
G1 F7154.616
G1 X130.071 Y142.946 E.00222
; LINE_WIDTH: 0.380557
G1 F8023.964
G1 X130.091 Y142.896 E.00198
; LINE_WIDTH: 0.322423
G1 F9802.084
G1 X130.11 Y142.845 E.00162
G1 X130.11 Y135.439 E.22165
G1 X130.096 Y135.156 E.00847
; LINE_WIDTH: 0.374154
G1 F8187.567
G2 X130.071 Y134.991 I-1.508 J.141 E.00599
; LINE_WIDTH: 0.422538
G1 F7094.589
G1 X130.042 Y134.875 E.00494
; LINE_WIDTH: 0.46761
G1 F6309.915
G1 X129.995 Y134.762 E.0057
; LINE_WIDTH: 0.512401
G1 F5685.071
G1 X129.918 Y134.637 E.00759
; LINE_WIDTH: 0.557087
G1 F5173.915
G1 X129.762 Y134.492 E.01206
G1 X129.59 Y134.427 E.0104
; LINE_WIDTH: 0.512276
G1 F5686.647
G2 X129.464 Y134.405 I-.32 J1.464 E.0066
; LINE_WIDTH: 0.453889
G1 F6529.772
G2 X128.107 Y134.403 I-.69 J8.329 E.06105
G1 X128.049 Y134.422 E.00274
; LINE_WIDTH: 0.433799
G1 F6880.797
G2 X127.972 Y134.463 I.241 J.548 E.00371
; LINE_WIDTH: 0.379207
G1 F8057.919
G1 X127.933 Y134.489 E.00173
G2 X127.615 Y134.743 I2.772 J3.787 E.01481
M204 S10000
G1 X128.047 Y134.212 F42000
; LINE_WIDTH: 0.226209
G1 F12000
M204 S6000
G2 X127.696 Y134.75 I4.835 J3.537 E.01218
; LINE_WIDTH: 0.194861
G1 X127.636 Y134.863 E.00197
; LINE_WIDTH: 0.155445
G1 X127.579 Y135.006 E.00167
G1 X127.518 Y135.256 E.0028
; LINE_WIDTH: 0.195421
G1 X127.499 Y135.381 E.00195
; LINE_WIDTH: 0.233087
G1 X127.481 Y135.506 E.0025
; LINE_WIDTH: 0.270753
G1 X127.462 Y135.632 E.00304
; LINE_WIDTH: 0.308419
G1 F10354.851
G1 X127.443 Y135.757 E.00359
; LINE_WIDTH: 0.348633
G1 F8911.714
G2 X127.442 Y136.107 I.864 J.178 E.01159
G1 X127.442 Y136.118 E.00038
; LINE_WIDTH: 0.322561
G1 F9796.936
G1 X127.445 Y142.845 E.20143
M204 S10000
G1 X127.445 Y143.03 F42000
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X127.314 Y143.051 E.00625
G1 X125.759 Y143.051 E.0732
; WIPE_START
G1 X127.314 Y143.051 E-.70018
G1 X127.445 Y143.03 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.977 Y135.54 Z1.16 F42000
G1 X125.759 Y134.427 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.424515
G1 F7056.096
M204 S6000
G3 X126.287 Y134.587 I-.491 J2.575 E.02297
; LINE_WIDTH: 0.387082
G1 F7863.856
G3 X126.45 Y134.671 I-1.028 J2.18 E.00686
G1 X126.521 Y134.72 E.00322
; LINE_WIDTH: 0.321734
G1 F9827.921
G3 X126.952 Y135.096 I-2.236 J2.99 E.01708
M204 S10000
G1 X127.09 Y135.383 F42000
; LINE_WIDTH: 0.128405
G1 F12000
M204 S6000
G1 X126.928 Y135.146 E.00224
; LINE_WIDTH: 0.173837
G1 X126.829 Y135.021 E.00207
; LINE_WIDTH: 0.211359
G1 X126.777 Y134.962 E.00135
; LINE_WIDTH: 0.242625
G1 X126.719 Y134.896 E.00183
; LINE_WIDTH: 0.267897
G1 X126.207 Y134.362 E.01753
; WIPE_START
G1 X126.719 Y134.896 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.765 Y142.456 Z1.16 F42000
G1 X129.323 Y153.731 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X129 Y153.793 I-.304 J-.704 E.01362
G1 X126.999 Y153.793 E.08215
G3 X126.76 Y153.761 I-.004 J-.88 E.00994
G3 X126.208 Y152.903 I.273 J-.782 E.04513
G1 X126.214 Y146.653 E.25661
G3 X127 Y145.892 I.764 J.003 E.05008
G1 X129 Y145.892 E.08213
G3 X129.428 Y146.004 I-.051 J1.073 E.01829
G3 X129.792 Y146.775 I-.512 J.713 E.03656
G1 X129.786 Y153.027 E.25671
G3 X129.377 Y153.705 I-.767 J-.001 E.03413
; WIPE_START
M204 S6000
G1 X129.121 Y153.786 E-.10205
G1 X129 Y153.793 E-.04617
G1 X127.39 Y153.793 E-.61177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.636 Y146.499 Z1.16 F42000
G1 X129.983 Y145.372 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X130.426 Y146.253 I-.632 J.869 E.04203
G1 X130.429 Y153.401 E.29353
G3 X129.692 Y154.539 I-1.108 J.089 E.05985
G3 X129.301 Y154.594 I-.394 J-1.38 E.01624
G1 X126.698 Y154.594 E.10687
G3 X125.579 Y153.563 I-.062 J-1.056 E.06976
G1 X125.571 Y146.359 E.29579
G3 X126.31 Y145.221 I1.108 J-.09 E.0599
G3 X126.699 Y145.166 I.412 J1.52 E.01617
G1 X129.334 Y145.167 E.1082
G3 X129.934 Y145.338 I.018 J1.074 E.02601
M204 S10000
G1 X129.698 Y145.684 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.512533
G1 F5683.407
M204 S6000
G1 X129.781 Y145.742 E.00521
G3 X129.962 Y145.97 I-.5 J.581 E.01513
; LINE_WIDTH: 0.465828
G1 F6337.635
G1 X130.024 Y146.112 E.00719
; LINE_WIDTH: 0.422828
G1 F7088.918
G3 X130.069 Y146.275 I-1.37 J.465 E.00697
; LINE_WIDTH: 0.376307
G1 F8131.805
G1 X130.095 Y146.453 E.00649
; LINE_WIDTH: 0.323499
G1 F9762.066
G1 X130.11 Y146.771 E.00958
G1 X130.11 Y152.907 E.1844
G1 X130.096 Y153.21 E.0091
; LINE_WIDTH: 0.369735
G1 F8304.403
G1 X130.077 Y153.367 E.00557
; LINE_WIDTH: 0.410625
G1 F7335.691
G1 X130.053 Y153.49 E.00503
; LINE_WIDTH: 0.440498
G1 F6759.627
G1 X130.038 Y153.547 E.00257
; LINE_WIDTH: 0.473919
G1 F6213.719
G1 X129.992 Y153.676 E.00644
; LINE_WIDTH: 0.519006
G1 F5603.245
G1 X129.923 Y153.809 E.00784
; LINE_WIDTH: 0.576595
G1 F4978.505
G3 X129.636 Y154.079 I-.65 J-.403 E.02349
G1 X129.592 Y154.1 E.00285
; LINE_WIDTH: 0.557095
G1 F5173.83
G3 X129.353 Y154.169 I-.384 J-.876 E.01419
; LINE_WIDTH: 0.488645
G1 F6000.207
G1 X129.322 Y154.174 E.00151
G3 X126.978 Y154.193 I-1.552 J-44.721 E.11462
G1 X126.829 Y154.188 E.0073
; LINE_WIDTH: 0.517952
G1 F5616.149
G1 X126.604 Y154.161 E.01181
; LINE_WIDTH: 0.575522
G1 F4988.861
G3 X126.219 Y153.979 I.155 J-.825 E.02532
G1 X126.214 Y153.974 E.00039
; LINE_WIDTH: 0.563318
G1 F5109.853
G3 X126.102 Y153.846 I.819 J-.831 E.00979
G1 X126.062 Y153.781 E.00439
; LINE_WIDTH: 0.511265
G1 F5699.381
G1 X125.998 Y153.648 E.00761
; LINE_WIDTH: 0.465162
G1 F6348.059
G1 X125.957 Y153.526 E.00597
; LINE_WIDTH: 0.420565
G1 F7133.424
G1 X125.928 Y153.391 E.00566
; LINE_WIDTH: 0.37533
G1 F8157.001
G1 X125.906 Y153.227 E.00597
; LINE_WIDTH: 0.322662
G1 F9793.193
G1 X125.89 Y152.907 E.00957
G1 X125.89 Y146.765 E.184
; LINE_WIDTH: 0.332575
G1 F9436.894
G1 X125.904 Y146.473 E.00909
; LINE_WIDTH: 0.368868
G1 F8327.707
G1 X125.924 Y146.317 E.00553
; LINE_WIDTH: 0.410626
G1 F7335.671
G1 X125.96 Y146.163 E.00634
; LINE_WIDTH: 0.457563
G1 F6469.412
G3 X126.008 Y146.034 I1.251 J.393 E.00624
G1 X126.031 Y145.986 E.0024
; LINE_WIDTH: 0.514232
G1 F5662.153
G3 X126.49 Y145.594 I.686 J.337 E.03216
; LINE_WIDTH: 0.473956
G1 F6213.171
G1 X126.67 Y145.551 E.00873
; LINE_WIDTH: 0.414709
G1 F7251.218
G3 X126.983 Y145.529 I.339 J2.627 E.01269
G3 X129.006 Y145.53 I1.007 J64.743 E.08184
G3 X129.32 Y145.549 I-.083 J3.885 E.01274
; LINE_WIDTH: 0.468651
G1 F6293.842
G3 X129.473 Y145.581 I-.306 J1.881 E.00728
; LINE_WIDTH: 0.512533
G1 F5683.407
G3 X129.649 Y145.65 I-.192 J.742 E.00975
G1 X129.649 Y145.65 E.00001
; WIPE_START
G1 X129.781 Y145.742 E-.06114
G1 X129.893 Y145.86 E-.06207
G1 X129.962 Y145.97 E-.04914
G1 X130.024 Y146.112 E-.05906
G1 X130.069 Y146.275 E-.06392
G1 X130.095 Y146.453 E-.06835
G1 X130.11 Y146.771 E-.12112
G1 X130.11 Y147.495 E-.2752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.97 Y155.126 Z1.16 F42000
G1 X129.792 Y164.869 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.764 Y164.869 E.08326
G1 X127.768 Y157.672 E.29551
G3 X128.421 Y157.013 I.646 J-.012 E.04248
G1 X129.028 Y157.013 E.02491
G3 X129.791 Y157.774 I.029 J.734 E.04969
G1 X129.792 Y164.809 E.28884
; WIPE_START
M204 S6000
G1 X127.793 Y164.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.127 Y164.869 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X127.127 Y157.554 E.30035
G3 X128.391 Y156.253 I1.246 J-.054 E.08341
G3 X129.147 Y156.25 I.428 J12.533 E.03105
G3 X130.253 Y156.695 I.067 J1.431 E.05048
G3 X130.429 Y157.227 I-.684 J.52 E.02342
G1 X130.429 Y165.655 E.34607
G1 X125.571 Y165.655 E.19944
G1 X125.571 Y164.869 E.03228
G1 X127.067 Y164.869 E.06139
M204 S10000
G1 X127.445 Y165.057 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322953
G1 F9782.342
M204 S6000
G1 X127.445 Y157.773 E.21843
G1 X127.464 Y157.464 E.00927
; LINE_WIDTH: 0.373857
G1 F8195.307
G3 X127.511 Y157.261 I1.471 J.236 E.00748
G1 X127.53 Y157.208 E.002
; LINE_WIDTH: 0.433482
G1 F6886.652
G3 X128.261 Y156.647 I.827 J.321 E.04126
G1 X128.403 Y156.634 E.00609
; LINE_WIDTH: 0.456713
G1 F6483.285
G1 X128.518 Y156.631 E.0052
G3 X129.533 Y156.71 I.259 J3.252 E.04626
; LINE_WIDTH: 0.523751
G1 F5545.906
G3 X129.952 Y157.003 I-.265 J.823 E.02742
; LINE_WIDTH: 0.509825
G1 F5717.631
G1 X130.022 Y157.143 E.00806
; LINE_WIDTH: 0.462526
M73 P93 R0
G1 F6389.64
G1 X130.05 Y157.237 E.00448
M204 S10000
G1 X129.956 Y156.67 F42000
; LINE_WIDTH: 0.388394
G1 F7832.436
M204 S6000
G3 X130.095 Y157.499 I-11.863 J2.411 E.0315
; LINE_WIDTH: 0.322821
G1 F9787.241
G1 X130.11 Y157.768 E.00807
G1 X130.11 Y165.057 E.21846
G1 X130.091 Y165.107 E.00162
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X130.071 Y165.158 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X130.052 Y165.208 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X130.032 Y165.259 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X127.576 Y165.262 E.11564
G1 X127.445 Y165.241 E.00626
G1 X127.445 Y165.195 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X127.445 Y165.149 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X127.445 Y165.103 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X127.445 Y165.057 E.00151
M204 S10000
G1 X127.445 Y165.241 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X127.314 Y165.262 E.00626
G1 X125.759 Y165.262 E.07328
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F6226.121
G1 X127.314 Y165.262 E-.70018
G1 X127.445 Y165.241 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 839
M625
; layer num/total_layer_count: 4/4
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 671
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.16 I1.059 J.599 P1  F42000
G1 X163.966 Y100.675 Z1.16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X165.407 Y100.675 E.05913
G1 X165.407 Y91.981 E.35699
G1 X166.043 Y91.981 E.02615
G1 X166.043 Y101.461 E.38924
G1 X161.186 Y101.461 E.19944
G1 X161.186 Y91.981 E.38924
G1 X161.823 Y91.981 E.02615
G1 X161.823 Y100.675 E.35699
G1 X163.337 Y100.675 E.06217
G1 X163.337 Y91.981 E.35699
G1 X163.966 Y91.981 E.02584
G1 X163.966 Y100.615 E.35453
; WIPE_START
M204 S6000
G1 X165.407 Y100.675 E-.54769
G1 X165.407 Y100.117 E-.21231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
; stop printing object, unique label id: 671
M625
; object ids of layer 4 start: 671,839
M624 AwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.44
G1 X0 Y128.818 F18000 ; move to safe pos
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
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.44 F4000
            G39.3 S1
            G0 Z1.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer4 end: 671,839
M625
; start printing object, unique label id: 671
M624 AQAAAAAAAAA=
G1 X165.725 Y100.863 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.322089
G1 F9814.613
M204 S6000
G1 X165.725 Y92.168 E.25987
; WIPE_START
G1 X165.725 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.652 Y92.168 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X163.652 Y100.909 E.25374
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X163.652 Y100.956 E.00173
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X163.652 Y101.002 E.00199
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X163.652 Y101.048 E.00225
; LINE_WIDTH: 0.490334
G1 F5976.651
G1 X163.779 Y101.068 E.00632
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X165.594 Y101.068 E.08495
G1 X165.647 Y101.065 E.0025
G1 X165.667 Y101.014 E.00253
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X165.686 Y100.964 E.00222
; LINE_WIDTH: 0.380387
G1 F8028.215
G1 X165.706 Y100.913 E.00198
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X165.725 Y100.863 E.00174
; WIPE_START
G1 X165.706 Y100.913 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.652 Y101.048 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.471951
G1 F6243.413
M204 S6000
G1 X163.525 Y101.068 E.00605
G1 X161.582 Y101.065 E.09126
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X161.563 Y101.014 E.00245
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X161.544 Y100.964 E.00222
; LINE_WIDTH: 0.380386
G1 F8028.251
G1 X161.524 Y100.913 E.00198
; LINE_WIDTH: 0.322209
G1 F9810.116
G1 X161.505 Y100.863 E.00162
G1 X161.505 Y92.168 E.25999
; WIPE_START
G1 X161.505 Y94.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.594 Y101.723 Z1.44 F42000
G1 X163.989 Y111.401 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X166.043 Y111.401 E.08435
G1 X166.043 Y112.195 E.03258
G1 X161.186 Y112.195 E.19944
G1 X161.186 Y111.401 E.03258
G1 X163.352 Y111.401 E.08894
G1 X163.352 Y103.977 E.30486
G1 X161.186 Y103.977 E.08894
G1 X161.186 Y103.154 E.03378
G1 X166.043 Y103.154 E.19944
G1 X166.043 Y103.977 E.03378
G1 X163.989 Y103.977 E.08435
G1 X163.989 Y111.341 E.3024
M204 S10000
G1 X163.671 Y111.589 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X163.671 Y111.636 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X163.671 Y111.683 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
G1 X163.671 Y111.731 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X163.671 Y111.778 E.00226
G1 X163.802 Y111.798 E.00636
G1 X165.856 Y111.798 E.09848
; WIPE_START
G1 X163.856 Y111.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.374 Y111.798 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X163.54 Y111.798 E.10374
G1 X163.671 Y111.778 E.00635
M204 S10000
G1 X163.671 Y111.589 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X163.671 Y103.748 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X163.671 Y103.707 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X163.671 Y103.666 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X163.671 Y103.625 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X163.671 Y103.584 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X163.54 Y103.565 E.00678
G1 X161.374 Y103.565 E.11093
; WIPE_START
G1 X163.374 Y103.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.671 Y103.584 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X163.802 Y103.565 E.00678
G1 X165.856 Y103.565 E.10522
; WIPE_START
G1 X163.856 Y103.565 E-.76
; WIPE_END
M73 P94 R0
G1 E-.04 F1800
M204 S10000
G1 X164.428 Y111.176 Z1.44 F42000
G1 X165.239 Y121.961 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X165.407 Y121.633 I-.329 J-.375 E.01549
G1 X165.407 Y113.91 E.31711
G1 X166.043 Y113.91 E.02615
G1 X166.043 Y121.617 E.31644
G3 X165.708 Y122.578 I-1.227 J.111 E.0431
G3 X164.703 Y122.861 I-.883 J-1.212 E.04379
G1 X162.446 Y122.861 E.09266
G3 X161.186 Y121.616 I-.08 J-1.179 E.08219
G1 X161.186 Y113.91 E.31643
G1 X161.823 Y113.91 E.02615
G1 X161.823 Y121.629 E.31695
G2 X162.282 Y122.083 I.466 J-.013 E.02926
G1 X164.87 Y122.083 E.10628
G2 X165.191 Y121.998 I.04 J-.497 E.01392
M204 S10000
G1 X165.453 Y122.288 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.436193
G1 F6837.01
M204 S6000
G2 X165.58 Y122.15 I-.403 J-.497 E.0081
G1 X165.6 Y122.116 E.00167
; LINE_WIDTH: 0.387201
G1 F7860.993
G2 X165.659 Y121.994 I-1.396 J-.743 E.00506
G1 X165.671 Y121.962 E.00128
; LINE_WIDTH: 0.322511
G1 F9798.802
G2 X165.724 Y121.661 I-1.086 J-.345 E.00917
G1 X165.725 Y114.097 E.22644
; WIPE_START
G1 X165.725 Y116.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.504 Y114.097 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.322092
G1 F9814.5
M204 S6000
G1 X161.508 Y121.7 E.22724
; LINE_WIDTH: 0.342599
G1 F9102.069
G2 X161.615 Y122.065 I.915 J-.069 E.01236
G1 X161.677 Y122.158 E.00358
; LINE_WIDTH: 0.39408
G1 F7699.092
G2 X161.816 Y122.299 I.528 J-.383 E.00759
G1 X161.94 Y122.376 E.00556
; LINE_WIDTH: 0.45859
G1 F6452.75
G2 X162.25 Y122.463 I.397 J-.813 E.01472
G1 X162.347 Y122.47 E.00442
G2 X164.698 Y122.472 I1.229 J-62.327 E.1069
G2 X165.453 Y122.288 I.126 J-1.124 E.03603
; WIPE_START
G1 X165.322 Y122.369 E-.05861
G1 X165.16 Y122.428 E-.06521
G1 X164.937 Y122.464 E-.08588
G1 X164.698 Y122.472 E-.09083
G1 X163.489 Y122.471 E-.45946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.791 Y129.991 Z1.44 F42000
G1 X165.295 Y132.9 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X165.407 Y132.538 I-.559 J-.371 E.01579
G1 X165.407 Y124.718 E.32108
G1 X166.043 Y124.718 E.02615
G1 X166.043 Y132.528 E.32067
G3 X165.692 Y133.591 I-1.507 J.092 E.04709
G3 X164.491 Y133.955 I-1.007 J-1.16 E.0531
G3 X163.348 Y133.113 I-.001 J-1.196 E.0624
G3 X163.307 Y132.78 I1.412 J-.34 E.0138
G1 X163.307 Y125.981 E.27914
G2 X162.708 Y125.394 I-.604 J.016 E.03813
G2 X161.902 Y125.687 I-.175 J.773 E.03717
G2 X161.825 Y125.934 I.569 J.313 E.0107
G1 X161.823 Y133.795 E.3228
G1 X161.186 Y133.795 E.02615
G1 X161.186 Y125.784 E.32895
G3 X162.331 Y124.556 I1.163 J-.063 E.07697
G3 X162.696 Y124.551 I.221 J2.67 E.01499
G3 X163.716 Y125.054 I.019 J1.249 E.04849
G3 X163.937 Y125.991 I-1.643 J.881 E.04001
G1 X163.937 Y132.538 E.26882
G2 X164.662 Y133.196 I.662 J-.001 E.04522
G2 X165.259 Y132.949 I.074 J-.667 E.02771
M204 S10000
G1 X165.541 Y133.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.387595
G1 F7851.538
M204 S6000
G1 X165.649 Y132.979 E.00882
; LINE_WIDTH: 0.322682
G1 F9792.429
G2 X165.695 Y132.82 I-1.383 J-.486 E.00497
G1 X165.725 Y132.523 E.00895
G1 X165.725 Y124.906 E.2282
; WIPE_START
G1 X165.725 Y126.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.541 Y133.189 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.446771
G1 F6649.966
M204 S6000
G1 X165.5 Y133.245 E.00307
G3 X164.517 Y133.572 I-.812 J-.802 E.04744
G1 X164.405 Y133.557 E.00499
G3 X164.273 Y133.527 I.345 J-1.785 E.00599
; LINE_WIDTH: 0.457838
G1 F6464.946
G1 X164.245 Y133.518 E.0013
G3 X163.734 Y133.107 I.242 J-.825 E.03055
; LINE_WIDTH: 0.405609
G1 F7442.188
G1 X163.722 Y133.083 E.00107
G3 X163.672 Y132.955 I1.508 J-.666 E.00541
; LINE_WIDTH: 0.363249
G1 F8482.073
G3 X163.636 Y132.773 I1.303 J-.352 E.00644
; LINE_WIDTH: 0.315648
G1 F10061.969
G1 X163.622 Y132.544 E.00667
G1 X163.614 Y125.832 E.19571
G2 X163.582 Y125.657 I-2.059 J.284 E.00518
; LINE_WIDTH: 0.362576
G1 F8500.952
G1 X163.54 Y125.526 E.00476
; LINE_WIDTH: 0.402255
G1 F7515.149
G2 X163.469 Y125.38 I-1.911 J.837 E.00634
; LINE_WIDTH: 0.450484
G1 F6586.719
G1 X163.462 Y125.369 E.00059
G2 X163.375 Y125.252 I-1.314 J.889 E.00648
; LINE_WIDTH: 0.499859
G1 F5847.208
G1 X163.346 Y125.221 E.00215
G2 X163.174 Y125.096 I-.513 J.525 E.01067
; LINE_WIDTH: 0.522081
G1 F5565.95
G1 X163.051 Y125.042 E.00711
G2 X161.838 Y125.165 I-.478 J1.326 E.06645
G1 X161.709 Y125.29 E.00946
; LINE_WIDTH: 0.465549
G1 F6341.989
G1 X161.612 Y125.443 E.00839
; LINE_WIDTH: 0.416865
G1 F7207.389
G1 X161.555 Y125.589 E.00636
; LINE_WIDTH: 0.380562
G1 F8023.852
G1 X161.532 Y125.679 E.00341
; LINE_WIDTH: 0.323758
G1 F9752.465
G1 X161.506 Y125.92 E.0073
G1 X161.505 Y133.608 E.23124
; WIPE_START
G1 X161.505 Y131.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.62 Y139.158 Z1.44 F42000
G1 X163.379 Y144.294 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.386 Y136.811 E.30726
G3 X163.985 Y136.401 I.534 J.138 E.03253
G1 X164.709 Y136.401 E.02974
G3 X165.407 Y137.082 I.078 J.617 E.04599
G1 X165.407 Y144.294 E.29612
G1 X163.439 Y144.294 E.0808
; WIPE_START
M204 S6000
G1 X163.425 Y142.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.878 Y136.892 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X163.099 Y136.195 I4.925 J1.175 E.03003
G3 X163.831 Y135.637 I.751 J.226 E.04039
G1 X165.284 Y135.642 E.05966
G3 X166.041 Y136.531 I-.152 J.896 E.05206
G1 X166.043 Y145.08 E.351
G1 X161.186 Y145.08 E.19944
G1 X161.186 Y144.294 E.03227
G1 X162.741 Y144.294 E.06386
G1 X162.741 Y137.917 E.26186
G2 X161.595 Y136.502 I-1.438 J-.006 E.08097
G2 X161.186 Y136.422 I-.753 J2.758 E.01711
G1 X161.191 Y135.663 E.03114
G3 X162.289 Y136.043 I-.166 J2.259 E.04824
G3 X162.547 Y136.329 I-1.009 J1.168 E.01585
G1 X162.848 Y136.84 E.02435
M204 S10000
G1 X162.714 Y137.032 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129483
G1 F12000
M204 S6000
G1 X162.536 Y136.773 E.00248
; LINE_WIDTH: 0.177754
G1 X162.434 Y136.646 E.0022
; LINE_WIDTH: 0.216916
G1 X162.38 Y136.585 E.00145
; LINE_WIDTH: 0.249771
G1 X162.32 Y136.517 E.00197
; LINE_WIDTH: 0.276624
G1 F11875.337
G1 X161.809 Y135.993 E.01808
M204 S10000
G1 X161.384 Y135.883 F42000
; LINE_WIDTH: 0.383109
G1 F7960.577
M204 S6000
G1 X161.471 Y135.997 E.00527
; LINE_WIDTH: 0.413855
G1 F7268.711
G1 X161.558 Y136.11 E.00577
; LINE_WIDTH: 0.419766
G1 F7149.257
G3 X161.852 Y136.202 I-.474 J2.033 E.01266
G1 X161.936 Y136.239 E.00374
; LINE_WIDTH: 0.384161
G1 F7934.736
G3 X162.134 Y136.354 I-.503 J1.096 E.0085
; LINE_WIDTH: 0.327378
G1 F9620.383
G1 X162.558 Y136.718 E.01703
; WIPE_START
G1 X162.134 Y136.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.524 Y135.92 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.397407
G1 F7623.145
M204 S6000
G3 X165.709 Y136.777 I-5.468 J1.63 E.03381
; LINE_WIDTH: 0.322475
G1 F9800.147
G1 X165.725 Y137.077 E.00898
G1 X165.725 Y144.482 E.22164
G1 X165.706 Y144.532 E.00162
; LINE_WIDTH: 0.380552
G1 F8024.095
G1 X165.686 Y144.583 E.00198
; LINE_WIDTH: 0.419501
G1 F7154.525
G1 X165.667 Y144.633 E.00222
; LINE_WIDTH: 0.458451
G1 F6454.997
G1 X165.647 Y144.684 E.00246
; LINE_WIDTH: 0.472491
G1 F6235.246
G1 X163.191 Y144.687 E.11554
G1 X163.06 Y144.666 E.00625
G1 X163.06 Y144.62 E.00217
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X163.06 Y144.574 E.00201
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X163.06 Y144.528 E.00176
; LINE_WIDTH: 0.346295
G1 F8984.527
G1 X163.06 Y144.482 E.00151
; LINE_WIDTH: 0.322555
G1 F9797.155
G1 X163.057 Y137.759 E.20129
; LINE_WIDTH: 0.347649
G1 F8942.233
G1 X163.057 Y137.748 E.00036
G3 X163.06 Y137.393 I.867 J-.17 E.01173
; LINE_WIDTH: 0.298652
G1 F10778.8
G1 X163.084 Y137.226 E.00459
; LINE_WIDTH: 0.249083
G1 F12000
G1 X163.109 Y137.059 E.00364
; LINE_WIDTH: 0.199513
G1 X163.134 Y136.892 E.00268
; LINE_WIDTH: 0.153972
G1 X163.194 Y136.641 E.00277
G1 X163.246 Y136.511 E.0015
; LINE_WIDTH: 0.191389
G1 X163.308 Y136.391 E.00202
; LINE_WIDTH: 0.223451
G3 X163.656 Y135.851 I5.257 J3.006 E.01197
M204 S10000
G1 X163.221 Y136.41 F42000
; LINE_WIDTH: 0.366019
G1 F8405.281
M204 S6000
G1 X163.519 Y136.146 E.01392
; LINE_WIDTH: 0.394355
G1 F7692.741
G1 X163.579 Y136.104 E.00277
; LINE_WIDTH: 0.449375
G1 F6605.485
G1 X163.728 Y136.038 E.00725
G3 X164.713 Y136.019 I.614 J6.262 E.04377
G1 X164.826 Y136.021 E.00505
; LINE_WIDTH: 0.472793
G1 F6230.676
G1 X165.111 Y136.045 E.01347
; LINE_WIDTH: 0.512735
G1 F5680.88
G1 X165.181 Y136.057 E.00364
; LINE_WIDTH: 0.553253
G1 F5214.135
G3 X165.535 Y136.276 I-.085 J.534 E.02404
G1 X165.557 Y136.305 E.00203
; LINE_WIDTH: 0.498686
G1 F5862.849
G3 X165.63 Y136.442 I-.733 J.483 E.00779
; LINE_WIDTH: 0.43879
G1 F6790.124
G1 X165.64 Y136.465 E.00107
G3 X165.856 Y137.228 I-5.666 J2.016 E.03431
; WIPE_START
G1 X165.64 Y136.465 E-.7371
G1 X165.63 Y136.442 E-.0229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.354 Y143.727 Z1.44 F42000
G1 X163.06 Y144.666 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X162.929 Y144.687 E.00625
G1 X161.374 Y144.687 E.0732
; WIPE_START
G1 X162.929 Y144.687 E-.70018
G1 X163.06 Y144.666 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.372 Y152.185 Z1.44 F42000
G1 X164.928 Y155.372 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X164.614 Y155.43 I-.292 J-.707 E.01321
G1 X162.614 Y155.43 E.08213
G3 X162.362 Y155.394 I-.006 J-.863 E.01049
G3 X161.823 Y154.54 I.289 J-.779 E.04456
G1 X161.828 Y148.291 E.25656
G3 X162.615 Y147.529 I.763 J0 E.05018
G1 X164.615 Y147.529 E.08212
G3 X164.859 Y147.561 I.006 J.901 E.0101
G3 X165.407 Y148.411 I-.264 J.772 E.04479
G1 X165.401 Y154.663 E.25671
G3 X164.982 Y155.347 I-.765 J.002 E.03467
; WIPE_START
M204 S6000
G1 X164.831 Y155.404 E-.06153
G1 X164.614 Y155.43 E-.08308
G1 X162.994 Y155.43 E-.61539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.241 Y148.135 Z1.44 F42000
G1 X165.59 Y147.002 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X166.041 Y147.897 I-.626 J.877 E.0428
G1 X166.044 Y155.037 E.29318
G3 X165.293 Y156.18 I-1.107 J.09 E.06044
G3 X164.916 Y156.231 I-.382 J-1.402 E.01568
G1 X162.313 Y156.231 E.10688
G3 X161.189 Y155.136 I-.047 J-1.076 E.07214
G1 X161.186 Y147.996 E.29319
G3 X161.937 Y146.853 I1.107 J-.091 E.06044
G3 X162.314 Y146.803 I.386 J1.44 E.01566
G1 X164.925 Y146.803 E.10724
G3 X165.54 Y146.969 I.039 J1.076 E.02654
M204 S10000
G1 X165.309 Y147.319 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.512082
G1 F5689.08
M204 S6000
G1 X165.392 Y147.375 E.00515
G3 X165.578 Y147.61 I-.497 J.585 E.01554
; LINE_WIDTH: 0.461502
G1 F6405.93
G1 X165.649 Y147.777 E.00828
; LINE_WIDTH: 0.415544
G1 F7234.174
G3 X165.687 Y147.93 I-1.391 J.426 E.00642
; LINE_WIDTH: 0.373765
G1 F8197.721
G3 X165.709 Y148.086 I-2.282 J.41 E.00563
; LINE_WIDTH: 0.323516
G1 F9761.436
G1 X165.725 Y148.406 E.00963
G1 X165.725 Y154.544 E.18446
G1 X165.711 Y154.845 E.00905
; LINE_WIDTH: 0.369569
G1 F8308.857
G1 X165.692 Y155.003 E.00564
; LINE_WIDTH: 0.411746
G1 F7312.304
G1 X165.666 Y155.133 E.00532
; LINE_WIDTH: 0.447591
G1 F6635.9
G1 X165.642 Y155.217 E.00386
; LINE_WIDTH: 0.485832
G1 F6039.858
G1 X165.592 Y155.347 E.00676
; LINE_WIDTH: 0.529335
G1 F5479.911
G3 X165.524 Y155.468 I-1.87 J-.966 E.00745
; LINE_WIDTH: 0.578659
G1 F4958.683
G3 X165.261 Y155.71 I-.624 J-.413 E.02133
G1 X165.168 Y155.752 E.00603
; LINE_WIDTH: 0.551096
G1 F5237.049
G3 X164.946 Y155.809 I-.334 J-.85 E.01291
; LINE_WIDTH: 0.489182
G1 F5992.697
G3 X164.751 Y155.827 I-.45 J-3.773 E.00958
G3 X162.607 Y155.83 I-1.138 J-42.609 E.10498
G3 X162.397 Y155.821 I.214 J-7.661 E.01029
G1 X162.321 Y155.813 E.00372
; LINE_WIDTH: 0.537852
G1 F5382.216
G1 X162.155 Y155.782 E.00922
; LINE_WIDTH: 0.575768
G1 F4986.482
G3 X161.711 Y155.474 I.177 J-.728 E.03251
G1 X161.692 Y155.445 E.00206
; LINE_WIDTH: 0.51888
G1 F5604.788
G3 X161.64 Y155.348 I1.027 J-.618 E.00573
G1 X161.619 Y155.302 E.00267
; LINE_WIDTH: 0.471736
G1 F6246.68
G3 X161.576 Y155.177 I1.385 J-.554 E.00621
; LINE_WIDTH: 0.425199
G1 F7042.872
G1 X161.544 Y155.033 E.00613
; LINE_WIDTH: 0.37628
G1 F8132.503
G1 X161.521 Y154.864 E.00617
; LINE_WIDTH: 0.322667
G1 F9792.987
G1 X161.505 Y154.544 E.0096
G1 X161.505 Y148.401 E.184
; LINE_WIDTH: 0.332364
G1 F9444.223
G1 X161.518 Y148.112 E.009
; LINE_WIDTH: 0.370921
G1 F8272.728
G1 X161.542 Y147.934 E.00638
; LINE_WIDTH: 0.417125
G1 F7202.135
G3 X161.571 Y147.813 I1.686 J.333 E.00504
G1 X161.583 Y147.773 E.00171
; LINE_WIDTH: 0.462641
G1 F6387.817
G3 X161.625 Y147.665 I1.372 J.473 E.00534
G1 X161.65 Y147.614 E.00258
; LINE_WIDTH: 0.514738
G1 F5655.847
G3 X162.119 Y147.224 I.679 J.339 E.03256
; LINE_WIDTH: 0.471147
G1 F6255.634
G3 X162.295 Y147.186 I.362 J1.236 E.00847
; LINE_WIDTH: 0.414609
G1 F7253.261
G1 X162.6 Y147.166 E.01236
G3 X164.622 Y147.166 I1.013 J70.907 E.08175
G3 X164.807 Y147.173 I-.002 J2.612 E.00751
G1 X164.918 Y147.184 E.00449
; LINE_WIDTH: 0.465699
G1 F6339.644
G1 X165.08 Y147.215 E.00767
; LINE_WIDTH: 0.512082
G1 F5689.08
G3 X165.247 Y147.278 I-.185 J.744 E.0092
G1 X165.26 Y147.286 E.00077
; WIPE_START
G1 X165.392 Y147.375 E-.06076
G1 X165.508 Y147.497 E-.06372
G1 X165.578 Y147.61 E-.0506
G1 X165.649 Y147.777 E-.06874
G1 X165.687 Y147.93 E-.06017
G1 X165.709 Y148.086 E-.05973
G1 X165.725 Y148.406 E-.12172
G1 X165.725 Y149.128 E-.27456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X165.585 Y156.759 Z1.44 F42000
G1 X165.407 Y166.506 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X163.379 Y166.506 E.08326
G1 X163.383 Y159.316 E.29522
G3 X164.036 Y158.65 I.667 J.001 E.04242
G1 X164.642 Y158.65 E.02489
G3 X165.406 Y159.412 I.029 J.734 E.04975
G1 X165.407 Y166.446 E.28881
; WIPE_START
M204 S6000
G1 X163.407 Y166.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.741 Y166.506 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X162.741 Y159.191 E.30035
G3 X164.013 Y157.889 I1.247 J-.053 E.08369
G3 X164.74 Y157.886 I.418 J13.177 E.02986
G3 X165.85 Y158.308 I.079 J1.464 E.05024
G3 X166.043 Y158.866 I-.645 J.535 E.02476
G1 X166.043 Y167.292 E.34596
G1 X161.186 Y167.292 E.19944
G1 X161.186 Y166.506 E.03228
G1 X162.681 Y166.506 E.06139
M204 S10000
G1 X163.06 Y166.693 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322988
G1 F9781.023
M204 S6000
G1 X163.06 Y159.41 E.21844
G1 X163.08 Y159.091 E.00959
; LINE_WIDTH: 0.375655
G1 F8148.618
M73 P95 R0
G3 X163.133 Y158.874 I1.123 J.159 E.00804
G1 X163.145 Y158.841 E.00126
; LINE_WIDTH: 0.433553
G1 F6885.338
G3 X164.018 Y158.27 I.854 J.353 E.04722
; LINE_WIDTH: 0.456774
G1 F6482.293
G3 X165.011 Y158.306 I.332 J4.528 E.04505
G1 X165.147 Y158.346 E.00642
; LINE_WIDTH: 0.523988
G1 F5543.072
G3 X165.458 Y158.52 I-.328 J.952 E.01893
G1 X165.571 Y158.645 E.00892
; LINE_WIDTH: 0.50975
G1 F5718.591
G1 X165.638 Y158.782 E.00782
; LINE_WIDTH: 0.461149
G1 F6411.581
G1 X165.665 Y158.877 E.00456
M204 S10000
G1 X165.562 Y158.3 F42000
; LINE_WIDTH: 0.396308
G1 F7648.074
M204 S6000
G3 X165.706 Y159.104 I-12.374 J2.634 E.03136
; LINE_WIDTH: 0.322961
G1 F9782.051
G1 X165.725 Y159.406 E.00908
G1 X165.725 Y166.693 E.21852
G1 X165.705 Y166.744 E.00163
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X165.686 Y166.794 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X165.666 Y166.845 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X165.647 Y166.895 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X163.191 Y166.899 E.11564
G1 X163.06 Y166.878 E.00626
G1 X163.06 Y166.832 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X163.06 Y166.785 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X163.06 Y166.739 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X163.06 Y166.693 E.00151
M204 S10000
G1 X163.06 Y166.878 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X162.929 Y166.899 E.00626
G1 X161.374 Y166.899 E.07328
; OBJECT_ID: 839
; WIPE_START
G1 X162.929 Y166.899 E-.70018
G1 X163.06 Y166.878 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 671
M625
; start printing object, unique label id: 839
M624 AgAAAAAAAAA=
M204 S10000
G1 X159.584 Y160.083 Z1.44 F42000
G1 X128.352 Y99.039 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X129.792 Y99.039 E.05913
G1 X129.792 Y90.345 E.35699
G1 X130.429 Y90.345 E.02615
G1 X130.429 Y99.824 E.38924
G1 X125.571 Y99.824 E.19944
G1 X125.571 Y90.345 E.38924
G1 X126.208 Y90.345 E.02615
G1 X126.208 Y99.039 E.35699
G1 X127.722 Y99.039 E.06217
G1 X127.722 Y90.345 E.35699
G1 X128.352 Y90.345 E.02584
G1 X128.352 Y98.979 E.35453
M204 S10000
G1 X128.037 Y99.273 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.314548
G1 F10105.444
M204 S6000
G1 X128.037 Y90.532 E.25374
; WIPE_START
G1 X128.037 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.11 Y90.532 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.322089
G1 F9814.613
M204 S6000
G1 X130.11 Y99.226 E.25987
; LINE_WIDTH: 0.341521
G1 F9136.913
G1 X130.091 Y99.277 E.00174
; LINE_WIDTH: 0.380387
G1 F8028.215
G1 X130.071 Y99.327 E.00198
; LINE_WIDTH: 0.419253
G1 F7159.466
G1 X130.052 Y99.378 E.00222
; LINE_WIDTH: 0.470382
G1 F6267.287
G1 X130.032 Y99.428 E.00253
G1 X129.979 Y99.432 E.0025
G1 X128.164 Y99.432 E.08495
; LINE_WIDTH: 0.490334
G1 F5976.651
G1 X128.037 Y99.412 E.00632
; LINE_WIDTH: 0.485579
G1 F6043.453
G1 X128.037 Y99.366 E.00225
; LINE_WIDTH: 0.436673
G1 F6828.295
G1 X128.037 Y99.319 E.00199
; LINE_WIDTH: 0.387767
G1 F7847.412
G1 X128.037 Y99.273 E.00173
M204 S10000
G1 X128.037 Y99.412 F42000
; LINE_WIDTH: 0.471951
G1 F6243.413
M204 S6000
G1 X127.91 Y99.432 E.00605
G1 X125.968 Y99.428 E.09126
; LINE_WIDTH: 0.458116
G1 F6460.43
G1 X125.948 Y99.378 E.00245
; LINE_WIDTH: 0.419251
G1 F7159.513
G1 X125.929 Y99.327 E.00222
; LINE_WIDTH: 0.380386
G1 F8028.251
G1 X125.909 Y99.277 E.00198
; LINE_WIDTH: 0.322209
G1 F9810.116
G1 X125.89 Y99.226 E.00162
G1 X125.89 Y90.532 E.25999
; WIPE_START
G1 X125.89 Y92.532 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.979 Y100.086 Z1.44 F42000
G1 X128.374 Y109.765 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X130.429 Y109.765 E.08435
G1 X130.429 Y110.559 E.03258
G1 X125.571 Y110.559 E.19944
G1 X125.571 Y109.765 E.03258
G1 X127.737 Y109.765 E.08894
G1 X127.737 Y102.34 E.30486
G1 X125.571 Y102.34 E.08894
G1 X125.571 Y101.518 E.03378
G1 X130.429 Y101.518 E.19944
G1 X130.429 Y102.34 E.03378
G1 X128.374 Y102.34 E.08435
G1 X128.374 Y109.705 E.3024
M204 S10000
G1 X128.056 Y109.953 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.346813
G1 F8968.3
M204 S6000
G1 X128.056 Y110 E.00154
; LINE_WIDTH: 0.396221
G1 F7650.041
G1 X128.056 Y110.047 E.00181
; LINE_WIDTH: 0.44563
G1 F6669.661
G1 X128.056 Y110.094 E.00208
; LINE_WIDTH: 0.4803
G1 F6119.367
G1 X128.056 Y110.141 E.00226
G1 X128.187 Y110.162 E.00636
G1 X130.241 Y110.162 E.09848
; WIPE_START
G1 X128.241 Y110.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.759 Y110.162 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.479921
G1 F6124.899
M204 S6000
G1 X127.925 Y110.162 E.10374
G1 X128.056 Y110.141 E.00635
M204 S10000
G1 X128.056 Y109.953 F42000
; LINE_WIDTH: 0.322226
G1 F9809.483
M204 S6000
G1 X128.056 Y102.112 E.23448
; LINE_WIDTH: 0.389343
G1 F7809.843
G1 X128.056 Y102.071 E.00154
; LINE_WIDTH: 0.434167
G1 F6874.043
G1 X128.056 Y102.03 E.00175
; LINE_WIDTH: 0.47899
G1 F6138.508
G1 X128.056 Y101.989 E.00196
; LINE_WIDTH: 0.523813
G1 F5545.164
G1 X128.056 Y101.948 E.00217
; LINE_WIDTH: 0.508993
G1 F5728.234
G1 X127.925 Y101.929 E.00678
G1 X125.759 Y101.929 E.11093
; WIPE_START
G1 X127.759 Y101.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.056 Y101.948 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.509049
G1 F5727.522
M204 S6000
G1 X128.187 Y101.929 E.00678
G1 X130.241 Y101.929 E.10522
; WIPE_START
G1 X128.241 Y101.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.813 Y109.54 Z1.44 F42000
G1 X129.624 Y120.325 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.792 Y119.997 I-.329 J-.375 E.01549
G1 X129.792 Y112.274 E.31711
G1 X130.429 Y112.274 E.02615
G1 X130.428 Y119.98 E.31644
G3 X130.093 Y120.942 I-1.227 J.111 E.0431
G3 X129.088 Y121.224 I-.883 J-1.212 E.04379
G1 X126.831 Y121.224 E.09266
G3 X125.571 Y119.98 I-.08 J-1.179 E.08219
G1 X125.571 Y112.274 E.31643
G1 X126.208 Y112.274 E.02615
G1 X126.208 Y119.993 E.31695
G2 X126.667 Y120.447 I.466 J-.013 E.02926
G1 X129.255 Y120.447 E.10628
G2 X129.577 Y120.361 I.04 J-.497 E.01392
M204 S10000
G1 X129.838 Y120.652 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.436193
G1 F6837.01
M204 S6000
G2 X129.965 Y120.513 I-.403 J-.497 E.0081
G1 X129.986 Y120.48 E.00167
; LINE_WIDTH: 0.387201
G1 F7860.993
G2 X130.044 Y120.358 I-1.396 J-.743 E.00506
G1 X130.056 Y120.325 E.00128
; LINE_WIDTH: 0.322511
G1 F9798.802
G2 X130.109 Y120.025 I-1.086 J-.345 E.00917
G1 X130.11 Y112.461 E.22644
; WIPE_START
G1 X130.11 Y114.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.889 Y112.461 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.322092
G1 F9814.5
M204 S6000
G1 X125.893 Y120.064 E.22724
; LINE_WIDTH: 0.342599
G1 F9102.069
G2 X126 Y120.429 I.915 J-.069 E.01236
G1 X126.062 Y120.521 E.00358
; LINE_WIDTH: 0.39408
G1 F7699.092
G2 X126.201 Y120.662 I.528 J-.383 E.00759
G1 X126.325 Y120.739 E.00556
; LINE_WIDTH: 0.45859
G1 F6452.75
G2 X126.635 Y120.827 I.397 J-.813 E.01472
G1 X126.732 Y120.833 E.00442
G2 X129.084 Y120.835 I1.229 J-62.327 E.1069
G2 X129.838 Y120.652 I.126 J-1.124 E.03603
; WIPE_START
G1 X129.707 Y120.733 E-.05861
G1 X129.545 Y120.791 E-.06521
G1 X129.322 Y120.828 E-.08588
G1 X129.084 Y120.835 E-.09083
G1 X127.874 Y120.834 E-.45946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.176 Y128.355 Z1.44 F42000
G1 X129.68 Y131.264 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.792 Y130.902 I-.559 J-.371 E.01579
G1 X129.792 Y123.082 E.32108
G1 X130.429 Y123.082 E.02615
G1 X130.428 Y130.892 E.32067
G3 X130.077 Y131.954 I-1.507 J.092 E.04709
G3 X128.876 Y132.318 I-1.007 J-1.16 E.0531
G3 X127.733 Y131.477 I-.001 J-1.196 E.0624
G3 X127.692 Y131.144 I1.412 J-.34 E.0138
G1 X127.692 Y124.345 E.27914
G2 X127.093 Y123.757 I-.604 J.016 E.03813
G2 X126.287 Y124.05 I-.175 J.773 E.03717
G2 X126.21 Y124.297 I.569 J.313 E.0107
G1 X126.208 Y132.159 E.3228
G1 X125.571 Y132.159 E.02615
G1 X125.571 Y124.147 E.32895
G3 X126.716 Y122.92 I1.163 J-.063 E.07697
G3 X127.081 Y122.915 I.221 J2.67 E.01499
G3 X128.102 Y123.417 I.019 J1.249 E.04849
G3 X128.322 Y124.355 I-1.643 J.881 E.04001
G1 X128.322 Y130.902 E.26882
G2 X129.047 Y131.56 I.662 J-.001 E.04522
G2 X129.644 Y131.312 I.074 J-.667 E.02771
M204 S10000
G1 X129.927 Y131.553 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.387595
G1 F7851.538
M204 S6000
G1 X130.035 Y131.343 E.00882
; LINE_WIDTH: 0.322682
G1 F9792.429
G2 X130.081 Y131.184 I-1.383 J-.486 E.00497
G1 X130.11 Y130.887 E.00895
G1 X130.11 Y123.269 E.2282
; WIPE_START
G1 X130.11 Y125.269 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.927 Y131.553 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.446771
G1 F6649.966
M204 S6000
G1 X129.885 Y131.609 E.00307
G3 X128.902 Y131.935 I-.812 J-.802 E.04744
G1 X128.79 Y131.921 E.00499
G3 X128.658 Y131.89 I.345 J-1.785 E.00599
; LINE_WIDTH: 0.457838
G1 F6464.946
G1 X128.63 Y131.882 E.0013
G3 X128.119 Y131.471 I.242 J-.825 E.03055
; LINE_WIDTH: 0.405609
G1 F7442.188
M73 P96 R0
G1 X128.107 Y131.446 E.00107
G3 X128.057 Y131.319 I1.508 J-.666 E.00541
; LINE_WIDTH: 0.363249
G1 F8482.073
G3 X128.021 Y131.136 I1.303 J-.352 E.00644
; LINE_WIDTH: 0.315648
G1 F10061.969
G1 X128.007 Y130.908 E.00667
G1 X127.999 Y124.195 E.19571
G2 X127.967 Y124.021 I-2.059 J.284 E.00518
; LINE_WIDTH: 0.362576
G1 F8500.952
G1 X127.925 Y123.889 E.00476
; LINE_WIDTH: 0.402255
G1 F7515.149
G2 X127.855 Y123.743 I-1.911 J.837 E.00634
; LINE_WIDTH: 0.450484
G1 F6586.719
G1 X127.847 Y123.732 E.00059
G2 X127.76 Y123.616 I-1.314 J.889 E.00648
; LINE_WIDTH: 0.499859
G1 F5847.208
G1 X127.731 Y123.584 E.00215
G2 X127.56 Y123.46 I-.513 J.525 E.01067
; LINE_WIDTH: 0.522081
G1 F5565.95
G1 X127.436 Y123.405 E.00711
G2 X126.223 Y123.529 I-.478 J1.326 E.06645
G1 X126.094 Y123.654 E.00946
; LINE_WIDTH: 0.465549
G1 F6341.989
G1 X125.997 Y123.807 E.00839
; LINE_WIDTH: 0.416865
G1 F7207.389
G1 X125.94 Y123.952 E.00636
; LINE_WIDTH: 0.380562
G1 F8023.852
G1 X125.917 Y124.043 E.00341
; LINE_WIDTH: 0.323758
G1 F9752.465
G1 X125.891 Y124.284 E.0073
G1 X125.89 Y131.971 E.23124
; WIPE_START
G1 X125.89 Y129.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.005 Y137.522 Z1.44 F42000
G1 X127.764 Y142.658 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.771 Y135.174 E.30726
G3 X128.37 Y134.764 I.534 J.138 E.03253
G1 X129.094 Y134.764 E.02974
G3 X129.792 Y135.446 I.078 J.617 E.04599
G1 X129.792 Y142.658 E.29612
G1 X127.824 Y142.658 E.0808
; WIPE_START
M204 S6000
G1 X127.81 Y140.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.264 Y135.255 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X127.484 Y134.559 I4.925 J1.175 E.03003
G3 X128.216 Y134.001 I.751 J.226 E.04039
G1 X129.669 Y134.006 E.05966
G3 X130.426 Y134.895 I-.152 J.896 E.05206
G1 X130.429 Y143.444 E.351
G1 X125.571 Y143.444 E.19944
G1 X125.571 Y142.658 E.03227
G1 X127.127 Y142.658 E.06386
G1 X127.127 Y136.28 E.26186
G2 X125.98 Y134.865 I-1.438 J-.006 E.08097
G2 X125.571 Y134.785 I-.753 J2.758 E.01711
G1 X125.576 Y134.027 E.03114
G3 X126.674 Y134.406 I-.166 J2.259 E.04824
G3 X126.932 Y134.692 I-1.009 J1.168 E.01585
G1 X127.233 Y135.203 E.02435
M204 S10000
G1 X127.099 Y135.396 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129483
G1 F12000
M204 S6000
G1 X126.922 Y135.137 E.00248
; LINE_WIDTH: 0.177754
G1 X126.819 Y135.009 E.0022
; LINE_WIDTH: 0.216916
G1 X126.766 Y134.949 E.00145
; LINE_WIDTH: 0.249771
G1 X126.705 Y134.881 E.00197
; LINE_WIDTH: 0.276624
G1 F11875.337
G1 X126.194 Y134.357 E.01808
M204 S10000
G1 X125.769 Y134.247 F42000
; LINE_WIDTH: 0.383109
G1 F7960.577
M204 S6000
G1 X125.856 Y134.36 E.00527
; LINE_WIDTH: 0.413855
G1 F7268.711
G1 X125.943 Y134.474 E.00577
; LINE_WIDTH: 0.419766
G1 F7149.257
G3 X126.238 Y134.565 I-.474 J2.033 E.01266
G1 X126.321 Y134.603 E.00374
; LINE_WIDTH: 0.384161
G1 F7934.736
G3 X126.519 Y134.718 I-.503 J1.096 E.0085
; LINE_WIDTH: 0.327378
G1 F9620.383
G1 X126.944 Y135.081 E.01703
; WIPE_START
G1 X126.519 Y134.718 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.909 Y134.283 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.397407
G1 F7623.145
M204 S6000
G3 X130.094 Y135.141 I-5.468 J1.63 E.03381
; LINE_WIDTH: 0.322475
G1 F9800.147
G1 X130.11 Y135.441 E.00898
G1 X130.11 Y142.845 E.22164
G1 X130.091 Y142.896 E.00162
; LINE_WIDTH: 0.380552
G1 F8024.095
G1 X130.071 Y142.946 E.00198
; LINE_WIDTH: 0.419501
G1 F7154.525
G1 X130.052 Y142.997 E.00222
; LINE_WIDTH: 0.458451
G1 F6454.997
G1 X130.032 Y143.047 E.00246
; LINE_WIDTH: 0.472491
G1 F6235.246
G1 X127.576 Y143.051 E.11554
G1 X127.445 Y143.03 E.00625
G1 X127.445 Y142.984 E.00217
; LINE_WIDTH: 0.44152
G1 F6741.518
G1 X127.445 Y142.937 E.00201
; LINE_WIDTH: 0.393908
G1 F7703.062
G1 X127.445 Y142.891 E.00176
; LINE_WIDTH: 0.346295
G1 F8984.527
G1 X127.445 Y142.845 E.00151
; LINE_WIDTH: 0.322555
G1 F9797.155
G1 X127.442 Y136.123 E.20129
; LINE_WIDTH: 0.347649
G1 F8942.233
G1 X127.442 Y136.112 E.00036
G3 X127.445 Y135.757 I.867 J-.17 E.01173
; LINE_WIDTH: 0.298652
G1 F10778.8
G1 X127.47 Y135.59 E.00459
; LINE_WIDTH: 0.249083
G1 F12000
G1 X127.494 Y135.423 E.00364
; LINE_WIDTH: 0.199513
G1 X127.519 Y135.256 E.00268
; LINE_WIDTH: 0.153972
G1 X127.579 Y135.004 E.00277
G1 X127.631 Y134.874 E.0015
; LINE_WIDTH: 0.191389
G1 X127.693 Y134.754 E.00202
; LINE_WIDTH: 0.223451
G3 X128.041 Y134.215 I5.257 J3.006 E.01197
M204 S10000
G1 X127.606 Y134.773 F42000
; LINE_WIDTH: 0.366019
G1 F8405.281
M204 S6000
G1 X127.905 Y134.509 E.01392
; LINE_WIDTH: 0.394355
G1 F7692.741
G1 X127.964 Y134.467 E.00277
; LINE_WIDTH: 0.449375
G1 F6605.485
G1 X128.113 Y134.402 E.00725
G3 X129.098 Y134.383 I.614 J6.262 E.04377
G1 X129.212 Y134.385 E.00505
; LINE_WIDTH: 0.472793
G1 F6230.676
G1 X129.497 Y134.409 E.01347
; LINE_WIDTH: 0.512735
G1 F5680.88
G1 X129.566 Y134.421 E.00364
; LINE_WIDTH: 0.553253
G1 F5214.135
G3 X129.92 Y134.64 I-.085 J.534 E.02404
G1 X129.942 Y134.669 E.00203
; LINE_WIDTH: 0.498686
G1 F5862.849
G3 X130.015 Y134.806 I-.733 J.483 E.00779
; LINE_WIDTH: 0.43879
G1 F6790.124
G1 X130.025 Y134.828 E.00107
G3 X130.241 Y135.592 I-5.666 J2.016 E.03431
; WIPE_START
G1 X130.025 Y134.828 E-.7371
G1 X130.015 Y134.806 E-.0229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.739 Y142.091 Z1.44 F42000
G1 X127.445 Y143.03 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.472697
G1 F6232.133
M204 S6000
G1 X127.314 Y143.051 E.00625
G1 X125.759 Y143.051 E.0732
; WIPE_START
G1 X127.314 Y143.051 E-.70018
G1 X127.445 Y143.03 E-.05982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.757 Y150.549 Z1.44 F42000
G1 X129.313 Y153.736 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G3 X128.999 Y153.793 I-.292 J-.707 E.01321
G1 X126.999 Y153.793 E.08213
G3 X126.747 Y153.758 I-.006 J-.863 E.01049
G3 X126.208 Y152.903 I.289 J-.779 E.04456
G1 X126.214 Y146.655 E.25656
G3 X127.001 Y145.892 I.763 J0 E.05018
G1 X129.001 Y145.892 E.08212
G3 X129.244 Y145.924 I.006 J.901 E.0101
G3 X129.792 Y146.774 I-.264 J.772 E.04479
G1 X129.786 Y153.026 E.25671
G3 X129.368 Y153.711 I-.765 J.002 E.03467
; WIPE_START
M204 S6000
G1 X129.216 Y153.768 E-.06153
G1 X128.999 Y153.793 E-.08308
G1 X127.38 Y153.793 E-.61539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.626 Y146.499 Z1.44 F42000
G1 X129.975 Y145.366 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G3 X130.426 Y146.261 I-.626 J.877 E.0428
G1 X130.429 Y153.401 E.29318
G3 X129.679 Y154.543 I-1.107 J.09 E.06044
G3 X129.301 Y154.594 I-.382 J-1.402 E.01568
G1 X126.698 Y154.594 E.10688
G3 X125.574 Y153.5 I-.047 J-1.076 E.07214
G1 X125.571 Y146.359 E.29319
G3 X126.322 Y145.217 I1.107 J-.091 E.06044
G3 X126.699 Y145.166 I.386 J1.44 E.01566
G1 X129.311 Y145.166 E.10724
G3 X129.925 Y145.332 I.039 J1.076 E.02654
M204 S10000
G1 X129.695 Y145.683 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.512082
G1 F5689.08
M204 S6000
G1 X129.778 Y145.739 E.00515
G3 X129.963 Y145.973 I-.497 J.585 E.01554
; LINE_WIDTH: 0.461502
G1 F6405.93
G1 X130.034 Y146.14 E.00828
; LINE_WIDTH: 0.415544
G1 F7234.174
G3 X130.072 Y146.294 I-1.391 J.426 E.00642
; LINE_WIDTH: 0.373765
G1 F8197.721
G3 X130.094 Y146.449 I-2.282 J.41 E.00563
; LINE_WIDTH: 0.323516
G1 F9761.436
G1 X130.11 Y146.769 E.00963
G1 X130.11 Y152.907 E.18446
G1 X130.096 Y153.208 E.00905
; LINE_WIDTH: 0.369569
G1 F8308.857
G1 X130.077 Y153.367 E.00564
; LINE_WIDTH: 0.411746
G1 F7312.304
G1 X130.051 Y153.497 E.00532
; LINE_WIDTH: 0.447591
G1 F6635.9
G1 X130.027 Y153.581 E.00386
; LINE_WIDTH: 0.485832
G1 F6039.858
G1 X129.977 Y153.71 E.00676
; LINE_WIDTH: 0.529335
G1 F5479.911
G3 X129.909 Y153.832 I-1.87 J-.966 E.00745
; LINE_WIDTH: 0.578659
G1 F4958.683
G3 X129.647 Y154.074 I-.624 J-.413 E.02133
G1 X129.554 Y154.116 E.00603
; LINE_WIDTH: 0.551096
G1 F5237.049
G3 X129.331 Y154.172 I-.334 J-.85 E.01291
; LINE_WIDTH: 0.489182
G1 F5992.697
G3 X129.136 Y154.19 I-.45 J-3.773 E.00958
G3 X126.992 Y154.194 I-1.138 J-42.609 E.10498
G3 X126.782 Y154.185 I.214 J-7.661 E.01029
G1 X126.706 Y154.177 E.00372
; LINE_WIDTH: 0.537852
G1 F5382.216
G1 X126.54 Y154.146 E.00922
; LINE_WIDTH: 0.575768
G1 F4986.482
G3 X126.096 Y153.838 I.177 J-.728 E.03251
G1 X126.077 Y153.808 E.00206
; LINE_WIDTH: 0.51888
G1 F5604.788
G3 X126.025 Y153.712 I1.027 J-.618 E.00573
G1 X126.005 Y153.665 E.00267
; LINE_WIDTH: 0.471736
G1 F6246.68
G3 X125.961 Y153.541 I1.385 J-.554 E.00621
; LINE_WIDTH: 0.425199
G1 F7042.872
G1 X125.929 Y153.397 E.00613
; LINE_WIDTH: 0.37628
G1 F8132.503
G1 X125.906 Y153.228 E.00617
; LINE_WIDTH: 0.322667
G1 F9792.987
G1 X125.89 Y152.908 E.0096
G1 X125.89 Y146.765 E.184
; LINE_WIDTH: 0.332364
G1 F9444.223
G1 X125.904 Y146.476 E.009
; LINE_WIDTH: 0.370921
G1 F8272.728
G1 X125.928 Y146.297 E.00638
; LINE_WIDTH: 0.417125
G1 F7202.135
G3 X125.956 Y146.177 I1.686 J.333 E.00504
G1 X125.968 Y146.137 E.00171
; LINE_WIDTH: 0.462641
G1 F6387.817
G3 X126.011 Y146.028 I1.372 J.473 E.00534
G1 X126.035 Y145.978 E.00258
; LINE_WIDTH: 0.514738
G1 F5655.847
G3 X126.504 Y145.588 I.679 J.339 E.03256
; LINE_WIDTH: 0.471147
G1 F6255.634
G3 X126.681 Y145.55 I.362 J1.236 E.00847
; LINE_WIDTH: 0.414609
G1 F7253.261
G1 X126.986 Y145.529 E.01236
G3 X129.007 Y145.529 I1.013 J70.907 E.08175
G3 X129.192 Y145.536 I-.002 J2.612 E.00751
G1 X129.303 Y145.547 E.00449
; LINE_WIDTH: 0.465699
G1 F6339.644
G1 X129.466 Y145.579 E.00767
; LINE_WIDTH: 0.512082
G1 F5689.08
G3 X129.632 Y145.641 I-.185 J.745 E.0092
G1 X129.645 Y145.65 E.00077
; WIPE_START
G1 X129.778 Y145.739 E-.06076
G1 X129.893 Y145.86 E-.06372
G1 X129.963 Y145.973 E-.0506
G1 X130.034 Y146.14 E-.06874
G1 X130.072 Y146.294 E-.06017
G1 X130.094 Y146.449 E-.05973
G1 X130.11 Y146.769 E-.12172
G1 X130.11 Y147.492 E-.27456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.97 Y155.123 Z1.44 F42000
G1 X129.792 Y164.869 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X127.764 Y164.869 E.08326
G1 X127.768 Y157.679 E.29522
G3 X128.421 Y157.013 I.667 J.001 E.04242
G1 X129.027 Y157.013 E.02489
G3 X129.791 Y157.775 I.029 J.734 E.04975
G1 X129.792 Y164.809 E.28881
; WIPE_START
M204 S6000
G1 X127.793 Y164.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.127 Y164.869 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F7144.614
M204 S5000
G1 X127.127 Y157.554 E.30035
G3 X128.398 Y156.253 I1.247 J-.053 E.08369
G3 X129.125 Y156.25 I.418 J13.177 E.02986
G3 X130.236 Y156.672 I.079 J1.464 E.05024
G3 X130.429 Y157.23 I-.644 J.535 E.02476
G1 X130.429 Y165.655 E.34596
G1 X125.571 Y165.655 E.19944
G1 X125.571 Y164.869 E.03228
G1 X127.067 Y164.869 E.06139
M204 S10000
G1 X127.445 Y165.057 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322988
G1 F9781.023
M204 S6000
G1 X127.445 Y157.773 E.21844
G1 X127.466 Y157.454 E.00959
; LINE_WIDTH: 0.375655
G1 F8148.618
G3 X127.518 Y157.238 I1.123 J.159 E.00804
G1 X127.531 Y157.205 E.00126
; LINE_WIDTH: 0.433553
G1 F6885.338
G3 X128.403 Y156.634 I.854 J.353 E.04722
; LINE_WIDTH: 0.456774
G1 F6482.293
G3 X129.396 Y156.67 I.332 J4.528 E.04505
G1 X129.532 Y156.71 E.00642
; LINE_WIDTH: 0.523988
G1 F5543.072
G3 X129.843 Y156.883 I-.328 J.952 E.01893
G1 X129.956 Y157.008 E.00892
; LINE_WIDTH: 0.50975
G1 F5718.591
G1 X130.023 Y157.145 E.00782
; LINE_WIDTH: 0.461149
G1 F6411.581
G1 X130.051 Y157.241 E.00456
M204 S10000
G1 X129.947 Y156.663 F42000
; LINE_WIDTH: 0.396308
G1 F7648.074
M204 S6000
G3 X130.091 Y157.468 I-12.374 J2.634 E.03136
; LINE_WIDTH: 0.322961
G1 F9782.051
G1 X130.11 Y157.77 E.00908
G1 X130.11 Y165.057 E.21852
G1 X130.091 Y165.107 E.00163
; LINE_WIDTH: 0.380636
G1 F8021.984
G1 X130.071 Y165.158 E.00198
; LINE_WIDTH: 0.419681
G1 F7150.946
G1 X130.052 Y165.208 E.00222
; LINE_WIDTH: 0.458726
G1 F6450.537
G1 X130.032 Y165.259 E.00247
; LINE_WIDTH: 0.472888
G1 F6229.251
G1 X127.576 Y165.262 E.11564
G1 X127.445 Y165.241 E.00626
G1 X127.445 Y165.195 E.00218
; LINE_WIDTH: 0.441744
G1 F6737.557
G1 X127.445 Y165.149 E.00201
; LINE_WIDTH: 0.394042
G1 F7699.958
G1 X127.445 Y165.103 E.00176
; LINE_WIDTH: 0.34634
G1 F8983.121
G1 X127.445 Y165.057 E.00151
M204 S10000
G1 X127.445 Y165.241 F42000
; LINE_WIDTH: 0.473095
G1 F6226.121
M204 S6000
G1 X127.314 Y165.262 E.00626
G1 X125.759 Y165.262 E.07328
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6226.121
G1 X127.314 Y165.262 E-.70018
G1 X127.445 Y165.241 E-.05982
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 839
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
G1 Z1.54 F900 ; lower z a little
G1 X0 Y128.818 F18000 ; move to safe pos
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

    G1 Z101.04 F600
    G1 Z99.04

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

