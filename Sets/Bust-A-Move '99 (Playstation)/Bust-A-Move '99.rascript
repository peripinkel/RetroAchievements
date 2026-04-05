// Bust-A-Move '99
// #ID = 17801

// #-----#-----#-----#-----#-----#-----#-----#-----#-----#-----#
// Game Values

// Menu Values

// $0x08af57: [8-bit] On Title Screen
//            1=Title screen
function TitleScreen() => byte(0x08AF57) == 1

// $0x056797: [8-bit] Main Menu
//           1=Main Menu
function MainMenu() => byte(0x09dc6c) == 0

// $0x056a3c: [8-bit] Demo Mode
//            1=Demo Mode
function DemoScreen() => byte(0x056A3C) == 1

// $0x1FFF9D: [8-bit] Arcade Mode Menu Game Select
//            6=Game Select
//            7=Difficulty Select
function ArcadeMenu() => byte(0x1FFF9D) == 6 || byte(0x1FFF9D) == 7
GameSelect = 0x06
DifficultySelect = 0x07

// $0x1FFF84: [8-bit] Edit Mode Menu and Character Select
//            2=Edit Mode Menu
//            3=Character Select
function EditMenu() => byte(0x1FFF84) == 2
function CharacterSelect() => byte(0x1FFF84) == 3

// $0x059C43: [8-bit] In Puzzle Set Up in Edit Mode
//            1=Puzzle Set Up
function EditStage() => byte(0x059C43) == 1

// $0x1FFFB6: [8-bit] In Credit Screen
//            1=Credit Screen
function CreditScreen() => byte(0x1FFFB6) == 1
CreditScreen = byte(0x1FFFB6)

// $0x05f23e: [8-bit] Rendering logic that also indicates Loading Screen
function Loading() => byte(0x05f23e) == 8

// $0x18398f: [8-bit] Game Over
//            0x07=Game Over
function GameOver() => byte(0x18398f) == 7

// $0x056ec0: [8-bit] Continue used
//            0=Continue used
function Continue() => byte(0x056ec0) == 0

// Property Values

// $0x05684a: [8-bit] Victory Beat Stage
//            0x00=Victory
function Victory() => byte(0x0568d8) == 0

// $0x056ccc: [8-bit] Ready GO! and Game Started
function StageStarting() => byte(0x056ccc) == 1
function StageStarted() => byte(0x056ccc) == 2

// $0x056E54: [8-bit] Active Player
//            1=Player 1
//            2=Player 2
function Player() => byte(0x056E54)
PlayerOne = 0x01
PlayerTwo = 0x02

// CurrentMode is the current Mode
// 0=Arcade Mode
// 1=Challenge Mode
// 2=Win Contest Mode
// 3=Collection Mode
// 4=Edit Mode
function Mode() => byte(0x056D2C)
ArcadeMode = 0x00
ChallengeMode = 0x01
WinContestMode = 0x02
CollectionMode = 0x03
EditMode = 0x04

// ArcadeMode
// 0=Puzzle Mode
// 1=Player vs Computer Mode
// 2=Plater vs Player Mode
function ArcadeMode() => byte(0x056e6c)
PuzzleMode = 0x00
PlayerComputerMode = 0x01
PlayerPlayerMode = 0x02

// $0x056b84: [8-bit] Arcade Mode Difficulty Selected
// 0=Practice Mode
// 1=Normal Mode
// 2=Ver2.5 /Hard/ Variety
function ArcadeDifficulty() => word(0x056b84)
PracticeMode = 0x00
NormalMode = 0x01
HardMode = 0x02

// $0x056ce8: [8-bit] Another World
//            0x00=Off
//            0x01=Another World
function AnotherWorld() => byte(0x056ce8)
AnotherWorld = 0x01
NotAnotherWorld = 0x00

// Paused = 0 for Unpaused 1 = Paused
function Paused() => byte(0x056848)
Unpaused = 0x00
Paused = 0x01

