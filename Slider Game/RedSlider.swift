//
//  RedSlider.swift
//  Slider Game
//
//  Created by Вячеслав Турчак on 11.10.2022.
//

import SwiftUI

struct RedSlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var alpha: CGFloat
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: alpha)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderChanged),
            for: .allTouchEvents
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        let alpha: CGFloat
        alpha = CGFloat(Double(computeScore()) / 100)
        uiView.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

extension RedSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct RedSlider_Previews: PreviewProvider {
    static var previews: some View {
        RedSlider(currentValue: .constant(50), alpha: .constant(0.1), targetValue: .constant(12))
    }
}
