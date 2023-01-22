//
//  ContentView.swift
//  SliderSwiftUI+UIKit
//
//  Created by Борис Сонин on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100) //целевое значение
    @State private var currentValue = Double.random(in: 0...100) //текущее значение слайдера
    @State private var alpha = 0.5

    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                
                SliderView(value: $currentValue, alpha: alpha)
                    .onChange(of: currentValue) { newValue in
                        setThumbOpacity()
                    }
                
                Text("100")
            }
            .frame(width: 350)
            
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Ваш результат"),
                      message: Text("\(computeScore())")
                )
            }
            .padding()
            Button(action: {
                startAgain()
                
            }) {
                Text("Начать заново")
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func startAgain() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
    
    private func setThumbOpacity() {
        alpha = Double(computeScore()) / 100
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
