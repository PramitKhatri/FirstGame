extends Sprite2D

var pos:Vector2=Vector2.ZERO
const speed:int=100
var rotater:int=0
var test_scale:float=1


# Called when the node enters the scene tree for the first time.
func _ready():
	pos=Vector2(0,200)
	position=pos
	
#	scale= Vector2(test_scale+1,test_scale+1)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x+=speed*delta # 
	position=pos

	
#	rotater+=1
#	rotation_degrees=rotater
	
	#test_scale+=1
	#scale= Vector2(test_scale,test_scale)
	
#	print(position)
