//
//  Card.swift
//  Padry
//
//  Created by Eduardo Ceron on 29/07/21.
//

import Foundation
struct Card{
    let card: String
    let game: String
    let rule: String
    
    init(c: String, g: String, r: String) {
        card = c
        game = g
        rule = r
    }
}
