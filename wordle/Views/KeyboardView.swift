//
//  KeyboardView.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-11.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var dm: wordleDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var secondRowArray = "ASDFGHJKL".map{ String($0) }
    var thirdRowArray = "ZXCVBNM".map{ String($0) }
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterBtnView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) { letter in
                    LetterBtnView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 50, height: 45)
                .foregroundColor(.primary)
                .background(Color.unused)
                ForEach(thirdRowArray, id: \.self) { letter in
                    LetterBtnView(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 35, height: 45)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .environmentObject(wordleDataModel())
    }
}
