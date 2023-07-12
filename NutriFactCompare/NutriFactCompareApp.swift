//
//  NutriFactCompareApp.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/6/23.
//

import SwiftUI

@main
struct NutriFactCompareApp: App {
    @StateObject var mainViewModel: MainViewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainVIew()
            }
            .environmentObject(mainViewModel)
        }
    }
}
