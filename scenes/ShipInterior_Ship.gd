extends Node2D

func _process(delta):
    position.x -= 2

# TODO, placeholder
func interact(player):
    get_tree().change_scene("res://scenes/LandingSite.tscn")
