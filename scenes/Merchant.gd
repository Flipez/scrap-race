extends KinematicBody2D

var velocity = Vector2.ZERO

export var FRICTION = 500
export var ACCELERATION = 500
export var MAX_SPEED = 10
export var DIRECTION = Vector2.LEFT

#func _physics_process(delta):
#  velocity = velocity.move_toward(DIRECTION * MAX_SPEED, ACCELERATION * delta)
#  move_and_slide(velocity)

func interact(player):
  DialogController.createDialog([
    ["Scrat", "Hello, can you tell me where I can find the secret entrance to the bunker?"],
    ["Merchant", "Why should I know where the secret entrance is?"],
    ["Scrat", "I assumed you as a merchant do know a lot stuff"],
    ["Merchant", "Thats true, but my informations are not for free"]
   ])


func _on_Timer_timeout():
  if DIRECTION == Vector2.LEFT:
    DIRECTION = Vector2.RIGHT
    $AnimatedSprite.flip_h = false
  else:
    DIRECTION = Vector2.LEFT
    $AnimatedSprite.flip_h = true
