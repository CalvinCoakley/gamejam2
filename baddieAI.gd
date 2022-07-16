extends KinematicBody2D

export(float) var movespeed
export(float) var distancekeep
export(float) var distancekeep2
export(float) var acceleration
export(float) var friction
export var timer_cooldown = 0.1
export var shot_duration = 0.1
export(NodePath) var player

var angle = 0
var seesplayer = false
var turn = 1
var velocity := Vector2.ZERO

func _physics_process(delta):
	var Player = get_node(player)
	if seesplayer: #hunting
		look_at(Player.global_position)
		rotation_degrees += 90
		if $RayCast2D.get_collider() != Player:
			seesplayer = false
		else:
			
			if global_position.distance_to(Player.global_position) > distancekeep:
				velocity = lerp(velocity,global_position.direction_to(Player.global_position) * clamp(global_position.distance_to(Player.global_position) / 100,1,1.5) * movespeed, acceleration)
			elif global_position.distance_to(Player.global_position) < distancekeep2:
				velocity = lerp(velocity,-global_position.direction_to(Player.global_position) * movespeed, acceleration)
			else:
				velocity = lerp(velocity, Vector2.ZERO, friction)
			shoot()
	velocity = move_and_slide(velocity * delta * 60)
	if $RayCast2D.get_collider() == null: #searching
		rotation_degrees += turn
		return
	if $RayCast2D.get_collider() == Player:
		if rand_range(0,1) > 0.5:
			turn = 1
		else:
			turn = -1
		seesplayer = true
		return
	else:
		rotation_degrees += turn
		velocity = Vector2.ZERO
	#Stay a certain distance away from the player
	#if they dont have a line of sight, they dont do anything
	#sometimes they shoot
var canshoot = true
onready var parts = get_parent().get_node_or_null("Viewport/Particles2D")
func _process(delta):
	if parts == null:
		return
	parts.process_material.set_shader_param("spawn_angle_base",rotation- deg2rad(90))

func shoot():
	if parts == null:
		return
	if canshoot:
		parts.emitting = true
		$Timer.start(shot_duration)
		canshoot = false



func _on_Timer_timeout():
	parts.emitting = false
	$Timer2.start(timer_cooldown)


func _on_Timer2_timeout():
	canshoot = true


