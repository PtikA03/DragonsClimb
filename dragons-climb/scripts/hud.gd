extends CanvasLayer

func _process(_delta):
	$LivesLabel.text = "Lives: %d" % Game.lives
	$BossLabel.text = "Boss HP: %d" % Game.boss_health
