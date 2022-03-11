//
//  Common.swift
//  wordle
//
//  Created by Samith Wijesinghe on 2022-03-11.
//

import SwiftUI

enum Common {
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDimension: CGFloat {
        min(screenWidth,screenHeight)
    }
    
    static var boardWidth: CGFloat {
        switch minDimension {
        case 0...320:
            return screenWidth - 55
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }

// using a hard code array. common words array should equal to the array comes by parsing the dictionary.json - need to fixed
static let commonWords = ["ABASE", "ABATE", "ABBEY", "ABBOT", "ABEND",  "YOUSE", "YOUTH", "YUCCA", "YUCKY", "YUMMY", "ZEBRA", "ZILCH", "ZIPPY", "ZONED", "ZONES", "ZOOMS"]
    
}

