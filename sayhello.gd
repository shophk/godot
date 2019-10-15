extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var a = 2
var s
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button1").connect("pressed", self, "_on_Button_pressed")
	var label = Label.new()
	label.set_text("Hello worldxxx!")
	label.rect_position = Vector2(200,200) 
    # This adds the node to the scene. Before this line, it is not visible.
	add_child(label)
	_instanceScene()

	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_pressed():
	get_node("Label0").text = "HELLO!"
#	get_node("Label2")._start_counting()
	get_node("Label3")._start_counting()
#	get_tree().call_group("labels", "_start_counting")

func _instanceScene():
	var scene = load("res://instanceScene.tscn") # Will load when the script is instanced.
	add_child(scene.instance())