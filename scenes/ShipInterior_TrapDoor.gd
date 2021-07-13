extends Node2D

func interact(_player):
    if StoryState.intro == StoryState.Intro.Start:
        DialogController.createDialog([['Scrat', "Locked"]])
        return 
        
    DialogController.createDialog([['Scrat', "Here we go!"]])
