//
//  MemoryGame.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 01/07/21.
//  model

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    var lastPossibleIndexOfCardWithFaceUp: Int?
    private(set) var Score: Int = 0
    
    mutating func choose(_ card: Card){
        print(Score)
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isFaceUp
        {
            
            if let possibleMatch = lastPossibleIndexOfCardWithFaceUp {
                if cards[chosenIndex].content == cards[possibleMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[possibleMatch].isMatched = true
                    Score += 2
                }else {
                    if(cards[chosenIndex].isSeen || cards[possibleMatch].isSeen) {
                        Score -= 1
                    }
                }
                cards[chosenIndex].isSeen = true
                cards[possibleMatch].isSeen = true
                lastPossibleIndexOfCardWithFaceUp = nil
            }else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                lastPossibleIndexOfCardWithFaceUp = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
//            cards[chosenIndex].isSeen = true
        }
        
//        print("card index: \(cards)")
    }
       
    
    init(noOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for indexPair in 0..<noOfPairsOfCards {
            let content = createCardContent(indexPair)
            cards.append(Card(content: content, id: 2*indexPair))
            cards.append(Card(content: content, id: 2*indexPair + 1))
        }
        cards.shuffle()
//        Score = 0
    }
    
    struct Card: Identifiable {
        var isSeen: Bool = false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
