//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    WE STILL NEED TO MAKE A PLAY AGAIN MODE
    
    
    let gameReference = GameBrain()
    
    var letterBank = [String]() {
        didSet {
            letterDisplay.text = letterBank.reduce("", +)
        }
    }
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var letterDisplay: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!//label to tell validity
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        letterBank = gameReference.setLetterBank(para: gameReference.gameWords.letters)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        } //below is used to allow the user to delete when they made a mistake
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        print(isBackSpace)
        if !letterBank.contains(string) && isBackSpace != -92 { //this is how backspace is used
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
            resultLabel.text = "Um, You said that already! 😒"
        
    } else if gameReference.gameWords.words.contains(textFieldText) {
            resultLabel.text = "Correct Guess! 🤡"
            resetLetterBank()
            textField.text = ""
            gameReference.guessedWords.append(textFieldText)
        } else {
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

