//
//  ContentView.swift
//  Slider Game
//
//  Created by Вячеслав Турчак on 10.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 0
    @State private var currentValue = 0
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
