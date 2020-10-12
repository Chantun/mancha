extends Node
#
var colors = [Color(0, 1, 1, 1), Color(1, 0.5, 0.31, 1), Color(0.86, 0.08, 0.24, 1),
			Color(1, 0.55, 0, 1), Color(1, 0.08, 0.58, 1), Color(0.49, 0.99, 0, 1), 
			Color(1, 0, 1, 1), Color(1, 0.87, 0.68, 1), Color(0.93, 0.51, 0.93, 1),
			Color(0.53, 0.81, 0.92, 1),Color(1, 0, 0, 1), Color(0.29, 0, 0.51, 1)]

var enemyColors = []
var preyColors = []
	
func color_giver():
	#tomamos un array de nodos del grupo players
	randomize()
	var groupNodes = get_tree().get_nodes_in_group("Players")
	#Loopeamos el array, asignandole un color random a cada nodo
	for n in range(groupNodes.size()):
		var node = groupNodes[n]
		var randomNum = randi()%colors.size()
		var color = colors[randomNum]
		
		node.selfColor = color
		#agregamos el color a listas de enemy y eliminamos de colors.
		enemyColors.append(color)
		colors.remove(randomNum)
		#llamamos a la funcion del nodo que setea el color en el sprite
		node.modulate_sprite()

func enemy_giver():
	#tomamos un array de nodos del grupo players
	randomize()
	var groupNodes = get_tree().get_nodes_in_group("Players")
	#Loopeamos el array enemies, asignandole uno random a cada nodo
	for n in range(enemyColors.size()):
		var node = groupNodes[n]
		var randomNum = randi()%enemyColors.size()
		var color = enemyColors[randomNum]
		#asegurarse que no se repitan los colores
		if color == node.selfColor:
			while color == node.selfColor:
				randomNum = randi()%enemyColors.size()
				color = enemyColors[randomNum]
		
		node.enemyColor = color
		#agregamos el color a listas de prey y eliminamos de enemies.
		preyColors.append(color)
		enemyColors.remove(randomNum)

func prey_giver():
	#tomamos un array de nodos del grupo players
	randomize()
	var groupNodes = get_tree().get_nodes_in_group("Players")
	#Loopeamos el array prey, asignandole uno random a cada nodo
	for n in range(preyColors.size()):
		var node = groupNodes[n]
		var randomNum = randi()%preyColors.size()
		var color = preyColors[randomNum]
		
		#asegurarse que no se repitan los colores
		if color == node.enemyColor or node.selfColor:
			while color == node.enemyColor:
				randomNum = randi()%preyColors.size()
				color = preyColors[randomNum]
			while color == node.selfColor:
				randomNum = randi()%preyColors.size()
				color = preyColors[randomNum]
		
		node.preyColor = color
		preyColors.remove(randomNum)
		print("color: ", node.selfColor, " enemy: ", node.enemyColor, " prey: ", node.preyColor)