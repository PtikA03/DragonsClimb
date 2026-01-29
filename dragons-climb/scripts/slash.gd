extends Area2D
var direction := 1

func _ready():
	position.x += 30 * direction
	$Timer.timeout.connect(queue_free)
	$Timer.start()
