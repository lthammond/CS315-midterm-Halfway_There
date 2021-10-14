extends Node

# Controls whether or not dialogue should be triggered.
var wakeUpTextRead := false
var hallwayTextRead := false

# Keeps the player from switching back into underwear when reentering Bedroom.
var underwear_deactivated := false

# Keeps the player from activating an interactable more than once.
var calendarPreviouslyTriggered := false
var update_started := false

# Makes sure prerequisites were completed before starting an interaction.
var tradingCardsRecieved := false

# Tells HUD how many tasks have been completed.
var tasks_completed := 0
