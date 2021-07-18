extends Sprite

func interact(_player):
  if StoryState.dungeonState == StoryState.dungeonStates.PuzzleSolved:
    frame = 222
    $AudioStreamPlayerTreasure.play()
    StoryState.dungeonState = StoryState.dungeonStates.ChestOpened
  elif StoryState.dungeonState == StoryState.dungeonStates.ChestOpened:
    DialogController.createDialog([
      ["Scrat", "I think there's nothing more in it. I'd better go back to the ship and take another nap"]
     ])
  else:
    DialogController.createDialog([
      ["Scrat", "Strange, it looks quite intact but I am unable to open it"],
      ["Scrat", "I saw a sign at the entrance, maybe that's useful"]
     ])
