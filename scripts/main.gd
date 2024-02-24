extends Node

@export var mob_scene: PackedScene
#@export var enemy_scenes: Array[PackedScene] = []
@onready var enemy_container = $Enemy
var score
const UP_DIRECTION = Vector2(0, -1)
const bulletPath = preload("res://scenes/ bullet.tscn")

func _on_2ndbutton_pressed():
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	$Bar/HealthBar.value = $Player.health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		shoot()
		#bullet.position = $Player.position
		
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)

	# Set bullet position to the player's position
	bullet.position = $Player.position
	bullet.direction = bullet.direction.normalized()
#func _on_enemy_spawn_timer_timeout():
	#var e = ememy_scenes.pick_random().instantiate()

func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $Path2D/PathFollow2D
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
