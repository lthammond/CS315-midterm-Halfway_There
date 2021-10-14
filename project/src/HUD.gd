extends CanvasLayer

func _process(_delta):
	if GlobalVariables.calendar_previously_triggered:
		$TaskCounterLabel.text = "Tasks:%d/10" % GlobalVariables.tasks_completed
		$TaskCounterLabel.show()
