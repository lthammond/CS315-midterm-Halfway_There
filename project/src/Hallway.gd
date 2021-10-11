extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node = find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
			
	if !GlobalDialogVariables.hallwayTextRead:
		$HUD/Dialog/HallwayTextLabel.show()
		yield(get_tree().create_timer(5), "timeout")
		$HUD/Dialog/HallwayTextLabel.hide()
