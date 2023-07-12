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

struct CustomTextBodyDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}

struct CustomTextSymbolDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}

struct CustomTextTitleDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}

struct CustomTextTitle2Design: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}

struct CustomTextTitle3Design: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .background(Color.white)
    }
}

struct CustomTextLargeTitleDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .background(Color.white)
    }
}
