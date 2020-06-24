extends KinematicBody2D

var movement = Vector2()
export var speed = 250
export var jumpPower = -400
export var jetpackPower = 200

func _physics_process(delta):
	movement.y += 10
	
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed
	else:
		movement.x = 0

	move_and_slide(movement)
		