// CharacterPlayerOne is the character of Player 1
// 0=Bub
// 1=Twinkle
// 2=Priccio
// 3=Marina
// 4=Musashi
// 5=Luna Luna
// 6=Jack
// 7=Super Sonic Blast Man
// 8=Debblun
// 9=Drunk
// 10=Paya-Paya
// 11=Pitch and Chap
// 12=Special Drunk
function CharacterPlayerOne() => word(0x056C2C)
function CharacterPlayerTwo() => word(0x056C34)
Bub = 0x00
Twinkle = 0x01
Priccio = 0x02
Marina = 0x03
Musashi = 0x04
LunaLuna = 0x05
Jack = 0x06
SSBM = 0x07
Debblun = 0x08
Drunk = 0x09
PayaPaya = 0x0a
PitchChap = 0x0b
SpecialDrunk = 0x0c

// Rounds in Puzzle
function Round() => word(0x056D10) + 1

// $0x056dcc: [16-bit] Current Set in Puzzle Mode
// 1=A
// 2=B
// 3=C
// 4=D
// 5=E
// ...
// 23=W
// 24=?
// 25=X
// 26=Y
// 27=Z
function Set() => word(0x056dcc)

// $0x056d34: Grade for Challenge Mode
//            0=1
//            1=2
//            ...
//            18=19
//            19=20
function ChallengeGrade() => byte(0x056d34) + 1

// $0x13a830: Stage in Collection Mode
//            0=1
//            ...
//            1024=1025
function CollectionStage() => word(0x13A830) + 1

// Difficulty Settings
// 0=Easy
// 1=Normal
// 2=Hard
// 3=Very Hard
function DifficultySettings() => word(0x056E14)
Easy = 0x00
Normal = 0x01
Hard = 0x02
VeryHard = 0x03

// $0x056d54: [8-bit] Handicap on
//            0x00=Off
//            0x01=On
function Handicap() => byte(0x056d54)
function HandicapOff() => Handicap() == 0
function HandicapOn() => Handicap() == 1

//PlayerOneScore XXX,XXX,XX0
function PlayerOneScore() => dword(0x09D790)

// PlayerTwoScore XXX,XXX,XX0
function PlayerTwoScore() => dword(0x09d87c)

// $0x056f0c: Player vs Player Mode Cups Player
//            0= 0 Cups
//            1= 1 Cup
//            2= 2 Cups
function PlayerOneCups() => byte(0x056f0c)
function PlayerTwoCups() => byte(0x056f10)


// #-----#-----#-----#-----#-----#-----#-----#-----#-----#-----#
// General Functions

// #-----#-----#-----#-----#-----#-----#-----#-----#-----#-----#
// Achievements

// Helper

// Puzzle Mode

// SetGroup():
// Returns the Group of the set based on the Stage, 6 total
function SetGroup(SetCheck)
{
    if (SetCheck == 1)
    {
        return (Set() == 1 || Set() == 2)
    }
    else if (SetCheck == 2)
    {
        return (Set() >= 3 && Set() <= 5)
    }
    else if (SetCheck == 3)
    {
        return (Set() >= 6 && Set() <= 9)
    }
    else if (SetCheck == 4)
    {
        return (Set() >= 10 && Set() <= 14)
    }
    else if (SetCheck == 5)
    {
        return (Set() >= 15 && Set() <= 20)
    }
    else if (SetCheck == 6)
    {
        return (Set() >= 21 && Set() <= 28)
    }{}
}

function UnwantedValues()
{
    return DemoScreen() && HandicapOn()
}

function UnwantedPuzzleValues()
{
    return UnwantedValues() && DifficultySettings() == Easy && GameOver()
}

function UnwantedGameOverValues()
{
    return UnwantedValues() && GameOver()
}

// Returns the value to check when arcadeMode is started and which mode is picked within
function ArcadeModeCheck(ArcadeMode, ArcadeDifficulty)
{
    return Mode() == ArcadeMode && ArcadeMode() == ArcadeMode && ArcadeDifficulty() >= ArcadeDifficulty && StageStarted()
}

function ChallengeModeCheck()
{
    return Mode() == ChallengeMode && StageStarted() && tally(26, prev(Round()) != Round())
}

function WinContestModeCheck(progress)
{
    return Mode() == WinContestMode && StageStarted() && tally(progress - 1, prev(Round()) != Round())
}

function CollectionModeCheck()
{
    return Mode() == CollectionMode && StageStarted()
}

