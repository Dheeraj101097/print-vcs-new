; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 5m 26s; total estimated time: 12m 37s
; total layer number: 4
; total filament length [mm] : 497.02
; total filament volume [cm^3] : 1195.47
; total filament weight [g] : 1.48
; model label id: 169,331,425
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
M73 P0 R12
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
M73 P1 R12
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
M73 P11 R11
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P13 R10
G1 X-48.2 F3000
M73 P15 R10
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
M73 P16 R10
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P18 R10
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
    
M73 P19 R10
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
M73 P54 R5
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
M73 P55 R5
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
    G29 A1 X113.16 Y87.5515 I29.6793 J80.897
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
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X135.457 Y89.095 F42000
M204 S6000
M73 P56 R5
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X135.427 Y89.12 E.00145
G2 X134.998 Y89.914 I.569 J.82 E.03489
G2 X135.038 Y94.859 I77.772 J1.853 E.18422
G2 X135.902 Y96.154 I1.358 J.029 E.06173
G2 X137.161 Y96.291 I1.116 J-4.42 E.04733
G2 X139.922 Y96.278 I1.231 J-32.831 E.10288
G2 X141.147 Y95.665 I-.038 J-1.607 E.05269
G2 X141.346 Y95.037 I-1.542 J-.835 E.0247
G2 X141.409 Y92.734 I-30.228 J-1.976 E.08581
G1 X141.45 Y88.36 E.16295
G1 X141.963 Y88.36 E.0191
G3 X141.942 Y95.36 I-232.57 J2.815 E.26075
G3 X140.844 Y96.674 I-2.422 J-.908 E.06502
G3 X139.86 Y96.856 I-.947 J-2.371 E.03752
G3 X136.145 Y96.822 I-1.541 J-34.837 E.13843
G3 X135.072 Y96.277 I.133 J-1.591 E.04595
G3 X134.431 Y94.71 I1.452 J-1.509 E.06495
G3 X134.426 Y88.354 I184.942 J-3.343 E.23674
G3 X138.529 Y88.337 I3.21 J292.203 E.15284
G3 X138.538 Y91.811 I-120.731 J2.045 E.12939
G1 X137.932 Y91.787 E.02258
G2 X137.861 Y89.778 I-29.528 J.035 E.07489
G2 X137.606 Y89.132 I-1.477 J.211 E.02611
G2 X136.447 Y88.899 I-.971 J1.829 E.04465
G2 X135.609 Y89.02 I.094 J3.624 E.03162
G1 X135.511 Y89.068 E.00408
M204 S6000
G1 X135.677 Y89.496 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X135.453 Y89.962 I.368 J.464 E.01993
G2 X135.493 Y94.821 I79.12 J1.778 E.181
G2 X135.926 Y95.665 I.976 J.033 E.0369
G2 X136.568 Y95.809 I.741 J-1.809 E.02462
G2 X139.878 Y95.823 I1.813 J-36.524 E.12333
G2 X140.768 Y95.408 I-.01 J-1.183 E.03772
G2 X140.891 Y94.99 I-1.041 J-.535 E.01632
G2 X140.952 Y92.729 I-29.977 J-1.934 E.08426
G1 X140.997 Y87.902 E.17978
M73 P57 R5
G1 X142.418 Y87.902 E.05293
G3 X142.394 Y95.445 I-227.28 J3.037 E.28095
G3 X141.039 Y97.088 I-2.869 J-.986 E.08102
G3 X139.886 Y97.313 I-1.137 J-2.76 E.04404
G3 X136.091 Y97.276 I-1.57 J-34.552 E.14144
G3 X134.613 Y96.456 I.227 J-2.151 E.06468
G3 X133.988 Y94.929 I1.76 J-1.612 E.06276
G3 X133.947 Y92.395 I41.321 J-1.934 E.09441
G1 X133.971 Y87.9 E.16741
G3 X138.411 Y87.88 I3.773 J336.668 E.16539
G3 X138.962 Y87.901 I.027 J6.454 E.02052
G3 X138.966 Y92.269 I-55.32 J2.242 E.16274
G3 X137.482 Y92.226 I.012 J-25.946 E.05532
G2 X137.409 Y89.844 I-34.761 J-.129 E.08877
G2 X137.277 Y89.485 I-.813 J.095 E.01437
G2 X136.458 Y89.356 I-.641 J1.403 E.03127
G2 X135.733 Y89.473 I-.093 J1.726 E.02759
; WIPE_START
G1 X135.552 Y89.623 E-.08897
G1 X135.502 Y89.724 E-.04306
G1 X135.453 Y89.962 E-.09234
G1 X135.429 Y90.692 E-.27731
G1 X135.432 Y91.371 E-.25832
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 425
M625
; object ids of layer 1 start: 169,331,425
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer1 end: 169,331,425
M625
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X134.698 Y90.175 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.162484
G1 F3000
M204 S500
G1 X134.692 Y91.877 E.01658
G2 X134.742 Y94.885 I49.888 J.674 E.02932
G1 X134.768 Y95.137 E.00247
G2 X135.656 Y96.371 I1.729 J-.308 E.01532
; LINE_WIDTH: 0.171583
G2 X136.515 Y96.559 I.868 J-1.911 E.00928
G1 X136.89 Y96.576 E.00394
G2 X140.129 Y96.544 I1.3 J-32.304 E.03398
G2 X141.089 Y96.138 I-.081 J-1.53 E.01115
; LINE_WIDTH: 0.146128
G1 X141.126 Y96.105 E.00042
G2 X141.53 Y95.557 I-1.23 J-1.328 E.00575
; LINE_WIDTH: 0.194185
G1 X141.581 Y95.442 E.00155
G2 X141.662 Y94.753 I-1.838 J-.565 E.0086
G1 X141.663 Y94.742 E.00013
; LINE_WIDTH: 0.152991
G1 X141.673 Y94.273 E.00421
G2 X141.698 Y91.436 I-254.34 J-3.626 E.02545
; LINE_WIDTH: 0.120809
G1 X141.706 Y88.651 E.01768
; WIPE_START
G1 X141.7 Y90.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.235 Y91.57 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.21338
G1 F3000
M204 S500
G1 X138.228 Y90.426 E.01589
; LINE_WIDTH: 0.248031
G1 X138.203 Y89.732 E.01161
; LINE_WIDTH: 0.292912
G1 X138.184 Y89.529 E.00416
; LINE_WIDTH: 0.3281
G1 X138.166 Y89.411 E.00276
; LINE_WIDTH: 0.361718
G1 X138.149 Y89.312 E.00263
; LINE_WIDTH: 0.38338
G1 X137.993 Y88.563 E.02123
M204 S6000
G1 X137.378 Y88.667 F42000
; LINE_WIDTH: 0.244837
G1 F3000
M204 S500
G1 X137.36 Y88.664 E.00029
; LINE_WIDTH: 0.229326
G1 X137.261 Y88.652 E.00152
; LINE_WIDTH: 0.203262
G1 X137.153 Y88.639 E.00142
; LINE_WIDTH: 0.158719
G1 X136.442 Y88.619 E.00672
G1 X135.927 Y88.64 E.00486
; LINE_WIDTH: 0.200019
G1 X135.71 Y88.661 E.00279
; LINE_WIDTH: 0.233905
G1 X135.601 Y88.676 E.00171
; LINE_WIDTH: 0.280918
G2 X134.651 Y88.854 I1.482 J10.541 E.01874
M204 S6000
G1 X134.651 Y88.931 F42000
; LINE_WIDTH: 0.420735
G1 F3000
M204 S500
G1 X135.819 Y88.572 E.03761
; WIPE_START
G1 X134.651 Y88.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.647 Y89.752 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.395757
G1 F3000
M204 S500
G1 X134.998 Y88.578 E.03525
M204 S6000
G1 X134.919 Y88.579 F42000
; LINE_WIDTH: 0.260916
G1 F3000
M204 S500
G1 X134.755 Y89.449 E.01574
; LINE_WIDTH: 0.242643
G1 X134.74 Y89.558 E.00179
; LINE_WIDTH: 0.212562
G1 X134.724 Y89.676 E.00165
; LINE_WIDTH: 0.169269
G1 X134.698 Y90.175 E.00514
; WIPE_START
G1 X134.724 Y89.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.375 Y96.834 Z.6 F42000
G1 X140.892 Y106.33 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X140.103 Y105.456 E.04387
G2 X139.428 Y104.821 I-11.619 J11.677 E.0345
G3 X134.395 Y100.312 I469.091 J-528.617 E.25169
G1 X134.396 Y99.326 E.03673
G3 X140.677 Y99.291 I5.237 J379.473 E.23393
G3 X142.043 Y99.308 I-.205 J71.646 E.0509
G3 X142.056 Y99.909 I-7.368 J.458 E.02241
G2 X136.969 Y99.963 I-.736 J170.513 E.18949
G1 X136.284 Y100.018 E.02559
G1 X135.93 Y100.934 E.03659
G2 X138.369 Y103.258 I22.034 J-20.687 E.12557
G3 X141.99 Y106.499 I-264.275 J298.974 E.18099
G3 X141.975 Y107.537 I-83.179 J-.706 E.0387
G3 X134.397 Y107.548 I-4.784 J-697.252 E.28226
G3 X134.4 Y107.007 I12.51 J-.196 E.02017
G2 X139.228 Y106.968 I-1.332 J-469.48 E.17985
G2 X139.842 Y106.868 I-.03 J-2.106 E.02325
G1 X140.839 Y106.357 E.0417
M204 S6000
G1 X140.154 Y106.194 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X139.121 Y105.159 I-7.327 J6.281 E.05451
G3 X133.938 Y100.508 I325.194 J-367.54 E.25938
G3 X133.954 Y98.882 I23.402 J-.583 E.06059
G3 X140.678 Y98.834 I4.784 J200.173 E.25046
G3 X142.466 Y98.873 I.433 J20.989 E.06664
G3 X142.489 Y100.343 I-8.567 J.869 E.05483
G3 X139.418 Y100.378 I-2.24 J-62.011 E.11441
G2 X136.607 Y100.451 I-.609 J30.915 E.10479
G1 X136.459 Y100.831 E.01521
G2 X138.673 Y102.917 I22.207 J-21.355 E.11334
G3 X142.45 Y106.3 I-239.564 J271.216 E.18885
G3 X142.423 Y107.992 I-134.538 J-1.262 E.06303
G3 X133.946 Y107.999 I-4.494 J-347.313 E.31576
G3 X133.961 Y106.559 I28.159 J-.432 E.05364
G3 X138.855 Y106.524 I4.474 J287.665 E.18229
G2 X139.671 Y106.442 I.026 J-3.834 E.0306
M73 P58 R5
G1 X140.101 Y106.222 E.018
M204 S6000
G1 X140.741 Y105.745 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.163913
G1 F3000
M204 S500
G1 X141.045 Y106.049 E.00424
; LINE_WIDTH: 0.204572
G1 X141.35 Y106.352 E.00566
M204 S6000
G1 X141.416 Y106.544 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X141.598 Y106.726 E.01151
G1 X141.592 Y107.15 E.01893
G1 X141.247 Y107.15 E.01544
G1 X140.745 Y106.648 E.0317
M204 S6000
G1 X140.641 Y107.063 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.29031
G1 F3000
M204 S500
G1 X139.963 Y107.197 E.01392
; LINE_WIDTH: 0.272172
G1 X139.868 Y107.211 E.0018
; LINE_WIDTH: 0.242913
G1 X139.762 Y107.227 E.00175
; LINE_WIDTH: 0.210701
G1 X139.563 Y107.245 E.00273
; LINE_WIDTH: 0.155345
G1 X138.871 Y107.266 E.00634
G3 X135.817 Y107.275 I-2.218 J-260.138 E.02798
; LINE_WIDTH: 0.142877
G2 X134.624 Y107.277 I-.359 J117.408 E.00972
; WIPE_START
G1 X135.817 Y107.275 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.163 Y101.56 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118949
G1 F3000
M204 S500
G1 X135.857 Y101.259 E.00266
; LINE_WIDTH: 0.146326
G1 X135.64 Y101.048 E.00255
M204 S6000
G1 X135.91 Y100.479 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56872
G1 F6300
M204 S500
G1 X135.134 Y99.704 E.047
G1 X134.784 Y99.709 E.01499
G1 X134.784 Y100.097 E.01665
G1 X135.558 Y100.871 E.04688
; WIPE_START
G1 X134.784 Y100.097 E-.41579
G1 X134.784 Y99.709 E-.14768
G1 X135.134 Y99.704 E-.13293
G1 X135.252 Y99.822 E-.06361
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.177 Y99.662 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278027
G1 F3000
M204 S500
G1 X136.946 Y99.63 E.01474
; LINE_WIDTH: 0.249053
G1 X137.186 Y99.624 E.00404
; LINE_WIDTH: 0.21943
G3 X141.825 Y99.608 I3.103 J234.014 E.06673
; WIPE_START
G1 X139.825 Y99.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.437 Y105.442 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123254
G1 F3000
M204 S500
G1 X140.741 Y105.745 E.00281
; WIPE_START
G1 X140.437 Y105.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.929 Y110.608 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X137.92 Y110.609 E.00031
G3 X137.874 Y116.059 I-282.102 J.349 E.20301
G1 X137.871 Y116.195 E.00509
G3 X137.361 Y116.184 I-.055 J-9.413 E.01903
G2 X137.37 Y111.832 I-329.744 J-2.874 E.16213
G2 X137.337 Y111.496 I-1.772 J.003 E.01259
G1 X137.133 Y110.603 E.0341
G1 X134.457 Y110.525 E.09972
G3 X134.463 Y110.107 I17.601 J.039 E.01557
G3 X139.175 Y110.093 I3.252 J291.407 E.17551
G3 X140.772 Y110.198 I.261 J8.239 E.05972
G3 X141.952 Y111.829 I-.455 J1.571 E.08076
G3 X141.932 Y118.137 I-74.37 J2.918 E.23504
G3 X141.278 Y119.232 I-1.424 J-.108 E.04924
G3 X140.548 Y119.595 I-1.58 J-2.265 E.03048
G3 X137.485 Y119.633 I-2.06 J-42.785 E.11414
G1 X134.464 Y119.615 E.11252
G1 X134.455 Y119.174 E.01641
G2 X139.891 Y119.124 I.894 J-199.351 E.20251
G2 X140.907 Y118.909 I.095 J-2.053 E.03909
G2 X141.433 Y117.976 I-.669 J-.992 E.04135
G2 X141.472 Y116.205 I-18.326 J-1.296 E.06601
G2 X141.445 Y111.924 I-107.04 J-1.456 E.15946
G2 X141.136 Y110.983 I-1.43 J-.052 E.03766
G2 X140.038 Y110.563 I-1.074 J1.159 E.0449
G2 X139.415 Y110.562 I-.349 J32.637 E.02319
G1 X137.989 Y110.607 E.05316
M204 S6000
G1 X138.374 Y111.052 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X138.331 Y116.072 I-259.441 J.306 E.18696
G3 X138.308 Y116.631 I-8.229 J-.07 E.02087
G3 X136.912 Y116.601 I-.527 J-7.822 E.05205
G3 X136.927 Y113.385 I91.094 J-1.199 E.11976
G2 X136.888 Y111.583 I-14.244 J-.6 E.06718
G1 X136.767 Y111.05 E.02038
G3 X133.998 Y110.967 I4.047 J-182.039 E.10318
G3 X134.015 Y109.653 I55.106 J.073 E.04895
G3 X139.181 Y109.636 I3.635 J314.586 E.19239
G3 X140.887 Y109.755 I.263 J8.515 E.06382
G3 X142.409 Y111.807 I-.579 J2.02 E.1023
G3 X142.403 Y118.01 I-99.335 J2.999 E.23106
G3 X141.416 Y119.692 I-1.955 J-.017 E.07602
G3 X140.59 Y120.05 I-1.557 J-2.459 E.03367
G3 X137.483 Y120.09 I-2.099 J-42.655 E.11577
G1 X134.015 Y120.069 E.12916
G1 X133.989 Y118.72 E.05026
G2 X139.871 Y118.668 I.686 J-253.469 E.21912
G2 X140.556 Y118.574 I-.028 J-2.769 E.02581
G2 X140.978 Y117.923 I-.279 J-.643 E.03062
G2 X141.015 Y116.204 I-18.051 J-1.248 E.06409
G2 X140.989 Y111.953 I-107.173 J-1.454 E.15833
G2 X140.871 Y111.39 I-1.439 J.006 E.02156
G2 X140.185 Y111.032 I-.748 J.595 E.02968
G2 X138.434 Y111.049 I-.697 J18.397 E.06526
M204 S6000
G1 X138.031 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.107215
G1 F3000
M204 S500
G1 X137.692 Y110.353 E.00178
; LINE_WIDTH: 0.128291
G1 X137.521 Y110.439 E.00133
; LINE_WIDTH: 0.161889
G1 X137.35 Y110.525 E.00186
M204 S6000
G1 X137.501 Y110.319 F42000
; LINE_WIDTH: 0.366788
G1 F3000
M204 S500
G1 X137.525 Y110.543 E.00594
; LINE_WIDTH: 0.322636
G1 X137.55 Y110.766 E.00513
; LINE_WIDTH: 0.278484
G1 X137.574 Y110.99 E.00432
; LINE_WIDTH: 0.234332
G1 X137.598 Y111.214 E.00351
; LINE_WIDTH: 0.189787
G1 X137.623 Y111.442 E.00274
; LINE_WIDTH: 0.14305
G1 X137.64 Y111.82 E.00308
; LINE_WIDTH: 0.111158
G1 X137.643 Y113.096 E.00709
M204 S6000
G1 X137.637 Y113.824 F42000
; LINE_WIDTH: 0.105358
G1 F3000
M204 S500
G2 X137.617 Y115.965 I280.947 J3.72 E.01089
; WIPE_START
G1 X137.636 Y113.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.342 Y119.349 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.107078
G1 F3000
M204 S500
G2 X140.62 Y119.3 I-.018 J-.92 E.00149
; WIPE_START
G1 X140.342 Y119.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.467 Y118.7 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.112207
G1 F3000
M204 S500
G2 X141.66 Y118.215 I-.904 J-.64 E.00298
G1 X141.681 Y118.055 E.00091
; WIPE_START
G1 X141.66 Y118.215 E-.17852
G1 X141.593 Y118.47 E-.29119
G1 X141.467 Y118.7 E-.29029
; WIPE_END
M73 P59 R5
G1 E-.04 F1800
M204 S6000
G1 X141.724 Y117.008 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.11115
G1 F3000
M204 S500
G2 X141.727 Y113.038 I-169.27 J-2.103 E.02207
; WIPE_START
G1 X141.726 Y115.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.692 Y111.796 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10881
G1 F3000
M204 S500
G1 X141.676 Y111.588 E.00112
G2 X141.494 Y111.038 I-1.444 J.171 E.00313
; WIPE_START
G1 X141.592 Y111.241 E-.21603
G1 X141.676 Y111.588 E-.34353
G1 X141.692 Y111.796 E-.20044
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.482 Y119.426 Z.6 F42000
G1 X141.27 Y127.155 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X141.103 Y126.959 E.00958
G2 X140.687 Y126.777 I-.634 J.882 E.01706
G2 X137.025 Y126.726 I-3.451 J117.617 E.1364
G3 X134.448 Y126.686 I.669 J-124.734 E.09601
G3 X134.447 Y126.218 I12.13 J-.239 E.01742
G3 X139.732 Y126.188 I4.803 J385.255 E.19683
G2 X140.748 Y126.111 I-.015 J-6.863 E.038
G2 X141.435 Y125.314 I-.223 J-.887 E.04176
G2 X141.483 Y122.069 I-71.709 J-2.683 E.12085
G1 X141.919 Y122.067 E.01623
G1 X141.924 Y122.248 E.00676
G3 X141.947 Y130.879 I-447.979 J5.488 E.32147
G3 X141.485 Y130.88 I-.25 J-6.691 E.0172
G2 X141.449 Y127.909 I-261.548 J1.631 E.11066
G2 X141.308 Y127.201 I-1.99 J.029 E.02706
M204 S6000
G1 X140.899 Y127.432 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X140.609 Y127.231 I-.366 J.218 E.01357
G2 X137.021 Y127.183 I-3.424 J122.746 E.13367
G3 X134.004 Y127.129 I.646 J-120.288 E.11238
G3 X134.003 Y125.771 I20.885 J-.7 E.05058
G3 X139.724 Y125.731 I15.146 J1759.708 E.21309
G2 X140.624 Y125.669 I-.025 J-6.928 E.03365
G2 X140.98 Y125.26 I-.096 J-.443 E.02164
G2 X141.033 Y121.831 I-313.325 J-6.566 E.12774
G1 X141.044 Y121.637 E.00723
G3 X142.358 Y121.62 I.792 J10.52 E.04897
G3 X142.395 Y131.311 I-304.514 J5.993 E.36095
G3 X141.048 Y131.315 I-.711 J-10.476 E.05021
G3 X141.013 Y128.823 I48.874 J-1.922 E.09287
G2 X140.951 Y127.569 I-8.336 J-.217 E.04681
G2 X140.926 Y127.486 I-.419 J.082 E.00322
; WIPE_START
G1 X140.808 Y127.318 E-.07805
G1 X140.609 Y127.231 E-.08267
G1 X139.032 Y127.199 E-.59928
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.756 Y126.449 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.237256
G1 F3000
M204 S500
G2 X140.654 Y126.456 I-.001 J.826 E.00163
; LINE_WIDTH: 0.199426
G1 X140.306 Y126.464 E.00444
; LINE_WIDTH: 0.160509
G1 X139.737 Y126.469 E.00545
; LINE_WIDTH: 0.120821
G1 X136.526 Y126.462 E.02038
; WIPE_START
G1 X138.526 Y126.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.742 Y133.573 Z.6 F42000
G1 X135.541 Y134.088 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X135.382 Y134.22 E.0077
G2 X135.048 Y134.87 I.791 J.817 E.02769
G2 X134.953 Y135.865 I8.597 J1.323 E.03726
G1 X134.92 Y142.233 E.2372
G1 X134.476 Y142.225 E.01654
G3 X134.465 Y135.34 I410.616 J-4.073 E.25643
G3 X134.542 Y134.62 I3.116 J-.034 E.02704
G3 X135.411 Y133.633 I1.535 J.476 E.05047
G3 X136.649 Y133.44 I.982 J2.236 E.04718
G3 X137.336 Y133.544 I.006 J2.283 E.02599
G3 X138.345 Y134.511 I-.828 J1.873 E.05311
G3 X138.478 Y136.397 I-10.665 J1.702 E.07049
G3 X138.501 Y141.58 I-261.74 J3.755 E.19305
G2 X139.248 Y142.059 I2.761 J-3.481 E.03309
G2 X141.156 Y141.737 I.693 J-1.707 E.07589
G2 X141.414 Y141.345 I-1.062 J-.978 E.01755
G2 X141.475 Y135.561 I-129.52 J-4.279 E.21546
G3 X141.496 Y133.777 I74.181 J-.054 E.06643
G1 X141.953 Y133.774 E.01704
G3 X141.914 Y141.317 I-177.479 J2.853 E.28098
G3 X141.277 Y142.26 I-1.546 J-.357 E.04337
G3 X139.945 Y142.656 I-1.206 J-1.621 E.05281
G3 X138.111 Y141.662 I-.082 J-2.038 E.08155
G3 X137.998 Y140.369 I5.478 J-1.134 E.04846
G3 X137.946 Y135.444 I356.464 J-6.174 E.18346
G2 X137.782 Y134.54 I-2.138 J-.078 E.03447
G2 X136.654 Y133.912 I-1.118 J.681 E.05028
G2 X135.966 Y133.919 I-.312 J3.099 E.0257
G2 X135.593 Y134.059 I.207 J1.118 E.01489
M204 S6000
G1 X135.819 Y134.456 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X135.493 Y134.974 I.374 J.597 E.02359
G2 X135.396 Y136.695 I11.335 J1.502 E.06424
G1 X135.375 Y142.699 E.22365
G1 X134.021 Y142.673 E.05046
G3 X134.008 Y135.327 I431.37 J-4.412 E.27359
G3 X134.378 Y133.906 I2.365 J-.144 E.05561
G3 X136.451 Y132.978 I1.918 J1.504 E.088
G1 X136.667 Y132.983 E.00805
G3 X137.516 Y133.124 I-.021 J2.767 E.03221
G3 X138.758 Y134.302 I-1.15 J2.454 E.06486
G3 X138.894 Y135.236 I-3.472 J.984 E.03525
G3 X138.946 Y137.221 I-42.974 J2.109 E.07396
G1 X138.957 Y141.338 E.15334
G2 X139.668 Y141.709 I1.169 J-1.369 E.03013
G2 X140.825 Y141.419 I.27 J-1.376 E.04588
G2 X140.962 Y141.214 I-.553 J-.519 E.00922
G2 X141.029 Y134.23 I-280.902 J-6.194 E.26015
G3 X141.057 Y133.344 I17.189 J.089 E.03302
G3 X142.399 Y133.339 I.714 J11.279 E.05001
G3 X142.381 Y141.209 I-191.373 J3.505 E.29315
G3 X141.679 Y142.519 I-1.793 J-.117 E.05708
G3 X139.945 Y143.113 I-1.59 J-1.814 E.07001
G3 X137.683 Y141.823 I-.087 J-2.475 E.10216
G3 X137.556 Y140.861 I3.562 J-.959 E.03622
G3 X137.502 Y136.007 I145.123 J-4.036 E.18084
G2 X137.435 Y134.925 I-7.173 J-.1 E.04041
G2 X136.774 Y134.384 I-.706 J.188 E.034
G2 X135.934 Y134.398 I-.373 J2.86 E.03137
G2 X135.871 Y134.426 I.259 J.655 E.00258
M204 S6000
G1 X135.057 Y134.199 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124423
G1 F3000
M204 S500
G2 X134.724 Y135.331 I1.494 J1.055 E.00797
; WIPE_START
G1 X134.751 Y134.988 E-.21776
G1 X134.805 Y134.707 E-.18149
G1 X134.914 Y134.423 E-.19235
G1 X135.057 Y134.199 E-.1684
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.009 Y134.421 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.111834
G1 F3000
M204 S500
G3 X138.132 Y134.765 I-.76 J.465 E.00206
; WIPE_START
G1 X138.088 Y134.583 E-.38733
G1 X138.009 Y134.421 E-.37267
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.222 Y136.592 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.104638
G1 F3000
M204 S500
G3 X138.232 Y138.067 I-148.699 J1.793 E.00742
; WIPE_START
G1 X138.222 Y136.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.245 Y143.964 Z.6 F42000
M73 P60 R5
G1 X135.766 Y145.75 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X135.68 Y145.75 E.00321
G1 X134.908 Y146.639 E.04385
G1 X134.954 Y153.543 E.25716
G1 X135.752 Y154.342 E.04206
G1 X141.993 Y154.406 E.23245
G1 X141.994 Y154.821 E.01547
G3 X136.382 Y154.827 I-3.022 J-225.728 E.20903
G3 X135.275 Y154.503 I-.071 J-1.814 E.04375
G3 X134.482 Y153.197 I.675 J-1.303 E.05984
G3 X134.502 Y146.582 I109.588 J-2.981 E.24642
G3 X135.94 Y145.301 I1.763 J.532 E.07549
G3 X137.625 Y145.221 I1.333 J10.26 E.0629
G3 X141.538 Y145.231 I1.443 J202.789 E.14573
G1 X141.946 Y145.24 E.0152
G3 X141.952 Y145.732 I-12.753 J.407 E.01834
G3 X140.298 Y145.751 I-3.884 J-268.552 E.06162
G1 X135.826 Y145.75 E.16656
M204 S6000
G1 X135.888 Y146.207 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X135.366 Y146.808 E.02966
G1 X135.41 Y153.353 E.24375
G1 X135.944 Y153.887 E.02813
G1 X142.442 Y153.953 E.24206
G3 X142.431 Y155.276 I-13.973 J.546 E.04928
G3 X136.365 Y155.283 I-3.334 J-239.378 E.22594
G3 X135.039 Y154.895 I-.052 J-2.277 E.05229
G3 X134.026 Y153.229 I.877 J-1.675 E.0763
G3 X134.039 Y146.623 I113.03 J-3.086 E.24606
G3 X134.351 Y145.83 I1.724 J.221 E.03207
G3 X135.828 Y144.858 I1.941 J1.339 E.06751
G3 X137.622 Y144.764 I1.433 J10.185 E.06701
G3 X141.545 Y144.774 I1.446 J203.425 E.14611
G3 X142.389 Y144.795 I.031 J15.318 E.03147
G3 X142.397 Y146.175 I-15.42 J.776 E.0514
G3 X135.948 Y146.208 I-4.287 J-209.889 E.24021
; WIPE_START
G1 X135.366 Y146.808 E-.3179
G1 X135.374 Y147.972 E-.4421
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.806 Y145.492 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113681
G1 F3000
M204 S500
G3 X141.156 Y145.486 I3.103 J674.737 E.02508
; WIPE_START
G1 X139.156 Y145.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.562 Y153.11 Z.6 F42000
G1 X139.858 Y158.666 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X139.761 Y158.388 E.01098
G1 X139.55 Y158.104 E.01318
G2 X138.622 Y157.906 I-.841 J1.673 E.03573
G2 X134.447 Y157.867 I-9.262 J770.198 E.15552
G1 X134.446 Y157.407 E.01715
G3 X141.994 Y157.415 I3.327 J420.344 E.28112
G3 X141.952 Y158.405 I-26.145 J-.613 E.03692
G2 X137.118 Y161.827 I95.945 J140.639 E.22059
G2 X136.872 Y162.8 I.57 J.662 E.03983
G2 X137.377 Y163.421 I1.475 J-.685 E.03011
M73 P60 R4
G2 X139.435 Y164.873 I25.364 J-33.757 E.09383
G2 X141.973 Y166.648 I67.369 J-93.629 E.11536
G3 X141.994 Y167.666 I-19.893 J.916 E.03794
G3 X134.446 Y167.646 I-1.964 J-674.979 E.28111
G3 X134.447 Y167.193 I19.566 J-.217 E.01689
G2 X138.903 Y167.145 I.947 J-119.234 E.16601
G2 X139.765 Y166.558 I-.047 J-.996 E.04086
G1 X139.813 Y166.246 E.01176
G2 X139.402 Y165.491 I-.989 J.049 E.0331
G2 X135.208 Y162.519 I-137.871 J190.126 E.19146
G2 X139.301 Y159.626 I-83.22 J-122.062 E.18671
G2 X139.794 Y159.16 I-.867 J-1.41 E.02546
G1 X139.879 Y158.727 E.01641
G1 X139.878 Y158.723 E.00017
M204 S6000
G1 X139.407 Y158.76 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X139.254 Y158.471 I-.532 J.097 E.01237
G2 X138.604 Y158.363 I-.546 J1.27 E.02479
G2 X134.377 Y158.324 I-9.795 J825.501 E.15743
G1 X133.998 Y158.311 E.01411
G3 X134.003 Y156.961 I20.444 J-.601 E.05028
G3 X142.445 Y156.96 I4.287 J371.742 E.31444
G3 X142.397 Y158.655 I-20.056 J.282 E.06318
G2 X137.428 Y162.166 I97.562 J143.357 E.22663
G2 X137.357 Y162.752 I.307 J.335 E.02394
G2 X138.008 Y163.326 I2.287 J-1.938 E.03241
G3 X142.411 Y166.398 I-404.731 J584.606 E.19999
G3 X142.433 Y168.123 I-13.715 J1.036 E.0643
G3 X133.999 Y168.094 I-2.095 J-600.267 E.31414
G3 X133.999 Y166.737 I22.723 J-.673 E.05054
G2 X138.858 Y166.689 I1.13 J-133.376 E.18101
G2 X139.35 Y166.247 I.015 J-.478 E.02722
G2 X139.107 Y165.841 I-.555 J.057 E.01819
G3 X134.434 Y162.514 I737.41 J-1040.69 E.21366
G2 X139.025 Y159.262 I-318.935 J-455.061 E.20954
G2 X139.369 Y158.955 I-.561 J-.975 E.0173
G1 X139.395 Y158.819 E.00515
M204 S6000
G1 X139.977 Y159.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143229
G1 F3000
M204 S500
G3 X139.771 Y159.599 I-1.961 J-1.955 E.00228
; LINE_WIDTH: 0.111848
G1 X139.469 Y159.822 E.00211
; WIPE_START
G1 X139.771 Y159.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.564 Y157.741 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.193452
G1 F3000
M204 S500
G2 X139.374 Y157.7 I-.53 J1.996 E.00238
; LINE_WIDTH: 0.164431
G1 X139.257 Y157.685 E.00117
; LINE_WIDTH: 0.117873
G1 X138.824 Y157.659 E.00265
; WIPE_START
G1 X139.257 Y157.685 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.804 Y157.593 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53405
G1 F6300
M204 S500
G1 X141.475 Y158.264 E.03802
G1 X141.066 Y158.55 E.01996
G1 X140.313 Y157.796 E.04267
M73 P61 R4
G1 X139.95 Y157.795 E.01451
G1 X139.917 Y157.946 E.00621
G1 X140.109 Y158.204 E.01286
G1 X140.153 Y158.331 E.00539
G1 X140.658 Y158.836 E.02857
G1 X140.249 Y159.121 E.01996
G1 X140.031 Y158.903 E.01234
; WIPE_START
G1 X140.249 Y159.121 E-.11716
G1 X140.658 Y158.836 E-.18954
G1 X140.153 Y158.331 E-.27126
G1 X140.109 Y158.204 E-.05117
G1 X139.917 Y157.946 E-.12209
G1 X139.922 Y157.924 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.134 Y162.094 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5497
G1 F6300
M204 S500
G1 X136.636 Y162.596 E.02932
; WIPE_START
G1 X136.134 Y162.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.392 Y165.159 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118842
G1 F3000
M204 S500
G1 X139.794 Y165.472 E.00316
; LINE_WIDTH: 0.165732
G1 X139.87 Y165.549 E.00108
; LINE_WIDTH: 0.202188
G1 X139.937 Y165.618 E.00125
; LINE_WIDTH: 0.236551
G1 X140.004 Y165.687 E.00152
; LINE_WIDTH: 0.258871
G1 X140.062 Y166.078 E.00696
M204 S6000
G1 X140.043 Y166.078 F42000
; LINE_WIDTH: 0.125923
G1 F3000
M204 S500
G2 X140.022 Y165.57 I-4.973 J-.048 E.00344
M204 S6000
G1 X140.694 Y165.981 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5639
G1 F6300
M204 S500
G1 X141.589 Y166.876 E.05373
G1 X141.597 Y167.277 E.01704
G1 X141.253 Y167.276 E.01463
G1 X140.404 Y166.427 E.05095
G1 X140.174 Y166.456 E.00986
G1 X140.137 Y166.696 E.01033
G1 X140.06 Y166.82 E.00618
G1 X140.72 Y167.48 E.03966
; WIPE_START
G1 X140.06 Y166.82 E-.35503
G1 X140.137 Y166.696 E-.05535
G1 X140.174 Y166.456 E-.0925
G1 X140.404 Y166.427 E-.08825
G1 X140.718 Y166.742 E-.16887
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.664 Y167.102 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122773
G1 F3000
M204 S500
G1 X139.581 Y167.194 E.00081
; LINE_WIDTH: 0.162485
G1 X139.497 Y167.285 E.00121
; LINE_WIDTH: 0.188042
G1 X139.333 Y167.438 E.00265
M204 S6000
G1 X139.358 Y167.353 F42000
; LINE_WIDTH: 0.164282
G1 F3000
M204 S500
G3 X139.148 Y167.39 I-.461 J-2.05 E.00211
; LINE_WIDTH: 0.117138
G1 X138.799 Y167.409 E.00212
M204 S6000
G1 X139.358 Y167.353 F42000
; LINE_WIDTH: 0.212806
G1 F3000
M204 S500
G1 X139.558 Y167.319 E.00281
; OBJECT_ID: 169
; WIPE_START
G1 X139.358 Y167.353 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
M204 S6000
G1 X138.002 Y159.842 Z.6 F42000
G1 X125.231 Y89.095 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.2 Y89.12 E.00145
G2 X124.772 Y89.914 I.569 J.82 E.03489
G2 X124.811 Y94.859 I77.772 J1.853 E.18422
G2 X125.675 Y96.154 I1.358 J.029 E.06173
G2 X126.934 Y96.291 I1.116 J-4.42 E.04733
G2 X129.696 Y96.278 I1.231 J-32.831 E.10288
G2 X130.92 Y95.665 I-.038 J-1.607 E.05269
G2 X131.12 Y95.037 I-1.542 J-.835 E.0247
G2 X131.182 Y92.734 I-30.228 J-1.976 E.08581
G1 X131.224 Y88.36 E.16295
G1 X131.737 Y88.36 E.0191
G3 X131.716 Y95.36 I-232.57 J2.815 E.26075
G3 X130.617 Y96.674 I-2.422 J-.908 E.06502
G3 X129.633 Y96.856 I-.947 J-2.371 E.03752
G3 X125.919 Y96.822 I-1.541 J-34.837 E.13843
G3 X124.846 Y96.277 I.133 J-1.591 E.04595
G3 X124.205 Y94.71 I1.452 J-1.509 E.06495
G3 X124.199 Y88.354 I184.942 J-3.343 E.23674
G3 X128.303 Y88.337 I3.21 J292.203 E.15284
G3 X128.312 Y91.811 I-120.731 J2.045 E.12939
G1 X127.706 Y91.787 E.02258
G2 X127.635 Y89.778 I-29.528 J.035 E.07489
G2 X127.38 Y89.132 I-1.477 J.211 E.02611
G2 X126.221 Y88.899 I-.971 J1.829 E.04465
G2 X125.382 Y89.02 I.094 J3.624 E.03162
G1 X125.284 Y89.068 E.00408
M204 S6000
G1 X125.451 Y89.496 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X125.227 Y89.962 I.368 J.464 E.01993
G2 X125.267 Y94.821 I79.12 J1.778 E.181
G2 X125.699 Y95.665 I.976 J.033 E.0369
G2 X126.341 Y95.809 I.741 J-1.809 E.02462
G2 X129.651 Y95.823 I1.813 J-36.524 E.12333
G2 X130.541 Y95.408 I-.01 J-1.183 E.03772
G2 X130.665 Y94.99 I-1.041 J-.535 E.01632
G2 X130.725 Y92.729 I-29.977 J-1.934 E.08426
G1 X130.771 Y87.902 E.17978
G1 X132.192 Y87.902 E.05293
G3 X132.168 Y95.445 I-227.28 J3.037 E.28095
G3 X130.813 Y97.088 I-2.869 J-.986 E.08102
G3 X129.66 Y97.313 I-1.137 J-2.76 E.04404
G3 X125.865 Y97.276 I-1.57 J-34.552 E.14144
G3 X124.387 Y96.456 I.227 J-2.151 E.06468
G3 X123.761 Y94.929 I1.76 J-1.612 E.06276
G3 X123.72 Y92.395 I41.321 J-1.934 E.09441
G1 X123.744 Y87.9 E.16741
G3 X128.185 Y87.88 I3.773 J336.668 E.16539
G3 X128.735 Y87.901 I.026 J6.454 E.02052
G3 X128.74 Y92.269 I-55.32 J2.242 E.16274
G3 X127.255 Y92.226 I.012 J-25.946 E.05532
G2 X127.182 Y89.844 I-34.761 J-.129 E.08877
G2 X127.051 Y89.485 I-.813 J.095 E.01437
G2 X126.232 Y89.356 I-.641 J1.403 E.03127
G2 X125.506 Y89.473 I-.093 J1.726 E.02759
M204 S6000
G1 X125.375 Y88.676 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.280918
G1 F3000
M204 S500
G2 X124.425 Y88.854 I1.482 J10.541 E.01874
M204 S6000
G1 X124.425 Y88.931 F42000
; LINE_WIDTH: 0.420735
G1 F3000
M204 S500
G1 X125.592 Y88.572 E.03761
M204 S6000
G1 X125.375 Y88.676 F42000
; LINE_WIDTH: 0.233905
G1 F3000
M204 S500
G1 X125.483 Y88.661 E.00171
; LINE_WIDTH: 0.200019
G1 X125.701 Y88.64 E.00279
; LINE_WIDTH: 0.158719
G1 X126.215 Y88.619 E.00486
G1 X126.927 Y88.639 E.00672
; LINE_WIDTH: 0.203262
G1 X127.035 Y88.652 E.00142
; LINE_WIDTH: 0.229326
G1 X127.134 Y88.664 E.00152
; LINE_WIDTH: 0.244837
G1 X127.152 Y88.667 E.00029
M204 S6000
G1 X127.766 Y88.563 F42000
; LINE_WIDTH: 0.38338
G1 F3000
M204 S500
G1 X127.923 Y89.312 E.02123
; LINE_WIDTH: 0.361718
G1 X127.939 Y89.411 E.00263
; LINE_WIDTH: 0.3281
G1 X127.957 Y89.529 E.00276
; LINE_WIDTH: 0.292912
G1 X127.977 Y89.732 E.00416
; LINE_WIDTH: 0.248031
G1 X128.002 Y90.426 E.01161
; LINE_WIDTH: 0.21338
G1 X128.008 Y91.57 E.01589
; WIPE_START
G1 X128.002 Y90.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X124.42 Y89.752 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.395757
G1 F3000
M204 S500
G1 X124.772 Y88.578 E.03525
M204 S6000
G1 X124.693 Y88.579 F42000
; LINE_WIDTH: 0.260916
G1 F3000
M204 S500
G1 X124.529 Y89.449 E.01574
; LINE_WIDTH: 0.242643
G1 X124.514 Y89.558 E.00179
; LINE_WIDTH: 0.212562
G1 X124.498 Y89.676 E.00165
; LINE_WIDTH: 0.169269
G1 X124.472 Y90.175 E.00514
; LINE_WIDTH: 0.162484
G1 X124.465 Y91.877 E.01658
G2 X124.515 Y94.885 I49.888 J.674 E.02932
G1 X124.542 Y95.137 E.00247
G2 X125.43 Y96.371 I1.729 J-.308 E.01532
; LINE_WIDTH: 0.171583
G2 X126.288 Y96.559 I.868 J-1.911 E.00928
G1 X126.663 Y96.576 E.00394
G2 X129.903 Y96.544 I1.3 J-32.304 E.03398
G2 X130.863 Y96.138 I-.081 J-1.53 E.01115
; LINE_WIDTH: 0.146128
G1 X130.9 Y96.105 E.00042
G2 X131.303 Y95.557 I-1.23 J-1.328 E.00575
; LINE_WIDTH: 0.194185
G1 X131.355 Y95.442 E.00155
G2 X131.436 Y94.753 I-1.838 J-.565 E.0086
G1 X131.436 Y94.742 E.00013
; LINE_WIDTH: 0.152991
G1 X131.446 Y94.273 E.00421
G2 X131.471 Y91.436 I-254.34 J-3.626 E.02545
; LINE_WIDTH: 0.120809
G1 X131.479 Y88.651 E.01768
; WIPE_START
G1 X131.473 Y90.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.081 Y98.273 Z.6 F42000
G1 X130.666 Y106.33 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X129.876 Y105.456 E.04387
G2 X129.202 Y104.821 I-11.619 J11.677 E.0345
G3 X124.169 Y100.312 I469.091 J-528.617 E.25169
G1 X124.17 Y99.326 E.03673
G3 X130.45 Y99.291 I5.237 J379.473 E.23393
G3 X131.817 Y99.308 I-.205 J71.646 E.0509
G3 X131.83 Y99.909 I-7.368 J.458 E.02241
G2 X126.743 Y99.963 I-.736 J170.513 E.18949
G1 X126.058 Y100.018 E.02559
G1 X125.703 Y100.934 E.03659
G2 X128.143 Y103.258 I22.034 J-20.687 E.12557
G3 X131.764 Y106.499 I-264.275 J298.974 E.18099
G3 X131.748 Y107.537 I-83.179 J-.706 E.0387
G3 X124.17 Y107.548 I-4.784 J-697.252 E.28226
G3 X124.173 Y107.007 I12.51 J-.196 E.02017
G2 X129.002 Y106.968 I-1.332 J-469.48 E.17985
G2 X129.616 Y106.868 I-.03 J-2.106 E.02325
G1 X130.612 Y106.357 E.0417
M204 S6000
G1 X129.928 Y106.194 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X128.894 Y105.159 I-7.327 J6.281 E.05451
G3 X123.712 Y100.508 I325.194 J-367.54 E.25938
G3 X123.728 Y98.882 I23.402 J-.583 E.06059
G3 X130.452 Y98.834 I4.784 J200.173 E.25046
G3 X132.24 Y98.873 I.433 J20.989 E.06664
G3 X132.263 Y100.343 I-8.567 J.869 E.05483
G3 X129.192 Y100.378 I-2.24 J-62.011 E.11441
M73 P62 R4
G2 X126.38 Y100.451 I-.609 J30.915 E.10479
G1 X126.233 Y100.831 E.01521
G2 X128.447 Y102.917 I22.207 J-21.355 E.11334
G3 X132.223 Y106.3 I-239.564 J271.216 E.18885
G3 X132.197 Y107.992 I-134.538 J-1.262 E.06303
G3 X123.72 Y107.999 I-4.493 J-347.313 E.31576
G3 X123.734 Y106.559 I28.159 J-.432 E.05364
G3 X128.628 Y106.524 I4.474 J287.665 E.18229
G2 X129.444 Y106.442 I.026 J-3.834 E.0306
G1 X129.874 Y106.222 E.018
M204 S6000
G1 X130.514 Y105.745 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.163913
G1 F3000
M204 S500
G1 X130.819 Y106.049 E.00424
; LINE_WIDTH: 0.204572
G1 X131.123 Y106.352 E.00566
M204 S6000
G1 X131.19 Y106.544 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X131.372 Y106.726 E.01151
G1 X131.366 Y107.15 E.01893
G1 X131.02 Y107.15 E.01544
G1 X130.519 Y106.648 E.0317
M204 S6000
G1 X130.414 Y107.063 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.29031
G1 F3000
M204 S500
G1 X129.737 Y107.197 E.01392
; LINE_WIDTH: 0.272172
G1 X129.641 Y107.211 E.0018
; LINE_WIDTH: 0.242913
G1 X129.535 Y107.227 E.00175
; LINE_WIDTH: 0.210701
G1 X129.336 Y107.245 E.00273
; LINE_WIDTH: 0.155345
G1 X128.645 Y107.266 E.00634
G3 X125.591 Y107.275 I-2.218 J-260.138 E.02798
; LINE_WIDTH: 0.142877
G2 X124.398 Y107.277 I-.359 J117.408 E.00972
; WIPE_START
G1 X125.591 Y107.275 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.936 Y101.56 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118949
G1 F3000
M204 S500
G1 X125.631 Y101.259 E.00266
; LINE_WIDTH: 0.146326
G1 X125.414 Y101.048 E.00255
M204 S6000
G1 X125.683 Y100.479 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56872
G1 F6300
M204 S500
G1 X124.908 Y99.704 E.047
G1 X124.558 Y99.709 E.01499
G1 X124.558 Y100.097 E.01665
G1 X125.331 Y100.871 E.04688
; WIPE_START
G1 X124.558 Y100.097 E-.41579
G1 X124.558 Y99.709 E-.14768
G1 X124.908 Y99.704 E-.13293
G1 X125.026 Y99.822 E-.06361
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.951 Y99.662 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278027
G1 F3000
M204 S500
G1 X126.719 Y99.63 E.01474
; LINE_WIDTH: 0.249053
G1 X126.96 Y99.624 E.00404
; LINE_WIDTH: 0.21943
G3 X131.599 Y99.608 I3.103 J234.014 E.06673
; WIPE_START
G1 X129.599 Y99.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.21 Y105.442 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123254
G1 F3000
M204 S500
G1 X130.514 Y105.745 E.00281
; WIPE_START
G1 X130.21 Y105.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.702 Y110.608 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X127.694 Y110.609 E.00031
G3 X127.648 Y116.059 I-282.102 J.349 E.20301
G1 X127.645 Y116.195 E.00509
G3 X127.134 Y116.184 I-.055 J-9.413 E.01903
G2 X127.144 Y111.832 I-329.744 J-2.874 E.16213
G2 X127.111 Y111.496 I-1.772 J.003 E.01259
G1 X126.907 Y110.603 E.0341
G1 X124.231 Y110.525 E.09972
G3 X124.237 Y110.107 I17.601 J.039 E.01557
G3 X128.949 Y110.093 I3.252 J291.407 E.17551
G3 X130.546 Y110.198 I.261 J8.239 E.05972
G3 X131.726 Y111.829 I-.455 J1.571 E.08076
G3 X131.706 Y118.137 I-74.37 J2.918 E.23504
G3 X131.052 Y119.232 I-1.424 J-.108 E.04924
G3 X130.322 Y119.595 I-1.58 J-2.265 E.03048
G3 X127.258 Y119.633 I-2.06 J-42.785 E.11414
G1 X124.237 Y119.615 E.11252
G1 X124.228 Y119.174 E.01641
G2 X129.665 Y119.124 I.894 J-199.351 E.20251
G2 X130.68 Y118.909 I.095 J-2.053 E.03909
G2 X131.206 Y117.976 I-.669 J-.992 E.04135
G2 X131.246 Y116.205 I-18.326 J-1.296 E.06601
G2 X131.218 Y111.924 I-107.04 J-1.456 E.15946
G2 X130.91 Y110.983 I-1.43 J-.052 E.03766
G2 X129.811 Y110.563 I-1.074 J1.159 E.0449
G2 X129.189 Y110.562 I-.349 J32.637 E.02319
G1 X127.762 Y110.607 E.05316
M204 S6000
G1 X128.148 Y111.052 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X128.105 Y116.072 I-259.441 J.306 E.18696
G3 X128.081 Y116.631 I-8.229 J-.07 E.02087
G3 X126.686 Y116.601 I-.527 J-7.822 E.05205
G3 X126.7 Y113.385 I91.094 J-1.199 E.11976
G2 X126.662 Y111.583 I-14.244 J-.6 E.06718
G1 X126.54 Y111.05 E.02038
G3 X123.771 Y110.967 I4.047 J-182.039 E.10318
G3 X123.789 Y109.653 I55.106 J.073 E.04895
G3 X128.954 Y109.636 I3.635 J314.586 E.19239
G3 X130.66 Y109.755 I.263 J8.515 E.06382
G3 X132.183 Y111.807 I-.579 J2.02 E.1023
G3 X132.176 Y118.01 I-99.335 J2.999 E.23106
G3 X131.19 Y119.692 I-1.955 J-.017 E.07602
G3 X130.364 Y120.05 I-1.557 J-2.459 E.03367
G3 X127.257 Y120.09 I-2.099 J-42.655 E.11577
G1 X123.789 Y120.069 E.12916
G1 X123.762 Y118.72 E.05026
G2 X129.645 Y118.668 I.686 J-253.469 E.21912
G2 X130.33 Y118.574 I-.028 J-2.769 E.02581
G2 X130.752 Y117.923 I-.279 J-.643 E.03062
G2 X130.789 Y116.204 I-18.051 J-1.248 E.06409
G2 X130.762 Y111.953 I-107.173 J-1.454 E.15833
G2 X130.645 Y111.39 I-1.439 J.006 E.02156
G2 X129.959 Y111.032 I-.748 J.595 E.02968
G2 X128.207 Y111.049 I-.697 J18.397 E.06526
M204 S6000
G1 X127.805 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.107215
G1 F3000
M204 S500
G1 X127.466 Y110.353 E.00178
; LINE_WIDTH: 0.128291
G1 X127.295 Y110.439 E.00133
; LINE_WIDTH: 0.161889
G1 X127.124 Y110.525 E.00186
M204 S6000
G1 X127.274 Y110.319 F42000
; LINE_WIDTH: 0.366788
G1 F3000
M204 S500
G1 X127.299 Y110.543 E.00594
; LINE_WIDTH: 0.322636
G1 X127.323 Y110.766 E.00513
; LINE_WIDTH: 0.278484
G1 X127.348 Y110.99 E.00432
; LINE_WIDTH: 0.234332
G1 X127.372 Y111.214 E.00351
; LINE_WIDTH: 0.189787
G1 X127.397 Y111.442 E.00274
; LINE_WIDTH: 0.14305
G1 X127.414 Y111.82 E.00308
; LINE_WIDTH: 0.111158
G1 X127.416 Y113.096 E.00709
M204 S6000
G1 X127.41 Y113.824 F42000
; LINE_WIDTH: 0.105358
G1 F3000
M204 S500
M73 P63 R4
G2 X127.39 Y115.965 I280.947 J3.72 E.01089
; WIPE_START
G1 X127.409 Y113.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.115 Y119.349 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.107078
G1 F3000
M204 S500
G2 X130.394 Y119.3 I-.018 J-.92 E.00149
; WIPE_START
G1 X130.115 Y119.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.241 Y118.7 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.112207
G1 F3000
M204 S500
G2 X131.433 Y118.215 I-.904 J-.64 E.00298
G1 X131.455 Y118.055 E.00091
; WIPE_START
G1 X131.433 Y118.215 E-.17852
G1 X131.366 Y118.47 E-.29119
G1 X131.241 Y118.7 E-.29029
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.498 Y117.008 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.11115
G1 F3000
M204 S500
G2 X131.501 Y113.038 I-169.27 J-2.103 E.02207
; WIPE_START
G1 X131.499 Y115.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.466 Y111.796 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10881
G1 F3000
M204 S500
G1 X131.45 Y111.588 E.00112
G2 X131.268 Y111.038 I-1.444 J.171 E.00313
; WIPE_START
G1 X131.365 Y111.241 E-.21603
G1 X131.45 Y111.588 E-.34353
G1 X131.466 Y111.796 E-.20044
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.256 Y119.426 Z.6 F42000
G1 X131.043 Y127.155 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X130.877 Y126.959 E.00958
G2 X130.46 Y126.777 I-.634 J.882 E.01706
G2 X126.799 Y126.726 I-3.451 J117.617 E.1364
G3 X124.221 Y126.686 I.669 J-124.734 E.09601
G3 X124.221 Y126.218 I12.13 J-.239 E.01742
G3 X129.505 Y126.188 I4.803 J385.255 E.19683
G2 X130.522 Y126.111 I-.015 J-6.863 E.038
G2 X131.209 Y125.314 I-.223 J-.887 E.04176
G2 X131.257 Y122.069 I-71.709 J-2.683 E.12085
G1 X131.693 Y122.067 E.01623
G1 X131.698 Y122.248 E.00676
G3 X131.72 Y130.879 I-447.979 J5.488 E.32147
G3 X131.258 Y130.88 I-.25 J-6.691 E.0172
G2 X131.223 Y127.909 I-261.548 J1.631 E.11066
G2 X131.082 Y127.201 I-1.99 J.029 E.02706
M204 S6000
G1 X130.673 Y127.432 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X130.383 Y127.231 I-.366 J.218 E.01357
G2 X126.794 Y127.183 I-3.424 J122.746 E.13367
G3 X123.778 Y127.129 I.646 J-120.288 E.11238
G3 X123.776 Y125.771 I20.885 J-.7 E.05058
G3 X129.497 Y125.731 I15.146 J1759.708 E.21309
G2 X130.398 Y125.669 I-.025 J-6.928 E.03365
G2 X130.754 Y125.26 I-.096 J-.443 E.02164
G2 X130.807 Y121.831 I-313.325 J-6.566 E.12774
G1 X130.818 Y121.637 E.00723
G3 X132.132 Y121.62 I.792 J10.52 E.04897
G3 X132.168 Y131.311 I-304.514 J5.993 E.36095
G3 X130.821 Y131.315 I-.711 J-10.476 E.05021
G3 X130.787 Y128.823 I48.874 J-1.922 E.09287
G2 X130.725 Y127.569 I-8.336 J-.217 E.04681
G2 X130.7 Y127.486 I-.419 J.082 E.00322
; WIPE_START
G1 X130.582 Y127.318 E-.07805
G1 X130.383 Y127.231 E-.08267
G1 X128.806 Y127.199 E-.59928
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.53 Y126.449 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.237256
G1 F3000
M204 S500
G2 X130.427 Y126.456 I-.001 J.826 E.00163
; LINE_WIDTH: 0.199426
G1 X130.079 Y126.464 E.00444
; LINE_WIDTH: 0.160509
G1 X129.51 Y126.469 E.00545
; LINE_WIDTH: 0.120821
G1 X126.299 Y126.462 E.02038
; WIPE_START
G1 X128.299 Y126.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.516 Y133.573 Z.6 F42000
G1 X125.314 Y134.088 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.155 Y134.22 E.0077
G2 X124.821 Y134.87 I.791 J.817 E.02769
G2 X124.726 Y135.865 I8.597 J1.323 E.03726
G1 X124.693 Y142.233 E.2372
G1 X124.249 Y142.225 E.01654
G3 X124.239 Y135.34 I410.616 J-4.073 E.25643
G3 X124.315 Y134.62 I3.116 J-.034 E.02704
G3 X125.185 Y133.633 I1.535 J.476 E.05047
G3 X126.422 Y133.44 I.982 J2.236 E.04718
G3 X127.11 Y133.544 I.006 J2.283 E.02599
G3 X128.118 Y134.511 I-.828 J1.873 E.05311
G3 X128.251 Y136.397 I-10.665 J1.702 E.07049
G3 X128.275 Y141.58 I-261.74 J3.755 E.19305
G2 X129.021 Y142.059 I2.761 J-3.481 E.03309
G2 X130.929 Y141.737 I.693 J-1.707 E.07589
G2 X131.187 Y141.345 I-1.062 J-.978 E.01755
G2 X131.249 Y135.561 I-129.52 J-4.279 E.21546
G3 X131.269 Y133.777 I74.181 J-.054 E.06643
G1 X131.727 Y133.774 E.01704
G3 X131.688 Y141.317 I-177.479 J2.853 E.28098
G3 X131.05 Y142.26 I-1.546 J-.357 E.04337
G3 X129.719 Y142.656 I-1.206 J-1.621 E.05281
G3 X127.885 Y141.662 I-.082 J-2.038 E.08155
G3 X127.771 Y140.369 I5.478 J-1.134 E.04846
G3 X127.72 Y135.444 I356.464 J-6.174 E.18346
G2 X127.556 Y134.54 I-2.138 J-.078 E.03447
G2 X126.428 Y133.912 I-1.118 J.681 E.05028
G2 X125.739 Y133.919 I-.312 J3.099 E.0257
G2 X125.367 Y134.059 I.207 J1.118 E.01489
M204 S6000
G1 X125.593 Y134.456 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X125.267 Y134.974 I.374 J.597 E.02359
G2 X125.17 Y136.695 I11.335 J1.502 E.06424
G1 X125.149 Y142.699 E.22365
G1 X123.794 Y142.673 E.05046
G3 X123.782 Y135.327 I431.37 J-4.412 E.27359
G3 X124.151 Y133.906 I2.365 J-.144 E.05561
G3 X126.224 Y132.978 I1.918 J1.504 E.088
G1 X126.44 Y132.983 E.00805
G3 X127.29 Y133.124 I-.021 J2.767 E.03221
G3 X128.531 Y134.302 I-1.15 J2.454 E.06486
G3 X128.668 Y135.236 I-3.472 J.984 E.03525
G3 X128.719 Y137.221 I-42.974 J2.109 E.07396
G1 X128.731 Y141.338 E.15334
G2 X129.442 Y141.709 I1.169 J-1.369 E.03013
G2 X130.599 Y141.419 I.27 J-1.376 E.04588
G2 X130.736 Y141.214 I-.553 J-.519 E.00922
G2 X130.803 Y134.23 I-280.902 J-6.194 E.26015
G3 X130.83 Y133.344 I17.189 J.089 E.03302
G3 X132.172 Y133.339 I.714 J11.279 E.05001
G3 X132.154 Y141.209 I-191.373 J3.505 E.29315
G3 X131.452 Y142.519 I-1.793 J-.117 E.05708
G3 X129.719 Y143.113 I-1.59 J-1.814 E.07001
G3 X127.456 Y141.823 I-.087 J-2.475 E.10216
G3 X127.33 Y140.861 I3.562 J-.959 E.03622
G3 X127.276 Y136.007 I145.123 J-4.036 E.18084
G2 X127.209 Y134.925 I-7.173 J-.1 E.04041
G2 X126.547 Y134.384 I-.706 J.188 E.034
G2 X125.708 Y134.398 I-.373 J2.86 E.03137
G2 X125.645 Y134.426 I.259 J.655 E.00258
M204 S6000
G1 X124.831 Y134.199 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124423
G1 F3000
M204 S500
G2 X124.497 Y135.331 I1.494 J1.055 E.00797
; WIPE_START
G1 X124.525 Y134.988 E-.21776
G1 X124.579 Y134.707 E-.18149
G1 X124.688 Y134.423 E-.19235
G1 X124.831 Y134.199 E-.1684
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.783 Y134.421 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.111834
G1 F3000
M204 S500
G3 X127.906 Y134.765 I-.76 J.465 E.00206
; WIPE_START
M73 P64 R4
G1 X127.861 Y134.583 E-.38733
G1 X127.783 Y134.421 E-.37267
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.996 Y136.592 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.104638
G1 F3000
M204 S500
G3 X128.006 Y138.067 I-148.699 J1.793 E.00742
; WIPE_START
G1 X127.996 Y136.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.019 Y143.964 Z.6 F42000
G1 X125.54 Y145.75 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.453 Y145.75 E.00321
G1 X124.682 Y146.639 E.04385
G1 X124.727 Y153.543 E.25716
G1 X125.526 Y154.342 E.04206
G1 X131.766 Y154.406 E.23245
G1 X131.768 Y154.821 E.01547
G3 X126.156 Y154.827 I-3.022 J-225.728 E.20903
G3 X125.048 Y154.503 I-.071 J-1.814 E.04375
G3 X124.256 Y153.197 I.675 J-1.303 E.05984
G3 X124.275 Y146.582 I109.588 J-2.981 E.24642
G3 X125.714 Y145.301 I1.763 J.532 E.07549
G3 X127.399 Y145.221 I1.333 J10.26 E.0629
G3 X131.311 Y145.231 I1.443 J202.789 E.14573
G1 X131.719 Y145.24 E.0152
G3 X131.726 Y145.732 I-12.753 J.407 E.01834
G3 X130.072 Y145.751 I-3.884 J-268.552 E.06162
G1 X125.6 Y145.75 E.16656
M204 S6000
G1 X125.662 Y146.207 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X125.14 Y146.808 E.02966
G1 X125.183 Y153.353 E.24375
G1 X125.717 Y153.887 E.02813
G1 X132.216 Y153.953 E.24206
G3 X132.205 Y155.276 I-13.973 J.546 E.04928
G3 X126.139 Y155.283 I-3.334 J-239.378 E.22594
G3 X124.813 Y154.895 I-.052 J-2.277 E.05229
G3 X123.8 Y153.229 I.877 J-1.675 E.0763
G3 X123.812 Y146.623 I113.03 J-3.086 E.24606
G3 X124.125 Y145.83 I1.724 J.221 E.03207
G3 X125.601 Y144.858 I1.941 J1.339 E.06751
G3 X127.396 Y144.764 I1.433 J10.185 E.06701
G3 X131.318 Y144.774 I1.446 J203.425 E.14611
G3 X132.163 Y144.795 I.031 J15.318 E.03147
G3 X132.171 Y146.175 I-15.42 J.776 E.0514
G3 X125.722 Y146.208 I-4.287 J-209.889 E.24021
; WIPE_START
G1 X125.14 Y146.808 E-.3179
G1 X125.148 Y147.972 E-.4421
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.579 Y145.492 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113681
G1 F3000
M204 S500
G3 X130.929 Y145.486 I3.103 J674.737 E.02508
; WIPE_START
G1 X128.929 Y145.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.335 Y153.11 Z.6 F42000
G1 X129.632 Y158.666 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X129.535 Y158.388 E.01098
G1 X129.323 Y158.104 E.01318
G2 X128.395 Y157.906 I-.841 J1.673 E.03573
G2 X124.22 Y157.867 I-9.262 J770.198 E.15552
G1 X124.22 Y157.407 E.01715
G3 X131.767 Y157.415 I3.327 J420.344 E.28112
G3 X131.725 Y158.405 I-26.145 J-.613 E.03692
G2 X126.892 Y161.827 I95.945 J140.639 E.22059
G2 X126.645 Y162.8 I.57 J.662 E.03983
G2 X127.15 Y163.421 I1.475 J-.685 E.03011
G2 X129.208 Y164.873 I25.364 J-33.757 E.09383
G2 X131.746 Y166.648 I67.369 J-93.629 E.11536
G3 X131.767 Y167.666 I-19.893 J.916 E.03794
G3 X124.22 Y167.646 I-1.964 J-674.979 E.28111
G3 X124.22 Y167.193 I19.566 J-.217 E.01689
G2 X128.677 Y167.145 I.947 J-119.234 E.16601
G2 X129.539 Y166.558 I-.047 J-.996 E.04086
G1 X129.586 Y166.246 E.01176
G2 X129.176 Y165.491 I-.989 J.049 E.0331
G2 X124.982 Y162.519 I-137.871 J190.126 E.19146
G2 X129.075 Y159.626 I-83.22 J-122.062 E.18671
G2 X129.568 Y159.16 I-.867 J-1.41 E.02546
G1 X129.653 Y158.727 E.01641
G1 X129.651 Y158.723 E.00017
M204 S6000
G1 X129.18 Y158.76 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X129.027 Y158.471 I-.532 J.097 E.01237
G2 X128.377 Y158.363 I-.546 J1.27 E.02479
G2 X124.15 Y158.324 I-9.795 J825.501 E.15743
G1 X123.772 Y158.311 E.01411
G3 X123.777 Y156.961 I20.444 J-.601 E.05028
G3 X132.219 Y156.96 I4.287 J371.742 E.31444
G3 X132.171 Y158.655 I-20.056 J.282 E.06318
G2 X127.202 Y162.166 I97.562 J143.357 E.22663
G2 X127.131 Y162.752 I.307 J.335 E.02394
G2 X127.781 Y163.326 I2.287 J-1.938 E.03241
G3 X132.184 Y166.398 I-404.731 J584.606 E.19999
G3 X132.206 Y168.123 I-13.715 J1.036 E.0643
G3 X123.772 Y168.094 I-2.095 J-600.267 E.31414
G3 X123.772 Y166.737 I22.723 J-.673 E.05054
G2 X128.632 Y166.689 I1.13 J-133.376 E.18101
G2 X129.124 Y166.247 I.015 J-.478 E.02722
G2 X128.881 Y165.841 I-.555 J.057 E.01819
G3 X124.208 Y162.514 I737.41 J-1040.69 E.21366
G2 X128.798 Y159.262 I-318.935 J-455.061 E.20954
G2 X129.142 Y158.955 I-.561 J-.975 E.0173
G1 X129.169 Y158.819 E.00515
M204 S6000
G1 X129.751 Y159.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143229
G1 F3000
M204 S500
G3 X129.545 Y159.599 I-1.961 J-1.955 E.00228
; LINE_WIDTH: 0.111848
G1 X129.242 Y159.822 E.00211
; WIPE_START
G1 X129.545 Y159.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.338 Y157.741 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.193452
G1 F3000
M204 S500
G2 X129.148 Y157.7 I-.53 J1.996 E.00238
; LINE_WIDTH: 0.164431
G1 X129.031 Y157.685 E.00117
; LINE_WIDTH: 0.117873
G1 X128.597 Y157.659 E.00265
; WIPE_START
G1 X129.031 Y157.685 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P65 R4
G1 X130.577 Y157.593 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53405
G1 F6300
M204 S500
G1 X131.249 Y158.264 E.03802
G1 X130.84 Y158.55 E.01996
G1 X130.086 Y157.796 E.04267
G1 X129.723 Y157.795 E.01451
G1 X129.69 Y157.946 E.00621
G1 X129.882 Y158.204 E.01286
G1 X129.926 Y158.331 E.00539
G1 X130.431 Y158.836 E.02857
G1 X130.022 Y159.121 E.01996
G1 X129.804 Y158.903 E.01234
; WIPE_START
G1 X130.022 Y159.121 E-.11716
G1 X130.431 Y158.836 E-.18954
G1 X129.926 Y158.331 E-.27126
G1 X129.882 Y158.204 E-.05117
G1 X129.69 Y157.946 E-.12209
G1 X129.695 Y157.924 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.908 Y162.094 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5497
G1 F6300
M204 S500
G1 X126.41 Y162.596 E.02932
; WIPE_START
G1 X125.908 Y162.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.165 Y165.159 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118842
G1 F3000
M204 S500
G1 X129.568 Y165.472 E.00316
; LINE_WIDTH: 0.165732
G1 X129.644 Y165.549 E.00108
; LINE_WIDTH: 0.202188
G1 X129.711 Y165.618 E.00125
; LINE_WIDTH: 0.236551
G1 X129.778 Y165.687 E.00152
; LINE_WIDTH: 0.258871
G1 X129.836 Y166.078 E.00696
M204 S6000
G1 X129.817 Y166.078 F42000
; LINE_WIDTH: 0.125923
G1 F3000
M204 S500
G2 X129.796 Y165.57 I-4.973 J-.048 E.00344
M204 S6000
G1 X130.468 Y165.981 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5639
G1 F6300
M204 S500
G1 X131.363 Y166.876 E.05373
G1 X131.371 Y167.277 E.01704
G1 X131.026 Y167.276 E.01463
G1 X130.178 Y166.427 E.05095
G1 X129.947 Y166.456 E.00986
G1 X129.91 Y166.696 E.01033
G1 X129.833 Y166.82 E.00618
G1 X130.494 Y167.48 E.03966
; WIPE_START
G1 X129.833 Y166.82 E-.35503
G1 X129.91 Y166.696 E-.05535
G1 X129.947 Y166.456 E-.0925
G1 X130.178 Y166.427 E-.08825
G1 X130.492 Y166.742 E-.16887
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.438 Y167.102 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122773
G1 F3000
M204 S500
G1 X129.354 Y167.194 E.00081
; LINE_WIDTH: 0.162485
G1 X129.27 Y167.285 E.00121
; LINE_WIDTH: 0.188042
G1 X129.106 Y167.438 E.00265
M204 S6000
G1 X129.132 Y167.353 F42000
; LINE_WIDTH: 0.164282
G1 F3000
M204 S500
G3 X128.922 Y167.39 I-.461 J-2.05 E.00211
; LINE_WIDTH: 0.117138
G1 X128.573 Y167.409 E.00212
M204 S6000
G1 X129.132 Y167.353 F42000
; LINE_WIDTH: 0.212806
G1 F3000
M204 S500
G1 X129.331 Y167.319 E.00281
; OBJECT_ID: 331
; WIPE_START
G1 X129.132 Y167.353 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
M204 S6000
G1 X127.776 Y159.842 Z.6 F42000
G1 X115.004 Y89.095 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X114.974 Y89.12 E.00145
G2 X114.546 Y89.914 I.569 J.82 E.03489
G2 X114.585 Y94.859 I77.772 J1.853 E.18422
G2 X115.449 Y96.154 I1.358 J.029 E.06173
G2 X116.708 Y96.291 I1.116 J-4.42 E.04733
G2 X119.469 Y96.278 I1.231 J-32.831 E.10288
G2 X120.694 Y95.665 I-.038 J-1.607 E.05269
G2 X120.893 Y95.037 I-1.542 J-.835 E.0247
G2 X120.956 Y92.734 I-30.228 J-1.976 E.08581
G1 X120.997 Y88.36 E.16295
G1 X121.51 Y88.36 E.0191
G3 X121.489 Y95.36 I-232.57 J2.815 E.26075
G3 X120.391 Y96.674 I-2.422 J-.908 E.06502
G3 X119.407 Y96.856 I-.947 J-2.371 E.03752
G3 X115.692 Y96.822 I-1.541 J-34.837 E.13843
G3 X114.619 Y96.277 I.133 J-1.591 E.04595
G3 X113.978 Y94.71 I1.452 J-1.509 E.06495
G3 X113.973 Y88.354 I184.942 J-3.343 E.23674
G3 X118.076 Y88.337 I3.21 J292.203 E.15284
G3 X118.085 Y91.811 I-120.731 J2.045 E.12939
G1 X117.479 Y91.787 E.02258
G2 X117.409 Y89.778 I-29.528 J.035 E.07489
G2 X117.153 Y89.132 I-1.477 J.211 E.02611
G2 X115.994 Y88.899 I-.971 J1.829 E.04465
G2 X115.156 Y89.02 I.094 J3.624 E.03162
G1 X115.058 Y89.068 E.00408
M204 S6000
G1 X115.224 Y89.496 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X115 Y89.962 I.368 J.464 E.01993
G2 X115.04 Y94.821 I79.12 J1.778 E.181
G2 X115.473 Y95.665 I.976 J.033 E.0369
G2 X116.115 Y95.809 I.741 J-1.809 E.02462
G2 X119.425 Y95.823 I1.813 J-36.524 E.12333
G2 X120.315 Y95.408 I-.01 J-1.183 E.03772
G2 X120.438 Y94.99 I-1.041 J-.535 E.01632
G2 X120.499 Y92.729 I-29.977 J-1.934 E.08426
G1 X120.544 Y87.902 E.17978
G1 X121.966 Y87.902 E.05293
G3 X121.941 Y95.445 I-227.28 J3.037 E.28095
G3 X120.587 Y97.088 I-2.869 J-.986 E.08102
G3 X119.434 Y97.313 I-1.137 J-2.76 E.04404
G3 X115.638 Y97.276 I-1.57 J-34.552 E.14144
G3 X114.16 Y96.456 I.227 J-2.151 E.06468
G3 X113.535 Y94.929 I1.76 J-1.612 E.06276
G3 X113.494 Y92.395 I41.321 J-1.934 E.09441
G1 X113.518 Y87.9 E.16741
G3 X117.958 Y87.88 I3.773 J336.668 E.16539
G3 X118.509 Y87.901 I.026 J6.454 E.02052
G3 X118.513 Y92.269 I-55.32 J2.242 E.16274
G3 X117.029 Y92.226 I.012 J-25.946 E.05532
G2 X116.956 Y89.844 I-34.761 J-.129 E.08877
G2 X116.824 Y89.485 I-.813 J.095 E.01437
G2 X116.005 Y89.356 I-.641 J1.403 E.03127
G2 X115.28 Y89.473 I-.093 J1.726 E.02759
M204 S6000
G1 X115.148 Y88.676 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.280918
G1 F3000
M204 S500
G2 X114.199 Y88.854 I1.482 J10.541 E.01874
M204 S6000
G1 X114.198 Y88.931 F42000
; LINE_WIDTH: 0.420735
G1 F3000
M204 S500
G1 X115.366 Y88.572 E.03761
M204 S6000
G1 X115.148 Y88.676 F42000
; LINE_WIDTH: 0.233905
G1 F3000
M204 S500
G1 X115.257 Y88.661 E.00171
; LINE_WIDTH: 0.200019
G1 X115.474 Y88.64 E.00279
; LINE_WIDTH: 0.158719
G1 X115.989 Y88.619 E.00486
G1 X116.7 Y88.639 E.00672
; LINE_WIDTH: 0.203262
G1 X116.808 Y88.652 E.00142
; LINE_WIDTH: 0.229326
G1 X116.908 Y88.664 E.00152
; LINE_WIDTH: 0.244837
G1 X116.925 Y88.667 E.00029
M204 S6000
G1 X117.54 Y88.563 F42000
; LINE_WIDTH: 0.38338
G1 F3000
M204 S500
G1 X117.696 Y89.312 E.02123
; LINE_WIDTH: 0.361718
G1 X117.713 Y89.411 E.00263
; LINE_WIDTH: 0.3281
G1 X117.731 Y89.529 E.00276
; LINE_WIDTH: 0.292912
G1 X117.75 Y89.732 E.00416
; LINE_WIDTH: 0.248031
G1 X117.775 Y90.426 E.01161
; LINE_WIDTH: 0.21338
G1 X117.782 Y91.57 E.01589
; WIPE_START
G1 X117.775 Y90.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.194 Y89.752 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.395757
G1 F3000
M204 S500
G1 X114.545 Y88.578 E.03525
M204 S6000
G1 X114.466 Y88.579 F42000
; LINE_WIDTH: 0.260916
G1 F3000
M204 S500
G1 X114.302 Y89.449 E.01574
; LINE_WIDTH: 0.242643
G1 X114.287 Y89.558 E.00179
; LINE_WIDTH: 0.212562
G1 X114.271 Y89.676 E.00165
; LINE_WIDTH: 0.169269
G1 X114.246 Y90.175 E.00514
; LINE_WIDTH: 0.162484
G1 X114.239 Y91.877 E.01658
G2 X114.289 Y94.885 I49.888 J.674 E.02932
G1 X114.315 Y95.137 E.00247
G2 X115.203 Y96.371 I1.729 J-.308 E.01532
; LINE_WIDTH: 0.171583
G2 X116.062 Y96.559 I.868 J-1.911 E.00928
G1 X116.437 Y96.576 E.00394
G2 X119.676 Y96.544 I1.3 J-32.304 E.03398
G2 X120.636 Y96.138 I-.081 J-1.53 E.01115
; LINE_WIDTH: 0.146128
G1 X120.674 Y96.105 E.00042
G2 X121.077 Y95.557 I-1.23 J-1.328 E.00575
; LINE_WIDTH: 0.194185
G1 X121.129 Y95.442 E.00155
G2 X121.209 Y94.753 I-1.838 J-.565 E.0086
G1 X121.21 Y94.742 E.00013
; LINE_WIDTH: 0.152991
G1 X121.22 Y94.273 E.00421
G2 X121.245 Y91.436 I-254.34 J-3.626 E.02545
; LINE_WIDTH: 0.120809
G1 X121.253 Y88.651 E.01768
; WIPE_START
G1 X121.247 Y90.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.854 Y98.273 Z.6 F42000
G1 X120.439 Y106.33 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X119.65 Y105.456 E.04387
G2 X118.975 Y104.821 I-11.619 J11.677 E.0345
G3 X113.943 Y100.312 I469.091 J-528.617 E.25169
G1 X113.943 Y99.326 E.03673
G3 X120.224 Y99.291 I5.237 J379.473 E.23393
G3 X121.59 Y99.308 I-.205 J71.646 E.0509
M73 P66 R4
G3 X121.603 Y99.909 I-7.368 J.458 E.02241
G2 X116.516 Y99.963 I-.736 J170.513 E.18949
G1 X115.831 Y100.018 E.02559
G1 X115.477 Y100.934 E.03659
G2 X117.916 Y103.258 I22.034 J-20.687 E.12557
G3 X121.537 Y106.499 I-264.275 J298.974 E.18099
G3 X121.522 Y107.537 I-83.179 J-.706 E.0387
G3 X113.944 Y107.548 I-4.784 J-697.252 E.28226
G3 X113.947 Y107.007 I12.51 J-.196 E.02017
G2 X118.776 Y106.968 I-1.332 J-469.48 E.17985
G2 X119.389 Y106.868 I-.03 J-2.106 E.02325
G1 X120.386 Y106.357 E.0417
M204 S6000
G1 X119.701 Y106.194 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X118.668 Y105.159 I-7.327 J6.281 E.05451
G3 X113.485 Y100.508 I325.194 J-367.54 E.25938
G3 X113.501 Y98.882 I23.402 J-.583 E.06059
G3 X120.225 Y98.834 I4.784 J200.173 E.25046
G3 X122.014 Y98.873 I.433 J20.989 E.06664
G3 X122.036 Y100.343 I-8.567 J.869 E.05483
G3 X118.965 Y100.378 I-2.24 J-62.011 E.11441
G2 X116.154 Y100.451 I-.609 J30.915 E.10479
G1 X116.007 Y100.831 E.01521
G2 X118.22 Y102.917 I22.207 J-21.355 E.11334
G3 X121.997 Y106.3 I-239.564 J271.216 E.18885
G3 X121.971 Y107.992 I-134.538 J-1.262 E.06303
G3 X113.493 Y107.999 I-4.494 J-347.313 E.31576
G3 X113.508 Y106.559 I28.159 J-.432 E.05364
G3 X118.402 Y106.524 I4.474 J287.665 E.18229
G2 X119.218 Y106.442 I.026 J-3.834 E.0306
G1 X119.648 Y106.222 E.018
M204 S6000
G1 X120.288 Y105.745 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.163913
G1 F3000
M204 S500
G1 X120.592 Y106.049 E.00424
; LINE_WIDTH: 0.204572
G1 X120.897 Y106.352 E.00566
M204 S6000
G1 X120.964 Y106.544 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X121.146 Y106.726 E.01151
G1 X121.139 Y107.15 E.01893
G1 X120.794 Y107.15 E.01544
G1 X120.292 Y106.648 E.0317
M204 S6000
G1 X120.188 Y107.063 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.29031
G1 F3000
M204 S500
G1 X119.51 Y107.197 E.01392
; LINE_WIDTH: 0.272172
G1 X119.415 Y107.211 E.0018
; LINE_WIDTH: 0.242913
G1 X119.309 Y107.227 E.00175
; LINE_WIDTH: 0.210701
G1 X119.11 Y107.245 E.00273
; LINE_WIDTH: 0.155345
G1 X118.418 Y107.266 E.00634
G3 X115.364 Y107.275 I-2.218 J-260.138 E.02798
; LINE_WIDTH: 0.142877
G2 X114.171 Y107.277 I-.359 J117.408 E.00972
; WIPE_START
G1 X115.364 Y107.275 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.71 Y101.56 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118949
G1 F3000
M204 S500
G1 X115.404 Y101.259 E.00266
; LINE_WIDTH: 0.146326
G1 X115.188 Y101.048 E.00255
M204 S6000
G1 X115.457 Y100.479 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56872
G1 F6300
M204 S500
G1 X114.681 Y99.704 E.047
G1 X114.331 Y99.709 E.01499
G1 X114.331 Y100.097 E.01665
G1 X115.105 Y100.871 E.04688
; WIPE_START
G1 X114.331 Y100.097 E-.41579
G1 X114.331 Y99.709 E-.14768
G1 X114.681 Y99.704 E-.13293
G1 X114.8 Y99.822 E-.06361
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.724 Y99.662 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.278027
G1 F3000
M204 S500
G1 X116.493 Y99.63 E.01474
; LINE_WIDTH: 0.249053
G1 X116.734 Y99.624 E.00404
; LINE_WIDTH: 0.21943
G3 X121.373 Y99.608 I3.103 J234.014 E.06673
; WIPE_START
G1 X119.373 Y99.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.984 Y105.442 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123254
G1 F3000
M204 S500
G1 X120.288 Y105.745 E.00281
; WIPE_START
G1 X119.984 Y105.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.476 Y110.608 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X117.467 Y110.609 E.00031
G3 X117.422 Y116.059 I-282.102 J.349 E.20301
G1 X117.419 Y116.195 E.00509
G3 X116.908 Y116.184 I-.055 J-9.413 E.01903
G2 X116.917 Y111.832 I-329.744 J-2.874 E.16213
G2 X116.884 Y111.496 I-1.772 J.003 E.01259
G1 X116.681 Y110.603 E.0341
G1 X114.004 Y110.525 E.09972
G3 X114.01 Y110.107 I17.601 J.039 E.01557
G3 X118.722 Y110.093 I3.252 J291.407 E.17551
G3 X120.32 Y110.198 I.261 J8.239 E.05972
G3 X121.5 Y111.829 I-.455 J1.571 E.08076
G3 X121.48 Y118.137 I-74.37 J2.918 E.23504
G3 X120.825 Y119.232 I-1.424 J-.108 E.04924
G3 X120.095 Y119.595 I-1.58 J-2.265 E.03048
G3 X117.032 Y119.633 I-2.06 J-42.785 E.11414
G1 X114.011 Y119.615 E.11252
G1 X114.002 Y119.174 E.01641
G2 X119.439 Y119.124 I.894 J-199.351 E.20251
G2 X120.454 Y118.909 I.095 J-2.053 E.03909
G2 X120.98 Y117.976 I-.669 J-.992 E.04135
G2 X121.019 Y116.205 I-18.326 J-1.296 E.06601
G2 X120.992 Y111.924 I-107.04 J-1.456 E.15946
G2 X120.683 Y110.983 I-1.43 J-.052 E.03766
G2 X119.585 Y110.563 I-1.074 J1.159 E.0449
G2 X118.962 Y110.562 I-.349 J32.637 E.02319
G1 X117.536 Y110.607 E.05316
M204 S6000
G1 X117.921 Y111.052 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X117.878 Y116.072 I-259.441 J.306 E.18696
G3 X117.855 Y116.631 I-8.229 J-.07 E.02087
G3 X116.459 Y116.601 I-.527 J-7.822 E.05205
G3 X116.474 Y113.385 I91.094 J-1.199 E.11976
G2 X116.436 Y111.583 I-14.244 J-.6 E.06718
G1 X116.314 Y111.05 E.02038
G3 X113.545 Y110.967 I4.047 J-182.039 E.10318
G3 X113.562 Y109.653 I55.106 J.073 E.04895
G3 X118.728 Y109.636 I3.635 J314.586 E.19239
G3 X120.434 Y109.755 I.263 J8.515 E.06382
G3 X121.956 Y111.807 I-.579 J2.02 E.1023
G3 X121.95 Y118.01 I-99.335 J2.999 E.23106
G3 X120.963 Y119.692 I-1.955 J-.017 E.07602
G3 X120.138 Y120.05 I-1.557 J-2.459 E.03367
G3 X117.03 Y120.09 I-2.099 J-42.655 E.11577
G1 X113.563 Y120.069 E.12916
G1 X113.536 Y118.72 E.05026
G2 X119.419 Y118.668 I.686 J-253.469 E.21912
G2 X120.103 Y118.574 I-.028 J-2.769 E.02581
G2 X120.525 Y117.923 I-.279 J-.643 E.03062
G2 X120.562 Y116.204 I-18.051 J-1.248 E.06409
G2 X120.536 Y111.953 I-107.173 J-1.454 E.15833
G2 X120.418 Y111.39 I-1.439 J.006 E.02156
G2 X119.732 Y111.032 I-.748 J.595 E.02968
G2 X117.981 Y111.049 I-.697 J18.397 E.06526
M204 S6000
G1 X117.578 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.107215
G1 F3000
M204 S500
G1 X117.24 Y110.353 E.00178
; LINE_WIDTH: 0.128291
G1 X117.068 Y110.439 E.00133
; LINE_WIDTH: 0.161889
G1 X116.897 Y110.525 E.00186
M204 S6000
G1 X117.048 Y110.319 F42000
; LINE_WIDTH: 0.366788
G1 F3000
M204 S500
M73 P67 R4
G1 X117.072 Y110.543 E.00594
; LINE_WIDTH: 0.322636
G1 X117.097 Y110.766 E.00513
; LINE_WIDTH: 0.278484
G1 X117.121 Y110.99 E.00432
; LINE_WIDTH: 0.234332
G1 X117.146 Y111.214 E.00351
; LINE_WIDTH: 0.189787
G1 X117.17 Y111.442 E.00274
; LINE_WIDTH: 0.14305
G1 X117.187 Y111.82 E.00308
; LINE_WIDTH: 0.111158
G1 X117.19 Y113.096 E.00709
M204 S6000
G1 X117.184 Y113.824 F42000
; LINE_WIDTH: 0.105358
G1 F3000
M204 S500
G2 X117.164 Y115.965 I280.947 J3.72 E.01089
; WIPE_START
G1 X117.183 Y113.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.889 Y119.349 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.107078
G1 F3000
M204 S500
G2 X120.167 Y119.3 I-.018 J-.92 E.00149
; WIPE_START
G1 X119.889 Y119.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.014 Y118.7 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.112207
G1 F3000
M204 S500
G2 X121.207 Y118.215 I-.904 J-.64 E.00298
G1 X121.228 Y118.055 E.00091
; WIPE_START
G1 X121.207 Y118.215 E-.17852
G1 X121.14 Y118.47 E-.29119
G1 X121.014 Y118.7 E-.29029
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.272 Y117.008 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.11115
G1 F3000
M204 S500
G2 X121.274 Y113.038 I-169.27 J-2.103 E.02207
; WIPE_START
G1 X121.273 Y115.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.239 Y111.796 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10881
G1 F3000
M204 S500
G1 X121.223 Y111.588 E.00112
G2 X121.042 Y111.038 I-1.444 J.171 E.00313
; WIPE_START
G1 X121.139 Y111.241 E-.21603
G1 X121.223 Y111.588 E-.34353
G1 X121.239 Y111.796 E-.20044
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.029 Y119.426 Z.6 F42000
G1 X120.817 Y127.155 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X120.65 Y126.959 E.00958
G2 X120.234 Y126.777 I-.634 J.882 E.01706
G2 X116.572 Y126.726 I-3.451 J117.617 E.1364
G3 X113.995 Y126.686 I.669 J-124.734 E.09601
G3 X113.995 Y126.218 I12.13 J-.239 E.01742
G3 X119.279 Y126.188 I4.803 J385.255 E.19683
G2 X120.295 Y126.111 I-.015 J-6.863 E.038
G2 X120.982 Y125.314 I-.223 J-.887 E.04176
G2 X121.03 Y122.069 I-71.709 J-2.683 E.12085
G1 X121.466 Y122.067 E.01623
G1 X121.471 Y122.248 E.00676
G3 X121.494 Y130.879 I-447.979 J5.488 E.32147
G3 X121.032 Y130.88 I-.25 J-6.691 E.0172
G2 X120.997 Y127.909 I-261.548 J1.631 E.11066
G2 X120.855 Y127.201 I-1.99 J.029 E.02706
M204 S6000
G1 X120.446 Y127.432 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X120.156 Y127.231 I-.366 J.218 E.01357
G2 X116.568 Y127.183 I-3.424 J122.746 E.13367
G3 X113.551 Y127.129 I.646 J-120.288 E.11238
G3 X113.55 Y125.771 I20.885 J-.7 E.05058
G3 X119.271 Y125.731 I15.146 J1759.708 E.21309
G2 X120.171 Y125.669 I-.025 J-6.928 E.03365
G2 X120.527 Y125.26 I-.096 J-.443 E.02164
G2 X120.58 Y121.831 I-313.325 J-6.566 E.12774
G1 X120.592 Y121.637 E.00723
G3 X121.906 Y121.62 I.792 J10.52 E.04897
G3 X121.942 Y131.311 I-304.514 J5.993 E.36095
G3 X120.595 Y131.315 I-.711 J-10.476 E.05021
G3 X120.56 Y128.823 I48.874 J-1.922 E.09287
G2 X120.499 Y127.569 I-8.336 J-.217 E.04681
G2 X120.474 Y127.486 I-.419 J.082 E.00322
; WIPE_START
G1 X120.356 Y127.318 E-.07805
G1 X120.156 Y127.231 E-.08267
G1 X118.579 Y127.199 E-.59928
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.303 Y126.449 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.237256
G1 F3000
M204 S500
G2 X120.201 Y126.456 I-.001 J.826 E.00163
; LINE_WIDTH: 0.199426
G1 X119.853 Y126.464 E.00444
; LINE_WIDTH: 0.160509
G1 X119.284 Y126.469 E.00545
; LINE_WIDTH: 0.120821
G1 X116.073 Y126.462 E.02038
; WIPE_START
G1 X118.073 Y126.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.29 Y133.573 Z.6 F42000
G1 X115.088 Y134.088 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X114.929 Y134.22 E.0077
G2 X114.595 Y134.87 I.791 J.817 E.02769
G2 X114.5 Y135.865 I8.597 J1.323 E.03726
G1 X114.467 Y142.233 E.2372
G1 X114.023 Y142.225 E.01654
G3 X114.012 Y135.34 I410.616 J-4.073 E.25643
G3 X114.089 Y134.62 I3.116 J-.034 E.02704
G3 X114.958 Y133.633 I1.535 J.476 E.05047
G3 X116.196 Y133.44 I.982 J2.236 E.04718
G3 X116.883 Y133.544 I.006 J2.283 E.02599
G3 X117.892 Y134.511 I-.828 J1.873 E.05311
G3 X118.025 Y136.397 I-10.665 J1.702 E.07049
G3 X118.048 Y141.58 I-261.74 J3.755 E.19305
G2 X118.795 Y142.059 I2.761 J-3.481 E.03309
G2 X120.703 Y141.737 I.693 J-1.707 E.07589
G2 X120.961 Y141.345 I-1.062 J-.978 E.01755
G2 X121.023 Y135.561 I-129.52 J-4.279 E.21546
G3 X121.043 Y133.777 I74.181 J-.054 E.06643
G1 X121.5 Y133.774 E.01704
G3 X121.461 Y141.317 I-177.479 J2.853 E.28098
G3 X120.824 Y142.26 I-1.546 J-.357 E.04337
G3 X119.493 Y142.656 I-1.206 J-1.621 E.05281
G3 X117.659 Y141.662 I-.082 J-2.038 E.08155
G3 X117.545 Y140.369 I5.478 J-1.134 E.04846
G3 X117.494 Y135.444 I356.464 J-6.174 E.18346
G2 X117.329 Y134.54 I-2.138 J-.078 E.03447
G2 X116.201 Y133.912 I-1.118 J.681 E.05028
G2 X115.513 Y133.919 I-.312 J3.099 E.0257
G2 X115.14 Y134.059 I.207 J1.118 E.01489
M204 S6000
G1 X115.366 Y134.456 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X115.04 Y134.974 I.374 J.597 E.02359
G2 X114.943 Y136.695 I11.335 J1.502 E.06424
G1 X114.923 Y142.699 E.22365
G1 X113.568 Y142.673 E.05046
G3 X113.555 Y135.327 I431.37 J-4.412 E.27359
G3 X113.925 Y133.906 I2.365 J-.144 E.05561
G3 X115.998 Y132.978 I1.918 J1.504 E.088
G1 X116.214 Y132.983 E.00805
G3 X117.063 Y133.124 I-.021 J2.767 E.03221
G3 X118.305 Y134.302 I-1.15 J2.454 E.06486
G3 X118.441 Y135.236 I-3.472 J.984 E.03525
G3 X118.493 Y137.221 I-42.974 J2.109 E.07396
G1 X118.504 Y141.338 E.15334
G2 X119.215 Y141.709 I1.169 J-1.369 E.03013
G2 X120.372 Y141.419 I.27 J-1.376 E.04588
G2 X120.509 Y141.214 I-.553 J-.519 E.00922
G2 X120.576 Y134.23 I-280.902 J-6.194 E.26015
G3 X120.604 Y133.344 I17.189 J.089 E.03302
G3 X121.946 Y133.339 I.714 J11.279 E.05001
G3 X121.928 Y141.209 I-191.373 J3.505 E.29315
G3 X121.226 Y142.519 I-1.793 J-.117 E.05708
G3 X119.493 Y143.113 I-1.59 J-1.814 E.07001
G3 X117.23 Y141.823 I-.087 J-2.475 E.10216
G3 X117.103 Y140.861 I3.562 J-.959 E.03622
G3 X117.049 Y136.007 I145.123 J-4.036 E.18084
G2 X116.983 Y134.925 I-7.173 J-.1 E.04041
G2 X116.321 Y134.384 I-.706 J.188 E.034
G2 X115.482 Y134.398 I-.373 J2.86 E.03137
G2 X115.418 Y134.426 I.259 J.655 E.00258
M204 S6000
G1 X114.605 Y134.199 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124423
M73 P68 R4
G1 F3000
M204 S500
G2 X114.271 Y135.331 I1.494 J1.055 E.00797
; WIPE_START
G1 X114.298 Y134.988 E-.21776
G1 X114.352 Y134.707 E-.18149
G1 X114.462 Y134.423 E-.19235
G1 X114.605 Y134.199 E-.1684
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.557 Y134.421 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.111834
G1 F3000
M204 S500
G3 X117.679 Y134.765 I-.76 J.465 E.00206
; WIPE_START
G1 X117.635 Y134.583 E-.38733
G1 X117.557 Y134.421 E-.37267
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.769 Y136.592 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.104638
G1 F3000
M204 S500
G3 X117.78 Y138.067 I-148.699 J1.793 E.00742
; WIPE_START
G1 X117.769 Y136.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.792 Y143.964 Z.6 F42000
G1 X115.313 Y145.75 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X115.227 Y145.75 E.00321
G1 X114.455 Y146.639 E.04385
G1 X114.501 Y153.543 E.25716
G1 X115.299 Y154.342 E.04206
G1 X121.54 Y154.406 E.23245
G1 X121.541 Y154.821 E.01547
G3 X115.93 Y154.827 I-3.022 J-225.728 E.20903
G3 X114.822 Y154.503 I-.071 J-1.814 E.04375
G3 X114.029 Y153.197 I.675 J-1.303 E.05984
G3 X114.049 Y146.582 I109.588 J-2.981 E.24642
G3 X115.488 Y145.301 I1.763 J.532 E.07549
G3 X117.173 Y145.221 I1.333 J10.26 E.0629
G3 X121.085 Y145.231 I1.443 J202.789 E.14573
G1 X121.493 Y145.24 E.0152
G3 X121.499 Y145.732 I-12.753 J.407 E.01834
G3 X119.845 Y145.751 I-3.884 J-268.552 E.06162
G1 X115.373 Y145.75 E.16656
M204 S6000
G1 X115.436 Y146.207 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X114.913 Y146.808 E.02966
G1 X114.957 Y153.353 E.24375
G1 X115.491 Y153.887 E.02813
G1 X121.989 Y153.953 E.24206
G3 X121.978 Y155.276 I-13.973 J.546 E.04928
G3 X115.912 Y155.283 I-3.334 J-239.378 E.22594
G3 X114.586 Y154.895 I-.052 J-2.277 E.05229
G3 X113.573 Y153.229 I.877 J-1.675 E.0763
G3 X113.586 Y146.623 I113.03 J-3.086 E.24606
G3 X113.898 Y145.83 I1.724 J.221 E.03207
G3 X115.375 Y144.858 I1.941 J1.339 E.06751
G3 X117.169 Y144.764 I1.433 J10.185 E.06701
G3 X121.092 Y144.774 I1.446 J203.425 E.14611
M73 P68 R3
G3 X121.937 Y144.795 I.031 J15.318 E.03147
G3 X121.944 Y146.175 I-15.42 J.776 E.0514
G3 X115.496 Y146.208 I-4.287 J-209.889 E.24021
; WIPE_START
G1 X114.913 Y146.808 E-.3179
G1 X114.921 Y147.972 E-.4421
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.353 Y145.492 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113681
G1 F3000
M204 S500
G3 X120.703 Y145.486 I3.103 J674.737 E.02508
; WIPE_START
G1 X118.703 Y145.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.109 Y153.11 Z.6 F42000
G1 X119.405 Y158.666 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X119.309 Y158.388 E.01098
G1 X119.097 Y158.104 E.01318
G2 X118.169 Y157.906 I-.841 J1.673 E.03573
G2 X113.994 Y157.867 I-9.262 J770.198 E.15552
G1 X113.993 Y157.407 E.01715
G3 X121.541 Y157.415 I3.327 J420.344 E.28112
G3 X121.499 Y158.405 I-26.145 J-.613 E.03692
G2 X116.666 Y161.827 I95.945 J140.639 E.22059
G2 X116.419 Y162.8 I.57 J.662 E.03983
G2 X116.924 Y163.421 I1.475 J-.685 E.03011
G2 X118.982 Y164.873 I25.364 J-33.757 E.09383
G2 X121.52 Y166.648 I67.369 J-93.629 E.11536
G3 X121.541 Y167.666 I-19.893 J.916 E.03794
G3 X113.994 Y167.646 I-1.964 J-674.979 E.28111
G3 X113.994 Y167.193 I19.566 J-.217 E.01689
G2 X118.45 Y167.145 I.947 J-119.234 E.16601
G2 X119.312 Y166.558 I-.047 J-.996 E.04086
G1 X119.36 Y166.246 E.01176
G2 X118.949 Y165.491 I-.989 J.049 E.0331
G2 X114.755 Y162.519 I-137.871 J190.126 E.19146
G2 X118.848 Y159.626 I-83.22 J-122.062 E.18671
G2 X119.341 Y159.16 I-.867 J-1.41 E.02546
G1 X119.426 Y158.727 E.01641
G1 X119.425 Y158.723 E.00017
M204 S6000
G1 X118.954 Y158.76 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X118.801 Y158.471 I-.532 J.097 E.01237
G2 X118.151 Y158.363 I-.546 J1.27 E.02479
G2 X113.924 Y158.324 I-9.795 J825.501 E.15743
G1 X113.545 Y158.311 E.01411
G3 X113.55 Y156.961 I20.444 J-.601 E.05028
G3 X121.992 Y156.96 I4.287 J371.742 E.31444
G3 X121.945 Y158.655 I-20.056 J.282 E.06318
G2 X116.975 Y162.166 I97.562 J143.357 E.22663
G2 X116.904 Y162.752 I.307 J.335 E.02394
G2 X117.555 Y163.326 I2.287 J-1.938 E.03241
G3 X121.958 Y166.398 I-404.731 J584.606 E.19999
G3 X121.98 Y168.123 I-13.715 J1.036 E.0643
G3 X113.546 Y168.094 I-2.095 J-600.267 E.31414
G3 X113.546 Y166.737 I22.723 J-.673 E.05054
G2 X118.405 Y166.689 I1.13 J-133.376 E.18101
G2 X118.897 Y166.247 I.015 J-.478 E.02722
G2 X118.654 Y165.841 I-.555 J.057 E.01819
G3 X113.981 Y162.514 I737.41 J-1040.69 E.21366
G2 X118.572 Y159.262 I-318.935 J-455.061 E.20954
G2 X118.916 Y158.955 I-.561 J-.975 E.0173
G1 X118.942 Y158.819 E.00515
M204 S6000
G1 X119.525 Y159.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143229
G1 F3000
M204 S500
G3 X119.318 Y159.599 I-1.961 J-1.955 E.00228
; LINE_WIDTH: 0.111848
G1 X119.016 Y159.822 E.00211
; WIPE_START
G1 X119.318 Y159.599 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.111 Y157.741 Z.6 F42000
M73 P69 R3
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.193452
G1 F3000
M204 S500
G2 X118.921 Y157.7 I-.53 J1.996 E.00238
; LINE_WIDTH: 0.164431
G1 X118.805 Y157.685 E.00117
; LINE_WIDTH: 0.117873
G1 X118.371 Y157.659 E.00265
; WIPE_START
G1 X118.805 Y157.685 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.351 Y157.593 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53405
G1 F6300
M204 S500
G1 X121.022 Y158.264 E.03802
G1 X120.614 Y158.55 E.01996
G1 X119.86 Y157.796 E.04267
G1 X119.497 Y157.795 E.01451
G1 X119.464 Y157.946 E.00621
G1 X119.656 Y158.204 E.01286
G1 X119.7 Y158.331 E.00539
G1 X120.205 Y158.836 E.02857
G1 X119.796 Y159.121 E.01996
G1 X119.578 Y158.903 E.01234
; WIPE_START
G1 X119.796 Y159.121 E-.11716
G1 X120.205 Y158.836 E-.18954
G1 X119.7 Y158.331 E-.27126
G1 X119.656 Y158.204 E-.05117
G1 X119.464 Y157.946 E-.12209
G1 X119.469 Y157.924 E-.00878
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.681 Y162.094 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.5497
G1 F6300
M204 S500
G1 X116.183 Y162.596 E.02932
; WIPE_START
G1 X115.681 Y162.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.939 Y165.159 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118842
G1 F3000
M204 S500
G1 X119.341 Y165.472 E.00316
; LINE_WIDTH: 0.165732
G1 X119.417 Y165.549 E.00108
; LINE_WIDTH: 0.202188
G1 X119.484 Y165.618 E.00125
; LINE_WIDTH: 0.236551
G1 X119.552 Y165.687 E.00152
; LINE_WIDTH: 0.258871
G1 X119.61 Y166.078 E.00696
M204 S6000
G1 X119.591 Y166.078 F42000
; LINE_WIDTH: 0.125923
G1 F3000
M204 S500
G2 X119.57 Y165.57 I-4.973 J-.048 E.00344
M204 S6000
G1 X120.241 Y165.981 F42000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5639
G1 F6300
M204 S500
G1 X121.136 Y166.876 E.05373
G1 X121.144 Y167.277 E.01704
G1 X120.8 Y167.276 E.01463
G1 X119.951 Y166.427 E.05095
G1 X119.721 Y166.456 E.00986
G1 X119.684 Y166.696 E.01033
G1 X119.607 Y166.82 E.00618
G1 X120.267 Y167.48 E.03966
; WIPE_START
G1 X119.607 Y166.82 E-.35503
G1 X119.684 Y166.696 E-.05535
G1 X119.721 Y166.456 E-.0925
G1 X119.951 Y166.427 E-.08825
G1 X120.265 Y166.742 E-.16887
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.212 Y167.102 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122773
G1 F3000
M204 S500
G1 X119.128 Y167.194 E.00081
; LINE_WIDTH: 0.162485
G1 X119.044 Y167.285 E.00121
; LINE_WIDTH: 0.188042
G1 X118.88 Y167.438 E.00265
M204 S6000
G1 X118.905 Y167.353 F42000
; LINE_WIDTH: 0.164282
G1 F3000
M204 S500
G3 X118.695 Y167.39 I-.461 J-2.05 E.00211
; LINE_WIDTH: 0.117138
G1 X118.346 Y167.409 E.00212
M204 S6000
G1 X118.905 Y167.353 F42000
; LINE_WIDTH: 0.212806
G1 F3000
M204 S500
G1 X119.105 Y167.319 E.00281
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3000
G1 X118.905 Y167.353 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 2/4
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S186.15
; open powerlost recovery
M1003 S1
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I.47 J1.123 P1  F42000
G1 X139.652 Y158.678 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X139.58 Y158.47 E.00975
G2 X139.415 Y158.261 I-.682 J.368 E.01192
G2 X138.798 Y158.112 I-.571 J1.01 E.02862
G2 X134.249 Y158.06 I-6.536 J375.104 E.20236
G3 X134.254 Y157.214 I17.494 J-.334 E.03763
G3 X142.193 Y157.219 I3.721 J426.531 E.35316
G3 X142.144 Y158.513 I-22.684 J-.209 E.05762
G2 X137.25 Y161.975 I86.806 J127.905 E.26665
G2 X137.219 Y163.002 I.492 J.529 E.05086
G2 X137.8 Y163.496 I2.959 J-2.892 E.03398
G2 X142.165 Y166.543 I807.609 J-1152.394 E.2368
G3 X142.188 Y167.864 I-18.182 J.973 E.05877
G3 X134.251 Y167.839 I-2.114 J-587.958 E.35306
G3 X134.251 Y166.996 I33.794 J-.441 E.03748
G2 X138.876 Y166.949 I1.184 J-111.6 E.20578
G2 X139.342 Y166.796 I-.091 J-1.062 E.02201
G2 X139.288 Y165.652 I-.449 J-.552 E.05921
G2 X134.874 Y162.518 I-235.825 J327.478 E.24081
G2 X139.247 Y159.419 I-190.181 J-273.047 E.23843
G2 X139.636 Y159.033 I-.658 J-1.051 E.02457
G1 X139.66 Y158.736 E.01329
M204 S10000
G1 X139.278 Y158.757 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.247 Y158.652 I-.275 J.027 E.00453
G2 X139.019 Y158.504 I-.274 J.173 E.01148
G2 X135.914 Y158.454 I-2.506 J58.481 E.12754
G3 X133.891 Y158.425 I.048 J-74.485 E.08306
G3 X133.896 Y156.849 I19.632 J-.729 E.06471
G3 X142.547 Y156.845 I4.488 J332.294 E.3552
G3 X142.509 Y158.718 I-15.279 J.634 E.07694
G2 X137.506 Y162.251 I87.947 J129.844 E.25155
G2 X137.56 Y162.819 I.27 J.26 E.02659
G2 X138.582 Y163.591 I7.227 J-8.504 E.05263
G3 X140.925 Y165.229 I-56.115 J82.729 E.11736
G3 X142.515 Y166.336 I-19.43 J29.634 E.07958
G3 X142.533 Y168.238 I-11.086 J1.052 E.07822
G3 X133.891 Y168.206 I-2.329 J-523.15 E.35481
G3 X133.891 Y166.622 I20.528 J-.8 E.06503
G2 X138.842 Y166.575 I1.22 J-133.023 E.20333
G2 X139.22 Y166.34 I.011 J-.402 E.01934
G2 X139.045 Y165.939 I-.357 J-.084 E.01926
G3 X134.312 Y162.566 I453.819 J-641.818 E.23865
G1 X134.247 Y162.513 E.00343
G3 X138.646 Y159.399 I1147.337 J1616.221 E.22132
G2 X139.194 Y158.984 I-7.158 J-10.003 E.02821
G2 X139.278 Y158.817 I-.191 J-.2 E.00782
; WIPE_START
M204 S6000
G1 X139.247 Y158.652 E-.06381
G1 X139.177 Y158.564 E-.04275
G1 X139.019 Y158.504 E-.06403
G1 X138.059 Y158.465 E-.36517
G1 X137.469 Y158.462 E-.22423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
; stop printing object, unique label id: 425
M625
; object ids of layer 2 start: 169,331,425
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.88
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer2 end: 169,331,425
M625
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.128 Y157.67 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556294
G1 F5182.184
M204 S6000
G1 X137.423 Y157.64 E.09657
G2 X134.844 Y157.639 I-1.782 J804.609 E.14596
; LINE_WIDTH: 0.532414
G1 F5444.184
G1 X134.444 Y157.637 E.02155
M204 S10000
G1 X139.507 Y157.581 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X139.495 Y157.885 E.01246
G1 X139.681 Y157.992 E.00882
G1 X139.924 Y158.317 E.01668
G1 X140.039 Y158.699 E.01636
G1 X139.969 Y159.225 E.02181
G1 X140.133 Y159.455 E.01159
G1 X141.776 Y158.312 E.08219
G1 X141.804 Y157.592 E.02959
G1 X139.567 Y157.582 E.09184
M204 S10000
G1 X140.247 Y158.017 F42000
; LINE_WIDTH: 0.565569
G1 F5087.102
M204 S6000
G1 X140.439 Y158.485 E.02917
G1 X140.466 Y158.696 E.01227
G1 X141.352 Y158.08 E.06226
G1 X141.354 Y158.022 E.00331
G1 X140.307 Y158.018 E.06041
M204 S10000
M73 P70 R3
G1 X139.772 Y159.598 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
M204 S6000
G1 X136.924 Y161.642 E.20204
M204 S10000
G1 X136.567 Y161.788 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X135.524 Y162.52 E.05231
G1 X136.622 Y163.3 E.05533
G1 X136.814 Y163.052 E.01285
G3 X136.635 Y162.473 I.898 J-.595 E.02525
G1 X136.7 Y162.131 E.01429
G1 X136.748 Y162.038 E.0043
G1 X136.602 Y161.836 E.01022
M204 S10000
G1 X136.255 Y162.473 F42000
; LINE_WIDTH: 0.511568
G1 F5695.554
M204 S6000
G2 X136.252 Y162.571 I-.028 J.048 E.01184
M204 S10000
G1 X136.987 Y163.441 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
M204 S6000
G2 X139.688 Y165.377 I58.661 J-79.002 E.19302
M204 S10000
G1 X140.046 Y165.524 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X139.858 Y165.778 E.01294
G1 X139.956 Y166.001 E.01001
G3 X139.797 Y166.857 I-1.156 J.228 E.03663
G1 X139.524 Y167.125 E.0157
G1 X139.415 Y167.179 E.005
G1 X139.421 Y167.488 E.01271
G1 X141.819 Y167.489 E.09844
G1 X141.796 Y166.743 E.03064
G1 X140.095 Y165.558 E.08513
M204 S10000
G1 X140.342 Y166.169 F42000
G1 F7144.644
M204 S6000
G1 X140.303 Y166.594 E.01756
G1 X140.155 Y166.961 E.01621
G1 X140.036 Y167.129 E.00845
G1 X141.448 Y167.129 E.05797
G1 X141.442 Y166.935 E.00797
G1 X140.391 Y166.203 E.05257
M204 S10000
G1 X140.635 Y166.745 F42000
; LINE_WIDTH: 0.394909
G1 F7680.033
M204 S6000
G1 X140.572 Y166.781 E.00277
G1 X140.619 Y166.808 E.00208
M204 S10000
G1 X139.045 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
M204 S6000
G1 X135.833 Y167.424 E.18001
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X134.445 Y167.419 E.07403
; WIPE_START
G1 X135.833 Y167.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.794 Y159.791 Z.88 F42000
G1 X135.723 Y146.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X135.106 Y146.712 E.04191
G1 X135.15 Y153.461 E.30021
G1 X135.835 Y154.145 E.04305
G1 X142.186 Y154.211 E.28254
G3 X142.184 Y155.017 I-15.639 J.362 E.03589
G3 X136.114 Y155.011 I-2.858 J-184.576 E.27004
G3 X135.512 Y154.849 I.021 J-1.275 E.02801
G3 X134.476 Y153.984 I.751 J-1.952 E.06113
G3 X134.286 Y153.223 I1.386 J-.75 E.03527
G3 X134.253 Y148.5 I104.203 J-3.088 E.21011
G3 X134.307 Y146.546 I30.526 J-.146 E.08692
G3 X135.891 Y145.11 I1.957 J.566 E.10014
G3 X137.622 Y145.024 I1.375 J10.16 E.07718
G3 X140.843 Y145.025 I1.512 J225.279 E.14328
G3 X142.139 Y145.047 I-.245 J52.583 E.05767
G3 X142.146 Y145.923 I-21.432 J.606 E.03897
G3 X135.77 Y145.947 I-4.211 J-273.027 E.28363
G1 X135.763 Y145.955 E.00048
M204 S10000
G1 X135.941 Y146.322 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.482 Y146.851 E.02877
G1 X135.524 Y153.305 E.26499
G1 X135.992 Y153.772 E.02714
G1 X142.555 Y153.839 E.26951
G3 X142.535 Y155.39 I-12.499 J.612 E.06372
G3 X136.088 Y155.385 I-3.083 J-193.366 E.26473
G3 X135.357 Y155.191 I.052 J-1.664 E.03132
G3 X134.147 Y154.164 I.912 J-2.301 E.06632
G3 X133.912 Y153.249 I1.739 J-.934 E.03917
G3 X133.878 Y148.497 I103.801 J-3.114 E.19515
G3 X133.942 Y146.454 I26.721 J-.195 E.08394
G3 X135.799 Y144.746 I2.327 J.667 E.10897
G3 X137.62 Y144.649 I1.459 J10.173 E.07496
G3 X140.846 Y144.65 I1.513 J225.615 E.13248
G3 X142.5 Y144.69 I.118 J29.411 E.06794
G3 X142.504 Y146.283 I-18.899 J.844 E.06544
G3 X136.001 Y146.323 I-4.493 J-206.388 E.26704
M204 S10000
G1 X135.848 Y145.542 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
M204 S6000
G1 X135.721 Y145.563 E.00589
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X135.542 Y145.631 I.076 J.465 E.00795
M204 S10000
G1 X141.952 Y145.486 F42000
; LINE_WIDTH: 0.588624
G1 F4865.193
M204 S6000
G2 X136.275 Y145.503 I-1.688 J381.573 E.34228
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X135.991 Y145.523 I.084 J3.261 E.01565
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X135.848 Y145.542 E.00721
M204 S10000
G1 X135.93 Y145.301 F42000
; LINE_WIDTH: 0.489929
G1 F5982.279
M204 S6000
G1 X135.626 Y145.555 E.01941
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X135.254 Y145.869 I3.535 J4.562 E.02564
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X134.895 Y146.284 I2.048 J2.135 E.03194
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X134.834 Y146.373 E.00585
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X134.752 Y146.503 E.00774
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X134.699 Y146.732 I.484 J.232 E.01173
G2 X134.689 Y147.384 I33.324 J.83 E.0322
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X134.727 Y153.395 I173.802 J1.921 E.33164
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X134.739 Y153.544 E.00754
G2 X134.854 Y153.776 I.425 J-.066 E.01332
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X135.273 Y154.209 I1.874 J-1.392 E.03512
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X135.374 Y154.291 E.00714
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X135.455 Y154.353 E.00524
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X135.535 Y154.414 E.00493
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X135.812 Y154.543 I.431 J-.561 E.01359
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X135.954 Y154.569 E.00709
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X138.568 Y154.606 I1.938 J-45.472 E.14357
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X140.281 Y154.609 E.09023
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X141.994 Y154.613 E.08521
; WIPE_START
G1 X140.281 Y154.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.619 Y147.006 Z.88 F42000
G1 X139.165 Y141.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X139.349 Y141.886 E.00925
G2 X141.02 Y141.592 I.592 J-1.531 E.07932
G2 X141.217 Y141.295 I-.907 J-.814 E.01593
G2 X141.273 Y138.139 I-91.854 J-3.227 E.14039
G3 X141.305 Y133.589 I190.503 J-.97 E.20243
G3 X142.147 Y133.583 I.51 J12.053 E.03747
G3 X142.11 Y141.346 I-164.906 J3.091 E.34536
G3 X141.393 Y142.42 I-1.745 J-.388 E.05876
G3 X139.946 Y142.853 I-1.323 J-1.782 E.06859
G3 X137.935 Y141.754 I-.081 J-2.24 E.10699
G3 X137.817 Y140.871 I3.141 J-.871 E.03973
G3 X137.749 Y135.433 I938.133 J-14.477 E.24194
G2 X137.605 Y134.632 I-2.427 J.02 E.03637
G2 X136.635 Y134.109 I-.941 J.583 E.05133
G2 X135.877 Y134.144 I-.274 J2.308 E.03393
G2 X135.238 Y134.925 I.314 J.908 E.04725
G2 X135.138 Y136.544 I9.636 J1.409 E.07225
G1 X135.116 Y142.434 E.26202
G1 X134.28 Y142.418 E.03723
G3 X134.27 Y135.277 I367.728 J-4.084 E.31767
G3 X134.633 Y133.998 I2.012 J-.12 E.06024
G3 X136.536 Y133.24 I1.685 J1.46 E.09471
G3 X137.41 Y133.361 I.084 J2.601 E.03943
G3 X138.505 Y134.371 I-1.099 J2.291 E.06725
G3 X138.659 Y135.78 I-5.61 J1.326 E.06322
G3 X138.686 Y137.215 I-55.594 J1.737 E.06386
G1 X138.698 Y141.475 E.18949
G2 X139.112 Y141.76 I2.137 J-2.662 E.0224
M204 S10000
G1 X139.341 Y141.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.933 Y141.617 I.644 J-1.234 E.02535
G2 X140.747 Y141.333 I.042 J-1.19 E.03622
G2 X140.847 Y141.185 I-.45 J-.413 E.00737
G2 X140.914 Y134.216 I-272.184 J-6.106 E.28616
G3 X140.949 Y133.24 I15.683 J.07 E.04011
G3 X142.509 Y133.235 I.812 J9.744 E.06413
G3 X142.481 Y141.403 I-149.209 J3.571 E.33543
G3 X141.626 Y142.714 I-2.118 J-.448 E.06577
G3 X139.945 Y143.228 I-1.553 J-2.073 E.07361
G3 X137.587 Y141.894 I-.084 J-2.603 E.117
G3 X137.442 Y140.887 I3.413 J-1.005 E.04192
G3 X137.374 Y135.45 I906.214 J-14.078 E.22327
G2 X137.274 Y134.81 I-2.101 J.001 E.0267
G2 X136.75 Y134.497 I-.586 J.386 E.02591
G2 X135.985 Y134.503 I-.359 J2.881 E.03154
G2 X135.604 Y135.008 I.208 J.553 E.02739
G2 X135.512 Y136.547 I9.415 J1.33 E.06337
G1 X135.49 Y142.817 E.25744
G1 X133.906 Y142.786 E.06503
G3 X133.895 Y135.265 I383.096 J-4.349 E.3088
G3 X134.51 Y133.577 I2.273 J-.128 E.07583
G3 X136.547 Y132.865 I1.805 J1.895 E.0913
G3 X137.557 Y133.016 I.076 J2.948 E.04216
G3 X138.855 Y134.234 I-1.232 J2.613 E.07429
G3 X139.008 Y135.215 I-3.755 J1.089 E.04086
G3 X139.06 Y137.213 I-43.917 J2.155 E.08208
G1 X139.072 Y141.277 E.16686
G2 X139.289 Y141.431 I.913 J-1.05 E.01093
M204 S10000
G1 X138.7 Y141.995 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556328
G1 F5181.833
M204 S6000
G2 X140.13 Y142.416 I1.204 J-1.454 E.08674
G2 X141.653 Y141.365 I-.004 J-1.635 E.11135
G1 X141.666 Y141.277 E.00502
G2 X141.724 Y133.775 I-217.653 J-5.446 E.42474
; WIPE_START
G1 X141.723 Y135.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.7 Y141.995 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.517434
G1 F5622.502
M204 S6000
G1 X138.603 Y141.918 E.00647
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X138.494 Y141.825 E.00707
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X138.297 Y141.572 I.216 J-.372 E.01479
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X138.284 Y141.461 E.00541
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X138.262 Y141.058 I8.027 J-.635 E.02124
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X138.209 Y135.796 I457.492 J-7.25 E.30811
G1 X138.195 Y135.408 E.02276
G2 X138.119 Y134.704 I-4.298 J.108 E.04149
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X137.859 Y134.221 I-1.011 J.232 E.03288
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X136.525 Y133.673 I-1.234 J1.105 E.08242
G2 X136.083 Y133.678 I-.178 J3.395 E.0244
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X135.936 Y133.695 E.00782
G2 X135.161 Y134.094 I.251 J1.443 E.04696
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X134.929 Y134.395 I.836 J.882 E.0228
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X134.722 Y135.356 I2.018 J.937 E.06148
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X134.708 Y135.733 E.02123
G2 X134.696 Y138.044 I90.749 J1.649 E.12992
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X134.698 Y142.231 E.22298
; WIPE_START
G1 X134.697 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.773 Y133.246 Z.88 F42000
G1 X141.209 Y125.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X141.238 Y125.302 E.00638
G2 X141.287 Y122.03 I-88.736 J-2.964 E.14555
G1 X141.294 Y121.883 E.00658
G3 X142.108 Y121.871 I.621 J14.333 E.03623
G3 X142.142 Y131.069 I-343.474 J5.855 E.40917
G3 X141.295 Y131.074 I-.495 J-10.871 E.03768
G2 X141.249 Y127.851 I-465.892 J5.05 E.14339
G2 X140.969 Y127.095 I-1.105 J-.022 E.03671
G1 X140.694 Y126.977 E.01334
G2 X135.579 Y126.907 I-4.92 J172.161 E.22753
G1 X134.252 Y126.879 E.05907
G3 X134.251 Y126.026 I28.298 J-.439 E.03794
G3 X139.752 Y125.991 I5.364 J407.272 E.24468
G2 X140.639 Y125.934 I.037 J-6.321 E.03959
G2 X141.186 Y125.498 I-.124 J-.717 E.03246
M204 S10000
G1 X140.842 Y125.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.865 Y125.255 I-.324 J-.13 E.00402
G2 X140.912 Y122.019 I-91.605 J-2.951 E.13287
G3 X140.939 Y121.533 I3.734 J-.035 E.02001
G3 X142.189 Y121.497 I.931 J10.635 E.05136
G3 X142.465 Y121.513 I-.048 J3.211 E.01138
G3 X142.523 Y124.775 I-93.815 J3.301 E.13396
G3 X142.508 Y131.413 I-300.119 J2.64 E.27256
G3 X140.942 Y131.418 I-.814 J-8.909 E.06441
G3 X140.899 Y128.883 I40.436 J-1.952 E.10413
G2 X140.852 Y127.66 I-11.936 J-.159 E.05025
G2 X140.732 Y127.401 I-.451 J.052 E.01195
G2 X140.32 Y127.334 I-.314 J.628 E.0174
G2 X135.573 Y127.282 I-19.637 J1577.07 E.19492
G3 X133.899 Y127.239 I.191 J-40.475 E.06876
G3 X133.897 Y125.66 I12.6 J-.804 E.06486
G3 X139.745 Y125.616 I5.336 J318.555 E.2401
G2 X140.559 Y125.566 I.043 J-5.943 E.03352
G2 X140.815 Y125.403 I-.041 J-.347 E.01289
M204 S10000
G1 X141.692 Y125.419 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
M204 S6000
G1 X141.706 Y123.146 E.12661
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X141.702 Y122.067 I97.022 J-.897 E.0565
; WIPE_START
G1 X141.706 Y123.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.76 Y126.309 Z.88 F42000
G1 X134.445 Y126.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
M204 S6000
G2 X136.631 Y126.462 I5.395 J-984.686 E.12591
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X138.781 Y126.468 I2.352 J-433.847 E.13383
G1 X140.214 Y126.467 E.08918
M204 S10000
G1 X140.589 Y126.596 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X140.809 Y126.619 E.00907
G1 X141.236 Y126.826 E.01949
G1 X141.4 Y127.002 E.00987
G1 X141.517 Y126.931 E.00564
G3 X141.781 Y127.06 I-.023 J.382 E.01237
G1 X141.775 Y125.796 E.05189
G1 X141.457 Y125.789 E.01306
G1 X141.354 Y125.939 E.00746
G1 X140.967 Y126.225 E.01977
G1 X140.587 Y126.315 E.01603
G1 X140.589 Y126.536 E.00908
M204 S10000
G1 X141.405 Y126.381 F42000
; LINE_WIDTH: 0.502428
G1 F5813.241
M204 S6000
G2 X141.4 Y126.477 I-.028 J.047 E.01125
M204 S10000
G1 X141.42 Y127.606 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
M204 S6000
G1 X141.703 Y127.815 E.01991
G1 X141.711 Y128.148 E.01887
G3 X141.715 Y130.884 I-316.202 J1.803 E.1548
; WIPE_START
G1 X141.712 Y128.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.226 Y121.398 Z.88 F42000
G1 X138.123 Y110.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X138.116 Y110.798 E.00033
G1 X138.061 Y116.391 E.2488
G3 X137.166 Y116.37 I-.228 J-9.413 E.03985
G2 X137.182 Y112.158 I-1509.827 J-7.73 E.18735
G2 X137.157 Y111.6 I-7.11 J.043 E.02487
G1 X136.978 Y110.796 E.03664
G3 X134.258 Y110.716 I4.812 J-210.43 E.12103
G3 X134.27 Y109.911 I34.461 J.095 E.0358
G3 X139.144 Y109.893 I3.846 J363.204 E.21681
G3 X140.795 Y110.001 I.263 J8.643 E.07369
G3 X142.148 Y111.792 I-.467 J1.76 E.10763
G3 X142.143 Y117.992 I-96.42 J3.026 E.27583
G3 X141.277 Y119.472 I-1.701 J-.002 E.07993
G3 X140.546 Y119.793 I-1.399 J-2.194 E.03569
G3 X137.538 Y119.83 I-2.043 J-43.787 E.13384
G1 X134.27 Y119.811 E.14535
G1 X134.254 Y118.978 E.03704
G2 X139.878 Y118.928 I.811 J-221.986 E.25019
G2 X140.653 Y118.816 I-.013 J-2.844 E.03492
G2 X141.239 Y117.928 I-.389 J-.894 E.05007
G2 X141.275 Y115.925 I-23.875 J-1.44 E.08915
G2 X141.243 Y111.86 I-91.863 J-1.294 E.18084
G2 X141.006 Y111.135 I-1.155 J-.024 E.03456
G2 X140.037 Y110.76 I-.941 J.992 E.04742
G1 X138.183 Y110.797 E.08246
M204 S10000
G1 X138.488 Y111.163 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X138.452 Y115.777 E.18944
G3 X138.412 Y116.735 I-8.637 J.117 E.03937
G3 X136.802 Y116.7 I-.658 J-6.92 E.06624
G3 X136.812 Y113.251 I83.034 J-1.482 E.14165
G2 X136.785 Y111.654 I-31.224 J-.254 E.06559
G1 X136.675 Y111.162 E.02067
G3 X133.883 Y111.078 I4.936 J-209.701 E.11469
G3 X133.902 Y109.539 I52.505 J-.115 E.0632
G3 X139.148 Y109.518 I4.186 J387.013 E.2154
G3 X140.883 Y109.636 I.263 J8.931 E.07149
G3 X142.523 Y111.775 I-.554 J2.123 E.11917
G3 X142.517 Y118.019 I-96.591 J3.041 E.25642
G3 X141.481 Y119.787 I-2.053 J-.016 E.08809
G3 X140.578 Y120.167 I-1.397 J-2.057 E.04051
G3 X137.537 Y120.205 I-2.072 J-43.797 E.12489
G1 X133.903 Y120.183 E.14922
G1 X133.871 Y118.606 E.06479
G2 X139.861 Y118.553 I.516 J-281.176 E.24594
G2 X140.581 Y118.433 I.051 J-1.91 E.03015
G2 X140.866 Y117.886 I-.359 J-.535 E.02639
G2 X140.901 Y115.924 I-23.883 J-1.403 E.0806
G2 X140.869 Y111.889 I-92.5 J-1.292 E.1657
G2 X140.653 Y111.321 I-.719 J-.052 E.02573
G2 X140.02 Y111.135 I-.593 J.842 E.02758
M73 P71 R3
G2 X138.548 Y111.16 I-.416 J18.787 E.06048
; WIPE_START
M204 S6000
G1 X138.506 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.638 Y111.593 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
M204 S6000
G1 X137.642 Y113.257 E.0998
G2 X137.617 Y115.935 I928.907 J10.115 E.16061
G1 X137.859 Y116.196 E.02138
; WIPE_START
G1 X137.617 Y115.935 E-.13547
G1 X137.632 Y114.292 E-.62453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.54 Y119.394 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.556602
G1 F5178.971
M204 S6000
G2 X139.894 Y119.373 I.363 J-93.158 E.13334
G1 X140.031 Y119.367 E.00776
G2 X141.11 Y119.057 I.11 J-1.647 E.0649
G1 X141.268 Y118.929 E.01149
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X141.663 Y118.194 I-.763 J-.884 E.05097
G1 X141.688 Y117.986 E.01253
G2 X141.717 Y112.421 I-95.921 J-3.281 E.33242
G1 X141.695 Y111.831 E.03526
G2 X141.191 Y110.701 I-1.381 J-.061 E.07661
G1 X141.18 Y110.691 E.00091
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X141.047 Y110.598 I-1.463 J1.945 E.00879
G1 X140.809 Y110.47 E.01457
G2 X139.713 Y110.329 I-.918 J2.803 E.06016
G1 X139.139 Y110.332 E.03103
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X137.925 Y110.347 E.0695
M204 S10000
G1 X137.501 Y110.322 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
M204 S6000
G1 X137.501 Y110.829 E.02679
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X137.5 Y110.899 E.00389
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X137.499 Y110.969 E.00422
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X137.516 Y111.001 E.0024
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X137.534 Y111.034 E.00256
M204 S10000
G1 X137.077 Y110.346 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
M204 S6000
G1 X135.768 Y110.331 E.07275
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X134.458 Y110.317 E.0671
; WIPE_START
G1 X135.768 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.675 Y117.885 Z.88 F42000
G1 X134.457 Y119.394 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
M204 S6000
G1 X137.54 Y119.394 E.16363
; WIPE_START
G1 X135.54 Y119.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.957 Y112.155 Z.88 F42000
G1 X139.788 Y106.674 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X139.877 Y106.629 E.00445
G1 X140.499 Y106.188 E.03391
G2 X139.339 Y105.006 I-9.165 J7.837 E.07373
G3 X134.198 Y100.397 I403.081 J-454.653 E.30714
G3 X134.204 Y99.133 I25.323 J-.523 E.05623
G3 X140.695 Y99.094 I5.077 J307.911 E.28875
G3 X142.23 Y99.118 I-.058 J53.259 E.06828
G3 X142.25 Y100.1 I-15.714 J.809 E.0437
G2 X137.264 Y100.147 I15.25 J1865.937 E.22179
G2 X135.587 Y100.274 I.893 J22.973 E.0748
G1 X136.575 Y101.335 E.06447
G2 X139.498 Y103.993 I53.631 J-56.057 E.17577
G3 X142.188 Y106.413 I-175.542 J197.839 E.16096
G3 X142.168 Y107.734 I-104.991 J-.94 E.05875
G3 X134.2 Y107.743 I-4.782 J-654.062 E.35443
G3 X134.207 Y106.813 I16.22 J-.349 E.04141
G3 X138.98 Y106.781 I5.559 J477.802 E.21232
G2 X139.732 Y106.694 I.019 J-3.131 E.03374
M204 S10000
G1 X139.627 Y106.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.938 Y106.126 I-.499 J-1.08 E.01544
G2 X139.087 Y105.284 I-7.64 J6.87 E.04919
G3 X133.823 Y100.557 I314.742 J-355.793 E.29049
G3 X133.852 Y98.772 I17.197 J-.613 E.07336
G3 X140.696 Y98.719 I5.139 J223.205 E.28102
G3 X142.565 Y98.766 I.421 J20.579 E.07678
G3 X142.589 Y100.446 I-7.035 J.942 E.06917
G3 X141.189 Y100.491 I-1.093 J-12.365 E.05754
G2 X136.99 Y100.535 I-.581 J143.774 E.17244
G1 X136.388 Y100.584 E.02478
G2 X138.085 Y102.233 I18.228 J-17.056 E.09718
G3 X142.566 Y106.25 I-324.732 J366.721 E.24708
G3 X142.536 Y108.107 I-148.094 J-1.41 E.07623
G3 X133.84 Y108.109 I-4.452 J-501.161 E.35705
G3 X133.853 Y106.447 I21.105 J-.67 E.06825
G3 X138.968 Y106.406 I8.882 J793.218 E.21001
G2 X139.569 Y106.348 I.031 J-2.806 E.02484
M204 S10000
G1 X139.323 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
M204 S6000
G1 X138.538 Y107.27 E.05091
G2 X134.396 Y107.278 I-1.09 J538.895 E.26838
M204 S10000
G1 X139.701 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X141.799 Y107.36 E.08615
G1 X141.811 Y106.578 E.03213
G1 X141.285 Y106.106 E.02901
G1 X140.843 Y106.55 E.02572
G1 X140.702 Y106.602 E.0062
G1 X140.614 Y106.562 E.00397
G1 X139.932 Y107.019 E.0337
G1 X139.694 Y107.082 E.01014
G1 X139.7 Y107.31 E.00937
M204 S10000
G1 X140.672 Y106.983 F42000
; LINE_WIDTH: 0.468329
G1 F6298.816
M204 S6000
G1 X140.756 Y106.981 E.00393
M204 S10000
G1 X140.816 Y106.979 F42000
; LINE_WIDTH: 0.453874
G1 F6530.032
M204 S6000
G1 X141.135 Y106.996 E.01435
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X141.454 Y107.012 E.01261
G1 X141.458 Y106.732 E.01105
G1 X141.299 Y106.589 E.00847
G1 X141.093 Y106.798 E.0116
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X140.98 Y106.872 E.00558
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X140.866 Y106.946 E.0061
M204 S10000
G1 X140.929 Y105.933 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
M204 S6000
G1 X140.614 Y105.619 E.02763
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X140.155 Y105.169 E.03713
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X139.627 Y104.686 E.03883
G3 X136.249 Y101.645 I111.103 J-126.796 E.24664
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X135.864 Y101.264 E.03286
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X135.579 Y100.987 E.02539
M204 S10000
G1 X135.218 Y100.849 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
M204 S6000
G1 X135.432 Y100.628 E.01142
G1 X135.046 Y100.225 E.02076
; LINE_WIDTH: 0.409301
G1 F7363.507
G1 X135.01 Y100.167 E.00269
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X134.975 Y100.109 E.00289
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X134.993 Y100.026 E.00392
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X135.012 Y99.944 E.00419
G1 X135.154 Y99.912 E.0072
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X136.006 Y99.86 E.03753
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X137.254 Y99.787 I9.118 J144.535 E.05025
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X141.902 Y99.757 I9.596 J1132.296 E.16939
G1 X141.896 Y99.459 E.01088
G2 X136.843 Y99.464 I-1.861 J659.304 E.18415
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X135.99 Y99.489 E.03496
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X135.136 Y99.514 E.03753
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X134.881 Y99.532 E.01205
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X134.626 Y99.551 E.01252
G1 X134.588 Y100.108 E.02732
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X134.588 Y100.227 E.00527
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X134.846 Y100.485 E.01544
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X135.173 Y100.808 I3.652 J-3.379 E.01752
; WIPE_START
G1 X134.846 Y100.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.393 Y92.873 Z.88 F42000
G1 X135.656 Y89.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X135.534 Y89.277 E.00606
G2 X135.192 Y89.963 I.534 J.695 E.03528
G2 X135.238 Y94.891 I66.427 J1.84 E.2193
G2 X136.192 Y96.025 I1.138 J.011 E.07178
G2 X137.24 Y96.095 I1.068 J-8.135 E.04674
G2 X139.799 Y96.091 I1.225 J-33.233 E.11386
G2 X140.824 Y95.734 I.017 J-1.602 E.04924
G2 X141.148 Y95.035 I-.689 J-.744 E.03514
G2 X141.214 Y92.519 I-45.136 J-2.447 E.11198
G1 X141.255 Y88.162 E.1938
G1 X142.159 Y88.162 E.04024
G3 X142.137 Y95.396 I-263.533 J2.815 E.32179
G3 X140.931 Y96.851 I-2.632 J-.955 E.08576
G3 X139.738 Y97.06 I-1.136 J-2.974 E.0542
G3 X136.33 Y97.039 I-1.422 J-45.85 E.15164
G3 X134.816 Y96.293 I.016 J-1.94 E.07765
G3 X134.236 Y94.742 I1.644 J-1.5 E.07549
G3 X134.207 Y92.444 I65.458 J-1.974 E.10222
G1 X134.229 Y88.158 E.19067
G3 X138.715 Y88.144 I2.983 J235.393 E.19955
G3 X138.724 Y92.009 I-83.313 J2.128 E.17194
G3 X137.738 Y91.976 I.196 J-20.914 E.04391
G2 X137.655 Y89.732 I-26.349 J-.15 E.09992
G2 X137.458 Y89.281 I-.991 J.165 E.02211
G2 X136.443 Y89.096 I-.819 J1.616 E.04652
G2 X135.714 Y89.204 I-.087 J1.939 E.03298
M204 S10000
G1 X135.818 Y89.555 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.592 Y89.82 I.197 J.396 E.01468
G2 X135.544 Y90.724 I5.874 J.768 E.03722
G2 X135.612 Y94.857 I71.273 J.902 E.16973
G2 X136.44 Y95.682 I.802 J.023 E.05376
G2 X139.77 Y95.717 I2.145 J-45.024 E.13678
G2 X140.571 Y95.456 I.042 J-1.23 E.03533
G2 X140.775 Y94.995 I-.435 J-.467 E.02125
G2 X140.839 Y92.515 I-45.374 J-2.417 E.10187
G1 X140.883 Y87.787 E.19413
G1 X142.533 Y87.787 E.06773
G3 X142.507 Y95.468 I-230.889 J3.072 E.31536
G3 X141.089 Y97.191 I-2.956 J-.987 E.09372
G3 X139.757 Y97.435 I-1.29 J-3.292 E.05596
G3 X136.298 Y97.413 I-1.439 J-46.066 E.14207
G3 X134.537 Y96.543 I.048 J-2.315 E.08329
G3 X133.861 Y94.765 I1.869 J-1.727 E.08004
G3 X133.832 Y92.444 I65.545 J-1.996 E.09528
G1 X133.857 Y87.786 E.19128
G3 X138.617 Y87.768 I3.346 J258.086 E.19546
G3 X139.067 Y87.807 I.046 J2.084 E.01858
G3 X139.119 Y91.146 I-41.991 J2.325 E.13714
G3 X139.066 Y92.382 I-10.936 J.151 E.05083
G3 X137.368 Y92.336 I-.224 J-23.328 E.06974
G2 X137.287 Y89.806 I-30.876 J-.268 E.10398
G2 X137.192 Y89.573 I-.509 J.071 E.01043
G2 X136.671 Y89.471 I-.485 J1.092 E.02198
G2 X135.876 Y89.54 I-.147 J2.891 E.03288
; WIPE_START
M204 S6000
G1 X135.679 Y89.646 E-.08493
G1 X135.592 Y89.82 E-.07374
G1 X135.554 Y90.173 E-.13487
G1 X135.544 Y90.724 E-.2096
G1 X135.549 Y91.4 E-.25686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.703 Y89.947 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
M204 S6000
G1 X134.692 Y91.813 E.12365
G2 X134.747 Y94.945 I51.584 J.66 E.20757
G2 X135.662 Y96.374 I1.725 J-.098 E.11753
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X136.77 Y96.572 I1.005 J-2.421 E.07633
G2 X140.123 Y96.545 I1.43 J-30.545 E.22579
G1 X140.257 Y96.526 E.0091
G2 X141.128 Y96.102 I-.152 J-1.421 E.06653
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X141.159 Y96.072 E.00278
G2 X141.303 Y95.904 I-.856 J-.878 E.01409
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X141.271 Y95.798 E.00653
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X141.24 Y95.692 E.00598
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X141.209 Y95.586 E.00543
M204 S10000
G1 X141.444 Y95.185 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
M204 S6000
G3 X141.706 Y95.226 I.096 J.244 E.01095
M204 S10000
G1 X141.66 Y94.872 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
M204 S6000
G1 X141.69 Y92.79 E.13699
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X141.707 Y88.357 I-818.445 J-5.298 E.27616
; WIPE_START
G1 X141.699 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.929 Y91.707 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
M204 S6000
G2 X138.449 Y91.717 I.673 J-21.775 E.01048
G1 X138.538 Y91.808 E.00257
M204 S10000
G1 X138.382 Y91.246 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
M204 S6000
G2 X138.347 Y88.52 I-87.268 J-.238 E.10668
G1 X137.764 Y88.522 E.02281
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X137.314 Y88.548 E.01979
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X137.237 Y88.57 E.00392
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X137.16 Y88.591 E.0043
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X137.084 Y88.612 E.00468
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X137.007 Y88.634 E.00507
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X137.14 Y88.7 E.00942
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X137.272 Y88.766 E.00868
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X137.405 Y88.833 E.00794
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X137.537 Y88.899 E.0072
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X137.753 Y89.041 I-.144 J.453 E.01087
G1 X137.956 Y89.415 E.01766
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X138.021 Y89.679 E.01016
G3 X138.075 Y91.24 I-25.201 J1.644 E.05839
G1 X138.322 Y91.245 E.00924
M204 S10000
G1 X138.041 Y88.818 F42000
; LINE_WIDTH: 0.359469
G1 F8589.18
M204 S6000
G1 X137.985 Y88.851 E.00221
G1 X138.022 Y88.872 E.00144
M204 S10000
G1 X135.912 Y88.645 F42000
; LINE_WIDTH: 0.629923
G1 F4512.586
M204 S6000
G3 X136.947 Y88.631 I.648 J9.44 E.06735
M204 S10000
G1 X134.952 Y88.829 F42000
; LINE_WIDTH: 0.362209
G1 F8511.282
M204 S6000
G1 X134.896 Y88.862 E.00225
G1 X134.933 Y88.883 E.00149
M204 S10000
G1 X134.897 Y89.575 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X135.346 Y88.952 I1.083 J.306 E.03219
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X135.456 Y88.892 E.00548
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X135.566 Y88.832 E.00612
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X135.677 Y88.772 E.00677
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X135.787 Y88.713 E.00742
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X135.897 Y88.653 E.00807
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X135.912 Y88.645 E.00108
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X135.82 Y88.622 E.00613
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X135.729 Y88.599 E.00563
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X135.638 Y88.576 E.00512
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X135.547 Y88.552 E.00462
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X135.456 Y88.529 E.00387
G1 X134.603 Y88.532 E.0351
G1 X134.6 Y89.57 E.04274
G1 X134.837 Y89.574 E.00974
; OBJECT_ID: 169
; WIPE_START
G1 X134.6 Y89.57 E-.08991
G1 X134.603 Y88.532 E-.39444
G1 X135.329 Y88.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.689 Y96.135 Z.88 F42000
G1 X129.425 Y158.678 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X129.354 Y158.47 E.00975
G2 X129.189 Y158.261 I-.682 J.368 E.01192
G2 X128.572 Y158.112 I-.571 J1.01 E.02862
G2 X124.023 Y158.06 I-6.536 J375.104 E.20236
G3 X124.027 Y157.214 I17.494 J-.334 E.03763
G3 X131.966 Y157.219 I3.721 J426.531 E.35316
G3 X131.918 Y158.513 I-22.684 J-.209 E.05762
G2 X127.024 Y161.975 I86.806 J127.905 E.26665
G2 X126.993 Y163.002 I.492 J.529 E.05086
G2 X127.574 Y163.496 I2.959 J-2.892 E.03398
G2 X131.939 Y166.543 I807.609 J-1152.394 E.2368
G3 X131.962 Y167.864 I-18.182 J.973 E.05877
G3 X124.025 Y167.839 I-2.114 J-587.958 E.35306
G3 X124.024 Y166.996 I33.794 J-.441 E.03748
G2 X128.65 Y166.949 I1.184 J-111.6 E.20578
G2 X129.115 Y166.796 I-.091 J-1.062 E.02201
G2 X129.062 Y165.652 I-.449 J-.552 E.05921
G2 X124.647 Y162.518 I-235.825 J327.478 E.24081
G2 X129.021 Y159.419 I-190.181 J-273.047 E.23843
G2 X129.41 Y159.033 I-.658 J-1.051 E.02457
G1 X129.434 Y158.736 E.01329
M204 S10000
G1 X129.052 Y158.757 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.02 Y158.652 I-.275 J.027 E.00453
G2 X128.793 Y158.504 I-.274 J.173 E.01148
G2 X125.687 Y158.454 I-2.506 J58.481 E.12754
G3 X123.665 Y158.425 I.048 J-74.485 E.08306
G3 X123.67 Y156.849 I19.632 J-.729 E.06471
G3 X132.32 Y156.845 I4.488 J332.294 E.3552
G3 X132.283 Y158.718 I-15.279 J.634 E.07694
G2 X127.279 Y162.251 I87.947 J129.844 E.25155
G2 X127.334 Y162.819 I.27 J.26 E.02659
G2 X128.356 Y163.591 I7.227 J-8.504 E.05263
G3 X130.698 Y165.229 I-56.115 J82.729 E.11736
G3 X132.289 Y166.336 I-19.43 J29.634 E.07958
G3 X132.306 Y168.238 I-11.086 J1.052 E.07822
G3 X123.665 Y168.206 I-2.329 J-523.15 E.35481
G3 X123.664 Y166.622 I20.528 J-.8 E.06503
G2 X128.616 Y166.575 I1.22 J-133.023 E.20333
G2 X128.993 Y166.34 I.011 J-.402 E.01934
G2 X128.819 Y165.939 I-.357 J-.084 E.01926
G3 X124.086 Y162.566 I453.819 J-641.818 E.23865
G1 X124.02 Y162.513 E.00343
G3 X128.42 Y159.399 I1147.337 J1616.221 E.22132
G2 X128.967 Y158.984 I-7.158 J-10.003 E.02821
G2 X129.051 Y158.817 I-.191 J-.2 E.00782
M204 S10000
G1 X129.546 Y159.598 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
M204 S6000
G1 X126.697 Y161.642 E.20204
M204 S10000
G1 X126.34 Y161.788 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X125.297 Y162.52 E.05231
G1 X126.396 Y163.3 E.05533
G1 X126.587 Y163.052 E.01285
G3 X126.408 Y162.473 I.898 J-.595 E.02525
G1 X126.474 Y162.131 E.01429
M73 P72 R3
G1 X126.522 Y162.038 E.0043
G1 X126.375 Y161.836 E.01022
M204 S10000
G1 X126.029 Y162.473 F42000
; LINE_WIDTH: 0.511568
G1 F5695.554
M204 S6000
G2 X126.025 Y162.571 I-.028 J.048 E.01184
M204 S10000
G1 X126.761 Y163.441 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
M204 S6000
G2 X129.462 Y165.377 I58.661 J-79.002 E.19302
M204 S10000
G1 X129.819 Y165.524 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X129.632 Y165.778 E.01294
G1 X129.73 Y166.001 E.01001
G3 X129.571 Y166.857 I-1.156 J.228 E.03663
G1 X129.297 Y167.125 E.0157
G1 X129.188 Y167.179 E.005
G1 X129.195 Y167.488 E.01271
G1 X131.592 Y167.489 E.09844
G1 X131.57 Y166.743 E.03064
G1 X129.868 Y165.558 E.08513
M204 S10000
G1 X130.116 Y166.169 F42000
G1 F7144.644
M204 S6000
G1 X130.076 Y166.594 E.01756
G1 X129.929 Y166.961 E.01621
G1 X129.81 Y167.129 E.00845
G1 X131.221 Y167.129 E.05797
G1 X131.216 Y166.935 E.00797
G1 X130.165 Y166.203 E.05257
M204 S10000
G1 X130.408 Y166.745 F42000
; LINE_WIDTH: 0.394909
G1 F7680.033
M204 S6000
G1 X130.346 Y166.781 E.00277
G1 X130.393 Y166.808 E.00208
M204 S10000
G1 X128.818 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
M204 S6000
G1 X125.607 Y167.424 E.18001
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X124.218 Y167.419 E.07403
; WIPE_START
G1 X125.607 Y167.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.534 Y159.867 Z.88 F42000
G1 X124.218 Y157.637 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.532414
G1 F5444.184
M204 S6000
G1 X124.618 Y157.639 E.02155
; LINE_WIDTH: 0.556294
G1 F5182.184
G3 X127.196 Y157.64 I.796 J804.611 E.14596
G1 X128.902 Y157.67 E.09657
M204 S10000
G1 X129.281 Y157.581 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X129.268 Y157.885 E.01246
G1 X129.454 Y157.992 E.00882
G1 X129.698 Y158.317 E.01668
G1 X129.813 Y158.699 E.01636
G1 X129.742 Y159.225 E.02181
G1 X129.907 Y159.455 E.01159
G1 X131.55 Y158.312 E.08219
G1 X131.577 Y157.592 E.02959
G1 X129.341 Y157.582 E.09184
M204 S10000
G1 X130.02 Y158.017 F42000
; LINE_WIDTH: 0.565569
G1 F5087.102
M204 S6000
G1 X130.213 Y158.485 E.02917
G1 X130.24 Y158.696 E.01227
G1 X131.126 Y158.08 E.06226
G1 X131.128 Y158.022 E.00331
G1 X130.08 Y158.018 E.06041
; WIPE_START
G1 X131.128 Y158.022 E-.3981
G1 X131.126 Y158.08 E-.02184
G1 X130.391 Y158.591 E-.34007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.626 Y151.477 Z.88 F42000
G1 X125.497 Y146.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X124.879 Y146.712 E.04191
G1 X124.924 Y153.461 E.30021
G1 X125.608 Y154.145 E.04305
G1 X131.96 Y154.211 E.28254
G3 X131.958 Y155.017 I-15.639 J.362 E.03589
G3 X125.887 Y155.011 I-2.858 J-184.576 E.27004
G3 X125.285 Y154.849 I.021 J-1.275 E.02801
G3 X124.249 Y153.984 I.751 J-1.952 E.06113
G3 X124.06 Y153.223 I1.386 J-.75 E.03527
G3 X124.027 Y148.5 I104.203 J-3.088 E.21011
G3 X124.08 Y146.546 I30.526 J-.146 E.08692
G3 X125.664 Y145.11 I1.957 J.566 E.10014
G3 X127.395 Y145.024 I1.375 J10.16 E.07718
G3 X130.616 Y145.025 I1.512 J225.279 E.14328
G3 X131.913 Y145.047 I-.245 J52.583 E.05767
G3 X131.919 Y145.923 I-21.432 J.606 E.03897
G3 X125.543 Y145.947 I-4.211 J-273.027 E.28363
G1 X125.536 Y145.955 E.00048
M204 S10000
G1 X125.714 Y146.322 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.255 Y146.851 E.02877
G1 X125.298 Y153.305 E.26499
G1 X125.765 Y153.772 E.02714
G1 X132.329 Y153.839 E.26951
G3 X132.309 Y155.39 I-12.499 J.612 E.06372
G3 X125.861 Y155.385 I-3.083 J-193.366 E.26473
G3 X125.131 Y155.191 I.052 J-1.664 E.03132
G3 X123.921 Y154.164 I.912 J-2.301 E.06632
G3 X123.686 Y153.249 I1.739 J-.934 E.03917
G3 X123.652 Y148.497 I103.801 J-3.114 E.19515
G3 X123.715 Y146.454 I26.721 J-.195 E.08394
G3 X125.573 Y144.746 I2.327 J.667 E.10897
G3 X127.393 Y144.649 I1.459 J10.173 E.07496
G3 X130.62 Y144.65 I1.513 J225.615 E.13248
G3 X132.274 Y144.69 I.118 J29.411 E.06794
G3 X132.278 Y146.283 I-18.899 J.844 E.06544
G3 X125.774 Y146.323 I-4.493 J-206.388 E.26704
M204 S10000
G1 X125.622 Y145.542 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
M204 S6000
G1 X125.494 Y145.563 E.00589
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X125.316 Y145.631 I.076 J.465 E.00795
M204 S10000
G1 X131.725 Y145.486 F42000
; LINE_WIDTH: 0.588624
G1 F4865.193
M204 S6000
G2 X126.049 Y145.503 I-1.688 J381.573 E.34228
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X125.765 Y145.523 I.084 J3.261 E.01565
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X125.622 Y145.542 E.00721
M204 S10000
G1 X125.704 Y145.301 F42000
; LINE_WIDTH: 0.489929
G1 F5982.279
M204 S6000
G1 X125.4 Y145.555 E.01941
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X125.027 Y145.869 I3.535 J4.562 E.02564
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X124.668 Y146.284 I2.048 J2.135 E.03194
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X124.608 Y146.373 E.00585
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X124.526 Y146.503 E.00774
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X124.473 Y146.732 I.484 J.232 E.01173
G2 X124.463 Y147.384 I33.324 J.83 E.0322
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X124.501 Y153.395 I173.802 J1.921 E.33164
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X124.513 Y153.544 E.00754
G2 X124.628 Y153.776 I.425 J-.066 E.01332
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X125.047 Y154.209 I1.874 J-1.392 E.03512
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X125.148 Y154.291 E.00714
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X125.228 Y154.353 E.00524
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X125.309 Y154.414 E.00493
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X125.586 Y154.543 I.431 J-.561 E.01359
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X125.728 Y154.569 E.00709
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X128.341 Y154.606 I1.938 J-45.472 E.14357
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X130.054 Y154.609 E.09023
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X131.768 Y154.613 E.08521
; WIPE_START
G1 X130.054 Y154.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.392 Y147.006 Z.88 F42000
G1 X128.938 Y141.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X129.122 Y141.886 E.00925
G2 X130.793 Y141.592 I.592 J-1.531 E.07932
G2 X130.99 Y141.295 I-.907 J-.814 E.01593
G2 X131.047 Y138.139 I-91.854 J-3.227 E.14039
G3 X131.078 Y133.589 I190.503 J-.97 E.20243
G3 X131.92 Y133.583 I.51 J12.053 E.03747
G3 X131.883 Y141.346 I-164.906 J3.091 E.34536
G3 X131.167 Y142.42 I-1.745 J-.388 E.05876
G3 X129.719 Y142.853 I-1.323 J-1.782 E.06859
G3 X127.709 Y141.754 I-.081 J-2.24 E.10699
G3 X127.59 Y140.871 I3.141 J-.871 E.03973
G3 X127.522 Y135.433 I938.133 J-14.477 E.24194
G2 X127.379 Y134.632 I-2.427 J.02 E.03637
G2 X126.409 Y134.109 I-.941 J.583 E.05133
G2 X125.65 Y134.144 I-.274 J2.308 E.03393
G2 X125.011 Y134.925 I.314 J.908 E.04725
G2 X124.911 Y136.544 I9.636 J1.409 E.07225
G1 X124.89 Y142.434 E.26202
G1 X124.053 Y142.418 E.03723
G3 X124.043 Y135.277 I367.728 J-4.084 E.31767
G3 X124.406 Y133.998 I2.012 J-.12 E.06024
G3 X126.31 Y133.24 I1.685 J1.46 E.09471
G3 X127.183 Y133.361 I.084 J2.601 E.03943
G3 X128.279 Y134.371 I-1.099 J2.291 E.06725
G3 X128.433 Y135.78 I-5.61 J1.326 E.06322
G3 X128.459 Y137.215 I-55.594 J1.737 E.06386
G1 X128.471 Y141.475 E.18949
G2 X128.886 Y141.76 I2.137 J-2.662 E.0224
M204 S10000
G1 X129.115 Y141.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.706 Y141.617 I.644 J-1.234 E.02535
G2 X130.521 Y141.333 I.042 J-1.19 E.03622
G2 X130.621 Y141.185 I-.45 J-.413 E.00737
G2 X130.688 Y134.216 I-272.184 J-6.106 E.28616
G3 X130.723 Y133.24 I15.683 J.07 E.04011
G3 X132.283 Y133.235 I.812 J9.744 E.06413
G3 X132.255 Y141.403 I-149.209 J3.571 E.33543
G3 X131.399 Y142.714 I-2.118 J-.448 E.06577
G3 X129.719 Y143.228 I-1.553 J-2.073 E.07361
G3 X127.361 Y141.894 I-.084 J-2.603 E.117
G3 X127.216 Y140.887 I3.413 J-1.005 E.04192
G3 X127.148 Y135.45 I906.214 J-14.078 E.22327
G2 X127.047 Y134.81 I-2.101 J.001 E.0267
G2 X126.524 Y134.497 I-.586 J.386 E.02591
G2 X125.758 Y134.503 I-.359 J2.881 E.03154
G2 X125.377 Y135.008 I.208 J.553 E.02739
G2 X125.286 Y136.547 I9.415 J1.33 E.06337
G1 X125.264 Y142.817 E.25744
G1 X123.68 Y142.786 E.06503
G3 X123.668 Y135.265 I383.096 J-4.349 E.3088
G3 X124.284 Y133.577 I2.273 J-.128 E.07583
G3 X126.32 Y132.865 I1.805 J1.895 E.0913
G3 X127.33 Y133.016 I.076 J2.948 E.04216
G3 X128.628 Y134.234 I-1.232 J2.613 E.07429
G3 X128.781 Y135.215 I-3.755 J1.089 E.04086
G3 X128.834 Y137.213 I-43.917 J2.155 E.08208
G1 X128.846 Y141.277 E.16686
G2 X129.062 Y141.431 I.913 J-1.05 E.01093
M204 S10000
G1 X128.474 Y141.995 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556328
G1 F5181.833
M204 S6000
G2 X129.904 Y142.416 I1.204 J-1.454 E.08674
G2 X131.427 Y141.365 I-.004 J-1.635 E.11135
G1 X131.44 Y141.277 E.00502
G2 X131.498 Y133.775 I-217.653 J-5.446 E.42474
; WIPE_START
G1 X131.496 Y135.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.474 Y141.995 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.517434
G1 F5622.502
M204 S6000
G1 X128.377 Y141.918 E.00647
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X128.268 Y141.825 E.00707
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X128.07 Y141.572 I.216 J-.372 E.01479
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X128.057 Y141.461 E.00541
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X128.036 Y141.058 I8.027 J-.635 E.02124
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X127.982 Y135.796 I457.492 J-7.25 E.30811
G1 X127.968 Y135.408 E.02276
G2 X127.892 Y134.704 I-4.298 J.108 E.04149
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X127.632 Y134.221 I-1.011 J.232 E.03288
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X126.298 Y133.673 I-1.234 J1.105 E.08242
G2 X125.857 Y133.678 I-.178 J3.395 E.0244
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X125.71 Y133.695 E.00782
G2 X124.934 Y134.094 I.251 J1.443 E.04696
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X124.702 Y134.395 I.836 J.882 E.0228
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X124.496 Y135.356 I2.018 J.937 E.06148
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X124.482 Y135.733 E.02123
G2 X124.469 Y138.044 I90.749 J1.649 E.12992
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X124.472 Y142.231 E.22298
; WIPE_START
G1 X124.47 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.546 Y133.246 Z.88 F42000
G1 X130.983 Y125.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X131.011 Y125.302 E.00638
G2 X131.06 Y122.03 I-88.736 J-2.964 E.14555
G1 X131.067 Y121.883 E.00658
G3 X131.882 Y121.871 I.621 J14.333 E.03623
G3 X131.915 Y131.069 I-343.474 J5.855 E.40917
G3 X131.068 Y131.074 I-.495 J-10.871 E.03768
G2 X131.022 Y127.851 I-465.892 J5.05 E.14339
G2 X130.743 Y127.095 I-1.105 J-.022 E.03671
G1 X130.467 Y126.977 E.01334
G2 X125.353 Y126.907 I-4.92 J172.161 E.22753
G1 X124.025 Y126.879 E.05907
G3 X124.025 Y126.026 I28.298 J-.439 E.03794
G3 X129.525 Y125.991 I5.364 J407.272 E.24468
G2 X130.413 Y125.934 I.037 J-6.321 E.03959
G2 X130.96 Y125.498 I-.124 J-.717 E.03246
M204 S10000
G1 X130.615 Y125.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.639 Y125.255 I-.324 J-.13 E.00402
G2 X130.686 Y122.019 I-91.605 J-2.951 E.13287
G3 X130.713 Y121.533 I3.734 J-.035 E.02001
G3 X131.962 Y121.497 I.931 J10.635 E.05136
G3 X132.239 Y121.513 I-.048 J3.211 E.01138
G3 X132.297 Y124.775 I-93.815 J3.301 E.13396
G3 X132.282 Y131.413 I-300.119 J2.64 E.27256
G3 X130.715 Y131.418 I-.814 J-8.909 E.06441
G3 X130.672 Y128.883 I40.436 J-1.952 E.10413
G2 X130.626 Y127.66 I-11.936 J-.159 E.05025
G2 X130.505 Y127.401 I-.451 J.052 E.01195
G2 X130.093 Y127.334 I-.314 J.628 E.0174
G2 X125.347 Y127.282 I-19.637 J1577.07 E.19492
G3 X123.673 Y127.239 I.191 J-40.475 E.06876
G3 X123.671 Y125.66 I12.6 J-.804 E.06486
G3 X129.518 Y125.616 I5.336 J318.555 E.2401
G2 X130.332 Y125.566 I.043 J-5.943 E.03352
G2 X130.588 Y125.403 I-.041 J-.347 E.01289
M204 S10000
G1 X131.465 Y125.419 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
M204 S6000
G1 X131.479 Y123.146 E.12661
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X131.475 Y122.067 I97.022 J-.897 E.0565
; WIPE_START
G1 X131.479 Y123.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.533 Y126.309 Z.88 F42000
G1 X124.218 Y126.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
M204 S6000
G2 X126.404 Y126.462 I5.395 J-984.686 E.12591
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X128.554 Y126.468 I2.352 J-433.847 E.13383
G1 X129.987 Y126.467 E.08918
M204 S10000
G1 X130.363 Y126.596 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X130.583 Y126.619 E.00907
G1 X131.009 Y126.826 E.01949
G1 X131.173 Y127.002 E.00987
G1 X131.291 Y126.931 E.00564
G3 X131.554 Y127.06 I-.023 J.382 E.01237
G1 X131.549 Y125.796 E.05189
G1 X131.231 Y125.789 E.01306
G1 X131.128 Y125.939 E.00746
G1 X130.741 Y126.225 E.01977
G1 X130.361 Y126.315 E.01603
G1 X130.362 Y126.536 E.00908
M204 S10000
G1 X131.178 Y126.381 F42000
; LINE_WIDTH: 0.502428
G1 F5813.241
M204 S6000
G2 X131.174 Y126.477 I-.028 J.047 E.01125
M204 S10000
G1 X131.194 Y127.606 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
M204 S6000
G1 X131.477 Y127.815 E.01991
G1 X131.484 Y128.148 E.01887
G3 X131.488 Y130.884 I-316.202 J1.803 E.1548
; WIPE_START
G1 X131.485 Y128.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130 Y121.398 Z.88 F42000
G1 X127.897 Y110.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X127.89 Y110.798 E.00033
G1 X127.835 Y116.391 E.2488
G3 X126.94 Y116.37 I-.228 J-9.413 E.03985
G2 X126.956 Y112.158 I-1509.827 J-7.73 E.18735
G2 X126.93 Y111.6 I-7.11 J.043 E.02487
G1 X126.751 Y110.796 E.03664
G3 X124.032 Y110.716 I4.812 J-210.43 E.12103
G3 X124.043 Y109.911 I34.461 J.095 E.0358
G3 X128.918 Y109.893 I3.846 J363.204 E.21681
G3 X130.568 Y110.001 I.263 J8.643 E.07369
G3 X131.922 Y111.792 I-.467 J1.76 E.10763
G3 X131.917 Y117.992 I-96.42 J3.026 E.27583
G3 X131.051 Y119.472 I-1.701 J-.002 E.07993
G3 X130.319 Y119.793 I-1.399 J-2.194 E.03569
G3 X127.311 Y119.83 I-2.043 J-43.787 E.13384
G1 X124.044 Y119.811 E.14535
G1 X124.027 Y118.978 E.03704
G2 X129.652 Y118.928 I.811 J-221.986 E.25019
G2 X130.426 Y118.816 I-.013 J-2.844 E.03492
G2 X131.012 Y117.928 I-.389 J-.894 E.05007
G2 X131.049 Y115.925 I-23.875 J-1.44 E.08915
G2 X131.016 Y111.86 I-91.863 J-1.294 E.18084
G2 X130.78 Y111.135 I-1.155 J-.024 E.03456
G2 X129.81 Y110.76 I-.941 J.992 E.04742
G1 X127.957 Y110.797 E.08246
M204 S10000
G1 X128.262 Y111.163 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X128.225 Y115.777 E.18944
G3 X128.185 Y116.735 I-8.637 J.117 E.03937
G3 X126.576 Y116.7 I-.658 J-6.92 E.06624
G3 X126.586 Y113.251 I83.034 J-1.482 E.14165
G2 X126.558 Y111.654 I-31.224 J-.254 E.06559
G1 X126.449 Y111.162 E.02067
G3 X123.657 Y111.078 I4.936 J-209.701 E.11469
G3 X123.676 Y109.539 I52.505 J-.115 E.0632
M73 P73 R3
G3 X128.922 Y109.518 I4.186 J387.013 E.2154
G3 X130.656 Y109.636 I.263 J8.931 E.07149
G3 X132.296 Y111.775 I-.554 J2.123 E.11917
G3 X132.291 Y118.019 I-96.591 J3.041 E.25642
G3 X131.255 Y119.787 I-2.053 J-.016 E.08809
G3 X130.351 Y120.167 I-1.397 J-2.057 E.04051
G3 X127.31 Y120.205 I-2.072 J-43.797 E.12489
G1 X123.676 Y120.183 E.14922
G1 X123.645 Y118.606 E.06479
G2 X129.634 Y118.553 I.516 J-281.176 E.24594
G2 X130.354 Y118.433 I.051 J-1.91 E.03015
G2 X130.639 Y117.886 I-.359 J-.535 E.02639
G2 X130.674 Y115.924 I-23.883 J-1.403 E.0806
G2 X130.642 Y111.889 I-92.5 J-1.292 E.1657
G2 X130.427 Y111.321 I-.719 J-.052 E.02573
G2 X129.794 Y111.135 I-.593 J.842 E.02758
G2 X128.322 Y111.16 I-.416 J18.787 E.06048
; WIPE_START
M204 S6000
G1 X128.28 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.412 Y111.593 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
M204 S6000
G1 X127.416 Y113.257 E.0998
G2 X127.39 Y115.935 I928.907 J10.115 E.16061
G1 X127.633 Y116.196 E.02138
; WIPE_START
G1 X127.39 Y115.935 E-.13547
G1 X127.406 Y114.292 E-.62453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.313 Y119.394 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
M204 S6000
G1 X124.231 Y119.394 E.16363
M204 S10000
G1 X127.313 Y119.394 F42000
; LINE_WIDTH: 0.556602
G1 F5178.971
M204 S6000
G2 X129.667 Y119.373 I.363 J-93.158 E.13334
G1 X129.804 Y119.367 E.00776
G2 X130.883 Y119.057 I.11 J-1.647 E.0649
G1 X131.041 Y118.929 E.01149
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X131.436 Y118.194 I-.763 J-.884 E.05097
G1 X131.462 Y117.986 E.01253
G2 X131.491 Y112.421 I-95.921 J-3.281 E.33242
G1 X131.469 Y111.831 E.03526
G2 X130.965 Y110.701 I-1.381 J-.061 E.07661
G1 X130.953 Y110.691 E.00091
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X130.82 Y110.598 I-1.463 J1.945 E.00879
G1 X130.583 Y110.47 E.01457
G2 X129.486 Y110.329 I-.918 J2.803 E.06016
G1 X128.913 Y110.332 E.03103
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X127.698 Y110.347 E.0695
M204 S10000
G1 X127.275 Y110.322 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
M204 S6000
G1 X127.275 Y110.829 E.02679
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X127.274 Y110.899 E.00389
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X127.273 Y110.969 E.00422
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X127.29 Y111.001 E.0024
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X127.308 Y111.034 E.00256
M204 S10000
G1 X126.851 Y110.346 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
M204 S6000
G1 X125.541 Y110.331 E.07275
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X124.231 Y110.317 E.0671
; WIPE_START
G1 X125.541 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.561 Y106.674 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X129.651 Y106.629 E.00445
G1 X130.273 Y106.188 E.03391
G2 X129.112 Y105.006 I-9.165 J7.837 E.07373
G3 X123.972 Y100.397 I403.081 J-454.653 E.30714
G3 X123.977 Y99.133 I25.323 J-.523 E.05623
G3 X130.469 Y99.094 I5.077 J307.911 E.28875
G3 X132.003 Y99.118 I-.058 J53.259 E.06828
G3 X132.023 Y100.1 I-15.714 J.809 E.0437
G2 X127.037 Y100.147 I15.25 J1865.937 E.22179
G2 X125.361 Y100.274 I.893 J22.973 E.0748
G1 X126.348 Y101.335 E.06447
G2 X129.272 Y103.993 I53.631 J-56.057 E.17577
G3 X131.962 Y106.413 I-175.542 J197.839 E.16096
G3 X131.942 Y107.734 I-104.991 J-.94 E.05875
G3 X123.974 Y107.743 I-4.782 J-654.062 E.35443
G3 X123.981 Y106.813 I16.22 J-.349 E.04141
G3 X128.754 Y106.781 I5.559 J477.802 E.21232
G2 X129.505 Y106.694 I.019 J-3.131 E.03374
M204 S10000
G1 X129.401 Y106.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.712 Y106.126 I-.499 J-1.08 E.01544
G2 X128.861 Y105.284 I-7.64 J6.87 E.04919
G3 X123.597 Y100.557 I314.742 J-355.793 E.29049
G3 X123.626 Y98.772 I17.197 J-.613 E.07336
G3 X130.47 Y98.719 I5.139 J223.205 E.28102
G3 X132.338 Y98.766 I.421 J20.579 E.07678
G3 X132.363 Y100.446 I-7.035 J.942 E.06917
G3 X130.963 Y100.491 I-1.093 J-12.365 E.05754
G2 X126.763 Y100.535 I-.581 J143.774 E.17244
G1 X126.162 Y100.584 E.02478
G2 X127.858 Y102.233 I18.228 J-17.056 E.09718
G3 X132.339 Y106.25 I-324.732 J366.721 E.24708
G3 X132.31 Y108.107 I-148.094 J-1.41 E.07623
G3 X123.614 Y108.109 I-4.452 J-501.161 E.35705
G3 X123.627 Y106.447 I21.105 J-.67 E.06825
G3 X128.741 Y106.406 I8.882 J793.218 E.21001
G2 X129.342 Y106.348 I.031 J-2.806 E.02484
M204 S10000
G1 X129.097 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
M204 S6000
G1 X128.311 Y107.27 E.05091
G2 X124.169 Y107.278 I-1.09 J538.895 E.26838
M204 S10000
G1 X129.475 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X131.573 Y107.36 E.08615
G1 X131.585 Y106.578 E.03213
G1 X131.059 Y106.106 E.02901
G1 X130.617 Y106.55 E.02572
G1 X130.475 Y106.602 E.0062
G1 X130.388 Y106.562 E.00397
G1 X129.706 Y107.019 E.0337
G1 X129.467 Y107.082 E.01014
G1 X129.473 Y107.31 E.00937
M204 S10000
G1 X130.445 Y106.983 F42000
; LINE_WIDTH: 0.468329
G1 F6298.816
M204 S6000
G1 X130.53 Y106.981 E.00393
M204 S10000
G1 X130.59 Y106.979 F42000
; LINE_WIDTH: 0.453874
G1 F6530.032
M204 S6000
G1 X130.909 Y106.996 E.01435
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X131.228 Y107.012 E.01261
G1 X131.232 Y106.732 E.01105
G1 X131.072 Y106.589 E.00847
G1 X130.866 Y106.798 E.0116
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X130.753 Y106.872 E.00558
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X130.64 Y106.946 E.0061
M204 S10000
G1 X130.703 Y105.933 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
M204 S6000
G1 X130.388 Y105.619 E.02763
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X129.928 Y105.169 E.03713
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X129.4 Y104.686 E.03883
G3 X126.022 Y101.645 I111.103 J-126.796 E.24664
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X125.637 Y101.264 E.03286
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X125.353 Y100.987 E.02539
M204 S10000
G1 X124.991 Y100.849 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
M204 S6000
G1 X125.206 Y100.628 E.01142
G1 X124.819 Y100.225 E.02076
; LINE_WIDTH: 0.409301
G1 F7363.507
G1 X124.784 Y100.167 E.00269
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X124.749 Y100.109 E.00289
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X124.767 Y100.026 E.00392
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X124.785 Y99.944 E.00419
G1 X124.927 Y99.912 E.0072
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X125.78 Y99.86 E.03753
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X127.027 Y99.787 I9.118 J144.535 E.05025
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X131.675 Y99.757 I9.596 J1132.296 E.16939
G1 X131.669 Y99.459 E.01088
G2 X126.617 Y99.464 I-1.861 J659.304 E.18415
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X125.763 Y99.489 E.03496
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X124.91 Y99.514 E.03753
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X124.655 Y99.532 E.01205
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X124.4 Y99.551 E.01252
G1 X124.362 Y100.108 E.02732
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X124.361 Y100.227 E.00527
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X124.619 Y100.485 E.01544
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X124.947 Y100.808 I3.652 J-3.379 E.01752
; WIPE_START
G1 X124.619 Y100.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.167 Y92.873 Z.88 F42000
G1 X125.43 Y89.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X125.308 Y89.277 E.00606
G2 X124.965 Y89.963 I.534 J.695 E.03528
G2 X125.012 Y94.891 I66.427 J1.84 E.2193
G2 X125.966 Y96.025 I1.138 J.011 E.07178
G2 X127.014 Y96.095 I1.068 J-8.135 E.04674
G2 X129.573 Y96.091 I1.225 J-33.233 E.11386
G2 X130.597 Y95.734 I.017 J-1.602 E.04924
G2 X130.921 Y95.035 I-.689 J-.744 E.03514
G2 X130.988 Y92.519 I-45.136 J-2.447 E.11198
G1 X131.028 Y88.162 E.1938
G1 X131.933 Y88.162 E.04024
G3 X131.911 Y95.396 I-263.533 J2.815 E.32179
G3 X130.704 Y96.851 I-2.632 J-.955 E.08576
G3 X129.512 Y97.06 I-1.136 J-2.974 E.0542
G3 X126.103 Y97.039 I-1.422 J-45.85 E.15164
G3 X124.59 Y96.293 I.016 J-1.94 E.07765
G3 X124.009 Y94.742 I1.644 J-1.5 E.07549
G3 X123.98 Y92.444 I65.458 J-1.974 E.10222
G1 X124.003 Y88.158 E.19067
G3 X128.489 Y88.144 I2.983 J235.393 E.19955
G3 X128.498 Y92.009 I-83.313 J2.128 E.17194
G3 X127.512 Y91.976 I.196 J-20.914 E.04391
G2 X127.429 Y89.732 I-26.349 J-.15 E.09992
G2 X127.232 Y89.281 I-.991 J.165 E.02211
G2 X126.217 Y89.096 I-.819 J1.616 E.04652
G2 X125.488 Y89.204 I-.087 J1.939 E.03298
M204 S10000
G1 X125.591 Y89.555 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.366 Y89.82 I.197 J.396 E.01468
G2 X125.318 Y90.724 I5.874 J.768 E.03722
G2 X125.385 Y94.857 I71.274 J.902 E.16973
G2 X126.213 Y95.682 I.802 J.023 E.05376
G2 X129.543 Y95.717 I2.145 J-45.024 E.13678
G2 X130.345 Y95.456 I.042 J-1.23 E.03533
G2 X130.548 Y94.995 I-.435 J-.467 E.02125
G2 X130.613 Y92.515 I-45.374 J-2.417 E.10187
G1 X130.657 Y87.787 E.19413
G1 X132.307 Y87.787 E.06773
G3 X132.281 Y95.468 I-230.889 J3.072 E.31536
G3 X130.863 Y97.191 I-2.956 J-.987 E.09372
G3 X129.531 Y97.435 I-1.29 J-3.292 E.05596
G3 X126.071 Y97.413 I-1.439 J-46.066 E.14207
G3 X124.31 Y96.543 I.048 J-2.315 E.08329
G3 X123.635 Y94.765 I1.869 J-1.727 E.08004
G3 X123.605 Y92.444 I65.545 J-1.996 E.09528
G1 X123.63 Y87.786 E.19128
G3 X128.39 Y87.768 I3.346 J258.086 E.19546
G3 X128.84 Y87.807 I.046 J2.084 E.01858
G3 X128.893 Y91.146 I-41.991 J2.325 E.13714
G3 X128.84 Y92.382 I-10.936 J.151 E.05083
G3 X127.142 Y92.336 I-.224 J-23.328 E.06974
G2 X127.06 Y89.806 I-30.876 J-.268 E.10398
G2 X126.966 Y89.573 I-.509 J.071 E.01043
G2 X126.445 Y89.471 I-.485 J1.092 E.02198
G2 X125.65 Y89.54 I-.147 J2.891 E.03288
; WIPE_START
M204 S6000
G1 X125.453 Y89.646 E-.08493
G1 X125.366 Y89.82 E-.07374
G1 X125.328 Y90.173 E-.13487
G1 X125.318 Y90.724 E-.2096
G1 X125.323 Y91.4 E-.25686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.477 Y89.947 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
M204 S6000
G1 X124.465 Y91.813 E.12365
G2 X124.52 Y94.945 I51.584 J.66 E.20757
G2 X125.436 Y96.374 I1.725 J-.098 E.11753
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X126.544 Y96.572 I1.005 J-2.421 E.07633
G2 X129.896 Y96.545 I1.43 J-30.545 E.22579
G1 X130.03 Y96.526 E.0091
G2 X130.902 Y96.102 I-.152 J-1.421 E.06653
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X130.933 Y96.072 E.00278
G2 X131.076 Y95.904 I-.856 J-.878 E.01409
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X131.045 Y95.798 E.00653
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X131.014 Y95.692 E.00598
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X130.982 Y95.586 E.00543
M204 S10000
G1 X131.217 Y95.185 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
M204 S6000
G3 X131.479 Y95.226 I.096 J.244 E.01095
M204 S10000
G1 X131.434 Y94.872 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
M204 S6000
G1 X131.463 Y92.79 E.13699
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X131.48 Y88.357 I-818.445 J-5.298 E.27616
; WIPE_START
G1 X131.473 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.702 Y91.707 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
M204 S6000
G2 X128.222 Y91.717 I.673 J-21.775 E.01048
G1 X128.311 Y91.808 E.00257
M204 S10000
G1 X128.156 Y91.246 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
M204 S6000
G2 X128.12 Y88.52 I-87.268 J-.238 E.10668
G1 X127.537 Y88.522 E.02281
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X127.087 Y88.548 E.01979
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X127.011 Y88.57 E.00392
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X126.934 Y88.591 E.0043
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X126.857 Y88.612 E.00468
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X126.78 Y88.634 E.00507
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X126.913 Y88.7 E.00942
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X127.046 Y88.766 E.00868
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X127.178 Y88.833 E.00794
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X127.311 Y88.899 E.0072
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X127.527 Y89.041 I-.144 J.453 E.01087
G1 X127.73 Y89.415 E.01766
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X127.795 Y89.679 E.01016
G3 X127.848 Y91.24 I-25.201 J1.644 E.05839
G1 X128.096 Y91.245 E.00924
M204 S10000
G1 X127.815 Y88.818 F42000
; LINE_WIDTH: 0.359469
G1 F8589.18
M204 S6000
G1 X127.759 Y88.851 E.00221
G1 X127.795 Y88.872 E.00144
M204 S10000
G1 X125.685 Y88.645 F42000
; LINE_WIDTH: 0.629923
G1 F4512.586
M204 S6000
G3 X126.721 Y88.631 I.648 J9.44 E.06735
M204 S10000
G1 X124.726 Y88.829 F42000
; LINE_WIDTH: 0.362209
G1 F8511.282
M204 S6000
G1 X124.669 Y88.862 E.00225
G1 X124.706 Y88.883 E.00149
M204 S10000
G1 X124.67 Y89.575 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X125.119 Y88.952 I1.083 J.306 E.03219
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X125.23 Y88.892 E.00548
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X125.34 Y88.832 E.00612
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X125.45 Y88.772 E.00677
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X125.561 Y88.713 E.00742
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X125.671 Y88.653 E.00807
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X125.685 Y88.645 E.00108
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X125.594 Y88.622 E.00613
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X125.503 Y88.599 E.00563
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X125.412 Y88.576 E.00512
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X125.32 Y88.552 E.00462
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X125.229 Y88.529 E.00387
G1 X124.377 Y88.532 E.0351
G1 X124.374 Y89.57 E.04274
G1 X124.61 Y89.574 E.00974
; OBJECT_ID: 331
; WIPE_START
G1 X124.374 Y89.57 E-.08991
G1 X124.377 Y88.532 E-.39444
G1 X125.102 Y88.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.462 Y96.135 Z.88 F42000
G1 X119.199 Y158.678 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X119.128 Y158.47 E.00975
G2 X118.963 Y158.261 I-.682 J.368 E.01192
G2 X118.345 Y158.112 I-.571 J1.01 E.02862
G2 X113.796 Y158.06 I-6.536 J375.104 E.20236
G3 X113.801 Y157.214 I17.494 J-.334 E.03763
G3 X121.74 Y157.219 I3.721 J426.531 E.35316
G3 X121.691 Y158.513 I-22.684 J-.209 E.05762
G2 X116.797 Y161.975 I86.806 J127.905 E.26665
G2 X116.766 Y163.002 I.492 J.529 E.05086
G2 X117.347 Y163.496 I2.959 J-2.892 E.03398
G2 X121.712 Y166.543 I807.609 J-1152.394 E.2368
G3 X121.735 Y167.864 I-18.182 J.973 E.05877
G3 X113.798 Y167.839 I-2.114 J-587.958 E.35306
G3 X113.798 Y166.996 I33.794 J-.441 E.03748
G2 X118.423 Y166.949 I1.184 J-111.6 E.20578
G2 X118.889 Y166.796 I-.091 J-1.062 E.02201
G2 X118.835 Y165.652 I-.449 J-.552 E.05921
G2 X114.421 Y162.518 I-235.825 J327.478 E.24081
G2 X118.794 Y159.419 I-190.181 J-273.047 E.23843
G2 X119.183 Y159.033 I-.658 J-1.051 E.02457
G1 X119.207 Y158.736 E.01329
M204 S10000
G1 X118.826 Y158.757 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.794 Y158.652 I-.275 J.027 E.00453
G2 X118.566 Y158.504 I-.274 J.173 E.01148
G2 X115.461 Y158.454 I-2.506 J58.481 E.12754
G3 X113.438 Y158.425 I.048 J-74.485 E.08306
G3 X113.443 Y156.849 I19.632 J-.729 E.06471
G3 X122.094 Y156.845 I4.488 J332.294 E.3552
G3 X122.057 Y158.718 I-15.279 J.634 E.07694
G2 X117.053 Y162.251 I87.947 J129.844 E.25155
G2 X117.107 Y162.819 I.27 J.26 E.02659
G2 X118.13 Y163.591 I7.227 J-8.504 E.05263
G3 X120.472 Y165.229 I-56.115 J82.729 E.11736
G3 X122.063 Y166.336 I-19.43 J29.634 E.07958
G3 X122.08 Y168.238 I-11.086 J1.052 E.07822
G3 X113.439 Y168.206 I-2.329 J-523.15 E.35481
G3 X113.438 Y166.622 I20.528 J-.8 E.06503
G2 X118.389 Y166.575 I1.22 J-133.023 E.20333
G2 X118.767 Y166.34 I.011 J-.402 E.01934
G2 X118.593 Y165.939 I-.357 J-.084 E.01926
G3 X113.859 Y162.566 I453.819 J-641.818 E.23865
G1 X113.794 Y162.513 E.00343
G3 X118.194 Y159.399 I1147.337 J1616.221 E.22132
G2 X118.741 Y158.984 I-7.158 J-10.003 E.02821
G2 X118.825 Y158.817 I-.191 J-.2 E.00782
M204 S10000
G1 X119.32 Y159.598 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565193
G1 F5090.88
M204 S6000
G1 X116.471 Y161.642 E.20204
M204 S10000
G1 X116.114 Y161.788 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X115.071 Y162.52 E.05231
G1 X116.17 Y163.3 E.05533
M73 P74 R3
G1 X116.361 Y163.052 E.01285
G3 X116.182 Y162.473 I.898 J-.595 E.02525
G1 X116.247 Y162.131 E.01429
G1 X116.295 Y162.038 E.0043
G1 X116.149 Y161.836 E.01022
M204 S10000
G1 X115.803 Y162.473 F42000
; LINE_WIDTH: 0.511568
G1 F5695.554
M204 S6000
G2 X115.799 Y162.571 I-.028 J.048 E.01184
M204 S10000
G1 X116.534 Y163.441 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.569237
G1 F5050.449
M204 S6000
G2 X119.235 Y165.377 I58.661 J-79.002 E.19302
M204 S10000
G1 X119.593 Y165.524 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.406 Y165.778 E.01294
G1 X119.504 Y166.001 E.01001
G3 X119.344 Y166.857 I-1.156 J.228 E.03663
G1 X119.071 Y167.125 E.0157
G1 X118.962 Y167.179 E.005
G1 X118.969 Y167.488 E.01271
G1 X121.366 Y167.489 E.09844
G1 X121.343 Y166.743 E.03064
G1 X119.642 Y165.558 E.08513
M204 S10000
G1 X119.889 Y166.169 F42000
G1 F7144.644
M204 S6000
G1 X119.85 Y166.594 E.01756
G1 X119.702 Y166.961 E.01621
G1 X119.583 Y167.129 E.00845
G1 X120.995 Y167.129 E.05797
G1 X120.989 Y166.935 E.00797
G1 X119.938 Y166.203 E.05257
M204 S10000
G1 X120.182 Y166.745 F42000
; LINE_WIDTH: 0.394909
G1 F7680.033
M204 S6000
G1 X120.119 Y166.781 E.00277
G1 X120.166 Y166.808 E.00208
M204 S10000
G1 X118.592 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551444
G1 F5233.333
M204 S6000
G1 X115.38 Y167.424 E.18001
; LINE_WIDTH: 0.527382
G1 F5502.81
G1 X113.992 Y167.419 E.07403
; WIPE_START
G1 X115.38 Y167.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.308 Y159.867 Z.88 F42000
G1 X113.991 Y157.637 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.532414
G1 F5444.184
M204 S6000
G1 X114.391 Y157.639 E.02155
; LINE_WIDTH: 0.556294
G1 F5182.184
G3 X116.97 Y157.64 I.796 J804.611 E.14596
G1 X118.675 Y157.67 E.09657
M204 S10000
G1 X119.054 Y157.581 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.042 Y157.885 E.01246
G1 X119.228 Y157.992 E.00882
G1 X119.471 Y158.317 E.01668
G1 X119.586 Y158.699 E.01636
G1 X119.516 Y159.225 E.02181
G1 X119.68 Y159.455 E.01159
G1 X121.324 Y158.312 E.08219
G1 X121.351 Y157.592 E.02959
G1 X119.114 Y157.582 E.09184
M204 S10000
G1 X119.794 Y158.017 F42000
; LINE_WIDTH: 0.565569
G1 F5087.102
M204 S6000
G1 X119.987 Y158.485 E.02917
G1 X120.013 Y158.696 E.01227
G1 X120.899 Y158.08 E.06226
G1 X120.902 Y158.022 E.00331
G1 X119.854 Y158.018 E.06041
; WIPE_START
G1 X120.902 Y158.022 E-.3981
G1 X120.899 Y158.08 E-.02184
G1 X120.165 Y158.591 E-.34007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.399 Y151.477 Z.88 F42000
G1 X115.271 Y146.001 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X114.653 Y146.712 E.04191
G1 X114.698 Y153.461 E.30021
G1 X115.382 Y154.145 E.04305
G1 X121.733 Y154.211 E.28254
G3 X121.731 Y155.017 I-15.639 J.362 E.03589
G3 X115.661 Y155.011 I-2.858 J-184.576 E.27004
G3 X115.059 Y154.849 I.021 J-1.275 E.02801
G3 X114.023 Y153.984 I.751 J-1.952 E.06113
G3 X113.833 Y153.223 I1.386 J-.75 E.03527
G3 X113.8 Y148.5 I104.203 J-3.088 E.21011
G3 X113.854 Y146.546 I30.526 J-.146 E.08692
G3 X115.438 Y145.11 I1.957 J.566 E.10014
G3 X117.169 Y145.024 I1.375 J10.16 E.07718
G3 X120.39 Y145.025 I1.512 J225.279 E.14328
G3 X121.686 Y145.047 I-.245 J52.583 E.05767
G3 X121.693 Y145.923 I-21.432 J.606 E.03897
G3 X115.317 Y145.947 I-4.211 J-273.027 E.28363
G1 X115.31 Y145.955 E.00048
M204 S10000
G1 X115.488 Y146.322 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.029 Y146.851 E.02877
G1 X115.071 Y153.305 E.26499
G1 X115.539 Y153.772 E.02714
G1 X122.102 Y153.839 E.26951
G3 X122.082 Y155.39 I-12.499 J.612 E.06372
G3 X115.635 Y155.385 I-3.083 J-193.366 E.26473
G3 X114.904 Y155.191 I.052 J-1.664 E.03132
G3 X113.694 Y154.164 I.912 J-2.301 E.06632
G3 X113.459 Y153.249 I1.739 J-.934 E.03917
G3 X113.426 Y148.497 I103.801 J-3.114 E.19515
G3 X113.489 Y146.454 I26.721 J-.195 E.08394
G3 X115.346 Y144.746 I2.327 J.667 E.10897
G3 X117.167 Y144.649 I1.459 J10.173 E.07496
G3 X120.393 Y144.65 I1.513 J225.615 E.13248
G3 X122.047 Y144.69 I.118 J29.411 E.06794
G3 X122.051 Y146.283 I-18.899 J.844 E.06544
G3 X115.548 Y146.323 I-4.493 J-206.388 E.26704
M204 S10000
G1 X115.396 Y145.542 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45899
G1 F6446.268
M204 S6000
G1 X115.268 Y145.563 E.00589
; LINE_WIDTH: 0.421601
G1 F7112.979
G2 X115.089 Y145.631 I.076 J.465 E.00795
M204 S10000
G1 X121.499 Y145.486 F42000
; LINE_WIDTH: 0.588624
G1 F4865.193
M204 S6000
G2 X115.822 Y145.503 I-1.688 J381.573 E.34228
; LINE_WIDTH: 0.541727
G1 F5338.913
G2 X115.538 Y145.523 I.084 J3.261 E.01565
; LINE_WIDTH: 0.499248
G1 F5855.347
G1 X115.396 Y145.542 E.00721
M204 S10000
G1 X115.478 Y145.301 F42000
; LINE_WIDTH: 0.489929
G1 F5982.279
M204 S6000
G1 X115.173 Y145.555 E.01941
; LINE_WIDTH: 0.52117
G1 F5576.947
G2 X114.801 Y145.869 I3.535 J4.562 E.02564
; LINE_WIDTH: 0.569413
G1 F5048.704
G2 X114.442 Y146.284 I2.048 J2.135 E.03194
; LINE_WIDTH: 0.537644
G1 F5384.56
G1 X114.381 Y146.373 E.00585
; LINE_WIDTH: 0.501995
G1 F5818.941
G1 X114.299 Y146.503 E.00774
; LINE_WIDTH: 0.492811
G1 F5942.446
G2 X114.246 Y146.732 I.484 J.232 E.01173
G2 X114.237 Y147.384 I33.324 J.83 E.0322
; LINE_WIDTH: 0.543695
G1 F5317.193
G2 X114.274 Y153.395 I173.802 J1.921 E.33164
; LINE_WIDTH: 0.503783
G1 F5795.493
G1 X114.286 Y153.544 E.00754
G2 X114.402 Y153.776 I.425 J-.066 E.01332
; LINE_WIDTH: 0.569158
G1 F5051.23
G2 X114.82 Y154.209 I1.874 J-1.392 E.03512
; LINE_WIDTH: 0.541371
G1 F5342.866
G1 X114.921 Y154.291 E.00714
; LINE_WIDTH: 0.514467
G1 F5659.216
G1 X115.002 Y154.353 E.00524
; LINE_WIDTH: 0.487368
G1 F6018.135
G1 X115.082 Y154.414 E.00493
; LINE_WIDTH: 0.446326
G1 F6657.642
G2 X115.359 Y154.543 I.431 J-.561 E.01359
; LINE_WIDTH: 0.491305
G1 F5963.202
G1 X115.501 Y154.569 E.00709
; LINE_WIDTH: 0.541541
G1 F5340.984
G2 X118.115 Y154.606 I1.938 J-45.472 E.14357
; LINE_WIDTH: 0.521725
G1 F5570.244
G1 X119.828 Y154.609 E.09023
; LINE_WIDTH: 0.496073
G1 F5897.976
G1 X121.541 Y154.613 E.08521
; WIPE_START
G1 X119.828 Y154.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.166 Y147.006 Z.88 F42000
G1 X118.712 Y141.789 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X118.896 Y141.886 E.00925
G2 X120.567 Y141.592 I.592 J-1.531 E.07932
G2 X120.764 Y141.295 I-.907 J-.814 E.01593
G2 X120.821 Y138.139 I-91.854 J-3.227 E.14039
G3 X120.852 Y133.589 I190.503 J-.97 E.20243
G3 X121.694 Y133.583 I.51 J12.053 E.03747
G3 X121.657 Y141.346 I-164.906 J3.091 E.34536
G3 X120.94 Y142.42 I-1.745 J-.388 E.05876
G3 X119.493 Y142.853 I-1.323 J-1.782 E.06859
G3 X117.482 Y141.754 I-.081 J-2.24 E.10699
G3 X117.364 Y140.871 I3.141 J-.871 E.03973
G3 X117.296 Y135.433 I938.133 J-14.477 E.24194
G2 X117.153 Y134.632 I-2.427 J.02 E.03637
G2 X116.182 Y134.109 I-.941 J.583 E.05133
G2 X115.424 Y134.144 I-.274 J2.308 E.03393
G2 X114.785 Y134.925 I.314 J.908 E.04725
G2 X114.685 Y136.544 I9.636 J1.409 E.07225
G1 X114.664 Y142.434 E.26202
G1 X113.827 Y142.418 E.03723
G3 X113.817 Y135.277 I367.728 J-4.084 E.31767
G3 X114.18 Y133.998 I2.012 J-.12 E.06024
G3 X116.083 Y133.24 I1.685 J1.46 E.09471
G3 X116.957 Y133.361 I.084 J2.601 E.03943
G3 X118.052 Y134.371 I-1.099 J2.291 E.06725
G3 X118.206 Y135.78 I-5.61 J1.326 E.06322
G3 X118.233 Y137.215 I-55.594 J1.737 E.06386
G1 X118.245 Y141.475 E.18949
G2 X118.66 Y141.76 I2.137 J-2.662 E.0224
M204 S10000
G1 X118.888 Y141.46 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.48 Y141.617 I.644 J-1.234 E.02535
G2 X120.294 Y141.333 I.042 J-1.19 E.03622
G2 X120.394 Y141.185 I-.45 J-.413 E.00737
G2 X120.462 Y134.216 I-272.184 J-6.106 E.28616
G3 X120.496 Y133.24 I15.683 J.07 E.04011
G3 X122.056 Y133.235 I.812 J9.744 E.06413
G3 X122.028 Y141.403 I-149.209 J3.571 E.33543
G3 X121.173 Y142.714 I-2.118 J-.448 E.06577
G3 X119.492 Y143.228 I-1.553 J-2.073 E.07361
G3 X117.134 Y141.894 I-.084 J-2.603 E.117
G3 X116.989 Y140.887 I3.413 J-1.005 E.04192
G3 X116.921 Y135.45 I906.214 J-14.078 E.22327
G2 X116.821 Y134.81 I-2.101 J.001 E.0267
G2 X116.298 Y134.497 I-.586 J.386 E.02591
G2 X115.532 Y134.503 I-.359 J2.881 E.03154
G2 X115.151 Y135.008 I.208 J.553 E.02739
G2 X115.06 Y136.547 I9.415 J1.33 E.06337
G1 X115.037 Y142.817 E.25744
G1 X113.454 Y142.786 E.06503
G3 X113.442 Y135.265 I383.096 J-4.349 E.3088
G3 X114.057 Y133.577 I2.273 J-.128 E.07583
G3 X116.094 Y132.865 I1.805 J1.895 E.0913
G3 X117.104 Y133.016 I.076 J2.948 E.04216
G3 X118.402 Y134.234 I-1.232 J2.613 E.07429
G3 X118.555 Y135.215 I-3.755 J1.089 E.04086
G3 X118.608 Y137.213 I-43.917 J2.155 E.08208
G1 X118.619 Y141.277 E.16686
G2 X118.836 Y141.431 I.913 J-1.05 E.01093
M204 S10000
G1 X118.247 Y141.995 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556328
G1 F5181.833
M204 S6000
G2 X119.677 Y142.416 I1.204 J-1.454 E.08674
G2 X121.2 Y141.365 I-.004 J-1.635 E.11135
G1 X121.213 Y141.277 E.00502
G2 X121.272 Y133.775 I-217.653 J-5.446 E.42474
; WIPE_START
G1 X121.27 Y135.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.247 Y141.995 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.517434
G1 F5622.502
M204 S6000
G1 X118.151 Y141.918 E.00647
; LINE_WIDTH: 0.492379
G1 F5948.38
G1 X118.041 Y141.825 E.00707
; LINE_WIDTH: 0.453928
G1 F6529.133
G3 X117.844 Y141.572 I.216 J-.372 E.01479
; LINE_WIDTH: 0.485569
G1 F6043.583
G1 X117.831 Y141.461 E.00541
; LINE_WIDTH: 0.521321
G1 F5575.119
G3 X117.809 Y141.058 I8.027 J-.635 E.02124
; LINE_WIDTH: 0.573382
G1 F5009.662
G3 X117.756 Y135.796 I457.492 J-7.25 E.30811
G1 X117.742 Y135.408 E.02276
G2 X117.666 Y134.704 I-4.298 J.108 E.04149
; LINE_WIDTH: 0.578921
G1 F4956.182
G2 X117.406 Y134.221 I-1.011 J.232 E.03288
; LINE_WIDTH: 0.544197
G1 F5311.675
G2 X116.072 Y133.673 I-1.234 J1.105 E.08242
G2 X115.63 Y133.678 I-.178 J3.395 E.0244
; LINE_WIDTH: 0.524732
G1 F5534.192
G1 X115.484 Y133.695 E.00782
G2 X114.708 Y134.094 I.251 J1.443 E.04696
; LINE_WIDTH: 0.58331
G1 F4914.611
G2 X114.476 Y134.395 I.836 J.882 E.0228
; LINE_WIDTH: 0.60399
G1 F4727.75
G2 X114.269 Y135.356 I2.018 J.937 E.06148
; LINE_WIDTH: 0.55299
G1 F5216.924
G1 X114.255 Y135.733 E.02123
G2 X114.243 Y138.044 I90.749 J1.649 E.12992
; LINE_WIDTH: 0.52686
G1 F5508.967
G1 X114.245 Y142.231 E.22298
; WIPE_START
G1 X114.244 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.32 Y133.246 Z.88 F42000
G1 X120.757 Y125.443 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X120.785 Y125.302 E.00638
G2 X120.834 Y122.03 I-88.736 J-2.964 E.14555
G1 X120.841 Y121.883 E.00658
G3 X121.655 Y121.871 I.621 J14.333 E.03623
G3 X121.689 Y131.069 I-343.474 J5.855 E.40917
G3 X120.842 Y131.074 I-.495 J-10.871 E.03768
G2 X120.796 Y127.851 I-465.892 J5.05 E.14339
G2 X120.517 Y127.095 I-1.105 J-.022 E.03671
G1 X120.241 Y126.977 E.01334
G2 X115.126 Y126.907 I-4.92 J172.161 E.22753
G1 X113.799 Y126.879 E.05907
G3 X113.798 Y126.026 I28.298 J-.439 E.03794
G3 X119.299 Y125.991 I5.364 J407.272 E.24468
G2 X120.186 Y125.934 I.037 J-6.321 E.03959
G2 X120.734 Y125.498 I-.124 J-.717 E.03246
M204 S10000
G1 X120.389 Y125.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.412 Y125.255 I-.324 J-.13 E.00402
G2 X120.459 Y122.019 I-91.605 J-2.951 E.13287
G3 X120.486 Y121.533 I3.734 J-.035 E.02001
G3 X121.736 Y121.497 I.931 J10.635 E.05136
G3 X122.012 Y121.513 I-.048 J3.211 E.01138
G3 X122.07 Y124.775 I-93.815 J3.301 E.13396
G3 X122.055 Y131.413 I-300.119 J2.64 E.27256
G3 X120.489 Y131.418 I-.814 J-8.909 E.06441
G3 X120.446 Y128.883 I40.436 J-1.952 E.10413
G2 X120.399 Y127.66 I-11.936 J-.159 E.05025
G2 X120.279 Y127.401 I-.451 J.052 E.01195
G2 X119.867 Y127.334 I-.314 J.628 E.0174
G2 X115.12 Y127.282 I-19.637 J1577.07 E.19492
G3 X113.446 Y127.239 I.191 J-40.475 E.06876
G3 X113.444 Y125.66 I12.6 J-.804 E.06486
G3 X119.292 Y125.616 I5.336 J318.555 E.2401
G2 X120.106 Y125.566 I.043 J-5.943 E.03352
G2 X120.362 Y125.403 I-.041 J-.347 E.01289
M204 S10000
G1 X121.239 Y125.419 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.548199
G1 F5268.127
M204 S6000
G1 X121.253 Y123.146 E.12661
; LINE_WIDTH: 0.519022
G1 F5603.059
G3 X121.249 Y122.067 I97.022 J-.897 E.0565
; WIPE_START
G1 X121.253 Y123.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.307 Y126.309 Z.88 F42000
G1 X113.992 Y126.452 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564954
G1 F5093.292
M204 S6000
G2 X116.178 Y126.462 I5.395 J-984.686 E.12591
; LINE_WIDTH: 0.60573
G1 F4712.672
G2 X118.328 Y126.468 I2.352 J-433.847 E.13383
G1 X119.761 Y126.467 E.08918
M204 S10000
G1 X120.136 Y126.596 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X120.356 Y126.619 E.00907
G1 X120.783 Y126.826 E.01949
G1 X120.947 Y127.002 E.00987
G1 X121.064 Y126.931 E.00564
G3 X121.328 Y127.06 I-.023 J.382 E.01237
G1 X121.323 Y125.796 E.05189
G1 X121.005 Y125.789 E.01306
G1 X120.901 Y125.939 E.00746
G1 X120.514 Y126.225 E.01977
G1 X120.135 Y126.315 E.01603
G1 X120.136 Y126.536 E.00908
M204 S10000
G1 X120.952 Y126.381 F42000
; LINE_WIDTH: 0.502428
G1 F5813.241
M204 S6000
G2 X120.947 Y126.477 I-.028 J.047 E.01125
M204 S10000
G1 X120.967 Y127.606 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.55601
G1 F5185.156
M204 S6000
G1 X121.25 Y127.815 E.01991
G1 X121.258 Y128.148 E.01887
G3 X121.262 Y130.884 I-316.202 J1.803 E.1548
; WIPE_START
G1 X121.259 Y128.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.774 Y121.398 Z.88 F42000
G1 X117.671 Y110.798 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X117.663 Y110.798 E.00033
G1 X117.609 Y116.391 E.2488
G3 X116.713 Y116.37 I-.228 J-9.413 E.03985
G2 X116.729 Y112.158 I-1509.827 J-7.73 E.18735
G2 X116.704 Y111.6 I-7.11 J.043 E.02487
G1 X116.525 Y110.796 E.03664
G3 X113.805 Y110.716 I4.812 J-210.43 E.12103
G3 X113.817 Y109.911 I34.461 J.095 E.0358
G3 X118.691 Y109.893 I3.846 J363.204 E.21681
G3 X120.342 Y110.001 I.263 J8.643 E.07369
G3 X121.695 Y111.792 I-.467 J1.76 E.10763
G3 X121.69 Y117.992 I-96.42 J3.026 E.27583
G3 X120.825 Y119.472 I-1.701 J-.002 E.07993
G3 X120.093 Y119.793 I-1.399 J-2.194 E.03569
G3 X117.085 Y119.83 I-2.043 J-43.787 E.13384
G1 X113.817 Y119.811 E.14535
G1 X113.801 Y118.978 E.03704
G2 X119.425 Y118.928 I.811 J-221.986 E.25019
G2 X120.2 Y118.816 I-.013 J-2.844 E.03492
G2 X120.786 Y117.928 I-.389 J-.894 E.05007
G2 X120.823 Y115.925 I-23.875 J-1.44 E.08915
G2 X120.79 Y111.86 I-91.863 J-1.294 E.18084
G2 X120.553 Y111.135 I-1.155 J-.024 E.03456
G2 X119.584 Y110.76 I-.941 J.992 E.04742
G1 X117.731 Y110.797 E.08246
M204 S10000
G1 X118.035 Y111.163 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X117.999 Y115.777 E.18944
G3 X117.959 Y116.735 I-8.637 J.117 E.03937
M73 P75 R3
G3 X116.349 Y116.7 I-.658 J-6.92 E.06624
G3 X116.359 Y113.251 I83.034 J-1.482 E.14165
G2 X116.332 Y111.654 I-31.224 J-.254 E.06559
G1 X116.222 Y111.162 E.02067
G3 X113.43 Y111.078 I4.936 J-209.701 E.11469
G3 X113.45 Y109.539 I52.505 J-.115 E.0632
G3 X118.696 Y109.518 I4.186 J387.013 E.2154
G3 X120.43 Y109.636 I.263 J8.931 E.07149
G3 X122.07 Y111.775 I-.554 J2.123 E.11917
G3 X122.064 Y118.019 I-96.591 J3.041 E.25642
G3 X121.028 Y119.787 I-2.053 J-.016 E.08809
G3 X120.125 Y120.167 I-1.397 J-2.057 E.04051
G3 X117.084 Y120.205 I-2.072 J-43.797 E.12489
G1 X113.45 Y120.183 E.14922
G1 X113.419 Y118.606 E.06479
G2 X119.408 Y118.553 I.516 J-281.176 E.24594
G2 X120.128 Y118.433 I.051 J-1.91 E.03015
G2 X120.413 Y117.886 I-.359 J-.535 E.02639
G2 X120.448 Y115.924 I-23.883 J-1.403 E.0806
G2 X120.416 Y111.889 I-92.5 J-1.292 E.1657
G2 X120.2 Y111.321 I-.719 J-.052 E.02573
G2 X119.568 Y111.135 I-.593 J.842 E.02758
G2 X118.095 Y111.16 I-.416 J18.787 E.06048
; WIPE_START
M204 S6000
G1 X118.053 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.185 Y111.593 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.585811
G1 F4891.231
M204 S6000
G1 X117.189 Y113.257 E.0998
G2 X117.164 Y115.935 I928.907 J10.115 E.16061
G1 X117.406 Y116.196 E.02138
; WIPE_START
G1 X117.164 Y115.935 E-.13547
G1 X117.179 Y114.292 E-.62453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.087 Y119.394 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.525358
G1 F5526.747
M204 S6000
G1 X114.004 Y119.394 E.16363
M204 S10000
G1 X117.087 Y119.394 F42000
; LINE_WIDTH: 0.556602
G1 F5178.971
M204 S6000
G2 X119.441 Y119.373 I.363 J-93.158 E.13334
G1 X119.578 Y119.367 E.00776
G2 X120.657 Y119.057 I.11 J-1.647 E.0649
G1 X120.815 Y118.929 E.01149
; LINE_WIDTH: 0.583584
G1 F4912.039
G2 X121.21 Y118.194 I-.763 J-.884 E.05097
G1 X121.235 Y117.986 E.01253
G2 X121.264 Y112.421 I-95.921 J-3.281 E.33242
G1 X121.243 Y111.831 E.03526
G2 X120.739 Y110.701 I-1.381 J-.061 E.07661
G1 X120.727 Y110.691 E.00091
; LINE_WIDTH: 0.534269
G1 F5422.893
G2 X120.594 Y110.598 I-1.463 J1.945 E.00879
G1 X120.356 Y110.47 E.01457
G2 X119.26 Y110.329 I-.918 J2.803 E.06016
G1 X118.686 Y110.332 E.03103
; LINE_WIDTH: 0.561692
G1 F5126.418
G1 X117.472 Y110.347 E.0695
M204 S10000
G1 X117.048 Y110.322 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523058
G1 F5554.202
M204 S6000
G1 X117.049 Y110.829 E.02679
; LINE_WIDTH: 0.550119
G1 F5247.492
G1 X117.047 Y110.899 E.00389
; LINE_WIDTH: 0.591859
G1 F4835.603
G1 X117.046 Y110.969 E.00422
; LINE_WIDTH: 0.630868
G1 F4505.113
G1 X117.064 Y111.001 E.0024
; LINE_WIDTH: 0.667148
G1 F4235.873
G1 X117.081 Y111.034 E.00256
M204 S10000
G1 X116.625 Y110.346 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.546914
G1 F5282.031
M204 S6000
G1 X115.315 Y110.331 E.07275
; LINE_WIDTH: 0.50909
G1 F5726.996
G1 X114.005 Y110.317 E.0671
; WIPE_START
G1 X115.315 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.335 Y106.674 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X119.425 Y106.629 E.00445
G1 X120.046 Y106.188 E.03391
G2 X118.886 Y105.006 I-9.165 J7.837 E.07373
G3 X113.745 Y100.397 I403.081 J-454.653 E.30714
G3 X113.751 Y99.133 I25.323 J-.523 E.05623
G3 X120.242 Y99.094 I5.077 J307.911 E.28875
G3 X121.777 Y99.118 I-.058 J53.259 E.06828
G3 X121.797 Y100.1 I-15.714 J.809 E.0437
G2 X116.811 Y100.147 I15.25 J1865.937 E.22179
G2 X115.135 Y100.274 I.893 J22.973 E.0748
G1 X116.122 Y101.335 E.06447
G2 X119.045 Y103.993 I53.631 J-56.057 E.17577
G3 X121.736 Y106.413 I-175.542 J197.839 E.16096
G3 X121.715 Y107.734 I-104.991 J-.94 E.05875
G3 X113.748 Y107.743 I-4.782 J-654.062 E.35443
G3 X113.754 Y106.813 I16.22 J-.349 E.04141
G3 X118.527 Y106.781 I5.559 J477.802 E.21232
G2 X119.279 Y106.694 I.019 J-3.131 E.03374
M204 S10000
G1 X119.174 Y106.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.485 Y106.126 I-.499 J-1.08 E.01544
G2 X118.634 Y105.284 I-7.64 J6.87 E.04919
G3 X113.37 Y100.557 I314.742 J-355.793 E.29049
G3 X113.4 Y98.772 I17.197 J-.613 E.07336
G3 X120.243 Y98.719 I5.139 J223.205 E.28102
G3 X122.112 Y98.766 I.421 J20.579 E.07678
G3 X122.136 Y100.446 I-7.035 J.942 E.06917
G3 X120.737 Y100.491 I-1.093 J-12.365 E.05754
G2 X116.537 Y100.535 I-.581 J143.774 E.17244
G1 X115.936 Y100.584 E.02478
G2 X117.632 Y102.233 I18.228 J-17.056 E.09718
G3 X122.113 Y106.25 I-324.732 J366.721 E.24708
G3 X122.083 Y108.107 I-148.094 J-1.41 E.07623
G3 X113.388 Y108.109 I-4.452 J-501.161 E.35705
G3 X113.4 Y106.447 I21.105 J-.67 E.06825
G3 X118.515 Y106.406 I8.882 J793.218 E.21001
G2 X119.116 Y106.348 I.031 J-2.806 E.02484
M204 S10000
G1 X118.87 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628096
G1 F4527.105
M204 S6000
G1 X118.085 Y107.27 E.05091
G2 X113.943 Y107.278 I-1.09 J538.895 E.26838
M204 S10000
G1 X119.248 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X121.346 Y107.36 E.08615
G1 X121.358 Y106.578 E.03213
G1 X120.833 Y106.106 E.02901
G1 X120.39 Y106.55 E.02572
G1 X120.249 Y106.602 E.0062
G1 X120.161 Y106.562 E.00397
G1 X119.479 Y107.019 E.0337
G1 X119.241 Y107.082 E.01014
G1 X119.247 Y107.31 E.00937
M204 S10000
G1 X120.219 Y106.983 F42000
; LINE_WIDTH: 0.468329
G1 F6298.816
M204 S6000
G1 X120.303 Y106.981 E.00393
M204 S10000
G1 X120.363 Y106.979 F42000
; LINE_WIDTH: 0.453874
G1 F6530.032
M204 S6000
G1 X120.682 Y106.996 E.01435
; LINE_WIDTH: 0.406277
G1 F7427.836
G1 X121.001 Y107.012 E.01261
G1 X121.006 Y106.732 E.01105
G1 X120.846 Y106.589 E.00847
G1 X120.64 Y106.798 E.0116
; LINE_WIDTH: 0.421461
G1 F7115.728
G1 X120.527 Y106.872 E.00558
; LINE_WIDTH: 0.454906
G1 F6512.955
G1 X120.414 Y106.946 E.0061
M204 S10000
G1 X120.476 Y105.933 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.605112
G1 F4718.018
M204 S6000
G1 X120.161 Y105.619 E.02763
; LINE_WIDTH: 0.566056
G1 F5082.198
G1 X119.702 Y105.169 E.03713
; LINE_WIDTH: 0.535755
G1 F5405.951
G1 X119.174 Y104.686 E.03883
G3 X115.796 Y101.645 I111.103 J-126.796 E.24664
; LINE_WIDTH: 0.591762
G1 F4836.482
G1 X115.411 Y101.264 E.03286
; LINE_WIDTH: 0.620043
G1 F4592.208
G1 X115.126 Y100.987 E.02539
M204 S10000
G1 X114.765 Y100.849 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385605
G1 F7899.536
M204 S6000
G1 X114.979 Y100.628 E.01142
G1 X114.593 Y100.225 E.02076
; LINE_WIDTH: 0.409301
G1 F7363.507
G1 X114.558 Y100.167 E.00269
; LINE_WIDTH: 0.434566
G1 F6866.711
G1 X114.522 Y100.109 E.00289
; LINE_WIDTH: 0.464988
G1 F6350.775
G1 X114.541 Y100.026 E.00392
; LINE_WIDTH: 0.49287
G1 F5941.632
G1 X114.559 Y99.944 E.00419
G1 X114.701 Y99.912 E.0072
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X115.553 Y99.86 E.03753
; LINE_WIDTH: 0.412477
G1 F7297.143
G3 X116.801 Y99.787 I9.118 J144.535 E.05025
; LINE_WIDTH: 0.379556
G1 F8049.099
G3 X121.449 Y99.757 I9.596 J1132.296 E.16939
G1 X121.443 Y99.459 E.01088
G2 X116.39 Y99.464 I-1.861 J659.304 E.18415
; LINE_WIDTH: 0.418999
G1 F7164.55
G1 X115.537 Y99.489 E.03496
; LINE_WIDTH: 0.445278
G1 F6675.741
G1 X114.683 Y99.514 E.03753
; LINE_WIDTH: 0.473404
G1 F6221.474
G1 X114.428 Y99.532 E.01205
; LINE_WIDTH: 0.489248
G1 F5991.774
G1 X114.173 Y99.551 E.01252
G1 X114.135 Y100.108 E.02732
; LINE_WIDTH: 0.447554
G1 F6636.544
G1 X114.135 Y100.227 E.00527
; LINE_WIDTH: 0.431016
G1 F6932.43
G1 X114.393 Y100.485 E.01544
; LINE_WIDTH: 0.393737
G1 F7706.999
G2 X114.72 Y100.808 I3.652 J-3.379 E.01752
; WIPE_START
G1 X114.393 Y100.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.94 Y92.873 Z.88 F42000
G1 X115.203 Y89.216 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X115.081 Y89.277 E.00606
G2 X114.739 Y89.963 I.534 J.695 E.03528
G2 X114.785 Y94.891 I66.427 J1.84 E.2193
G2 X115.739 Y96.025 I1.138 J.011 E.07178
G2 X116.787 Y96.095 I1.068 J-8.135 E.04674
G2 X119.346 Y96.091 I1.225 J-33.233 E.11386
G2 X120.371 Y95.734 I.017 J-1.602 E.04924
G2 X120.695 Y95.035 I-.689 J-.744 E.03514
G2 X120.761 Y92.519 I-45.136 J-2.447 E.11198
G1 X120.802 Y88.162 E.1938
G1 X121.707 Y88.162 E.04024
G3 X121.685 Y95.396 I-263.533 J2.815 E.32179
G3 X120.478 Y96.851 I-2.632 J-.955 E.08576
G3 X119.285 Y97.06 I-1.136 J-2.974 E.0542
G3 X115.877 Y97.039 I-1.422 J-45.85 E.15164
G3 X114.364 Y96.293 I.016 J-1.94 E.07765
G3 X113.783 Y94.742 I1.644 J-1.5 E.07549
G3 X113.754 Y92.444 I65.458 J-1.974 E.10222
G1 X113.777 Y88.158 E.19067
G3 X118.263 Y88.144 I2.983 J235.393 E.19955
G3 X118.272 Y92.009 I-83.313 J2.128 E.17194
G3 X117.285 Y91.976 I.196 J-20.914 E.04391
G2 X117.202 Y89.732 I-26.349 J-.15 E.09992
G2 X117.005 Y89.281 I-.991 J.165 E.02211
G2 X115.99 Y89.096 I-.819 J1.616 E.04652
G2 X115.261 Y89.204 I-.087 J1.939 E.03298
M204 S10000
G1 X115.365 Y89.555 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.14 Y89.82 I.197 J.396 E.01468
G2 X115.091 Y90.724 I5.874 J.768 E.03722
G2 X115.159 Y94.857 I71.274 J.902 E.16973
G2 X115.987 Y95.682 I.802 J.023 E.05376
G2 X119.317 Y95.717 I2.145 J-45.024 E.13678
G2 X120.118 Y95.456 I.042 J-1.23 E.03533
G2 X120.322 Y94.995 I-.435 J-.467 E.02125
G2 X120.386 Y92.515 I-45.374 J-2.417 E.10187
G1 X120.431 Y87.787 E.19413
G1 X122.08 Y87.787 E.06773
G3 X122.055 Y95.468 I-230.889 J3.072 E.31536
G3 X120.637 Y97.191 I-2.956 J-.987 E.09372
G3 X119.304 Y97.435 I-1.29 J-3.292 E.05596
G3 X115.845 Y97.413 I-1.439 J-46.066 E.14207
G3 X114.084 Y96.543 I.048 J-2.315 E.08329
G3 X113.408 Y94.765 I1.869 J-1.727 E.08004
G3 X113.379 Y92.444 I65.545 J-1.996 E.09528
G1 X113.404 Y87.786 E.19128
G3 X118.164 Y87.768 I3.346 J258.086 E.19546
G3 X118.614 Y87.807 I.046 J2.084 E.01858
G3 X118.666 Y91.146 I-41.991 J2.325 E.13714
G3 X118.613 Y92.382 I-10.936 J.151 E.05083
G3 X116.916 Y92.336 I-.224 J-23.328 E.06974
G2 X116.834 Y89.806 I-30.876 J-.268 E.10398
G2 X116.739 Y89.573 I-.509 J.071 E.01043
G2 X116.218 Y89.471 I-.485 J1.092 E.02198
G2 X115.423 Y89.54 I-.147 J2.891 E.03288
; WIPE_START
M204 S6000
G1 X115.226 Y89.646 E-.08493
G1 X115.14 Y89.82 E-.07374
G1 X115.101 Y90.173 E-.13487
G1 X115.091 Y90.724 E-.2096
G1 X115.096 Y91.4 E-.25686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.25 Y89.947 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.640844
G1 F4427.727
M204 S6000
G1 X114.239 Y91.813 E.12365
G2 X114.294 Y94.945 I51.584 J.66 E.20757
G2 X115.209 Y96.374 I1.725 J-.098 E.11753
; LINE_WIDTH: 0.650057
G1 F4358.588
G2 X116.317 Y96.572 I1.005 J-2.421 E.07633
G2 X119.67 Y96.545 I1.43 J-30.545 E.22579
G1 X119.804 Y96.526 E.0091
G2 X120.675 Y96.102 I-.152 J-1.421 E.06653
; LINE_WIDTH: 0.61954
G1 F4596.336
G1 X120.707 Y96.072 E.00278
G2 X120.85 Y95.904 I-.856 J-.878 E.01409
; LINE_WIDTH: 0.578354
G1 F4961.607
G1 X120.819 Y95.798 E.00653
; LINE_WIDTH: 0.534664
G1 F5418.376
G1 X120.787 Y95.692 E.00598
; LINE_WIDTH: 0.490974
G1 F5967.772
G1 X120.756 Y95.586 E.00543
M204 S10000
G1 X120.991 Y95.185 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405742
G1 F7439.319
M204 S6000
G3 X121.253 Y95.226 I.096 J.244 E.01095
M204 S10000
G1 X121.207 Y94.872 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.636919
G1 F4457.859
M204 S6000
G1 X121.237 Y92.79 E.13699
; LINE_WIDTH: 0.606135
G1 F4709.176
G2 X121.254 Y88.357 I-818.445 J-5.298 E.27616
; WIPE_START
G1 X121.246 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.476 Y91.707 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.236641
G1 F12000
M204 S6000
G2 X117.996 Y91.717 I.673 J-21.775 E.01048
G1 X118.085 Y91.808 E.00257
M204 S10000
G1 X117.929 Y91.246 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.403113
G1 F7496.332
M204 S6000
G2 X117.894 Y88.52 I-87.268 J-.238 E.10668
G1 X117.311 Y88.522 E.02281
; LINE_WIDTH: 0.444979
G1 F6680.944
G1 X116.861 Y88.548 E.01979
; LINE_WIDTH: 0.491057
G1 F5966.625
G1 X116.784 Y88.57 E.00392
; LINE_WIDTH: 0.533255
G1 F5434.514
G1 X116.708 Y88.591 E.0043
; LINE_WIDTH: 0.575452
G1 F4989.541
G1 X116.631 Y88.612 E.00468
; LINE_WIDTH: 0.61765
G1 F4611.921
G1 X116.554 Y88.634 E.00507
; LINE_WIDTH: 0.616874
G1 F4618.351
G1 X116.687 Y88.7 E.00942
; LINE_WIDTH: 0.573124
G1 F5012.189
G1 X116.819 Y88.766 E.00868
; LINE_WIDTH: 0.529373
G1 F5479.461
G1 X116.952 Y88.833 E.00794
; LINE_WIDTH: 0.485624
G1 F6042.814
G1 X117.084 Y88.899 E.0072
; LINE_WIDTH: 0.424178
G1 F7062.632
G3 X117.3 Y89.041 I-.144 J.453 E.01087
G1 X117.503 Y89.415 E.01766
; LINE_WIDTH: 0.387665
G1 F7849.861
G1 X117.568 Y89.679 E.01016
G3 X117.622 Y91.24 I-25.201 J1.644 E.05839
G1 X117.869 Y91.245 E.00924
M204 S10000
G1 X117.589 Y88.818 F42000
; LINE_WIDTH: 0.359469
G1 F8589.18
M204 S6000
G1 X117.532 Y88.851 E.00221
G1 X117.569 Y88.872 E.00144
M204 S10000
G1 X115.459 Y88.645 F42000
; LINE_WIDTH: 0.629923
G1 F4512.586
M204 S6000
G3 X116.494 Y88.631 I.648 J9.44 E.06735
M204 S10000
G1 X114.499 Y88.829 F42000
; LINE_WIDTH: 0.362209
G1 F8511.282
M204 S6000
G1 X114.443 Y88.862 E.00225
G1 X114.48 Y88.883 E.00149
M204 S10000
G1 X114.444 Y89.575 F42000
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G3 X114.893 Y88.952 I1.083 J.306 E.03219
; LINE_WIDTH: 0.442584
G1 F6722.777
G1 X115.003 Y88.892 E.00548
; LINE_WIDTH: 0.487754
G1 F6012.717
G1 X115.114 Y88.832 E.00612
; LINE_WIDTH: 0.532923
G1 F5438.321
G1 X115.224 Y88.772 E.00677
; LINE_WIDTH: 0.578094
G1 F4964.1
G1 X115.334 Y88.713 E.00742
; LINE_WIDTH: 0.623263
G1 F4565.95
G1 X115.445 Y88.653 E.00807
; LINE_WIDTH: 0.650419
G1 F4355.917
G1 X115.459 Y88.645 E.00108
; LINE_WIDTH: 0.63149
G1 F4500.217
G1 X115.368 Y88.622 E.00613
; LINE_WIDTH: 0.584491
G1 F4903.535
G1 X115.276 Y88.599 E.00563
; LINE_WIDTH: 0.537493
G1 F5386.263
G1 X115.185 Y88.576 E.00512
; LINE_WIDTH: 0.490496
G1 F5974.412
G1 X115.094 Y88.552 E.00462
; LINE_WIDTH: 0.420994
G1 F7124.94
G1 X115.003 Y88.529 E.00387
G1 X114.15 Y88.532 E.0351
G1 X114.147 Y89.57 E.04274
G1 X114.384 Y89.574 E.00974
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F7124.94
G1 X114.147 Y89.57 E-.08991
G1 X114.15 Y88.532 E-.39443
G1 X114.876 Y88.53 E-.27565
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 3/4
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z.88 I-1.147 J.405 P1  F42000
G1 X139.622 Y158.573 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X139.614 Y158.536 E.00165
G1 X139.447 Y158.278 E.01368
G2 X138.718 Y158.108 I-.643 J1.106 E.0338
G2 X134.249 Y158.06 I-7.769 J518.454 E.19877
G3 X134.253 Y157.214 I17.002 J-.341 E.03764
G3 X142.194 Y157.219 I3.7 J436.266 E.35321
G3 X142.144 Y158.513 I-23.469 J-.255 E.05762
G2 X137.272 Y161.958 I89.16 J131.272 E.26543
G2 X137.17 Y162.94 I.458 J.544 E.04858
G2 X137.86 Y163.54 I2.68 J-2.388 E.04078
G2 X142.167 Y166.544 I307.806 J-436.675 E.23357
G3 X142.189 Y167.864 I-21.622 J1.018 E.05871
G3 X134.252 Y167.839 I-2.224 J-554.855 E.35307
G3 X134.252 Y166.996 I24.634 J-.418 E.03749
G2 X138.876 Y166.949 I1.244 J-105.817 E.20572
G2 X139.342 Y166.798 I-.093 J-1.076 E.02197
G1 X139.51 Y166.615 E.01106
G2 X139.304 Y165.664 I-.626 J-.362 E.04749
G1 X139.119 Y165.522 E.01037
G2 X134.875 Y162.517 I-458.307 J642.503 E.2313
G2 X139.205 Y159.451 I-176.431 J-253.801 E.23598
G1 X139.461 Y159.25 E.01449
G1 X139.704 Y158.945 E.01734
G1 X139.635 Y158.631 E.0143
M204 S10000
G1 X139.262 Y158.683 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X139.19 Y158.572 I-.393 J.175 E.00547
G2 X138.992 Y158.501 I-.251 J.386 E.00873
G2 X135.831 Y158.453 I-2.407 J55.548 E.12982
G3 X133.891 Y158.425 I.137 J-75.307 E.07966
G3 X133.896 Y156.85 I19.81 J-.719 E.06469
G3 X142.547 Y156.845 I4.498 J324.765 E.35522
G3 X142.509 Y158.718 I-15.49 J.624 E.07694
G2 X137.52 Y162.24 I92.34 J136.1 E.25077
G2 X137.476 Y162.721 I.216 J.263 E.02209
G2 X138.081 Y163.237 I2.404 J-2.208 E.03272
M73 P76 R3
G3 X142.515 Y166.335 I-337.987 J488.436 E.22208
G3 X142.533 Y168.238 I-11.207 J1.059 E.07827
G3 X133.892 Y168.206 I-2.432 J-496.317 E.35479
G3 X133.891 Y166.622 I22.473 J-.808 E.06503
G2 X138.842 Y166.575 I1.283 J-126.428 E.20331
G2 X139.22 Y166.336 I.017 J-.392 E.01956
G2 X139.06 Y165.95 I-.359 J-.077 E.01825
G1 X138.896 Y165.824 E.0085
G3 X134.359 Y162.602 I378.383 J-537.536 E.22848
G1 X134.248 Y162.514 E.00582
G3 X134.443 Y162.364 I1.645 J1.939 E.01008
G2 X138.978 Y159.153 I-194.962 J-280.178 E.22815
G2 X139.299 Y158.852 I-.471 J-.825 E.01827
G2 X139.283 Y158.74 I-.43 J.007 E.00467
; WIPE_START
M204 S6000
G1 X139.19 Y158.572 E-.07287
G1 X138.992 Y158.501 E-.0801
G1 X137.615 Y158.459 E-.5235
G1 X137.395 Y158.459 E-.08353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
; stop printing object, unique label id: 425
M625
; object ids of layer 3 start: 169,331,425
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.16
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer3 end: 169,331,425
M625
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.127 Y157.669 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556741
G1 F5177.519
M204 S6000
G1 X137.621 Y157.641 E.0853
G2 X134.902 Y157.639 I-2.009 J628.683 E.15407
; LINE_WIDTH: 0.53292
G1 F5438.362
G1 X134.444 Y157.637 E.02468
M204 S10000
G1 X139.505 Y157.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X139.494 Y157.886 E.01252
G1 X139.731 Y158.028 E.01132
G1 X139.972 Y158.421 E.01894
G1 X140.09 Y158.955 E.02245
G3 X139.959 Y159.227 I-.407 J-.029 E.01268
G1 X140.13 Y159.458 E.01178
G1 X141.777 Y158.312 E.08238
G1 X141.804 Y157.592 E.02958
G1 X139.565 Y157.582 E.09196
M204 S10000
G1 X140.238 Y158.017 F42000
; LINE_WIDTH: 0.563819
G1 F5104.776
M204 S6000
G3 X140.474 Y158.692 I-1.228 J.808 E.04151
G1 X141.353 Y158.08 E.06155
G1 X141.356 Y158.022 E.00337
M73 P76 R2
G1 X140.298 Y158.017 E.06077
M204 S10000
G1 X139.769 Y159.6 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
M204 S6000
G1 X136.923 Y161.642 E.20176
M204 S10000
G1 X136.564 Y161.785 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X135.524 Y162.518 E.05224
G1 X136.547 Y163.245 E.05152
G3 X136.599 Y162.937 I.445 J-.083 E.0131
G1 X136.723 Y162.88 E.00561
G1 X136.64 Y162.44 E.01838
G1 X136.701 Y162.13 E.01299
G1 X136.748 Y162.038 E.00423
G1 X136.599 Y161.833 E.0104
M204 S10000
G1 X136.26 Y162.47 F42000
; LINE_WIDTH: 0.516989
G1 F5627.99
M204 S6000
G2 X136.257 Y162.569 I-.029 J.049 E.01219
M204 S10000
G1 X137.179 Y163.243 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
M204 S6000
G1 X137.185 Y163.549 E.01518
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X137.186 Y163.573 E.00125
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X137.187 Y163.596 E.00134
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X139.385 Y165.154 I48.405 J-65.991 E.15614
G1 X139.693 Y165.381 E.02216
M204 S10000
G1 X140.051 Y165.527 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X139.869 Y165.774 E.01259
G1 X139.951 Y165.946 E.00785
G1 X139.987 Y166.301 E.01463
G3 X139.809 Y166.844 I-1.186 J-.087 E.02372
G1 X139.527 Y167.124 E.01631
G1 X139.418 Y167.178 E.005
G1 X139.425 Y167.488 E.01273
G1 X141.808 Y167.489 E.09784
G1 X141.795 Y166.742 E.03066
G1 X140.1 Y165.561 E.08483
M204 S10000
G1 X140.341 Y166.168 F42000
G1 F7144.644
M204 S6000
G1 X140.303 Y166.586 E.01725
G1 X140.176 Y166.929 E.01501
G1 X140.036 Y167.128 E.01
G1 X141.442 Y167.129 E.0577
G1 X141.439 Y166.932 E.00807
G1 X140.39 Y166.202 E.05245
M204 S10000
G1 X140.633 Y166.744 F42000
; LINE_WIDTH: 0.396188
G1 F7650.785
M204 S6000
G1 X140.57 Y166.781 E.00279
G1 X140.617 Y166.808 E.0021
M204 S10000
G1 X139.048 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
M204 S6000
G1 X138.055 Y167.42 E.05569
G3 X135.776 Y167.423 I-1.464 J-199.159 E.12775
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X134.445 Y167.419 E.07096
; WIPE_START
G1 X135.776 Y167.423 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.436 Y159.799 Z1.16 F42000
G1 X135.15 Y153.39 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X135.15 Y153.461 E.00317
G1 X135.835 Y154.145 E.04305
G1 X142.186 Y154.211 E.28254
G3 X142.184 Y155.017 I-15.111 J.356 E.03589
G3 X136.255 Y155.019 I-3.021 J-188.976 E.26373
G3 X135.206 Y154.692 I.021 J-1.911 E.04958
G3 X134.332 Y153.609 I.736 J-1.489 E.06385
G3 X134.25 Y151.503 I14.647 J-1.627 E.09384
G3 X134.293 Y146.709 I129.901 J-1.208 E.21328
G3 X134.393 Y146.309 I.948 J.024 E.01846
G3 X135.745 Y145.15 I1.812 J.746 E.08223
G3 X136.775 Y145.036 I.879 J3.22 E.04625
G3 X140.842 Y145.025 I2.767 J273.526 E.18094
G3 X142.139 Y145.047 I-.213 J50.424 E.05769
G3 X142.148 Y145.923 I-18.081 J.618 E.03897
G3 X135.77 Y145.947 I-4.327 J-306.234 E.2837
G1 X135.106 Y146.712 E.04507
G1 X135.15 Y153.33 E.29437
M204 S10000
G1 X135.524 Y153.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.992 Y153.772 E.02714
G1 X142.555 Y153.839 E.26951
G3 X142.535 Y155.39 I-13.43 J.6 E.06371
G3 X136.237 Y155.393 I-3.256 J-197.89 E.25861
G3 X135.018 Y155.016 I.043 J-2.297 E.0531
G3 X133.963 Y153.679 I.921 J-1.811 E.07216
G3 X133.875 Y151.504 I14.829 J-1.692 E.08943
G3 X133.919 Y146.684 I129.331 J-1.213 E.19792
G3 X134.117 Y146.011 I1.506 J.077 E.0291
G3 X135.799 Y144.746 I2.141 J1.097 E.0894
G3 X137.211 Y144.653 I1.194 J7.322 E.0582
G3 X140.846 Y144.65 I2.029 J286.473 E.14922
G3 X142.5 Y144.688 I-.008 J36.677 E.06795
G3 X142.503 Y146.284 I-14.086 J.828 E.06558
G3 X135.941 Y146.322 I-4.545 J-220.55 E.26947
G1 X135.482 Y146.851 E.02877
G1 X135.524 Y153.245 E.26252
M204 S10000
G1 X134.725 Y153.357 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.504165
G1 F5790.505
M204 S6000
G2 X134.848 Y153.767 I.598 J.044 E.02218
; LINE_WIDTH: 0.557514
G1 F5169.477
G2 X134.985 Y153.937 I1.928 J-1.411 E.0124
; LINE_WIDTH: 0.575695
G1 F4987.195
G2 X135.257 Y154.195 I2.828 J-2.708 E.02205
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X135.421 Y154.328 E.01147
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X135.537 Y154.415 E.00719
; LINE_WIDTH: 0.446493
G1 F6654.752
G2 X135.819 Y154.545 I.428 J-.561 E.01379
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X135.954 Y154.569 E.00676
; LINE_WIDTH: 0.541749
G1 F5338.669
G2 X138.496 Y154.605 I1.926 J-46.083 E.13971
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X140.245 Y154.609 E.09227
; LINE_WIDTH: 0.49629
G1 F5895.049
G1 X141.994 Y154.613 E.08705
; WIPE_START
G1 X140.245 Y154.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.725 Y153.357 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.549563
G1 F5253.444
M204 S6000
G3 X134.686 Y148.928 I159.616 J-3.635 E.24735
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X134.693 Y147.031 I145.437 J-.361 E.10009
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X134.699 Y146.735 E.01435
G3 X134.752 Y146.502 I.409 J-.03 E.01171
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X134.838 Y146.367 I2.594 J1.55 E.00815
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X134.9 Y146.277 E.00594
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X135.129 Y145.994 I2.914 J2.127 E.02125
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X135.327 Y145.803 I2.171 J2.05 E.01564
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X135.407 Y145.735 E.00539
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X135.965 Y145.294 E.03357
M204 S10000
G1 X135.542 Y145.631 F42000
; LINE_WIDTH: 0.423704
G1 F7071.826
M204 S6000
G3 X135.744 Y145.559 I.257 J.401 E.00899
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X135.863 Y145.54 E.00556
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X135.99 Y145.523 E.00645
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X136.203 Y145.506 I.331 J2.833 E.01163
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X139.864 Y145.484 I2.426 J98.82 E.22178
G3 X140.837 Y145.484 I.47 J142.627 E.05894
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X141.701 Y145.486 I.581 J-74.02 E.05037
G1 X141.953 Y145.728 E.02038
; WIPE_START
G1 X141.701 Y145.486 E-.21894
G1 X140.837 Y145.484 E-.54106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.716 Y138.519 Z1.16 F42000
G1 X135.774 Y134.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X135.667 Y134.247 E.00553
G2 X135.237 Y134.929 I.517 J.803 E.03704
G2 X135.137 Y136.566 I9.465 J1.398 E.07303
G1 X135.116 Y142.434 E.26104
G1 X134.28 Y142.418 E.03724
G3 X134.266 Y135.44 I507.954 J-4.501 E.31038
G3 X134.354 Y134.56 I3.431 J-.102 E.03946
G3 X135.199 Y133.527 I1.642 J.481 E.06103
G3 X136.552 Y133.24 I1.133 J2.012 E.06245
G3 X137.51 Y133.408 I.122 J2.124 E.04364
G3 X138.526 Y134.428 I-1.042 J2.054 E.06513
G3 X138.663 Y135.892 I-6.916 J1.387 E.06551
G3 X138.698 Y141.477 I-197.192 J4.024 E.24845
G2 X139.246 Y141.84 I3.362 J-4.476 E.02926
G2 X141.036 Y141.578 I.696 J-1.49 E.08521
G1 X141.215 Y141.323 E.01385
G2 X141.274 Y138.024 I-88.433 J-3.229 E.14681
G3 X141.305 Y133.585 I184.331 J-.91 E.19746
G3 X142.147 Y133.582 I.474 J14.099 E.03743
G3 X142.11 Y141.343 I-166.444 J3.094 E.34529
G3 X141.386 Y142.425 I-1.747 J-.386 E.05926
G3 X139.881 Y142.852 I-1.328 J-1.817 E.07106
G3 X137.916 Y141.703 I-.039 J-2.188 E.10649
G3 X137.798 Y140.272 I6.552 J-1.26 E.06397
G2 X137.748 Y135.415 I-1247.715 J10.507 E.21608
G2 X137.606 Y134.628 I-1.994 J-.048 E.03582
G2 X136.629 Y134.108 I-.951 J.611 E.05147
G2 X136.002 Y134.112 I-.274 J6.121 E.02786
G2 X135.83 Y134.163 I.182 J.938 E.008
M204 S10000
G1 X135.943 Y134.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.603 Y135.011 I.239 J.529 E.02562
M73 P77 R2
G2 X135.512 Y136.569 I9.204 J1.319 E.06417
G1 X135.49 Y142.817 E.25652
G1 X133.906 Y142.786 E.06503
G3 X133.891 Y135.431 I527.43 J-4.797 E.30198
G3 X133.998 Y134.442 I3.73 J-.097 E.04099
G3 X135.005 Y133.206 I1.987 J.591 E.0672
G3 X136.563 Y132.865 I1.324 J2.325 E.06647
G3 X137.44 Y132.971 I.008 J3.618 E.03638
G3 X138.884 Y134.317 I-.877 J2.389 E.08325
G3 X139.038 Y135.881 I-7.11 J1.487 E.06463
G3 X139.072 Y141.277 I-191.103 J3.92 E.22158
G2 X140.653 Y141.415 I.884 J-1.002 E.06974
G2 X140.847 Y141.195 I-.356 J-.51 E.01215
G2 X140.913 Y134.334 I-267.548 J-6.006 E.28173
G3 X140.949 Y133.241 I19.227 J.088 E.04494
G3 X142.51 Y133.246 I.757 J7.182 E.06424
G3 X142.482 Y141.4 I-153.029 J3.539 E.33487
G3 X141.618 Y142.72 I-2.121 J-.445 E.06629
G3 X139.878 Y143.227 I-1.56 J-2.118 E.07594
G3 X139.359 Y143.177 I.206 J-4.837 E.02143
G3 X137.582 Y141.881 I.529 J-2.593 E.09314
G3 X137.439 Y140.805 I3.266 J-.982 E.04476
G3 X137.386 Y135.95 I171.334 J-4.265 E.19938
G2 X137.312 Y134.909 I-5.726 J-.113 E.04289
G2 X136.744 Y134.496 I-.586 J.209 E.03066
G2 X136.066 Y134.484 I-.428 J4.936 E.02783
G2 X135.999 Y134.502 I.116 J.568 E.00285
M204 S10000
G1 X136.084 Y133.679 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
M204 S6000
G1 X135.953 Y133.691 E.00696
G2 X135.169 Y134.088 I.236 J1.441 E.04733
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X134.919 Y134.415 I.788 J.861 E.02467
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X134.715 Y135.503 I2.438 J1.02 E.06876
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X134.709 Y135.694 E.01068
G2 X134.695 Y138.645 I107.849 J1.982 E.1648
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X134.698 Y142.231 E.19015
; WIPE_START
G1 X134.697 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.084 Y133.679 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
M204 S6000
G3 X136.539 Y133.673 I.269 J3.422 E.02517
G3 X137.879 Y134.246 I.109 J1.597 E.08354
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X138.065 Y134.529 I-.781 J.717 E.02004
G1 X138.142 Y134.822 E.01782
G1 X138.187 Y135.269 E.02646
G3 X138.254 Y140.771 I-234.918 J5.615 E.32385
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X138.276 Y141.358 I14.528 J-.241 E.03189
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X138.29 Y141.526 E.00843
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X138.495 Y141.826 I.384 J-.042 E.01708
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X138.602 Y141.917 E.00694
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X138.697 Y141.993 E.00635
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X139.677 Y142.409 I1.157 J-1.365 E.06114
G1 X139.804 Y142.419 E.00721
G2 X141.312 Y141.913 I.211 J-1.871 E.09293
G2 X141.666 Y141.275 I-.682 J-.796 E.04215
G2 X141.725 Y133.774 I-226.04 J-5.516 E.42455
; WIPE_START
G1 X141.722 Y135.774 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.326 Y128.151 Z1.16 F42000
G1 X141.189 Y125.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X141.202 Y125.461 E.00168
G2 X141.238 Y125.306 I-.681 J-.24 E.00706
G2 X141.293 Y121.881 I-222.109 J-5.29 E.15239
G3 X142.111 Y121.869 I.6 J13.182 E.03639
G3 X142.141 Y131.069 I-363.455 J5.817 E.40922
G3 X141.292 Y131.072 I-.472 J-12.005 E.03778
G3 X141.272 Y128.657 I63.038 J-1.745 E.10744
G2 X141.225 Y127.608 I-9.038 J-.122 E.04672
G2 X140.932 Y127.073 I-.84 J.112 E.02775
G1 X140.677 Y126.974 E.01217
G2 X136.715 Y126.921 I-3.603 J120.385 E.1763
G3 X134.252 Y126.878 I.952 J-126.704 E.10957
G3 X134.253 Y126.026 I20.983 J-.383 E.03791
G3 X138.806 Y126 I3.393 J200.086 E.20253
G2 X140.655 Y125.93 I.362 J-14.833 E.08234
G2 X141.13 Y125.607 I-.134 J-.71 E.02629
G1 X141.161 Y125.549 E.00292
M204 S10000
G1 X140.846 Y125.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.865 Y125.258 I-.322 J-.117 E.00351
G2 X140.925 Y121.684 I-431.298 J-9.119 E.14678
G3 X140.939 Y121.534 I1.876 J.096 E.00618
G3 X142.043 Y121.494 I.875 J9.004 E.0454
G3 X142.465 Y121.512 I-.103 J7.252 E.01733
G3 X142.523 Y124.743 I-82.114 J3.097 E.13267
G3 X142.508 Y131.413 I-272.898 J2.734 E.27387
G3 X140.943 Y131.418 I-.807 J-8.179 E.06438
G3 X140.907 Y130.663 I7.988 J-.754 E.03105
G2 X140.875 Y127.88 I-55.971 J-.737 E.11428
G2 X140.793 Y127.477 I-.984 J-.01 E.01699
G2 X140.599 Y127.346 I-.229 J.129 E.00998
G2 X136.711 Y127.296 I-3.608 J128.888 E.15964
G3 X133.9 Y127.239 I1.127 J-126.045 E.11547
G3 X133.897 Y125.659 I13.82 J-.815 E.06491
G3 X138.803 Y125.626 I4.025 J230.856 E.20147
G2 X140.571 Y125.563 I.351 J-15.171 E.07265
G2 X140.82 Y125.396 I-.047 J-.339 E.01278
M204 S10000
G1 X141.692 Y125.407 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
M204 S6000
G1 X141.706 Y123.223 E.12206
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X141.702 Y122.287 I106.745 J-.909 E.04914
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X141.916 Y122.064 E.01518
; WIPE_START
G1 X141.702 Y122.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.082 Y126.086 Z1.16 F42000
G1 X134.445 Y126.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
M204 S6000
G1 X135.431 Y126.457 E.0553
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X138.808 Y126.468 I5.158 J-1097.004 E.20317
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X140.217 Y126.467 E.09015
M204 S10000
G1 X140.592 Y126.595 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X140.783 Y126.613 E.00787
G1 X141.179 Y126.787 E.01774
G1 X141.438 Y127.085 E.01623
G1 X141.481 Y127.179 E.00424
G1 X141.783 Y127.165 E.01239
G1 X141.775 Y125.784 E.0567
G1 X141.452 Y125.777 E.01327
G1 X141.279 Y126.018 E.01218
G1 X140.995 Y126.214 E.01418
G1 X140.591 Y126.305 E.01702
G1 X140.592 Y126.535 E.00943
M204 S10000
G1 X141.409 Y126.392 F42000
; LINE_WIDTH: 0.494249
G1 F5922.767
M204 S6000
G2 X141.403 Y126.486 I-.027 J.046 E.01075
M204 S10000
G1 X141.691 Y127.545 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
M204 S6000
G1 X141.715 Y128.653 E.06273
G3 X141.714 Y130.645 I-365.053 J.826 E.11278
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X141.483 Y130.878 E.01758
; WIPE_START
G1 X141.714 Y130.645 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.446 Y123.017 Z1.16 F42000
G1 X141.03 Y111.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X141 Y111.142 E.00175
G2 X140.12 Y110.766 I-.846 J.763 E.04394
G2 X139.677 Y110.756 I-.354 J5.881 E.01969
G1 X138.116 Y110.799 E.06948
G1 X138.077 Y115.744 E.21998
G3 X138.061 Y116.394 I-21.223 J-.218 E.02893
G3 X137.166 Y116.368 I-.174 J-9.389 E.03982
G3 X137.188 Y112.743 I550.038 J1.427 E.16124
G2 X137.157 Y111.6 I-16.18 J-.133 E.05088
G1 X136.978 Y110.796 E.03664
G3 X134.259 Y110.716 I4.245 J-190.923 E.12101
G3 X134.27 Y109.911 I31.488 J.033 E.0358
G3 X139.527 Y109.898 I3.3 J266.573 E.23384
G3 X140.836 Y110.012 I.138 J6.018 E.05859
G3 X142.146 Y111.758 I-.523 J1.757 E.10402
G3 X142.148 Y117.925 I-98.644 J3.107 E.27436
G3 X141.888 Y118.897 I-1.778 J.045 E.04537
G3 X140.526 Y119.795 I-1.954 J-1.484 E.07397
G3 X137.49 Y119.83 I-2.057 J-46.276 E.13509
G1 X134.27 Y119.811 E.14321
G1 X134.254 Y118.978 E.03704
G2 X140.081 Y118.917 I.836 J-198.271 E.25925
G2 X140.848 Y118.708 I.032 J-1.391 E.03584
G2 X141.233 Y117.983 I-.603 J-.785 E.03764
G2 X141.275 Y116.29 I-25.853 J-1.485 E.07533
G2 X141.244 Y111.865 I-100.14 J-1.505 E.19688
G2 X141.127 Y111.311 I-1.678 J.065 E.02528
G1 X141.063 Y111.217 E.00504
M204 S10000
G1 X140.725 Y111.385 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.096 Y111.14 I-.646 J.728 E.02829
G2 X139.682 Y111.131 I-.331 J5.508 E.01702
G1 X138.488 Y111.163 E.04903
G3 X138.446 Y116.108 I-229.37 J.496 E.20302
G3 X138.411 Y116.734 I-5.826 J-.003 E.02576
G3 X136.804 Y116.7 I-.661 J-6.741 E.06616
G3 X136.813 Y112.744 I103.805 J-1.757 E.16242
G2 X136.785 Y111.654 I-16.082 J-.129 E.04479
G1 X136.675 Y111.162 E.02067
G3 X133.883 Y111.078 I4.91 J-208.862 E.11471
G3 X133.902 Y109.539 I61.525 J.021 E.0632
G3 X139.535 Y109.523 I3.594 J283.119 E.23126
G3 X140.944 Y109.652 I.137 J6.257 E.05825
G3 X142.521 Y111.74 I-.632 J2.116 E.11497
G3 X142.522 Y117.95 I-98.872 J3.123 E.255
G3 X142.109 Y119.226 I-2.069 J.036 E.05611
G3 X140.674 Y120.156 I-2.247 J-1.894 E.07126
G3 X137.489 Y120.205 I-2.222 J-41.407 E.13081
G1 X133.903 Y120.183 E.14725
G1 X133.871 Y118.606 E.06479
G2 X139.857 Y118.553 I.854 J-243.189 E.24577
G2 X140.536 Y118.458 I.063 J-2.02 E.0283
G2 X140.861 Y117.936 I-.284 J-.539 E.02645
G2 X140.9 Y116.29 I-26.154 J-1.445 E.06763
G2 X140.87 Y111.895 I-101.673 J-1.5 E.18047
G2 X140.754 Y111.437 I-.993 J.007 E.01957
M204 S10000
G1 X141.127 Y110.651 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
M204 S6000
G3 X141.696 Y111.834 I-.814 J1.119 E.08164
G1 X141.706 Y112.059 E.01345
G3 X141.696 Y117.896 I-101.795 J2.736 E.34841
G1 X141.682 Y118.049 E.0092
G3 X141.271 Y118.925 I-1.234 J-.044 E.05936
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X141.261 Y118.936 E.00083
G3 X140.041 Y119.368 I-1.121 J-1.228 E.07575
G1 X139.884 Y119.373 E.00893
G3 X138.446 Y119.391 I-1.518 J-65.058 E.08199
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X134.457 Y119.394 I-2.619 J-719.618 E.21384
; WIPE_START
G1 X136.457 Y119.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.616 Y116.195 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
M204 S6000
G3 X137.642 Y113.299 I489.208 J2.962 E.17375
G1 X137.638 Y111.593 E.10239
M204 S10000
G1 X137.501 Y110.327 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
M204 S6000
G1 X137.502 Y110.828 E.02649
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X137.501 Y110.898 E.00395
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X137.5 Y110.969 E.00429
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X137.517 Y111.001 E.00237
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X137.535 Y111.033 E.00252
M204 S10000
G1 X137.925 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
M204 S6000
G3 X139.518 Y110.329 I2.295 J129.717 E.09053
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X139.917 Y110.334 E.02149
G3 X141.009 Y110.575 I.116 J2.068 E.06096
G1 X141.127 Y110.651 E.00754
M204 S10000
G1 X137.077 Y110.346 F42000
; LINE_WIDTH: 0.546922
G1 F5281.948
M204 S6000
G1 X135.768 Y110.331 E.07275
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X134.458 Y110.317 E.0671
; WIPE_START
G1 X135.768 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.617 Y102.7 Z1.16 F42000
G1 X135.568 Y100.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X136.562 Y101.322 E.06462
G2 X139.497 Y103.992 I52.429 J-54.693 E.17651
G3 X142.188 Y106.413 I-170.214 J191.92 E.16102
G3 X142.168 Y107.734 I-104.989 J-.94 E.05875
G3 X134.198 Y107.743 I-4.756 J-646.551 E.35452
G3 X134.207 Y106.813 I13.358 J-.337 E.04139
G3 X138.257 Y106.792 I3.029 J194.358 E.18012
G2 X139.69 Y106.71 I.248 J-8.212 E.06393
G1 X139.831 Y106.658 E.00671
G1 X140.513 Y106.197 E.03661
G2 X139.271 Y104.944 I-9.327 J8.008 E.07855
G3 X134.198 Y100.397 I385.239 J-434.778 E.30303
G3 X134.205 Y99.133 I23.066 J-.519 E.05623
G3 X140.921 Y99.095 I5.121 J317.268 E.29878
G3 X142.23 Y99.119 I-.016 J37.102 E.05822
G3 X142.25 Y100.1 I-9.397 J.683 E.04367
G2 X137.255 Y100.148 I13.314 J1658.362 E.22221
G2 X135.628 Y100.257 I1.096 J28.375 E.07253
M204 S10000
G1 X136.38 Y100.58 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.749 Y102.831 I23.246 J-22.101 E.13423
G3 X142.566 Y106.25 I-232.379 J263.166 E.2104
G3 X142.536 Y108.107 I-148.094 J-1.41 E.07623
G3 X133.84 Y108.109 I-4.459 J-502.798 E.35708
G3 X133.853 Y106.448 I22.096 J-.653 E.06822
G3 X138.975 Y106.406 I4.506 J238.501 E.21032
G2 X139.659 Y106.322 I.032 J-2.561 E.02839
G1 X139.943 Y106.13 E.01408
G2 X139.019 Y105.222 I-7.317 J6.529 E.05323
G3 X133.823 Y100.557 I302.231 J-341.854 E.28669
G3 X133.853 Y98.772 I17.451 J-.606 E.07337
G3 X140.923 Y98.72 I5.189 J228.924 E.29032
G3 X142.565 Y98.766 I.34 J17.451 E.06748
G3 X142.592 Y100.445 I-7.415 J.958 E.06909
G3 X141.412 Y100.489 I-.874 J-7.447 E.04854
G2 X137.045 Y100.532 I-.667 J156.379 E.1793
G1 X136.44 Y100.576 E.02494
M204 S10000
G1 X135.884 Y101.286 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
M204 S6000
G1 X136.237 Y101.634 E.02994
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X139.558 Y104.624 I116.807 J-126.382 E.24242
G1 X140.067 Y105.087 E.03728
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X140.628 Y105.631 I-12.025 J12.963 E.04488
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X140.983 Y105.983 E.03118
M204 S10000
G1 X139.705 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X141.799 Y107.36 E.08598
G1 X141.811 Y106.578 E.03213
G1 X141.34 Y106.155 E.02599
G1 X140.899 Y106.601 E.02575
G1 X140.728 Y106.649 E.00729
G1 X140.59 Y106.597 E.00603
G1 X140.016 Y106.986 E.02848
G1 X139.698 Y107.078 E.0136
G1 X139.704 Y107.31 E.00953
M204 S10000
G1 X140.641 Y107.002 F42000
; LINE_WIDTH: 0.423508
G1 F7075.639
M204 S6000
G1 X140.807 Y107.004 E.00688
M204 S10000
G1 X140.867 Y107.005 F42000
; LINE_WIDTH: 0.406861
G1 F7415.318
M204 S6000
G1 X141.168 Y107.016 E.01193
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X141.47 Y107.027 E.01079
G1 X141.473 Y106.778 E.00894
G2 X141.354 Y106.617 I-.236 J.051 E.00739
G1 X141.138 Y106.838 E.01103
; LINE_WIDTH: 0.396754
G1 F7637.945
G1 X140.918 Y106.974 E.00995
M204 S10000
G1 X139.327 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
M204 S6000
G1 X138.258 Y107.272 E.06933
G2 X135.769 Y107.274 I-.801 J441.112 E.16136
G2 X134.395 Y107.278 I-.353 J138.553 E.08909
; WIPE_START
G1 X135.769 Y107.274 E-.52215
G1 X136.395 Y107.274 E-.23785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.884 Y101.286 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
M204 S6000
G1 X135.534 Y100.946 E.03108
M204 S10000
G1 X135.173 Y100.809 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
G1 F7939.26
M204 S6000
G1 X135.387 Y100.588 E.01137
G1 X135.023 Y100.211 E.01937
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X134.957 Y100.096 E.00536
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X134.976 Y100.014 E.00378
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X134.994 Y99.931 E.00407
G1 X135.131 Y99.902 E.00678
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X136.891 Y99.805 E.07383
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X137.245 Y99.787 E.01296
G3 X141.902 Y99.757 I9.125 J1054.978 E.17
G1 X141.896 Y99.459 E.01089
G1 X140.919 Y99.447 E.03565
G2 X136.877 Y99.462 I1.138 J844.588 E.14759
; LINE_WIDTH: 0.427348
G1 F7001.657
M73 P78 R2
G1 X135.115 Y99.511 E.07383
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X134.868 Y99.528 E.01145
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X134.621 Y99.546 E.01181
G1 X134.582 Y100.094 E.02622
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X134.583 Y100.229 E.00581
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X134.82 Y100.467 E.0139
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X135.129 Y100.769 I3.692 J-3.462 E.01627
; WIPE_START
G1 X134.82 Y100.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.202 Y92.844 Z1.16 F42000
G1 X135.372 Y89.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X135.296 Y89.562 E.00676
G2 X135.191 Y89.97 I.791 J.421 E.01892
G2 X135.232 Y94.812 I71.105 J1.831 E.21544
G2 X135.749 Y95.865 I1.238 J.045 E.05437
G2 X136.547 Y96.068 I.893 J-1.84 E.03688
G2 X139.902 Y96.081 I1.819 J-34.674 E.14928
G2 X140.959 Y95.59 I-.008 J-1.4 E.0535
G2 X141.144 Y95.068 I-.909 J-.616 E.02488
G2 X141.212 Y92.744 I-28.998 J-2.002 E.10348
G1 X141.255 Y88.162 E.20379
G1 X142.159 Y88.162 E.04024
G3 X142.138 Y95.394 I-238.073 J2.92 E.32168
G3 X140.876 Y96.875 I-2.547 J-.892 E.08856
G3 X139.879 Y97.052 I-1.055 J-3.041 E.04524
G3 X136.111 Y97.016 I-1.571 J-32.653 E.16773
G3 X134.827 Y96.304 I.229 J-1.926 E.06697
G3 X134.252 Y94.977 I1.467 J-1.422 E.06574
G3 X134.207 Y92.293 I34.1 J-1.918 E.11943
G1 X134.229 Y88.158 E.18395
G3 X138.595 Y88.143 I3.039 J242.645 E.1942
G1 X138.716 Y88.147 E.00536
G3 X138.726 Y92.01 I-88.309 J2.168 E.17185
G3 X137.738 Y91.976 I.262 J-22.511 E.04398
G2 X137.676 Y89.879 I-33.386 J-.057 E.09333
G2 X137.458 Y89.282 I-1.237 J.112 E.02861
G2 X136.435 Y89.097 I-.831 J1.669 E.04689
G2 X135.536 Y89.276 I-.084 J1.921 E.04118
G2 X135.416 Y89.389 I.552 J.706 E.00733
M204 S10000
G1 X135.685 Y89.651 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X135.565 Y90.001 I.404 J.334 E.01554
G2 X135.606 Y94.784 I71.116 J1.79 E.1964
G2 X135.865 Y95.482 I.957 J.042 E.03141
G2 X136.576 Y95.694 I.674 J-.96 E.031
G2 X139.866 Y95.708 I1.794 J-34.451 E.13512
G2 X140.658 Y95.363 I-.013 J-1.112 E.03643
G2 X140.772 Y95.021 I-.582 J-.384 E.015
G2 X140.837 Y92.739 I-28.895 J-1.961 E.09374
G1 X140.883 Y87.787 E.20333
G1 X142.533 Y87.787 E.06773
G3 X142.507 Y95.468 I-239.153 J3.044 E.31537
G3 X141.088 Y97.192 I-2.955 J-.987 E.09379
G3 X139.901 Y97.427 I-1.185 J-2.874 E.05
G3 X136.064 Y97.388 I-1.59 J-32.963 E.15765
G3 X134.548 Y96.555 I.265 J-2.278 E.07281
G3 X133.879 Y95.01 I1.744 J-1.673 E.07062
G3 X133.832 Y92.293 I34.395 J-1.95 E.11161
G1 X133.857 Y87.786 E.18506
G3 X138.603 Y87.768 I3.368 J260.389 E.19487
G3 X139.067 Y87.808 I.022 J2.477 E.01916
G3 X139.118 Y91.22 I-42.344 J2.346 E.14018
G3 X139.065 Y92.383 I-10.19 J.116 E.04782
G3 X137.368 Y92.336 I-.076 J-28.108 E.06971
G2 X137.303 Y89.921 I-38.033 J-.176 E.09922
G2 X137.192 Y89.573 I-.766 J.052 E.01514
G2 X136.445 Y89.471 I-.566 J1.36 E.03129
G2 X135.743 Y89.592 I-.087 J1.603 E.02951
G2 X135.726 Y89.607 I.346 J.394 E.00093
; WIPE_START
M204 S6000
G1 X135.627 Y89.726 E-.05886
G1 X135.593 Y89.819 E-.03768
G1 X135.565 Y90.001 E-.07005
G1 X135.544 Y90.687 E-.26076
G1 X135.546 Y91.556 E-.33017
G1 X135.546 Y91.563 E-.00247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.697 Y89.958 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
M204 S6000
G1 X134.691 Y91.563 E.10639
G2 X134.746 Y94.934 I54.656 J.795 E.22358
G1 X134.772 Y95.162 E.0152
G2 X135.723 Y96.405 I1.722 J-.332 E.10757
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X135.778 Y96.429 E.00403
G2 X137.106 Y96.583 I1.197 J-4.518 E.09034
G2 X140.046 Y96.553 I1.138 J-32.466 E.19798
G1 X140.198 Y96.535 E.01028
G2 X141.088 Y96.138 I-.116 J-1.459 E.06687
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X141.31 Y95.906 I-1.353 J-1.515 E.0206
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X141.304 Y95.883 E.00144
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X141.27 Y95.776 E.00628
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X141.236 Y95.669 E.00571
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X141.203 Y95.562 E.00514
M204 S10000
G1 X141.428 Y95.178 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
M204 S6000
G1 X141.552 Y95.162 E.00495
G1 X141.705 Y95.238 E.00673
M204 S10000
G1 X141.659 Y94.884 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
M204 S6000
G2 X141.689 Y92.75 I-84.506 J-2.275 E.1406
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X141.707 Y88.357 I-775.829 J-5.261 E.27346
; WIPE_START
G1 X141.699 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.929 Y91.714 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
M204 S6000
G1 X138.456 Y91.723 E.00969
G1 X138.538 Y91.809 E.00218
M204 S10000
G1 X138.383 Y91.26 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
M204 S6000
G2 X138.352 Y88.518 I-106.425 J-.172 E.10782
G1 X137.386 Y88.522 E.03796
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X137.299 Y88.543 E.00393
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X137.211 Y88.565 E.00437
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X137.123 Y88.587 E.0048
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X137.036 Y88.608 E.00524
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X136.948 Y88.63 E.00568
G1 X137.092 Y88.697 E.01002
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X137.237 Y88.764 E.00925
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X137.381 Y88.831 E.00848
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X137.526 Y88.899 E.0077
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X137.753 Y89.042 I-.114 J.434 E.01135
G1 X137.963 Y89.43 E.01834
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X138.048 Y90.009 E.02194
G3 X138.075 Y91.255 I-203.786 J5.075 E.04671
G1 X138.323 Y91.259 E.00928
M204 S10000
G1 X138.044 Y88.818 F42000
; LINE_WIDTH: 0.362949
G1 F8490.486
M204 S6000
G1 X137.987 Y88.851 E.00226
G1 X138.025 Y88.873 E.0015
M204 S10000
G1 X136.465 Y88.635 F42000
; LINE_WIDTH: 0.635768
G1 F4466.768
M204 S6000
G1 X136.888 Y88.63 E.02778
M204 S10000
G1 X134.952 Y88.829 F42000
; LINE_WIDTH: 0.362009
G1 F8516.92
M204 S6000
G1 X134.895 Y88.861 E.00225
G1 X134.933 Y88.883 E.00148
M204 S10000
G1 X134.892 Y89.583 F42000
; LINE_WIDTH: 0.419499
G1 F7154.583
M204 S6000
G1 X134.963 Y89.372 E.00911
G3 X135.572 Y88.847 I1.014 J.56 E.0337
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X135.821 Y88.818 E.00972
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X136.069 Y88.788 E.00884
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X136.135 Y88.763 E.00257
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X136.201 Y88.737 E.00295
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X136.267 Y88.711 E.00333
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X136.333 Y88.686 E.00372
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X136.399 Y88.66 E.0041
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X136.465 Y88.635 E.00448
G1 X136.398 Y88.611 E.00448
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X136.331 Y88.588 E.0041
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X136.265 Y88.564 E.00372
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X136.198 Y88.541 E.00333
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X136.131 Y88.517 E.00295
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X136.064 Y88.494 E.00262
G1 X135.534 Y88.526 E.01965
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X134.603 Y88.532 I-1.236 J-132.775 E.03818
G1 X134.6 Y89.583 E.04311
G1 X134.832 Y89.583 E.00953
; OBJECT_ID: 169
; WIPE_START
G1 X134.6 Y89.583 E-.08836
G1 X134.603 Y88.532 E-.39958
G1 X135.319 Y88.527 E-.27206
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
M204 S10000
G1 X134.676 Y96.133 Z1.16 F42000
G1 X129.395 Y158.573 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X129.387 Y158.536 E.00165
G1 X129.22 Y158.278 E.01368
G2 X128.491 Y158.108 I-.643 J1.106 E.0338
G2 X124.023 Y158.06 I-7.769 J518.454 E.19877
G3 X124.027 Y157.214 I17.002 J-.341 E.03764
G3 X131.967 Y157.219 I3.7 J436.266 E.35321
G3 X131.918 Y158.513 I-23.469 J-.255 E.05762
G2 X127.045 Y161.958 I89.16 J131.272 E.26543
G2 X126.944 Y162.94 I.458 J.544 E.04858
G2 X127.634 Y163.54 I2.68 J-2.388 E.04078
G2 X131.941 Y166.544 I307.806 J-436.675 E.23357
G3 X131.962 Y167.864 I-21.622 J1.018 E.05871
G3 X124.025 Y167.839 I-2.224 J-554.855 E.35307
G3 X124.025 Y166.996 I24.634 J-.418 E.03749
G2 X128.65 Y166.949 I1.244 J-105.817 E.20572
G2 X129.115 Y166.798 I-.093 J-1.076 E.02197
G1 X129.284 Y166.615 E.01106
G2 X129.077 Y165.664 I-.626 J-.362 E.04749
G1 X128.892 Y165.522 E.01037
G2 X124.649 Y162.517 I-458.307 J642.503 E.2313
G2 X128.979 Y159.451 I-176.431 J-253.801 E.23598
G1 X129.235 Y159.25 E.01449
G1 X129.478 Y158.945 E.01734
G1 X129.408 Y158.631 E.0143
M204 S10000
G1 X129.036 Y158.683 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.964 Y158.572 I-.393 J.175 E.00547
G2 X128.765 Y158.501 I-.251 J.386 E.00873
G2 X125.604 Y158.453 I-2.407 J55.548 E.12982
G3 X123.664 Y158.425 I.137 J-75.307 E.07966
G3 X123.67 Y156.85 I19.81 J-.719 E.06469
G3 X132.321 Y156.845 I4.498 J324.765 E.35522
G3 X132.283 Y158.718 I-15.49 J.624 E.07694
G2 X127.294 Y162.24 I92.34 J136.1 E.25077
G2 X127.249 Y162.721 I.216 J.263 E.02209
G2 X127.855 Y163.237 I2.404 J-2.208 E.03272
G3 X132.288 Y166.335 I-337.987 J488.436 E.22208
G3 X132.306 Y168.238 I-11.207 J1.059 E.07827
G3 X123.666 Y168.206 I-2.432 J-496.317 E.35479
G3 X123.665 Y166.622 I22.473 J-.808 E.06503
G2 X128.616 Y166.575 I1.283 J-126.428 E.20331
G2 X128.994 Y166.336 I.017 J-.392 E.01956
G2 X128.834 Y165.95 I-.359 J-.077 E.01825
G1 X128.669 Y165.824 E.0085
G3 X124.133 Y162.602 I378.383 J-537.536 E.22848
G1 X124.022 Y162.514 E.00582
G3 X124.216 Y162.364 I1.645 J1.939 E.01008
G2 X128.751 Y159.153 I-194.962 J-280.178 E.22815
G2 X129.073 Y158.852 I-.471 J-.825 E.01827
G2 X129.056 Y158.74 I-.43 J.007 E.00467
M204 S10000
G1 X129.543 Y159.6 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
M204 S6000
G1 X126.697 Y161.642 E.20176
M204 S10000
G1 X126.338 Y161.785 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X125.298 Y162.518 E.05224
G1 X126.321 Y163.245 E.05152
G3 X126.373 Y162.937 I.445 J-.083 E.0131
G1 X126.497 Y162.88 E.00561
G1 X126.413 Y162.44 E.01838
G1 X126.474 Y162.13 E.01299
G1 X126.522 Y162.038 E.00423
G1 X126.373 Y161.833 E.0104
M204 S10000
G1 X126.033 Y162.47 F42000
; LINE_WIDTH: 0.516989
G1 F5627.99
M204 S6000
G2 X126.03 Y162.569 I-.029 J.049 E.01219
M204 S10000
G1 X126.953 Y163.243 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
M204 S6000
G1 X126.959 Y163.549 E.01518
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X126.96 Y163.573 E.00125
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X126.96 Y163.596 E.00134
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X129.159 Y165.154 I48.405 J-65.991 E.15614
G1 X129.466 Y165.381 E.02216
M204 S10000
G1 X129.824 Y165.527 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X129.642 Y165.774 E.01259
G1 X129.725 Y165.946 E.00785
G1 X129.761 Y166.301 E.01463
G3 X129.583 Y166.844 I-1.186 J-.087 E.02372
G1 X129.301 Y167.124 E.01631
G1 X129.192 Y167.178 E.005
G1 X129.199 Y167.488 E.01273
G1 X131.581 Y167.489 E.09784
G1 X131.569 Y166.742 E.03066
G1 X129.873 Y165.561 E.08483
M204 S10000
G1 X130.115 Y166.168 F42000
G1 F7144.644
M204 S6000
G1 X130.077 Y166.586 E.01725
G1 X129.949 Y166.929 E.01501
G1 X129.81 Y167.128 E.01
G1 X131.215 Y167.129 E.0577
G1 X131.212 Y166.932 E.00807
G1 X130.164 Y166.202 E.05245
M204 S10000
G1 X130.406 Y166.744 F42000
; LINE_WIDTH: 0.396188
G1 F7650.785
M204 S6000
G1 X130.343 Y166.781 E.00279
G1 X130.391 Y166.808 E.0021
M204 S10000
G1 X128.822 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
M204 S6000
G1 X127.828 Y167.42 E.05569
G3 X125.55 Y167.423 I-1.464 J-199.159 E.12775
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X124.219 Y167.419 E.07096
; WIPE_START
G1 X125.55 Y167.423 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.521 Y159.861 Z1.16 F42000
G1 X124.218 Y157.637 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.53292
G1 F5438.362
M204 S6000
G1 X124.676 Y157.639 E.02468
; LINE_WIDTH: 0.556741
G1 F5177.519
G3 X127.395 Y157.641 I.71 J628.686 E.15407
G1 X128.9 Y157.669 E.0853
M204 S10000
G1 X129.278 Y157.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X129.268 Y157.886 E.01252
G1 X129.505 Y158.028 E.01132
G1 X129.746 Y158.421 E.01894
G1 X129.864 Y158.955 E.02245
G3 X129.733 Y159.227 I-.407 J-.029 E.01268
G1 X129.903 Y159.458 E.01178
G1 X131.55 Y158.312 E.08238
G1 X131.578 Y157.592 E.02958
G1 X129.338 Y157.582 E.09196
M204 S10000
G1 X130.012 Y158.017 F42000
; LINE_WIDTH: 0.563819
G1 F5104.776
M204 S6000
G3 X130.248 Y158.692 I-1.228 J.808 E.04151
G1 X131.127 Y158.08 E.06155
G1 X131.129 Y158.022 E.00337
G1 X130.072 Y158.017 E.06077
; WIPE_START
G1 X131.129 Y158.022 E-.40183
G1 X131.127 Y158.08 E-.02226
G1 X130.401 Y158.585 E-.33591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.923 Y153.39 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X124.924 Y153.461 E.00317
G1 X125.608 Y154.145 E.04305
G1 X131.96 Y154.211 E.28254
G3 X131.957 Y155.017 I-15.111 J.356 E.03589
G3 X126.029 Y155.019 I-3.021 J-188.976 E.26373
G3 X124.98 Y154.692 I.021 J-1.911 E.04958
G3 X124.105 Y153.609 I.736 J-1.489 E.06385
G3 X124.023 Y151.503 I14.647 J-1.627 E.09384
G3 X124.067 Y146.709 I129.901 J-1.208 E.21328
G3 X124.167 Y146.309 I.948 J.024 E.01846
G3 X125.519 Y145.15 I1.812 J.746 E.08223
G3 X126.548 Y145.036 I.879 J3.22 E.04625
G3 X130.616 Y145.025 I2.767 J273.526 E.18094
G3 X131.912 Y145.047 I-.213 J50.424 E.05769
G3 X131.921 Y145.923 I-18.081 J.618 E.03897
G3 X125.543 Y145.947 I-4.327 J-306.234 E.2837
G1 X124.879 Y146.712 E.04507
G1 X124.923 Y153.33 E.29437
M204 S10000
G1 X125.298 Y153.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.765 Y153.772 E.02714
G1 X132.329 Y153.839 E.26951
G3 X132.308 Y155.39 I-13.43 J.6 E.06371
G3 X126.01 Y155.393 I-3.256 J-197.89 E.25861
G3 X124.791 Y155.016 I.043 J-2.297 E.0531
G3 X123.737 Y153.679 I.921 J-1.811 E.07216
G3 X123.648 Y151.504 I14.829 J-1.692 E.08943
G3 X123.693 Y146.684 I129.331 J-1.213 E.19792
G3 X123.891 Y146.011 I1.506 J.077 E.0291
G3 X125.572 Y144.746 I2.141 J1.097 E.0894
G3 X126.985 Y144.653 I1.194 J7.322 E.0582
G3 X130.619 Y144.65 I2.029 J286.473 E.14922
G3 X132.274 Y144.688 I-.008 J36.677 E.06795
G3 X132.277 Y146.284 I-14.086 J.828 E.06558
G3 X125.714 Y146.322 I-4.545 J-220.55 E.26947
G1 X125.255 Y146.851 E.02877
G1 X125.297 Y153.245 E.26252
M204 S10000
G1 X124.498 Y153.357 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549563
G1 F5253.444
M204 S6000
G3 X124.459 Y148.928 I159.616 J-3.635 E.24735
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X124.467 Y147.031 I145.437 J-.361 E.10009
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X124.473 Y146.735 E.01435
G3 X124.526 Y146.502 I.409 J-.03 E.01171
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X124.612 Y146.367 I2.594 J1.55 E.00815
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X124.673 Y146.277 E.00594
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X124.902 Y145.994 I2.914 J2.127 E.02125
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X125.101 Y145.803 I2.171 J2.05 E.01564
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X125.181 Y145.735 E.00539
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X125.738 Y145.294 E.03357
M204 S10000
G1 X125.315 Y145.631 F42000
; LINE_WIDTH: 0.423704
G1 F7071.826
M204 S6000
G3 X125.518 Y145.559 I.257 J.401 E.00899
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X125.636 Y145.54 E.00556
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X125.763 Y145.523 E.00645
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X125.976 Y145.506 I.331 J2.833 E.01163
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X129.637 Y145.484 I2.426 J98.82 E.22178
G3 X130.61 Y145.484 I.47 J142.627 E.05894
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X131.475 Y145.486 I.581 J-74.02 E.05037
G1 X131.727 Y145.728 E.02038
; WIPE_START
G1 X131.475 Y145.486 E-.21894
G1 X130.61 Y145.484 E-.54106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.57 Y153.056 Z1.16 F42000
G1 X131.768 Y154.613 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.49629
G1 F5895.049
M204 S6000
G1 X130.018 Y154.609 E.08705
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X128.269 Y154.605 E.09227
; LINE_WIDTH: 0.541749
G1 F5338.669
G3 X125.727 Y154.569 I-.616 J-46.119 E.13971
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X125.592 Y154.545 E.00676
; LINE_WIDTH: 0.446493
G1 F6654.752
G3 X125.31 Y154.415 I.146 J-.69 E.01379
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X125.194 Y154.328 E.00719
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X125.03 Y154.195 E.01147
; LINE_WIDTH: 0.575695
G1 F4987.195
G3 X124.758 Y153.937 I2.556 J-2.966 E.02205
; LINE_WIDTH: 0.557514
G1 F5169.477
G3 X124.621 Y153.767 I1.791 J-1.581 E.0124
; LINE_WIDTH: 0.504165
G1 F5790.505
G3 X124.498 Y153.357 I.475 J-.366 E.02218
; WIPE_START
G1 X124.536 Y153.637 E-.48945
G1 X124.621 Y153.767 E-.27055
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.982 Y146.143 Z1.16 F42000
G1 X125.547 Y134.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X125.441 Y134.247 E.00553
G2 X125.01 Y134.929 I.517 J.803 E.03704
M73 P79 R2
G2 X124.911 Y136.566 I9.465 J1.398 E.07303
G1 X124.89 Y142.434 E.26104
G1 X124.053 Y142.418 E.03724
G3 X124.039 Y135.44 I507.954 J-4.501 E.31038
G3 X124.127 Y134.56 I3.431 J-.102 E.03946
G3 X124.973 Y133.527 I1.642 J.481 E.06103
G3 X126.325 Y133.24 I1.133 J2.012 E.06245
G3 X127.283 Y133.408 I.122 J2.124 E.04364
G3 X128.299 Y134.428 I-1.042 J2.054 E.06513
G3 X128.436 Y135.892 I-6.916 J1.387 E.06551
G3 X128.471 Y141.477 I-197.192 J4.024 E.24845
G2 X129.019 Y141.84 I3.362 J-4.476 E.02926
G2 X130.809 Y141.578 I.696 J-1.49 E.08521
G1 X130.989 Y141.323 E.01385
G2 X131.048 Y138.024 I-88.433 J-3.229 E.14681
G3 X131.079 Y133.585 I184.331 J-.91 E.19746
G3 X131.92 Y133.582 I.474 J14.099 E.03743
G3 X131.884 Y141.343 I-166.444 J3.094 E.34529
G3 X131.16 Y142.425 I-1.747 J-.386 E.05926
G3 X129.655 Y142.852 I-1.328 J-1.817 E.07106
G3 X127.69 Y141.703 I-.039 J-2.188 E.10649
G3 X127.572 Y140.272 I6.552 J-1.26 E.06397
G2 X127.521 Y135.415 I-1247.715 J10.507 E.21608
G2 X127.38 Y134.628 I-1.994 J-.048 E.03582
G2 X126.402 Y134.108 I-.951 J.611 E.05147
G2 X125.776 Y134.112 I-.274 J6.121 E.02786
G2 X125.604 Y134.163 I.182 J.938 E.008
M204 S10000
G1 X125.717 Y134.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.377 Y135.011 I.239 J.529 E.02562
G2 X125.286 Y136.569 I9.204 J1.319 E.06417
G1 X125.264 Y142.817 E.25652
G1 X123.68 Y142.786 E.06503
G3 X123.664 Y135.431 I527.43 J-4.797 E.30198
G3 X123.771 Y134.442 I3.73 J-.097 E.04099
G3 X124.779 Y133.206 I1.987 J.591 E.0672
G3 X126.336 Y132.865 I1.324 J2.325 E.06647
G3 X127.214 Y132.971 I.008 J3.618 E.03638
G3 X128.658 Y134.317 I-.877 J2.389 E.08325
G3 X128.811 Y135.881 I-7.11 J1.487 E.06463
G3 X128.846 Y141.277 I-191.103 J3.92 E.22158
G2 X130.426 Y141.415 I.884 J-1.002 E.06974
G2 X130.62 Y141.195 I-.356 J-.51 E.01215
G2 X130.686 Y134.334 I-267.548 J-6.006 E.28173
G3 X130.722 Y133.241 I19.227 J.088 E.04494
G3 X132.284 Y133.246 I.757 J7.182 E.06424
G3 X132.255 Y141.4 I-153.029 J3.539 E.33487
G3 X131.391 Y142.72 I-2.121 J-.445 E.06629
G3 X129.652 Y143.227 I-1.56 J-2.118 E.07594
G3 X129.133 Y143.177 I.206 J-4.837 E.02143
G3 X127.355 Y141.881 I.529 J-2.593 E.09314
G3 X127.212 Y140.805 I3.266 J-.982 E.04476
G3 X127.16 Y135.95 I171.334 J-4.265 E.19938
G2 X127.085 Y134.909 I-5.726 J-.113 E.04289
G2 X126.517 Y134.496 I-.586 J.209 E.03066
G2 X125.84 Y134.484 I-.428 J4.936 E.02783
G2 X125.773 Y134.502 I.116 J.568 E.00285
M204 S10000
G1 X125.858 Y133.679 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
M204 S6000
G1 X125.727 Y133.691 E.00696
G2 X124.942 Y134.088 I.236 J1.441 E.04733
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X124.693 Y134.415 I.788 J.861 E.02467
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X124.489 Y135.503 I2.438 J1.02 E.06876
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X124.483 Y135.694 E.01068
G2 X124.469 Y138.645 I107.849 J1.982 E.1648
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X124.471 Y142.231 E.19015
; WIPE_START
G1 X124.47 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.858 Y133.679 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
M204 S6000
G3 X126.313 Y133.673 I.269 J3.422 E.02517
G3 X127.652 Y134.246 I.109 J1.597 E.08354
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X127.839 Y134.529 I-.781 J.717 E.02004
G1 X127.915 Y134.822 E.01782
G1 X127.961 Y135.269 E.02646
G3 X128.028 Y140.771 I-234.918 J5.615 E.32385
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X128.05 Y141.358 I14.528 J-.241 E.03189
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X128.064 Y141.526 E.00843
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X128.268 Y141.826 I.384 J-.042 E.01708
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X128.376 Y141.917 E.00694
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X128.471 Y141.993 E.00635
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X129.45 Y142.409 I1.157 J-1.365 E.06114
G1 X129.577 Y142.419 E.00721
G2 X131.085 Y141.913 I.211 J-1.871 E.09293
G2 X131.44 Y141.275 I-.682 J-.796 E.04215
G2 X131.498 Y133.774 I-226.04 J-5.516 E.42455
; WIPE_START
G1 X131.495 Y135.774 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.1 Y128.151 Z1.16 F42000
G1 X130.962 Y125.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X130.975 Y125.461 E.00168
G2 X131.011 Y125.306 I-.681 J-.24 E.00706
G2 X131.066 Y121.881 I-222.109 J-5.29 E.15239
G3 X131.884 Y121.869 I.6 J13.182 E.03639
G3 X131.915 Y131.069 I-363.455 J5.817 E.40922
G3 X131.066 Y131.072 I-.472 J-12.005 E.03778
G3 X131.045 Y128.657 I63.038 J-1.745 E.10744
G2 X130.998 Y127.608 I-9.038 J-.122 E.04672
G2 X130.706 Y127.073 I-.84 J.112 E.02775
G1 X130.451 Y126.974 E.01217
G2 X126.488 Y126.921 I-3.603 J120.385 E.1763
G3 X124.025 Y126.878 I.952 J-126.704 E.10957
G3 X124.027 Y126.026 I20.983 J-.383 E.03791
G3 X128.58 Y126 I3.393 J200.086 E.20253
G2 X130.428 Y125.93 I.362 J-14.833 E.08234
G2 X130.904 Y125.607 I-.134 J-.71 E.02629
G1 X130.934 Y125.549 E.00292
M204 S10000
G1 X130.619 Y125.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.638 Y125.258 I-.322 J-.117 E.00351
G2 X130.699 Y121.684 I-431.298 J-9.119 E.14678
G3 X130.713 Y121.534 I1.876 J.096 E.00618
G3 X131.817 Y121.494 I.875 J9.004 E.0454
G3 X132.238 Y121.512 I-.103 J7.252 E.01733
G3 X132.297 Y124.743 I-82.114 J3.097 E.13267
G3 X132.282 Y131.413 I-272.898 J2.734 E.27387
G3 X130.716 Y131.418 I-.807 J-8.179 E.06438
G3 X130.681 Y130.663 I7.988 J-.754 E.03105
G2 X130.648 Y127.88 I-55.971 J-.737 E.11428
G2 X130.567 Y127.477 I-.984 J-.01 E.01699
G2 X130.373 Y127.346 I-.229 J.129 E.00998
G2 X126.485 Y127.296 I-3.608 J128.888 E.15964
G3 X123.673 Y127.239 I1.127 J-126.045 E.11547
G3 X123.67 Y125.659 I13.82 J-.815 E.06491
G3 X128.577 Y125.626 I4.025 J230.856 E.20147
G2 X130.344 Y125.563 I.351 J-15.171 E.07265
G2 X130.594 Y125.396 I-.047 J-.339 E.01278
M204 S10000
G1 X131.465 Y125.407 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
M204 S6000
G1 X131.479 Y123.223 E.12206
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X131.475 Y122.287 I106.745 J-.909 E.04914
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X131.69 Y122.064 E.01518
; WIPE_START
G1 X131.475 Y122.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.856 Y126.086 Z1.16 F42000
G1 X124.218 Y126.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
M204 S6000
G1 X125.204 Y126.457 E.0553
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X128.582 Y126.468 I5.158 J-1097.004 E.20317
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X129.99 Y126.467 E.09015
M204 S10000
G1 X130.366 Y126.595 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X130.557 Y126.613 E.00787
G1 X130.952 Y126.787 E.01774
G1 X131.212 Y127.085 E.01623
G1 X131.255 Y127.179 E.00424
G1 X131.556 Y127.165 E.01239
G1 X131.549 Y125.784 E.0567
G1 X131.226 Y125.777 E.01327
G1 X131.053 Y126.018 E.01218
G1 X130.769 Y126.214 E.01418
G1 X130.364 Y126.305 E.01702
G1 X130.366 Y126.535 E.00943
M204 S10000
G1 X131.183 Y126.392 F42000
; LINE_WIDTH: 0.494249
G1 F5922.767
M204 S6000
G2 X131.177 Y126.486 I-.027 J.046 E.01075
M204 S10000
G1 X131.464 Y127.545 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
M204 S6000
G1 X131.489 Y128.653 E.06273
G3 X131.488 Y130.645 I-365.053 J.826 E.11278
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X131.256 Y130.878 E.01758
; WIPE_START
G1 X131.488 Y130.645 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.22 Y123.017 Z1.16 F42000
G1 X130.803 Y111.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X130.774 Y111.142 E.00175
G2 X129.894 Y110.766 I-.846 J.763 E.04394
G2 X129.451 Y110.756 I-.354 J5.881 E.01969
G1 X127.89 Y110.799 E.06948
G1 X127.851 Y115.744 E.21998
G3 X127.834 Y116.394 I-21.223 J-.218 E.02893
G3 X126.94 Y116.368 I-.174 J-9.389 E.03982
G3 X126.961 Y112.743 I550.038 J1.427 E.16124
G2 X126.93 Y111.6 I-16.18 J-.133 E.05088
G1 X126.751 Y110.796 E.03664
G3 X124.032 Y110.716 I4.245 J-190.923 E.12101
G3 X124.043 Y109.911 I31.488 J.033 E.0358
G3 X129.3 Y109.898 I3.3 J266.573 E.23384
G3 X130.61 Y110.012 I.138 J6.018 E.05859
G3 X131.92 Y111.758 I-.523 J1.757 E.10402
G3 X131.921 Y117.925 I-98.644 J3.107 E.27436
G3 X131.662 Y118.897 I-1.778 J.045 E.04537
G3 X130.299 Y119.795 I-1.954 J-1.484 E.07397
G3 X127.263 Y119.83 I-2.057 J-46.276 E.13509
G1 X124.044 Y119.811 E.14321
G1 X124.027 Y118.978 E.03704
G2 X129.855 Y118.917 I.836 J-198.271 E.25925
G2 X130.621 Y118.708 I.032 J-1.391 E.03584
G2 X131.007 Y117.983 I-.603 J-.785 E.03764
G2 X131.048 Y116.29 I-25.853 J-1.485 E.07533
G2 X131.017 Y111.865 I-100.14 J-1.505 E.19688
G2 X130.9 Y111.311 I-1.678 J.065 E.02528
G1 X130.837 Y111.217 E.00504
M204 S10000
G1 X130.498 Y111.385 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.87 Y111.14 I-.646 J.728 E.02829
G2 X129.455 Y111.131 I-.331 J5.508 E.01702
G1 X128.262 Y111.163 E.04903
G3 X128.219 Y116.108 I-229.37 J.496 E.20302
G3 X128.185 Y116.734 I-5.826 J-.003 E.02576
G3 X126.578 Y116.7 I-.661 J-6.741 E.06616
G3 X126.586 Y112.744 I103.805 J-1.757 E.16242
G2 X126.558 Y111.654 I-16.082 J-.129 E.04479
G1 X126.449 Y111.162 E.02067
G3 X123.656 Y111.078 I4.91 J-208.862 E.11471
G3 X123.676 Y109.539 I61.525 J.021 E.0632
G3 X129.308 Y109.523 I3.594 J283.119 E.23126
G3 X130.718 Y109.652 I.137 J6.257 E.05825
G3 X132.295 Y111.74 I-.632 J2.116 E.11497
G3 X132.296 Y117.95 I-98.872 J3.123 E.255
G3 X131.882 Y119.226 I-2.069 J.036 E.05611
G3 X130.447 Y120.156 I-2.247 J-1.894 E.07126
G3 X127.262 Y120.205 I-2.222 J-41.407 E.13081
G1 X123.676 Y120.183 E.14725
G1 X123.645 Y118.606 E.06479
G2 X129.63 Y118.553 I.854 J-243.189 E.24577
G2 X130.31 Y118.458 I.063 J-2.02 E.0283
G2 X130.634 Y117.936 I-.284 J-.539 E.02645
G2 X130.674 Y116.29 I-26.154 J-1.445 E.06763
G2 X130.643 Y111.895 I-101.673 J-1.5 E.18047
G2 X130.528 Y111.437 I-.993 J.007 E.01957
M204 S10000
G1 X130.901 Y110.651 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
M204 S6000
G3 X131.469 Y111.834 I-.814 J1.119 E.08164
G1 X131.48 Y112.059 E.01345
G3 X131.469 Y117.896 I-101.795 J2.736 E.34841
G1 X131.455 Y118.049 E.0092
G3 X131.045 Y118.925 I-1.234 J-.044 E.05936
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X131.034 Y118.936 E.00083
G3 X129.815 Y119.368 I-1.121 J-1.228 E.07575
G1 X129.658 Y119.373 E.00893
G3 X128.22 Y119.391 I-1.518 J-65.058 E.08199
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X124.231 Y119.394 I-2.619 J-719.618 E.21384
; WIPE_START
G1 X126.231 Y119.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.389 Y116.195 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
M204 S6000
G3 X127.415 Y113.299 I489.208 J2.962 E.17375
G1 X127.412 Y111.593 E.10239
M204 S10000
G1 X127.275 Y110.327 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
M204 S6000
G1 X127.275 Y110.828 E.02649
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X127.275 Y110.898 E.00395
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X127.274 Y110.969 E.00429
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X127.291 Y111.001 E.00237
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X127.308 Y111.033 E.00252
M204 S10000
G1 X127.698 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
M204 S6000
G3 X129.291 Y110.329 I2.295 J129.717 E.09053
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X129.691 Y110.334 E.02149
G3 X130.783 Y110.575 I.116 J2.068 E.06096
G1 X130.901 Y110.651 E.00754
M204 S10000
G1 X126.851 Y110.346 F42000
; LINE_WIDTH: 0.546922
G1 F5281.948
M204 S6000
G1 X125.541 Y110.331 E.07275
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X124.232 Y110.317 E.0671
; WIPE_START
G1 X125.541 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.39 Y102.7 Z1.16 F42000
G1 X125.342 Y100.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X126.336 Y101.322 E.06462
G2 X129.271 Y103.992 I52.429 J-54.693 E.17651
G3 X131.962 Y106.413 I-170.214 J191.92 E.16102
G3 X131.942 Y107.734 I-104.989 J-.94 E.05875
G3 X123.972 Y107.743 I-4.756 J-646.551 E.35452
G3 X123.981 Y106.813 I13.358 J-.337 E.04139
G3 X128.03 Y106.792 I3.029 J194.358 E.18012
G2 X129.463 Y106.71 I.248 J-8.212 E.06393
G1 X129.605 Y106.658 E.00671
G1 X130.287 Y106.197 E.03661
G2 X129.044 Y104.944 I-9.327 J8.008 E.07855
G3 X123.972 Y100.397 I385.239 J-434.778 E.30303
G3 X123.978 Y99.133 I23.066 J-.519 E.05623
G3 X130.695 Y99.095 I5.121 J317.268 E.29878
G3 X132.003 Y99.119 I-.016 J37.102 E.05822
G3 X132.024 Y100.1 I-9.397 J.683 E.04367
G2 X127.028 Y100.148 I13.314 J1658.362 E.22221
G2 X125.402 Y100.257 I1.096 J28.375 E.07253
M204 S10000
G1 X126.153 Y100.58 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.523 Y102.831 I23.246 J-22.101 E.13423
G3 X132.339 Y106.25 I-232.379 J263.166 E.2104
G3 X132.31 Y108.107 I-148.094 J-1.41 E.07623
G3 X123.613 Y108.109 I-4.459 J-502.798 E.35708
G3 X123.626 Y106.448 I22.096 J-.653 E.06822
G3 X128.748 Y106.406 I4.506 J238.501 E.21032
G2 X129.433 Y106.322 I.032 J-2.561 E.02839
G1 X129.717 Y106.13 E.01408
G2 X128.792 Y105.222 I-7.317 J6.529 E.05323
G3 X123.597 Y100.557 I302.231 J-341.854 E.28669
G3 X123.626 Y98.772 I17.451 J-.606 E.07337
G3 X130.696 Y98.72 I5.189 J228.924 E.29032
G3 X132.339 Y98.766 I.34 J17.451 E.06748
G3 X132.365 Y100.445 I-7.415 J.958 E.06909
G3 X131.185 Y100.489 I-.874 J-7.447 E.04854
G2 X126.819 Y100.532 I-.667 J156.379 E.1793
G1 X126.213 Y100.576 E.02494
M204 S10000
G1 X125.658 Y101.286 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
M204 S6000
G1 X126.01 Y101.634 E.02994
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X129.332 Y104.624 I116.807 J-126.382 E.24242
G1 X129.84 Y105.087 E.03728
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X130.402 Y105.631 I-12.025 J12.963 E.04488
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X130.757 Y105.983 E.03118
M204 S10000
G1 X129.479 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X131.573 Y107.36 E.08598
G1 X131.585 Y106.578 E.03213
G1 X131.113 Y106.155 E.02599
G1 X130.672 Y106.601 E.02575
G1 X130.501 Y106.649 E.00729
G1 X130.364 Y106.597 E.00603
G1 X129.789 Y106.986 E.02848
G1 X129.471 Y107.078 E.0136
G1 X129.477 Y107.31 E.00953
M204 S10000
G1 X130.414 Y107.002 F42000
; LINE_WIDTH: 0.423508
G1 F7075.639
M204 S6000
G1 X130.58 Y107.004 E.00688
M204 S10000
G1 X130.64 Y107.005 F42000
; LINE_WIDTH: 0.406861
G1 F7415.318
M204 S6000
G1 X130.942 Y107.016 E.01193
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X131.243 Y107.027 E.01079
G1 X131.247 Y106.778 E.00894
G2 X131.127 Y106.617 I-.236 J.051 E.00739
G1 X130.912 Y106.838 E.01103
; LINE_WIDTH: 0.396754
G1 F7637.945
M73 P80 R2
G1 X130.691 Y106.974 E.00995
M204 S10000
G1 X129.101 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
M204 S6000
G1 X128.032 Y107.272 E.06933
G2 X125.543 Y107.274 I-.801 J441.112 E.16136
G2 X124.169 Y107.278 I-.353 J138.553 E.08909
; WIPE_START
G1 X125.543 Y107.274 E-.52215
G1 X126.169 Y107.274 E-.23785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.658 Y101.286 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
M204 S6000
G1 X125.308 Y100.946 E.03108
M204 S10000
G1 X124.946 Y100.809 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
G1 F7939.26
M204 S6000
G1 X125.161 Y100.588 E.01137
G1 X124.797 Y100.211 E.01937
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X124.731 Y100.096 E.00536
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X124.749 Y100.014 E.00378
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X124.768 Y99.931 E.00407
G1 X124.905 Y99.902 E.00678
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X126.664 Y99.805 E.07383
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X127.019 Y99.787 E.01296
G3 X131.675 Y99.757 I9.125 J1054.978 E.17
G1 X131.669 Y99.459 E.01089
G1 X130.693 Y99.447 E.03565
G2 X126.65 Y99.462 I1.138 J844.588 E.14759
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X124.889 Y99.511 E.07383
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X124.642 Y99.528 E.01145
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X124.395 Y99.546 E.01181
G1 X124.356 Y100.094 E.02622
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X124.356 Y100.229 E.00581
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X124.594 Y100.467 E.0139
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X124.902 Y100.769 I3.692 J-3.462 E.01627
; WIPE_START
G1 X124.594 Y100.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.975 Y92.844 Z1.16 F42000
G1 X125.146 Y89.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X125.07 Y89.562 E.00676
G2 X124.965 Y89.97 I.791 J.421 E.01892
G2 X125.005 Y94.812 I71.105 J1.831 E.21544
G2 X125.523 Y95.865 I1.238 J.045 E.05437
G2 X126.321 Y96.068 I.893 J-1.84 E.03688
G2 X129.676 Y96.081 I1.819 J-34.674 E.14928
G2 X130.733 Y95.59 I-.008 J-1.4 E.0535
G2 X130.918 Y95.068 I-.909 J-.616 E.02488
G2 X130.985 Y92.744 I-28.998 J-2.002 E.10348
G1 X131.028 Y88.162 E.20379
G1 X131.933 Y88.162 E.04024
G3 X131.912 Y95.394 I-238.073 J2.92 E.32168
G3 X130.65 Y96.875 I-2.547 J-.892 E.08856
G3 X129.653 Y97.052 I-1.055 J-3.041 E.04524
G3 X125.884 Y97.016 I-1.571 J-32.653 E.16773
G3 X124.6 Y96.304 I.229 J-1.926 E.06697
G3 X124.026 Y94.977 I1.467 J-1.422 E.06574
G3 X123.981 Y92.293 I34.1 J-1.918 E.11943
G1 X124.003 Y88.158 E.18395
G3 X128.369 Y88.143 I3.039 J242.645 E.1942
G1 X128.489 Y88.147 E.00536
G3 X128.5 Y92.01 I-88.309 J2.168 E.17185
G3 X127.511 Y91.976 I.262 J-22.511 E.04398
G2 X127.449 Y89.879 I-33.386 J-.057 E.09333
G2 X127.232 Y89.282 I-1.237 J.112 E.02861
G2 X126.208 Y89.097 I-.831 J1.669 E.04689
G2 X125.309 Y89.276 I-.084 J1.921 E.04118
G2 X125.189 Y89.389 I.552 J.706 E.00733
M204 S10000
G1 X125.459 Y89.651 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X125.339 Y90.001 I.404 J.334 E.01554
G2 X125.379 Y94.784 I71.116 J1.79 E.1964
G2 X125.639 Y95.482 I.957 J.042 E.03141
G2 X126.35 Y95.694 I.674 J-.96 E.031
G2 X129.639 Y95.708 I1.794 J-34.451 E.13512
G2 X130.431 Y95.363 I-.013 J-1.112 E.03643
G2 X130.546 Y95.021 I-.582 J-.384 E.015
G2 X130.61 Y92.739 I-28.895 J-1.961 E.09374
G1 X130.657 Y87.787 E.20333
G1 X132.307 Y87.787 E.06773
G3 X132.281 Y95.468 I-239.153 J3.044 E.31537
G3 X130.861 Y97.192 I-2.955 J-.987 E.09379
G3 X129.674 Y97.427 I-1.185 J-2.874 E.05
G3 X125.837 Y97.388 I-1.59 J-32.963 E.15765
G3 X124.322 Y96.555 I.265 J-2.278 E.07281
G3 X123.652 Y95.01 I1.744 J-1.673 E.07062
G3 X123.606 Y92.293 I34.395 J-1.95 E.11161
G1 X123.63 Y87.786 E.18506
G3 X128.376 Y87.768 I3.368 J260.389 E.19487
G3 X128.84 Y87.808 I.022 J2.477 E.01916
G3 X128.892 Y91.22 I-42.344 J2.346 E.14018
G3 X128.839 Y92.383 I-10.19 J.116 E.04782
G3 X127.142 Y92.336 I-.076 J-28.108 E.06971
G2 X127.076 Y89.921 I-38.033 J-.176 E.09922
G2 X126.966 Y89.573 I-.766 J.052 E.01514
G2 X126.219 Y89.471 I-.566 J1.36 E.03129
G2 X125.517 Y89.592 I-.087 J1.603 E.02951
G2 X125.5 Y89.607 I.346 J.394 E.00093
; WIPE_START
M204 S6000
G1 X125.401 Y89.726 E-.05886
G1 X125.367 Y89.819 E-.03768
G1 X125.339 Y90.001 E-.07005
G1 X125.318 Y90.687 E-.26076
G1 X125.32 Y91.556 E-.33017
G1 X125.32 Y91.563 E-.00247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.471 Y89.958 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
M204 S6000
G1 X124.465 Y91.563 E.10639
G2 X124.52 Y94.934 I54.656 J.795 E.22358
G1 X124.546 Y95.162 E.0152
G2 X125.497 Y96.405 I1.722 J-.332 E.10757
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X125.551 Y96.429 E.00403
G2 X126.88 Y96.583 I1.197 J-4.518 E.09034
G2 X129.82 Y96.553 I1.138 J-32.466 E.19798
G1 X129.972 Y96.535 E.01028
G2 X130.862 Y96.138 I-.116 J-1.459 E.06687
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X131.084 Y95.906 I-1.353 J-1.515 E.0206
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X131.078 Y95.883 E.00144
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X131.044 Y95.776 E.00628
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X131.01 Y95.669 E.00571
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X130.976 Y95.562 E.00514
M204 S10000
G1 X131.202 Y95.178 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
M204 S6000
G1 X131.326 Y95.162 E.00495
G1 X131.478 Y95.238 E.00673
M204 S10000
G1 X131.432 Y94.884 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
M204 S6000
G2 X131.463 Y92.75 I-84.506 J-2.275 E.1406
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X131.48 Y88.357 I-775.829 J-5.261 E.27346
; WIPE_START
G1 X131.472 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.703 Y91.714 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
M204 S6000
G1 X128.23 Y91.723 E.00969
G1 X128.312 Y91.809 E.00218
M204 S10000
G1 X128.156 Y91.26 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
M204 S6000
G2 X128.125 Y88.518 I-106.425 J-.172 E.10782
G1 X127.16 Y88.522 E.03796
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X127.072 Y88.543 E.00393
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X126.984 Y88.565 E.00437
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X126.897 Y88.587 E.0048
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X126.809 Y88.608 E.00524
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X126.721 Y88.63 E.00568
G1 X126.866 Y88.697 E.01002
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X127.01 Y88.764 E.00925
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X127.155 Y88.831 E.00848
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X127.299 Y88.899 E.0077
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X127.527 Y89.042 I-.114 J.434 E.01135
G1 X127.736 Y89.43 E.01834
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X127.822 Y90.009 E.02194
G3 X127.849 Y91.255 I-203.786 J5.075 E.04671
G1 X128.096 Y91.259 E.00928
M204 S10000
G1 X127.817 Y88.818 F42000
; LINE_WIDTH: 0.362949
G1 F8490.486
M204 S6000
G1 X127.761 Y88.851 E.00226
G1 X127.798 Y88.873 E.0015
M204 S10000
G1 X126.238 Y88.635 F42000
; LINE_WIDTH: 0.635768
G1 F4466.768
M204 S6000
G1 X126.661 Y88.63 E.02778
M204 S10000
G1 X124.725 Y88.829 F42000
; LINE_WIDTH: 0.362009
G1 F8516.92
M204 S6000
G1 X124.669 Y88.861 E.00225
G1 X124.706 Y88.883 E.00148
M204 S10000
G1 X124.666 Y89.583 F42000
; LINE_WIDTH: 0.419499
G1 F7154.583
M204 S6000
G1 X124.736 Y89.372 E.00911
G3 X125.346 Y88.847 I1.014 J.56 E.0337
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X125.594 Y88.818 E.00972
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X125.843 Y88.788 E.00884
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X125.909 Y88.763 E.00257
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X125.975 Y88.737 E.00295
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X126.041 Y88.711 E.00333
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X126.107 Y88.686 E.00372
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X126.172 Y88.66 E.0041
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X126.238 Y88.635 E.00448
G1 X126.172 Y88.611 E.00448
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X126.105 Y88.588 E.0041
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X126.038 Y88.564 E.00372
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X125.971 Y88.541 E.00333
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X125.905 Y88.517 E.00295
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X125.838 Y88.494 E.00262
G1 X125.308 Y88.526 E.01965
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X124.377 Y88.532 I-1.236 J-132.775 E.03818
G1 X124.373 Y89.583 E.04311
G1 X124.606 Y89.583 E.00953
; OBJECT_ID: 331
; WIPE_START
G1 X124.373 Y89.583 E-.08836
G1 X124.377 Y88.532 E-.39958
G1 X125.093 Y88.527 E-.27206
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.449 Y96.133 Z1.16 F42000
G1 X119.169 Y158.573 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X119.161 Y158.536 E.00165
G1 X118.994 Y158.278 E.01368
G2 X118.265 Y158.108 I-.643 J1.106 E.0338
G2 X113.796 Y158.06 I-7.769 J518.454 E.19877
G3 X113.801 Y157.214 I17.002 J-.341 E.03764
G3 X121.741 Y157.219 I3.7 J436.266 E.35321
G3 X121.691 Y158.513 I-23.469 J-.255 E.05762
G2 X116.819 Y161.958 I89.16 J131.272 E.26543
G2 X116.717 Y162.94 I.458 J.544 E.04858
G2 X117.407 Y163.54 I2.68 J-2.388 E.04078
G2 X121.714 Y166.544 I307.806 J-436.675 E.23357
G3 X121.736 Y167.864 I-21.622 J1.018 E.05871
G3 X113.799 Y167.839 I-2.224 J-554.855 E.35307
G3 X113.799 Y166.996 I24.634 J-.418 E.03749
G2 X118.423 Y166.949 I1.244 J-105.817 E.20572
G2 X118.889 Y166.798 I-.093 J-1.076 E.02197
G1 X119.057 Y166.615 E.01106
G2 X118.851 Y165.664 I-.626 J-.362 E.04749
G1 X118.666 Y165.522 E.01037
G2 X114.422 Y162.517 I-458.307 J642.503 E.2313
G2 X118.752 Y159.451 I-176.431 J-253.801 E.23598
G1 X119.009 Y159.25 E.01449
G1 X119.251 Y158.945 E.01734
G1 X119.182 Y158.631 E.0143
M204 S10000
G1 X118.809 Y158.683 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.737 Y158.572 I-.393 J.175 E.00547
G2 X118.539 Y158.501 I-.251 J.386 E.00873
G2 X115.378 Y158.453 I-2.407 J55.548 E.12982
G3 X113.438 Y158.425 I.137 J-75.307 E.07966
G3 X113.443 Y156.85 I19.81 J-.719 E.06469
G3 X122.094 Y156.845 I4.498 J324.765 E.35522
G3 X122.057 Y158.718 I-15.49 J.624 E.07694
G2 X117.067 Y162.24 I92.34 J136.1 E.25077
G2 X117.023 Y162.721 I.216 J.263 E.02209
G2 X117.628 Y163.237 I2.404 J-2.208 E.03272
G3 X122.062 Y166.335 I-337.987 J488.436 E.22208
G3 X122.08 Y168.238 I-11.207 J1.059 E.07827
G3 X113.439 Y168.206 I-2.432 J-496.317 E.35479
G3 X113.438 Y166.622 I22.473 J-.808 E.06503
G2 X118.389 Y166.575 I1.283 J-126.428 E.20331
G2 X118.767 Y166.336 I.017 J-.392 E.01956
G2 X118.607 Y165.95 I-.359 J-.077 E.01825
G1 X118.443 Y165.824 E.0085
G3 X113.906 Y162.602 I378.383 J-537.536 E.22848
G1 X113.795 Y162.514 E.00582
G3 X113.99 Y162.364 I1.645 J1.939 E.01008
G2 X118.525 Y159.153 I-194.962 J-280.178 E.22815
G2 X118.846 Y158.852 I-.471 J-.825 E.01827
G2 X118.83 Y158.74 I-.43 J.007 E.00467
M204 S10000
G1 X119.316 Y159.6 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.565096
G1 F5091.863
M204 S6000
G1 X116.471 Y161.642 E.20176
M204 S10000
G1 X116.111 Y161.785 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X115.071 Y162.518 E.05224
G1 X116.094 Y163.245 E.05152
G3 X116.146 Y162.937 I.445 J-.083 E.0131
G1 X116.27 Y162.88 E.00561
G1 X116.187 Y162.44 E.01838
G1 X116.248 Y162.13 E.01299
G1 X116.295 Y162.038 E.00423
G1 X116.146 Y161.833 E.0104
M204 S10000
G1 X115.807 Y162.47 F42000
; LINE_WIDTH: 0.516989
G1 F5627.99
M204 S6000
G2 X115.804 Y162.569 I-.029 J.049 E.01219
M204 S10000
G1 X116.726 Y163.243 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.495067
G1 F5911.618
M204 S6000
G1 X116.732 Y163.549 E.01518
; LINE_WIDTH: 0.524808
G1 F5533.298
G1 X116.733 Y163.573 E.00125
; LINE_WIDTH: 0.560274
G1 F5140.947
G1 X116.734 Y163.596 E.00134
; LINE_WIDTH: 0.568106
G1 F5061.69
G2 X118.932 Y165.154 I48.405 J-65.991 E.15614
G1 X119.24 Y165.381 E.02216
M204 S10000
G1 X119.598 Y165.527 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.416 Y165.774 E.01259
G1 X119.498 Y165.946 E.00785
G1 X119.534 Y166.301 E.01463
G3 X119.356 Y166.844 I-1.186 J-.087 E.02372
G1 X119.074 Y167.124 E.01631
G1 X118.965 Y167.178 E.005
G1 X118.972 Y167.488 E.01273
G1 X121.355 Y167.489 E.09784
G1 X121.342 Y166.742 E.03066
G1 X119.647 Y165.561 E.08483
M204 S10000
G1 X119.888 Y166.168 F42000
G1 F7144.644
M204 S6000
G1 X119.85 Y166.586 E.01725
G1 X119.723 Y166.929 E.01501
G1 X119.584 Y167.128 E.01
G1 X120.989 Y167.129 E.0577
G1 X120.986 Y166.932 E.00807
G1 X119.937 Y166.202 E.05245
M204 S10000
G1 X120.18 Y166.744 F42000
; LINE_WIDTH: 0.396188
G1 F7650.785
M204 S6000
G1 X120.117 Y166.781 E.00279
G1 X120.164 Y166.808 E.0021
M204 S10000
G1 X118.595 Y167.403 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.551471
G1 F5233.051
M204 S6000
G1 X117.602 Y167.42 E.05569
G3 X115.323 Y167.423 I-1.464 J-199.159 E.12775
; LINE_WIDTH: 0.527424
G1 F5502.316
G1 X113.992 Y167.419 E.07096
; WIPE_START
G1 X115.323 Y167.423 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.294 Y159.861 Z1.16 F42000
G1 X113.992 Y157.637 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.53292
G1 F5438.362
M204 S6000
G1 X114.449 Y157.639 E.02468
; LINE_WIDTH: 0.556741
G1 F5177.519
G3 X117.168 Y157.641 I.71 J628.686 E.15407
G1 X118.674 Y157.669 E.0853
M204 S10000
G1 X119.052 Y157.582 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X119.041 Y157.886 E.01252
G1 X119.278 Y158.028 E.01132
G1 X119.519 Y158.421 E.01894
G1 X119.637 Y158.955 E.02245
G3 X119.506 Y159.227 I-.407 J-.029 E.01268
G1 X119.677 Y159.458 E.01178
G1 X121.324 Y158.312 E.08238
G1 X121.351 Y157.592 E.02958
G1 X119.112 Y157.582 E.09196
M204 S10000
G1 X119.785 Y158.017 F42000
; LINE_WIDTH: 0.563819
G1 F5104.776
M204 S6000
G3 X120.021 Y158.692 I-1.228 J.808 E.04151
G1 X120.9 Y158.08 E.06155
G1 X120.903 Y158.022 E.00337
G1 X119.845 Y158.017 E.06077
; WIPE_START
G1 X120.903 Y158.022 E-.40183
G1 X120.9 Y158.08 E-.02226
G1 X120.175 Y158.585 E-.33591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.697 Y153.39 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X114.698 Y153.461 E.00317
G1 X115.382 Y154.145 E.04305
G1 X121.733 Y154.211 E.28254
G3 X121.731 Y155.017 I-15.111 J.356 E.03589
G3 X115.802 Y155.019 I-3.021 J-188.976 E.26373
G3 X114.753 Y154.692 I.021 J-1.911 E.04958
G3 X113.879 Y153.609 I.736 J-1.489 E.06385
G3 X113.797 Y151.503 I14.647 J-1.627 E.09384
G3 X113.841 Y146.709 I129.901 J-1.208 E.21328
G3 X113.94 Y146.309 I.948 J.024 E.01846
G3 X115.292 Y145.15 I1.812 J.746 E.08223
G3 X116.322 Y145.036 I.879 J3.22 E.04625
G3 X120.389 Y145.025 I2.767 J273.526 E.18094
G3 X121.686 Y145.047 I-.213 J50.424 E.05769
G3 X121.695 Y145.923 I-18.081 J.618 E.03897
G3 X115.317 Y145.947 I-4.327 J-306.234 E.2837
G1 X114.653 Y146.712 E.04507
G1 X114.697 Y153.33 E.29437
M204 S10000
G1 X115.071 Y153.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.539 Y153.772 E.02714
G1 X122.102 Y153.839 E.26951
G3 X122.082 Y155.39 I-13.43 J.6 E.06371
G3 X115.784 Y155.393 I-3.256 J-197.89 E.25861
G3 X114.565 Y155.016 I.043 J-2.297 E.0531
G3 X113.51 Y153.679 I.921 J-1.811 E.07216
G3 X113.422 Y151.504 I14.829 J-1.692 E.08943
G3 X113.466 Y146.684 I129.331 J-1.213 E.19792
G3 X113.664 Y146.011 I1.506 J.077 E.0291
G3 X115.346 Y144.746 I2.141 J1.097 E.0894
G3 X116.758 Y144.653 I1.194 J7.322 E.0582
G3 X120.393 Y144.65 I2.029 J286.473 E.14922
G3 X122.047 Y144.688 I-.008 J36.677 E.06795
G3 X122.051 Y146.284 I-14.086 J.828 E.06558
G3 X115.488 Y146.322 I-4.545 J-220.55 E.26947
G1 X115.029 Y146.851 E.02877
G1 X115.071 Y153.245 E.26252
M204 S10000
G1 X114.272 Y153.357 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549563
G1 F5253.444
M204 S6000
G3 X114.233 Y148.928 I159.616 J-3.635 E.24735
; LINE_WIDTH: 0.522736
G1 F5558.069
G3 X114.24 Y147.031 I145.437 J-.361 E.10009
; LINE_WIDTH: 0.484165
G1 F6063.589
G1 X114.246 Y146.735 E.01435
G3 X114.299 Y146.502 I.409 J-.03 E.01171
; LINE_WIDTH: 0.504072
G1 F5791.72
G3 X114.385 Y146.367 I2.594 J1.55 E.00815
; LINE_WIDTH: 0.539524
G1 F5363.453
G1 X114.447 Y146.277 E.00594
; LINE_WIDTH: 0.571721
G1 F5025.931
G3 X114.676 Y145.994 I2.914 J2.127 E.02125
; LINE_WIDTH: 0.556421
G1 F5180.863
G3 X114.874 Y145.803 I2.171 J2.05 E.01564
; LINE_WIDTH: 0.511786
G1 F5692.806
G1 X114.954 Y145.735 E.00539
; LINE_WIDTH: 0.474205
G1 F6209.427
G1 X115.512 Y145.294 E.03357
M204 S10000
G1 X115.089 Y145.631 F42000
; LINE_WIDTH: 0.423704
G1 F7071.826
M204 S6000
G3 X115.291 Y145.559 I.257 J.401 E.00899
; LINE_WIDTH: 0.465115
G1 F6348.788
G1 X115.41 Y145.54 E.00556
; LINE_WIDTH: 0.501263
G1 F5828.601
G1 X115.537 Y145.523 E.00645
; LINE_WIDTH: 0.537335
G1 F5388.05
G3 X115.75 Y145.506 I.331 J2.833 E.01163
; LINE_WIDTH: 0.591048
G1 F4842.985
G3 X119.411 Y145.484 I2.426 J98.82 E.22178
M73 P81 R2
G3 X120.384 Y145.484 I.47 J142.627 E.05894
; LINE_WIDTH: 0.570829
G1 F5034.706
G2 X121.248 Y145.486 I.581 J-74.02 E.05037
G1 X121.5 Y145.728 E.02038
; WIPE_START
G1 X121.248 Y145.486 E-.21894
G1 X120.384 Y145.484 E-.54106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.344 Y153.056 Z1.16 F42000
G1 X121.541 Y154.613 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.49629
G1 F5895.049
M204 S6000
G1 X119.792 Y154.609 E.08705
; LINE_WIDTH: 0.52245
G1 F5561.514
G1 X118.043 Y154.605 E.09227
; LINE_WIDTH: 0.541749
G1 F5338.669
G3 X115.501 Y154.569 I-.616 J-46.119 E.13971
; LINE_WIDTH: 0.492446
G1 F5947.458
G1 X115.366 Y154.545 E.00676
; LINE_WIDTH: 0.446493
G1 F6654.752
G3 X115.084 Y154.415 I.146 J-.69 E.01379
; LINE_WIDTH: 0.49374
G1 F5929.711
G1 X114.968 Y154.328 E.00719
; LINE_WIDTH: 0.536296
G1 F5399.808
G1 X114.804 Y154.195 E.01147
; LINE_WIDTH: 0.575695
G1 F4987.195
G3 X114.532 Y153.937 I2.556 J-2.966 E.02205
; LINE_WIDTH: 0.557514
G1 F5169.477
G3 X114.395 Y153.767 I1.791 J-1.581 E.0124
; LINE_WIDTH: 0.504165
G1 F5790.505
G3 X114.272 Y153.357 I.475 J-.366 E.02218
; WIPE_START
G1 X114.31 Y153.637 E-.48945
G1 X114.395 Y153.767 E-.27055
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.756 Y146.143 Z1.16 F42000
G1 X115.321 Y134.183 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X115.214 Y134.247 E.00553
G2 X114.784 Y134.929 I.517 J.803 E.03704
G2 X114.684 Y136.566 I9.465 J1.398 E.07303
G1 X114.664 Y142.434 E.26104
G1 X113.827 Y142.418 E.03724
G3 X113.813 Y135.44 I507.954 J-4.501 E.31038
G3 X113.901 Y134.56 I3.431 J-.102 E.03946
G3 X114.747 Y133.527 I1.642 J.481 E.06103
G3 X116.099 Y133.24 I1.133 J2.012 E.06245
G3 X117.057 Y133.408 I.122 J2.124 E.04364
G3 X118.073 Y134.428 I-1.042 J2.054 E.06513
G3 X118.21 Y135.892 I-6.916 J1.387 E.06551
G3 X118.245 Y141.477 I-197.192 J4.024 E.24845
G2 X118.793 Y141.84 I3.362 J-4.476 E.02926
G2 X120.583 Y141.578 I.696 J-1.49 E.08521
G1 X120.762 Y141.323 E.01385
G2 X120.821 Y138.024 I-88.433 J-3.229 E.14681
G3 X120.853 Y133.585 I184.331 J-.91 E.19746
G3 X121.694 Y133.582 I.474 J14.099 E.03743
G3 X121.657 Y141.343 I-166.444 J3.094 E.34529
G3 X120.933 Y142.425 I-1.747 J-.386 E.05926
G3 X119.428 Y142.852 I-1.328 J-1.817 E.07106
G3 X117.463 Y141.703 I-.039 J-2.188 E.10649
G3 X117.345 Y140.272 I6.552 J-1.26 E.06397
G2 X117.295 Y135.415 I-1247.715 J10.507 E.21608
G2 X117.154 Y134.628 I-1.994 J-.048 E.03582
G2 X116.176 Y134.108 I-.951 J.611 E.05147
G2 X115.55 Y134.112 I-.274 J6.121 E.02786
G2 X115.377 Y134.163 I.182 J.938 E.008
M204 S10000
G1 X115.49 Y134.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.15 Y135.011 I.239 J.529 E.02562
G2 X115.059 Y136.569 I9.204 J1.319 E.06417
G1 X115.037 Y142.817 E.25652
G1 X113.454 Y142.786 E.06503
G3 X113.438 Y135.431 I527.43 J-4.797 E.30198
G3 X113.545 Y134.442 I3.73 J-.097 E.04099
G3 X114.552 Y133.206 I1.987 J.591 E.0672
G3 X116.11 Y132.865 I1.324 J2.325 E.06647
G3 X116.987 Y132.971 I.008 J3.618 E.03638
G3 X118.431 Y134.317 I-.877 J2.389 E.08325
G3 X118.585 Y135.881 I-7.11 J1.487 E.06463
G3 X118.619 Y141.277 I-191.103 J3.92 E.22158
G2 X120.2 Y141.415 I.884 J-1.002 E.06974
G2 X120.394 Y141.195 I-.356 J-.51 E.01215
G2 X120.46 Y134.334 I-267.548 J-6.006 E.28173
G3 X120.496 Y133.241 I19.227 J.088 E.04494
G3 X122.057 Y133.246 I.757 J7.182 E.06424
G3 X122.029 Y141.4 I-153.029 J3.539 E.33487
G3 X121.165 Y142.72 I-2.121 J-.445 E.06629
G3 X119.425 Y143.227 I-1.56 J-2.118 E.07594
G3 X118.906 Y143.177 I.206 J-4.837 E.02143
G3 X117.129 Y141.881 I.529 J-2.593 E.09314
G3 X116.986 Y140.805 I3.266 J-.982 E.04476
G3 X116.934 Y135.95 I171.334 J-4.265 E.19938
G2 X116.859 Y134.909 I-5.726 J-.113 E.04289
G2 X116.291 Y134.496 I-.586 J.209 E.03066
G2 X115.613 Y134.484 I-.428 J4.936 E.02783
G2 X115.546 Y134.502 I.116 J.568 E.00285
M204 S10000
G1 X115.631 Y133.679 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524469
G1 F5537.331
M204 S6000
G1 X115.501 Y133.691 E.00696
G2 X114.716 Y134.088 I.236 J1.441 E.04733
; LINE_WIDTH: 0.583661
G1 F4911.314
G2 X114.466 Y134.415 I.788 J.861 E.02467
; LINE_WIDTH: 0.600546
G1 F4757.876
G2 X114.262 Y135.503 I2.438 J1.02 E.06876
; LINE_WIDTH: 0.549529
G1 F5253.817
G1 X114.256 Y135.694 E.01068
G2 X114.243 Y138.645 I107.849 J1.982 E.1648
; LINE_WIDTH: 0.52487
G1 F5532.559
G1 X114.245 Y142.231 E.19015
; WIPE_START
G1 X114.244 Y140.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.631 Y133.679 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.544288
G1 F5310.682
M204 S6000
G3 X116.087 Y133.673 I.269 J3.422 E.02517
G3 X117.426 Y134.246 I.109 J1.597 E.08354
; LINE_WIDTH: 0.575984
G1 F4984.396
G3 X117.612 Y134.529 I-.781 J.717 E.02004
G1 X117.689 Y134.822 E.01782
G1 X117.734 Y135.269 E.02646
G3 X117.801 Y140.771 I-234.918 J5.615 E.32385
; LINE_WIDTH: 0.536174
G1 F5401.189
G2 X117.823 Y141.358 I14.528 J-.241 E.03189
; LINE_WIDTH: 0.499269
G1 F5855.062
G1 X117.837 Y141.526 E.00843
; LINE_WIDTH: 0.456315
G1 F6489.797
G2 X118.042 Y141.826 I.384 J-.042 E.01708
; LINE_WIDTH: 0.491431
G1 F5961.456
G1 X118.149 Y141.917 E.00694
; LINE_WIDTH: 0.516709
G1 F5631.431
G1 X118.244 Y141.993 E.00635
; LINE_WIDTH: 0.55613
G1 F5183.901
G2 X119.224 Y142.409 I1.157 J-1.365 E.06114
G1 X119.351 Y142.419 E.00721
G2 X120.859 Y141.913 I.211 J-1.871 E.09293
G2 X121.213 Y141.275 I-.682 J-.796 E.04215
G2 X121.272 Y133.774 I-226.04 J-5.516 E.42455
; WIPE_START
G1 X121.269 Y135.774 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.874 Y128.151 Z1.16 F42000
G1 X120.736 Y125.496 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X120.749 Y125.461 E.00168
G2 X120.785 Y125.306 I-.681 J-.24 E.00706
G2 X120.84 Y121.881 I-222.109 J-5.29 E.15239
G3 X121.658 Y121.869 I.6 J13.182 E.03639
G3 X121.689 Y131.069 I-363.455 J5.817 E.40922
G3 X120.839 Y131.072 I-.472 J-12.005 E.03778
G3 X120.819 Y128.657 I63.038 J-1.745 E.10744
G2 X120.772 Y127.608 I-9.038 J-.122 E.04672
G2 X120.48 Y127.073 I-.84 J.112 E.02775
G1 X120.225 Y126.974 E.01217
G2 X116.262 Y126.921 I-3.603 J120.385 E.1763
G3 X113.799 Y126.878 I.952 J-126.704 E.10957
G3 X113.801 Y126.026 I20.983 J-.383 E.03791
G3 X118.353 Y126 I3.393 J200.086 E.20253
G2 X120.202 Y125.93 I.362 J-14.833 E.08234
G2 X120.677 Y125.607 I-.134 J-.71 E.02629
G1 X120.708 Y125.549 E.00292
M204 S10000
G1 X120.393 Y125.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.412 Y125.258 I-.322 J-.117 E.00351
G2 X120.473 Y121.684 I-431.298 J-9.119 E.14678
G3 X120.486 Y121.534 I1.876 J.096 E.00618
G3 X121.59 Y121.494 I.875 J9.004 E.0454
G3 X122.012 Y121.512 I-.103 J7.252 E.01733
G3 X122.07 Y124.743 I-82.114 J3.097 E.13267
G3 X122.056 Y131.413 I-272.898 J2.734 E.27387
G3 X120.49 Y131.418 I-.807 J-8.179 E.06438
G3 X120.454 Y130.663 I7.988 J-.754 E.03105
G2 X120.422 Y127.88 I-55.971 J-.737 E.11428
G2 X120.34 Y127.477 I-.984 J-.01 E.01699
G2 X120.146 Y127.346 I-.229 J.129 E.00998
G2 X116.259 Y127.296 I-3.608 J128.888 E.15964
G3 X113.447 Y127.239 I1.127 J-126.045 E.11547
G3 X113.444 Y125.659 I13.82 J-.815 E.06491
G3 X118.351 Y125.626 I4.025 J230.856 E.20147
G2 X120.118 Y125.563 I.351 J-15.171 E.07265
G2 X120.367 Y125.396 I-.047 J-.339 E.01278
M204 S10000
G1 X121.239 Y125.407 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.549792
G1 F5250.992
M204 S6000
G1 X121.253 Y123.223 E.12206
; LINE_WIDTH: 0.520374
G1 F5586.591
G3 X121.249 Y122.287 I106.745 J-.909 E.04914
; LINE_WIDTH: 0.490065
G1 F5980.393
G1 X121.463 Y122.064 E.01518
; WIPE_START
G1 X121.249 Y122.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.629 Y126.086 Z1.16 F42000
G1 X113.992 Y126.452 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.551657
G1 F5231.066
M204 S6000
G1 X114.978 Y126.457 E.0553
; LINE_WIDTH: 0.587403
G1 F4876.463
G2 X118.355 Y126.468 I5.158 J-1097.004 E.20317
; LINE_WIDTH: 0.621084
G1 F4583.687
G1 X119.764 Y126.467 E.09015
M204 S10000
G1 X120.14 Y126.595 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X120.33 Y126.613 E.00787
G1 X120.726 Y126.787 E.01774
G1 X120.986 Y127.085 E.01623
G1 X121.028 Y127.179 E.00424
G1 X121.33 Y127.165 E.01239
G1 X121.323 Y125.784 E.0567
G1 X121 Y125.777 E.01327
G1 X120.826 Y126.018 E.01218
G1 X120.542 Y126.214 E.01418
G1 X120.138 Y126.305 E.01702
G1 X120.139 Y126.535 E.00943
M204 S10000
G1 X120.956 Y126.392 F42000
; LINE_WIDTH: 0.494249
G1 F5922.767
M204 S6000
G2 X120.95 Y126.486 I-.027 J.046 E.01075
M204 S10000
G1 X121.238 Y127.545 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.556339
G1 F5181.717
M204 S6000
G1 X121.262 Y128.653 E.06273
G3 X121.262 Y130.645 I-365.053 J.826 E.11278
; LINE_WIDTH: 0.528915
G1 F5484.822
G1 X121.03 Y130.878 E.01758
; WIPE_START
G1 X121.262 Y130.645 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.993 Y123.017 Z1.16 F42000
G1 X120.577 Y111.167 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X120.547 Y111.142 E.00175
G2 X119.667 Y110.766 I-.846 J.763 E.04394
G2 X119.225 Y110.756 I-.354 J5.881 E.01969
G1 X117.663 Y110.799 E.06948
G1 X117.624 Y115.744 E.21998
G3 X117.608 Y116.394 I-21.223 J-.218 E.02893
G3 X116.713 Y116.368 I-.174 J-9.389 E.03982
G3 X116.735 Y112.743 I550.038 J1.427 E.16124
G2 X116.704 Y111.6 I-16.18 J-.133 E.05088
G1 X116.525 Y110.796 E.03664
G3 X113.806 Y110.716 I4.245 J-190.923 E.12101
G3 X113.817 Y109.911 I31.488 J.033 E.0358
G3 X119.074 Y109.898 I3.3 J266.573 E.23384
G3 X120.383 Y110.012 I.138 J6.018 E.05859
G3 X121.694 Y111.758 I-.523 J1.757 E.10402
G3 X121.695 Y117.925 I-98.644 J3.107 E.27436
G3 X121.435 Y118.897 I-1.778 J.045 E.04537
G3 X120.073 Y119.795 I-1.954 J-1.484 E.07397
G3 X117.037 Y119.83 I-2.057 J-46.276 E.13509
G1 X113.817 Y119.811 E.14321
G1 X113.801 Y118.978 E.03704
G2 X119.629 Y118.917 I.836 J-198.271 E.25925
G2 X120.395 Y118.708 I.032 J-1.391 E.03584
G2 X120.78 Y117.983 I-.603 J-.785 E.03764
G2 X120.822 Y116.29 I-25.853 J-1.485 E.07533
G2 X120.791 Y111.865 I-100.14 J-1.505 E.19688
G2 X120.674 Y111.311 I-1.678 J.065 E.02528
G1 X120.611 Y111.217 E.00504
M204 S10000
G1 X120.272 Y111.385 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.643 Y111.14 I-.646 J.728 E.02829
G2 X119.229 Y111.131 I-.331 J5.508 E.01702
G1 X118.035 Y111.163 E.04903
G3 X117.993 Y116.108 I-229.37 J.496 E.20302
G3 X117.959 Y116.734 I-5.826 J-.003 E.02576
G3 X116.351 Y116.7 I-.661 J-6.741 E.06616
G3 X116.36 Y112.744 I103.805 J-1.757 E.16242
G2 X116.332 Y111.654 I-16.082 J-.129 E.04479
G1 X116.222 Y111.162 E.02067
G3 X113.43 Y111.078 I4.91 J-208.862 E.11471
G3 X113.45 Y109.539 I61.525 J.021 E.0632
G3 X119.082 Y109.523 I3.594 J283.119 E.23126
G3 X120.491 Y109.652 I.137 J6.257 E.05825
G3 X122.068 Y111.74 I-.632 J2.116 E.11497
G3 X122.069 Y117.95 I-98.872 J3.123 E.255
G3 X121.656 Y119.226 I-2.069 J.036 E.05611
G3 X120.221 Y120.156 I-2.247 J-1.894 E.07126
G3 X117.036 Y120.205 I-2.222 J-41.407 E.13081
G1 X113.45 Y120.183 E.14725
G1 X113.419 Y118.606 E.06479
G2 X119.404 Y118.553 I.854 J-243.189 E.24577
G2 X120.083 Y118.458 I.063 J-2.02 E.0283
G2 X120.408 Y117.936 I-.284 J-.539 E.02645
G2 X120.447 Y116.29 I-26.154 J-1.445 E.06763
G2 X120.417 Y111.895 I-101.673 J-1.5 E.18047
G2 X120.301 Y111.437 I-.993 J.007 E.01957
M204 S10000
G1 X120.674 Y110.651 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.583323
G1 F4914.486
M204 S6000
G3 X121.243 Y111.834 I-.814 J1.119 E.08164
G1 X121.253 Y112.059 E.01345
G3 X121.243 Y117.896 I-101.795 J2.736 E.34841
G1 X121.229 Y118.049 E.0092
G3 X120.818 Y118.925 I-1.234 J-.044 E.05936
; LINE_WIDTH: 0.559651
G1 F5147.361
G1 X120.808 Y118.936 E.00083
G3 X119.588 Y119.368 I-1.121 J-1.228 E.07575
G1 X119.432 Y119.373 E.00893
G3 X117.993 Y119.391 I-1.518 J-65.058 E.08199
; LINE_WIDTH: 0.529988
G1 F5472.299
G3 X114.004 Y119.394 I-2.619 J-719.618 E.21384
; WIPE_START
G1 X116.004 Y119.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.163 Y116.195 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.586098
G1 F4888.56
M204 S6000
G3 X117.189 Y113.299 I489.208 J2.962 E.17375
G1 X117.185 Y111.593 E.10239
M204 S10000
G1 X117.048 Y110.327 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523468
G1 F5549.287
M204 S6000
G1 X117.049 Y110.828 E.02649
; LINE_WIDTH: 0.551273
G1 F5235.153
G1 X117.048 Y110.898 E.00395
; LINE_WIDTH: 0.593643
G1 F4819.426
G1 X117.047 Y110.969 E.00429
; LINE_WIDTH: 0.632944
G1 F4488.795
G1 X117.065 Y111.001 E.00237
; LINE_WIDTH: 0.669173
G1 F4221.79
G1 X117.082 Y111.033 E.00252
M204 S10000
G1 X117.472 Y110.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.558151
G1 F5162.86
M204 S6000
G3 X119.065 Y110.329 I2.295 J129.717 E.09053
; LINE_WIDTH: 0.531817
G1 F5451.079
G1 X119.464 Y110.334 E.02149
G3 X120.557 Y110.575 I.116 J2.068 E.06096
G1 X120.674 Y110.651 E.00754
M204 S10000
G1 X116.625 Y110.346 F42000
; LINE_WIDTH: 0.546922
G1 F5281.948
M204 S6000
G1 X115.315 Y110.331 E.07275
; LINE_WIDTH: 0.509107
G1 F5726.778
G1 X114.005 Y110.317 E.0671
; WIPE_START
G1 X115.315 Y110.331 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.164 Y102.7 Z1.16 F42000
G1 X115.115 Y100.263 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X116.109 Y101.322 E.06462
G2 X119.044 Y103.992 I52.429 J-54.693 E.17651
G3 X121.736 Y106.413 I-170.214 J191.92 E.16102
G3 X121.715 Y107.734 I-104.989 J-.94 E.05875
G3 X113.746 Y107.743 I-4.756 J-646.551 E.35452
G3 X113.754 Y106.813 I13.358 J-.337 E.04139
G3 X117.804 Y106.792 I3.029 J194.358 E.18012
G2 X119.237 Y106.71 I.248 J-8.212 E.06393
G1 X119.378 Y106.658 E.00671
G1 X120.06 Y106.197 E.03661
G2 X118.818 Y104.944 I-9.327 J8.008 E.07855
G3 X113.745 Y100.397 I385.239 J-434.778 E.30303
G3 X113.752 Y99.133 I23.066 J-.519 E.05623
G3 X120.468 Y99.095 I5.121 J317.268 E.29878
G3 X121.777 Y99.119 I-.016 J37.102 E.05822
G3 X121.797 Y100.1 I-9.397 J.683 E.04367
G2 X116.802 Y100.148 I13.314 J1658.362 E.22221
G2 X115.175 Y100.257 I1.096 J28.375 E.07253
M204 S10000
G1 X115.927 Y100.58 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.296 Y102.831 I23.246 J-22.101 E.13423
G3 X122.113 Y106.25 I-232.379 J263.166 E.2104
G3 X122.083 Y108.107 I-148.094 J-1.41 E.07623
G3 X113.387 Y108.109 I-4.459 J-502.798 E.35708
G3 X113.4 Y106.448 I22.096 J-.653 E.06822
G3 X118.522 Y106.406 I4.506 J238.501 E.21032
G2 X119.206 Y106.322 I.032 J-2.561 E.02839
G1 X119.49 Y106.13 E.01408
G2 X118.566 Y105.222 I-7.317 J6.529 E.05323
G3 X113.37 Y100.557 I302.231 J-341.854 E.28669
G3 X113.4 Y98.772 I17.451 J-.606 E.07337
G3 X120.47 Y98.72 I5.189 J228.924 E.29032
G3 X122.112 Y98.766 I.34 J17.451 E.06748
G3 X122.139 Y100.445 I-7.415 J.958 E.06909
G3 X120.959 Y100.489 I-.874 J-7.447 E.04854
G2 X116.593 Y100.532 I-.667 J156.379 E.1793
G1 X115.987 Y100.576 E.02494
M204 S10000
G1 X115.431 Y101.286 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.589785
G1 F4854.534
M204 S6000
G1 X115.784 Y101.634 E.02994
; LINE_WIDTH: 0.535526
G1 F5408.553
G2 X119.105 Y104.624 I116.807 J-126.382 E.24242
G1 X119.614 Y105.087 E.03728
; LINE_WIDTH: 0.563016
G1 F5112.922
G3 X120.175 Y105.631 I-12.025 J12.963 E.04488
; LINE_WIDTH: 0.607406
G1 F4698.243
G1 X120.53 Y105.983 E.03118
M204 S10000
G1 X119.252 Y107.37 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F7144.644
M204 S6000
G1 X121.346 Y107.36 E.08598
G1 X121.358 Y106.578 E.03213
G1 X120.887 Y106.155 E.02599
G1 X120.446 Y106.601 E.02575
G1 X120.275 Y106.649 E.00729
G1 X120.138 Y106.597 E.00603
G1 X119.563 Y106.986 E.02848
G1 X119.245 Y107.078 E.0136
G1 X119.251 Y107.31 E.00953
M204 S10000
M73 P82 R2
G1 X120.188 Y107.002 F42000
; LINE_WIDTH: 0.423508
G1 F7075.639
M204 S6000
G1 X120.354 Y107.004 E.00688
M204 S10000
G1 X120.414 Y107.005 F42000
; LINE_WIDTH: 0.406861
G1 F7415.318
M204 S6000
G1 X120.715 Y107.016 E.01193
; LINE_WIDTH: 0.373577
G1 F8202.637
G1 X121.017 Y107.027 E.01079
G1 X121.02 Y106.778 E.00894
G2 X120.901 Y106.617 I-.236 J.051 E.00739
G1 X120.685 Y106.838 E.01103
; LINE_WIDTH: 0.396754
G1 F7637.945
G1 X120.465 Y106.974 E.00995
M204 S10000
G1 X118.874 Y107.256 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.628414
G1 F4524.573
M204 S6000
G1 X117.805 Y107.272 E.06933
G2 X115.316 Y107.274 I-.801 J441.112 E.16136
G2 X113.942 Y107.278 I-.353 J138.553 E.08909
; WIPE_START
G1 X115.316 Y107.274 E-.52215
G1 X115.942 Y107.274 E-.23785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.431 Y101.286 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.618633
G1 F4603.804
M204 S6000
G1 X115.081 Y100.946 E.03108
M204 S10000
G1 X114.72 Y100.809 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383976
G1 F7939.26
M204 S6000
G1 X114.934 Y100.588 E.01137
G1 X114.57 Y100.211 E.01937
; LINE_WIDTH: 0.414329
G1 F7259.001
G1 X114.504 Y100.096 E.00536
; LINE_WIDTH: 0.453139
G1 F6542.243
G1 X114.523 Y100.014 E.00378
; LINE_WIDTH: 0.483065
G1 F6079.37
G1 X114.541 Y99.931 E.00407
G1 X114.679 Y99.902 E.00678
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X116.438 Y99.805 E.07383
; LINE_WIDTH: 0.38011
G1 F8035.178
G1 X116.793 Y99.787 E.01296
G3 X121.449 Y99.757 I9.125 J1054.978 E.17
G1 X121.443 Y99.459 E.01089
G1 X120.466 Y99.447 E.03565
G2 X116.424 Y99.462 I1.138 J844.588 E.14759
; LINE_WIDTH: 0.427348
G1 F7001.657
G1 X114.662 Y99.511 E.07383
; LINE_WIDTH: 0.465364
G1 F6344.898
G1 X114.415 Y99.528 E.01145
; LINE_WIDTH: 0.478074
G1 F6151.955
G1 X114.168 Y99.546 E.01181
G1 X114.129 Y100.094 E.02622
; LINE_WIDTH: 0.435979
G1 F6840.907
G1 X114.13 Y100.229 E.00581
; LINE_WIDTH: 0.422549
G1 F7094.379
G1 X114.368 Y100.467 E.0139
; LINE_WIDTH: 0.390725
G1 F7777.206
G2 X114.676 Y100.769 I3.692 J-3.462 E.01627
; WIPE_START
G1 X114.368 Y100.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.749 Y92.844 Z1.16 F42000
G1 X114.919 Y89.43 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S6000
G1 X114.843 Y89.562 E.00676
G2 X114.739 Y89.97 I.791 J.421 E.01892
G2 X114.779 Y94.812 I71.105 J1.831 E.21544
G2 X115.296 Y95.865 I1.238 J.045 E.05437
G2 X116.094 Y96.068 I.893 J-1.84 E.03688
G2 X119.449 Y96.081 I1.819 J-34.674 E.14928
G2 X120.507 Y95.59 I-.008 J-1.4 E.0535
G2 X120.692 Y95.068 I-.909 J-.616 E.02488
G2 X120.759 Y92.744 I-28.998 J-2.002 E.10348
G1 X120.802 Y88.162 E.20379
G1 X121.707 Y88.162 E.04024
G3 X121.685 Y95.394 I-238.073 J2.92 E.32168
G3 X120.423 Y96.875 I-2.547 J-.892 E.08856
G3 X119.426 Y97.052 I-1.055 J-3.041 E.04524
G3 X115.658 Y97.016 I-1.571 J-32.653 E.16773
G3 X114.374 Y96.304 I.229 J-1.926 E.06697
G3 X113.8 Y94.977 I1.467 J-1.422 E.06574
G3 X113.754 Y92.293 I34.1 J-1.918 E.11943
G1 X113.777 Y88.158 E.18395
G3 X118.142 Y88.143 I3.039 J242.645 E.1942
G1 X118.263 Y88.147 E.00536
G3 X118.273 Y92.01 I-88.309 J2.168 E.17185
G3 X117.285 Y91.976 I.262 J-22.511 E.04398
G2 X117.223 Y89.879 I-33.386 J-.057 E.09333
G2 X117.005 Y89.282 I-1.237 J.112 E.02861
G2 X115.982 Y89.097 I-.831 J1.669 E.04689
G2 X115.083 Y89.276 I-.084 J1.921 E.04118
G2 X114.963 Y89.389 I.552 J.706 E.00733
M204 S10000
G1 X115.233 Y89.651 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.112 Y90.001 I.404 J.334 E.01554
G2 X115.153 Y94.784 I71.116 J1.79 E.1964
G2 X115.412 Y95.482 I.957 J.042 E.03141
G2 X116.123 Y95.694 I.674 J-.96 E.031
G2 X119.413 Y95.708 I1.794 J-34.451 E.13512
G2 X120.205 Y95.363 I-.013 J-1.112 E.03643
G2 X120.319 Y95.021 I-.582 J-.384 E.015
G2 X120.384 Y92.739 I-28.895 J-1.961 E.09374
G1 X120.43 Y87.787 E.20333
G1 X122.08 Y87.787 E.06773
G3 X122.055 Y95.468 I-239.153 J3.044 E.31537
G3 X120.635 Y97.192 I-2.955 J-.987 E.09379
G3 X119.448 Y97.427 I-1.185 J-2.874 E.05
G3 X115.611 Y97.388 I-1.59 J-32.963 E.15765
G3 X114.095 Y96.555 I.265 J-2.278 E.07281
G3 X113.426 Y95.01 I1.744 J-1.673 E.07062
G3 X113.379 Y92.293 I34.395 J-1.95 E.11161
G1 X113.404 Y87.786 E.18506
G3 X118.15 Y87.768 I3.368 J260.389 E.19487
G3 X118.614 Y87.808 I.022 J2.477 E.01916
G3 X118.666 Y91.22 I-42.344 J2.346 E.14018
G3 X118.612 Y92.383 I-10.19 J.116 E.04782
G3 X116.916 Y92.336 I-.076 J-28.108 E.06971
G2 X116.85 Y89.921 I-38.033 J-.176 E.09922
G2 X116.739 Y89.573 I-.766 J.052 E.01514
G2 X115.993 Y89.471 I-.566 J1.36 E.03129
G2 X115.29 Y89.592 I-.087 J1.603 E.02951
G2 X115.273 Y89.607 I.346 J.394 E.00093
; WIPE_START
M204 S6000
G1 X115.174 Y89.726 E-.05886
G1 X115.14 Y89.819 E-.03768
G1 X115.112 Y90.001 E-.07005
G1 X115.091 Y90.687 E-.26076
G1 X115.093 Y91.556 E-.33017
G1 X115.093 Y91.563 E-.00247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.244 Y89.958 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.641277
G1 F4424.431
M204 S6000
G1 X114.238 Y91.563 E.10639
G2 X114.293 Y94.934 I54.656 J.795 E.22358
G1 X114.319 Y95.162 E.0152
G2 X115.27 Y96.405 I1.722 J-.332 E.10757
; LINE_WIDTH: 0.650095
G1 F4358.303
G1 X115.325 Y96.429 E.00403
G2 X116.653 Y96.583 I1.197 J-4.518 E.09034
G2 X119.594 Y96.553 I1.138 J-32.466 E.19798
G1 X119.745 Y96.535 E.01028
G2 X120.635 Y96.138 I-.116 J-1.459 E.06687
; LINE_WIDTH: 0.621517
G1 F4580.153
G2 X120.857 Y95.906 I-1.353 J-1.515 E.0206
; LINE_WIDTH: 0.594007
G1 F4816.147
G1 X120.851 Y95.883 E.00144
; LINE_WIDTH: 0.551634
G1 F5231.313
G1 X120.817 Y95.776 E.00628
; LINE_WIDTH: 0.506941
G1 F5754.531
G1 X120.784 Y95.669 E.00571
; LINE_WIDTH: 0.462249
G1 F6394.042
G1 X120.75 Y95.562 E.00514
M204 S10000
G1 X120.975 Y95.178 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407264
G1 F7406.713
M204 S6000
G1 X121.099 Y95.162 E.00495
G1 X121.252 Y95.238 E.00673
M204 S10000
G1 X121.206 Y94.884 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.637487
G1 F4453.476
M204 S6000
G2 X121.236 Y92.75 I-84.506 J-2.275 E.1406
; LINE_WIDTH: 0.605758
G1 F4712.431
G2 X121.254 Y88.357 I-775.829 J-5.261 E.27346
; WIPE_START
G1 X121.246 Y90.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.476 Y91.714 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.220992
G1 F12000
M204 S6000
G1 X118.004 Y91.723 E.00969
G1 X118.085 Y91.809 E.00218
M204 S10000
G1 X117.93 Y91.26 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.404762
G1 F7460.478
M204 S6000
G2 X117.899 Y88.518 I-106.425 J-.172 E.10782
G1 X116.934 Y88.522 E.03796
; LINE_WIDTH: 0.441262
G1 F6746.094
G1 X116.846 Y88.543 E.00393
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X116.758 Y88.565 E.00437
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X116.67 Y88.587 E.0048
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X116.583 Y88.608 E.00524
; LINE_WIDTH: 0.611365
G1 F4664.495
G1 X116.495 Y88.63 E.00568
G1 X116.639 Y88.697 E.01002
; LINE_WIDTH: 0.568839
G1 F5054.395
G1 X116.784 Y88.764 E.00925
; LINE_WIDTH: 0.526313
G1 F5515.424
G1 X116.928 Y88.831 E.00848
; LINE_WIDTH: 0.483787
G1 F6068.999
G1 X117.073 Y88.899 E.0077
; LINE_WIDTH: 0.424698
G1 F7052.56
G3 X117.3 Y89.042 I-.114 J.434 E.01135
G1 X117.51 Y89.43 E.01834
; LINE_WIDTH: 0.388623
G1 F7826.96
G1 X117.595 Y90.009 E.02194
G3 X117.622 Y91.255 I-203.786 J5.075 E.04671
G1 X117.87 Y91.259 E.00928
M204 S10000
G1 X117.591 Y88.818 F42000
; LINE_WIDTH: 0.362949
G1 F8490.486
M204 S6000
G1 X117.534 Y88.851 E.00226
G1 X117.572 Y88.873 E.0015
M204 S10000
G1 X116.012 Y88.635 F42000
; LINE_WIDTH: 0.635768
G1 F4466.768
M204 S6000
G1 X116.435 Y88.63 E.02778
M204 S10000
G1 X114.499 Y88.829 F42000
; LINE_WIDTH: 0.362009
G1 F8516.92
M204 S6000
G1 X114.442 Y88.861 E.00225
G1 X114.48 Y88.883 E.00148
M204 S10000
G1 X114.439 Y89.583 F42000
; LINE_WIDTH: 0.419499
G1 F7154.583
M204 S6000
G1 X114.51 Y89.372 E.00911
G3 X115.119 Y88.847 I1.014 J.56 E.0337
; LINE_WIDTH: 0.400488
G1 F7554.139
G1 X115.368 Y88.818 E.00972
; LINE_WIDTH: 0.369909
G1 F8299.75
G1 X115.616 Y88.788 E.00884
; LINE_WIDTH: 0.378309
G1 F8080.642
G1 X115.682 Y88.763 E.00257
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X115.748 Y88.737 E.00295
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X115.814 Y88.711 E.00333
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X115.88 Y88.686 E.00372
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X115.946 Y88.66 E.0041
; LINE_WIDTH: 0.615218
G1 F4632.126
G1 X116.012 Y88.635 E.00448
G1 X115.945 Y88.611 E.00448
; LINE_WIDTH: 0.567836
G1 F5064.385
G1 X115.878 Y88.588 E.0041
; LINE_WIDTH: 0.520454
G1 F5585.62
G1 X115.812 Y88.564 E.00372
; LINE_WIDTH: 0.473073
G1 F6226.458
G1 X115.745 Y88.541 E.00333
; LINE_WIDTH: 0.425691
G1 F7033.4
G1 X115.678 Y88.517 E.00295
; LINE_WIDTH: 0.384389
G1 F7929.166
G1 X115.612 Y88.494 E.00262
G1 X115.082 Y88.526 E.01965
; LINE_WIDTH: 0.419425
G1 F7156.055
G3 X114.15 Y88.532 I-1.236 J-132.775 E.03818
G1 X114.147 Y89.583 E.04311
G1 X114.379 Y89.583 E.00953
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F7156.055
G1 X114.147 Y89.583 E-.08836
G1 X114.15 Y88.532 E-.39958
G1 X114.866 Y88.527 E-.27207
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
M625
; layer num/total_layer_count: 4/4
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S178.5
; OBJECT_ID: 425
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
M204 S10000
G17
G3 Z1.16 I-1.149 J.4 P1  F42000
G1 X139.29 Y158.744 Z1.16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.987 Y158.5 I-.333 J.103 E.01695
G2 X134.849 Y158.446 I-3.136 J81.101 E.16991
G3 X133.891 Y158.425 I.177 J-30.547 E.03935
G3 X133.896 Y156.849 I19.174 J-.726 E.06473
G3 X142.548 Y156.845 I4.486 J339.234 E.35522
G3 X142.509 Y158.718 I-16.043 J.61 E.07694
G2 X137.527 Y162.235 I92.352 J136.117 E.25044
G2 X137.511 Y162.766 I.228 J.272 E.02466
G2 X138.481 Y163.521 I5.136 J-5.599 E.0505
G3 X140.97 Y165.261 I-62.508 J92.047 E.12471
G3 X142.513 Y166.333 I-20.556 J31.239 E.07716
G3 X142.532 Y168.238 I-9.92 J1.052 E.07836
G3 X133.89 Y168.206 I-2.371 J-525.515 E.35484
G3 X133.893 Y166.622 I20.563 J-.763 E.06507
G2 X138.705 Y166.583 I1.29 J-138.139 E.19762
G2 X139.166 Y166.444 I.068 J-.606 E.0203
G2 X139.075 Y165.961 I-.269 J-.199 E.02262
G1 X138.91 Y165.834 E.00856
G3 X134.425 Y162.652 I529.335 J-750.724 E.22582
G1 X134.249 Y162.514 E.00914
G3 X138.155 Y159.755 I118.625 J163.795 E.19635
G2 X139.195 Y158.982 I-17.05 J-24.021 E.0532
G1 X139.261 Y158.902 E.00428
G1 X139.279 Y158.803 E.00411
; WIPE_START
M204 S6000
G1 X139.22 Y158.61 E-.07674
G1 X139.142 Y158.543 E-.039
G1 X138.987 Y158.5 E-.0612
G1 X137.516 Y158.459 E-.55924
G1 X137.453 Y158.458 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
; stop printing object, unique label id: 425
M625
; object ids of layer 4 start: 169,331,425
M624 BwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.44
G1 X0 Y128 F18000 ; move to safe pos
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


; object ids of this layer4 end: 169,331,425
M625
; start printing object, unique label id: 425
M624 BAAAAAAAAAA=
G1 X139.74 Y160.398 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.35 Y157.788 E.16417
G1 X142.362 Y157.225
G1 X137.834 Y161.753 E.28484
; WIPE_START
M204 S6000
G1 X139.248 Y160.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.361 Y167.151 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.474 Y168.039 E.05583
G1 X140.922 Y168.039
G1 X142.34 Y166.621 E.08918
G1 X142.113 Y166.297
G1 X140.371 Y168.039 E.1096
G1 X139.82 Y168.039
G1 X141.789 Y166.07 E.12387
G1 X141.464 Y165.843
G1 X139.268 Y168.039 E.13814
G1 X138.717 Y168.039
G1 X141.14 Y165.616 E.15241
G1 X140.815 Y165.389
G1 X138.165 Y168.039 E.16668
G1 X137.615 Y168.038
G1 X138.886 Y166.767 E.07996
G1 X138.31 Y166.791
G1 X137.068 Y168.033 E.07817
G1 X136.521 Y168.029
G1 X137.747 Y166.802 E.07715
G1 X137.188 Y166.811
G1 X135.974 Y168.024 E.07635
G1 X135.427 Y168.02
G1 X136.635 Y166.812 E.07595
G1 X136.081 Y166.814
G1 X134.88 Y168.015 E.07555
G1 X134.333 Y168.011
G1 X135.528 Y166.816 E.07515
G1 X134.975 Y166.818
G1 X134.08 Y167.713 E.05629
; WIPE_START
M204 S6000
M73 P83 R2
G1 X134.975 Y166.818 E-.48084
G1 X135.528 Y166.816 E-.21023
G1 X135.4 Y166.944 E-.06893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.434 Y166.218 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.491 Y165.162 E.06645
G1 X140.166 Y164.935
G1 X139.249 Y165.852 E.05768
G1 X138.933 Y165.616
G1 X139.842 Y164.708 E.05713
G1 X139.517 Y164.481
G1 X138.611 Y165.388 E.05702
G1 X138.288 Y165.159
G1 X139.193 Y164.254 E.05691
G1 X138.868 Y164.027
G1 X137.965 Y164.93 E.0568
G1 X137.643 Y164.701
G1 X138.544 Y163.8 E.05668
G1 X138.219 Y163.573
G1 X137.32 Y164.473 E.05657
G1 X136.997 Y164.244
G1 X137.895 Y163.347 E.05646
G1 X137.585 Y163.105
G1 X136.675 Y164.015 E.05727
G1 X136.352 Y163.787
G1 X137.314 Y162.825 E.0605
G1 X137.207 Y162.38
G1 X136.029 Y163.558 E.0741
G1 X135.706 Y163.329
G1 X141.993 Y157.042 E.39549
G1 X141.444 Y157.04
G1 X135.384 Y163.1 E.38126
G1 X135.062 Y162.87
G1 X137.391 Y160.542 E.14649
; WIPE_START
M204 S6000
G1 X135.977 Y161.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.403 Y158.53 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.896 Y157.037 E.0939
G1 X140.347 Y157.035
G1 X139.066 Y158.315 E.08055
G1 X138.547 Y158.283
G1 X139.798 Y157.032 E.0787
G1 X139.249 Y157.03
G1 X138.002 Y158.277 E.07843
G1 X137.457 Y158.27
G1 X138.7 Y157.027 E.07817
G1 X138.151 Y157.025
G1 X136.913 Y158.263 E.0779
G1 X136.368 Y158.256
G1 X137.602 Y157.022 E.07763
G1 X137.05 Y157.023
G1 X135.823 Y158.25 E.07718
G1 X135.278 Y158.243
G1 X136.494 Y157.027 E.07647
G1 X135.938 Y157.032
G1 X134.734 Y158.236 E.07576
G1 X134.189 Y158.23
G1 X135.382 Y157.037 E.07505
G1 X134.826 Y157.041
G1 X134.08 Y157.787 E.04691
; WIPE_START
M204 S6000
G1 X134.826 Y157.041 E-.40074
G1 X135.382 Y157.037 E-.21129
G1 X135.107 Y157.312 E-.14797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.465 Y164.166 Z1.44 F42000
G1 X139.504 Y166.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
M204 S6000
G3 X139.443 Y166.414 I-.668 J-.248 E.00196
; LINE_WIDTH: 0.147062
G1 X139.381 Y166.498 E.00103
; LINE_WIDTH: 0.120275
G1 X139.319 Y166.581 E.00071
M204 S10000
G1 X139.308 Y166.59 F42000
; LINE_WIDTH: 0.135238
G1 F12000
M204 S6000
G3 X138.969 Y166.851 I-1.789 J-1.977 E.00367
; WIPE_START
G1 X139.308 Y166.59 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.772 Y161.691 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M204 S6000
G1 X137.521 Y161.914 E.00708
; LINE_WIDTH: 0.210796
G2 X137.139 Y162.312 I.765 J1.117 E.00955
; WIPE_START
G1 X137.269 Y162.137 E-.29908
G1 X137.521 Y161.914 E-.46092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.37 Y161.257 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
M204 S6000
G1 X136.18 Y161.416 E.00193
; LINE_WIDTH: 0.171253
G1 X135.99 Y161.575 E.00314
; LINE_WIDTH: 0.214175
G1 X135.801 Y161.734 E.00435
; LINE_WIDTH: 0.257097
G1 X135.611 Y161.893 E.00556
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X135.421 Y162.052 E.00678
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X135.231 Y162.211 E.00799
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X135.041 Y162.37 E.0092
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X134.724 Y162.643 E.01739
; WIPE_START
G1 X135.041 Y162.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.239 Y159.939 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
M204 S6000
G1 X138.016 Y160.129 E.00234
; LINE_WIDTH: 0.176706
G1 X137.792 Y160.318 E.00389
; LINE_WIDTH: 0.223354
G1 X137.568 Y160.508 E.00547
; LINE_WIDTH: 0.251283
G1 X137.454 Y160.604 E.00327
; WIPE_START
G1 X137.568 Y160.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.678 Y160.336 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
M204 S6000
G1 X139.476 Y160.505 E.0053
; LINE_WIDTH: 0.198217
G1 X139.273 Y160.674 E.00416
; LINE_WIDTH: 0.161001
G1 X139.097 Y160.823 E.00265
; LINE_WIDTH: 0.124914
G1 X138.921 Y160.972 E.0017
; WIPE_START
G1 X139.097 Y160.823 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.376 Y157.061 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
M204 S6000
G1 X142.012 Y157.06 E.00307
; WIPE_START
G1 X142.376 Y157.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.345 Y158.362 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
M204 S6000
G1 X142.117 Y158.552 E.01171
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X141.889 Y158.743 E.01015
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X141.661 Y158.933 E.00859
; LINE_WIDTH: 0.267734
G1 F12000
G1 X141.433 Y159.124 E.00704
; LINE_WIDTH: 0.221773
G1 X141.205 Y159.314 E.00548
; LINE_WIDTH: 0.175812
G1 X140.977 Y159.505 E.00392
; LINE_WIDTH: 0.129851
G1 X140.749 Y159.695 E.00236
; WIPE_START
G1 X140.977 Y159.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.937 Y153.773 Z1.44 F42000
G1 X135.524 Y153.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X135.992 Y153.772 E.02714
G1 X142.555 Y153.839 E.26951
G3 X142.535 Y155.39 I-13 J.608 E.06372
G3 X136.348 Y155.398 I-3.399 J-245.281 E.25403
G3 X135.031 Y155.024 I-.048 J-2.338 E.05706
G3 X133.961 Y153.669 I.909 J-1.818 E.07322
G3 X133.883 Y152.458 I10.929 J-1.314 E.04987
G3 X133.924 Y146.621 I121.66 J-2.071 E.23966
G3 X134.057 Y146.142 I1.388 J.127 E.02054
G3 X135.654 Y144.786 I2.157 J.923 E.08918
G3 X136.57 Y144.667 I.851 J2.971 E.03807
G3 X140.649 Y144.649 I2.997 J209.491 E.16747
G3 X142.499 Y144.684 I-.321 J64.879 E.07599
G3 X142.504 Y146.285 I-14.645 J.846 E.06577
G3 X135.941 Y146.322 I-4.443 J-206.777 E.26951
G1 X135.482 Y146.851 E.02877
G1 X135.524 Y153.245 E.26252
; WIPE_START
M204 S6000
G1 X135.992 Y153.772 E-.26789
G1 X137.287 Y153.785 E-.49211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.635 Y155.195 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.362 Y154.468 E.04576
G1 X142.243 Y154.036
G1 X141.081 Y155.198 E.0731
G1 X140.527 Y155.2
G1 X141.697 Y154.03 E.07362
G1 X141.151 Y154.024
G1 X139.973 Y155.203 E.07414
G1 X139.419 Y155.206
G1 X140.605 Y154.019 E.07466
G1 X140.06 Y154.013
G1 X138.864 Y155.208 E.07519
G1 X138.31 Y155.211
G1 X139.514 Y154.008 E.07571
G1 X138.968 Y154.002
G1 X137.756 Y155.214 E.07623
G1 X137.21 Y155.209
G1 X138.422 Y153.996 E.07627
G1 X137.876 Y153.991
G1 X136.665 Y155.202 E.07621
G1 X136.137 Y155.179
G1 X137.331 Y153.985 E.07511
G1 X136.785 Y153.98
G1 X135.665 Y155.1 E.07046
G1 X135.281 Y154.932
G1 X136.239 Y153.974 E.06027
G1 X135.8 Y153.862
G1 X134.939 Y154.722 E.05412
G1 X134.632 Y154.479
G1 X135.524 Y153.586 E.05613
G1 X135.324 Y153.234
G1 X134.384 Y154.175 E.05916
G1 X134.204 Y153.803
G1 X135.321 Y152.687 E.07024
G1 X135.317 Y152.139
G1 X134.124 Y153.332 E.07508
G1 X134.092 Y152.812
G1 X135.313 Y151.591 E.07681
G1 X135.31 Y151.043
G1 X134.086 Y152.267 E.07701
G1 X134.079 Y151.723
G1 X135.306 Y150.495 E.07722
G1 X135.303 Y149.948
G1 X134.074 Y151.177 E.07731
G1 X134.074 Y150.625
G1 X135.299 Y149.4 E.07706
G1 X135.295 Y148.852
G1 X134.074 Y150.073 E.07682
G1 X134.075 Y149.521
G1 X135.292 Y148.304 E.07657
G1 X135.288 Y147.756
G1 X134.075 Y148.969 E.07629
G1 X134.082 Y148.411
G1 X135.284 Y147.209 E.07563
; WIPE_START
M204 S6000
G1 X134.082 Y148.411 E-.64606
G1 X134.079 Y148.711 E-.11394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.319 Y146.295 Z1.44 F42000
G1 X141.909 Y146.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.319 Y145.688 E.02584
G1 X142.314 Y145.142
G1 X141.345 Y146.111 E.06095
G1 X140.786 Y146.119
G1 X142.03 Y144.875 E.07828
G1 X141.489 Y144.864
G1 X140.234 Y146.119 E.07896
G1 X139.682 Y146.12
G1 X140.948 Y144.854 E.07963
G1 X140.402 Y144.848
G1 X139.13 Y146.12 E.08
G1 X138.578 Y146.121
G1 X139.849 Y144.849 E.07996
G1 X139.297 Y144.85
G1 X138.026 Y146.121 E.07993
G1 X137.475 Y146.121
G1 X138.745 Y144.851 E.07989
G1 X138.192 Y144.852
G1 X136.923 Y146.122 E.07986
G1 X136.371 Y146.122
G1 X137.64 Y144.853 E.07983
G1 X137.088 Y144.854
G1 X134.089 Y147.852 E.18861
G1 X134.096 Y147.294
G1 X136.517 Y144.874 E.15226
G1 X135.912 Y144.927
M73 P84 R2
G1 X134.126 Y146.713 E.11235
; WIPE_START
M204 S6000
G1 X135.54 Y145.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.48 Y145.053 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
M204 S6000
G1 X135.378 Y145.124 E.00121
; LINE_WIDTH: 0.179713
G1 X135.276 Y145.196 E.0017
; LINE_WIDTH: 0.214273
G1 X135.174 Y145.268 E.00219
; LINE_WIDTH: 0.246896
G1 X135.062 Y145.358 E.00307
; LINE_WIDTH: 0.29318
G1 F11031.832
G2 X134.515 Y145.896 I2.887 J3.484 E.02041
; LINE_WIDTH: 0.258333
G1 F12000
G1 X134.353 Y146.106 E.00601
; LINE_WIDTH: 0.223912
G1 X134.191 Y146.317 E.00496
; WIPE_START
G1 X134.353 Y146.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.347 Y141.464 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.049 Y141.613 I.624 J-1.213 E.02981
G2 X140.765 Y141.314 I-.032 J-1.084 E.03257
G1 X140.847 Y141.193 E.00601
G2 X140.904 Y135.396 I-181.781 J-4.692 E.23802
G3 X140.948 Y133.239 I43.647 J-.185 E.08859
G3 X142.51 Y133.235 I.812 J10.002 E.06417
G3 X142.482 Y141.4 I-150.39 J3.57 E.33531
G3 X141.61 Y142.727 I-2.124 J-.446 E.06674
G3 X139.762 Y143.224 I-1.577 J-2.178 E.08032
G3 X137.596 Y141.915 I.09 J-2.595 E.10852
G3 X137.441 Y140.872 I3.454 J-1.046 E.04347
G3 X137.373 Y135.428 I1915.931 J-26.801 E.22356
G2 X137.251 Y134.773 I-1.59 J-.042 E.02757
G2 X136.736 Y134.495 I-.586 J.471 E.02467
G2 X135.929 Y134.524 I-.334 J1.963 E.0334
G2 X135.581 Y135.127 I.387 J.624 E.02976
G2 X135.513 Y136.473 I9.909 J1.176 E.05541
G1 X135.49 Y142.817 E.26046
G1 X133.906 Y142.786 E.06503
G3 X133.894 Y135.3 I461.903 J-4.514 E.30736
G3 X134.408 Y133.682 I2.375 J-.136 E.07126
G3 X136.451 Y132.863 I1.884 J1.741 E.09341
G1 X136.684 Y132.869 E.00956
G3 X137.546 Y133.011 I.016 J2.586 E.03607
G3 X138.86 Y134.246 I-1.104 J2.491 E.07544
G3 X139.032 Y135.712 I-5.63 J1.405 E.06078
G3 X139.061 Y137.304 I-54.389 J1.79 E.06535
G1 X139.072 Y141.277 E.16314
G2 X139.294 Y141.435 I.899 J-1.026 E.01122
; WIPE_START
M204 S6000
G1 X139.521 Y141.551 E-.09681
G1 X139.772 Y141.608 E-.09788
G1 X140.049 Y141.613 E-.10507
G1 X140.193 Y141.594 E-.05506
G1 X140.438 Y141.527 E-.09672
G1 X140.64 Y141.424 E-.08624
G1 X140.765 Y141.314 E-.0631
G1 X140.847 Y141.193 E-.05561
M73 P84 R1
G1 X140.853 Y140.92 E-.10352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.924 Y142.606 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X135.293 Y142.238 E.02318
G1 X135.295 Y141.684
G1 X134.383 Y142.596 E.05733
G1 X134.104 Y142.323
G1 X135.297 Y141.131 E.07501
G1 X135.299 Y140.577
G1 X134.103 Y141.774 E.07525
G1 X134.101 Y141.224
G1 X135.301 Y140.024 E.07549
G1 X135.303 Y139.47
G1 X134.099 Y140.674 E.07573
G1 X134.097 Y140.125
G1 X135.305 Y138.917 E.07597
G1 X135.307 Y138.364
G1 X134.095 Y139.575 E.0762
G1 X134.094 Y139.025
G1 X135.309 Y137.81 E.07644
G1 X135.311 Y137.257
G1 X134.092 Y138.476 E.07668
G1 X134.09 Y137.926
G1 X135.313 Y136.703 E.07692
G1 X135.322 Y136.143
G1 X134.088 Y137.376 E.0776
G1 X134.087 Y136.827
G1 X135.34 Y135.573 E.07887
G1 X135.413 Y134.949
G1 X134.085 Y136.277 E.08356
; WIPE_START
M204 S6000
G1 X135.413 Y134.949 E-.71381
G1 X135.399 Y135.07 E-.04619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.616 Y141.431 Z1.44 F42000
G1 X140.632 Y142.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.285 Y141.311 E.10399
G1 X142.307 Y140.738
G1 X140.022 Y143.022 E.14373
G1 X139.502 Y142.991
G1 X142.324 Y140.169 E.17755
G1 X142.33 Y139.612
G1 X141.053 Y140.889 E.08031
G1 X141.066 Y140.324
G1 X142.335 Y139.055 E.07985
G1 X142.341 Y138.498
G1 X141.079 Y139.76 E.07939
G1 X141.091 Y139.197
G1 X142.346 Y137.941 E.07898
G1 X142.347 Y137.389
G1 X141.093 Y138.643 E.07889
G1 X141.096 Y138.089
G1 X142.346 Y136.839 E.07865
G1 X142.344 Y136.289
G1 X141.098 Y137.535 E.0784
G1 X141.1 Y136.981
G1 X142.343 Y135.739 E.07816
G1 X142.342 Y135.189
G1 X141.103 Y136.427 E.07791
G1 X141.105 Y135.874
G1 X142.34 Y134.639 E.07767
G1 X142.33 Y134.098
G1 X141.108 Y135.32 E.07686
G1 X141.11 Y134.766
G1 X142.317 Y133.559 E.07593
G1 X141.922 Y133.403
G1 X141.116 Y134.209 E.05067
; WIPE_START
M204 S6000
G1 X141.922 Y133.403 E-.43285
G1 X142.317 Y133.559 E-.16162
G1 X142.009 Y133.867 E-.16553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.262 Y141.297 Z1.44 F42000
G1 X140.144 Y141.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X139.057 Y142.885 E.06837
G1 X138.68 Y142.711
G1 X139.607 Y141.783 E.05833
G1 X139.22 Y141.619
G1 X138.354 Y142.485 E.0545
G1 X138.07 Y142.217
G1 X138.892 Y141.395 E.05171
G1 X138.872 Y140.864
G1 X137.825 Y141.911 E.06583
G1 X137.698 Y141.487
G1 X138.87 Y140.315 E.07375
G1 X138.869 Y139.765
G1 X137.652 Y140.982 E.07655
G1 X137.632 Y140.45
G1 X138.867 Y139.215 E.07771
G1 X138.865 Y138.665
G1 X137.62 Y139.911 E.07836
G1 X137.611 Y139.368
G1 X138.864 Y138.115 E.07885
G1 X138.862 Y137.565
G1 X137.607 Y138.821 E.079
G1 X137.603 Y138.274
G1 X138.856 Y137.02 E.07887
G1 X138.846 Y136.478
G1 X137.599 Y137.726 E.0785
G1 X137.595 Y137.179
G1 X138.837 Y135.937 E.07812
G1 X138.811 Y135.411
G1 X137.591 Y136.631 E.07677
G1 X137.587 Y136.084
G1 X138.775 Y134.895 E.07477
G1 X138.701 Y134.418
G1 X137.569 Y135.55 E.07121
G1 X137.54 Y135.028
G1 X138.517 Y134.051 E.06146
G1 X138.258 Y133.758
G1 X137.386 Y134.631 E.0549
G1 X137.077 Y134.388
G1 X137.969 Y133.496 E.05611
G1 X137.634 Y133.28
G1 X136.627 Y134.287 E.06337
G1 X136.079 Y134.283
G1 X137.238 Y133.124 E.07293
G1 X136.736 Y133.074
G1 X134.089 Y135.721 E.16651
G1 X134.103 Y135.156
G1 X136.19 Y133.069 E.13132
G1 X135.524 Y133.183
G1 X134.189 Y134.519 E.08402
; WIPE_START
M204 S6000
G1 X135.524 Y133.183 E-.71775
G1 X135.634 Y133.165 E-.04226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.276 Y139.223 Z1.44 F42000
G1 X142.184 Y141.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
M204 S6000
G1 X142.164 Y141.746 E.00022
; LINE_WIDTH: 0.130511
G1 X142.105 Y141.828 E.00082
; LINE_WIDTH: 0.163118
G1 X142.045 Y141.911 E.0012
; LINE_WIDTH: 0.199555
G1 X141.89 Y142.095 E.00383
; LINE_WIDTH: 0.222554
G3 X141.453 Y142.525 I-4.507 J-4.14 E.01138
; LINE_WIDTH: 0.185394
G1 X141.246 Y142.697 E.00384
; LINE_WIDTH: 0.147212
G1 X141.167 Y142.754 E.00097
; LINE_WIDTH: 0.120327
G1 X141.088 Y142.812 E.00067
; WIPE_START
G1 X141.167 Y142.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.357 Y141.86 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
M204 S6000
G1 X140.132 Y141.786 E.00242
M204 S10000
G1 X140.473 Y141.723 F42000
; LINE_WIDTH: 0.140994
G1 F12000
M204 S6000
G1 X140.22 Y141.874 E.00271
; WIPE_START
G1 X140.473 Y141.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.791 Y135.39 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
M204 S6000
G1 X138.791 Y135.156 E.00132
M204 S10000
G1 X138.694 Y134.386 F42000
; LINE_WIDTH: 0.128952
G1 F12000
M204 S6000
G2 X138.597 Y134.246 I-.611 J.321 E.00134
; WIPE_START
G1 X138.694 Y134.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.393 Y133.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
M204 S6000
G2 X137.273 Y133.133 I-.288 J.191 E.00092
; WIPE_START
G1 X137.393 Y133.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.087 Y134.291 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
M204 S6000
G1 X135.935 Y134.254 E.00254
; LINE_WIDTH: 0.183556
G1 X135.838 Y134.32 E.00165
; LINE_WIDTH: 0.123039
G2 X135.581 Y134.543 I1.035 J1.454 E.00245
; LINE_WIDTH: 0.126364
G1 X135.519 Y134.624 E.00077
; LINE_WIDTH: 0.162472
G2 X135.339 Y134.875 I2.197 J1.762 E.00361
; WIPE_START
G1 X135.519 Y134.624 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.807 Y133.594 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
M204 S6000
G2 X134.463 Y133.94 I4.051 J4.378 E.00285
; WIPE_START
G1 X134.807 Y133.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.203 Y128.196 Z1.44 F42000
G1 X140.831 Y127.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X140.567 Y127.344 I-.284 J.067 E.0152
G2 X134.303 Y127.255 I-26.442 J1649.858 E.25726
G3 X133.9 Y127.24 I.022 J-5.853 E.01656
G3 X133.896 Y125.66 I14.303 J-.823 E.06492
G3 X139.743 Y125.616 I5.095 J291.895 E.24008
G2 X140.603 Y125.556 I.034 J-5.676 E.03544
G2 X140.866 Y125.25 I-.068 J-.324 E.01778
G2 X140.921 Y121.763 I-406.372 J-8.259 E.1432
G3 X140.939 Y121.533 I2.353 J.068 E.00946
G3 X142.119 Y121.496 I1.021 J13.405 E.04846
M73 P85 R1
G3 X142.465 Y121.512 I-.064 J4.937 E.01425
G3 X142.532 Y126.958 I-134.811 J4.385 E.22364
G3 X142.508 Y131.413 I-151.211 J1.42 E.18293
G3 X140.942 Y131.418 I-.808 J-8.036 E.0644
G3 X140.898 Y128.84 I46.671 J-2.088 E.10589
G2 X140.84 Y127.627 I-6.849 J-.276 E.04991
; WIPE_START
M204 S6000
G1 X140.8 Y127.485 E-.05615
G1 X140.732 Y127.407 E-.03945
G1 X140.652 Y127.362 E-.03455
G1 X140.567 Y127.344 E-.03293
G1 X138.997 Y127.322 E-.59691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.318 Y130.801 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X141.866 Y131.253 E.02844
G1 X141.328 Y131.24
G1 X142.327 Y130.241 E.06287
G1 X142.329 Y129.687
G1 X141.118 Y130.898 E.0762
G1 X141.105 Y130.36
G1 X142.33 Y129.135 E.07704
G1 X142.331 Y128.583
G1 X141.103 Y129.811 E.07726
G1 X141.1 Y129.262
G1 X142.331 Y128.031 E.07747
G1 X142.332 Y127.479
G1 X141.095 Y128.716 E.07783
G1 X141.081 Y128.178
G1 X142.333 Y126.927 E.0787
G1 X142.33 Y126.378
G1 X141.053 Y127.655 E.08032
G1 X140.881 Y127.275
G1 X142.327 Y125.83 E.09092
G1 X142.324 Y125.281
G1 X140.464 Y127.141 E.117
G1 X139.928 Y127.125
G1 X142.321 Y124.733 E.15053
G1 X142.318 Y124.184
G1 X140.974 Y125.528 E.08454
G1 X141.075 Y124.876
G1 X142.315 Y123.635 E.07802
G1 X142.307 Y123.092
G1 X141.09 Y124.31 E.07659
G1 X141.098 Y123.749
G1 X142.296 Y122.552 E.07533
G1 X142.285 Y122.012
G1 X141.103 Y123.194 E.07436
G1 X141.107 Y122.638
G1 X142.049 Y121.696 E.05931
G1 X141.493 Y121.701
G1 X141.111 Y122.083 E.02404
; WIPE_START
M204 S6000
G1 X141.493 Y121.701 E-.20535
G1 X142.049 Y121.696 E-.21152
G1 X141.411 Y122.334 E-.34314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.838 Y125.664 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X139.382 Y127.12 E.09161
G1 X138.836 Y127.115
G1 X140.152 Y125.798 E.08279
G1 X139.583 Y125.816
G1 X138.29 Y127.109 E.08134
G1 X137.744 Y127.104
G1 X139.029 Y125.819 E.08084
G1 X138.475 Y125.821
G1 X137.198 Y127.098 E.08034
G1 X136.652 Y127.093
G1 X137.921 Y125.824 E.07985
G1 X137.368 Y125.826
G1 X136.106 Y127.087 E.07935
G1 X135.56 Y127.082
G1 X136.814 Y125.828 E.07886
G1 X136.26 Y125.831
G1 X135.022 Y127.068 E.07785
G1 X134.484 Y127.055
G1 X135.706 Y125.833 E.07685
G1 X135.15 Y125.838
G1 X134.088 Y126.9 E.06679
G1 X134.075 Y126.362
G1 X134.589 Y125.848 E.03234
; WIPE_START
M204 S6000
G1 X134.075 Y126.362 E-.27625
G1 X134.088 Y126.9 E-.20462
G1 X134.607 Y126.38 E-.27913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.131 Y127.733 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
M204 S6000
G1 X141.058 Y127.926 E.00128
; WIPE_START
G1 X141.131 Y127.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.192 Y130.972 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
M204 S6000
G2 X141.159 Y131.25 I.322 J.18 E.00331
; WIPE_START
G1 X141.155 Y131.068 E-.48684
G1 X141.192 Y130.972 E-.27316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.16 Y123.41 Z1.44 F42000
G1 X138.488 Y111.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X138.452 Y115.773 E.18926
G3 X138.411 Y116.735 I-7.48 J.162 E.03958
G3 X136.803 Y116.698 I-.644 J-7.029 E.06618
G3 X136.812 Y112.603 I121.596 J-1.771 E.16816
G2 X136.786 Y111.663 I-13.087 J-.102 E.03864
G1 X136.676 Y111.162 E.02103
G3 X133.883 Y111.078 I5.107 J-215.305 E.11471
G3 X133.902 Y109.539 I54.131 J-.09 E.0632
G3 X139.419 Y109.521 I3.795 J326.245 E.22652
G3 X140.963 Y109.658 I.188 J6.651 E.06379
G3 X142.522 Y111.757 I-.652 J2.112 E.11486
G3 X142.523 Y117.93 I-102.109 J3.109 E.2535
G3 X142.26 Y119.013 I-2.194 J.041 E.04627
G3 X140.602 Y120.165 I-2.332 J-1.59 E.08476
G3 X137.322 Y120.204 I-2.187 J-45.48 E.1347
G1 X133.903 Y120.183 E.14042
G1 X133.871 Y118.606 E.06479
G2 X139.405 Y118.565 I-.575 J-457.684 E.22721
G2 X140.473 Y118.482 I.116 J-5.399 E.04407
G2 X140.843 Y118.05 I-.172 J-.52 E.02453
G2 X140.893 Y117.245 I-5.184 J-.731 E.03313
G2 X140.882 Y112.135 I-371.979 J-1.754 E.20985
G2 X140.791 Y111.484 I-2.204 J-.022 E.02707
G2 X140.06 Y111.137 I-.67 J.467 E.03478
G2 X138.548 Y111.16 I-.499 J17.008 E.06209
; WIPE_START
M204 S6000
G1 X138.506 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.304 Y118.133 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X140.469 Y119.968 E.11543
G1 X139.892 Y119.993
G1 X142.341 Y117.544 E.15409
G1 X142.353 Y116.981
G1 X139.333 Y120.001 E.18998
G1 X138.777 Y120.006
G1 X140.04 Y118.742 E.07949
G1 X139.473 Y118.758
G1 X138.228 Y120.003 E.07836
G1 X137.679 Y120.001
G1 X138.911 Y118.769 E.0775
G1 X138.352 Y118.776
G1 X137.13 Y119.998 E.07687
G1 X136.581 Y119.996
G1 X137.797 Y118.78 E.07649
G1 X137.242 Y118.784
G1 X136.032 Y119.993 E.07611
G1 X135.483 Y119.991
G1 X136.687 Y118.787 E.07574
G1 X136.132 Y118.791
G1 X134.934 Y119.989 E.07536
G1 X134.385 Y119.986
G1 X135.577 Y118.794 E.07498
G1 X135.022 Y118.798
G1 X134.093 Y119.726 E.05842
G1 X134.082 Y119.186
G1 X134.467 Y118.801 E.02418
; WIPE_START
M204 S6000
G1 X134.082 Y119.186 E-.20655
G1 X134.093 Y119.726 E-.20552
G1 X134.741 Y119.079 E-.34793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.805 Y116.566 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.237 Y116.134 E.02715
G1 X138.254 Y115.566
G1 X137.276 Y116.543 E.06152
G1 X136.993 Y116.275
G1 X138.258 Y115.01 E.07962
G1 X138.263 Y114.454
G1 X136.987 Y115.73 E.08027
G1 X136.992 Y115.173
G1 X138.267 Y113.898 E.08019
G1 X138.272 Y113.342
G1 X136.998 Y114.616 E.0801
G1 X137.004 Y114.059
G1 X138.276 Y112.787 E.08002
G1 X138.28 Y112.231
G1 X137.01 Y113.501 E.07994
G1 X137.01 Y112.95
G1 X138.285 Y111.675 E.0802
G1 X138.289 Y111.119
G1 X137.007 Y112.401 E.08066
; WIPE_START
M204 S6000
G1 X138.289 Y111.119 E-.68903
G1 X138.288 Y111.306 E-.07097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.365 Y116.418 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X141.075 Y117.707 E.08111
G1 X141.093 Y117.138
G1 X142.368 Y115.863 E.08022
G1 X142.369 Y115.31
G1 X141.093 Y116.586 E.08024
G1 X141.094 Y116.034
G1 X142.37 Y114.758 E.08026
G1 X142.371 Y114.206
G1 X141.095 Y115.482 E.08028
G1 X141.095 Y114.93
G1 X142.365 Y113.66 E.07986
G1 X142.356 Y113.118
G1 X141.096 Y114.378 E.07929
G1 X141.096 Y113.826
G1 X142.348 Y112.575 E.07871
G1 X142.33 Y112.041
G1 X141.097 Y113.274 E.07759
G1 X141.088 Y112.731
G1 X142.304 Y111.516 E.07647
G1 X142.202 Y111.066
G1 X141.074 Y112.195 E.07098
G1 X141.041 Y111.675
G1 X142.018 Y110.699 E.0614
G1 X141.771 Y110.394
G1 X140.891 Y111.275 E.0554
G1 X140.57 Y111.044
G1 X141.469 Y110.145 E.05656
G1 X141.122 Y109.94
G1 X140.114 Y110.948 E.0634
G1 X139.577 Y110.934
G1 X140.706 Y109.805 E.07097
G1 X140.21 Y109.749
G1 X139.01 Y110.949 E.07548
G1 X138.443 Y110.965
G1 X139.678 Y109.73 E.07769
G1 X139.135 Y109.722
G1 X136.994 Y111.862 E.13467
G1 X136.927 Y111.378
G1 X138.582 Y109.723 E.10409
G1 X138.029 Y109.725
G1 X136.788 Y110.966 E.07807
G1 X136.253 Y110.95
G1 X137.476 Y109.727 E.07694
G1 X136.922 Y109.729
G1 X135.717 Y110.934 E.07581
G1 X135.182 Y110.918
G1 X136.369 Y109.73 E.07468
G1 X135.816 Y109.732
G1 X134.647 Y110.901 E.07356
M73 P86 R1
G1 X134.112 Y110.885
G1 X135.263 Y109.734 E.07243
G1 X134.71 Y109.736
G1 X134.092 Y110.354 E.03888
; WIPE_START
M204 S6000
G1 X134.71 Y109.736 E-.33214
G1 X135.263 Y109.734 E-.21021
G1 X134.858 Y110.139 E-.21765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.903 Y115.866 Z1.44 F42000
G1 X142.258 Y118.54 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
M204 S6000
G1 X141.94 Y118.947 E.01307
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X141.451 Y119.437 I-3.509 J-3.015 E.02049
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X141.263 Y119.584 E.00623
; LINE_WIDTH: 0.248541
G1 F12000
G1 X141.074 Y119.732 E.00515
; LINE_WIDTH: 0.208882
G1 X140.886 Y119.88 E.00407
; WIPE_START
G1 X141.074 Y119.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.888 Y112.42 Z1.44 F42000
G1 X138.458 Y110.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
M204 S6000
G1 X138.305 Y110.922 E.00245
G1 X138.244 Y110.981 E.00127
G1 X138.301 Y111.131 E.0024
; WIPE_START
G1 X138.244 Y110.981 E-.29779
G1 X138.305 Y110.922 E-.1581
G1 X138.458 Y110.981 E-.30412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.191 Y111.028 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
M204 S6000
G1 X142.097 Y110.895 E.00118
; WIPE_START
G1 X142.191 Y111.028 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.483 Y104.357 Z1.44 F42000
G1 X136.384 Y100.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X138.036 Y102.189 I16.729 J-15.522 E.09474
G3 X142.566 Y106.25 I-343.514 J387.669 E.24978
G3 X142.536 Y108.107 I-148.096 J-1.41 E.07623
G3 X133.84 Y108.109 I-4.501 J-511.753 E.35708
G3 X133.852 Y106.447 I16.724 J-.702 E.06828
G3 X138.904 Y106.408 I4.214 J216.374 E.20742
G2 X139.608 Y106.342 I.029 J-3.481 E.02908
G2 X139.948 Y106.148 I-.524 J-1.314 E.0161
G2 X139.112 Y105.307 I-5.157 J4.285 E.04874
G3 X133.823 Y100.558 I221.017 J-251.441 E.29187
G3 X133.838 Y98.881 I23.532 J-.639 E.06884
G1 X133.852 Y98.772 E.00454
G3 X140.736 Y98.719 I4.847 J184.983 E.28266
G3 X142.565 Y98.766 I.053 J33.525 E.07516
G3 X142.592 Y100.445 I-7.316 J.957 E.06909
G3 X141.278 Y100.49 I-1.1 J-12.874 E.05404
G2 X137.021 Y100.533 I-.553 J155.523 E.17479
G1 X136.444 Y100.576 E.02375
; WIPE_START
M204 S6000
G1 X137.075 Y101.3 E-.3651
G1 X137.838 Y102.006 E-.3949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.497 Y107.911 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.353 Y107.055 E.05385
G1 X142.362 Y106.495
G1 X140.944 Y107.913 E.08921
G1 X140.391 Y107.914
G1 X142.155 Y106.15 E.11098
G1 X141.864 Y105.89
G1 X139.838 Y107.916 E.12749
G1 X139.284 Y107.918
G1 X141.574 Y105.629 E.14401
G1 X141.283 Y105.368
G1 X138.731 Y107.92 E.16052
G1 X138.178 Y107.922
G1 X139.548 Y106.552 E.08619
G1 X138.951 Y106.597
G1 X137.625 Y107.924 E.08346
G1 X137.071 Y107.925
G1 X138.394 Y106.602 E.08323
G1 X137.838 Y106.608
G1 X136.518 Y107.927 E.083
G1 X135.965 Y107.929
G1 X137.281 Y106.613 E.08278
G1 X136.724 Y106.619
G1 X135.418 Y107.924 E.08214
G1 X134.872 Y107.919
G1 X136.167 Y106.624 E.08148
G1 X135.61 Y106.63
G1 X134.325 Y107.914 E.08083
G1 X134.033 Y107.656
G1 X135.053 Y106.635 E.06421
G1 X134.497 Y106.64
G1 X134.025 Y107.112 E.02966
; WIPE_START
M204 S6000
G1 X134.497 Y106.64 E-.2534
G1 X135.053 Y106.635 E-.21161
G1 X134.504 Y107.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.091 Y106.009 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X140.992 Y105.108 E.0567
G1 X140.701 Y104.847
G1 X139.833 Y105.716 E.05464
G1 X139.55 Y105.447
G1 X140.411 Y104.586 E.05416
G1 X140.12 Y104.326
G1 X139.267 Y105.179 E.05367
G1 X138.976 Y104.918
G1 X139.829 Y104.065 E.05367
G1 X139.538 Y103.804
G1 X138.685 Y104.658 E.0537
G1 X138.394 Y104.398
G1 X139.248 Y103.543 E.05374
G1 X138.957 Y103.283
G1 X138.102 Y104.138 E.05377
G1 X137.811 Y103.877
G1 X138.666 Y103.022 E.05381
G1 X138.376 Y102.761
G1 X137.52 Y103.617 E.05384
G1 X137.228 Y103.357
G1 X138.085 Y102.501 E.05388
G1 X137.796 Y102.238
G1 X136.937 Y103.097 E.05401
G1 X136.646 Y102.837
G1 X137.509 Y101.973 E.05432
G1 X137.223 Y101.708
G1 X136.355 Y102.577 E.05463
G1 X136.063 Y102.317
G1 X136.937 Y101.443 E.05495
G1 X136.666 Y101.162
G1 X135.772 Y102.056 E.05627
G1 X135.481 Y101.796
G1 X136.396 Y100.881 E.0576
G1 X136.126 Y100.599
G1 X135.189 Y101.536 E.05893
; WIPE_START
M204 S6000
G1 X136.126 Y100.599 E-.50342
G1 X136.396 Y100.881 E-.14819
G1 X136.195 Y101.082 E-.10839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.956 Y100.283 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X142.426 Y99.814 E.02952
G1 X142.415 Y99.273
G1 X141.402 Y100.286 E.0637
G1 X140.848 Y100.289
G1 X142.192 Y98.945 E.08457
G1 X141.655 Y98.931
G1 X140.294 Y100.292 E.08563
G1 X139.74 Y100.295
G1 X141.111 Y98.924 E.08625
G1 X140.564 Y98.919
G1 X139.185 Y100.297 E.08671
G1 X138.631 Y100.3
G1 X140.012 Y98.919 E.08686
G1 X139.46 Y98.92
G1 X138.074 Y100.306 E.08718
G1 X137.511 Y100.318
G1 X138.908 Y98.921 E.08788
G1 X138.356 Y98.921
G1 X136.932 Y100.345 E.08956
G1 X136.343 Y100.383
G1 X137.804 Y98.922 E.09192
G1 X137.252 Y98.922
G1 X134.898 Y101.276 E.14807
G1 X134.607 Y101.016
G1 X136.7 Y98.923 E.13167
G1 X136.142 Y98.929
G1 X134.321 Y100.75 E.11457
G1 X134.036 Y100.484
G1 X135.581 Y98.939 E.09715
G1 X135.019 Y98.95
G1 X134.023 Y99.945 E.06262
G1 X134.024 Y99.393
G1 X134.457 Y98.96 E.02725
; WIPE_START
M204 S6000
G1 X134.024 Y99.393 E-.23277
G1 X134.023 Y99.945 E-.20976
G1 X134.614 Y99.354 E-.31746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.267 Y105.405 Z1.44 F42000
G1 X139.995 Y106.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
M204 S6000
G1 X139.848 Y106.464 E.00147
; LINE_WIDTH: 0.175957
G1 X139.701 Y106.576 E.00244
; LINE_WIDTH: 0.201899
G1 X139.686 Y106.586 E.0003
G1 X139.538 Y106.541 E.0025
; WIPE_START
G1 X139.686 Y106.586 E-.67784
G1 X139.701 Y106.576 E-.08216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.437 Y100.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
M204 S6000
G1 X137.208 Y100.345 E.00165
; WIPE_START
G1 X137.437 Y100.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.341 Y99.199 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
M204 S6000
G1 X142.368 Y99.121 E.00102
G1 X142.36 Y98.935 E.00227
; WIPE_START
G1 X142.368 Y99.121 E-.52509
G1 X142.341 Y99.199 E-.23491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.742 Y92.468 Z1.44 F42000
G1 X137.195 Y89.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X136.437 Y89.472 I-.574 J1.386 E.03177
G2 X135.741 Y89.593 I-.084 J1.577 E.02926
G2 X135.565 Y90.004 I.348 J.393 E.01898
G2 X135.604 Y94.761 I75.618 J1.756 E.19537
G2 X135.874 Y95.489 I1.017 J.037 E.03269
G2 X136.403 Y95.677 I.589 J-.817 E.02338
G2 X139.91 Y95.704 I1.993 J-31.538 E.14406
G2 X140.684 Y95.326 I0 J-.981 E.03662
G2 X140.797 Y94.704 I-1.47 J-.588 E.02615
G2 X140.883 Y87.787 I-279.296 J-6.958 E.28401
G1 X142.533 Y87.787 E.06773
G3 X142.508 Y95.468 I-292.858 J2.87 E.31535
G3 X141.088 Y97.192 I-2.955 J-.986 E.09379
G3 X139.766 Y97.434 I-1.34 J-3.583 E.05546
G3 X136.237 Y97.407 I-1.436 J-43.481 E.14496
G3 X134.559 Y96.568 I.087 J-2.271 E.07939
G3 X133.872 Y94.928 I1.813 J-1.723 E.07463
G3 X133.832 Y92.475 I53.037 J-2.107 E.10076
G1 X133.857 Y87.786 E.19253
G3 X138.64 Y87.769 I3.283 J248.828 E.19641
G3 X139.065 Y87.798 I-.008 J3.262 E.0175
G3 X139.11 Y91.762 I-46.497 J2.518 E.16283
G3 X139.066 Y92.383 I-5.189 J-.059 E.02559
G3 X137.368 Y92.336 I-.148 J-25.479 E.06974
G2 X137.303 Y89.926 I-41.619 J-.083 E.09904
G2 X137.225 Y89.627 I-.747 J.038 E.01277
; WIPE_START
M204 S6000
G1 X137.07 Y89.518 E-.07197
G1 X136.959 Y89.494 E-.04294
G1 X136.437 Y89.472 E-.19855
G1 X136.037 Y89.504 E-.15249
G1 X135.9 Y89.53 E-.05324
G1 X135.741 Y89.593 E-.06473
G1 X135.63 Y89.719 E-.06378
G1 X135.594 Y89.816 E-.03939
M73 P87 R1
G1 X135.565 Y90.004 E-.07241
G1 X135.565 Y90.005 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.045 Y96.185 Z1.44 F42000
G1 X140.717 Y97.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X142.263 Y95.566 E.09726
G1 X142.323 Y94.954
G1 X140.067 Y97.21 E.14189
G1 X139.487 Y97.239
G1 X142.329 Y94.396 E.17878
G1 X142.336 Y93.839
G1 X140.924 Y95.251 E.08881
G1 X140.999 Y94.624
G1 X142.342 Y93.281 E.08447
G1 X142.342 Y92.729
G1 X141.014 Y94.057 E.08355
G1 X141.02 Y93.5
G1 X142.341 Y92.179 E.0831
G1 X142.34 Y91.628
G1 X141.026 Y92.942 E.08266
G1 X141.032 Y92.385
G1 X142.339 Y91.078 E.08221
G1 X142.338 Y90.527
G1 X141.038 Y91.827 E.08177
G1 X141.045 Y91.27
G1 X142.337 Y89.977 E.08132
G1 X142.336 Y89.426
G1 X141.051 Y90.712 E.08088
G1 X141.057 Y90.155
G1 X142.335 Y88.876 E.08043
G1 X142.334 Y88.326
G1 X141.063 Y89.597 E.07999
G1 X141.069 Y89.04
G1 X142.122 Y87.987 E.06622
G1 X141.57 Y87.987
G1 X141.075 Y88.482 E.03115
; WIPE_START
M204 S6000
G1 X141.57 Y87.987 E-.26609
G1 X142.122 Y87.987 E-.20954
G1 X141.593 Y88.516 E-.28438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.907 Y91.753 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.481 Y92.179 E.02681
G1 X137.948 Y92.161
G1 X138.918 Y91.191 E.06102
G1 X138.919 Y90.638
G1 X137.56 Y91.997 E.08546
G1 X137.548 Y91.458
G1 X138.917 Y90.089 E.08613
G1 X138.916 Y89.539
G1 X137.536 Y90.919 E.08681
G1 X137.524 Y90.379
G1 X138.914 Y88.989 E.08748
G1 X138.897 Y88.455
G1 X137.491 Y89.86 E.08843
G1 X137.357 Y89.444
G1 X138.819 Y87.981 E.09202
G1 X138.279 Y87.97
G1 X136.955 Y89.294 E.08331
G1 X136.425 Y89.273
G1 X137.726 Y87.971 E.08185
G1 X137.172 Y87.973
G1 X135.785 Y89.361 E.08727
; WIPE_START
M204 S6000
G1 X137.172 Y87.973 E-.7455
G1 X137.211 Y87.973 E-.0145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.069 Y95.05 Z1.44 F42000
G1 X140.372 Y95.802 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X138.928 Y97.246 E.09088
G1 X138.368 Y97.254
G1 X139.712 Y95.911 E.08451
G1 X139.139 Y95.932
G1 X137.812 Y97.259 E.08348
G1 X137.269 Y97.251
G1 X138.586 Y95.934 E.08289
G1 X138.042 Y95.927
G1 X136.735 Y97.234 E.08225
G1 X136.214 Y97.203
G1 X137.498 Y95.919 E.08075
G1 X136.954 Y95.912
G1 X135.742 Y97.124 E.07624
G1 X135.351 Y96.964
G1 X136.435 Y95.879 E.06822
G1 X135.979 Y95.784
G1 X135.027 Y96.736 E.05987
G1 X134.744 Y96.467
G1 X135.657 Y95.554 E.05745
G1 X135.469 Y95.191
G1 X134.494 Y96.166 E.06136
G1 X134.289 Y95.819
G1 X135.408 Y94.701 E.07035
G1 X135.381 Y94.177
G1 X134.143 Y95.414 E.07784
G1 X134.082 Y94.924
G1 X135.375 Y93.631 E.08136
G1 X135.369 Y93.085
G1 X134.05 Y94.405 E.083
G1 X134.04 Y93.862
G1 X135.364 Y92.539 E.08324
G1 X135.358 Y91.994
G1 X134.031 Y93.32 E.08347
G1 X134.033 Y92.767
G1 X135.352 Y91.448 E.08298
G1 X135.347 Y90.902
G1 X134.036 Y92.213 E.08247
G1 X134.038 Y91.659
G1 X135.358 Y90.339 E.08303
G1 X135.422 Y89.723
G1 X134.041 Y91.105 E.08691
G1 X134.043 Y90.551
G1 X136.619 Y87.975 E.16202
G1 X136.066 Y87.977
G1 X134.046 Y89.997 E.12705
G1 X134.048 Y89.443
G1 X135.512 Y87.979 E.09208
G1 X134.959 Y87.981
G1 X134.051 Y88.889 E.05711
; WIPE_START
M204 S6000
G1 X134.959 Y87.981 E-.48788
G1 X135.512 Y87.979 E-.21029
G1 X135.397 Y88.094 E-.06183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.365 Y90.608 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
M204 S6000
G1 X135.273 Y90.828 E.00207
; WIPE_START
G1 X135.365 Y90.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.709 Y89.285 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
M204 S6000
G2 X135.4 Y89.586 I1.969 J2.335 E.00742
G1 X135.425 Y89.726 E.00244
; WIPE_START
G1 X135.4 Y89.586 E-.18799
G1 X135.58 Y89.393 E-.34899
G1 X135.709 Y89.285 E-.22302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.262 Y88.253 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
M204 S6000
G1 X142.299 Y88.164 E.00125
G1 X142.298 Y87.967 E.00254
; WIPE_START
G1 X142.299 Y88.164 E-.50978
G1 X142.262 Y88.253 E-.25022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.087 Y94.13 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
M204 S6000
G1 X140.991 Y94.356 E.00163
M204 S10000
G1 X140.997 Y95.323 F42000
; LINE_WIDTH: 0.191182
G1 F12000
M204 S6000
G3 X140.62 Y95.734 I-1.683 J-1.165 E.00837
; LINE_WIDTH: 0.214865
G1 X140.44 Y95.869 E.00397
M204 S10000
G1 X139.985 Y95.891 F42000
; LINE_WIDTH: 0.127375
G1 F12000
M204 S6000
G3 X139.787 Y95.986 I-1.8 J-3.502 E.00168
; WIPE_START
G1 X139.985 Y95.891 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.693 Y96.443 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
M204 S6000
G3 X141.423 Y96.713 I-2.696 J-2.428 E.00223
; OBJECT_ID: 169
; WIPE_START
G1 X141.693 Y96.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 425
M625
; start printing object, unique label id: 169
M624 AQAAAAAAAAA=
M204 S10000
G1 X140.177 Y103.923 Z1.44 F42000
G1 X129.063 Y158.744 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X128.76 Y158.5 I-.333 J.103 E.01695
G2 X124.623 Y158.446 I-3.136 J81.101 E.16991
G3 X123.665 Y158.425 I.177 J-30.547 E.03935
G3 X123.67 Y156.849 I19.174 J-.726 E.06473
G3 X132.321 Y156.845 I4.486 J339.234 E.35522
G3 X132.283 Y158.718 I-16.043 J.61 E.07694
G2 X127.3 Y162.235 I92.351 J136.117 E.25044
G2 X127.285 Y162.766 I.228 J.272 E.02466
G2 X128.254 Y163.521 I5.136 J-5.599 E.0505
G3 X130.744 Y165.261 I-62.508 J92.047 E.12471
G3 X132.287 Y166.333 I-20.556 J31.239 E.07716
G3 X132.306 Y168.238 I-9.92 J1.052 E.07836
G3 X123.664 Y168.206 I-2.371 J-525.515 E.35484
G3 X123.666 Y166.622 I20.563 J-.763 E.06507
G2 X128.479 Y166.583 I1.29 J-138.139 E.19762
G2 X128.939 Y166.444 I.068 J-.606 E.0203
G2 X128.849 Y165.961 I-.269 J-.199 E.02262
G1 X128.683 Y165.834 E.00856
G3 X124.198 Y162.652 I529.335 J-750.724 E.22582
G1 X124.023 Y162.514 E.00914
G3 X127.929 Y159.755 I118.625 J163.795 E.19635
G2 X128.969 Y158.982 I-17.05 J-24.021 E.0532
G1 X129.035 Y158.902 E.00428
G1 X129.053 Y158.803 E.00411
; WIPE_START
M204 S6000
G1 X128.993 Y158.61 E-.07674
G1 X128.916 Y158.543 E-.039
G1 X128.76 Y158.5 E-.0612
G1 X127.289 Y158.459 E-.55924
G1 X127.227 Y158.458 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.514 Y160.398 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.124 Y157.788 E.16417
G1 X132.136 Y157.225
G1 X127.608 Y161.753 E.28484
; WIPE_START
M204 S6000
G1 X129.022 Y160.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.135 Y167.151 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X131.247 Y168.039 E.05583
G1 X130.696 Y168.039
G1 X132.113 Y166.621 E.08918
G1 X131.887 Y166.297
G1 X130.144 Y168.039 E.1096
G1 X129.593 Y168.039
G1 X131.562 Y166.07 E.12387
G1 X131.238 Y165.843
G1 X129.042 Y168.039 E.13814
G1 X128.49 Y168.039
G1 X130.913 Y165.616 E.15241
G1 X130.589 Y165.389
G1 X127.939 Y168.039 E.16668
G1 X127.388 Y168.038
G1 X128.659 Y166.767 E.07996
G1 X128.084 Y166.791
G1 X126.841 Y168.033 E.07817
G1 X126.294 Y168.029
G1 X127.521 Y166.802 E.07715
G1 X126.961 Y166.811
G1 X125.748 Y168.024 E.07635
G1 X125.201 Y168.02
G1 X126.408 Y166.812 E.07595
G1 X125.855 Y166.814
G1 X124.654 Y168.015 E.07555
G1 X124.107 Y168.011
G1 X125.302 Y166.816 E.07515
G1 X124.748 Y166.818
G1 X123.854 Y167.713 E.05629
; WIPE_START
M204 S6000
G1 X124.748 Y166.818 E-.48084
G1 X125.302 Y166.816 E-.21023
G1 X125.173 Y166.944 E-.06893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.208 Y166.218 Z1.44 F42000
G1 Z1.04
M73 P88 R1
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.264 Y165.162 E.06645
G1 X129.94 Y164.935
G1 X129.023 Y165.852 E.05768
G1 X128.707 Y165.616
G1 X129.615 Y164.708 E.05713
G1 X129.291 Y164.481
G1 X128.384 Y165.388 E.05702
G1 X128.062 Y165.159
G1 X128.966 Y164.254 E.05691
G1 X128.642 Y164.027
G1 X127.739 Y164.93 E.0568
G1 X127.416 Y164.701
G1 X128.317 Y163.8 E.05668
G1 X127.993 Y163.573
G1 X127.093 Y164.473 E.05657
G1 X126.771 Y164.244
G1 X127.668 Y163.347 E.05646
G1 X127.358 Y163.105
G1 X126.448 Y164.015 E.05727
G1 X126.125 Y163.787
G1 X127.087 Y162.825 E.0605
G1 X126.981 Y162.38
G1 X125.803 Y163.558 E.0741
G1 X125.48 Y163.329
G1 X131.767 Y157.042 E.39549
G1 X131.218 Y157.04
G1 X125.157 Y163.1 E.38126
G1 X124.836 Y162.87
G1 X127.165 Y160.542 E.14649
; WIPE_START
M204 S6000
G1 X125.75 Y161.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.176 Y158.53 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.669 Y157.037 E.0939
G1 X130.12 Y157.035
G1 X128.84 Y158.315 E.08055
G1 X128.32 Y158.283
G1 X129.571 Y157.032 E.0787
G1 X129.022 Y157.03
G1 X127.775 Y158.277 E.07843
G1 X127.231 Y158.27
G1 X128.473 Y157.027 E.07817
G1 X127.924 Y157.025
G1 X126.686 Y158.263 E.0779
G1 X126.141 Y158.256
G1 X127.375 Y157.022 E.07763
G1 X126.824 Y157.023
G1 X125.597 Y158.25 E.07718
G1 X125.052 Y158.243
G1 X126.268 Y157.027 E.07647
G1 X125.712 Y157.032
G1 X124.507 Y158.236 E.07576
G1 X123.963 Y158.23
G1 X125.156 Y157.037 E.07505
G1 X124.6 Y157.041
G1 X123.854 Y157.787 E.04691
; WIPE_START
M204 S6000
G1 X124.6 Y157.041 E-.40074
G1 X125.156 Y157.037 E-.21129
G1 X124.88 Y157.312 E-.14797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.238 Y164.166 Z1.44 F42000
G1 X129.278 Y166.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
M204 S6000
G3 X129.217 Y166.414 I-.668 J-.248 E.00196
; LINE_WIDTH: 0.147062
G1 X129.154 Y166.498 E.00103
; LINE_WIDTH: 0.120275
G1 X129.092 Y166.581 E.00071
M204 S10000
G1 X129.082 Y166.59 F42000
; LINE_WIDTH: 0.135238
G1 F12000
M204 S6000
G3 X128.743 Y166.851 I-1.789 J-1.977 E.00367
; WIPE_START
G1 X129.082 Y166.59 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.546 Y161.691 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M204 S6000
G1 X127.294 Y161.914 E.00708
; LINE_WIDTH: 0.210796
G2 X126.912 Y162.312 I.765 J1.117 E.00955
; WIPE_START
G1 X127.043 Y162.137 E-.29908
G1 X127.294 Y161.914 E-.46092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.144 Y161.257 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
M204 S6000
G1 X125.954 Y161.416 E.00193
; LINE_WIDTH: 0.171253
G1 X125.764 Y161.575 E.00314
; LINE_WIDTH: 0.214175
G1 X125.574 Y161.734 E.00435
; LINE_WIDTH: 0.257097
G1 X125.384 Y161.893 E.00556
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X125.195 Y162.052 E.00678
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X125.005 Y162.211 E.00799
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X124.815 Y162.37 E.0092
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X124.497 Y162.643 E.01739
; WIPE_START
G1 X124.815 Y162.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.012 Y159.939 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
M204 S6000
G1 X127.789 Y160.129 E.00234
; LINE_WIDTH: 0.176706
G1 X127.566 Y160.318 E.00389
; LINE_WIDTH: 0.223354
G1 X127.342 Y160.508 E.00547
; LINE_WIDTH: 0.251283
G1 X127.227 Y160.604 E.00327
; WIPE_START
G1 X127.342 Y160.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.451 Y160.336 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
M204 S6000
G1 X129.249 Y160.505 E.0053
; LINE_WIDTH: 0.198217
G1 X129.046 Y160.674 E.00416
; LINE_WIDTH: 0.161001
G1 X128.871 Y160.823 E.00265
; LINE_WIDTH: 0.124914
G1 X128.695 Y160.972 E.0017
; WIPE_START
G1 X128.871 Y160.823 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.149 Y157.061 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
M204 S6000
G1 X131.785 Y157.06 E.00307
; WIPE_START
G1 X132.149 Y157.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.118 Y158.362 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
M204 S6000
G1 X131.89 Y158.552 E.01171
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X131.662 Y158.743 E.01015
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X131.435 Y158.933 E.00859
; LINE_WIDTH: 0.267734
G1 F12000
G1 X131.207 Y159.124 E.00704
; LINE_WIDTH: 0.221773
G1 X130.979 Y159.314 E.00548
; LINE_WIDTH: 0.175812
G1 X130.751 Y159.505 E.00392
; LINE_WIDTH: 0.129851
G1 X130.523 Y159.695 E.00236
; WIPE_START
G1 X130.751 Y159.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.71 Y153.773 Z1.44 F42000
G1 X125.298 Y153.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X125.765 Y153.772 E.02714
G1 X132.329 Y153.839 E.26951
G3 X132.309 Y155.39 I-13 J.608 E.06372
G3 X126.122 Y155.398 I-3.399 J-245.281 E.25403
G3 X124.805 Y155.024 I-.048 J-2.338 E.05706
G3 X123.735 Y153.669 I.909 J-1.818 E.07322
G3 X123.657 Y152.458 I10.929 J-1.314 E.04987
G3 X123.697 Y146.621 I121.66 J-2.071 E.23966
G3 X123.83 Y146.142 I1.388 J.127 E.02054
G3 X125.428 Y144.786 I2.157 J.923 E.08918
G3 X126.344 Y144.667 I.851 J2.971 E.03807
G3 X130.423 Y144.649 I2.997 J209.491 E.16747
G3 X132.273 Y144.684 I-.321 J64.879 E.07599
G3 X132.278 Y146.285 I-14.645 J.846 E.06577
G3 X125.714 Y146.322 I-4.443 J-206.777 E.26951
G1 X125.255 Y146.851 E.02877
G1 X125.297 Y153.245 E.26252
; WIPE_START
M204 S6000
G1 X125.765 Y153.772 E-.26789
G1 X127.06 Y153.785 E-.49211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.408 Y155.195 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.136 Y154.468 E.04576
G1 X132.016 Y154.036
G1 X130.854 Y155.198 E.0731
G1 X130.3 Y155.2
G1 X131.471 Y154.03 E.07362
G1 X130.925 Y154.024
G1 X129.746 Y155.203 E.07414
G1 X129.192 Y155.206
G1 X130.379 Y154.019 E.07466
G1 X129.833 Y154.013
G1 X128.638 Y155.208 E.07519
G1 X128.084 Y155.211
G1 X129.287 Y154.008 E.07571
G1 X128.742 Y154.002
G1 X127.53 Y155.214 E.07623
G1 X126.983 Y155.209
G1 X128.196 Y153.996 E.07627
G1 X127.65 Y153.991
G1 X126.439 Y155.202 E.07621
G1 X125.91 Y155.179
G1 X127.104 Y153.985 E.07511
G1 X126.558 Y153.98
G1 X125.438 Y155.1 E.07046
G1 X125.054 Y154.932
G1 X126.013 Y153.974 E.06027
G1 X125.573 Y153.862
G1 X124.713 Y154.722 E.05412
G1 X124.405 Y154.479
G1 X125.297 Y153.586 E.05613
G1 X125.098 Y153.234
G1 X124.157 Y154.175 E.05916
G1 X123.978 Y153.803
G1 X125.094 Y152.687 E.07024
G1 X125.091 Y152.139
G1 X123.897 Y153.332 E.07508
G1 X123.866 Y152.812
G1 X125.087 Y151.591 E.07681
G1 X125.083 Y151.043
G1 X123.859 Y152.267 E.07701
G1 X123.852 Y151.723
G1 X125.08 Y150.495 E.07722
G1 X125.076 Y149.948
G1 X123.847 Y151.177 E.07731
G1 X123.848 Y150.625
G1 X125.073 Y149.4 E.07706
G1 X125.069 Y148.852
G1 X123.848 Y150.073 E.07682
G1 X123.848 Y149.521
G1 X125.065 Y148.304 E.07657
G1 X125.062 Y147.756
G1 X123.849 Y148.969 E.07629
G1 X123.856 Y148.411
G1 X125.058 Y147.209 E.07563
; WIPE_START
M204 S6000
G1 X123.856 Y148.411 E-.64606
G1 X123.852 Y148.711 E-.11394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.092 Y146.295 Z1.44 F42000
G1 X131.682 Y146.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.093 Y145.688 E.02584
G1 X132.087 Y145.142
G1 X131.118 Y146.111 E.06095
G1 X130.559 Y146.119
G1 X131.803 Y144.875 E.07828
G1 X131.262 Y144.864
G1 X130.007 Y146.119 E.07896
G1 X129.455 Y146.12
G1 X130.721 Y144.854 E.07963
G1 X130.175 Y144.848
G1 X128.904 Y146.12 E.08
G1 X128.352 Y146.121
G1 X129.623 Y144.849 E.07996
G1 X129.071 Y144.85
G1 X127.8 Y146.121 E.07993
G1 X127.248 Y146.121
G1 X128.518 Y144.851 E.07989
G1 X127.966 Y144.852
G1 X126.696 Y146.122 E.07986
G1 X126.145 Y146.122
G1 X127.413 Y144.853 E.07983
G1 X126.861 Y144.854
G1 X123.863 Y147.852 E.18861
G1 X123.87 Y147.294
G1 X126.29 Y144.874 E.15226
G1 X125.685 Y144.927
G1 X123.899 Y146.713 E.11235
; WIPE_START
M204 S6000
G1 X125.314 Y145.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.253 Y145.053 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
M204 S6000
M73 P89 R1
G1 X125.151 Y145.124 E.00121
; LINE_WIDTH: 0.179713
G1 X125.049 Y145.196 E.0017
; LINE_WIDTH: 0.214273
G1 X124.948 Y145.268 E.00219
; LINE_WIDTH: 0.246896
G1 X124.835 Y145.358 E.00307
; LINE_WIDTH: 0.29318
G1 F11031.832
G2 X124.289 Y145.896 I2.887 J3.484 E.02041
; LINE_WIDTH: 0.258333
G1 F12000
G1 X124.127 Y146.106 E.00601
; LINE_WIDTH: 0.223912
G1 X123.965 Y146.317 E.00496
; WIPE_START
G1 X124.127 Y146.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.121 Y141.464 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X129.822 Y141.613 I.624 J-1.213 E.02981
G2 X130.538 Y141.314 I-.032 J-1.084 E.03257
G1 X130.62 Y141.193 E.00601
G2 X130.678 Y135.396 I-181.781 J-4.692 E.23802
G3 X130.722 Y133.239 I43.647 J-.185 E.08859
G3 X132.283 Y133.235 I.812 J10.002 E.06417
G3 X132.255 Y141.4 I-150.39 J3.57 E.33531
G3 X131.383 Y142.727 I-2.124 J-.446 E.06674
G3 X129.536 Y143.224 I-1.577 J-2.178 E.08032
G3 X127.37 Y141.915 I.09 J-2.595 E.10852
G3 X127.215 Y140.872 I3.454 J-1.046 E.04347
G3 X127.147 Y135.428 I1915.931 J-26.801 E.22356
G2 X127.024 Y134.773 I-1.59 J-.042 E.02757
G2 X126.509 Y134.495 I-.586 J.471 E.02467
G2 X125.702 Y134.524 I-.334 J1.963 E.0334
G2 X125.355 Y135.127 I.387 J.624 E.02976
G2 X125.287 Y136.473 I9.909 J1.176 E.05541
G1 X125.264 Y142.817 E.26046
G1 X123.68 Y142.786 E.06503
G3 X123.667 Y135.3 I461.903 J-4.514 E.30736
G3 X124.181 Y133.682 I2.375 J-.136 E.07126
G3 X126.224 Y132.863 I1.884 J1.741 E.09341
G1 X126.457 Y132.869 E.00956
G3 X127.32 Y133.011 I.016 J2.586 E.03607
G3 X128.633 Y134.246 I-1.104 J2.491 E.07544
G3 X128.806 Y135.712 I-5.63 J1.405 E.06078
G3 X128.835 Y137.304 I-54.389 J1.79 E.06535
G1 X128.846 Y141.277 E.16314
G2 X129.068 Y141.435 I.899 J-1.026 E.01122
; WIPE_START
M204 S6000
G1 X129.295 Y141.551 E-.09681
G1 X129.546 Y141.608 E-.09788
G1 X129.822 Y141.613 E-.10507
G1 X129.966 Y141.594 E-.05506
G1 X130.212 Y141.527 E-.09672
G1 X130.414 Y141.424 E-.08624
G1 X130.538 Y141.314 E-.0631
G1 X130.62 Y141.193 E-.05561
G1 X130.627 Y140.92 E-.10352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.698 Y142.606 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X125.066 Y142.238 E.02318
G1 X125.068 Y141.684
G1 X124.157 Y142.596 E.05733
G1 X123.878 Y142.323
G1 X125.07 Y141.131 E.07501
G1 X125.072 Y140.577
G1 X123.876 Y141.774 E.07525
G1 X123.874 Y141.224
G1 X125.074 Y140.024 E.07549
G1 X125.076 Y139.47
G1 X123.873 Y140.674 E.07573
G1 X123.871 Y140.125
G1 X125.078 Y138.917 E.07597
G1 X125.08 Y138.364
G1 X123.869 Y139.575 E.0762
G1 X123.867 Y139.025
G1 X125.082 Y137.81 E.07644
G1 X125.084 Y137.257
G1 X123.865 Y138.476 E.07668
G1 X123.864 Y137.926
G1 X125.087 Y136.703 E.07692
G1 X125.095 Y136.143
G1 X123.862 Y137.376 E.0776
G1 X123.86 Y136.827
G1 X125.114 Y135.573 E.07887
G1 X125.187 Y134.949
G1 X123.858 Y136.277 E.08356
; WIPE_START
M204 S6000
G1 X125.187 Y134.949 E-.71381
G1 X125.173 Y135.07 E-.04619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.39 Y141.431 Z1.44 F42000
G1 X130.406 Y142.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.059 Y141.311 E.10399
G1 X132.08 Y140.738
G1 X129.796 Y143.022 E.14373
G1 X129.275 Y142.991
G1 X132.098 Y140.169 E.17755
G1 X132.103 Y139.612
G1 X130.827 Y140.889 E.08031
G1 X130.839 Y140.324
G1 X132.109 Y139.055 E.07985
G1 X132.114 Y138.498
G1 X130.852 Y139.76 E.07939
G1 X130.864 Y139.197
G1 X132.12 Y137.941 E.07898
G1 X132.121 Y137.389
G1 X130.867 Y138.643 E.07889
G1 X130.869 Y138.089
G1 X132.119 Y136.839 E.07865
G1 X132.118 Y136.289
G1 X130.872 Y137.535 E.0784
G1 X130.874 Y136.981
G1 X132.116 Y135.739 E.07816
G1 X132.115 Y135.189
G1 X130.876 Y136.427 E.07791
G1 X130.879 Y135.874
G1 X132.114 Y134.639 E.07767
G1 X132.103 Y134.098
G1 X130.881 Y135.32 E.07686
G1 X130.884 Y134.766
G1 X132.091 Y133.559 E.07593
G1 X131.695 Y133.403
G1 X130.89 Y134.209 E.05067
; WIPE_START
M204 S6000
G1 X131.695 Y133.403 E-.43285
G1 X132.091 Y133.559 E-.16162
G1 X131.783 Y133.867 E-.16553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.035 Y141.297 Z1.44 F42000
G1 X129.917 Y141.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.831 Y142.885 E.06837
G1 X128.453 Y142.711
G1 X129.38 Y141.783 E.05833
G1 X128.994 Y141.619
G1 X128.127 Y142.485 E.0545
G1 X127.844 Y142.217
G1 X128.666 Y141.395 E.05171
G1 X128.645 Y140.864
G1 X127.599 Y141.911 E.06583
G1 X127.471 Y141.487
G1 X128.644 Y140.315 E.07375
G1 X128.642 Y139.765
G1 X127.425 Y140.982 E.07655
G1 X127.405 Y140.45
G1 X128.641 Y139.215 E.07771
G1 X128.639 Y138.665
G1 X127.393 Y139.911 E.07836
G1 X127.384 Y139.368
G1 X128.637 Y138.115 E.07885
G1 X128.636 Y137.565
G1 X127.38 Y138.821 E.079
G1 X127.376 Y138.274
G1 X128.63 Y137.02 E.07887
G1 X128.62 Y136.478
G1 X127.372 Y137.726 E.0785
G1 X127.368 Y137.179
G1 X128.61 Y135.937 E.07812
G1 X128.585 Y135.411
G1 X127.364 Y136.631 E.07677
G1 X127.36 Y136.084
G1 X128.549 Y134.895 E.07477
G1 X128.475 Y134.418
G1 X127.343 Y135.55 E.07121
G1 X127.313 Y135.028
G1 X128.29 Y134.051 E.06146
G1 X128.032 Y133.758
G1 X127.159 Y134.631 E.0549
G1 X126.851 Y134.388
G1 X127.743 Y133.496 E.05611
G1 X127.407 Y133.28
G1 X126.4 Y134.287 E.06337
G1 X125.853 Y134.283
G1 X127.012 Y133.124 E.07293
G1 X126.51 Y133.074
G1 X123.863 Y135.721 E.16651
G1 X123.876 Y135.156
G1 X125.964 Y133.069 E.13132
G1 X125.298 Y133.183
G1 X123.962 Y134.519 E.08402
; WIPE_START
M204 S6000
G1 X125.298 Y133.183 E-.71775
G1 X125.407 Y133.165 E-.04226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.05 Y139.223 Z1.44 F42000
G1 X131.958 Y141.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
M204 S6000
G1 X131.938 Y141.746 E.00022
; LINE_WIDTH: 0.130511
G1 X131.878 Y141.828 E.00082
; LINE_WIDTH: 0.163118
G1 X131.819 Y141.911 E.0012
; LINE_WIDTH: 0.199555
G1 X131.663 Y142.095 E.00383
; LINE_WIDTH: 0.222554
G3 X131.226 Y142.525 I-4.507 J-4.14 E.01138
; LINE_WIDTH: 0.185394
G1 X131.02 Y142.697 E.00384
; LINE_WIDTH: 0.147212
G1 X130.941 Y142.754 E.00097
; LINE_WIDTH: 0.120327
G1 X130.861 Y142.812 E.00067
; WIPE_START
G1 X130.941 Y142.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.131 Y141.86 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
M204 S6000
G1 X129.905 Y141.786 E.00242
M204 S10000
G1 X130.246 Y141.723 F42000
; LINE_WIDTH: 0.140994
G1 F12000
M204 S6000
G1 X129.994 Y141.874 E.00271
; WIPE_START
G1 X130.246 Y141.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.564 Y135.39 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
M204 S6000
G1 X128.564 Y135.156 E.00132
M204 S10000
G1 X128.468 Y134.386 F42000
; LINE_WIDTH: 0.128952
G1 F12000
M204 S6000
G2 X128.371 Y134.246 I-.611 J.321 E.00134
; WIPE_START
G1 X128.468 Y134.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.167 Y133.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
M204 S6000
G2 X127.046 Y133.133 I-.288 J.191 E.00092
; WIPE_START
G1 X127.167 Y133.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.861 Y134.291 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
M204 S6000
G1 X125.709 Y134.254 E.00254
; LINE_WIDTH: 0.183556
G1 X125.612 Y134.32 E.00165
; LINE_WIDTH: 0.123039
G2 X125.355 Y134.543 I1.035 J1.454 E.00245
; LINE_WIDTH: 0.126364
G1 X125.292 Y134.624 E.00077
; LINE_WIDTH: 0.162472
G2 X125.113 Y134.875 I2.197 J1.762 E.00361
; WIPE_START
G1 X125.292 Y134.624 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.581 Y133.594 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
M204 S6000
G2 X124.237 Y133.94 I4.051 J4.378 E.00285
; WIPE_START
G1 X124.581 Y133.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.976 Y128.196 Z1.44 F42000
G1 X130.605 Y127.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X130.341 Y127.344 I-.284 J.067 E.0152
G2 X124.076 Y127.255 I-26.442 J1649.858 E.25726
G3 X123.673 Y127.24 I.022 J-5.853 E.01656
G3 X123.67 Y125.66 I14.303 J-.823 E.06492
G3 X129.516 Y125.616 I5.095 J291.895 E.24008
G2 X130.377 Y125.556 I.034 J-5.676 E.03544
G2 X130.639 Y125.25 I-.068 J-.324 E.01778
G2 X130.695 Y121.763 I-406.372 J-8.259 E.1432
G3 X130.713 Y121.533 I2.353 J.068 E.00946
G3 X131.892 Y121.496 I1.021 J13.405 E.04846
G3 X132.239 Y121.512 I-.064 J4.937 E.01425
G3 X132.306 Y126.958 I-134.811 J4.385 E.22364
G3 X132.282 Y131.413 I-151.211 J1.42 E.18293
G3 X130.716 Y131.418 I-.808 J-8.036 E.0644
G3 X130.672 Y128.84 I46.671 J-2.088 E.10589
G2 X130.613 Y127.627 I-6.849 J-.276 E.04991
; WIPE_START
M204 S6000
G1 X130.574 Y127.485 E-.05615
G1 X130.505 Y127.407 E-.03945
G1 X130.426 Y127.362 E-.03455
G1 X130.341 Y127.344 E-.03293
G1 X128.77 Y127.322 E-.59691
; WIPE_END
M73 P90 R1
G1 E-.04 F1800
M204 S10000
G1 X132.092 Y130.801 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X131.64 Y131.253 E.02844
G1 X131.101 Y131.24
G1 X132.1 Y130.241 E.06287
G1 X132.103 Y129.687
G1 X130.892 Y130.898 E.0762
G1 X130.879 Y130.36
G1 X132.104 Y129.135 E.07704
G1 X132.104 Y128.583
G1 X130.876 Y129.811 E.07726
G1 X130.873 Y129.262
G1 X132.105 Y128.031 E.07747
G1 X132.106 Y127.479
G1 X130.868 Y128.716 E.07783
G1 X130.855 Y128.178
G1 X132.106 Y126.927 E.0787
G1 X132.103 Y126.378
G1 X130.826 Y127.655 E.08032
G1 X130.655 Y127.275
G1 X132.1 Y125.83 E.09092
G1 X132.097 Y125.281
G1 X130.238 Y127.141 E.117
G1 X129.702 Y127.125
G1 X132.095 Y124.733 E.15053
G1 X132.092 Y124.184
G1 X130.748 Y125.528 E.08454
G1 X130.848 Y124.876
G1 X132.089 Y123.635 E.07802
G1 X132.081 Y123.092
G1 X130.863 Y124.31 E.07659
G1 X130.872 Y123.749
G1 X132.069 Y122.552 E.07533
G1 X132.058 Y122.012
G1 X130.876 Y123.194 E.07436
G1 X130.88 Y122.638
G1 X131.823 Y121.696 E.05931
G1 X131.266 Y121.701
G1 X130.884 Y122.083 E.02404
; WIPE_START
M204 S6000
G1 X131.266 Y121.701 E-.20535
G1 X131.823 Y121.696 E-.21152
G1 X131.184 Y122.334 E-.34314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.612 Y125.664 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X129.156 Y127.12 E.09161
G1 X128.61 Y127.115
G1 X129.926 Y125.798 E.08279
G1 X129.357 Y125.816
G1 X128.064 Y127.109 E.08134
G1 X127.518 Y127.104
G1 X128.803 Y125.819 E.08084
G1 X128.249 Y125.821
G1 X126.972 Y127.098 E.08034
G1 X126.426 Y127.093
G1 X127.695 Y125.824 E.07985
G1 X127.141 Y125.826
G1 X125.88 Y127.087 E.07935
G1 X125.334 Y127.082
G1 X126.587 Y125.828 E.07886
G1 X126.033 Y125.831
G1 X124.796 Y127.068 E.07785
G1 X124.258 Y127.055
G1 X125.48 Y125.833 E.07685
G1 X124.923 Y125.838
G1 X123.862 Y126.9 E.06679
G1 X123.848 Y126.362
G1 X124.363 Y125.848 E.03234
; WIPE_START
M204 S6000
G1 X123.848 Y126.362 E-.27625
G1 X123.862 Y126.9 E-.20462
G1 X124.381 Y126.38 E-.27913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.905 Y127.733 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
M204 S6000
G1 X130.831 Y127.926 E.00128
; WIPE_START
G1 X130.905 Y127.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.966 Y130.972 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
M204 S6000
G2 X130.932 Y131.25 I.322 J.18 E.00331
; WIPE_START
G1 X130.929 Y131.068 E-.48684
G1 X130.966 Y130.972 E-.27316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.933 Y123.41 Z1.44 F42000
G1 X128.262 Y111.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X128.225 Y115.773 E.18926
G3 X128.184 Y116.735 I-7.48 J.162 E.03958
G3 X126.576 Y116.698 I-.644 J-7.029 E.06618
G3 X126.586 Y112.603 I121.596 J-1.771 E.16816
G2 X126.559 Y111.663 I-13.087 J-.102 E.03864
G1 X126.449 Y111.162 E.02103
G3 X123.657 Y111.078 I5.107 J-215.305 E.11471
G3 X123.676 Y109.539 I54.131 J-.09 E.0632
G3 X129.193 Y109.521 I3.795 J326.245 E.22652
G3 X130.737 Y109.658 I.188 J6.651 E.06379
G3 X132.295 Y111.757 I-.652 J2.112 E.11486
G3 X132.297 Y117.93 I-102.109 J3.109 E.2535
G3 X132.034 Y119.013 I-2.194 J.041 E.04627
G3 X130.375 Y120.165 I-2.332 J-1.59 E.08476
G3 X127.096 Y120.204 I-2.187 J-45.48 E.1347
G1 X123.676 Y120.183 E.14042
G1 X123.645 Y118.606 E.06479
G2 X129.179 Y118.565 I-.575 J-457.684 E.22721
G2 X130.247 Y118.482 I.116 J-5.399 E.04407
G2 X130.616 Y118.05 I-.172 J-.52 E.02453
G2 X130.667 Y117.245 I-5.184 J-.731 E.03313
G2 X130.656 Y112.135 I-371.979 J-1.754 E.20985
G2 X130.565 Y111.484 I-2.204 J-.022 E.02707
G2 X129.833 Y111.137 I-.67 J.467 E.03478
G2 X128.322 Y111.16 I-.499 J17.008 E.06209
; WIPE_START
M204 S6000
G1 X128.28 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.077 Y118.133 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X130.242 Y119.968 E.11543
G1 X129.665 Y119.993
G1 X132.115 Y117.544 E.15409
G1 X132.127 Y116.981
G1 X129.107 Y120.001 E.18998
G1 X128.55 Y120.006
G1 X129.814 Y118.742 E.07949
G1 X129.247 Y118.758
G1 X128.001 Y120.003 E.07836
G1 X127.452 Y120.001
G1 X128.684 Y118.769 E.0775
G1 X128.125 Y118.776
G1 X126.903 Y119.998 E.07687
G1 X126.354 Y119.996
G1 X127.57 Y118.78 E.07649
G1 X127.015 Y118.784
G1 X125.805 Y119.993 E.07611
G1 X125.256 Y119.991
G1 X126.46 Y118.787 E.07574
G1 X125.905 Y118.791
G1 X124.707 Y119.989 E.07536
G1 X124.158 Y119.986
G1 X125.35 Y118.794 E.07498
G1 X124.795 Y118.798
G1 X123.867 Y119.726 E.05842
G1 X123.856 Y119.186
G1 X124.24 Y118.801 E.02418
; WIPE_START
M204 S6000
G1 X123.856 Y119.186 E-.20655
G1 X123.867 Y119.726 E-.20552
G1 X124.514 Y119.079 E-.34793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.579 Y116.566 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.01 Y116.134 E.02715
G1 X128.028 Y115.566
G1 X127.05 Y116.543 E.06152
G1 X126.766 Y116.275
G1 X128.032 Y115.01 E.07962
G1 X128.036 Y114.454
G1 X126.76 Y115.73 E.08027
G1 X126.766 Y115.173
G1 X128.041 Y113.898 E.08019
G1 X128.045 Y113.342
G1 X126.772 Y114.616 E.0801
G1 X126.777 Y114.059
G1 X128.049 Y112.787 E.08002
G1 X128.054 Y112.231
G1 X126.783 Y113.501 E.07994
G1 X126.783 Y112.95
G1 X128.058 Y111.675 E.0802
G1 X128.063 Y111.119
G1 X126.78 Y112.401 E.08066
; WIPE_START
M204 S6000
G1 X128.063 Y111.119 E-.68903
G1 X128.061 Y111.306 E-.07097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.138 Y116.418 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.849 Y117.707 E.08111
G1 X130.866 Y117.138
G1 X132.142 Y115.863 E.08022
G1 X132.143 Y115.31
G1 X130.867 Y116.586 E.08024
G1 X130.868 Y116.034
G1 X132.143 Y114.758 E.08026
G1 X132.144 Y114.206
G1 X130.868 Y115.482 E.08028
G1 X130.869 Y114.93
G1 X132.138 Y113.66 E.07986
G1 X132.13 Y113.118
G1 X130.869 Y114.378 E.07929
G1 X130.87 Y113.826
G1 X132.121 Y112.575 E.07871
G1 X132.104 Y112.041
G1 X130.871 Y113.274 E.07759
G1 X130.862 Y112.731
G1 X132.077 Y111.516 E.07647
G1 X131.975 Y111.066
G1 X130.847 Y112.195 E.07098
G1 X130.815 Y111.675
G1 X131.791 Y110.699 E.0614
G1 X131.545 Y110.394
G1 X130.664 Y111.275 E.0554
G1 X130.343 Y111.044
G1 X131.242 Y110.145 E.05656
G1 X130.896 Y109.94
G1 X129.888 Y110.948 E.0634
G1 X129.351 Y110.934
G1 X130.479 Y109.805 E.07097
G1 X129.984 Y109.749
G1 X128.784 Y110.949 E.07548
G1 X128.217 Y110.965
G1 X129.452 Y109.73 E.07769
G1 X128.909 Y109.722
G1 X126.768 Y111.862 E.13467
G1 X126.701 Y111.378
G1 X128.356 Y109.723 E.10409
G1 X127.802 Y109.725
G1 X126.561 Y110.966 E.07807
G1 X126.026 Y110.95
G1 X127.249 Y109.727 E.07694
G1 X126.696 Y109.729
G1 X125.491 Y110.934 E.07581
G1 X124.956 Y110.918
G1 X126.143 Y109.73 E.07468
G1 X125.59 Y109.732
G1 X124.42 Y110.901 E.07356
G1 X123.885 Y110.885
G1 X125.036 Y109.734 E.07243
G1 X124.483 Y109.736
G1 X123.865 Y110.354 E.03888
; WIPE_START
M204 S6000
G1 X124.483 Y109.736 E-.33214
M73 P91 R1
G1 X125.036 Y109.734 E-.21021
G1 X124.631 Y110.139 E-.21765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.676 Y115.866 Z1.44 F42000
G1 X132.032 Y118.54 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
M204 S6000
G1 X131.714 Y118.947 E.01307
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X131.225 Y119.437 I-3.509 J-3.015 E.02049
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X131.036 Y119.584 E.00623
; LINE_WIDTH: 0.248541
G1 F12000
G1 X130.848 Y119.732 E.00515
; LINE_WIDTH: 0.208882
G1 X130.66 Y119.88 E.00407
; WIPE_START
G1 X130.848 Y119.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.662 Y112.42 Z1.44 F42000
G1 X128.232 Y110.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
M204 S6000
G1 X128.079 Y110.922 E.00245
G1 X128.018 Y110.981 E.00127
G1 X128.075 Y111.131 E.0024
; WIPE_START
G1 X128.018 Y110.981 E-.29779
G1 X128.079 Y110.922 E-.1581
G1 X128.232 Y110.981 E-.30412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.965 Y111.028 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
M204 S6000
G1 X131.871 Y110.895 E.00118
; WIPE_START
G1 X131.965 Y111.028 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.257 Y104.357 Z1.44 F42000
G1 X126.158 Y100.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X127.81 Y102.189 I16.729 J-15.522 E.09474
G3 X132.339 Y106.25 I-343.514 J387.669 E.24978
G3 X132.31 Y108.107 I-148.096 J-1.41 E.07623
G3 X123.613 Y108.109 I-4.501 J-511.753 E.35708
G3 X123.626 Y106.447 I16.724 J-.702 E.06828
G3 X128.677 Y106.408 I4.214 J216.374 E.20742
G2 X129.381 Y106.342 I.029 J-3.481 E.02908
G2 X129.721 Y106.148 I-.524 J-1.314 E.0161
G2 X128.886 Y105.307 I-5.157 J4.285 E.04874
G3 X123.597 Y100.558 I221.017 J-251.441 E.29187
G3 X123.611 Y98.881 I23.532 J-.639 E.06884
G1 X123.626 Y98.772 E.00454
G3 X130.509 Y98.719 I4.847 J184.983 E.28266
G3 X132.339 Y98.766 I.053 J33.525 E.07516
G3 X132.366 Y100.445 I-7.316 J.957 E.06909
G3 X131.051 Y100.49 I-1.1 J-12.874 E.05404
G2 X126.795 Y100.533 I-.553 J155.523 E.17479
G1 X126.218 Y100.576 E.02375
; WIPE_START
M204 S6000
G1 X126.849 Y101.3 E-.3651
G1 X127.612 Y102.006 E-.3949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.271 Y107.911 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X132.127 Y107.055 E.05385
G1 X132.136 Y106.495
G1 X130.718 Y107.913 E.08921
G1 X130.164 Y107.914
G1 X131.929 Y106.15 E.11098
G1 X131.638 Y105.89
G1 X129.611 Y107.916 E.12749
G1 X129.058 Y107.918
G1 X131.347 Y105.629 E.14401
G1 X131.056 Y105.368
G1 X128.505 Y107.92 E.16052
G1 X127.951 Y107.922
G1 X129.322 Y106.552 E.08619
G1 X128.725 Y106.597
G1 X127.398 Y107.924 E.08346
G1 X126.845 Y107.925
G1 X128.168 Y106.602 E.08323
G1 X127.611 Y106.608
G1 X126.292 Y107.927 E.083
G1 X125.738 Y107.929
G1 X127.054 Y106.613 E.08278
G1 X126.497 Y106.619
G1 X125.192 Y107.924 E.08214
G1 X124.645 Y107.919
G1 X125.941 Y106.624 E.08148
G1 X125.384 Y106.63
G1 X124.099 Y107.914 E.08083
G1 X123.806 Y107.656
G1 X124.827 Y106.635 E.06421
G1 X124.27 Y106.64
G1 X123.799 Y107.112 E.02966
; WIPE_START
M204 S6000
G1 X124.27 Y106.64 E-.2534
G1 X124.827 Y106.635 E-.21161
G1 X124.278 Y107.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.864 Y106.009 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X130.766 Y105.108 E.0567
G1 X130.475 Y104.847
G1 X129.606 Y105.716 E.05464
G1 X129.323 Y105.447
G1 X130.184 Y104.586 E.05416
G1 X129.893 Y104.326
G1 X129.04 Y105.179 E.05367
G1 X128.75 Y104.918
G1 X129.603 Y104.065 E.05367
G1 X129.312 Y103.804
G1 X128.458 Y104.658 E.0537
G1 X128.167 Y104.398
G1 X129.021 Y103.543 E.05374
G1 X128.731 Y103.283
G1 X127.876 Y104.138 E.05377
G1 X127.584 Y103.877
G1 X128.44 Y103.022 E.05381
G1 X128.149 Y102.761
G1 X127.293 Y103.617 E.05384
G1 X127.002 Y103.357
G1 X127.858 Y102.501 E.05388
G1 X127.569 Y102.238
G1 X126.711 Y103.097 E.05401
G1 X126.419 Y102.837
G1 X127.283 Y101.973 E.05432
G1 X126.997 Y101.708
G1 X126.128 Y102.577 E.05463
G1 X125.837 Y102.317
G1 X126.71 Y101.443 E.05495
G1 X126.44 Y101.162
G1 X125.546 Y102.056 E.05627
G1 X125.254 Y101.796
G1 X126.17 Y100.881 E.0576
G1 X125.9 Y100.599
G1 X124.963 Y101.536 E.05893
; WIPE_START
M204 S6000
G1 X125.9 Y100.599 E-.50342
G1 X126.17 Y100.881 E-.14819
G1 X125.968 Y101.082 E-.10839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.73 Y100.283 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X132.199 Y99.814 E.02952
G1 X132.188 Y99.273
G1 X131.176 Y100.286 E.0637
G1 X130.622 Y100.289
G1 X131.966 Y98.945 E.08457
G1 X131.429 Y98.931
G1 X130.067 Y100.292 E.08563
G1 X129.513 Y100.295
G1 X130.884 Y98.924 E.08625
G1 X130.337 Y98.919
G1 X128.959 Y100.297 E.08671
G1 X128.405 Y100.3
G1 X129.785 Y98.919 E.08686
G1 X129.233 Y98.92
G1 X127.847 Y100.306 E.08718
G1 X127.284 Y100.318
G1 X128.681 Y98.921 E.08788
G1 X128.129 Y98.921
G1 X126.706 Y100.345 E.08956
G1 X126.116 Y100.383
G1 X127.577 Y98.922 E.09192
G1 X127.025 Y98.922
G1 X124.672 Y101.276 E.14807
G1 X124.38 Y101.016
G1 X126.473 Y98.923 E.13167
G1 X125.916 Y98.929
G1 X124.095 Y100.75 E.11457
G1 X123.81 Y100.484
G1 X125.354 Y98.939 E.09715
G1 X124.792 Y98.95
G1 X123.797 Y99.945 E.06262
G1 X123.798 Y99.393
G1 X124.231 Y98.96 E.02725
; WIPE_START
M204 S6000
G1 X123.798 Y99.393 E-.23277
G1 X123.797 Y99.945 E-.20976
G1 X124.388 Y99.354 E-.31746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.04 Y105.405 Z1.44 F42000
G1 X129.768 Y106.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
M204 S6000
G1 X129.622 Y106.464 E.00147
; LINE_WIDTH: 0.175957
G1 X129.475 Y106.576 E.00244
; LINE_WIDTH: 0.201899
G1 X129.459 Y106.586 E.0003
G1 X129.311 Y106.541 E.0025
; WIPE_START
G1 X129.459 Y106.586 E-.67784
G1 X129.475 Y106.576 E-.08216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.211 Y100.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
M204 S6000
G1 X126.981 Y100.345 E.00165
; WIPE_START
G1 X127.211 Y100.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.114 Y99.199 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
M204 S6000
G1 X132.142 Y99.121 E.00102
G1 X132.134 Y98.935 E.00227
; WIPE_START
G1 X132.142 Y99.121 E-.52509
G1 X132.114 Y99.199 E-.23491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.516 Y92.468 Z1.44 F42000
G1 X126.969 Y89.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X126.211 Y89.472 I-.574 J1.386 E.03177
G2 X125.515 Y89.593 I-.084 J1.577 E.02926
G2 X125.339 Y90.004 I.348 J.393 E.01898
G2 X125.378 Y94.761 I75.618 J1.756 E.19537
G2 X125.647 Y95.489 I1.017 J.037 E.03269
G2 X126.177 Y95.677 I.589 J-.817 E.02338
G2 X129.683 Y95.704 I1.993 J-31.538 E.14406
G2 X130.458 Y95.326 I0 J-.981 E.03662
G2 X130.57 Y94.704 I-1.47 J-.588 E.02615
G2 X130.657 Y87.787 I-279.296 J-6.958 E.28401
G1 X132.307 Y87.787 E.06773
G3 X132.281 Y95.468 I-292.858 J2.87 E.31535
G3 X130.862 Y97.192 I-2.955 J-.986 E.09379
G3 X129.54 Y97.434 I-1.34 J-3.583 E.05546
G3 X126.01 Y97.407 I-1.436 J-43.481 E.14496
G3 X124.333 Y96.568 I.087 J-2.271 E.07939
G3 X123.646 Y94.928 I1.813 J-1.723 E.07463
G3 X123.605 Y92.475 I53.037 J-2.107 E.10076
G1 X123.63 Y87.786 E.19253
G3 X128.413 Y87.769 I3.283 J248.828 E.19641
G3 X128.838 Y87.798 I-.008 J3.262 E.0175
G3 X128.884 Y91.762 I-46.497 J2.518 E.16283
G3 X128.84 Y92.383 I-5.189 J-.059 E.02559
G3 X127.142 Y92.336 I-.148 J-25.479 E.06974
G2 X127.077 Y89.926 I-41.619 J-.083 E.09904
G2 X126.998 Y89.627 I-.747 J.038 E.01277
; WIPE_START
M204 S6000
G1 X126.843 Y89.518 E-.07197
G1 X126.733 Y89.494 E-.04294
G1 X126.211 Y89.472 E-.19855
G1 X125.811 Y89.504 E-.15249
G1 X125.673 Y89.53 E-.05324
G1 X125.515 Y89.593 E-.06473
G1 X125.404 Y89.719 E-.06378
G1 X125.368 Y89.816 E-.03939
G1 X125.339 Y90.004 E-.07241
G1 X125.338 Y90.005 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.818 Y96.185 Z1.44 F42000
G1 X130.49 Y97.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
M73 P92 R1
G1 F6594.904
M204 S2000
G1 X132.036 Y95.566 E.09726
G1 X132.096 Y94.954
G1 X129.841 Y97.21 E.14189
G1 X129.261 Y97.239
G1 X132.103 Y94.396 E.17878
G1 X132.109 Y93.839
G1 X130.697 Y95.251 E.08881
G1 X130.773 Y94.624
G1 X132.116 Y93.281 E.08447
G1 X132.116 Y92.729
G1 X130.788 Y94.057 E.08355
G1 X130.794 Y93.5
G1 X132.115 Y92.179 E.0831
G1 X132.114 Y91.628
G1 X130.8 Y92.942 E.08266
G1 X130.806 Y92.385
G1 X132.113 Y91.078 E.08221
G1 X132.112 Y90.527
G1 X130.812 Y91.827 E.08177
G1 X130.818 Y91.27
G1 X132.111 Y89.977 E.08132
G1 X132.11 Y89.426
G1 X130.824 Y90.712 E.08088
G1 X130.83 Y90.155
G1 X132.109 Y88.876 E.08043
G1 X132.108 Y88.326
G1 X130.836 Y89.597 E.07999
G1 X130.843 Y89.04
G1 X131.895 Y87.987 E.06622
G1 X131.344 Y87.987
G1 X130.849 Y88.482 E.03115
; WIPE_START
M204 S6000
G1 X131.344 Y87.987 E-.26609
G1 X131.895 Y87.987 E-.20954
G1 X131.366 Y88.516 E-.28438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.681 Y91.753 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.255 Y92.179 E.02681
G1 X127.721 Y92.161
M73 P92 R0
G1 X128.691 Y91.191 E.06102
G1 X128.692 Y90.638
G1 X127.334 Y91.997 E.08546
G1 X127.322 Y91.458
G1 X128.691 Y90.089 E.08613
G1 X128.689 Y89.539
G1 X127.309 Y90.919 E.08681
G1 X127.297 Y90.379
G1 X128.688 Y88.989 E.08748
G1 X128.671 Y88.455
G1 X127.265 Y89.86 E.08843
G1 X127.13 Y89.444
G1 X128.593 Y87.981 E.09202
G1 X128.053 Y87.97
G1 X126.728 Y89.294 E.08331
G1 X126.198 Y89.273
G1 X127.499 Y87.971 E.08185
G1 X126.946 Y87.973
G1 X125.559 Y89.361 E.08727
; WIPE_START
M204 S6000
G1 X126.946 Y87.973 E-.7455
G1 X126.984 Y87.973 E-.0145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.842 Y95.05 Z1.44 F42000
G1 X130.146 Y95.802 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X128.701 Y97.246 E.09088
G1 X128.142 Y97.254
G1 X129.485 Y95.911 E.08451
G1 X128.913 Y95.932
G1 X127.586 Y97.259 E.08348
G1 X127.042 Y97.251
G1 X128.36 Y95.934 E.08289
G1 X127.816 Y95.927
G1 X126.508 Y97.234 E.08225
G1 X125.988 Y97.203
G1 X127.271 Y95.919 E.08075
G1 X126.727 Y95.912
G1 X125.515 Y97.124 E.07624
G1 X125.124 Y96.964
G1 X126.209 Y95.879 E.06822
G1 X125.752 Y95.784
G1 X124.8 Y96.736 E.05987
G1 X124.518 Y96.467
G1 X125.431 Y95.554 E.05745
G1 X125.243 Y95.191
G1 X124.268 Y96.166 E.06136
G1 X124.063 Y95.819
G1 X125.181 Y94.701 E.07035
G1 X125.154 Y94.177
G1 X123.917 Y95.414 E.07784
G1 X123.855 Y94.924
G1 X125.148 Y93.631 E.08136
G1 X125.143 Y93.085
G1 X123.823 Y94.405 E.083
G1 X123.814 Y93.862
G1 X125.137 Y92.539 E.08324
G1 X125.132 Y91.994
G1 X123.805 Y93.32 E.08347
G1 X123.807 Y92.767
G1 X125.126 Y91.448 E.08298
G1 X125.12 Y90.902
G1 X123.809 Y92.213 E.08247
G1 X123.812 Y91.659
G1 X125.132 Y90.339 E.08303
G1 X125.196 Y89.723
G1 X123.814 Y91.105 E.08691
G1 X123.817 Y90.551
G1 X126.393 Y87.975 E.16202
G1 X125.839 Y87.977
G1 X123.819 Y89.997 E.12705
G1 X123.822 Y89.443
G1 X125.286 Y87.979 E.09208
G1 X124.732 Y87.981
G1 X123.825 Y88.889 E.05711
; WIPE_START
M204 S6000
G1 X124.732 Y87.981 E-.48788
G1 X125.286 Y87.979 E-.21029
G1 X125.171 Y88.094 E-.06183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.139 Y90.608 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
M204 S6000
G1 X125.046 Y90.828 E.00207
; WIPE_START
G1 X125.139 Y90.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.483 Y89.285 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
M204 S6000
G2 X125.173 Y89.586 I1.969 J2.335 E.00742
G1 X125.198 Y89.726 E.00244
; WIPE_START
G1 X125.173 Y89.586 E-.18799
G1 X125.354 Y89.393 E-.34899
G1 X125.483 Y89.285 E-.22302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.035 Y88.253 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
M204 S6000
G1 X132.072 Y88.164 E.00125
G1 X132.072 Y87.967 E.00254
; WIPE_START
G1 X132.072 Y88.164 E-.50978
G1 X132.035 Y88.253 E-.25022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.86 Y94.13 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
M204 S6000
G1 X130.764 Y94.356 E.00163
M204 S10000
G1 X130.77 Y95.323 F42000
; LINE_WIDTH: 0.191182
G1 F12000
M204 S6000
G3 X130.393 Y95.734 I-1.683 J-1.165 E.00837
; LINE_WIDTH: 0.214865
G1 X130.214 Y95.869 E.00397
M204 S10000
G1 X129.758 Y95.891 F42000
; LINE_WIDTH: 0.127375
G1 F12000
M204 S6000
G3 X129.56 Y95.986 I-1.8 J-3.502 E.00168
; WIPE_START
G1 X129.758 Y95.891 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.467 Y96.443 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
M204 S6000
G3 X131.197 Y96.713 I-2.696 J-2.428 E.00223
; OBJECT_ID: 331
; WIPE_START
G1 X131.467 Y96.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 169
M625
; start printing object, unique label id: 331
M624 AgAAAAAAAAA=
M204 S10000
G1 X129.951 Y103.923 Z1.44 F42000
G1 X118.837 Y158.744 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X118.534 Y158.5 I-.333 J.103 E.01695
G2 X114.397 Y158.446 I-3.136 J81.101 E.16991
G3 X113.438 Y158.425 I.177 J-30.547 E.03935
G3 X113.444 Y156.849 I19.174 J-.726 E.06473
G3 X122.095 Y156.845 I4.486 J339.234 E.35522
G3 X122.057 Y158.718 I-16.043 J.61 E.07694
G2 X117.074 Y162.235 I92.351 J136.117 E.25044
G2 X117.058 Y162.766 I.228 J.272 E.02466
G2 X118.028 Y163.521 I5.136 J-5.599 E.0505
G3 X120.517 Y165.261 I-62.508 J92.047 E.12471
G3 X122.06 Y166.333 I-20.556 J31.239 E.07716
G3 X122.079 Y168.238 I-9.92 J1.052 E.07836
G3 X113.438 Y168.206 I-2.371 J-525.515 E.35484
G3 X113.44 Y166.622 I20.563 J-.763 E.06507
G2 X118.252 Y166.583 I1.29 J-138.139 E.19762
G2 X118.713 Y166.444 I.068 J-.606 E.0203
G2 X118.622 Y165.961 I-.269 J-.199 E.02262
G1 X118.457 Y165.834 E.00856
G3 X113.972 Y162.652 I529.335 J-750.724 E.22582
G1 X113.796 Y162.514 E.00914
G3 X117.702 Y159.755 I118.625 J163.795 E.19635
G2 X118.742 Y158.982 I-17.05 J-24.021 E.0532
G1 X118.808 Y158.902 E.00428
G1 X118.826 Y158.803 E.00411
; WIPE_START
M204 S6000
G1 X118.767 Y158.61 E-.07674
G1 X118.689 Y158.543 E-.039
G1 X118.534 Y158.5 E-.0612
G1 X117.063 Y158.459 E-.55924
G1 X117 Y158.458 E-.02383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.288 Y160.398 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.897 Y157.788 E.16417
G1 X121.909 Y157.225
G1 X117.381 Y161.753 E.28484
; WIPE_START
M204 S6000
G1 X118.796 Y160.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.908 Y167.151 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.021 Y168.039 E.05583
G1 X120.469 Y168.039
G1 X121.887 Y166.621 E.08918
G1 X121.66 Y166.297
G1 X119.918 Y168.039 E.1096
G1 X119.367 Y168.039
G1 X121.336 Y166.07 E.12387
G1 X121.011 Y165.843
G1 X118.815 Y168.039 E.13814
G1 X118.264 Y168.039
G1 X120.687 Y165.616 E.15241
G1 X120.362 Y165.389
G1 X117.713 Y168.039 E.16668
G1 X117.162 Y168.038
G1 X118.433 Y166.767 E.07996
G1 X117.858 Y166.791
G1 X116.615 Y168.033 E.07817
G1 X116.068 Y168.029
G1 X117.294 Y166.802 E.07715
G1 X116.735 Y166.811
G1 X115.521 Y168.024 E.07635
G1 X114.974 Y168.02
G1 X116.182 Y166.812 E.07595
G1 X115.628 Y166.814
G1 X114.427 Y168.015 E.07555
G1 X113.881 Y168.011
G1 X115.075 Y166.816 E.07515
G1 X114.522 Y166.818
G1 X113.627 Y167.713 E.05629
; WIPE_START
M204 S6000
G1 X114.522 Y166.818 E-.48084
G1 X115.075 Y166.816 E-.21023
G1 X114.947 Y166.944 E-.06893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.982 Y166.218 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.038 Y165.162 E.06645
G1 X119.713 Y164.935
M73 P93 R0
G1 X118.796 Y165.852 E.05768
G1 X118.481 Y165.616
G1 X119.389 Y164.708 E.05713
G1 X119.064 Y164.481
G1 X118.158 Y165.388 E.05702
G1 X117.835 Y165.159
G1 X118.74 Y164.254 E.05691
G1 X118.415 Y164.027
G1 X117.512 Y164.93 E.0568
G1 X117.19 Y164.701
G1 X118.091 Y163.8 E.05668
G1 X117.766 Y163.573
G1 X116.867 Y164.473 E.05657
G1 X116.544 Y164.244
G1 X117.442 Y163.347 E.05646
G1 X117.132 Y163.105
G1 X116.222 Y164.015 E.05727
G1 X115.899 Y163.787
G1 X116.861 Y162.825 E.0605
G1 X116.754 Y162.38
G1 X115.576 Y163.558 E.0741
G1 X115.254 Y163.329
G1 X121.541 Y157.042 E.39549
G1 X120.992 Y157.04
G1 X114.931 Y163.1 E.38126
G1 X114.61 Y162.87
G1 X116.938 Y160.542 E.14649
; WIPE_START
M204 S6000
G1 X115.524 Y161.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.95 Y158.53 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.443 Y157.037 E.0939
G1 X119.894 Y157.035
G1 X118.613 Y158.315 E.08055
G1 X118.094 Y158.283
G1 X119.345 Y157.032 E.0787
G1 X118.796 Y157.03
G1 X117.549 Y158.277 E.07843
G1 X117.004 Y158.27
G1 X118.247 Y157.027 E.07817
G1 X117.698 Y157.025
G1 X116.46 Y158.263 E.0779
G1 X115.915 Y158.256
G1 X117.149 Y157.022 E.07763
G1 X116.597 Y157.023
G1 X115.37 Y158.25 E.07718
G1 X114.826 Y158.243
G1 X116.041 Y157.027 E.07647
G1 X115.485 Y157.032
G1 X114.281 Y158.236 E.07576
G1 X113.736 Y158.23
G1 X114.929 Y157.037 E.07505
G1 X114.373 Y157.041
G1 X113.628 Y157.787 E.04691
; WIPE_START
M204 S6000
G1 X114.373 Y157.041 E-.40074
G1 X114.929 Y157.037 E-.21129
G1 X114.654 Y157.312 E-.14797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.012 Y164.166 Z1.44 F42000
G1 X119.052 Y166.288 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.182844
G1 F12000
M204 S6000
G3 X118.99 Y166.414 I-.668 J-.248 E.00196
; LINE_WIDTH: 0.147062
G1 X118.928 Y166.498 E.00103
; LINE_WIDTH: 0.120275
G1 X118.866 Y166.581 E.00071
M204 S10000
G1 X118.855 Y166.59 F42000
; LINE_WIDTH: 0.135238
G1 F12000
M204 S6000
G3 X118.516 Y166.851 I-1.789 J-1.977 E.00367
; WIPE_START
G1 X118.855 Y166.59 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.319 Y161.691 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.244829
G1 F12000
M204 S6000
G1 X117.068 Y161.914 E.00708
; LINE_WIDTH: 0.210796
G2 X116.686 Y162.312 I.765 J1.117 E.00955
; WIPE_START
G1 X116.816 Y162.137 E-.29908
G1 X117.068 Y161.914 E-.46092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.917 Y161.257 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.128332
G1 F12000
M204 S6000
G1 X115.727 Y161.416 E.00193
; LINE_WIDTH: 0.171253
G1 X115.538 Y161.575 E.00314
; LINE_WIDTH: 0.214175
G1 X115.348 Y161.734 E.00435
; LINE_WIDTH: 0.257097
G1 X115.158 Y161.893 E.00556
; LINE_WIDTH: 0.300018
G1 F10717.414
G1 X114.968 Y162.052 E.00678
; LINE_WIDTH: 0.34294
G1 F9091.084
G1 X114.778 Y162.211 E.00799
; LINE_WIDTH: 0.385862
G1 F7893.304
G1 X114.589 Y162.37 E.0092
; LINE_WIDTH: 0.424134
G1 F7063.485
G1 X114.271 Y162.643 E.01739
; WIPE_START
G1 X114.589 Y162.37 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.786 Y159.939 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.130149
G1 F12000
M204 S6000
G1 X117.563 Y160.129 E.00234
; LINE_WIDTH: 0.176706
G1 X117.34 Y160.318 E.00389
; LINE_WIDTH: 0.223354
G1 X117.116 Y160.508 E.00547
; LINE_WIDTH: 0.251283
G1 X117.001 Y160.604 E.00327
; WIPE_START
G1 X117.116 Y160.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.225 Y160.336 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.236463
G1 F12000
M204 S6000
G1 X119.023 Y160.505 E.0053
; LINE_WIDTH: 0.198217
G1 X118.82 Y160.674 E.00416
; LINE_WIDTH: 0.161001
G1 X118.644 Y160.823 E.00265
; LINE_WIDTH: 0.124914
G1 X118.469 Y160.972 E.0017
; WIPE_START
G1 X118.644 Y160.823 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.923 Y157.061 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.134138
G1 F12000
M204 S6000
G1 X121.559 Y157.06 E.00307
; WIPE_START
G1 X121.923 Y157.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.892 Y158.362 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.405617
G1 F7442.021
M204 S6000
G1 X121.664 Y158.552 E.01171
; LINE_WIDTH: 0.359656
G1 F8583.809
G1 X121.436 Y158.743 E.01015
; LINE_WIDTH: 0.313695
G1 F10139.448
G1 X121.208 Y158.933 E.00859
; LINE_WIDTH: 0.267734
G1 F12000
G1 X120.98 Y159.124 E.00704
; LINE_WIDTH: 0.221773
G1 X120.752 Y159.314 E.00548
; LINE_WIDTH: 0.175812
G1 X120.524 Y159.505 E.00392
; LINE_WIDTH: 0.129851
G1 X120.297 Y159.695 E.00236
; WIPE_START
G1 X120.524 Y159.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.484 Y153.773 Z1.44 F42000
G1 X115.071 Y153.305 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X115.539 Y153.772 E.02714
G1 X122.102 Y153.839 E.26951
G3 X122.082 Y155.39 I-13 J.608 E.06372
G3 X115.896 Y155.398 I-3.399 J-245.281 E.25403
G3 X114.578 Y155.024 I-.048 J-2.338 E.05706
G3 X113.508 Y153.669 I.909 J-1.818 E.07322
G3 X113.43 Y152.458 I10.929 J-1.314 E.04987
G3 X113.471 Y146.621 I121.66 J-2.071 E.23966
G3 X113.604 Y146.142 I1.388 J.127 E.02054
G3 X115.201 Y144.786 I2.157 J.923 E.08918
G3 X116.117 Y144.667 I.851 J2.971 E.03807
G3 X120.196 Y144.649 I2.997 J209.491 E.16747
G3 X122.046 Y144.684 I-.321 J64.879 E.07599
G3 X122.051 Y146.285 I-14.645 J.846 E.06577
G3 X115.488 Y146.322 I-4.443 J-206.777 E.26951
G1 X115.029 Y146.851 E.02877
G1 X115.071 Y153.245 E.26252
; WIPE_START
M204 S6000
G1 X115.539 Y153.772 E-.26789
G1 X116.834 Y153.785 E-.49211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.182 Y155.195 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.91 Y154.468 E.04576
G1 X121.79 Y154.036
G1 X120.628 Y155.198 E.0731
G1 X120.074 Y155.2
G1 X121.244 Y154.03 E.07362
G1 X120.698 Y154.024
G1 X119.52 Y155.203 E.07414
G1 X118.966 Y155.206
G1 X120.153 Y154.019 E.07466
G1 X119.607 Y154.013
G1 X118.412 Y155.208 E.07519
G1 X117.858 Y155.211
G1 X119.061 Y154.008 E.07571
G1 X118.515 Y154.002
G1 X117.303 Y155.214 E.07623
G1 X116.757 Y155.209
G1 X117.969 Y153.996 E.07627
G1 X117.424 Y153.991
G1 X116.212 Y155.202 E.07621
G1 X115.684 Y155.179
G1 X116.878 Y153.985 E.07511
G1 X116.332 Y153.98
G1 X115.212 Y155.1 E.07046
G1 X114.828 Y154.932
G1 X115.786 Y153.974 E.06027
G1 X115.347 Y153.862
G1 X114.486 Y154.722 E.05412
G1 X114.179 Y154.479
G1 X115.071 Y153.586 E.05613
G1 X114.871 Y153.234
G1 X113.931 Y154.175 E.05916
G1 X113.751 Y153.803
G1 X114.868 Y152.687 E.07024
G1 X114.864 Y152.139
G1 X113.671 Y153.332 E.07508
G1 X113.64 Y152.812
G1 X114.861 Y151.591 E.07681
G1 X114.857 Y151.043
G1 X113.633 Y152.267 E.07701
G1 X113.626 Y151.723
G1 X114.853 Y150.495 E.07722
G1 X114.85 Y149.948
G1 X113.621 Y151.177 E.07731
G1 X113.621 Y150.625
G1 X114.846 Y149.4 E.07706
G1 X114.842 Y148.852
G1 X113.621 Y150.073 E.07682
G1 X113.622 Y149.521
G1 X114.839 Y148.304 E.07657
G1 X114.835 Y147.756
G1 X113.622 Y148.969 E.07629
G1 X113.629 Y148.411
G1 X114.832 Y147.209 E.07563
; WIPE_START
M204 S6000
G1 X113.629 Y148.411 E-.64606
G1 X113.626 Y148.711 E-.11394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.866 Y146.295 Z1.44 F42000
G1 X121.456 Y146.099 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.866 Y145.688 E.02584
G1 X121.861 Y145.142
G1 X120.892 Y146.111 E.06095
G1 X120.333 Y146.119
G1 X121.577 Y144.875 E.07828
G1 X121.036 Y144.864
G1 X119.781 Y146.119 E.07896
G1 X119.229 Y146.12
G1 X120.495 Y144.854 E.07963
G1 X119.949 Y144.848
G1 X118.677 Y146.12 E.08
G1 X118.125 Y146.121
G1 X119.397 Y144.849 E.07996
G1 X118.844 Y144.85
G1 X117.574 Y146.121 E.07993
G1 X117.022 Y146.121
G1 X118.292 Y144.851 E.07989
G1 X117.739 Y144.852
G1 X116.47 Y146.122 E.07986
G1 X115.918 Y146.122
G1 X117.187 Y144.853 E.07983
G1 X116.635 Y144.854
G1 X113.636 Y147.852 E.18861
G1 X113.643 Y147.294
G1 X116.064 Y144.874 E.15226
G1 X115.459 Y144.927
G1 X113.673 Y146.713 E.11235
; WIPE_START
M204 S6000
G1 X115.087 Y145.299 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.027 Y145.053 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145152
G1 F12000
M204 S6000
G1 X114.925 Y145.124 E.00121
; LINE_WIDTH: 0.179713
G1 X114.823 Y145.196 E.0017
; LINE_WIDTH: 0.214273
G1 X114.721 Y145.268 E.00219
; LINE_WIDTH: 0.246896
G1 X114.609 Y145.358 E.00307
; LINE_WIDTH: 0.29318
M73 P94 R0
G1 F11031.832
G2 X114.062 Y145.896 I2.887 J3.484 E.02041
; LINE_WIDTH: 0.258333
G1 F12000
G1 X113.9 Y146.106 E.00601
; LINE_WIDTH: 0.223912
G1 X113.739 Y146.317 E.00496
; WIPE_START
G1 X113.9 Y146.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.894 Y141.464 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X119.596 Y141.613 I.624 J-1.213 E.02981
G2 X120.312 Y141.314 I-.032 J-1.084 E.03257
G1 X120.394 Y141.193 E.00601
G2 X120.451 Y135.396 I-181.781 J-4.692 E.23802
G3 X120.495 Y133.239 I43.647 J-.185 E.08859
G3 X122.057 Y133.235 I.812 J10.002 E.06417
G3 X122.029 Y141.4 I-150.39 J3.57 E.33531
G3 X121.157 Y142.727 I-2.124 J-.446 E.06674
G3 X119.309 Y143.224 I-1.577 J-2.178 E.08032
G3 X117.143 Y141.915 I.09 J-2.595 E.10852
G3 X116.989 Y140.872 I3.454 J-1.046 E.04347
G3 X116.92 Y135.428 I1915.931 J-26.801 E.22356
G2 X116.798 Y134.773 I-1.59 J-.042 E.02757
G2 X116.283 Y134.495 I-.586 J.471 E.02467
G2 X115.476 Y134.524 I-.334 J1.963 E.0334
G2 X115.128 Y135.127 I.387 J.624 E.02976
G2 X115.06 Y136.473 I9.909 J1.176 E.05541
G1 X115.037 Y142.817 E.26046
G1 X113.454 Y142.786 E.06503
G3 X113.441 Y135.3 I461.903 J-4.514 E.30736
G3 X113.955 Y133.682 I2.375 J-.136 E.07126
G3 X115.998 Y132.863 I1.884 J1.741 E.09341
G1 X116.231 Y132.869 E.00956
G3 X117.093 Y133.011 I.016 J2.586 E.03607
G3 X118.407 Y134.246 I-1.104 J2.491 E.07544
G3 X118.579 Y135.712 I-5.63 J1.405 E.06078
G3 X118.608 Y137.304 I-54.389 J1.79 E.06535
G1 X118.619 Y141.277 E.16314
G2 X118.842 Y141.435 I.899 J-1.026 E.01122
; WIPE_START
M204 S6000
G1 X119.068 Y141.551 E-.09681
G1 X119.319 Y141.608 E-.09788
G1 X119.596 Y141.613 E-.10507
G1 X119.74 Y141.594 E-.05506
G1 X119.985 Y141.527 E-.09672
G1 X120.187 Y141.424 E-.08624
G1 X120.312 Y141.314 E-.0631
G1 X120.394 Y141.193 E-.05561
G1 X120.4 Y140.92 E-.10352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.471 Y142.606 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X114.84 Y142.238 E.02318
G1 X114.842 Y141.684
G1 X113.931 Y142.596 E.05733
G1 X113.652 Y142.323
G1 X114.844 Y141.131 E.07501
G1 X114.846 Y140.577
G1 X113.65 Y141.774 E.07525
G1 X113.648 Y141.224
G1 X114.848 Y140.024 E.07549
G1 X114.85 Y139.47
G1 X113.646 Y140.674 E.07573
G1 X113.644 Y140.125
G1 X114.852 Y138.917 E.07597
G1 X114.854 Y138.364
G1 X113.643 Y139.575 E.0762
G1 X113.641 Y139.025
G1 X114.856 Y137.81 E.07644
G1 X114.858 Y137.257
G1 X113.639 Y138.476 E.07668
G1 X113.637 Y137.926
G1 X114.86 Y136.703 E.07692
G1 X114.869 Y136.143
G1 X113.636 Y137.376 E.0776
G1 X113.634 Y136.827
G1 X114.887 Y135.573 E.07887
G1 X114.96 Y134.949
G1 X113.632 Y136.277 E.08356
; WIPE_START
M204 S6000
G1 X114.96 Y134.949 E-.71381
G1 X114.946 Y135.07 E-.04619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.163 Y141.431 Z1.44 F42000
G1 X120.179 Y142.964 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.833 Y141.311 E.10399
G1 X121.854 Y140.738
G1 X119.569 Y143.022 E.14373
G1 X119.049 Y142.991
G1 X121.872 Y140.169 E.17755
G1 X121.877 Y139.612
G1 X120.6 Y140.889 E.08031
G1 X120.613 Y140.324
G1 X121.882 Y139.055 E.07985
G1 X121.888 Y138.498
G1 X120.626 Y139.76 E.07939
G1 X120.638 Y139.197
G1 X121.893 Y137.941 E.07898
G1 X121.894 Y137.389
G1 X120.64 Y138.643 E.07889
G1 X120.643 Y138.089
G1 X121.893 Y136.839 E.07865
G1 X121.892 Y136.289
G1 X120.645 Y137.535 E.0784
G1 X120.648 Y136.981
G1 X121.89 Y135.739 E.07816
G1 X121.889 Y135.189
G1 X120.65 Y136.427 E.07791
G1 X120.653 Y135.874
G1 X121.887 Y134.639 E.07767
G1 X121.877 Y134.098
G1 X120.655 Y135.32 E.07686
G1 X120.657 Y134.766
G1 X121.865 Y133.559 E.07593
G1 X121.469 Y133.403
G1 X120.663 Y134.209 E.05067
; WIPE_START
M204 S6000
G1 X121.469 Y133.403 E-.43285
G1 X121.865 Y133.559 E-.16162
G1 X121.556 Y133.867 E-.16553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.809 Y141.297 Z1.44 F42000
G1 X119.691 Y141.798 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.604 Y142.885 E.06837
G1 X118.227 Y142.711
G1 X119.154 Y141.783 E.05833
G1 X118.767 Y141.619
G1 X117.901 Y142.485 E.0545
G1 X117.617 Y142.217
G1 X118.439 Y141.395 E.05171
G1 X118.419 Y140.864
G1 X117.372 Y141.911 E.06583
G1 X117.245 Y141.487
G1 X118.417 Y140.315 E.07375
G1 X118.416 Y139.765
G1 X117.199 Y140.982 E.07655
G1 X117.179 Y140.45
G1 X118.414 Y139.215 E.07771
G1 X118.413 Y138.665
G1 X117.167 Y139.911 E.07836
G1 X117.158 Y139.368
G1 X118.411 Y138.115 E.07885
G1 X118.409 Y137.565
G1 X117.154 Y138.821 E.079
G1 X117.15 Y138.274
G1 X118.404 Y137.02 E.07887
G1 X118.394 Y136.478
G1 X117.146 Y137.726 E.0785
G1 X117.142 Y137.179
G1 X118.384 Y135.937 E.07812
G1 X118.358 Y135.411
G1 X117.138 Y136.631 E.07677
G1 X117.134 Y136.084
G1 X118.323 Y134.895 E.07477
G1 X118.248 Y134.418
G1 X117.116 Y135.55 E.07121
G1 X117.087 Y135.028
G1 X118.064 Y134.051 E.06146
G1 X117.805 Y133.758
G1 X116.933 Y134.631 E.0549
G1 X116.624 Y134.388
G1 X117.516 Y133.496 E.05611
G1 X117.181 Y133.28
G1 X116.174 Y134.287 E.06337
G1 X115.626 Y134.283
G1 X116.785 Y133.124 E.07293
G1 X116.283 Y133.074
G1 X113.636 Y135.721 E.16651
G1 X113.65 Y135.156
G1 X115.737 Y133.069 E.13132
G1 X115.071 Y133.183
G1 X113.736 Y134.519 E.08402
; WIPE_START
M204 S6000
G1 X115.071 Y133.183 E-.71775
G1 X115.181 Y133.165 E-.04226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.823 Y139.223 Z1.44 F42000
G1 X121.731 Y141.713 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110547
G1 F12000
M204 S6000
G1 X121.712 Y141.746 E.00022
; LINE_WIDTH: 0.130511
G1 X121.652 Y141.828 E.00082
; LINE_WIDTH: 0.163118
G1 X121.592 Y141.911 E.0012
; LINE_WIDTH: 0.199555
G1 X121.437 Y142.095 E.00383
; LINE_WIDTH: 0.222554
G3 X121 Y142.525 I-4.507 J-4.14 E.01138
; LINE_WIDTH: 0.185394
G1 X120.793 Y142.697 E.00384
; LINE_WIDTH: 0.147212
G1 X120.714 Y142.754 E.00097
; LINE_WIDTH: 0.120327
G1 X120.635 Y142.812 E.00067
; WIPE_START
G1 X120.714 Y142.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.905 Y141.86 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.149478
G1 F12000
M204 S6000
G1 X119.679 Y141.786 E.00242
M204 S10000
G1 X120.02 Y141.723 F42000
; LINE_WIDTH: 0.140994
G1 F12000
M204 S6000
G1 X119.768 Y141.874 E.00271
; WIPE_START
G1 X120.02 Y141.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.338 Y135.39 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.109534
G1 F12000
M204 S6000
G1 X118.338 Y135.156 E.00132
M204 S10000
G1 X118.241 Y134.386 F42000
; LINE_WIDTH: 0.128952
G1 F12000
M204 S6000
G2 X118.144 Y134.246 I-.611 J.321 E.00134
; WIPE_START
G1 X118.241 Y134.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.94 Y133.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.108634
G1 F12000
M204 S6000
G2 X116.82 Y133.133 I-.288 J.191 E.00092
; WIPE_START
G1 X116.94 Y133.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.635 Y134.291 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.202385
G1 F12000
M204 S6000
G1 X115.482 Y134.254 E.00254
; LINE_WIDTH: 0.183556
G1 X115.385 Y134.32 E.00165
; LINE_WIDTH: 0.123039
G2 X115.128 Y134.543 I1.035 J1.454 E.00245
; LINE_WIDTH: 0.126364
G1 X115.066 Y134.624 E.00077
; LINE_WIDTH: 0.162472
G2 X114.886 Y134.875 I2.197 J1.762 E.00361
; WIPE_START
G1 X115.066 Y134.624 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.354 Y133.594 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111401
G1 F12000
M204 S6000
G2 X114.011 Y133.94 I4.051 J4.378 E.00285
; WIPE_START
G1 X114.354 Y133.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.75 Y128.196 Z1.44 F42000
G1 X120.378 Y127.568 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X120.115 Y127.344 I-.284 J.067 E.0152
G2 X113.85 Y127.255 I-26.442 J1649.858 E.25726
G3 X113.447 Y127.24 I.022 J-5.853 E.01656
G3 X113.443 Y125.66 I14.303 J-.823 E.06492
G3 X119.29 Y125.616 I5.095 J291.895 E.24008
G2 X120.15 Y125.556 I.034 J-5.676 E.03544
G2 X120.413 Y125.25 I-.068 J-.324 E.01778
G2 X120.469 Y121.763 I-406.372 J-8.259 E.1432
G3 X120.486 Y121.533 I2.353 J.068 E.00946
G3 X121.666 Y121.496 I1.021 J13.405 E.04846
G3 X122.012 Y121.512 I-.064 J4.937 E.01425
G3 X122.079 Y126.958 I-134.811 J4.385 E.22364
G3 X122.055 Y131.413 I-151.211 J1.42 E.18293
G3 X120.49 Y131.418 I-.808 J-8.036 E.0644
G3 X120.445 Y128.84 I46.671 J-2.088 E.10589
G2 X120.387 Y127.627 I-6.849 J-.276 E.04991
; WIPE_START
M204 S6000
G1 X120.347 Y127.485 E-.05615
G1 X120.279 Y127.407 E-.03945
G1 X120.199 Y127.362 E-.03455
G1 X120.115 Y127.344 E-.03293
G1 X118.544 Y127.322 E-.59691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.865 Y130.801 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.413 Y131.253 E.02844
G1 X120.875 Y131.24
G1 X121.874 Y130.241 E.06287
G1 X121.876 Y129.687
G1 X120.665 Y130.898 E.0762
M73 P95 R0
G1 X120.652 Y130.36
G1 X121.877 Y129.135 E.07704
G1 X121.878 Y128.583
G1 X120.65 Y129.811 E.07726
G1 X120.647 Y129.262
G1 X121.878 Y128.031 E.07747
G1 X121.879 Y127.479
G1 X120.642 Y128.716 E.07783
G1 X120.629 Y128.178
G1 X121.88 Y126.927 E.0787
G1 X121.877 Y126.378
G1 X120.6 Y127.655 E.08032
G1 X120.429 Y127.275
G1 X121.874 Y125.83 E.09092
G1 X121.871 Y125.281
G1 X120.011 Y127.141 E.117
G1 X119.475 Y127.125
G1 X121.868 Y124.733 E.15053
G1 X121.865 Y124.184
G1 X120.521 Y125.528 E.08454
G1 X120.622 Y124.876
G1 X121.862 Y123.635 E.07802
G1 X121.854 Y123.092
G1 X120.637 Y124.31 E.07659
G1 X120.646 Y123.749
G1 X121.843 Y122.552 E.07533
G1 X121.832 Y122.012
G1 X120.65 Y123.194 E.07436
G1 X120.654 Y122.638
G1 X121.597 Y121.696 E.05931
G1 X121.04 Y121.701
G1 X120.658 Y122.083 E.02404
; WIPE_START
M204 S6000
G1 X121.04 Y121.701 E-.20535
G1 X121.597 Y121.696 E-.21152
G1 X120.958 Y122.334 E-.34314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.385 Y125.664 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.929 Y127.12 E.09161
G1 X118.383 Y127.115
G1 X119.699 Y125.798 E.08279
G1 X119.13 Y125.816
G1 X117.837 Y127.109 E.08134
G1 X117.291 Y127.104
G1 X118.576 Y125.819 E.08084
G1 X118.022 Y125.821
G1 X116.745 Y127.098 E.08034
G1 X116.199 Y127.093
G1 X117.469 Y125.824 E.07985
G1 X116.915 Y125.826
G1 X115.653 Y127.087 E.07935
G1 X115.107 Y127.082
G1 X116.361 Y125.828 E.07886
G1 X115.807 Y125.831
G1 X114.569 Y127.068 E.07785
G1 X114.031 Y127.055
G1 X115.253 Y125.833 E.07685
G1 X114.697 Y125.838
G1 X113.635 Y126.9 E.06679
G1 X113.622 Y126.362
G1 X114.136 Y125.848 E.03234
; WIPE_START
M204 S6000
G1 X113.622 Y126.362 E-.27625
G1 X113.635 Y126.9 E-.20462
G1 X114.155 Y126.38 E-.27913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.678 Y127.733 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114575
G1 F12000
M204 S6000
G1 X120.605 Y127.926 E.00128
; WIPE_START
G1 X120.678 Y127.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.739 Y130.972 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.161329
G1 F12000
M204 S6000
G2 X120.706 Y131.25 I.322 J.18 E.00331
; WIPE_START
G1 X120.702 Y131.068 E-.48684
G1 X120.739 Y130.972 E-.27316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.707 Y123.41 Z1.44 F42000
G1 X118.035 Y111.163 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G1 X117.999 Y115.773 E.18926
G3 X117.958 Y116.735 I-7.48 J.162 E.03958
G3 X116.35 Y116.698 I-.644 J-7.029 E.06618
G3 X116.359 Y112.603 I121.596 J-1.771 E.16816
G2 X116.333 Y111.663 I-13.087 J-.102 E.03864
G1 X116.223 Y111.162 E.02103
G3 X113.43 Y111.078 I5.107 J-215.305 E.11471
G3 X113.45 Y109.539 I54.131 J-.09 E.0632
G3 X118.966 Y109.521 I3.795 J326.245 E.22652
G3 X120.511 Y109.658 I.188 J6.651 E.06379
G3 X122.069 Y111.757 I-.652 J2.112 E.11486
G3 X122.07 Y117.93 I-102.109 J3.109 E.2535
G3 X121.807 Y119.013 I-2.194 J.041 E.04627
G3 X120.149 Y120.165 I-2.332 J-1.59 E.08476
G3 X116.87 Y120.204 I-2.187 J-45.48 E.1347
G1 X113.45 Y120.183 E.14042
G1 X113.419 Y118.606 E.06479
G2 X118.952 Y118.565 I-.575 J-457.684 E.22721
G2 X120.02 Y118.482 I.116 J-5.399 E.04407
G2 X120.39 Y118.05 I-.172 J-.52 E.02453
G2 X120.44 Y117.245 I-5.184 J-.731 E.03313
G2 X120.429 Y112.135 I-371.979 J-1.754 E.20985
G2 X120.338 Y111.484 I-2.204 J-.022 E.02707
G2 X119.607 Y111.137 I-.67 J.467 E.03478
G2 X118.095 Y111.16 I-.499 J17.008 E.06209
; WIPE_START
M204 S6000
G1 X118.053 Y113.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.851 Y118.133 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X120.016 Y119.968 E.11543
G1 X119.439 Y119.993
G1 X121.889 Y117.544 E.15409
G1 X121.9 Y116.981
G1 X118.88 Y120.001 E.18998
G1 X118.324 Y120.006
G1 X119.587 Y118.742 E.07949
G1 X119.02 Y118.758
G1 X117.775 Y120.003 E.07836
G1 X117.226 Y120.001
G1 X118.458 Y118.769 E.0775
G1 X117.899 Y118.776
G1 X116.677 Y119.998 E.07687
G1 X116.128 Y119.996
G1 X117.344 Y118.78 E.07649
G1 X116.789 Y118.784
G1 X115.579 Y119.993 E.07611
G1 X115.03 Y119.991
G1 X116.234 Y118.787 E.07574
G1 X115.679 Y118.791
G1 X114.481 Y119.989 E.07536
G1 X113.932 Y119.986
G1 X115.124 Y118.794 E.07498
G1 X114.569 Y118.798
G1 X113.64 Y119.726 E.05842
G1 X113.63 Y119.186
G1 X114.014 Y118.801 E.02418
; WIPE_START
M204 S6000
G1 X113.63 Y119.186 E-.20655
G1 X113.64 Y119.726 E-.20552
G1 X114.288 Y119.079 E-.34793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.352 Y116.566 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X117.784 Y116.134 E.02715
G1 X117.801 Y115.566
G1 X116.823 Y116.543 E.06152
G1 X116.54 Y116.275
G1 X117.806 Y115.01 E.07962
G1 X117.81 Y114.454
G1 X116.534 Y115.73 E.08027
G1 X116.54 Y115.173
G1 X117.814 Y113.898 E.08019
G1 X117.819 Y113.342
G1 X116.545 Y114.616 E.0801
G1 X116.551 Y114.059
G1 X117.823 Y112.787 E.08002
G1 X117.827 Y112.231
G1 X116.557 Y113.501 E.07994
G1 X116.557 Y112.95
G1 X117.832 Y111.675 E.0802
G1 X117.836 Y111.119
G1 X116.554 Y112.401 E.08066
; WIPE_START
M204 S6000
G1 X117.836 Y111.119 E-.68903
G1 X117.835 Y111.306 E-.07097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.912 Y116.418 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.622 Y117.707 E.08111
G1 X120.64 Y117.138
G1 X121.915 Y115.863 E.08022
G1 X121.916 Y115.31
G1 X120.641 Y116.586 E.08024
G1 X120.641 Y116.034
G1 X121.917 Y114.758 E.08026
G1 X121.918 Y114.206
G1 X120.642 Y115.482 E.08028
G1 X120.642 Y114.93
G1 X121.912 Y113.66 E.07986
G1 X121.903 Y113.118
G1 X120.643 Y114.378 E.07929
G1 X120.644 Y113.826
G1 X121.895 Y112.575 E.07871
G1 X121.877 Y112.041
G1 X120.644 Y113.274 E.07759
G1 X120.635 Y112.731
G1 X121.851 Y111.516 E.07647
G1 X121.749 Y111.066
G1 X120.621 Y112.195 E.07098
G1 X120.589 Y111.675
G1 X121.565 Y110.699 E.0614
G1 X121.319 Y110.394
G1 X120.438 Y111.275 E.0554
G1 X120.117 Y111.044
G1 X121.016 Y110.145 E.05656
G1 X120.669 Y109.94
G1 X119.661 Y110.948 E.0634
G1 X119.125 Y110.934
G1 X120.253 Y109.805 E.07097
G1 X119.757 Y109.749
G1 X118.557 Y110.949 E.07548
G1 X117.99 Y110.965
G1 X119.225 Y109.73 E.07769
G1 X118.682 Y109.722
G1 X116.541 Y111.862 E.13467
G1 X116.474 Y111.378
G1 X118.129 Y109.723 E.10409
G1 X117.576 Y109.725
G1 X116.335 Y110.966 E.07807
G1 X115.8 Y110.95
G1 X117.023 Y109.727 E.07694
G1 X116.47 Y109.729
G1 X115.264 Y110.934 E.07581
G1 X114.729 Y110.918
G1 X115.916 Y109.73 E.07468
G1 X115.363 Y109.732
G1 X114.194 Y110.901 E.07356
G1 X113.659 Y110.885
G1 X114.81 Y109.734 E.07243
G1 X114.257 Y109.736
G1 X113.639 Y110.354 E.03888
; WIPE_START
M204 S6000
G1 X114.257 Y109.736 E-.33214
G1 X114.81 Y109.734 E-.21021
G1 X114.405 Y110.139 E-.21765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.45 Y115.866 Z1.44 F42000
G1 X121.805 Y118.54 Z1.44
M73 P96 R0
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282115
G1 F11581.639
M204 S6000
G1 X121.487 Y118.947 E.01307
; LINE_WIDTH: 0.319372
G1 F9917.431
G3 X120.998 Y119.437 I-3.509 J-3.015 E.02049
; LINE_WIDTH: 0.2882
G1 F11272.708
G1 X120.81 Y119.584 E.00623
; LINE_WIDTH: 0.248541
G1 F12000
G1 X120.622 Y119.732 E.00515
; LINE_WIDTH: 0.208882
G1 X120.433 Y119.88 E.00407
; WIPE_START
G1 X120.622 Y119.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.436 Y112.42 Z1.44 F42000
G1 X118.005 Y110.981 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.191008
G1 F12000
M204 S6000
G1 X117.852 Y110.922 E.00245
G1 X117.791 Y110.981 E.00127
G1 X117.848 Y111.131 E.0024
; WIPE_START
G1 X117.791 Y110.981 E-.29779
G1 X117.852 Y110.922 E-.1581
G1 X118.005 Y110.981 E-.30412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.738 Y111.028 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.123626
G1 F12000
M204 S6000
G1 X121.645 Y110.895 E.00118
; WIPE_START
G1 X121.738 Y111.028 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.03 Y104.357 Z1.44 F42000
G1 X115.931 Y100.58 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X117.583 Y102.189 I16.729 J-15.522 E.09474
G3 X122.113 Y106.25 I-343.514 J387.669 E.24978
G3 X122.083 Y108.107 I-148.096 J-1.41 E.07623
G3 X113.387 Y108.109 I-4.501 J-511.753 E.35708
G3 X113.4 Y106.447 I16.724 J-.702 E.06828
G3 X118.451 Y106.408 I4.214 J216.374 E.20742
G2 X119.155 Y106.342 I.029 J-3.481 E.02908
G2 X119.495 Y106.148 I-.524 J-1.314 E.0161
G2 X118.659 Y105.307 I-5.157 J4.285 E.04874
G3 X113.37 Y100.558 I221.017 J-251.441 E.29187
G3 X113.385 Y98.881 I23.532 J-.639 E.06884
G1 X113.399 Y98.772 E.00454
G3 X120.283 Y98.719 I4.847 J184.983 E.28266
G3 X122.113 Y98.766 I.053 J33.525 E.07516
G3 X122.14 Y100.445 I-7.316 J.957 E.06909
G3 X120.825 Y100.49 I-1.1 J-12.874 E.05404
G2 X116.568 Y100.533 I-.553 J155.523 E.17479
G1 X115.991 Y100.576 E.02375
; WIPE_START
M204 S6000
G1 X116.623 Y101.3 E-.3651
G1 X117.385 Y102.006 E-.3949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.045 Y107.911 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.9 Y107.055 E.05385
G1 X121.909 Y106.495
G1 X120.491 Y107.913 E.08921
G1 X119.938 Y107.914
G1 X121.702 Y106.15 E.11098
G1 X121.411 Y105.89
G1 X119.385 Y107.916 E.12749
G1 X118.832 Y107.918
G1 X121.121 Y105.629 E.14401
G1 X120.83 Y105.368
G1 X118.278 Y107.92 E.16052
G1 X117.725 Y107.922
G1 X119.095 Y106.552 E.08619
G1 X118.498 Y106.597
G1 X117.172 Y107.924 E.08346
G1 X116.619 Y107.925
G1 X117.942 Y106.602 E.08323
G1 X117.385 Y106.608
G1 X116.065 Y107.927 E.083
G1 X115.512 Y107.929
G1 X116.828 Y106.613 E.08278
G1 X116.271 Y106.619
G1 X114.965 Y107.924 E.08214
G1 X114.419 Y107.919
G1 X115.714 Y106.624 E.08148
G1 X115.157 Y106.63
G1 X113.873 Y107.914 E.08083
G1 X113.58 Y107.656
G1 X114.601 Y106.635 E.06421
G1 X114.044 Y106.64
G1 X113.572 Y107.112 E.02966
; WIPE_START
M204 S6000
G1 X114.044 Y106.64 E-.2534
G1 X114.601 Y106.635 E-.21161
G1 X114.052 Y107.184 E-.29499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.638 Y106.009 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X120.539 Y105.108 E.0567
G1 X120.249 Y104.847
G1 X119.38 Y105.716 E.05464
G1 X119.097 Y105.447
G1 X119.958 Y104.586 E.05416
G1 X119.667 Y104.326
G1 X118.814 Y105.179 E.05367
G1 X118.523 Y104.918
G1 X119.376 Y104.065 E.05367
G1 X119.086 Y103.804
G1 X118.232 Y104.658 E.0537
G1 X117.941 Y104.398
G1 X118.795 Y103.543 E.05374
G1 X118.504 Y103.283
G1 X117.649 Y104.138 E.05377
G1 X117.358 Y103.877
G1 X118.213 Y103.022 E.05381
G1 X117.923 Y102.761
G1 X117.067 Y103.617 E.05384
G1 X116.776 Y103.357
G1 X117.632 Y102.501 E.05388
G1 X117.343 Y102.238
G1 X116.484 Y103.097 E.05401
G1 X116.193 Y102.837
G1 X117.057 Y101.973 E.05432
G1 X116.77 Y101.708
G1 X115.902 Y102.577 E.05463
G1 X115.61 Y102.317
G1 X116.484 Y101.443 E.05495
G1 X116.214 Y101.162
G1 X115.319 Y102.056 E.05627
G1 X115.028 Y101.796
G1 X115.943 Y100.881 E.0576
G1 X115.673 Y100.599
G1 X114.737 Y101.536 E.05893
; WIPE_START
M204 S6000
G1 X115.673 Y100.599 E-.50342
G1 X115.943 Y100.881 E-.14819
G1 X115.742 Y101.082 E-.10839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.504 Y100.283 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X121.973 Y99.814 E.02952
G1 X121.962 Y99.273
G1 X120.949 Y100.286 E.0637
G1 X120.395 Y100.289
G1 X121.739 Y98.945 E.08457
G1 X121.202 Y98.931
G1 X119.841 Y100.292 E.08563
G1 X119.287 Y100.295
G1 X120.658 Y98.924 E.08625
G1 X120.111 Y98.919
G1 X118.732 Y100.297 E.08671
G1 X118.178 Y100.3
G1 X119.559 Y98.919 E.08686
G1 X119.007 Y98.92
G1 X117.621 Y100.306 E.08718
G1 X117.058 Y100.318
G1 X118.455 Y98.921 E.08788
G1 X117.903 Y98.921
G1 X116.479 Y100.345 E.08956
G1 X115.89 Y100.383
G1 X117.351 Y98.922 E.09192
G1 X116.799 Y98.922
G1 X114.445 Y101.276 E.14807
G1 X114.154 Y101.016
G1 X116.247 Y98.923 E.13167
G1 X115.689 Y98.929
G1 X113.868 Y100.75 E.11457
G1 X113.583 Y100.484
G1 X115.128 Y98.939 E.09715
G1 X114.566 Y98.95
G1 X113.571 Y99.945 E.06262
G1 X113.571 Y99.393
G1 X114.004 Y98.96 E.02725
; WIPE_START
M204 S6000
G1 X113.571 Y99.393 E-.23277
G1 X113.571 Y99.945 E-.20976
G1 X114.161 Y99.354 E-.31746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.814 Y105.405 Z1.44 F42000
G1 X119.542 Y106.352 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129899
G1 F12000
M204 S6000
G1 X119.395 Y106.464 E.00147
; LINE_WIDTH: 0.175957
G1 X119.249 Y106.576 E.00244
; LINE_WIDTH: 0.201899
G1 X119.233 Y106.586 E.0003
G1 X119.085 Y106.541 E.0025
; WIPE_START
G1 X119.233 Y106.586 E-.67784
G1 X119.249 Y106.576 E-.08216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.985 Y100.244 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.117921
G1 F12000
M204 S6000
G1 X116.755 Y100.345 E.00165
; WIPE_START
G1 X116.985 Y100.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.888 Y99.199 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.167082
G1 F12000
M204 S6000
G1 X121.916 Y99.121 E.00102
G1 X121.907 Y98.935 E.00227
; WIPE_START
G1 X121.916 Y99.121 E-.52509
G1 X121.888 Y99.199 E-.23491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.29 Y92.468 Z1.44 F42000
G1 X116.743 Y89.575 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7144.614
M204 S5000
G2 X115.984 Y89.472 I-.574 J1.386 E.03177
G2 X115.288 Y89.593 I-.084 J1.577 E.02926
G2 X115.112 Y90.004 I.348 J.393 E.01898
G2 X115.151 Y94.761 I75.618 J1.756 E.19537
G2 X115.421 Y95.489 I1.017 J.037 E.03269
G2 X115.95 Y95.677 I.589 J-.817 E.02338
G2 X119.457 Y95.704 I1.993 J-31.538 E.14406
G2 X120.231 Y95.326 I0 J-.981 E.03662
G2 X120.344 Y94.704 I-1.47 J-.588 E.02615
G2 X120.43 Y87.787 I-279.296 J-6.958 E.28401
G1 X122.08 Y87.787 E.06773
G3 X122.055 Y95.468 I-292.858 J2.87 E.31535
G3 X120.635 Y97.192 I-2.955 J-.986 E.09379
G3 X119.313 Y97.434 I-1.34 J-3.583 E.05546
G3 X115.784 Y97.407 I-1.436 J-43.481 E.14496
G3 X114.106 Y96.568 I.087 J-2.271 E.07939
G3 X113.419 Y94.928 I1.813 J-1.723 E.07463
G3 X113.379 Y92.475 I53.037 J-2.107 E.10076
G1 X113.404 Y87.786 E.19253
G3 X118.187 Y87.769 I3.283 J248.828 E.19641
G3 X118.612 Y87.798 I-.008 J3.262 E.0175
G3 X118.658 Y91.762 I-46.497 J2.518 E.16283
G3 X118.613 Y92.383 I-5.189 J-.059 E.02559
G3 X116.916 Y92.336 I-.148 J-25.479 E.06974
G2 X116.851 Y89.926 I-41.619 J-.083 E.09904
G2 X116.772 Y89.627 I-.747 J.038 E.01277
; WIPE_START
M204 S6000
G1 X116.617 Y89.518 E-.07197
G1 X116.507 Y89.494 E-.04294
G1 X115.984 Y89.472 E-.19855
G1 X115.584 Y89.504 E-.15249
G1 X115.447 Y89.53 E-.05324
G1 X115.288 Y89.593 E-.06473
G1 X115.178 Y89.719 E-.06378
G1 X115.141 Y89.816 E-.03939
G1 X115.112 Y90.004 E-.07241
G1 X115.112 Y90.005 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.592 Y96.185 Z1.44 F42000
G1 X120.264 Y97.112 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6594.904
M204 S2000
G1 X121.81 Y95.566 E.09726
G1 X121.87 Y94.954
G1 X119.614 Y97.21 E.14189
G1 X119.034 Y97.239
M73 P97 R0
G1 X121.876 Y94.396 E.17878
G1 X121.883 Y93.839
G1 X120.471 Y95.251 E.08881
G1 X120.546 Y94.624
G1 X121.889 Y93.281 E.08447
G1 X121.889 Y92.729
G1 X120.561 Y94.057 E.08355
G1 X120.567 Y93.5
G1 X121.888 Y92.179 E.0831
G1 X121.887 Y91.628
G1 X120.573 Y92.942 E.08266
G1 X120.579 Y92.385
G1 X121.886 Y91.078 E.08221
G1 X121.885 Y90.527
G1 X120.586 Y91.827 E.08177
G1 X120.592 Y91.27
G1 X121.884 Y89.977 E.08132
G1 X121.884 Y89.426
G1 X120.598 Y90.712 E.08088
G1 X120.604 Y90.155
G1 X121.883 Y88.876 E.08043
G1 X121.882 Y88.326
G1 X120.61 Y89.597 E.07999
G1 X120.616 Y89.04
G1 X121.669 Y87.987 E.06622
G1 X121.117 Y87.987
G1 X120.622 Y88.482 E.03115
; WIPE_START
M204 S6000
G1 X121.117 Y87.987 E-.26609
G1 X121.669 Y87.987 E-.20954
G1 X121.14 Y88.516 E-.28438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.454 Y91.753 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.028 Y92.179 E.02681
G1 X117.495 Y92.161
G1 X118.465 Y91.191 E.06102
G1 X118.466 Y90.638
G1 X117.107 Y91.997 E.08546
G1 X117.095 Y91.458
G1 X118.464 Y90.089 E.08613
G1 X118.463 Y89.539
G1 X117.083 Y90.919 E.08681
G1 X117.071 Y90.379
G1 X118.461 Y88.989 E.08748
G1 X118.444 Y88.455
G1 X117.038 Y89.86 E.08843
G1 X116.904 Y89.444
G1 X118.366 Y87.981 E.09202
G1 X117.826 Y87.97
G1 X116.502 Y89.294 E.08331
G1 X115.972 Y89.273
G1 X117.273 Y87.971 E.08185
G1 X116.72 Y87.973
G1 X115.332 Y89.361 E.08727
; WIPE_START
M204 S6000
G1 X116.72 Y87.973 E-.7455
G1 X116.758 Y87.973 E-.0145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.616 Y95.05 Z1.44 F42000
G1 X119.92 Y95.802 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F6594.904
M204 S2000
G1 X118.475 Y97.246 E.09088
G1 X117.916 Y97.254
G1 X119.259 Y95.911 E.08451
G1 X118.686 Y95.932
G1 X117.359 Y97.259 E.08348
G1 X116.816 Y97.251
G1 X118.133 Y95.934 E.08289
G1 X117.589 Y95.927
G1 X116.282 Y97.234 E.08225
G1 X115.761 Y97.203
G1 X117.045 Y95.919 E.08075
G1 X116.501 Y95.912
G1 X115.289 Y97.124 E.07624
G1 X114.898 Y96.964
G1 X115.982 Y95.879 E.06822
G1 X115.526 Y95.784
G1 X114.574 Y96.736 E.05987
G1 X114.291 Y96.467
G1 X115.205 Y95.554 E.05745
G1 X115.017 Y95.191
G1 X114.041 Y96.166 E.06136
G1 X113.836 Y95.819
G1 X114.955 Y94.701 E.07035
G1 X114.928 Y94.177
G1 X113.69 Y95.414 E.07784
G1 X113.629 Y94.924
G1 X114.922 Y93.631 E.08136
G1 X114.916 Y93.085
G1 X113.597 Y94.405 E.083
G1 X113.588 Y93.862
G1 X114.911 Y92.539 E.08324
G1 X114.905 Y91.994
G1 X113.578 Y93.32 E.08347
G1 X113.58 Y92.767
G1 X114.9 Y91.448 E.08298
G1 X114.894 Y90.902
G1 X113.583 Y92.213 E.08247
G1 X113.586 Y91.659
G1 X114.905 Y90.339 E.08303
G1 X114.97 Y89.723
G1 X113.588 Y91.105 E.08691
G1 X113.591 Y90.551
G1 X116.166 Y87.975 E.16202
G1 X115.613 Y87.977
G1 X113.593 Y89.997 E.12705
G1 X113.596 Y89.443
G1 X115.059 Y87.979 E.09208
G1 X114.506 Y87.981
G1 X113.598 Y88.889 E.05711
; WIPE_START
M204 S6000
G1 X114.506 Y87.981 E-.48788
G1 X115.059 Y87.979 E-.21029
G1 X114.944 Y88.094 E-.06183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.913 Y90.608 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.136116
G1 F12000
M204 S6000
G1 X114.82 Y90.828 E.00207
; WIPE_START
G1 X114.913 Y90.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.256 Y89.285 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.210669
G1 F12000
M204 S6000
G2 X114.947 Y89.586 I1.969 J2.335 E.00742
G1 X114.972 Y89.726 E.00244
; WIPE_START
G1 X114.947 Y89.586 E-.18799
G1 X115.127 Y89.393 E-.34899
G1 X115.256 Y89.285 E-.22302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.809 Y88.253 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.173504
G1 F12000
M204 S6000
G1 X121.846 Y88.164 E.00125
G1 X121.846 Y87.967 E.00254
; WIPE_START
G1 X121.846 Y88.164 E-.50978
G1 X121.809 Y88.253 E-.25022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.634 Y94.13 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.118225
G1 F12000
M204 S6000
G1 X120.538 Y94.356 E.00163
M204 S10000
G1 X120.544 Y95.323 F42000
; LINE_WIDTH: 0.191182
G1 F12000
M204 S6000
G3 X120.167 Y95.734 I-1.683 J-1.165 E.00837
; LINE_WIDTH: 0.214865
G1 X119.987 Y95.869 E.00397
M204 S10000
G1 X119.532 Y95.891 F42000
; LINE_WIDTH: 0.127375
G1 F12000
M204 S6000
G3 X119.334 Y95.986 I-1.8 J-3.502 E.00168
; WIPE_START
G1 X119.532 Y95.891 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.241 Y96.443 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.111197
G1 F12000
M204 S6000
G3 X120.97 Y96.713 I-2.696 J-2.428 E.00223
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
G1 X121.241 Y96.443 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 331
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
G1 X0 Y128 F18000 ; move to safe pos
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

