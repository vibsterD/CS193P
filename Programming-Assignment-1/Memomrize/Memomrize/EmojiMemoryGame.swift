//
//  EmojiMemoryGame.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 01/07/21.
//  model-view

import SwiftUI

class EmojiMemoryGame {
    // type property/var 
    static var emojis = ["🤧", "👀", "😎", "☺️","😂", "🤌", "😫", "😇", "😙", "🧐", "🙃", "😛", "😱","🤯", "😨", "🤗", "😬", "😵‍💫", "😷", "🤑", "🤒", "😵", "🤫"]

    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(noOfPairsOfCards: 4) { pairIndex in
        emojis[pairIndex]
        }
    }
    
    
    private var model: MemoryGame<String> = createMemoryGame()
            
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
