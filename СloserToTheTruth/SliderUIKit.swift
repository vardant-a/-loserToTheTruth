//
//  SliderUIKit.swift
//  СloserToTheTruth
//
//  Created by Алексей on 19.09.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {

    @Binding var value: Double
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(0)
        slider.maximumValue = Float(100)
        slider.thumbTintColor = .systemRed.withAlphaComponent(CGFloat(opacity)/100)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .systemRed.withAlphaComponent(CGFloat(opacity)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        
        @objc func valueChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUIKit_Preview: PreviewProvider {
    static var previews: some View {
        SliderUIKit(value: .constant(73), opacity: 12)
            .padding()
    }
}
