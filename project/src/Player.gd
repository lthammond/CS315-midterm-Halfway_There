extends KinematicBody2D

var velocity := Vector2()
var gravity := 100000
var run_speed := 150
var friction := 10
var walk := ""
var idle := ""
var active := true

func _ready():
	var room := get_tree().get_current_scene().get_name()
	if room == "Bedroom" and !GlobalVariables.underwear_deactivated:
		walk = "Underwear_walk"
		idle = "Underwear_idle"
		GlobalVariables.underwear_deactivated = true
	elif room == "WorkoutRoom":
		walk = "Workout_walk"
		idle = "Workout_idle"
	elif room == "FrontYard":
		walk = "CasualShoes_walk"
		idle = "CasualShoes_idle"
	else:
		walk = "Casual_walk"
		idle = "Casual_idle"


func _physics_process(_delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _process(_delta):
	velocity.x = clamp(velocity.x, -150, 150)

	if Input.is_action_pressed('move_right') and !Input.is_action_pressed('move_left'):
		if active:
			velocity.x += run_speed
			$AnimatedSprite.scale.x = 8
			if  velocity.y == 0.0:
				$AnimatedSprite.play(walk)

	if Input.is_action_pressed('move_left') and !Input.is_action_pressed('move_right'):
		if active:
			velocity.x -= run_speed
			$AnimatedSprite.scale.x = -8
			if  velocity.y == 0.0:
				pass
				$AnimatedSprite.play(walk)

	else:
		if velocity.x < 0.0:
			velocity.x += friction
		if velocity.x > 0.0:
			velocity.x -= friction
		if velocity == Vector2(0.0, 0.0):
			$AnimatedSprite.animation = idle
