//
//  ViewController.swift
//  ClassesMagicFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let deck = Deck()
        print("Deck: \(deck.cards.map { $0.label })")
    }

}
