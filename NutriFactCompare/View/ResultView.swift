//
//  ResultView.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30) {
                // Title with serv size
                HStack {
                    VStack {
                        Text("Item 1")
                            .modifier(CustomTextLargeTitleDesign())
                        HStack {
                            Text(mainViewModel.equalizeByServe()[8])
                                .modifier(CustomTextTitle3Design())
                            if (mainViewModel.servingSizeUnitType == "solid") {
                                Text("g")
                                    .modifier(CustomTextTitle3Design())
                            }else {
                                Text("ml")
                                    .modifier(CustomTextTitle3Design())
                            }
                        }
                    }
                    Spacer(minLength: 150)
                    VStack {
                        Text("Item 2")
                            .modifier(CustomTextLargeTitleDesign())
                        HStack{
                            Text(mainViewModel.equalizeByServe()[9])
                                .modifier(CustomTextTitle3Design())
                            if (mainViewModel.servingSizeUnitType == "solid") {
                                Text("g")
                                    .modifier(CustomTextTitle3Design())
                            }else {
                                Text("ml")
                                    .modifier(CustomTextTitle3Design())
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                // Price Compare
                VStack {
                    Text("Price")
                        .modifier(CustomTextTitle2Design())
                    HStack {
                        Text("$ "+mainViewModel.equalizeByServe()[0])
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[4] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[5] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[4] == "true" ? .blue :
                                            mainViewModel.diffValues()[5] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text("$ "+mainViewModel.diffValues()[0])
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[4] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[5] == "true" ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[4] == "true" ? .blue :
                                            mainViewModel.diffValues()[5] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text("$ "+mainViewModel.equalizeByServe()[1])
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
                // Proteins Compare
                
                VStack {
                    Text("Proteins")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[2]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[6] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[7] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[6] == "true" ? .blue :
                                            mainViewModel.diffValues()[7] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[1]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[6] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[7] == "true" ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[6] == "true" ? .blue :
                                            mainViewModel.diffValues()[7] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[3]+" g")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
                // Carbs Compare
                VStack {
                    Text("Carbs")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[4]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[8] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[9] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[8] == "true" ? .blue :
                                            mainViewModel.diffValues()[9] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[2]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[8] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[9] == "true" ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[8] == "true" ? .blue :
                                            mainViewModel.diffValues()[9] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[5]+" g")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
                // Fats Compare
                VStack {
                    Text("Fats")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[6]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[10] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[11] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[10] == "true" ? .blue :
                                            mainViewModel.diffValues()[11] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[3]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[10] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[11] == "true" ? "equal.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[10] == "true" ? .blue :
                                            mainViewModel.diffValues()[11] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[7]+" g")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
            }
            .padding(15)
            .modifier(CustomMainBlockDesign())
            .padding(.bottom, 50)
            
            Button {
                
            } label: {
                Text("Done")
                    .modifier(CustomActionButtonDesign())
            }

        }
    }
    
    func priceDifference() -> String {
        return "$6"
    }
    
    func proteinsDifference() -> String {
        return "$6"
    }
    
    func carbsDifference() -> String {
        return "$6"
    }
    
    func fatsDifference() -> String {
        return "$6"
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ResultView()
        }
        .environmentObject(MainViewModel())
    }
}
