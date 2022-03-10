//
//  WordleDataModel.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

class wordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init(){
        newGame()
    }
    
    func newGame(){
        populateDefaults()
    }
    // refresh the array with default values
    func populateDefaults(){
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
}
