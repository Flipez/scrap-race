extends Node2D

signal hidePuzzleSprite

onready var puzzleSprite = $PuzzleSprite

func _ready():
  var _return = connect("hidePuzzleSprite", self, "hidePuzzleSprite")

func interact(_player):
  StoryState.dungeonState = StoryState.dungeonStates.SignRead
  DialogController.createDialog([
    ["Sign", "The one who will find E will be granted with a treasure."],
    ["Sign", "A is 3, B is 4, C is 3 and D is 2."],
   ],
  self,
  "hidePuzzleSprite")
  puzzleSprite.visible = true

func hidePuzzleSprite():
  puzzleSprite.visible = false
