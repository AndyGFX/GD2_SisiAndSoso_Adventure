#------------------------------------------------
# ITEM: MESSAGE INFO PANEL
# EVENT: EnterToMsgZone (onEnterArea)
# EVENT: ExitFromMsgZone (onExitArea)
#------------------------------------------------
tool

extends Area2D

var path = 'res://addons/game_entities/game_node_icon_msginfo.png'

var sprite = Sprite.new()
var shape = CollisionShape2D.new()

export var msg_text = "<undefined>" setget _set_msg_text
export var panel_offset = Vector2(0,0)

#------------------------------------------------
# recreate selection gizmo to sprite size
#------------------------------------------------
func _get_item_rect():
    return sprite.get_item_rect()

#------------------------------------------------
# set property
#------------------------------------------------
func _set_msg_text( value ):

	var tex = load(path)
	msg_text = value

	if sprite:
		sprite.set_texture(tex)
		sprite.set_name("Msg_info_panel")

func _ready():
	if get_tree().is_editor_hint():
		sprite.set_hidden(false)
	else:
		sprite.set_hidden(true)

#------------------------------------------------
# create node objects on enter to scene tree
#------------------------------------------------
func _enter_tree():
	add_child(shape)
	add_child(sprite)

	var sh = CircleShape2D.new()
	sh.set_radius(6)
	shape.set_shape(sh)
	set('msg_text', msg_text)

#------------------------------------------------
# Enter to zone
#------------------------------------------------
func EnterToMsgZone():
	# additional code here
	pass

#------------------------------------------------
# Exit from zone
#------------------------------------------------
func ExitFromMsgZone():
	# additional code here
	pass