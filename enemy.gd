tool
extends Particles2D



func _process(delta):
	var divisor = Vector2(1024,600);
	var pos = Vector2.ZERO#get_parent().get_parent().get_node("Enemy").position#/divisor;
	#var pos2 = get_parent().get_parent().get_node("Control").position / divisor;
	#var pos4 = get_parent().get_parent().get_node("Control2").position / divisor;
	#var pos3 = get_parent().get_parent().get_node("End").position /divisor;
	process_material.set_shader_param("start_point",pos)
	#process_material.set_shader_param("bezier_control_point",pos2)
	#process_material.set_shader_param("bezier_control2_point",pos4)
	#process_material.set_shader_param("bezier_curve_point",pos3)
	position = get_parent().get_parent().get_node("Enemy").global_position + Vector2(0,-0)
