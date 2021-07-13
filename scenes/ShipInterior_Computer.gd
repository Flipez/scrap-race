extends Node2D

var dialog1 = [
    ['Scrat', 'Ok M.O.M. what can you tell me about the planet?'],
    ['M.O.M', "Yet another boring planet. Mostly used as junkyard. I don't think we'll find anything special there."],
    ['Scrat', "We'll see about that. You know my pinky toe itched. That's always a good sign."],
    ['M.O.M', "You might as well just need a bath..."],
    ['Scrat', "Maybe next month.... So did you already pick a good landing spot?"],
    ['M.O.M', "There are a couple of suitable locations, but..."],
    ['Scrat', "Why is there always a catch... Ok, so what's the problem?"],
    ['M.O.M.', "Do you remember, that I told you to stop at the Gas station because we're low on fuel."],
    ['Scrat', "But my ex-girlfriend Juljul and her new lover, that Flipez guy, were there and I didn't want to bump into them."],
    ['M.O.M.', "Anyhow... we're short on fuel."],
    ['Scrat', "Hm....I think I still have a bottle of the Whiskey aunt Cass sent me last Christmas."],
    ['M.O.M.', "Keep that stuff away from my sensitive parts. You know what happened last time..."],
    ['Scrat', "Any other ideas?"],
    ['M.O.M.', "I think in the pile of junk you call treasure hoard might be something."],
    ['Scrat', "Fine. I'll check. Unlock the trap door."]
]

func interact(_player):    
    DialogController.createDialog(dialog1)
    StoryState.intro = StoryState.Intro.FindFuel
