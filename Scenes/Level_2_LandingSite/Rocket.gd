extends StaticBody2D

var speed = 0
var scrap_dialog = [
    ["Scrat", "The merchant doesn't sell any fuel but he might know where to find some."],
    ["M.O.M.", "And your telling me this, because ... ? "],
    ["Scrat", "Because you need to open the door so I can check for something to trade."],
    ["M.O.M.", "What about the JuxBox?"],
    ["Scrat", "Good idea. What better way to get rid of this monstrosity"]
]
func interact(_player):
    if StoryState.landingSite == StoryState.landingSiteStates.FindScrap:
        # StoryState.landingSite = StoryState.landingSiteStates.SellScrap
        StoryState.landingSite = StoryState.landingSiteStates.AskBunker
        DialogController.createDialog(scrap_dialog)
    
func _process(delta):
    self.position.y -= speed * delta

func take_off():
    speed = 30    
