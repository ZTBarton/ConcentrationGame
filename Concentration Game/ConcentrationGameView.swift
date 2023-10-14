//
//  ContentView.swift
//  Concentration Game
//
//  Created by Zach Barton on 10/14/23.
//

import SwiftUI

struct ConcentrationGameView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text("🍆").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
            
        }
        .foregroundColor(.blue)
    }
}

#Preview {
    ConcentrationGameView()
}
