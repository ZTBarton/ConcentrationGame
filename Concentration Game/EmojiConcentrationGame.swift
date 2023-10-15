//
//  EmojiConcentrationGame.swift
//  Concentration Game
//
//  Created by Zach Barton on 10/14/23.
//

import SwiftUI

@Observable class EmojiConcentrationGame {
    
//    MARK: - Properties
        
    static let emojis = ["🫑", "🍑", "🐋", "🐡", "👑", "🪱", "🧈"];

    private var game = createGame()
    private var isVisible = false
    
    static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { emojis[$0] }
    }
    
//    MARK: - Model access
        
    var dealtCards: Array<ConcentrationGame<String>.Card> {
        isVisible ? game.cards : []
    }
    
    var score: Int {
        game.score
    }
    
//    MARK: - User intents
    
    func dealCards() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)) {
            isVisible = true
        }
    }
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        withAnimation(.easeIn(duration: Constants.animationDuration)) {
            game.choose(card: card)
        }
    }
    
    func newGame() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)) {
            isVisible = false
            game = EmojiConcentrationGame.createGame()
        }
        dealCards()
    }
    
    private struct Constants {
        static let animationDuration = 0.5
    }
}
