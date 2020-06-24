extends KinematicBody2D


export var speed = 750
var movement = Vector2()

func _physics_process(delta):
	movement.x = speed
	
	move_and_collide(movement)
