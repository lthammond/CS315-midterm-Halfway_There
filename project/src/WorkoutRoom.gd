extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position


func _on_FloorMat_start_interaction():
	if GlobalVariables.update_started and \
			!GlobalVariables.workout_previously_triggered:
		$HUD/InteractionTriggeredSound.play()
		$Player.active = false
		$FloorMat/Interaction/AnimationPlayer.play("Fade_Dark")
		yield(get_tree().create_timer(5), "timeout")

		for i in range(6):
			$FloorMat/Interaction/PushupSprite.texture = load("res://assets/" + 
					"sprites/pushup2.png")
			$PushupSounds.stream = load("res://assets/sounds/pushupDown.wav")
			$PushupSounds.play()
			yield(get_tree().create_timer((i + 1) * 0.5), "timeout")

			if i == 5:
				$FloorMat/Interaction/PushupSprite.texture = load("res://" + 
						"assets/sprites/pushup3.png")
				$PushupSounds.stream = load("res://assets/sounds/" + 
						"pushUpFall.wav")
				$PushupSounds.play()

			else:
				$FloorMat/Interaction/PushupSprite.texture = load("res://" + 
						"assets/sprites/pushup1.png")
				$PushupSounds.stream = load("res://assets/sounds/pushupUp.wav")
				$PushupSounds.play()
				$FloorMat/Interaction/PushupCounter \
						.bbcode_text = "%d!" % (i + 1)
				$FloorMat/Interaction/PushupCounter.show()
				yield(get_tree().create_timer(1.5), "timeout")
				$FloorMat/Interaction/PushupCounter.hide()

		yield(get_tree().create_timer(3), "timeout")
		$FloorMat/Interaction/AnimationPlayer.play("Fade_light")
		GlobalVariables.workout_previously_triggered = true
		GlobalVariables.tasks_completed += 1
		$HUD/TaskCompletedSound.play()
		$Player.active = true
