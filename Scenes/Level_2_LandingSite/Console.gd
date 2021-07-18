extends Node2D

signal consoleFound

func _ready():
  if StoryState.consoleState != StoryState.consoleStates.Missing:
    queue_free()
    
func interact(_player):
  StoryState.consoleState = StoryState.consoleStates.Found
  queue_free()
  DialogController.createDialog([
    ["Scrat", "That's one weird thing. Seems like you have to hold it by yourself - who does that?!"],
    ["Scrat", "Anyways, I should bring it to the merchant, he looked really sad"]
   ])
  emit_signal("consoleFound")
