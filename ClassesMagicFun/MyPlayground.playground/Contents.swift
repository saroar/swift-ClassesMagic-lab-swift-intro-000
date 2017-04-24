//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//var cards: [String] = []
//
//cards.append("Alif")
//cards.append("Masum")
//cards.append("Sumi")
//cards.append("Reyadh")
//
//extension Array {
//    mutating func shuffle() {
//        for i in (0..<self.count).reversed() {
//            let idx = Int(arc4random_uniform(UInt32(i+1)))
//            (self[i], self[idx]) = (self[idx], self[i])
//        }
//    }
//}
//
//cards.shuffle()
//cards.shuffle()
//cards.shuffle()
//cards.shuffle()
//

let numbers = [3, 1, 5, 2]

let singleValue =
    numbers.reduce(0) { (runningTotal: Int, next: Int) -> Int in
    
        print("\(runningTotal)")
        print("\(next)\n\n")
        return runningTotal + next
}

print(singleValue)

let result = numbers.map{$0*$0}
print(result)

let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kiloToPoint = milesToPoint.map { name, miles in name + ":\(miles * 1.2)"}
print(kiloToPoint)