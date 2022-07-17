extends Node

func _ready():
	play_di()

var boss_music = load("res://boss song.mp3")
var idk_music = load("res://idk.wav")
var menu_music = load("res://menu.mp3")

func play_boss():
	$AudioStreamPlayer.stream = boss_music
	$AudioStreamPlayer.play()
func play_di():
	$AudioStreamPlayer.stream = idk_music
	$AudioStreamPlayer.play()
func play_menu():
	$AudioStreamPlayer.stream = menu_music
	$AudioStreamPlayer.play()
