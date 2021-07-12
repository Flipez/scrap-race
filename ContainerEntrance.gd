extends StaticBody2D

func interact(player):
  get_tree().change_scene("res://scenes/TestSceneLoad.tscn")
  get_tree().root.add_child(player)
