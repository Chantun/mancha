extends Node2D

var howManyBots = 5

#precarga escena de player y bot
var playerRes = preload("res://scenes/player.tscn")
var playerNode = playerRes.instance()
var botRes = preload("res://scenes/Bot.tscn")

var rng = RandomNumberGenerator.new()
var globalNode

func _ready():
	globalNode = get_node("/root/global")
	rng.randomize()
	#instancia player node
	add_child(playerNode)
	playerNode.add_to_group("Players")
	#instancia bots
	add_bot(howManyBots)
	
	globalNode.color_giver()

#funcion que agrega cada bot en un lugar random y le asigna las variables
func add_bot(i):
	while i > 0:
		var botNode = botRes.instance()
		add_child(botNode)
		botNode.add_to_group("Players")
		botNode.selfNmbr = i
		botNode.position.x = rng.randi_range(-1000, 1000)
		botNode.position.y = rng.randi_range(-1000, 1000)
		i-=1