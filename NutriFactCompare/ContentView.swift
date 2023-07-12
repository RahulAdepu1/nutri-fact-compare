//
//  ContentView.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/6/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        VStack {
            Text("Value")
            Text(mainViewModel.getUnwrappedPrice1().doubleToString1decimal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
        .environmentObject(MainViewModel())
    }
}
