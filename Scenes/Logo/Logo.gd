extends Node2D

func _on_Timer_timeout():
  if $Logo.visible:
    get_tree().change_scene("res://Scenes/Intro/Intro.tscn")
  else:
    $Logo.visible = true
    $Timer.start(2)
