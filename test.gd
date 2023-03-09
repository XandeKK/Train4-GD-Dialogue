extends Node2D

var resource = load("res://Dialogues/test.dialogue")
@export var Balloon: PackedScene
@export var title: String = "start"
@export var dialogue_resource: DialogueResource

var previous_position_camera : Vector2

func _ready():
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	
	await get_tree().create_timer(0.4).timeout
	show_dialogue(title)

func show_dialogue(key: String) -> void:
	assert(dialogue_resource != null, "\"dialogue_resource\" property needs a to point to a DialogueResource.")

	var balloon: Node = Balloon.instantiate()
	add_child(balloon)
	balloon.start(dialogue_resource, key, $Icon.position + Vector2(1, -200))
	var tween = get_tree().create_tween()
	previous_position_camera = $Camera2D.position
	tween.parallel().tween_property($Camera2D, "position", $Icon.position, 1)
	tween.parallel().tween_property($CanvasLayer/ColorRect, "modulate", Color(1, 1, 1, 1), 1)
	tween.parallel().tween_property($CanvasLayer/ColorRect2, "modulate", Color(1, 1, 1, 1), 1)

func _on_dialogue_finished():
	var tween = get_tree().create_tween()
	tween.parallel().tween_property($Camera2D, "position", previous_position_camera, 1)
	tween.parallel().tween_property($CanvasLayer/ColorRect, "modulate", Color(1, 1, 1, 0), 1)
	tween.parallel().tween_property($CanvasLayer/ColorRect2, "modulate", Color(1, 1, 1, 0), 1)

func _on_button_pressed():
	dialogue_resource = preload("res://Dialogues/opa.dialogue")
	title = "this_is_a_node_title"
	show_dialogue(title)
