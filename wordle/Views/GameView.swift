//
//  GameView.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: wordleDataModel
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                VStack(spacing: 3) {
                    GuessView(guess: $dm.guesses[0])
                    GuessView(guess: $dm.guesses[1])
                    GuessView(guess: $dm.guesses[2])
                    GuessView(guess: $dm.guesses[3])
                    GuessView(guess: $dm.guesses[4])
                    GuessView(guess: $dm.guesses[5])
                }
                .frame(width: Common.boardWidth, height: 6 * Common.boardWidth / 5)
                Spacer()
                KeyboardView()
                    .padding(.top)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("WORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(wordleDataModel())
    }
}
