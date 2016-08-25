//
//  CardSpec.swift
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

class CardSpec: QuickSpec {
    override func spec() {
        describe("Card") {
            let aceOfSpades = Card(suit: "♠︎", rank: "A")
            let queenOfHearts = Card(suit: "♥︎", rank: "Q")
            let tenOfDiamonds = Card(suit: "♦︎", rank: "10")
            let twoOfClubs = Card(suit: "♣︎", rank: "2")

            describe("initializer") {
                it("should set the suit property") {
                    expect(aceOfSpades.suit).to(equal("♠︎"))
                    expect(queenOfHearts.suit).to(equal("♥︎"))
                    expect(tenOfDiamonds.suit).to(equal("♦︎"))
                    expect(twoOfClubs.suit).to(equal("♣︎"))
                }

                it("should set the rank property") {
                    expect(aceOfSpades.rank).to(equal("A"))
                    expect(queenOfHearts.rank).to(equal("Q"))
                    expect(tenOfDiamonds.rank).to(equal("10"))
                    expect(twoOfClubs.rank).to(equal("2"))
                }
            }

            describe("suit") {
                it("should be the suit") {
                    expect(aceOfSpades.suit).to(equal("♠︎"))
                    expect(queenOfHearts.suit).to(equal("♥︎"))
                    expect(tenOfDiamonds.suit).to(equal("♦︎"))
                    expect(twoOfClubs.suit).to(equal("♣︎"))
                }
            }

            describe("rank") {
                it("should be the rank") {
                    expect(aceOfSpades.rank).to(equal("A"))
                    expect(queenOfHearts.rank).to(equal("Q"))
                    expect(tenOfDiamonds.rank).to(equal("10"))
                    expect(twoOfClubs.rank).to(equal("2"))
                }
            }

            describe("label") {
                it("should be the rank and the suit") {
                    expect(aceOfSpades.label).to(equal("A♠︎"))
                    expect(queenOfHearts.label).to(equal("Q♥︎"))
                    expect(tenOfDiamonds.label).to(equal("10♦︎"))
                    expect(twoOfClubs.label).to(equal("2♣︎"))
                }
            }

            describe("value") {
                it("should return the blackjack value") {
                    expect(aceOfSpades.value).to(equal(1))
                    expect(queenOfHearts.value).to(equal(10))
                    expect(tenOfDiamonds.value).to(equal(10))
                    expect(twoOfClubs.value).to(equal(2))
                }
            }
        }
    }
}
