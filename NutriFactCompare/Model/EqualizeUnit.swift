//
//  EqualizeUnit.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import Foundation

struct EqualizeUnit: Identifiable {
    let id = UUID().uuidString
    let equalizeUnit: String
    
    static let equalizeUnitList = [
        EqualizeUnit(equalizeUnit: "Price"),
        EqualizeUnit(equalizeUnit: "Protein"),
        EqualizeUnit(equalizeUnit: "Carbs"),
        EqualizeUnit(equalizeUnit: "Fats")
    ]
}
