//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
        removedLetter(userInputedLetter: string)
        let currentText = textFieldText + string
        if gameReference.gameWords.words.contains(currentText) {
        }
        return true
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func removedLetter(userInputedLetter: String) {
        guard let elementIndex = letterBank.firstIndex(of: userInputedLetter) else {
            return
        }
        letterBank.remove(at: elementIndex)
    }
}

