extends Area2D

var progress = 1

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Global.player_health -= 1

func  _process(delta):
	$CollisionShape2D.shape.radius += 1
	progress += 1
	$Circle.scale += Vector2(0.065,0.065)
	if progress >  100:
		queue_free()

func _ready():
	$CollisionShape2D.shape.radius = 0
