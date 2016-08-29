# Classes: Blackjack Lab 

![NameOfPerson](http://i.imgur.com/ouSfJLS.jpg?1)  

> If I have seen further it is by standing on the shoulders of Giants. -[Isaac Newton](https://en.wikipedia.org/wiki/Isaac_Newton)

## Overview

In this lab, you'll implement classes to play a game of Blackjack. 

## Introduction

In this lab, you will implement classes to play a game of Blackjack. If you're not familiar with Blackjack, the [Wikipedia entry](https://en.wikipedia.org/wiki/Blackjack) should tell you everything you need to know. The implementation of this game will be fairly simple. You'll create a few classes that are able to interact with each other through methods. Together these classes will simulate a simple game of Blackjack.

You can start the lab by opening up `ClassesMagicFun.xcworkspace` in Xcode. This project contains several files in which you will implement the classes needed to run the game. It also includes tests. You can run these tests by select **Test** from the **Product** menu, or by pressing <kbd>Command</kbd>-U. If you implement the classes correctly, all the tests should pass.

Let's get started!

## Directions

The tests and game loop have been written for you. In order to complete this lab, you will need to implement the following classes:

### `Card`

The `Card` class is defined in `Card.swift`. Open that file and add these properties and methods to it:

1. A `String` property called `suit` that holds the card's suit: Either ♠️, ♣️, ♥️, or ♦️.
2. A `String` property called `rank` that holds the card's rank: Either "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", or "K".
3. A `String` property called `label` that returns a string representing both the rank and the suit. For example, the ace of spade's `label` would return "A♠️".
4. A `value` property that returns the value of the card. Numbered cards are worth their face value, face cards are worth 10, and aces are worth 1. (Aces _can_ be worth 11 at the player's discretion, but this property should return 1 for aces.)
5. An initializer that takes the suit and rank as parameters.

### `Player`

The `Player` class is defined in `Player.swift`. Open that file and add these properties and methods to it:

1. A `String` property called `name` that will store the name of the player.
2. A `UInt` property called `wallet` that will store how much money the player has.
3. A `[Card]` property called `hand` that will store the player's hand.
4. An `Int` property called `handSize` that will store the number of cards in the player's hand.
5. A `UInt` property called `handValue` that will store the value of the player's hand. In Blackjack, numbered cards are worth the numerical value of the card, face cards are worth 10 points, and aces can be worth 1 or 11 at the player's discretion. Aces are a bit tricky, so you will have to implement some logic to decide if the ace should be worth 1 or 11. (If it makes your implementation simpler, you can assume the player will hold no more than one ace at a time, although this is not guaranteed.)
6. A `Bool` property called `isBlackjack` that determines if the player's hand value is 21.
7. A `Bool` property called `isBusted` if the player's hand value is over 21.
8. An initializer that takes a single parameter, the name of the player. It should assign this value to the `name` property.
9. A method called `dealCard(_:)`. This method takes one card as a parameter and adds it to the player's hand.
10. A method called `canPlaceBet(_:)`. This method takes one paramter, the current bet as a `UInt`. This returns `true` if the bet is less than the player's `wallet`.
11. A method called `willHit(_:)`. This method takes one parameter, a `UInt` representing the current bet, and returns `true` if the player will take another card. This player is a bit foolhardy and will take another card if they can afford the bet and their hand size is below 21.
12. A method called `win(_:)`. This method takes one parameter, a `UInt`, that represents the amount the player has won. It should update the `wallet` property accordingly.
13. A method called `lose(_:)`. This method takes one parameter, a `UInt`, that represents the amount the player has lost. It should update the `wallet` property accordingly.

### `House`

The `House` class is defined in `House.swift`. `House` is a subclass of `Player`. Open that file and add these properties and methods to it:

1. Create an initializer that takes no parameters. It should call `super.init()` (the `Player` superclass's initializer) with the player name of "House".
2. Override `willHit(_:)`. Like its superclass's implementation, it takes one parameter, a `UInt` called `bet`. It should return `true` if the `House`'s current hand value is below 17.

### `Deck`

The `Deck` class is defined in `Deck.swift`. Open that file and add these properties and methods to it:

1. Add a property of type `[Card]` called `cards`. This stores all the cards in the deck.
2. Implement a `shuffle()` method that will shuffle the deck. (Note that a method called `shuffleInPlace()` has been implemented for you on `Array`s. This method will shuffle the elements of a _mutable_ array. You could, for example, call `cards.shuffleInPlace()` to shuffle the array of `Card`s.)
3. Implement a `drawCard()` method. This method should return a value of type `Card?`. If there are cards left in the deck, it should return the next card; otherwise, it should return `nil`.

### `Dealer`

The `Dealer` class is defined in `Dealer.swift`. Open that file and add these properties and methods to it:

1. Create a `deck` property of type `Deck` to store the deck used to play the game.
2. Create a `player` property of type `Player` to store the person who is playing the game.
3. Create a `house` property of type `House` to store the house participating in the game.
4. Create a `winner` property of type `Player?`. It should return the winner of the game if the game is over, or `nil` if the game is still in progress.
5. Create an initializer that takes no parameters. It should create a new deck, a new player named "Player", and a `House`.
6. Implement the method `deal()`. This will be the first deal of the game. The `player` should be dealt two cards, and the `house` should get two cards. If either player has blackjack (21), the `winner` property should be set to the winner of the game.
7. Implement a `turn(_:)` method. This should take a single parameter, `player`, which is the `Player` whose turn should be taken. The player should be dealt cards until they decide to stay (take no more cards).
8. Implement a method `award(_:)`. This method should give the winner the current bet, and deduct the current from the losing player.

### Finishing Up

You can run the test suite to make sure you have implemented the classes correctly. Select **Test** from the **Product** menu, or press <kbd>Command</kbd>-U. You will get a **Test Succeeded** message.

You can also run the app. There's no real UI, but you can see whether the house or player won the game by checking the consoler. (The game loop itself is implemented in `ViewController.swift`; you can read that to see how the game works.)

Good luck!

<a href='https://learn.co/lessons/ClassesMagic' data-visibility='hidden'>View this lesson on Learn.co</a>
