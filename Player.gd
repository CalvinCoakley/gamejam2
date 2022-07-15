extends KinematicBody2D

export var speed = 200
export var friction = 0.01
export var acceleration = 0.1

onready var parts = get_parent().get_node("Viewport/Particles2D")

var velocity = Vector2()

func get_input():
	var input = Vector2()
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity * delta * 60)
	
	look_at(get_global_mouse_position())
	rotation_degrees += 90

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			parts.emitting = true
