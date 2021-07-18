extends PanelContainer

onready var juxBoxSprite = $HBoxContainer/PanelContainer/JuxBoxSprite
onready var fuelSprite = $HBoxContainer/PanelContainer/FuelSprite
onready var sodaSprite = $HBoxContainer/PanelContainer/SodaSprite
onready var coinSprite = $HBoxContainer/PanelContainer/CoinSprite
onready var consoleSprite = $HBoxContainer/PanelContainer/ConsoleSprite
onready var label = $HBoxContainer/Label
onready var timer = $Timer

func _on_Chest_chestOpened():
  timer.start(5)
  visible = true
  fuelSprite.visible = true
  label.text = "+10 Fuel"

func _on_Timer_timeout():
  visible = false
  juxBoxSprite.visible = false
  fuelSprite.visible = false
  sodaSprite.visible = false
  coinSprite.visible = false
  consoleSprite.visible = false

func _on_Rocket_foundJuxBox():
  timer.start(5)
  visible = true
  juxBoxSprite.visible = true
  label.text = "+1 JuxBox"


func _on_Merchant_tradeJuxBox():
  timer.start(5)
  visible = true
  juxBoxSprite.visible = true
  label.text = "-1 JuxBox"


func _on_Merchant_Stand_puzzleSolved():
  timer.start(5)
  visible = true
  coinSprite.visible = true
  label.text = "+3 Coins"


func _on_SodaStand_sodaBought():
  timer.start(5)
  visible = true
  coinSprite.visible = true
  label.text = "+1 Soda"
  StoryState.playerSpeedMultiplicator = 2


func _on_Console_consoleFound():
  timer.start(5)
  visible = true
  consoleSprite.visible = true
  label.text = "Switch"
