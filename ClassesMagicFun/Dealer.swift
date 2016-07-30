//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    let deck: Deck
    let player: Player
    let house: House
    var currentBet: UInt
    var playerTurns: UInt
    var winningPlayer: Player?
    var winner: Player? {
        if let _ = winningPlayer {
            return winningPlayer
        }

        if playerTurns < 2 {
            return nil
        }

        if player.isBusted {
            return house
        }

        if house.isBusted {
            return player
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
        playerTurns = 0
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
        playerTurns += 1
    }

    func award() {
        guard winner != nil else { return }
        winner!.win(currentBet)
        if let _ = winner as? House {
            player.lose(currentBet)
        } else {
            house.lose(currentBet)
        }
    }
}
