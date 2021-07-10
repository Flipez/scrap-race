extends KinematicBody2D

export var FRICTION = 2000
export var ACCELERATION = 1500
export var MAX_SPEED = 500

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
  move_state(delta)
  
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
  
func move():
 velocity = move_and_slide(velocity)
