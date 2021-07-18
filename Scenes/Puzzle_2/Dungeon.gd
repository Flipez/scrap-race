extends Node2D

onready var player = $Node2D/YSort/Player

func _process(_delta):
  if player.position.y <= 370:
    var _return = get_tree().change_scene("res://Scenes/Level_2_LandingSite/LandingSite.tscn")
