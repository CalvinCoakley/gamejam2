extends Control

func _ready():
	Music.play_menu()


func _on_button_pressed():
	Global.goto_scene("blue")
	Music.play_di()
