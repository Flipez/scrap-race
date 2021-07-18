extends AnimatedSprite

func interact(_player):
  DialogController.createDialog([
    ["Scrat", "A old foosball table. Looks like someone automated it."],
    ["Scrat", "It contains a digital goal ref developed by Herzmut Games long ago."]
   ])
