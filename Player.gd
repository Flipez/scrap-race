extends KinematicBody2D

export var FRICTION = 500
export var ACCELERATION = 500
export var MAX_SPEED = 80

var velocity = Vector2.ZERO

enum {
  MOVE,
  DIALOG,
  INTERACT
 }

export var state = MOVE

onready var animationPlayer = $AnimationPlayer
onready var interactionTimer = $Area2D/InteractionTimer
onready var interactionArea = $Area2D/InteractionArea
onready var playerSprite = $Sprite

func _physics_process(delta):
  match state:
    MOVE:
      move_state(delta)
    INTERACT:
      interact_state()
  
func move_state(delta):
  var input_vector = Vector2.ZERO
  input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
  input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
  input_vector = input_vector.normalized()

  if input_vector != Vector2.ZERO:
    animationPlayer.play("RunRight")
    velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
  else:
    animationPlayer.play("Idle")
    velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

  move()
  
  if input_vector.x > 0:
    playerSprite.flip_h = false
    playerSprite.offset.x = 20
    interactionArea.position.x = 7
  elif input_vector.x < 0:
    playerSprite.flip_h = true
    playerSprite.offset.x = -20
    interactionArea.position.x = -7
  
  if Input.is_action_just_pressed("ui_interact"):
    state = INTERACT
    interactionTimer.start(0.15)
  
func move():
 velocity = move_and_slide(velocity)

func interact_state():
  velocity = Vector2.ZERO
  interactionArea.disabled = false


func _on_InteractionTimer_timeout():
  state = MOVE
  interactionArea.disabled = true


func _on_Area2D_area_entered(area):
  area.interact(self)
