extends CharacterBody2D

@export var player_speed = 120
@export var sprint_speed = player_speed * 1.75
@onready var animations = $AnimationPlayer

func handleInput():
	var direction = Vector2.ZERO
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("Right"):
		direction.x += 1.0
	if Input.is_action_pressed("Left"):
		direction.x -= 1.0
	if Input.is_action_pressed("Down"):
		direction.y += 1.0
	if Input.is_action_pressed("Up"):
		direction.y -= 1.0
	
	var speed 
	if Input.is_action_pressed("Sprint"):
		speed = sprint_speed
	else:
		speed = player_speed

	direction = direction.normalized()
	
	velocity = direction * speed
	
func updateAnimations():
	if velocity.length() == 0:
		animations.stop()
	else:
		var dir = "down"
		if velocity.x < 0: dir = "left"
		elif velocity.x > 0: dir = "right"
		elif velocity.y < 0: dir = "up"
		
		animations.play(dir + "_walk")

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimations()
		
	



