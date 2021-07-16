extends Node2D

func interact(_player):
  if StoryState.dungeonState == StoryState.dungeonStates.SignRead:
    $AudioStreamPlayerDeny.play()
