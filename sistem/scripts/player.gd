extends KinematicBody2D

var selfNmbr
var selfColor
var enemyColor
var preyColor

var speed = 5
var direction = Vector2()
var screensize

var globalNode


func _ready():
	globalNode = get_node("/root/global")
#	#con el metodo de global elegimos el color y lo cambiamos
#	selfColor = globalNode.color_picker()
#	$Sprite.modulate = selfColor 
	
	

func _physics_process(delta):
	#movimiento
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	if Input.is_action_pressed("ui_right"):
		position.x += speed
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
	
	if direction.length() > 0:
		direction = direction.normalized() * speed
		
	move_and_collide(direction)
	
