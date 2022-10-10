//
//  ContentView.swift
//  Slider Game
//
//  Created by Вячеслав Турчак on 10.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 0
    @State private var currentValue = 0.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                    .padding()
                Slider(value: $currentValue, in: 0...100, step: 1)
                Text("100")
                    .padding()
            }
            Button(action: {}) {
                Text("Проверь меня!")
            }
            .padding()
            Button(action: {}) {
                Text("Начать заново")
            }
            .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
