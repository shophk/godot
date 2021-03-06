extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("labels")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var accum = 0
var startCount = false
func _process(delta):
	if startCount:
    	accum += delta
    	text = str(accum) # 'text' is a built-in label property.

func _start_counting():
	startCount = true