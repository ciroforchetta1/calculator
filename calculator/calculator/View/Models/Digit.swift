//
//  Digit.swift
//  calculator
//
//  Created by ciro forchetta on 17/11/22.
//

import Foundation
enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    //Make it conform to the CaseIterable protocol so we can easily be able to get an ordered array of all cases using its property Digit.allCases.Make it conform to the CustomStringConvertible. This protocol requires you to add description property. We will use this as our button text.

    
    var description: String {
        "\(rawValue)"
    }
}
