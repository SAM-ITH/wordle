//
//  WordleDataModel.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

class wordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var keyColors = [String : Color]()
    
    init(){
        newGame()
    }
    // setUp
    func newGame(){
        populateDefaults()
    }
    // refresh the array with default values
    func populateDefaults(){
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        // reset keyboard colors
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    /// game play
    func addToCurrentWord(_ letter: String) {
        
    }
    
    func enterWord() {
        
    }
    
    func removeLetterFromCurrentWord() {
        
    }
}
