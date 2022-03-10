//
//  storageFunction.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-11.
//

import Foundation

class storageFunctions {
    static let bundleURL = Bundle.main.url(forResource: "dictionary", withExtension: "json")!
    
    static func retvireWords() -> [Dictionaryitem] {
        var url = bundleURL
        let decoder = JSONDecoder()
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to decode data")
        }
        guard let dicItems = try? decoder.decode([Dictionaryitem].self, from: data) else {
            fatalError("Failed to decode json from data")
        }
        
        return dicItems
    }
}
