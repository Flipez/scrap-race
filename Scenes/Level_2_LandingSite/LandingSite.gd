extends Node2D

signal ready_for_takeoff

var start_dialog = [
    ["Scrat", "What was that! I'm the captain... and I decide when and where and if we land!"],
    ["M.O.M.", "And our fuel was running dangerously low. We had barely enough to land here. Otherwise we would have crashed."],
    ["Scrat", "Oh. Well, time for bed then! Wait.... why is the door locked?"],
    ["M.O.M.", "Unfortunetly I do not have enough energy left to open it. So why don't you look around for some fuel."],
]

var outro_dialog = [
    ["M.O.M.", "Did you find anything in there?"],
    ["Scrat", "Of course. Did I ever disappoint you?"],
    ["M.O.M.", "Well..."],
    ["Scrat", "Never. So start the engine. We're leaving so I can finally go back to sleep."],
    ["M.O.M.", "But... we didn't find anything valuable for the boss? You barely got enough fuel to get home!"],
    ["Scrat", "That's.... (yawn) ... good enough .... for .... me ... zZ zZzZ"],
    ["M.O.M.", "Unbelievable, but not unexpected... Ready for take off in 3 ..."],
]

func _ready():
  var _return = self.connect('ready_for_takeoff', self, 'ready_for_takeoff')
  if StoryState.landingSite == StoryState.landingSiteStates.Start:
    DialogController.createDialog(start_dialog)
    
  if StoryState.dungeonState == StoryState.dungeonStates.ChestOpened:
    $Node2D/YSort/Player.invisible()
    DialogController.createDialog(outro_dialog, self, 'ready_for_takeoff')
    
func ready_for_takeoff():
    $AudioStreamPlayer.stop()
    $Node2D/YSort/Rocket/Engine.play()
    $Node2D/YSort/Rocket/Phase_1_Fire.show()
    $Node2D/YSort/Player.freeze(1,2,3)
    yield(get_tree().create_timer(3), "timeout")
    $Node2D/YSort/Rocket/Phase_2_Fire.show()
    $Node2D/YSort/Rocket/Phase_1_Fire.hide()
    $Node2D/YSort/Rocket.take_off()
    yield(get_tree().create_timer(2), "timeout")
    var _return = get_tree().change_scene("res://Scenes/Outro/Outro.tscn")

