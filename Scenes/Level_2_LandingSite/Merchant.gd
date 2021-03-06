extends KinematicBody2D

signal tradeJuxBox

var velocity = Vector2.ZERO

export var FRICTION = 500
export var ACCELERATION = 500
export var MAX_SPEED = 10
export var DIRECTION = Vector2.LEFT

var playerInSight = false

func _physics_process(delta):
  if !playerInSight:
    velocity = velocity.move_toward(DIRECTION * MAX_SPEED, ACCELERATION * delta)
    var _return = move_and_slide(velocity)

func interact(_player):
  match StoryState.landingSite: 
    StoryState.landingSiteStates.Start:
        StoryState.landingSite = StoryState.landingSiteStates.FindScrap
        DialogController.createDialog([
        ["Scrat", "Hello, do you sell some fuel?"],
        ["Travelling Merchant", "Hello Stranger, unfortunately not. But I do have some nice sock puppets."],
        ["Scrat", "No thanks. If you do not sell fuel, maybe you know where I can find some?"],
        ["Travelling Merchant", "Thats true, but my informations are not for free"],
        ["Travelling Merchant", "Bring me something valuable and we'll trade."],
        ])
    StoryState.landingSiteStates.AskBunker:
        StoryState.landingSite = StoryState.landingSiteStates.FoundBunker
        DialogController.createDialog([
        ["Travelling Merchant", "Well, no treasures but fair enough."],
        ["Travelling Merchant", "There is some fuel in in the container behind me."],
        ["Travelling Merchant", "I am wondering how some can not guess this. Totally waste of money."],
        ], self, "tradeJuxBox")
    _:
        DialogController.createDialog([
        ["Travelling Merchant", "You better got me something if you want answers!"],
        ])

func _on_Timer_timeout():
  if DIRECTION == Vector2.LEFT:
    DIRECTION = Vector2.RIGHT
    $AnimatedSprite.flip_h = false
  else:
    DIRECTION = Vector2.LEFT
    $AnimatedSprite.flip_h = true

func tradeJuxBox():
  emit_signal("tradeJuxBox")


func _on_PlayerDetection_area_entered(area):
  playerInSight = true
  $Timer.paused = true
  $AnimatedSprite.play("idle")


func _on_PlayerDetection_area_exited(area):
  playerInSight = false
  $Timer.paused = false
  $AnimatedSprite.play("default")
