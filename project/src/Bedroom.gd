extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position

	yield(get_tree().create_timer(1), "timeout")
	if !GlobalVariables.wakeUpTextRead:
		$Player.active = false
		$HUD/Dialog/WakeUpTextLabel.show()
		yield(get_tree().create_timer(5), "timeout")
		$HUD/Dialog/WakeUpTextLabel.hide()
		GlobalVariables.wakeUpTextRead = true
		$Player.active = true


func _on_Calendar_start_interaction():
	if !GlobalVariables.calendar_previously_triggered:
		$HUD/InteractionTriggeredSound.play()
		$Player.active = false
		$Calendar/Interaction/AnimationPlayer.play("Fade_dark")
		yield(get_tree().create_timer(8), "timeout")
		$Calendar/Interaction/AnimationPlayer.play("Zoom_on_tasks")
		yield(get_tree().create_timer(4.5), "timeout")
		$Calendar/Interaction/AnimationPlayer.play("Fade_light")
		yield(get_tree().create_timer(2), "timeout")
		GlobalVariables.tasks_completed += 1
		$HUD/TaskCompletedSound.play()
		GlobalVariables.calendar_previously_triggered = true
		$Player.active = true
