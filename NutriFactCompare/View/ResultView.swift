//
//  ResultView.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import SwiftUI

struct ResultView: View {
    
    @StateObject private var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 25) {
                // Title with serv size
                HStack {
                    VStack {
                        Text("Item 1")
                            .modifier(CustomTextLargeTitleDesign())
                        Text("ServSize")
                            .modifier(CustomTextTitle3Design())
                    }
                    Spacer(minLength: 150)
                    VStack {
                        Text("Item 2")
                            .modifier(CustomTextLargeTitleDesign())
                        Text("ServSize")
                            .modifier(CustomTextTitle3Design())
                    }
                }
                .padding(.horizontal, 10)
                
                // Price Compare
                VStack {
                    Text("Price")
                        .modifier(CustomTextTitle2Design())
                    HStack {
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(.green)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.red)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                
                // Proteins Compare
                
                VStack {
                    Text("Proteins")
                    HStack {
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(.green)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.red)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                
                // Carbs Compare
                VStack {
                    Text("Carbs")
                    HStack {
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "equal.circle.fill")
                            .foregroundColor(.blue)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "equal.circle.fill")
                            .foregroundColor(.blue)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                
                // Fats Compare
                VStack {
                    Text("Fats")
                    HStack {
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(.green)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.red)
                            .modifier(CustomTextSymbolDesign())
                        Text("$6")
                            .modifier(CustomTextBodyDesign())
                    }
                }
                .padding(.horizontal, 20)
                
            }
            .padding(15)
            .frame(width: UIScreen.main.bounds.width - 32, height: 500)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
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
        ResultView()
    }
}
