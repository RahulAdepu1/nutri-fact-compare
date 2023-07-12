//
//  ServingSize.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import Foundation

struct SolidServingSizeUnit: Identifiable {
    let id = UUID().uuidString
    let servUnit: String
    
    static let servingSizeUnitList = [
        SolidServingSizeUnit(servUnit: "gm"),
        SolidServingSizeUnit(servUnit: "oz"),
        SolidServingSizeUnit(servUnit: "mg")
    ]
}

struct LiquidServingSizeUnit: Identifiable {
    let id = UUID().uuidString
    let servUnit: String
    
    static let servingSizeUnitList = [
        LiquidServingSizeUnit(servUnit: "ml"),
        LiquidServingSizeUnit(servUnit: "fl oz")
    ]
}

struct ServingSizeUnitType: Identifiable {
    let id = UUID().uuidString
    let type: String
    
    static let servingSizeUnitList = [
        ServingSizeUnitType(type: "solid"),
        ServingSizeUnitType(type: "liquid")
    ]
}

