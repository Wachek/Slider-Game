//
//  ContentView.swift
//  Slider Game
//
//  Created by Вячеслав Турчак on 10.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var score = 0
    @State private var alertPresented = false
    @State private var alpha: CGFloat = 1
    
    var body: some View {
        VStack {
            Text("\(currentValue)")
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                    .padding()
                RedSlider(currentValue: $currentValue, alpha: $alpha, targetValue: $targetValue)
                    .onChange(of: currentValue) { newValue in
                        currentValue = newValue
                    }
//                Slider(value: $currentValue, in: 0...100, step: 1)
                Text("100")
                    .padding()
            }
            Button("Проверь меня!", action: checkResult)
                .alert("Ваши очки:", isPresented: $alertPresented) {
                    Button("OK") {}
                } message: {
                    Text("\(score)")
                }
            .padding()
            Button(action: startNewGame) {
                Text("Начать заново")
            }
            .padding()
        }
    }
    
    private func checkResult() {
        score = computeScore()
        alertPresented.toggle()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func startNewGame() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
