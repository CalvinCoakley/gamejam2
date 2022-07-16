
extends Particles2D


export(bool) var highdef #= false setget change;



#func change(val)
func _ready():
	#highdef = val
	texture.width = 10 if highdef else 100
	texture.height = 10 if highdef else 100
	amount = 20000 if highdef else 8000
	var cr = get_parent().get_parent().get_node("Control/ColorRect")
	var crblur = 1 if highdef else 2.4
	cr.material.set_shader_param("blur_amount",crblur)

