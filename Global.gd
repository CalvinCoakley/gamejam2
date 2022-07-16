extends Node

var current_scene = null
var scene_names = ["red","green","blue","FloorRendert"]
var index = 0
var player = Vector2.ZERO;

func shuffleList(list):
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList



func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	var basename = current_scene.filename
	var remove1 = "res://"
	var remove2 = ".tscn"
	basename = basename.replace(remove1,"")
	basename = basename.replace(remove2,"")
	randomize()
	scene_names.shuffle()
	scene_names.remove(scene_names.find(basename))
	scene_names.insert(0,basename)

func goto_scene(path):
	index = scene_names.find(path)

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	current_scene.free()

	var s = ResourceLoader.load("res://" + path + ".tscn")

	current_scene = s.instance()
	

	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
