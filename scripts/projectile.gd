extends Area2D

var direction = Vector2(1.0,0.0)
var speed = 400.0
@onready var score: Label = null

func _ready():
	score = get_node("/root/Game/UserInterface/Score")

func _process(delta):
	position = position + speed * direction * delta

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.queue_free()
	if score:
		score.increaseScore()
