extends Node2D

var cooldown = Timer.new()
var dialog_pos = -1
var start_dialog = [
    ['Scrat', 'Maybe I should ask the merchant where the entry for the secret bunker is.']
]
# Called when the node enters the scene tree for the first time.
func _ready():
    cooldown.one_shot = true
    cooldown.connect("timeout", self, "_on_timer_timeout")
    add_child(cooldown)


func _input(event):
    if cooldown.time_left > 0:
        return 

    if InputMap.event_is_action(event, 'ui_interact'):
        $Node2D/YSort/Player/Dialog/Arrow.hide()
        dialog_pos += 1
        
        if dialog_pos >= start_dialog.size():
            $Node2D/YSort/Player/Dialog.hide()
            return
        
        var msg = start_dialog[dialog_pos]       
        $Node2D/YSort/Player/Dialog/Box/Speaker.text = msg[0]
        $Node2D/YSort/Player/Dialog/Box/Message.text = msg[1]
        $Node2D/YSort/Player/Dialog.show()
        cooldown.start(0.5)

func _on_timer_timeout():
    $Node2D/YSort/Player/Dialog/Arrow.show()
