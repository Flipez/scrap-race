extends Node2D

signal landing

var outro = [
    ['Scrat', "Good thing that I keep all those treasues, aye?"],
    ['M.O.M', "Good thing is that at least one thing in this pile of junk was actually somewhat usefull."],
    ['Scrat', "Ok, that was a lot of work. I'll go back to sleep then."],
    ['M.O.M', "Initiate landing sequence. Stop smoking and fasten your seat-belts. Entering the atmosphere in 3..."],
    ['Scrat', "Wait!"]
]

func _ready():
    self.connect('landing', self, 'landing')
    match StoryState.intro:
        StoryState.Intro.Start:
            DialogController.createDialog([['Tutorial', 'You can move with the Arrow Keys (or WASD) and interact with [F]']])
        StoryState.Intro.Found:
            DialogController.createDialog(outro, self, 'landing')

func landing():
    $Ship.landing = true
    $Ship/Player.freeze(1,2,3)
    yield(get_tree().create_timer(3), "timeout")
    get_tree().change_scene("res://Scenes/Level_2_LandingSite/LandingSite.tscn")
