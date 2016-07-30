//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Dealer {
    let deck: Deck
    let player: Player
    let house: House
    var currentBet: UInt
    var winner: Player? {
        return nil
    }

    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
        currentBet = 0
    }

    func placeBet(bet: UInt) -> Bool {
        guard player.canPlaceBet(bet) && house.canPlaceBet(bet) else { return false }
        currentBet = bet
        return true
    }
}
