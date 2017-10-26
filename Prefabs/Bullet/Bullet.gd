extends KinematicBody2D

export var bulletSpeed = 200
export var bulletFireSFX = "Shoot1"

var velocity = Vector2()

func _ready():	
	set_fixed_process(true)	
	Global.player_sfx.player.play(self.bulletFireSFX)
	
	
func SetFireDirection(dir):
	velocity.x = bulletSpeed * dir
	velocity.y = 0
	
func _fixed_process(delta):
	move(velocity*delta)
	if get_global_pos().x>1204:
		queue_free()
		
	if is_colliding():
		queue_free()

	 