// Checks if the set is completed by making sure all the conditions are right.
// Starts on Puzzle Mode with a selectable difficulty and set that needs to be completed.
// Cancels whenever someone is in the demo or had a gameover.
function SetCompletion(ASet, ArcadeDifficulty, IsAnotherWorld)
{
    start = once(ArcadeModeCheck(PuzzleMode, ArcadeDifficulty) && SetGroup(ASet) && AnotherWorld() == IsAnotherWorld)
    
    cancel = never(UnwantedPuzzleValues())
    
    condition = Victory() && ((prev(Set()) < Set()) || prev(!CreditScreen()) && CreditScreen())
    
    return start && cancel && condition
}

function PuzzleVeryHardChallenge(ArcadeDifficulty, IsAnotherWorld)
{
    cancel = never(DifficultySettings() != VeryHard)
    
    return cancel && SetCompletion(6, ArcadeDifficulty, IsAnotherWorld)
}


// Player VS Computer Mode

// Checks the current opponent just for unnecessarily starting the achievement
function CurrentOpponent(Player, Opponent)
{
    if (Player == PlayerOne)
    {
        return (Player() == PlayerOne && CharacterPlayerTwo() == Opponent)
    }
    else if (Player == PlayerTwo)
    {
        return (Player() == PlayerTwo && CharacterPlayerOne() == Opponent)
    }
}

function ComputerCondition(Player)
{
    if (Player == PlayerOne)
    {
        return prev(CharacterPlayerTwo()) < CharacterPlayerTwo()
    }
    else if (Player == PlayerTwo)
    {
        return prev(CharacterPlayerOne()) < CharacterPlayerOne()
    }
}

function ComputerCreditCondition()
{
    return prev(!CreditScreen()) && CreditScreen()
}

function ComputerCompletion(Opponent, ArcadeDifficulty)
{
    start = once(ArcadeModeCheck(PlayerComputerMode, ArcadeDifficulty))
    
    cancel = never(UnwantedGameOverValues())
    
    alt_playerone_opponent = CurrentOpponent(PlayerOne, Opponent) && ComputerCondition(PlayerOne)
    
    alt_playertwo_opponent = CurrentOpponent(PlayerTwo, Opponent) && ComputerCondition(PlayerTwo)
    
    alt_playerone_credit = CurrentOpponent(PlayerOne, Opponent) && ComputerCreditCondition()
    
    alt_playertwo_credit = CurrentOpponent(PlayerTwo, Opponent) && ComputerCreditCondition()
    
    return start && cancel && Victory() && (alt_playerone_opponent || alt_playertwo_opponent || alt_playerone_credit || alt_playertwo_credit)
}

function ComputerNoContinue(ArcadeDifficulty)
{
    cancel = never(Continue()) && trigger_when(!Continue())

    return cancel && ComputerCompletion(Drunk, ArcadeDifficulty)
}


// Challenge Mode

function ChallengeGradeScore(grade)
{
    start = once(ChallengeModeCheck())
    
    cancel = never(UnwantedGameOverValues())
    
    condition = prev(ChallengeGrade() == 1) && ChallengeGrade() >= grade
    
    return start && cancel && condition
}


// Win Contest Mode

function WinContestProgress(progress)
{
    start = once(WinContestModeCheck(progress))
    
    cancel = never(UnwantedGameOverValues())
    
    condition = prev(Round()) == progress - 1 && Round() == progress
    
    return start && cancel && condition
}


// Collection Mode

function CollectionStagesConditions(stage_array)
{
    stages = []
    
    for stage in stage_array
    {
        array_push(stages, tally(1, CollectionStage() == stage && prev(!Victory()) && Victory()))
    }
    
    return stages
}

function CollectionProgress(first, last)
{
    start = once(CollectionModeCheck())
    
    cancel = never(HandicapOn())
    
    stage_array = range(first, last)
    
    condition = tally(length(stage_array), CollectionStagesConditions(stage_array))
    
    return start && cancel && measured(condition)
}

// Dictionaries

// Puzzle Mode

PuzzlePoints = {
    0: 2,
    1: 2,
    2: 3,
    3: 3,
    4: 5,
    5: 10,
}

