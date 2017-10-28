# script: explosion

extends Sprite

func _ready():
	randomize()
	
	Utils.remote_call("Camera", "Shake", 8, 0.2)
	Global.player_sfx.player.play("Explosion2")
	
	
	get_node("anim").play("Explode")
	yield(get_node("anim"), "finished")
	queue_free()
	pass
