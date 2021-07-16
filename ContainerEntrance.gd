extends StaticBody2D

func interact(player):
  if StoryState.landingSite == StoryState.landingSiteStates.FoundBunker:
    var _return = get_tree().change_scene("res://scenes/Dungeon.tscn")
    get_tree().root.add_child(player)
  else:
    DialogController.createDialog([
      ["Scat", "Who would put a secret entrance in a container."],
      ["Scat", "I'd better ask the merchant for some information"]
     ])
