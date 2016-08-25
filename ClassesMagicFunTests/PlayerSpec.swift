//
//  PlayerSpec.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import XCTest
import Quick
import Nimble
@testable import ClassesMagicFun

class PlayerSpec: QuickSpec {
    override func spec() {
        describe("Player") {
            var player = Player(name: "John Doe")

            beforeEach {
                player = Player(name: "John Doe")
            }

            describe("initializer") {
                it("should set the name property") {
                    expect(player.name).to(equal("John Doe"))
                }

                it("should set the wallet property") {
                    expect(player.wallet).to(equal(100))
                }
            }

            describe("isBlackjack") {
                it("returns true if the player has a score of 21 with two cards") {
                    let card1 = Card(suit: "♦️", rank: "10")
                    let card2 = Card(suit: "♣️", rank: "A")
                    expect(player.isBlackjack).to(beFalse())
                    player.dealCard(card1)
                    expect(player.isBlackjack).to(beFalse())
                    player.dealCard(card2)
                    expect(player.isBlackjack).to(beTrue())
                }

                it("returns false if the player has a score of 21 with more than two cards") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♥️", rank: "8")
                    let card3 = Card(suit: "♣️", rank: "2")
                    expect(player.isBlackjack).to(beFalse())
                    player.dealCard(card1)
                    expect(player.isBlackjack).to(beFalse())
                    player.dealCard(card2)
                    expect(player.isBlackjack).to(beFalse())
                    player.dealCard(card3)
                    expect(player.isBlackjack).to(beFalse())
                }
            }

            describe("isBusted") {
                it("returns false if the player has a score of 21 or less") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♥️", rank: "8")
                    let card3 = Card(suit: "♣️", rank: "2")
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card1)
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card2)
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card3)
                    expect(player.isBusted).to(beFalse())
                }

                it("returns true if the player has a score greater than 21") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♥️", rank: "8")
                    let card3 = Card(suit: "♣️", rank: "10")
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card1)
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card2)
                    expect(player.isBusted).to(beFalse())
                    player.dealCard(card3)
                    expect(player.isBusted).to(beTrue())
                }
            }

            describe("willHit") {
                it("returns true if the player's hand value is under 21") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♣️", rank: "A")
                    expect(player.willHit(1)).to(beTrue())
                    player.dealCard(card1)
                    expect(player.willHit(1)).to(beTrue())
                    player.dealCard(card2)
                    expect(player.willHit(1)).to(beFalse())
                }

                it("returns false if the player's hand value is 21 or over") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♥️", rank: "8")
                    let card3 = Card(suit: "♣️", rank: "10")
                    expect(player.willHit(1)).to(beTrue())
                    player.dealCard(card1)
                    expect(player.willHit(1)).to(beTrue())
                    player.dealCard(card2)
                    expect(player.willHit(1)).to(beTrue())
                    player.dealCard(card3)
                    expect(player.willHit(1)).to(beFalse())
                }

                it("returns false if the player cannot afford the bet") {
                    expect(player.willHit(1)).to(beTrue())
                    expect(player.willHit(101)).to(beFalse())
                }
            }

            describe("handSize") {
                it("returns the size of the player's hand") {
                    let card1 = Card(suit: "♠️", rank: "K")
                    let card2 = Card(suit: "♥️", rank: "8")
                    let card3 = Card(suit: "♣️", rank: "10")
                    expect(player.handSize).to(equal(0))
                    player.dealCard(card1)
                    expect(player.handSize).to(equal(1))
                    player.dealCard(card2)
                    expect(player.handSize).to(equal(2))
                    player.dealCard(card3)
                    expect(player.handSize).to(equal(3))
                }
            }

            describe("canPlaceBet") {
                it("returns false if the player cannot afford the bet") {
                    expect(player.canPlaceBet(100)).to(beTrue())
                    expect(player.canPlaceBet(101)).to(beFalse())
                }
            }

            describe("win") {
                it("adds the winning amount to the player's wallet") {
                    player.win(100)
                    expect(player.wallet).to(equal(200))
                }
            }

            describe("lose") {
                it("subtracts the winning amount from the player's wallet") {
                    player.lose(95)
                    expect(player.wallet).to(equal(5))
                }
            }
        }
    }
}
