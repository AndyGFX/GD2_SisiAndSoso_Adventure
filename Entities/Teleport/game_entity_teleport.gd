extends Area2D


export var target_name = "<undefiend>"
export var key_name = "<undefiend>"
export var on_key = "<undefiend>"
export var need_key = false
export var teleport_type = 0

var eventOwner = null

func _ready():

	pass
#------------------------------------------------
# teleport to target area when key_use is pressed on player
#------------------------------------------------
func Teleport(player):
	if need_key: set_process(true)
	if !need_key and get_node("/root/Inventory").HasItem(need_key,true): set_process(true)

	eventOwner = player
	pass

#------------------------------------------------
# reset prepared teleportation
#------------------------------------------------
func ResetTeleport():
	set_process(false)

func _process(delta):

	if Input.is_action_pressed(on_key):
		set_process(false)
		var target_node = self.find_node(target_name)
		var target_pos = target_node.get_node("SpawnPosition")
		var pos = target_pos.get_global_pos()
		eventOwner.set_pos(pos)
	pass

func find_node(node):
	return self.main_node.find_node(node)
	pass

func _get_main_node():
	var root = get_tree().get_root()
	return root.get_child( root.get_child_count()-1 )
	pass