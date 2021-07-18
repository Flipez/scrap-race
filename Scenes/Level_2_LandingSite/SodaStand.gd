extends Node2D

signal sodaBought

func _ready():
  $OutOfStock.visible = StoryState.sodaStandClosed

func interact(_player):
  if !StoryState.sodaStandClosed:
    if StoryState.consoleState == StoryState.consoleStates.Complete:
      DialogController.createDialog([
        ["Soda Stand Kid", "Here, have a Yellow Turtle Energy Drink for that 3 coins!"]
       ])
      emit_signal("sodaBought")
      $OutOfStock.visible = true
      StoryState.sodaStandClosed = true
    else:
      DialogController.createDialog([
        ["Soda Stand Kid", "If you have at least 2 coins, I'll give you a really special drink!"]
       ])
