extends Marker2D

# Variables to control spawning
var spawn_timer = 0.0  # Tracks elapsed time
var spawn_interval = 0.0  # Random interval duration

func _ready() -> void:
	# Initialize with a random spawn interval
	spawn_interval = randf_range(1.0, 3.0)  # Random interval between 1 to 3 seconds

func _process(delta: float) -> void:
	# Update the spawn timer
	spawn_timer += delta
	
	# Check if it's time to spawn an enemy
	if spawn_timer >= spawn_interval:
		spawnEnemy()
		spawn_timer = 0.0  # Reset timer
		spawn_interval = randf_range(1.0, 3.0)  # Set a new random interval

func spawnEnemy():
	# Load and instantiate the enemy scene
	var p = load("res://scenes/enemy.tscn").instantiate()
	
	# Randomize the X position based on the Marker2D's position
	var random_x_offset = randf_range(-100.0, 100.0)  # Adjust range as needed
	p.position = Vector2(self.global_position.x + random_x_offset, self.global_position.y)
	
	# Set the enemy's rotation to match the Marker2D
	p.rotation = self.global_rotation
	
	# Add the enemy to the parent node
	get_parent().add_child(p)
