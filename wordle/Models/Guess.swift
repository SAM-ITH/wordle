//
//  Guess.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

struct Guess {
    // guess attempts
    let index: Int
    //
    var word = "     "
    // array of background color that changes when evaluvate the guess
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    // filp status of each row
    var cardFlipped = [Bool](repeating: false, count: 5)
    // breakdown of the word into array
    var guessLetters: [String]{
        word.map {String($0)}
    }
}
