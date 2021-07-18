extends Node2D

signal finish_scene

func _ready():
    var _return = self.connect("finish_scene", self, "_switch_scene")

func interact(_player):
    if StoryState.intro == StoryState.Intro.Start:
        DialogController.createDialog([['Scrat', "Locked"]])
        return 
        
    DialogController.createDialog([['Scrat', "Here we go!"]], self, 'finish_scene')
    
func _switch_scene():    
    var _return = get_tree().change_scene("res://Scenes/Puzzle_1/Puzzle_1.tscn")
