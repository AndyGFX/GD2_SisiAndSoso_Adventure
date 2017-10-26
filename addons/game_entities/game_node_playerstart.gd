#------------------------------------------------
# ITEM: PLAYER LEVEL START POSITION SIGN
#------------------------------------------------
tool

extends Area2D

var path = 'res://addons/game_entities/game_node_icon_playerstart.png'
var sprite = Sprite.new()
var spawn = Position2D.new();

#------------------------------------------------
# recreate selection gizmo to sprite size
#------------------------------------------------
func _get_item_rect():
    return sprite.get_item_rect()

#------------------------------------------------

func _ready():

	if get_tree().is_editor_hint():
		sprite.set_hidden(false)
	else:
		sprite.set_hidden(true)


#------------------------------------------------
# create node objects on enter to scene tree
#------------------------------------------------
func _enter_tree():
	
	add_child(sprite)
	
	var tex = load(path)
	if sprite:
		sprite.set_texture(tex)
		sprite.set_name("Player_start_point")


#------------------------------------------------
# Exit from zone
#------------------------------------------------
func Respawn(player):
	# additional code here
	player.set_global_pos(self.get_global_pos())
	pass


