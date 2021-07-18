extends Control

signal reveal_puzzle
signal lights_on
signal engine_on
signal next_try
signal done
signal leave_scene
signal puzzle_part2

var replacement_found = false
var part1 = [
    ['Scrat', "Wow...it's dark in here. M.O.M. turn on the light!"],
    ['M.O.M.', "I can't. I just told you the other day for the tenth time that you have to check the cables!"],
    ['Scrat', "Oh...Well then I guess I'll fix them now. Can you at least open the junction box?"],
    ['M.O.M.', "I think that can be arranged."],
]

var part2 = [
    ['Scrat', "Seem like one of the cables is unplugged. Easy fix"],
    ['M.O.M.', "STOP!!!"],
    ['Scrat', "Why?"],
    ['M.O.M.', "Because we unplugged that cable on purpose to get rid of the horrible music of that thing you found."],
    ['Scrat', "Oh...You're right. The JuxBox, or whatever that peddler called it. Horrible thing. But what else to do then?"],
    ['M.O.M.', "I guess the cable for the light is broken, so just use the spare one. Light should be the red one and blue the monster music."],
    ['Scrat', "Umm.....These are all green."],
    ['M.O.M.', "What? What kind of idiot would make alle cables green..."],
    ['Scrat', "Well, you know. This dude had this crazy good offer. 10 green cables for basically nothing."],
    ['M.O.M.', "Ok. Let's forget about this. The Light is the right-most cable in the bottom right corner of the box. So just trace the cables and find the One that is not plugged in."]
]

var part3 = [
    ['M.O.M.', "Ok, now search for something usefull!"],
    ['Scrat', "Let's see..."],
]

var puzzle_unlocked = false
var attempts = 0

func _ready():
    $Darkness.show()
    $Light.hide()
    self.connect("reveal_puzzle", self, "reveal")
    self.connect("lights_on", self, "lights_on")
    self.connect("engine_on", self, "engine_on")
    self.connect("next_try", self, "next_try")
    self.connect("done", self, "puzzle_completed")
    self.connect("leave_scene", self, "switch_back")
    self.connect("puzzle_part2", self, "puzzle_part2")
    DialogController.createDialog(part1, self, 'reveal_puzzle')
    
func reveal():
    $Darkness.hide()
    yield(get_tree().create_timer(2.5), "timeout")
    DialogController.createDialog(part2, self, 'next_try')

func next_try():
    $Keys.show()
    puzzle_unlocked = true
    attempts += 1

func _process(_event):
    if not puzzle_unlocked:
        return
        
    if Input.is_action_just_pressed("ui_up") and not replacement_found: # W
        puzzle_unlocked = false
        DialogController.createDialog([["M.O.M.", "Good, that's the one we can use. Now replace the light cable. Remember. The bottom right most plug."]], self, 'puzzle_part2')
    if Input.is_action_just_pressed("ui_left"): # A
        puzzle_unlocked = false
        if replacement_found:
            match attempts:
                1: DialogController.createDialog([["M.O.M.", "Wow. You made it on the first try. Maybe you're a genius after all."]], self, 'done')
                2: DialogController.createDialog([["M.O.M.", "Well. Second try worked out. Fair enough."]], self, 'done')
                3: DialogController.createDialog([["M.O.M.", "All good things come in threes I guess."]], self, 'done')
                _: DialogController.createDialog([["M.O.M.", "You should really pay more attention to these tasks."]], self, 'done')
        else:
            DialogController.createDialog([["M.O.M.", "You have to unplug the replacement cable first. The one that is already loose on one end!"]], self, 'next_try')
    if Input.is_action_just_pressed("ui_right"): # D
        puzzle_unlocked = false
        $Darkness.show()
        DialogController.createDialog([["M.O.M.", "Not that one!!! That was the Light of the junction Box! Put it back in!"]], self, 'lights_on')
        
    if Input.is_action_just_pressed("ui_down"): # S
        puzzle_unlocked = false
        $Engine.stream_paused = true
        DialogController.createDialog([['M.O.M.', 'Oh my god. I think you just powered off the engine! Put it back in!']], self, 'engine_on')
        
func lights_on():
    $Darkness.hide()
    next_try()
    
func engine_on():
    $Engine.stream_paused = false
    next_try()

func puzzle_completed():
    $Light.show()
    DialogController.createDialog(part3, self, 'leave_scene')
    
func switch_back():
    StoryState.intro = StoryState.Intro.Found
    get_tree().change_scene("res://Scenes/Level_1_Ship/ShipInterior.tscn")

func puzzle_part2():
    replacement_found = true
    puzzle_unlocked = true
