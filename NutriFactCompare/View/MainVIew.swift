//
//  MainVIew.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct MainVIew: View {
    
    @StateObject private var mainViewModel: MainViewModel = MainViewModel()
    
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
                        TextField("price", text: $mainViewModel.price1)
                            .modifier(CustomTextFieldStyle())
                        TextField("price", text: $mainViewModel.price2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Serv. Size")
                            .modifier(CustomTextDesign())
                        TextField("size", text: $mainViewModel.servSize1)
                            .modifier(CustomTextFieldStyle())
                        TextField("size", text: $mainViewModel.servSize2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Proteins")
                            .modifier(CustomTextDesign())
                        TextField("proteins", text: $mainViewModel.proteins1)
                            .modifier(CustomTextFieldStyle())
                        TextField("proteins", text: $mainViewModel.proteins2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Carbs")
                            .modifier(CustomTextDesign())
                        TextField("carbs", text: $mainViewModel.carbs1)
                            .modifier(CustomTextFieldStyle())
                        TextField("carbs", text: $mainViewModel.carbs2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 20) {
                        Text("Fats")
                            .modifier(CustomTextDesign())
                        TextField("fats", text: $mainViewModel.fats1)
                            .modifier(CustomTextFieldStyle())
                        TextField("fats", text: $mainViewModel.fats2)
                            .modifier(CustomTextFieldStyle())
                    }
                }
                .padding(15)
                .frame(width: UIScreen.main.bounds.width - 32, height: 500)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding(.bottom, 50)
                
                Button {
                    // Clear all
                    mainViewModel.price1 = ""
                    mainViewModel.price2 = ""
                    mainViewModel.servSize1 = ""
                    mainViewModel.servSize2 = ""
                    mainViewModel.proteins1 = ""
                    mainViewModel.proteins2 = ""
                    mainViewModel.carbs1 = ""
                    mainViewModel.carbs2 = ""
                    mainViewModel.fats1 = ""
                    mainViewModel.fats2 = ""
                } label: {
                    Text("Clear all")
                        .modifier(CustomActionButtonDesign())
                }

                
                NavigationLink {
                    ResultView()
                } label: {
                    Text("Compare")
                        .modifier(CustomActionButtonDesign())
                        .opacity(allDataEntered ? 1.0 : 0.5)
                }
                .disabled(!allDataEntered)
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

extension MainVIew: DataEntryProtocol {
    var allDataEntered: Bool {
        !mainViewModel.price1.isEmpty
        && !mainViewModel.price2.isEmpty
        && !mainViewModel.servSize1.isEmpty
        && !mainViewModel.servSize2.isEmpty
        && !mainViewModel.proteins1.isEmpty
        && !mainViewModel.proteins2.isEmpty
        && !mainViewModel.carbs1.isEmpty
        && !mainViewModel.carbs2.isEmpty
        && !mainViewModel.fats1.isEmpty
        && !mainViewModel.fats2.isEmpty
    }
}


// Color Themes
struct DefaultColorTheme: ColorThemeProtocol {
    var primary: Color = .white
    var secondary: Color = .black.opacity(0.3)
    var tertiary: Color = .orange.opacity(0.3)
}
