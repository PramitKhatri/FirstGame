extends CharacterBody2D

var pos:Vector2=Vector2.ZERO  #this is a shortcut to make the player initial positon value to (0,0)
const speed:int=100

var can_shoot:bool=true
var can_grenade:bool=true
signal laserSignal(laserPosition)
signal grenadeSignal(grenadePosition)


# Called when the node enters the scene tree for the first time.
func _ready():
#	pos=Vector2(200,200)  #sets the pos of the player when the scene is ready.
#	position=pos  #set the position of player to pos
	pass
#	$"..".customFunction(position.x)  #this is how to call a function from the parent node. inthis case it is level.gd


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):  #since we use move_and_slide() that automatically uses delta, we specify that we are not using delta in this function
#	pos.x+=speed*delta  #don't forget pos is a vector value meaning it has x axis and y axis.
#	position=pos

	var direction=Input.get_vector('left','right','up','down')
	
#	position+=direction*100*delta
	velocity=direction*300
	move_and_slide()
#	print(position)
	
	if Input.is_action_pressed("left mouse") and can_shoot:
		#laser will come out from a random marker selected on the palyer's gun. to do that:
		var laserMarkers=$laserMarkers.get_children() #array of the markers
		var selected_Laser_marker = laserMarkers[randi() % laserMarkers.size()]  #select a random index from the length of array
		print('shoot laser pew! pew! pew!')
		$Timer.start()
		can_shoot=false
		
		#send the signal with the positon -> global position for some reason, just position doesnot work
		laserSignal.emit(selected_Laser_marker.global_position)
	
	if Input.is_action_pressed("right mouse") and can_grenade:
		print('throw grenade boom!')
		$GrenadeReloadTimer.start()
		can_grenade=false
		grenadeSignal.emit($grenadeMarker.global_position)
	
#	$"..".customFunction(position.x) 
	
#	rotation_degrees+=-10*delta # i dont know how this is working


func _on_timer_timeout():
	can_shoot=true


func _on_grenade_reload_timer_timeout():
	can_grenade=true
