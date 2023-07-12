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
                            Text(mainViewModel.equalizeByServe()[6])
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
                            Text(mainViewModel.equalizeByServe()[7])
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
                
                // Proteins Compare
                VStack {
                    Text("Proteins")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[0]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[3] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[4] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[3] == "true" ? .blue :
                                            mainViewModel.diffValues()[4] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[0]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[3] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[4] == "true" ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[3] == "true" ? .blue :
                                            mainViewModel.diffValues()[4] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[1]+" g")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
                // Carbs Compare
                VStack {
                    Text("Carbs")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[2]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[5] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[6] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[5] == "true" ? .blue :
                                            mainViewModel.diffValues()[6] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[1]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[5] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[6] == "true" ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[5] == "true" ? .blue :
                                            mainViewModel.diffValues()[6] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[3]+" g")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                .modifier(CustomBlockDesign())
                
                // Fats Compare
                VStack {
                    Text("Fats")
                    HStack {
                        Text(mainViewModel.equalizeByServe()[4]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[7] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[8] == "true" ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                        .foregroundColor(mainViewModel.diffValues()[7] == "true" ? .blue :
                                            mainViewModel.diffValues()[8] == "true" ? .green : .red )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.diffValues()[2]+" g")
                            .modifier(CustomTextBodyDesign())
                        Image(
                            systemName: mainViewModel.diffValues()[7] == "true" ? "equal.circle.fill" :
                                mainViewModel.diffValues()[8] == "true" ? "equal.down.fill" : "arrowtriangle.up.fill" )
                        .foregroundColor(mainViewModel.diffValues()[7] == "true" ? .blue :
                                            mainViewModel.diffValues()[8] == "true" ? .red : .green )
                        .modifier(CustomTextSymbolDesign())
                        Text(mainViewModel.equalizeByServe()[5]+" g")
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
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ResultView()
        }
        .environmentObject(MainViewModel())
    }
}
