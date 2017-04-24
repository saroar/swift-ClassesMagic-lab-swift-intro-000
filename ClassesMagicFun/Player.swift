//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name: String
    var wallet: UInt
    var hand: [Card]
    
    var handSize: Int {
        return hand.count
    }
    
    var handValue: UInt {
        let aces1 = hand.reduce(0) { (sum, card) in
            return sum + Int(card.value)
        }
        
        let aces10 = hand.reduce(0) { (sum, card) in
            let value = card.rank == "A" ? 11 : card.value
            return sum + Int(value)
        }
        
        if aces10 <= 21 {
            return UInt(aces10)
        } else {
            return UInt(aces1)
        }
    }
    
    var isBlackjack: Bool {
        return handValue == 21
    }
    
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func willHit(_ bet: UInt) -> Bool {
        return bet < 21 && canPlaceBet(bet)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        return bet <= wallet
    }
    func win(_ amount: UInt) {
        wallet += amount
    }
    
    
    func lose(_ amount: UInt) {
        wallet -= amount
    }
}
