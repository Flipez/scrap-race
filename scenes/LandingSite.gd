extends Node2D

var cooldown = Timer.new()
var dialog_pos = -1

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
        
        if dialog_pos >= 1:
            $Node2D/YSort/Player/Dialog.hide()
            return

        cooldown.start(0.5)

func _on_timer_timeout():
    $Node2D/YSort/Player/Dialog/Arrow.show()


func _on_DialogStartTimer_timeout():
  DialogController.createDialog([["Scrat", "Maybe I should ask the merchant where the entry for the secret bunker is, they always know this stuff"]])
  #$Node2D/YSort/Player/Dialog/Box/Speaker.text = "Scrat"
  #$Node2D/YSort/Player/Dialog/Box/Message.text = 
  #$Node2D/YSort/Player/Dialog.show()
  #cooldown.start(0.5)
