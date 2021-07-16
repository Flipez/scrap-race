extends Node2D

onready var player = $Node2D/YSort/Player

func _process(delta):
  if player.position.y <= 370:
    var _return = get_tree().change_scene("res://scenes/LandingSite.tscn")
