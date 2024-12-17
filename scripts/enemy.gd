extends CharacterBody2D

var direction = Vector2(0.0,1.0)
var speed = 400.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position + speed * direction * delta
