//
//  GameBrain.swift
//  TextTwist
//
//  Created by Melinda Diaz on 11/7/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation


class GameBrain {
    let gameWords = WordData.allInfo[Int.random(in:0...2)]
    var letterBank = [String]()
    
    
    func setLetterBank(para:String) {
        if !letterBank.isEmpty {
            letterBank.removeAll()
        }
        for characters in para {
            letterBank.append(characters.description)
        }
    }
    
    
    
    
}
