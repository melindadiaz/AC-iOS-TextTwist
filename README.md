# TextTwist


For this assignment, you will be making your own ~Boggle~ Text Twist clone using the magic of ```UITextFieldDelegate```.

![gif](https://media.giphy.com/media/3ov9k7BAg80iXQkBji/giphy.gif)

### Data:

The following struct and class provides the data that you will be working with.  Have your model choose one of the TestTwistInfo at random on startup.

```swift
struct TestTwistInfo {
    let wordCount: Int
    let letters: String
    let words: [String]
}


class WordData {
    static let allInfo: [TestTwistInfo] = [
        TestTwistInfo(wordCount: 27,
                      letters: "cdenno",
                      words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
        TestTwistInfo(wordCount: 18,
                      letters: "ehhssu",
                      words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
        TestTwistInfo(wordCount: 14,
                      letters: "hisswy",
                      words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"])
    ]
}

```

### Stage Zero:

- Set up your UI with a text field (user input), a label (messages to the user) and 4 text views (where the correct words will be displayed)

### Stage One:

- When the user types in a guess into the text field and presses *return*, they get a message if their guess was correct, or had any errors and then it gets added to the appropriate spot in the UI.

### Stage Two:

- Create another label that represents the letter bank of available letters
- Only allow the user to type letters that are inside the letter bank


### Stage Three:

- When the user types a letter, remove the appropriate letter from the letter bank label.

### Stage Four:

- When the user deletes a letter, add the appropriate letter back to the letter bank label.

### Stage Five:

- Present a message to the user if they guess a word that have already guessed before


### Bonus One:

- Add handling for the user guesses all 3-letter words, 4-letter words, 5-letter words or 6-letter words, by changing the background color of the appropriate text view

### Bonus Two:
- When the user guesses a six-letter word, display a message, then have the model change to another word

### Bonus Three:
- Implement a scoreboard.  3-letter words are worth 3, 4-letter words are worth 4 and so on.  The scoreboard should persist as the user goes onto the next word

### Bonus Four:
- Improve the UI so that it looks polished
- Add more sample words [here](https://raw.githubusercontent.com/hackerrdave/text-twist/master/apps/textTwist/public/data/sets.json)

#### Full Requirements:

1. **Letter Bank:** You'll need a letter bank for the user to select from. The letters should disappear or be greyed out when the user types it.
2. **Letter Checks:** You must allow the user to type out **only** valid letters. Perform checks in your logic to prevent incorrect letters from showing up in your ```TextField```.
3. **String Storage:** Store valid words in word bank(s) once the user returns.
4. **Keyboard UI:** Keyboard should resign when the user hits the ```Return``` key.

