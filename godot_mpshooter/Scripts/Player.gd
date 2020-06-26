extends KinematicBody2D

const UP = Vector2(0,-1) # This allows us to discover the floor

var movement = Vector2()
export var speed = 250
export var jumpPower = -400
export var jetpackPower = -150
var jetpackJuice = 100   #gas for the jetpack

#setting a reload for the gun
export var bulletFull = 5
var bulletCount = 5
var reload = false

var Bullet = preload("res://World Tiles/Bullet.tscn")

func _physics_process(delta):
	movement.y += 10
	
	var mouse_pos = get_global_mouse_position()   #these are the vars to set player flip
	var player_pos = get_position()
	var mx = mouse_pos.x
	var px = player_pos.x
	
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
	
	if Input.is_action_just_pressed("shoot"):
		if !reload: #if there are bullets remaining
			shoot()
		
	$hand.look_at(get_global_mouse_position())   #rememeber to move the center of rotation into the middle of the player
	$gun.look_at(get_global_mouse_position())
	
	if mx > px: 				#flip player according to what side the mouse is
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		
	
	if Input.is_action_just_pressed("reload"):
		bulletCount = bulletFull
		reload = false
			
		
func shoot():
	#Muzzle is the 2d position placed on the gun.
	var b = Bullet.instance()
	b.start($gun/Muzzle.global_position, $gun.rotation)
	get_parent().add_child(b)
	bulletCount = bulletCount -1
	print(bulletCount)
	if bulletCount <= 0:
		reload = true
	
		
