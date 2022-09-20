//
//  ContentView.swift
//  СloserToTheTruth
//
//  Created by Алексей on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    
    @State private var showAlert = false
    
    private var score: Int {
        computeScore()
    }
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding(.bottom, 16)
            HStack {
                Text("0")
                
                SliderUIKit(
                    value: $currentValue,
                    opacity: score
                )
                
                Text("100")
            }
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(score.formatted())}
            .padding()
            
            
            Button("Начать заново") {
                currentValue = 0.0
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
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
