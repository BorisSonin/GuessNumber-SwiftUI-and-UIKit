//
//  DecimalSliderView.swift
//  SliderSwiftUI+UIKit
//
//  Created by Борис Сонин on 20.01.2023.
//

import SwiftUI

struct DecimalSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.tintColor = .green
        slider.value = Float(value)

        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.changedValue),
                         for: .valueChanged)
        
        slider.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha))
       
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension DecimalSliderView {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double> ) {
            self._value = value
        }
        @objc func changedValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct DecimalSliderView_Previews: PreviewProvider {
    static var previews: some View {
        DecimalSliderView(value: .constant(30), alpha: 1)
    }
}

