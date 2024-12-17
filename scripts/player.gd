extends CharacterBody2D

const SPEED = 300.0
@onready var projectile_spawn: Marker2D = $ProjectileSpawn

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_forward", "move_backward")
	
	# left and right movement
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# forward and backward movement
	if direction_y:
		velocity.y = direction_y * SPEED
	else: 
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var direction = Vector2(0.0,-1.0).normalized()
	var p = load("res://scenes/projectile.tscn").instantiate()
	var marker = projectile_spawn
	p.position = marker.global_position
	p.rotation = marker.global_rotation

	p.direction = direction
	get_parent().add_child(p)
