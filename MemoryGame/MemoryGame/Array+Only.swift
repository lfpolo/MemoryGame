//
//  Array+Only.swift
//  MemoryGame
//
//  Created by Luís Felipe Polo on 03/03/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
