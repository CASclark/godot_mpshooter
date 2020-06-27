extends Node2D

var musicPlay = true
onready var musicNode = $BackgroundMusic/Chip

func _ready():
	musicNode.play()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("soundcontrol"):
		controlMusic()
		
func controlMusic():
	musicPlay = !musicPlay
	
	if musicPlay:
		musicNode.play()
	else:
		musicNode.stop()
