extends Node2D

func _on_DialogStartTimer_timeout():
  DialogController.createDialog([["Scrat", "Maybe I should ask the merchant where the entry for the secret bunker is, they always know this stuff"]])
