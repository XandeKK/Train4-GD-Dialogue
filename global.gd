extends Node

var bebida: String

var properties_player = {
	'name': 'Alexandre',
	'age': 19
}

func wait_for_me():
	await get_tree().create_timer(5).timeout
	return "Opa"
