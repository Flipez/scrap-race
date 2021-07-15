extends Node2D

var landing = false

func _process(_delta):
    if landing:
        position.x -= 30
        position.y += 10
    else:
        position.x -= 5
