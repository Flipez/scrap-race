extends Node

enum Intro { Start, FindFuel, Found }
var intro = Intro.Start

enum landingSiteStates { Start, FindScrap, SellScrap, AskBunker, FoundBunker }
var landingSite = landingSiteStates.Start

enum dungeonStates {PuzzleUnsolved, SignRead, PuzzleSolved, ChestOpened}
var dungeonState = dungeonStates.PuzzleUnsolved

var barrelJokesPosition = 0

var playerSpeedMultiplicator = 1

enum consoleStates { Missing, Found, Complete}
var consoleState = consoleStates.Missing

var sodaStandClosed = false
