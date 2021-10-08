extends Node2D

func _ready():
	if !GlobalDialogVariables.wakeUpTextRead:
		$Dialog/WakeUpTextLabel.show()
		GlobalDialogVariables.wakeUpTextRead = true
	if PlayerPositionThroughDoor.door_name:
		var door_node = find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
