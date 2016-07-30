//
//  DealerSpec.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import XCTest
import Quick
import Nimble
@testable import ClassesMagicFun

class DealerSpec: QuickSpec {
    override func spec() {
        describe("Dealer") {
            var dealer = Dealer()

            beforeEach {
                dealer = Dealer()
            }

            describe("initializer") {
                it("should create a deck") {
                    expect(dealer.deck).to(beTruthy())
                }

                it("should create the house") {
                    expect(dealer.house).to(beTruthy())
                }

                it("should create a player") {
                    expect(dealer.player).to(beTruthy())
                }
            }

            describe("placeBet") {
                it("should return true if both the house and the player can afford the bet") {
                    expect(dealer.placeBet(10)).to(beTrue())
                    expect(dealer.currentBet).to(equal(10))
                }

                it("should return false if the house or the player cannot afford the bet") {
                    expect(dealer.placeBet(200)).to(beFalse())
                    expect(dealer.currentBet).to(equal(0))
                    expect(dealer.placeBet(1200)).to(beFalse())
                    expect(dealer.currentBet).to(equal(0))
                }
            }

            describe("winner") {
                it("should return nil if there is no winner yet") {
                    expect(dealer.winner).to(beNil())
                }
            }
        }
    }
}
