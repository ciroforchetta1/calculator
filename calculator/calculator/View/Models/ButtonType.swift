//
//  ButtonType.swift
//  calculator
//
//  Created by ciro forchetta on 17/11/22.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible { //This protocol will let us iterate over an array of ButtonTypes later on.
    
    case digit(_ digit: Digit)
        case operation(_ operation: ArithmeticOperation)
        case negative
        case percent
        case decimal
        case equals
        case allClear
        case clear
    var description: String {
            switch self {
            case .digit(let digit):
                return digit.description
            case .operation(let operation):
                return operation.description
            case .negative:
                return "±"
            case .percent:
                return "%"
            case .decimal:
                return "."
            case .equals:
                return "="
            case .allClear:
                return "AC"
            case .clear:
                return "C"
            }
        }
    //colorbutton
    var backgroundColor: Color {
            switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(.lightGray) //lightGray
            case .operation, .equals:
                return .orange
            case .digit, .decimal:
                return .secondary
            }
        }
        //colortext
        var foregroundColor: Color {
            switch self {
            case .allClear, .clear, .negative, .percent:
                return .black
            default:
                return .white
            }
        }
}
