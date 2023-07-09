//
//  ServingSize.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import Foundation

struct ServingSizeUnit: Identifiable {
    let id = UUID().uuidString
    let servUnit: String
    
    static let servingSizeUnitList = [
        ServingSizeUnit(servUnit: "oz"),
        ServingSizeUnit(servUnit: "mg"),
        ServingSizeUnit(servUnit: "gm"),
        ServingSizeUnit(servUnit: "ml"),
        ServingSizeUnit(servUnit: "fl oz")
    ]
}
