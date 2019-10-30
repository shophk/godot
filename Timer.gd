extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#	This bit of code is connecting Timer by default signal
#	'timeout'. This can be seen in Node tab
#	var t = get_node("../Timer")
#	t.connect("timeout", self, "_on_Timer_timeout")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
		var s = get_node('../SpriteTest')
		s.visible = !s.visible