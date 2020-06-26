extends KinematicBody2D


export var speed = 750
var movement = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	movement = Vector2(speed,0).rotated(rotation)
	

func _physics_process(delta):
	#movement.x = speed
	var collision = move_and_collide(movement * delta)