SetFormat = {
    0: "A or B",
    1: "C, D, or E",
    2: "F, G, H or I",
    3: "J, K, L, M or N",
    4: "O, P, Q, R, S or T",
    5: "U, V, W, ?, X, Y or Z",
}

PuzzleNormalAchievements = {
    0: "Alphabetic Beginner",
    1: "Clearind D Essentials",
    2: "Halfway Goal",
    3: "Learning More",
    4: "Practically There",
    5: "Ze Victory",
}

PuzzleVerAchievements = {
    0: "New Adaptation, Same Bubbles",
    1: "Clearly Doing Everything",
    2: "For Goaling Heavy Innings",
    3: "Joyously Kept Landing More Numbers",
    4: "On a Prideful Quarry Really Sticking To",
    5: "Winning Version 2.5",
}

PuzzleNormalAnotherAchievements = {
    0: "A whole new world",
    1: "New world novice",
    2: "New World beginner",
    3: "New World competence",
    4: "Proficient Shooter",
    5: "Victorious in Another World",
}

PuzzleVerAnotherAchievements = {
    0: "Beginning the Alphabet",
    1: "Evidently Distinctly Committed",
    2: "In Heavy Goals For",
    3: "New Makings Leading Keenly Juxtaposed",
    4: "Towards Such Ripe Quaint Position On",
    5: "Another Version, Another World Victory",
}


// PlayerVsComputer Mode

ComputerAchievements = {
    0: "Bust-A-Move 3 Beater",
    1: "Quiz Go! Go! Intellect",
    2: "New Capricco Fortune",
    3: "Taito Mah-Jong Earthly hand",
    4: "Musashi Fight Brown Belt",
    5: "Tarot Arcanum Reader",
    6: "Taito Taito Trump Dealer",
    7: "Real Puncher 600Mt.",
    8: "Debble Bobble Beater",
    9: "Bubble World Defender",
}

ComputerHardAchievements = {
    0: "Bust-a-Move 3 Buster",
    1: "Quiz Go! Go! Genius",
    2: "New Capricco Luck",
    3: "Taito Mah-Jong Heavenly hand",
    4: "Musashi Fight Black Belt",
    5: "Tarot Arcanum Cartomancer",
    6: "Taito Taito Trump Trickster",
    7: "Real Puncher 900Mt.",
    8: "Debble Bobble Debbler",
    9: "Bubble World Savior",
}


// Collection Mode

CollectionAchievements = {
    0: "A grassy beginning",
    1: "A grassy stoll",
    2: "A grassy hike",
    3: "Castle retreat",
    4: "Sunken ship",
    5: "Dolphins’ delight",
    6: "Coral class",
    7: "Hot air Bubbloon",
    8: "Safe mountain passage",
    9: "Small town break",
    10: "Small town leasure",
    11: "City night out",
    12: "Pagoda ranges",
    13: "Seaside strolling",
    14: "Seaside walking",
    15: "Seaside running",
    16: "Ancient remains",
    17: "Moderate snowy mountain hike",
    18: "Challenging snowy mountain hike",
    19: "Difficult snowy mountain hike",
    20: "Golden forest edge",
    21: "Golden forest fortune",
    22: "Bubble creek",
    23: "Moonshine castle",
    24: "Moonshine dwelling",
    25: "Deserted Debblun",
    26: "London leasure",
    27: "Westminster roaming",
    28: "Big Ben bustin’",
    29: "Animal parade",
    30: "Zoo march",
    31: "Funky fossil",
    32: "Eccentric ancient town",
    33: "Martian temple",
    34: "Avant-Garde brushing",
    35: "Take me to funky city",
    36: "Bubble Shogun",
    37: "Imperial march",
}

CollectionStartAchievement = {
    0: 1,
    1: 33,
    2: 66,
    3: 98,
    4: 118,
    5: 144,
    6: 171,
    7: 187,
    8: 212,
    9: 249,
    10: 290,
    11: 330,
    12: 345,
    13: 355,
    14: 394,
    15: 433,
    16: 469,
    17: 483,
    18: 518,
    19: 553,
    20: 596,
    21: 609,
    22: 632,
    23: 644,
    24: 667,
    25: 688,
    26: 719,
    27: 749,
    28: 780,
    29: 806,
    30: 847,
    31: 888,
    32: 892,
    33: 900,
    34: 915,
    35: 953,
    36: 989,
    37: 993,
}

