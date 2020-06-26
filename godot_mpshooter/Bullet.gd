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
	if collision:
		if collision.collider.has_method("hit"):  #This is a function that is in the enemy script so that it will disappear etc..
			collision.collider.hit()
			queue_free()
		else:
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
