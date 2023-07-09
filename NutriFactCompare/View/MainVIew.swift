//
//  MainVIew.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct MainVIew: View {
    
    @State var price: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                        Text("Item 1")
                            .modifier(CustomTextDesign())
                        Text("Item 2")
                            .modifier(CustomTextDesign())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Price")
                            .modifier(CustomTextDesign())
                        TextField("price", text: $price)
                            .modifier(CustomTextFieldStyle())
                        TextField("price", text: $price)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Serv. Size")
                            .modifier(CustomTextDesign())
                        TextField("size", text: $price)
                            .modifier(CustomTextFieldStyle())
                        TextField("size", text: $price)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Proteins")
                            .modifier(CustomTextDesign())
                        TextField("proteins", text: $price)
                            .modifier(CustomTextFieldStyle())
                        TextField("proteins", text: $price)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Carbs")
                            .modifier(CustomTextDesign())
                        TextField("carbs", text: $price)
                            .modifier(CustomTextFieldStyle())
                        TextField("carbs", text: $price)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Fats")
                            .modifier(CustomTextDesign())
                        TextField("fats", text: $price)
                            .modifier(CustomTextFieldStyle())
                        TextField("fats", text: $price)
                            .modifier(CustomTextFieldStyle())
                    }
                }
                .padding(15)
                .frame(width: UIScreen.main.bounds.width - 32, height: 500)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding(.bottom, 50)
                
                NavigationLink {
                    ResultView()
                } label: {
                    Text("Compare")
                        .modifier(CustomActionButtonDesign())
                }
            }
            .navigationTitle("Compare Products")
        }
    }
}

struct MainVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainVIew()
    }
}


// Color Themes
struct DefaultColorTheme: ColorThemeProtocol {
    var primary: Color = .white
    var secondary: Color = .black.opacity(0.3)
    var tertiary: Color = .orange.opacity(0.3)
}
