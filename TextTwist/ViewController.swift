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
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var letterDisplay: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!//label to tell validity
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        letterDisplay.text = gameReference.gameWords.letters
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        gameReference.setLetterBank(para:gameReference.gameWords.letters)
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else {
            return false
        }
        if !gameReference.letterBank.contains(string){
            resultLabel.text = "Invalid Input"
            return false
            
        }
        let currentText = textFieldText + string
        if gameReference.gameWords.words.contains(currentText) {
            
        }
        return true
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
