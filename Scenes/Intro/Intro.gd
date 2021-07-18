extends Node

var cooldown = Timer.new()
var story_pos = -2
var dialog = [
    ['???', 'Scrat...'],
    ['???', 'Scrat!'],
    ['???', 'SCRAT!!!'],
    ['Scrat', 'Huh?'],
    ['???', 'WAKE UP!!!'],
    ['Scrat', "Why? It's like...oh...well...it's too early to stand up."],
    ['???', "We're circling around the planet for two days now and you still haven't even selected a landing spot."],
    ['???', "We're way behind schedule. You know that you'll loose your treasure hunter licence if you don't..."],
    ['Scrat', "Ok, ok mom. I got it. Wake me up tomorrow and we'll dig up some \"treasure\" on this junkyard for the boss."],
    ['M.O.M.', "I'm not your mom. I'm an artificial hyper intelligent advisor..but speaking of her. " ],
    ['M.O.M.', 'I could...'],
    ['Scrat', "Don't you dare..."],
    ['Scrat', "Ok, ok, I'll stand up..."]
]

func _ready():
    $Player/Dialog.hide()
    cooldown.one_shot = true
    add_child(cooldown)
    
func _process(delta):
    if story_pos >= 0:
        return
        
    if story_pos == -1:
        $Player/Camera2D.position.y += (delta * 20)
        $Player/HUD.modulate.a8 -= 2
    if $Player/Camera2D.position.y > 170:
        $Player/HUD.hide()
        story_pos += 1
        show_dialog(dialog[story_pos])
        
func show_dialog(msg):
    $Player/Dialog/Box/Speaker.text = msg[0]
    $Player/Dialog/Box/Message.text = msg[1]
    $Player/Dialog.show()
    cooldown.start(0.5)    
    
func _input(event):
    if cooldown.time_left > 0:
        return 
    
    # Don't accept input during the animation
    if story_pos == -1:
        return

    if InputMap.event_is_action(event, 'ui_interact'):
        story_pos += 1
        
        # Call Mom        
        if story_pos == 10:
            $Telephone.play()
            
        if story_pos == 12:
            $Telephone.stop()
        
        if story_pos >= dialog.size():
            $Player/Dialog.hide()
            get_tree().change_scene("res://Scenes/Level_1_Ship/ShipInterior.tscn")
            return
            
        if story_pos < 0:
            return
            
        show_dialog(dialog[story_pos])
