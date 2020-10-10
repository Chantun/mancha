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
		#agregamos el color a listas de enemy, prey y eliminamos de colors.
		enemyColors.append(color)
		preyColors.append(color)
		colors.remove(randomNum)
		#llamamos a la funcion del nodo que setea el color en el sprite
		node.modulate_sprite()
