extends Node2D

export var minSpeed = 50
export var maxSpeed = 100
var speed = 100
var movement = Vector2()

export var minY = 100
export var maxY = 400
export var endScreen = 2000
export var startXPos = -200

func _ready():
	chooseRandY(minY,maxY,minSpeed,maxSpeed)
	
func _process(delta):
	movement = Vector2(speed, 0) #setting movement to desired direction
	self.translate(movement * delta) #change nodes position
	if self.position.x > endScreen:
		chooseRandY(minY,maxY,minSpeed,maxSpeed)
		self.position.x = startXPos
		
	#print(self.position.y)
		
func chooseRandY(MinY,MaxY,MinSpeed,MaxSpeed):
	
	var n = randi()% (MaxY - MinY + 1) + MinY
	self.position.y = n
	var s = randi()% (MaxSpeed - MinSpeed + 1) + MinSpeed
	speed = s
