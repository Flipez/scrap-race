extends AnimatedSprite

func interact(_player):
  DialogController.createDialog([
    ["Scat", "A old foosball table. Looks like someone automated it."]
   ])
