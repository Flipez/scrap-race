extends Node2D

func _process(delta):
  position.x += 100 * delta
  position.y -= 100 * delta
