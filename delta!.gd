tool
extends ColorRect

func _process(delta):
	material.set_shader_param("DELTA",delta)
