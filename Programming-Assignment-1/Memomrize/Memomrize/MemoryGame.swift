//
//  MemoryGame.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 01/07/21.
//  model

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    init(noOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for indexPair in 0..<noOfPairsOfCards {
            let content = createCardContent(indexPair)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