CollectionEndAchievement = {
    0: 32,
    1: 65,
    2: 97,
    3: 117,
    4: 143,
    5: 170,
    6: 186,
    7: 211,
    8: 248,
    9: 289,
    10: 329,
    11: 344,
    12: 354,
    13: 393,
    14: 432,
    15: 468,
    16: 482,
    17: 517,
    18: 552,
    19: 595,
    20: 608,
    21: 631,
    22: 643,
    23: 666,
    24: 687,
    25: 718,
    26: 748,
    27: 779,
    28: 805,
    29: 846,
    30: 887,
    31: 891,
    32: 899,
    33: 914,
    34: 952,
    35: 988,
    36: 992,
    37: 1025,
}


// Rich Presence

ModeLookup = {
    0: "Arcade Mode",
    1: "Challenge Mode",
    2: "Win Contest Mode",
    3: "Collection Mode",
    4: "Edit Mode",
}

ArcadeModeLookup = {
    0: "Puzzle Mode",
    1: "Player vs Computer Mode",
    2: "Player vs Player Mode",
}

CharacterP1Lookup = {
    0: "Bub",
    1: "Twinkle",
    2: "Priccio",
    3: "Marina",
    4: "Musashi",
    5: "Luna Luna",
    6: "Jack",
    7: "Super Sonic Blast Man",
    8: "Debblun",
    9: "Drunk",
    10: "Paya-Paya",
    11: "Pitch and Chap",
    12: "Special Drunk",
}

CharacterP2Lookup = {
    0: "Bob",
    1: "Twinkle",
    2: "Priccio",
    3: "Marina",
    4: "Musashi",
    5: "Luna Luna",
    6: "Jack",
    7: "Super Sonic Blast Man",
    8: "Debblun",
    9: "Drunk",
    10: "Paya-Paya",
    11: "Pitch and Chap",
    12: "Special Drunk",
}

PuzzleDifficultyLookup = {
    0: "Practice",
    1: "Normal",
    2: "Ver2.5",
}


PlayerComputerDifficultyLookup = {
    0: "Practice",
    1: "Normal",
    2: "Hard",
}


PlayerPlayerDifficultyLookup = {
    0: "Practice",
    1: "Normal",
    2: "Variety",
}

DifficultyLookup = {
    0: "Easy",
    1: "Normal",
    2: "Hard",
    3: "Very Hard",
}

PausedLookup = {
    1: "▌▌",
}

AnotherWorldLookup = {
    1: " Another World",
}

SetLookup = {
    1: "A",
    2: "B",
    3: "C",
    4: "D",
    5: "E",
    6: "F",
    7: "G",
    8: "H",
    9: "I",
    10: "J",
    11: "K",
    12: "L",
    13: "M",
    14: "N",
    15: "O",
    16: "P",
    17: "Q",
    18: "R",
    19: "S",
    20: "T",
    21: "U",
    22: "V",
    23: "W",
    24: "?",
    25: "X",
    26: "Y",
    27: "Z",
}

// Achievements

// Puzzle Mode --------------------------------------------->>>>>
// Normal Mode

for key in PuzzleNormalAchievements
{
    achievement(
        format(PuzzleNormalAchievements[key]),
        format("Complete Set {0} of Puzzle Mode on Normal", SetFormat[key]),
        PuzzlePoints[key],
        SetCompletion(key + 1, NormalMode, NotAnotherWorld)
    )
}

// Ver 2.5 Mode

for key in PuzzleVerAchievements
{
    achievement(
        format(PuzzleVerAchievements[key]),
        format("Complete Set {0} of Puzzle Mode on Ver2.5", SetFormat[key]),
        PuzzlePoints[key],
        SetCompletion(key + 1, HardMode, NotAnotherWorld)
    )
}

// Normal Mode Another World

for key in PuzzleNormalAnotherAchievements
{
    achievement(
        format(PuzzleNormalAnotherAchievements[key]),
        format("Complete Set {0} of Puzzle Mode on Normal in another world", SetFormat[key]),
        PuzzlePoints[key],
        SetCompletion(key + 1, NormalMode, AnotherWorld)
    )
}

