extends CanvasLayer

signal start_game
signal game_reset
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()
	emit_signal("game_reset")
	
func update_score(score):
    $ScoreLabel.text = str(score)

func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")
	

func _on_MesssageTimer_timeout():
	 $MessageLabel.hide()
