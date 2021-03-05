//
//  Theme.swift
//  MemoryGame
//
//  Created by Luís Felipe Polo on 03/03/21.
//

import Foundation
import SwiftUI

struct EmojiTheme {
    var name: String
    var emojis: [String]
    var color: Color
    var randomNumberOfCards: Bool
    
    func cardContentFactory(pairIndex: Int) -> String {
        return emojis[pairIndex]
    }
    
    static let sportsGame = EmojiTheme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"], color: .green, randomNumberOfCards: true)
    static let flagsGame = EmojiTheme(name: "Flags", emojis: ["🇧🇷", "🇻🇬", "🇨🇲", "🇨🇦", "🇨🇱", "🇹🇩", "🇭🇷", "🇩🇪", "🇫🇷", "🇭🇺", "🇯🇵", "🇰🇵", "🇵🇹", "🇺🇾", "🇻🇪", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇸🇾"], color: .blue, randomNumberOfCards: true)
    static let halloweenGame = EmojiTheme(name: "Halloween", emojis: ["😀", "😪", "😝", "😷", "😍", "🥵", "👻", "☠️", "👽"], color: .orange, randomNumberOfCards: false)
    
    static var themes = [sportsGame, flagsGame, halloweenGame]
}


