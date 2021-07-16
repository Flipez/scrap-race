extends Control

onready var ok_key = $Ok_Key

onready var box = $Box
onready var speaker = $Box/Speaker
onready var message = $Box/Message

var activeDialog = false
var lines = null
var current_line = 0
var unskippable = false
var callback_ref
var callback_signal

func _ready():
  var _return = DialogController.connect("new_dialog", self, "new_dialog")
  _return = DialogController.connect("new_unskippable_dialog", self, "new_unskippable_dialog")
  _return = DialogController.connect("dialog_force_quit", self, "quit_dialog")
  visible = false
  
func _process(_delta):
  if activeDialog && !unskippable:
    if Input.is_action_just_pressed("ui_interact"):
      if lines.size() > current_line + 1:
        current_line += 1
        new_dialog(lines, callback_ref, callback_signal)
      else:
        quit_dialog()

func new_dialog(dialog, origin=null, on_exit_signal=null):
  match typeof(dialog):
    TYPE_STRING:
      lines = [dialog]
    TYPE_ARRAY:
      lines = dialog
    _:
      quit_dialog()
      
  speaker.text = lines[current_line][0]
  message.text = lines[current_line][1]
  visible = true
  activeDialog = true
  callback_ref = origin
  callback_signal = on_exit_signal
  
func new_unskippable_dialog(dialog):
  unskippable = true
  ok_key.visible = false
  new_dialog(dialog)


func quit_dialog():
  ok_key.visible = true
  visible = false
  activeDialog = false
  current_line = 0
  unskippable = false
  if callback_ref && callback_signal:
    callback_ref.emit_signal(callback_signal)
  DialogController.dialog_exited()
