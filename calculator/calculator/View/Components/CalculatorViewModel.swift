//
//  CalculatorViewModel.swift
//  calculator
//
//  Created by ciro forchetta on 20/11/22.
//

import Foundation
import Combine

extension _CalculatorView {
    final class ViewModel: ObservableObject {
        
       
        
        @Published private var calculator = Calculator()
        
    
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            [[.allClear, .negative, .percent, .operation(.division)],
             [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
             [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
             [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
             [.digit(.zero), .decimal, .equals]]
        }
        
       func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            }
        }
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
                   guard case .operation(let operation) = buttonType else { return false}
                   return calculator.operationIsHighlighted(operation)
               }
    }
}
