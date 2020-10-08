extends KinematicBody2D

var selfNmbr
var selfColor
var enemyColor
var preyColor

var speed = 5
var direction = Vector2()


func _ready():
	randomize()
#	#con el metodo de global elegimos el color y lo cambiamos
#	selfColor = get_node("/root/global").color_picker()
#	$Sprite.modulate = selfColor
#