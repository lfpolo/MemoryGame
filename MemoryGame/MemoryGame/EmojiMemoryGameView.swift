//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luís Felipe Polo on 13/02/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            Label("\(viewModel.themeName) Theme", systemImage: "")
                .labelStyle(TitleOnlyLabelStyle())
                .foregroundColor(viewModel.themeColor)
                .padding()
            Label("Score \(viewModel.score)", systemImage: "")
                .labelStyle(TitleOnlyLabelStyle())
                .foregroundColor(viewModel.themeColor)
                .padding()
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 3.5), {
                        viewModel.choose(card: card)
                    })
                }
                .padding(5)
            }
            .foregroundColor(viewModel.themeColor)
            .padding()
            Button(action: {
                withAnimation(.easeInOut(duration: 2)) {
                    viewModel.newGame()
                }
            }, label: { Text("New Game") })
                    
            .foregroundColor(viewModel.themeColor)
        .padding()
        }
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 3).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Drawing constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        game.choose(card: game.cards[1])
        return EmojiMemoryGameView(viewModel: game)
    }
}
