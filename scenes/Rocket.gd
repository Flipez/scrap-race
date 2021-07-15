extends StaticBody2D

func interact(_player):
  if StoryState.landingSite == StoryState.landingSiteStates.FindScrap:
    StoryState.landingSite = StoryState.landingSiteStates.SellScrap
    DialogController.createDialog([
      ["Scat", "That's some nice scrap!"]
     ])
