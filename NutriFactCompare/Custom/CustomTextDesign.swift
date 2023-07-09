//
//  CustomTextDesign.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct CustomTextDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
    
struct CustomTextDesign1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 50)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct CustomTextDesign2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .multilineTextAlignment(.center)
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct CustomTextDesign3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}

struct CustomTextDesign4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}