// Ver2.5 Mode Another World

for key in PuzzleVerAnotherAchievements
{
    achievement(
        format(PuzzleVerAnotherAchievements[key]),
        format("Complete Set {0} of Puzzle Mode on Ver2.5 in another world", SetFormat[key]),
        PuzzlePoints[key],
        SetCompletion(key + 1, HardMode, AnotherWorld)
    )
}

// Very Hard Settings Challenges

achievement(
"Normal Puzzle Mastery",
"Complete Set U, V, W, ?, X, Y or Z of Puzzle Mode at Very Hard Game Level",
25, PuzzleVeryHardChallenge(NormalMode, NotAnotherWorld)
)

achievement(
"Another Version Mastery",
"Complete Set U, V, W, ?, X, Y or Z of Puzzle Mode on Ver2.5 at Very Hard Game Level",
25, PuzzleVeryHardChallenge(NormalMode, NotAnotherWorld)
)

achievement(
"New World Mastery",
"Complete Set U, V, W, ?, X, Y or Z of Puzzle Mode in another world at Very Hard Game Level",
25, PuzzleVeryHardChallenge(NormalMode, AnotherWorld)
)

achievement(
"Another Version, Another World Mastery",
"Complete Set U, V, W, ?, X, Y or Z of Puzzle Mode on Ver2.5 in another world at Very Hard Game Level",
25, PuzzleVeryHardChallenge(NormalMode, AnotherWorld)
)


// Computer Mode --------------------------------------------->>>>>
// Normal Mode

for key in ComputerAchievements
{
    achievement(
        format(ComputerAchievements[key]),
        format("Defeat {0} in Player vs Computer Mode on Normal", CharacterP1Lookup[key]),
        5,
        ComputerCompletion(key, NormalMode)
    )
}

// Hard Mode

for key in ComputerHardAchievements
{
    achievement(
        format(ComputerHardAchievements[key]),
        format("Defeat {0} in Player vs Computer Mode on Hard", CharacterP1Lookup[key]),
        10,
        ComputerCompletion(key, HardMode)
    )
}

// No continue

achievement(
    "Debblun Costume",
    "Complete Player vs Computer Mode on Normal without Continue",
    25,
    ComputerNoContinue(NormalMode)
)

achievement(
    "Becoming Drunk",
    "Complete Player vs Computer Mode on Hard without Continue",
    50,
    ComputerNoContinue(HardMode)
)


// Challenge Mode --------------------------------------------->>>>>

achievement(
    "Bubble World Student",
    "Get a grade of 10 or higher in Challenge Mode",
    5,
    ChallengeGradeScore(10)
)

achievement(
    "Bubble World Scholar",
    "Get a grade of 15 or higher in Challenge Mode",
    10,
    ChallengeGradeScore(15)
)

achievement(
    "Bubble World Professor",
    "Get a grade of 20 in Challenge Mode",
    25,
    ChallengeGradeScore(20)
)


// Win Contest Mode --------------------------------------------->>>>>

achievement(
    "Monkeys' Business",
    "Defeat 9 consecutive opponents in Win Contest Mode",
    10,
    WinContestProgress(9)
)

achievement(
    "Fishy Business",
    "Defeat 17 consecutive opponents in Win Contest Mode",
    25,
    WinContestProgress(17)
)

achievement(
    "Bubble Drunkard",
    "Defeat 25 consecutive opponents in Win Contest Mode",
    25,
    WinContestProgress(25)
)


// Win Contest Mode --------------------------------------------->>>>>




// Rich Presence Functions       #-----#-----#-----#-----#-----#

function RPCharacter(Player)
{
    if (Player == 1)
    {
        return CharacterPlayerOne()
    }
    else if Player == 2
    {
        return CharacterPlayerTwo()
    }
}

function RPOpponent(Player)
{
    if (Player == 1)
    {
        return CharacterPlayerTwo()
    }
    else if (Player == 2)
    {
        return CharacterPlayerOne()
    }
}

function CharacterLookup(Player)
{
    if (Player == 1)
    {
        return CharacterP1Lookup
    }
    else if (Player == 2)
    {
        return CharacterP2Lookup
    } 
}

