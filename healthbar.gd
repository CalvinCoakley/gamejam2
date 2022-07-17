extends ProgressBar


func _process(_delta):
	value = 20 * Global.player_health
