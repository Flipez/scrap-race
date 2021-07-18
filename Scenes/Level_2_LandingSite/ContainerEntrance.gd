extends StaticBody2D

func interact(player):
  if StoryState.landingSite == StoryState.landingSiteStates.FoundBunker:
    var _return = get_tree().change_scene("res://Scenes/Puzzle_2/Dungeon.tscn")
  else:
    DialogController.createDialog([
      ["Scat", "Who would put a secret entrance in a container."],
      ["Scat", "I'd better ask the travelling merchant for some information"]
     ])