function OpponentLookup(Player)
{
    if (Player == 1)
    {
        return CharacterP2Lookup
    }
    else if (Player == 2)
    {
        return CharacterP1Lookup
    } 
}

function RPScore(Player)
{
    if (Player == 1)
    {
        return PlayerOneScore()
    }
    else if (Player == 2)
    {
        return PlayerTwoScore()
    }
}


// Rich Presence Display         #-----#-----#-----#-----#-----#

// Menu Section to include all Menus and sections
rich_presence_conditional_display(Loading(), "Loading...")

rich_presence_conditional_display(TitleScreen(), "On the Title Screen")

rich_presence_conditional_display(DemoScreen(), "Watching the Demo")

rich_presence_conditional_display(CharacterSelect(), "Choosing a Character")

rich_presence_conditional_display(MainMenu(), "On the Main Menu")

rich_presence_conditional_display(ArcadeMenu(), "Arcade Mode Menu")

rich_presence_conditional_display(EditMenu(), "Edit Mode Menu")

rich_presence_conditional_display(EditStage(), "Making a custom Stage")

rich_presence_conditional_display(CreditScreen(), "Watching the Credits")

// Section for the in-stage logic
// Arcade Mode Sections
// Puzzle Mode
// Player One
rich_presence_conditional_display(
(Mode() == ArcadeMode && ArcadeMode() == PuzzleMode) && Player() == PlayerOne,
"{0}  {1} is in {2}{3} on {4} | Set {5} | Round {6} | Score {7}0 | {8} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
    rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
    rich_presence_lookup("AnotherWorld", AnotherWorld(), AnotherWorldLookup),
    rich_presence_lookup("ArcadeDifficulty", ArcadeDifficulty(), PuzzleDifficultyLookup),
    rich_presence_lookup("Set", Set(), SetLookup),
    rich_presence_value("Round", Round()),
    rich_presence_value("Score", bcd(RPScore(1))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player Two
rich_presence_conditional_display(
(   Mode() == ArcadeMode && ArcadeMode() == PuzzleMode) && Player() == PlayerTwo,
    "{0}  {1} is in {2}{3} on {4} | Set {5} | Round {6} | Score {7}0 | {8} Difficulty",
        rich_presence_lookup("Paused", Paused(), PausedLookup),
        rich_presence_lookup("CharacterP2", RPCharacter(2), CharacterLookup(2)),
        rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
        rich_presence_lookup("AnotherWorld", AnotherWorld(), AnotherWorldLookup),
        rich_presence_lookup("ArcadeDifficulty", ArcadeDifficulty(), PuzzleDifficultyLookup),
        rich_presence_lookup("Set", Set(), SetLookup),
        rich_presence_value("Round", Round()),
        rich_presence_value("Score", bcd(RPScore(2))),
        rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player vs Computer Mode
// Player One
rich_presence_conditional_display(
    (Mode() == ArcadeMode && ArcadeMode() == PlayerComputerMode) && Player() == PlayerOne,
    "{0}  {1} is fighting {2} in {3} on {4} | Round {5} | Score {6}0 | {7} Difficulty",
        rich_presence_lookup("Paused", Paused(), PausedLookup),
        rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
        rich_presence_lookup("CharacterP1", RPOpponent(1), CharacterLookup(1)),
        rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
        rich_presence_lookup("ArcadeDifficulty", ArcadeDifficulty(), PuzzleDifficultyLookup),
        rich_presence_value("Round", Round()),
        rich_presence_value("Score", bcd(RPScore(1))),
        rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)
// Player Two
rich_presence_conditional_display(
    (Mode() == ArcadeMode && ArcadeMode() == PlayerComputerMode) && Player() == PlayerTwo,
    "{0}  {1} is fighting {2} in {3} on {4} | Round {5} | Score {6}0 | {7} Difficulty",
        rich_presence_lookup("Paused", Paused(), PausedLookup),
        rich_presence_lookup("CharacterP2", RPCharacter(2), CharacterLookup(2)),
        rich_presence_lookup("CharacterP1", RPOpponent(2), CharacterLookup(1)),
        rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
        rich_presence_lookup("ArcadeDifficulty", ArcadeDifficulty(), PuzzleDifficultyLookup),
        rich_presence_value("Round", Round()),
        rich_presence_value("Score", bcd(RPScore(2))),
        rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player vs Player Mode
rich_presence_conditional_display(
    (Mode() == ArcadeMode && ArcadeMode() == PlayerPlayerMode),
    "{0}  {1} 🏆 {2} is fighting {3} 🏆 {4} in {5} on {6} | Round {7} | Score {8}0 | {9} Difficulty",
        rich_presence_lookup("Paused", Paused(), PausedLookup),
        rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
        rich_presence_value("ThrophyP1", PlayerOneCups()),
        rich_presence_lookup("OpponentP1", RPOpponent(1), OpponentLookup(1)),
        rich_presence_value("ThrophyP2", PlayerTwoCups()),
        rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
        rich_presence_lookup("ArcadeDifficulty", ArcadeDifficulty(), PuzzleDifficultyLookup),
        rich_presence_value("Round", Round()),
        rich_presence_value("Score", bcd(RPScore(1))),
        rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Challenge and Edit Stage Mode
// Player One
rich_presence_conditional_display(
(Mode() == ChallengeMode || Mode() == EditMode) && Player() == PlayerOne, 
"{0}  {1} is in {2} | Round {3} | Score {4}0 | {5} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
    rich_presence_lookup("Mode", Mode(), ModeLookup),
    rich_presence_value("Round", Round()),
    rich_presence_value("Score", bcd(RPScore(1))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player Two
rich_presence_conditional_display(
(Mode() == ChallengeMode || Mode() == EditMode) && Player() == PlayerTwo, 
"{0}  {1} is in {2} Round {3} | Score {4}0 | {5} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP2", RPCharacter(2), CharacterLookup(2)),
    rich_presence_lookup("Mode", Mode(), ModeLookup),
    rich_presence_value("Round", Round()),
    rich_presence_value("Score", bcd(RPScore(2))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)


//Win Contest
// Player One
rich_presence_conditional_display(
(Mode() == WinContestMode) && Player() == PlayerOne,
"{0}  {1} is fighting {2} in {3} | Round {4} | Score {5}0 | {6} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
    rich_presence_lookup("OpponentP1", RPOpponent(1), OpponentLookup(1)), 
    rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
    rich_presence_value("Round", Round()),
    rich_presence_value("Score", bcd(RPScore(1))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player Two
rich_presence_conditional_display(
(Mode() == WinContestMode) && Player() == PlayerTwo,
"{0}  {1} is fighting {2} in {3} | Round {4} | Score {5}0 | {6} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP2", RPCharacter(2), CharacterLookup(2)),
    rich_presence_lookup("OpponentP2", RPOpponent(2), OpponentLookup(2)), 
    rich_presence_lookup("ArcadeMode", ArcadeMode(), ArcadeModeLookup),
    rich_presence_value("Round", Round()),
    rich_presence_value("Score", bcd(RPScore(2))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)


// Collection Mode Section
// Player One
rich_presence_conditional_display(
(Mode() == CollectionMode || Mode() == EditMode) && Player() == PlayerOne, 
"{0}  {1} is in {2} Stage {3} | Score {4}0 {5} | Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP1", RPCharacter(1), CharacterLookup(1)),
    rich_presence_lookup("Mode", Mode(), ModeLookup),
    rich_presence_value("Stage", CollectionStage()),
    rich_presence_value("Score", bcd(RPScore(1))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Player Two
rich_presence_conditional_display(
(Mode() == CollectionMode || Mode() == EditMode) && Player() == PlayerTwo, 
"{0}  {1} is in {2} Stage {3} | Score {4}0 | {5} Difficulty",
    rich_presence_lookup("Paused", Paused(), PausedLookup),
    rich_presence_lookup("CharacterP2", RPCharacter(2), CharacterLookup(2)),
    rich_presence_lookup("Mode", Mode(), ModeLookup),
    rich_presence_value("Stage", CollectionStage()),
    rich_presence_value("Score", bcd(RPScore(2))),
    rich_presence_lookup("Difficulty", DifficultySettings(), DifficultyLookup)
)

// Always true Loading
rich_presence_display("Loading...")



