//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = []
    var nextCard: Int
    
    init() {
        nextCard = 0
        cards = []
        
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] {
                let card = Card.init(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        shuffle()
    }
    
    func drawCard() -> Card? {
        guard nextCard < cards.count else { return nil }
        let card = cards[nextCard]
        nextCard += 1
        return card
    }
    
    func shuffle() {
        nextCard = 0
        cards.shuffleInPlace()
    }
}

extension Array {
    mutating func shuffleInPlace() {
        for i in (0..<self.count).reversed() {
            let rendomIdx = Int(arc4random_uniform(UInt32(i+1)))
            (self[i], self[rendomIdx]) = (self[rendomIdx], self[i])
        }
    }
}
