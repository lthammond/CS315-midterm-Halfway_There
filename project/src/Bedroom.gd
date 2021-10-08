extends Node2D

func _ready():
	if !GlobalDialogVariables.wakeUpTextRead:
		$HUD/Dialog/WakeUpTextLabel.show()
		yield(get_tree().create_timer(5), "timeout")
		$HUD/Dialog/WakeUpTextLabel.hide()
		GlobalDialogVariables.wakeUpTextRead = true

	if PlayerPositionThroughDoor.door_name:
		var door_node = find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position


func _on_Calendar_start_interaction():
	$Calendar/Interaction/AnimationPlayer.play("Fade_Dark")
	yield(get_tree().create_timer(8), "timeout")
	$Calendar/Interaction/AnimationPlayer.play("Zoom_on_tasks")
	yield(get_tree().create_timer(4.5), "timeout")
	$Calendar/Interaction/AnimationPlayer.play("Fade_light")
