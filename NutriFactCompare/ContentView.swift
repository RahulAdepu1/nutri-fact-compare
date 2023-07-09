//
//  ContentView.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/6/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var rows: [[String]] = [[]]

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                Text("Price")
                Text("Prot")
                Text("Carb")
                Text("Fat")

                ForEach(rows, id: \.self) { row in
                    ForEach(row, id: \.self) { value in
                        TextField("Enter value", text: .constant(value))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
            }
            .padding()
            
            Button(action: {
                rows.append(Array(repeating: "", count: 4))
            }) {
                Text("Add Row")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
