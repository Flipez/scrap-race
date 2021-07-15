extends KinematicBody2D

var velocity = Vector2.ZERO

export var FRICTION = 500
export var ACCELERATION = 500
export var MAX_SPEED = 10
export var DIRECTION = Vector2.LEFT

#func _physics_process(delta):
#  velocity = velocity.move_toward(DIRECTION * MAX_SPEED, ACCELERATION * delta)
#  move_and_slide(velocity)

func interact(_player):
  if StoryState.landingSite == StoryState.landingSiteStates.Start:
    StoryState.landingSite = StoryState.landingSiteStates.FindScrap
    DialogController.createDialog([
      ["Scrat", "Hello, can you tell me where I can find the secret entrance to the bunker?"],
      ["Merchant", "Why should I know where the secret entrance is?"],
      ["Scrat", "I assumed you as a merchant do know a lot stuff"],
      ["Merchant", "Thats true, but my informations are not for free"],
      ["Merchant", "Bring me some money and maybe I'll tell you."],
      ["Merchant", "Sell some scrap from your ship if you haven't any"]
     ])
  elif StoryState.landingSite == StoryState.landingSiteStates.AskBunker:
    StoryState.landingSite = StoryState.landingSiteStates.FoundBunker
    DialogController.createDialog([
      ["Merchant", "Ok, you got the money."],
      ["Merchant", "The secret entry to the bunker is in the container behind me"],
      ["Merchant", "I am wondering how some can not guess this. Totally waste of money."],
     ])
  else:
    DialogController.createDialog([
      ["Merchant", "You better got me some money if you want answers!"],
     ])
  

func _on_Timer_timeout():
  if DIRECTION == Vector2.LEFT:
    DIRECTION = Vector2.RIGHT
    $AnimatedSprite.flip_h = false
  else:
    DIRECTION = Vector2.LEFT
    $AnimatedSprite.flip_h = true
