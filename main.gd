extends Node

@export var mob_scene: PackedScene
var score

func _on_pressed():
	pass

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
	

	
