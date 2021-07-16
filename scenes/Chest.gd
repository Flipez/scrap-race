extends Sprite

func interact(_player):
  if StoryState.dungeonState == StoryState.dungeonStates.PuzzleSolved:
    frame = 222
    $AudioStreamPlayerTreasure.play()
    StoryState.dungeonState = StoryState.dungeonStates.ChestOpened
  else:
    DialogController.createDialog([
      ["Scat", "Strange, it looks quite intact but I am unable to open it"],
      ["Scat", "I saw a sign at the entrance, maybe that's useful"]
     ])
