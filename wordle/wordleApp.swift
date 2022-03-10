//
//  wordleApp.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-10.
//

import SwiftUI

@main
struct wordleApp: App {
    @StateObject var dm = wordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
