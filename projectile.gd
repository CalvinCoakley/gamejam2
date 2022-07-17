extends Area2D

export(float) var move_speed

var angle = 0;

var velocity;
export var player_target = false

func _physics_process(delta):
	velocity = Vector2(cos(angle),sin(angle)) * move_speed
	position += (velocity * delta * 60)


func _on_KinematicBody2D_body_entered(body):
	if player_target:
		if body.name == "Player":
			Global.player_health -= 1
			#body.position -= velocity
	elif body.is_in_group("Enemies"):
		body.health -= 1
		#body.position -= velocity

