//
//  GameBrain.swift
//  TextTwist
//
//  Created by Melinda Diaz on 11/7/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation


class GameBrain {
    var gameWords = WordData.allInfo[Int.random(in:0...2)]
    var copyGameWords = [String]()
    var removedLetters = [String]()
    var guessedWords = [String]()
    
    func setLetterBank(para:String) -> [String] {
        var letterBank = [String]()
        if !letterBank.isEmpty {
            letterBank.removeAll()
        }
        for characters in para {
            letterBank.append(characters.description)
        }
        return letterBank
    }
    
    func playAgain() {
        guessedWords.removeAll()
        copyGameWords.removeAll()
        let previousGame = gameWords.letters
        gameWords = WordData.allInfo[Int.random(in:0...2)]
        while previousGame == gameWords.letters {
            gameWords = WordData.allInfo[Int.random(in: 0...2)]
        }
    }
    func wordsToStars() -> [String] {
        return copyGameWords.map{(paraX: String) -> String in
            var someString = ""
            for _ in paraX {
                someString += "*"
            }
            return someString
        }
    }
    
    func removeCorrectWords(para:String) {
        if let correctWords = copyGameWords.firstIndex(of: para) {
            copyGameWords.remove(at: correctWords)
        }
    }
    
    func copyOfData() {
        copyGameWords = gameWords.words
    }
    
    func winner() -> Bool {
      return copyGameWords.isEmpty
    }
}
