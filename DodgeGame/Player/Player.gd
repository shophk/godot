extends Area2D
signal hit
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 300  # How fast the player will move (pixels/sec).
var velocity = Vector2()

var screen_size  # Size of the game window.
# Add this variable to hold the clicked position.
var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size

# Change the target whenever a touch event happens.
func _input(event):
    if event is InputEventScreenTouch and event.pressed:
        target = event.position
		
func start(pos):
	position = pos
	# Initial target is the start position.
	target = pos
	show()
	print("START!!!!")
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    # Move towards the target and stop when close.
    if position.distance_to(target) > 10:
        velocity = (target - position).normalized() * speed
    else:
        velocity = Vector2()

# Remove keyboard controls.
#    if Input.is_action_pressed("ui_right"):
#       velocity.x += 1
#    if Input.is_action_pressed("ui_left"):
#        velocity.x -= 1
#    if Input.is_action_pressed("ui_down"):
#        velocity.y += 1
#    if Input.is_action_pressed("ui_up"):
#        velocity.y -= 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        $AnimatedSprite.play()
    else:
        $AnimatedSprite.stop()

    position += velocity * delta
    # We don't need to clamp the player's position
    # because you can't click outside the screen.
    # position.x = clamp(position.x, 0, screensize.x)
    # position.y = clamp(position.y, 0, screensize.y)

    if velocity.x != 0:
        $AnimatedSprite.animation = "right"
        $AnimatedSprite.flip_v = false
        $AnimatedSprite.flip_h = velocity.x < 0
    elif velocity.y != 0:
        $AnimatedSprite.animation = "up"
        $AnimatedSprite.flip_v = velocity.y > 0


func _on_Player_body_entered(body):
	hide() # Player disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled",true);
	

