//
//  MemomrizeApp.swift
//  Memomrize
//
//  Created by Vibhu Dubey on 10/06/21.
//

import SwiftUI

@main
struct MemomrizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelView: game)
        }
    }
}
