extends Node2D

var laserScene : PackedScene =preload("res://Scenes/projectiles/laser.tscn")
var grenadeScene:PackedScene=preload("res://Scenes/projectiles/grenade.tscn")
#const myarray:Array[int]=[1,2,3,4,5,6,7,8,9,10]

# Called when the node enters the scene tree for the first time.
#func _ready():
#
#	for i in myarray: #i=myarray[1]->myarray[2]... 
#		print(i)  #not print(myarray[i])
#
#	print(myarray[2])
	
			
# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if $Player.position.x>1000:
#		$Player.position.x==0 #THis doesnot work since in player.gd we are updating the positon to the value of pos which will overide this value.
#		$Player.pos.x=0  #pos is the variable in player.gd and is a vector with x and y attribute.
#		print('positon is too much')
	
#	$Player.rotation_degrees+=-10*delta
#	print(Input.is_action_pressed("left")) #retirn true while the left is pressed.
#	print(Input.is_action_just_pressed('left')) #returns true once left is pressesd then false even if you are pressing it

#func customFunction(value):
#	$Drone.position.x=value+200
	
#	if $enemy.position.x==$Player.position.x:
#		print('game over.')
	
#	print('this is function in level.gd')  #this can be accessed from any child node by using $"..".customFunction()


# The function was for when gate was not an individual scene and was just a node.
#func _on_area_2d_body_exited(_body):
#	print('player has exited the gate')
#func _on_area_2d_body_entered(_body):
#	print('player has entered the gate. why are you running! why are you runnuing??? OH! you are runnung because you were previously touching the collison shape of gate.')


func _on_gate_player_entered_gate(_body):
	print('player has entered the sceene')
	print('The signal is coming from area2d of gate node to gate script and the script in gate is sending the signal here to level to run this function.')
	
	

func _on_gate_player_exited_gate(body):  #body is just a parameter to catch what is being sent, so probably can be named anything as well
	print('player has exited gate')
	print(body)


func _on_player_laser_signal(laserPosition):
	print('laser from level')
	
	var laser=laserScene.instantiate()
	#update the laser position
	laser.position=laserPosition
	#move the laser
	#add the laser as an instance to a separate node than the level to make it less messy.
	$Projectiles.add_child(laser)
	


func _on_player_grenade_signal(grenadePosition):
	print('grenade from level')
	
	var grenade=grenadeScene.instantiate()
	grenade.position=grenadePosition
	$Projectiles.add_child(grenade)
