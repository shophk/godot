extends Node

#Register scripts as classes
#Godot has a “Script Class” feature to register individual scripts with the Editor. By default, you can only access unnamed scripts by loading the file directly.
#
#You can name a script and register it as a type in the editor with the class_name keyword followed by the class’s name. You may add a comma and an optional path to an image to use as an icon. You will then find your new type in the Node or Resource creation dialog.
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

class_name RegisterScriptAsClass

# Called when the node enters the scene tree for the first time.
func _ready():
	var this = RegisterScriptAsClass
	var cppNode = MyCppNode.new()
	
	cppNode.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
