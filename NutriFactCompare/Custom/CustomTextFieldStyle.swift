//
//  CustomTextFieldStyle.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct CustomTextFieldStyle: ViewModifier {
    
    let colorTheme: ColorThemeProtocol = DefaultColorTheme()
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(colorTheme.primary)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
    }
}
