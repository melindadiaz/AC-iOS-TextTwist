//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //    WE STILL NEED TO
    // display hidden and correct words && autolayout
    
    let gameReference = GameBrain()
    
    var letterBank = [String]() {
        didSet {
            letterDisplay.text = letterBank.reduce("", +)
        }
    }
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var letterDisplay: UILabel!
    @IBOutlet weak var resultLabel: UILabel!//label to tell validity
    @IBOutlet weak var wordsToStarsTextView: UITextView!
    @IBOutlet weak var correctGuessedWords: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        letterBank = gameReference.setLetterBank(para: gameReference.gameWords.letters)
        gameReference.copyOfData()
        wordsToStarsTextView.text = "\(gameReference.wordsToStars())"// or .description
        resultLabel.isHidden = true
        
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        gameReference.playAgain()
        gameReference.copyOfData()
        resetLetterBank()
        resultLabel.text = ""
        userTextField.text = ""
        correctGuessedWords.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        } //below is used to allow the user to delete when they made a mistake
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if !letterBank.contains(string) && isBackSpace != -92 { //this is
            resultLabel.isHidden = false
            resultLabel.text = "Invalid Input"
            return false
        }
        if isBackSpace == -92 {
            putBackLetter(x: string)
        } else {
            removedLetter(userInputedLetter: string)
        }
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        }
        if gameReference.guessedWords.contains(textFieldText) {
            resultLabel.text = "You said that already! Duh! 😒"
            
        } else if gameReference.copyGameWords.contains(textFieldText) {
            resultLabel.isHidden = false
            resultLabel.text = "Correct Guess! 🤡"
            resetLetterBank()
            textField.text = ""
            gameReference.guessedWords.append(textFieldText)
            gameReference.removeCorrectWords(para: textFieldText)
            correctGuessedWords.text = "\(gameReference.guessedWords)"//or .description
            wordsToStarsTextView.text = "\(gameReference.wordsToStars())"
            if gameReference.winner() {
                resultLabel.isHidden = false
                resultLabel.text = "YOU WON!! 🥳"
                wordsToStarsTextView.isHidden = true
            }
        } else {
            resultLabel.isHidden = false
            resultLabel.text = "NO! Try Again!👿"
            resetLetterBank()
            textField.text = ""
        }
        return true
    }
    
    func removedLetter(userInputedLetter: String) {
        guard let elementIndex = letterBank.firstIndex(of: userInputedLetter) else {
            return
        }
        gameReference.removedLetters.append(letterBank.remove(at: elementIndex))
        
    }
    
    func putBackLetter(x:String) {
        let char = x.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if isBackSpace == -92 {
            letterBank.append(gameReference.removedLetters.popLast() ?? "")
        }
    }
    func resetLetterBank() {
        letterBank = gameReference.setLetterBank(para: gameReference.gameWords.letters)
        gameReference.removedLetters.removeAll()
        
    }
    
    
    
    
}

