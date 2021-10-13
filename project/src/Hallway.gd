extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node = find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
			
	if !GlobalDialogVariables.hallwayTextRead:
		$HUD/Dialog/HallwayTextLabel.show()
		GlobalDialogVariables.hallwayTextRead = true


func _on_CardCollection_start_interaction():
	$CardCollection/Interaction/AnimationPlayer.play("Fade_Dark")
	yield(get_tree().create_timer(5), "timeout")
	$CardCollection/Interaction/AnimationPlayer.play("Raise_binder")
	yield(get_tree().create_timer(7), "timeout")
	$CardCollection/Interaction/AnimationPlayer.play("Fade_light")
	yield(get_tree().create_timer(6), "timeout")
	$HUD/Dialog/InteractionDialoge3.hide()
