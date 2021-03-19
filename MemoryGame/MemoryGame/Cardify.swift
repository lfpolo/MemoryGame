//
//  Cardify.swift
//  MemoryGame
//
//  Created by Luís Felipe Polo on 04/03/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isFaceUp: Bool {
        return rotation < 90
    }
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack{
                Group {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    content
                }
                    .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                    .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp : Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
