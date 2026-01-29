extends Area2D

func _ready():
	body_entered.connect(on_body)
	
func on_body(body):
	if body.has_method("take_damage"):
		body.take_damage()	
