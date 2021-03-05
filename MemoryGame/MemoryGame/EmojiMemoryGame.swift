//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Luís Felipe Polo on 13/02/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    var theme : EmojiTheme
    
    init() {
        self.theme = EmojiTheme.themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    private static func createMemoryGame(with theme: EmojiTheme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 3..<theme.emojis.count), cardContentFactory: {
            pairIndex in theme.emojis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var themeColor: Color {
        return theme.color
    }
    
    var score: Int {
        return model.score
    }
    
    var themeName: String {
        return theme.name
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        theme = EmojiTheme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
