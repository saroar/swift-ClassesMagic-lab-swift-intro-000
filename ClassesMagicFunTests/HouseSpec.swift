//
//  HouseSpec.swift
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

class HouseSpec: QuickSpec {
    override func spec() {
        describe("House") {
            describe("willHit") {
                let house = House()

                it("should hit if its hand is below 17") {
                    let card1 = Card(suit: "♥️", rank: "Q")
                    let card2 = Card(suit: "♣️", rank: "5")
                    let card3 = Card(suit: "♠️", rank: "2")
                    house.dealCard(card1)
                    expect(house.willHit(1)).to(beTrue())
                    house.dealCard(card2)
                    expect(house.willHit(1)).to(beTrue())
                    house.dealCard(card3)
                    expect(house.willHit(1)).to(beFalse())
                }
            }
        }
    }
}
