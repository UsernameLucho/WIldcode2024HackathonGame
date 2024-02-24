extends Area2D

signal hit

@export var speed = 400 #fast player

@export var health = 100
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		velocity.x += speed
	if Input.is_action_pressed("Left"):
		velocity.x -= speed
	if Input.is_action_pressed("Up"):
		velocity.y -= speed
	if Input.is_action_pressed("Down"):
		velocity.y += speed
	if Input.is_action_pressed("Shoot"):
		$AnimatedSprite2D.play("new_animation_1")
	else:
		$AnimatedSprite2D.play("new_animation")
		
	
	
	$AnimatedSprite2D.play()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if health <= 0: hide()

func _on_body_entered(body):
	health -= 10
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
