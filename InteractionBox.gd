extends Area2D

export var damage = 1
export(String) var text = null

func interact(player):
  get_parent().interact(player)
