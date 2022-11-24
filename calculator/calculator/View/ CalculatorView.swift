//
//   CalculatorView.swift
//  calculator
//
//  Created by ciro forchetta on 16/11/22.
//

import SwiftUI

struct _CalculatorView: View {
    @EnvironmentObject private var viewModel: ViewModel

    var buttonTypes: [[ButtonType]] {
            [[.allClear, .negative, .percent, .operation(.division)],
             [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
             [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
             [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
             [.digit(.zero), .decimal, .equals]]
        }
        
    var body: some View {
            VStack {
                Spacer()
                           displayText
                           buttonPad
            }
            .padding(Constants.padding)
                .background(Color.black)
        }
    }

struct _CalculatorView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        _CalculatorView()
    
    }
}
//i create an extension to make everything a little clearer.

extension _CalculatorView {
    
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
           VStack (spacing: Constants.padding) {
               ForEach(buttonTypes, id: \.self) { row in
                   HStack {
                       ForEach(row, id: \.self) { buttonType in
                           CalculatorButton(buttonType: buttonType)
                               
                       }
                   }
               }
           }
       }
    }
