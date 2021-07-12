extends Node

var cooldown = Timer.new()
var dialog_pos = -1
var dialog = [
    ['???', 'Scrat...'],
    ['???', 'Scrat!'],
    ['???', 'SCRAT!!!'],
    # Clonk
    ['Scrat', 'Huh?'],
    ['???', 'WAKE UP!!!'],
    ['Scrat', "Why? It's like...oh...well...it's too early too stand up."],
    ['???', "We're circling around the planet for two days now and you still haven't even selected a landing spot."],
    ['???', "We're way behind schedule. You know that you'll loose your treasure hunter licence if you don't..."],
    ['Scrat', "Ok, ok mom. I got it. Wake me up tomorrow and we'll dig up some \"treasure\" on this junkyard for the boss."],
    ['M.O.M.', "I'm not your mom. I'm an artificial hyper intelligent advisor..but speaking of her. " ],
    ['M.O.M.', 'I could...'],
    ['Scrat', "Don't you dare..."],
    ['Scrat', "Ok, ok, I'll stand up..."]
]

func _ready():
    # $Player/Dialog.hide()
    cooldown.one_shot = true
    cooldown.connect("timeout", self, "_on_timer_timeout")
    add_child(cooldown)

func _input(event):
    print(cooldown.time_left)
    if cooldown.time_left > 0:
        return 

    if InputMap.event_is_action(event, 'ui_interact'):
        $Player/Dialog/Arrow.hide()
        dialog_pos += 1

        # Call Mom        
        if dialog_pos == 10:
            $Telephone.play()
            
        if dialog_pos == 12:
            $Telephone.stop()
        
        if dialog_pos >= dialog.size():
            $Player/Dialog.hide()
            get_tree().change_scene("res://scenes/LandingSite.tscn")
            return
        
        var msg = dialog[dialog_pos]       
        $Player/Dialog/Box/Speaker.text = msg[0]
        $Player/Dialog/Box/Message.text = msg[1]
        $Player/Dialog.show()
        cooldown.start(0.5)

func _on_timer_timeout():
    $Player/Dialog/Arrow.show()
