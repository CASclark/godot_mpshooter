extends KinematicBody2D

const UP = Vector2(0,-1) # This allows us to discover the floor

var movement = Vector2()
export var speed = 250
export var jumpPower = -400
export var jetpackPower = -150
var jetpackJuice = 100   #gas for the jetpack

var Bullet = preload("res://World Tiles/Bullet.tscn")

func _physics_process(delta):
	movement.y += 10
	
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed
	else:
		movement.x = 0
		
	
	if Input.is_action_pressed("jetpack"):
		if jetpackJuice > 0:	#whilst there is gas in the jetpack
			movement.y = jetpackPower
			jetpackJuice -= 1
		
	elif jetpackJuice < 100: #when you take off the button will add up until gets to 100
			jetpackJuice += 2
		
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			movement.y = jumpPower
		

	move_and_slide(movement, UP)
	
	
	$hand.look_at(get_global_mouse_position())
	$gun.look_at(get_global_mouse_position())
		
