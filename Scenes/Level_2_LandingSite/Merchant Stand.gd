extends StaticBody2D

onready var animatedSprite = $AnimatedSprite
onready var audioPlayer = $AudioStreamPlayer

signal puzzleSolved

func interact(_player):
  if StoryState.consoleState == StoryState.consoleStates.Complete:
    animatedSprite.play("deny")
    audioPlayer.play()
  elif StoryState.consoleState == StoryState.consoleStates.Missing:
    DialogController.createDialog([
      ["Sad Merchant", "I somewhere lost my really old game console. If you can find it I'll give you some coins as a reward."]
     ])
  elif StoryState.consoleState == StoryState.consoleStates.Found:
    DialogController.createDialog([
      ["Happy Merchant", "Oh nice, finally I can play this farming game again!"]
     ])
    StoryState.consoleState = StoryState.consoleStates.Complete
    emit_signal("puzzleSolved")

func _on_AnimatedSprite_animation_finished():
    animatedSprite.play("default")
