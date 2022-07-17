extends Node
onready var newell = get_parent().get_node_or_null("Enemy")
func change_to_charger():
	newell.distancekeep = 100
	newell.distancekeep2 = 200
	newell.attack_type = 1
	newell.timer_cooldown = 1
	newell.movespeed = 150
func change_to_enemy():
	newell.movespeed = 100
	newell.distancekeep = 300
	newell.distancekeep2 = 500
	newell.attack_type = 0
	newell.timer_cooldown = 0.25
	
func _ready():
	
	if rand_range(0,1) < 0.5:
		change_to_charger()
	else:
		change_to_enemy()
	$Timer.start(rand_range(2,5))

func _process(delta):
	newell.seesplayer = true

func _on_Timer_timeout():
	if rand_range(0,1) < 0.5:
		change_to_charger()
	else:
		change_to_enemy()
	$Timer.start(rand_range(2,5))
