extends Node
#
var colors = [Color(0, 1, 1, 1), Color(1, 0.5, 0.31, 1), Color(0.86, 0.08, 0.24, 1),
			Color(1, 0.55, 0, 1), Color(1, 0.08, 0.58, 1), Color(0.49, 0.99, 0, 1), 
			Color(1, 0, 1, 1), Color(1, 0.87, 0.68, 1), Color(0.93, 0.51, 0.93, 1),
			Color(0.53, 0.81, 0.92, 1),Color(1, 0, 0, 1), Color(0.29, 0, 0.51, 1)]

var enemyColors = []
var preyColors = []
	
func color_giver():
#	randomizamos un resultado del array y lo eliminamos
	var groupNodes = get_tree().get_nodes_in_group("Players")
	
	randomize()
	var randomNum = randi()%colors.size()
	var color = colors[randomNum]
	enemyColors.append(color)
	preyColors.append(color)

	colors.remove(randomNum)
	
	return color

	
	
	
	
	
#func color_picker():
#	#randomizamos un resultado del array y lo eliminamos
#	randomize()
#	var randomNum = randi()%colors.size()
#	var color = colors[randomNum]
##	enemyColors.append(color)
###	preyColors.append(color)
##
##	colors.remove(randomNum)
#	return color
#
#func enemy_picker(selfColor):
#	#randomiza un resultado del array y elimina
#	randomize()
#	var randomNum = randi()%enemyColors.size()
#	var enemyColor = enemyColors[randomNum]
#	return enemyColor
#
#func prey_picker(selfColor, enemyColor):
#	#randomizamos un resultado del array y lo eliminamos
#	randomize()
#	var randomNum = randi()%preyColors.size()
#	var preyColor = preyColors[randomNum]
#	return preyColor
#
#func delete_eColor(col):
#	enemyColors.erase(col)
#
#func delete_pColor(col):
#	preyColors.erase(col)
