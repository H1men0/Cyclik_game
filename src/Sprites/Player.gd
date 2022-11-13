extends KinematicBody2D

const SPEED = 300
const JUMP = 500
const GRAVITY = 970
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$player.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$player.flip_h = true
	else:
		velocity.x = 0
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = -JUMP
	
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
