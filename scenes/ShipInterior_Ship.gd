extends Node2D

func _process(_delta):
    position.x -= 2

# TODO, placeholder
func interact(_player):
    get_tree().change_scene("res://scenes/LandingSite.tscn")
