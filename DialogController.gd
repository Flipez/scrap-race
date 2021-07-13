extends Node

signal new_dialog(dialog)
signal new_unskippable_dialog(dialog)
signal dialog_exited()
signal dialog_force_quit()

func createDialog(lines):
  emit_signal("new_dialog", lines)
  
func create_unskippable_dialog(lines):
  emit_signal("new_unskippable_dialog", lines)

func dialog_exited():
  emit_signal("dialog_exited")

func dialog_force_quit():
  emit_signal("dialog_force_quit")
