extends StaticBody2D

signal playerEnteredGate(body) #body here is a custom parameter to be sent to the level and can be named anything
signal playerExitedGate(body) #also this states that this signal will take one parameter

func _on_area_2d_body_entered(body):
	playerEnteredGate.emit(body) #you get the body from above and send it to the signal as a parameter


func _on_area_2d_body_exited(body):
	playerExitedGate.emit(body)
