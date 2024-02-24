extends Node

@export var mob_scene: PackedScene
#@export var enemy_scenes: Array[PackedScene] = []
@onready var enemy_container = $Enemy
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	$Bar/HealthBar.value = $Player.health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		#bullet.position = $Player.position
		
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
#func _on_enemy_spawn_timer_timeout():
	#var e = ememy_scenes.pick_random().instantiate()
