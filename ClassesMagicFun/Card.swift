//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    
    var label: String {
        return rank + suit
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
    
    var value: UInt {
        switch rank {
        case "A":
            return 1
        case "J", "K", "Q":
            return 10
        default:
            if let value = UInt(rank) {
                return value
            } else {
                return 0
            }
            
        }
    }
}


