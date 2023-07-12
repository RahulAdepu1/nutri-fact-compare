//
//  MainVIew.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct MainVIew: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        
                        Picker(selection: $mainViewModel.servingSizeUnitType,
                               label: Text("Picker")
                        ) {
                            ForEach(ServingSizeUnitType.servingSizeUnitList) { unit in
                                Text(unit.type).tag(unit.type)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .modifier(CustomPickerViewBlockDesign())
                    }
                    .padding(.horizontal, 20)
                    
                    // Title
                    HStack(spacing: 20) {
                        Text("")
                            .frame(maxWidth: .infinity)
                        Text("Item 1")
                            .modifier(CustomTextDesign())
                        Text("Item 2")
                            .modifier(CustomTextDesign())
                    }
                    
                    // Serving Size
                    HStack(spacing: 20) {
                        Text("Serv. Size")
                            .modifier(CustomTextDesign())
                        VStack {
                            TextField("size", text: $mainViewModel.servSize1)
                                .modifier(CustomTextFieldStyle())
                            Picker(selection: $mainViewModel.servUnit1,
                                   label: Text("Picker")
                            ) {
                                ForEach(mainViewModel.serveUnit(), id:\.self) { unit in
                                    Text(unit).tag(unit)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .modifier(CustomPickerViewBlockDesign())
                        }
                        VStack {
                            TextField("size", text: $mainViewModel.servSize2)
                                .modifier(CustomTextFieldStyle())
                            Picker(selection: $mainViewModel.servUnit2,
                                   label: Text("Picker")
                            ) {
                                ForEach(mainViewModel.serveUnit(), id:\.self) { unit in
                                    Text(unit).tag(unit)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .modifier(CustomPickerViewBlockDesign())
                        }
                    }
                    .frame(height: 100)
                    
                    // Proteins
                    HStack(spacing: 20) {
                        Text("Proteins")
                            .modifier(CustomTextDesign())
                        TextField("proteins", text: $mainViewModel.proteins1)
                            .modifier(CustomTextFieldStyle())
                        TextField("proteins", text: $mainViewModel.proteins2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    // Carbs
                    HStack(spacing: 20) {
                        Text("Carbs")
                            .modifier(CustomTextDesign())
                        TextField("carbs", text: $mainViewModel.carbs1)
                            .modifier(CustomTextFieldStyle())
                        TextField("carbs", text: $mainViewModel.carbs2)
                            .modifier(CustomTextFieldStyle())
                    }
                    
                    // Fats
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
                .modifier(CustomMainBlockDesign())
                .padding(.bottom, 50)
                
                Button {
                    // Clear all
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
        NavigationStack{
            MainVIew()
        }
        .environmentObject(MainViewModel())
    }
}

extension MainVIew: DataEntryProtocol {
    var allDataEntered: Bool {
        !mainViewModel.servSize1.isEmpty
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
