extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
# Direction
	var direction=Vector2.RIGHT
#Velocity
	const speed:int=10
	velocity=direction*speed

#move and slide()
	move_and_slide()