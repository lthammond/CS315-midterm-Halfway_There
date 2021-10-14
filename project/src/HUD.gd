extends CanvasLayer

func _process(_delta):
	if GlobalVariables.calendarPreviouslyTriggered:
		$TaskCounterLabel.text = "Tasks:%d/10" % GlobalVariables.tasks_completed
		$TaskCounterLabel.show()
