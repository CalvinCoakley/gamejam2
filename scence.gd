extends Node2D

func _on_StaticBody2D_area_entered(area):
	var scene = Global.scene_names[Global.index + 1]
	Global.goto_scene(scene)

var playermove = 150

func _on_StaticBody2D_body_entered(body):
	if Global.index == len(Global.scene_names)-1:
		return
	var scene = Global.scene_names[Global.index + 1]
	Global.player = get_node("Player").position + get_node("Player").position.direction_to(get_node("StaticBody2D").position) * playermove
	Global.index += 1
	Global.goto_scene(scene)


func _on_StaticBody2D2_body_entered(body):
	if Global.index == 0:
		return
	var scene = Global.scene_names[Global.index - 1]
	Global.player = get_node("Player").position + get_node("Player").position.direction_to(get_node("StaticBody2D2").position) * playermove
	Global.index -= 1
	Global.goto_scene(scene)
