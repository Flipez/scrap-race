extends StaticBody2D

onready var animatedSprite = $AnimatedSprite
onready var audioPlayer = $AudioStreamPlayer

func interact(_player):
  if StoryState.landingSite == StoryState.landingSiteStates.SellScrap:
    StoryState.landingSite = StoryState.landingSiteStates.AskBunker
    DialogController.createDialog([
      ["Merchant", "You have some nice scrap there, here have some money"]
     ])
  else:
    animatedSprite.play("deny")
    audioPlayer.play()

func _on_AnimatedSprite_animation_finished():
  animatedSprite.play("default")
