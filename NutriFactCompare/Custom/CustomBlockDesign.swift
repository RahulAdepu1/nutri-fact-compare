//
//  CustomBlockDesign.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/10/23.
//

import SwiftUI

struct CustomBlockDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct CustomPickerViewBlockDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct CustomMainBlockDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 15)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
