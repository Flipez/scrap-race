extends StaticBody2D

onready var animatedSprite = $AnimatedSprite
onready var audioPlayer = $AudioStreamPlayer

func interact(_player):
  animatedSprite.play("deny")
  audioPlayer.play()

func _on_AnimatedSprite_animation_finished():
  animatedSprite.play("default")
