extends KinematicBody2D

export var speed = 200
export var friction = 0.01
export var acceleration = 0.1
export var timer_cooldown = 0.3
export var shot_duration = 0.1
export(Vector2) var  mid_pos = Vector2(418,276);

var scene = preload("res://projectile.tscn")

var canshoot = true

onready var parts = get_parent().get_node_or_null("Viewport/Particles2D")

func _ready():
	if Global.player != Vector2.ZERO:
		position = Global.player

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
	

func _process(_delta):
	if parts == null:
		return
	parts.process_material.set_shader_param("spawn_angle_base",rotation - deg2rad(90))

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and canshoot:
			var instance = scene.instance()
			instance.player_target = false
			instance.global_position = global_position
			instance.angle = rotation- deg2rad(90)
			canshoot = false
			get_parent().add_child(instance)
			#$Timer.start(shot_duration)
			$Timer2.start(timer_cooldown)

func _on_Timer_timeout():
	$Timer2.start(timer_cooldown)


func _on_Timer2_timeout():
	canshoot = true
