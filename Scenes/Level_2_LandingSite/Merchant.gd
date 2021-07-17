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
  match StoryState.landingSite: 
    StoryState.landingSiteStates.Start:
        StoryState.landingSite = StoryState.landingSiteStates.FindScrap
        DialogController.createDialog([
        ["Scrat", "Hello, do you sell some fuel?"],
        ["Merchant", "Hello Stranger, unfortunately not. But I do have some nice sock puppets."],
        ["Scrat", "No thanks. If you do not sell fuel, maybe you know where I can find some?"],
        ["Merchant", "Thats true, but my informations are not for free"],
        ["Merchant", "Bring me something valuable and we'll trade."],
        ])
    StoryState.landingSiteStates.AskBunker:
        StoryState.landingSite = StoryState.landingSiteStates.FoundBunker
        DialogController.createDialog([
        ["Merchant", "Well, no treasures but fair enough."],
        ["Merchant", "There is some fuel in in the container behind me."],
        ["Merchant", "I am wondering how some can not guess this. Totally waste of money."],
        ])
    _:
        DialogController.createDialog([
        ["Merchant", "You better got me something if you want answers!"],
        ])

func _on_Timer_timeout():
  if DIRECTION == Vector2.LEFT:
    DIRECTION = Vector2.RIGHT
    $AnimatedSprite.flip_h = false
  else:
    DIRECTION = Vector2.LEFT
    $AnimatedSprite.flip_h = true
