extends PanelContainer

onready var juxBoxSprite = $HBoxContainer/PanelContainer/JuxBoxSprite
onready var fuelSprite = $HBoxContainer/PanelContainer/FuelSprite
onready var label = $HBoxContainer/Label
onready var timer = $Timer

func _on_Chest_chestOpened():
  timer.start(5)
  visible = true
  juxBoxSprite.visible = false
  fuelSprite.visible = true
  label.text = "+10 Fuel"

func _on_Timer_timeout():
  visible = false

func _on_Rocket_foundJuxBox():
  timer.start(5)
  visible = true
  juxBoxSprite.visible = true
  fuelSprite.visible = false
  label.text = "+1 JuxBox"


func _on_Merchant_tradeJuxBox():
  timer.start(5)
  visible = true
  juxBoxSprite.visible = true
  fuelSprite.visible = false
  label.text = "-1 JuxBox"
