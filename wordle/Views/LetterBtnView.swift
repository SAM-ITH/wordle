//
//  LetterBtnView.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-11.
//

import SwiftUI

struct LetterBtnView: View {
    @EnvironmentObject var dm: wordleDataModel
    var letter: String
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 30, height: 45)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

struct LetterBtnView_Previews: PreviewProvider {
    static var previews: some View {
        LetterBtnView(letter: "S")
            .environmentObject(wordleDataModel())
    }
}
