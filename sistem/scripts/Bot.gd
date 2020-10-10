extends KinematicBody2D

var selfNmbr
var selfColor
var enemyColor
var preyColor

var speed = 5
var direction = Vector2()


func _ready():
	randomize()

func modulate_sprite():
	$Sprite.modulate = Color(selfColor)