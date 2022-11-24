//
//  Calculator.swift
//  calculator
//
//  Created by ciro forchetta on 20/11/22.
//

import Foundation
struct Calculator {
    private struct ArithmeticExpression: Equatable {
            var number: Decimal
            var operation: ArithmeticOperation

            func evaluate(with secondNumber: Decimal) -> Decimal {
                switch operation {
                case .addition:
                    return number + secondNumber
                case .subtraction:
                    return number - secondNumber
                case .multiplication:
                    return number * secondNumber
                case .division:
                    return number / secondNumber
                }
            }
        }
    private var carryingNegative: Bool = false
       private var carryingDecimal: Bool = false
       private var carryingZeroCount: Int = 0

    private var newNumber: Decimal?
    private var expression: ArithmeticExpression?
    private var result: Decimal?

      
       var displayText: String {
           return getNumberString(forNumber: number, withCommas: true)
       }

       
       private var number: Decimal? {
           newNumber ?? expression?.number ?? result
       }
    
    var DisplayText: String {
        return "0"
    }
    
    mutating func setDigit(_ digit: Digit) {
           // 1.
           guard canAddDigit(digit) else { return }
           // 2.
           let numberString = getNumberString(forNumber: newNumber)
           // 3.
           newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
       }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var number = newNumber ?? result else { return }
                // 2.
                if let existingExpression = expression {
                    number = existingExpression.evaluate(with: number)
                }
                // 3.
                expression = ArithmeticExpression(number: number, operation: operation)
                // 4.
                newNumber = nil
    }
    
    mutating func toggleSign() {
        
    }
    
    mutating func setPercent() {
        
    }
    
    mutating func setDecimal() {
        
    }
    
    mutating func evaluate() {
       
               guard let number = newNumber, let expressionToEvaluate = expression else { return }
              
               result = expressionToEvaluate.evaluate(with: number)
              
               expression = nil
               newNumber = nil
        
    }
    
    mutating func allClear() {
        newNumber = nil
                expression = nil
                result = nil
                carryingNegative = false
                carryingDecimal = false
                carryingZeroCount = 0
    }
    
    mutating func clear() {
        
    }
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
            return expression?.operation == operation && newNumber == nil
        }
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
          return (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
      }

      private func canAddDigit(_ digit: Digit) -> Bool {
          return number != nil || digit != .zero
      }
}
