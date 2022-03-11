//
//  WordleDataModel.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

class wordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String : Color]()
    var matchedLetters = [String]()
    var misplacedLetters = [String]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init(){
        newGame()
    }
    // setUp
    func newGame(){
        populateDefaults()
        selectedWord = Common.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
        tryIndex = 0
        gameOver = false
        print(selectedWord)
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
        matchedLetters = []
        misplacedLetters = []
    }
    /// game play
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("You Win")
            setCurrentGuessColors()
            inPlay = false
        } else {
            if verifyWord() {
                print("Valid word")
                setCurrentGuessColors()
                tryIndex += 1
                currentWord = ""
                if tryIndex == 6 {
                    gameOver = true
                    inPlay = false
                    print("You lose")
                }
            } else {
            self.incorrectAttempts[tryIndex] += 1
            incorrectAttempts[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    // check if the words are correct using the built in dictionary capabilities
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
        func setCurrentGuessColors() {
            let correctLetters = selectedWord.map { String($0) }
            var frequency = [String : Int]()
            for letter in correctLetters {
                frequency[letter, default: 0] += 1
            }
            for index in 0...4 {
                let correctLetter = correctLetters[index]
                let guessLetter = guesses[tryIndex].guessLetters[index]
                if guessLetter == correctLetter {
                    guesses[tryIndex].bgColors[index] = .correct
                    if !matchedLetters.contains(guessLetter) {
                        matchedLetters.append(guessLetter)
                        keyColors[guessLetter] = .correct
                    }
                    if misplacedLetters.contains(guessLetter) {
                        if let index = misplacedLetters.firstIndex(where: {$0 == guessLetter}) {
                            misplacedLetters.remove(at: index)
                        }
                    }
                    frequency[guessLetter]! -= 1
                }
            }
            
            for index in 0...4 {
                let guessLetter = guesses[tryIndex].guessLetters[index]
                if correctLetters.contains(guessLetter)
                    && guesses[tryIndex].bgColors[index] != .correct
                    && frequency[guessLetter]! > 0 {
                    guesses[tryIndex].bgColors[index] = .misplaced
                    if !misplacedLetters.contains(guessLetter) && !matchedLetters.contains(guessLetter) {
                        misplacedLetters.append(guessLetter)
                        keyColors[guessLetter] = .misplaced
                    }
                    frequency[guessLetter]! -= 1
                }
            }
            
            for index in 0...4 {
                let guessLetter = guesses[tryIndex].guessLetters[index]
                if keyColors[guessLetter] != .correct
                    && keyColors[guessLetter] != .misplaced {
                    keyColors[guessLetter] = .wrong
                }
            }
            flipCards(for: tryIndex)
        }
    func flipCards(for row: Int) {
        for col in 0...4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2) {
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
}
