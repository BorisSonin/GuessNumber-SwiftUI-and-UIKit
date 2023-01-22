//
//  DecimalSliderView.swift
//  SliderSwiftUI+UIKit
//
//  Created by Борис Сонин on 20.01.2023.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
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
        
       
       
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha))

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
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
        SliderView(value: .constant(30), alpha: 1)
    }
}

