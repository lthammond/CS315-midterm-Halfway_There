extends KinematicBody2D

var velocity := Vector2()
var gravity := 100000
var run_speed := 150
var friction := 10


func _physics_process(_delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _process(_delta):
	velocity.x = clamp(velocity.x, -150, 150)

	if Input.is_action_pressed('move_right'):
		velocity.x += run_speed
		$Sprite.scale.x = 8
		if  velocity.y == 0.0:
			pass
			#$AnimatedSprite.play("walk 1")

	if Input.is_action_pressed('move_left'):
		velocity.x -= run_speed
		$Sprite.scale.x = -8
		if  velocity.y == 0.0:
			pass
			#$AnimatedSprite.play("walk 1")

	else:
		if velocity.x < 0.0:
			velocity.x += friction
		if velocity.x > 0.0:
			velocity.x -= friction
		if velocity == Vector2(0.0, 0.0):
			pass
			#$AnimatedSprite.animation = "idle 1"
