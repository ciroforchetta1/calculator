//
//  CalculatorButton.swift
//  calculator
//
//  Created by ciro forchetta on 18/11/22.
//To make the code cleaner, I created this code for the buttons

import SwiftUI

extension _CalculatorView {
    struct CalculatorButton: View {
        
        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: ViewModel
        var body: some View {
            Button(buttonType.description) {
                            viewModel.performAction(for: buttonType)
                        }
            
            
                            .buttonStyle(CalculatorButtonStyle(
                                size: 87,
                                backgroundColor: getBackgroundColor(),
                                                   foregroundColor: getForegroundColor(),
                                isWide: buttonType == .digit(.zero))
                            )
            
            
        }
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        private func getBackgroundColor() -> Color {
                    return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
                }

                private func getForegroundColor() -> Color {
                    return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
                }
    }
}

struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        _CalculatorView.CalculatorButton(buttonType: .digit(.five))
    }
}
