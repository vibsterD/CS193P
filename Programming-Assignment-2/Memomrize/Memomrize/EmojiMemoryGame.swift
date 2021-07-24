//
//  EmojiMemoryGame.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 01/07/21.
//  model-view

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // type property/var 
    static var theme = [["🤧", "👀", "😎", "☺️","😂", "🤌", "😫", "😇", "😙", "🧐", "🙃", "😛", "😱","🤯", "😨", "🤗", "😬", "😵‍💫", "😷", "🤑", "🤒", "😵", "🤫"],
                        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚂", "🚆", "🚇", "🚊", "🚉", "✈️", "🛫", "🚁", "🛸"],
                        ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇦", "🇧🇼", "🇧🇷", "🇻🇬", "🇧🇳", "🇭🇰", "🇸🇨", "🇺🇸", "🇮🇳", "🇮🇸", "🇭🇹"]
    ]
    var themeInd = 0


    // type function
    static func createMemoryGame(_ themeIndex: Int) -> MemoryGame<String> {
        theme[themeIndex].shuffle()
        return MemoryGame<String>(noOfPairsOfCards: 8) { pairIndex in
        theme[themeIndex][pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(0)
            
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
    
    func changeTheme(_ changeBy: Int) {
        print("hellp")
        themeInd += changeBy
        themeInd %= EmojiMemoryGame.theme.count
        if themeInd < 0 {
            themeInd += EmojiMemoryGame.theme.count
        }
        model = EmojiMemoryGame.createMemoryGame(themeInd)
    }
    
}
