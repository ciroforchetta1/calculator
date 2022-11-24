//
//  calculatorApp.swift
//  calculator
//
//  Created by ciro forchetta on 16/11/22.
//

import SwiftUI

@main
struct calculatorApp: App {
    var body: some Scene {
        WindowGroup {
           _CalculatorView()
                .environmentObject(_CalculatorView.ViewModel())
            
        }
    }
}
