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
    var winningPlayer: Player?
    var winner: Player? {
        if let winningPlayer = winningPlayer {
            return winningPlayer
        }

        if house.isBusted {
            return player
        }

        if player.isBusted {
            return house
        }

        if player.handValue > house.handValue {
            return player
        } else {
            return house
        }
    }

    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
        currentBet = 0
        winningPlayer = nil
    }

    func placeBet(bet: UInt) -> Bool {
        guard player.canPlaceBet(bet) && house.canPlaceBet(bet) else { return false }
        currentBet = bet
        return true
    }

    func deal() {
        player.dealCard(deck.drawCard()!)
        player.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)

        if player.isBlackjack {
            winningPlayer = player
        }

        if house.isBlackjack {
            winningPlayer = house
        }
    }

    func turn(player: Player) {
        while player.willHit(currentBet) && player.handSize <= 5 {
            player.dealCard(deck.drawCard()!)
        }
    }
}
