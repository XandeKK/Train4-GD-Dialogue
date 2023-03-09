extends Sprite2D

var timer := 0.0
var max_timer := 1.0
var position_initial : Vector2
var position_end : Vector2

func _ready():
	position_initial = position
	position_end = Vector2(500, 500)

func _process(delta):
	var P = position_initial
	var Q = position_end
	var R = Vector2()
	
	position = P + timer * (Q - P)
	
	timer += delta * 0.5
	timer = 0 if timer >= 1 else timer
