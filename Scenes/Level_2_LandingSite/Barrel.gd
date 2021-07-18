extends StaticBody2D

var jokes = [
  [
    ["Barrel", "Why was the math teacher late to work?"],
    ["Barrel", "She took the rhombus."]
  ],
  [
    ["Barrel", "What did Yoda say when he saw himself in 4K?"],
    ["Barrel", "HDMI."]
  ],
  [
    ["Barrel", "I put my root beer into a square glass."],
    ["Barrel", "Now it's just beer."]
  ],
  [
    ["Barrel", "Why can't you trust an atom?"],
    ["Barrel", "Because they make up everything."]
  ],
  [
    ["Barrel", "I tried to organize a professional Hide-and-Seek tournament, but it was a complete failure."],
    ["Barrel", "Good players are hard to find."]
  ],
  [
    ["Barrel", "What did the little mountain say to the bigger mountain?"],
    ["Barrel", "Hi Cliff!"]
  ],
  [
    ["Barrel", "When's the best time to go to the dentist?"],
    ["Barrel", "Tooth-hurtie!"]
  ],
  [
    ["Barrel", "Why do fish live in salt water?"],
    ["Barrel", "Because pepper makes them sneeze!"]
  ],
  [
    ["Barrel", "What's the best thing about Switzerland?"],
    ["Barrel", "I don't know, but its flag is a big plus!"]
  ],
  [
    ["Barrel", "Today I gave my dead batteries away."],
    ["Barrel", "They were free of charge."]
  ],
  [
    ["Barrel", "What does a zombie vegetarian eat?"],
    ["Barrel", "\"Graaaaaaaains!\""]
  ],
  [
    ["Barrel", "What did the blanket say as it fell off the bed?"],
    ["Barrel", "\"Oh sheet!\""]
  ],
  [
    ["Barrel", "What's the last thing that goes through a bug's mind when it hits a windshield?"],
    ["Barrel", "Its butt."]
  ],
  [
    ["Barrel", "What did Batman say to Robin before they got in the car?"],
    ["Barrel", "\"Robin, get in the car.\""]
  ],
  [
    ["Barrel", "What's red and shaped like a bucket?"],
    ["Barrel", "A blue bucket painted red."]
  ],
  [
    ["Barrel", "What do you call a fish with no eye?"],
    ["Barrel", "Fsh."]
  ],
  [
    ["Barrel", "What's the dumbest animal in the jungle?"],
    ["Barrel", "A polar bear!"]
  ],
  [
    ["Barrel", "Did you hear about the two thieves who stole a calendar?"],
    ["Barrel", "They each got six months."]
  ],
  [
    ["Barrel", "I'm terrified of elevators so I'm going to start taking steps to avoid them."]
  ],
  [
    ["Barrel", "Have you heard of the band 923 Megabytes?"],
    ["Barrel", "Probably not, they haven't had a gig yet."]
  ]
]

func interact(_player):
  if StoryState.barrelJokesPosition > (jokes.size() - 1):
    StoryState.barrelJokesPosition = 0
  
  DialogController.createDialog(jokes[StoryState.barrelJokesPosition])
  StoryState.barrelJokesPosition += 1
