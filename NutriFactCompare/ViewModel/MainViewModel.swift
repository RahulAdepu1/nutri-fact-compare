//
//  MainViewModel.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/8/23.
//

import Foundation

protocol DataEntryProtocol {
    var allDataEntered: Bool { get }
}

class MainViewModel:ObservableObject {
    
    @Published var price1 = ""
    @Published var price2 = ""
    @Published var servSize1 = ""
    @Published var servSize2 = ""
    @Published var proteins1 = ""
    @Published var proteins2 = ""
    @Published var carbs1 = ""
    @Published var carbs2 = ""
    @Published var fats1 = ""
    @Published var fats2 = ""
    
    @Published var servUnit1 = ServingSizeUnit.servingSizeUnitList[0].servUnit
    @Published var servUnit2 = ServingSizeUnit.servingSizeUnitList[0].servUnit
    @Published var equalizeUnitList = EqualizeUnit.equalizeUnitList[0].equalizeUnit
    
    // Unwrapping all Textfield data in Double
    func getUnwrappedPrice1() -> Double {
        return Double(price1) ?? 0.0
    }
    
    func getUnwrappedPrice2() -> Double {
        return Double(price2) ?? 0.0
    }
    
    func getUnwrappedSize1() -> Double {
        return Double(servSize1) ?? 0.0
    }
    
    func getUnwrappedSize2() -> Double {
        return Double(servSize2) ?? 0.0
    }
    
    func getUnwrappedProtein1() -> Double {
        return Double(proteins1) ?? 0.0
    }
    
    func getUnwrappedProtein2() -> Double {
        return Double(proteins2) ?? 0.0
    }
    
    func getUnwrappedCarb1() -> Double {
        return Double(carbs1) ?? 0.0
    }
    
    func getUnwrappedCarb2() -> Double {
        return Double(carbs2) ?? 0.0
    }
    
    func getUnwrappedFat1() -> Double {
        return Double(fats1) ?? 0.0
    }
    
    func getUnwrappedFat2() -> Double {
        return Double(fats2) ?? 0.0
    }
    
    // Calculate Solid Serve Size
    func calSolidServSize1() -> Double {
        var serveSize = 0.0
        switch servUnit1 {
        case "oz":
            serveSize = (Double(servSize1) ?? 0.0) * 28.3495
        case "mg":
            serveSize = (Double(servSize1) ?? 0.0) / 1000
        default:
            serveSize = Double(servSize1) ?? 0.0
        }
        return serveSize
    }
    
    func calSolidServSize2() -> Double {
        var serveSize = 0.0
        switch servUnit2 {
        case "oz":
            serveSize = (Double(servSize2) ?? 0.0) * 28.3495
        case "mg":
            serveSize = (Double(servSize2) ?? 0.0) / 1000
        default:
            serveSize = Double(servSize2) ?? 0.0
        }
        return serveSize
    }
    
    // Calculate Liquid Serve Size
    func calLiquidServSize1() -> Double {
        var serveSize = 0.0
        switch servUnit1 {
        case "fl oz":
            serveSize = (Double(servSize1) ?? 0.0) / 29.574
        default:
            serveSize = Double(servSize1) ?? 0.0
        }
        return serveSize
    }
    
    func calLiquidServSize2() -> Double {
        var serveSize = 0.0
        switch servUnit2 {
        case "fl oz":
            serveSize = (Double(servSize2) ?? 0.0) / 29.574
        default:
            serveSize = Double(servSize2) ?? 0.0
        }
        return serveSize
    }
    
    
    // Variables
    var multiplier = 0.0
    var priceCal1 = 0.0
    var proteinsCal1 = 0.0
    var carbsCal1 = 0.0
    var fatsCal1 = 0.0
    var priceCal2 = 0.0
    var proteinsCal2 = 0.0
    var carbsCal2 = 0.0
    var fatsCal2 = 0.0
    
    // Calculate Solid Serve Size
    /*
     Equalize the solid serve size and
     calculate the price, proteins, carbs and fats
     */
    func equalizeSolidSerSizeMultiplier() {
        
        if calSolidServSize1() > calSolidServSize2() {
            multiplier = calSolidServSize1() / calSolidServSize2()
            // Do Not change any values of 1 as Item 1 is greater than Item 2
            priceCal1 = getUnwrappedPrice1()
            proteinsCal1 = getUnwrappedProtein1()
            carbsCal1 = getUnwrappedCarb1()
            fatsCal1 = getUnwrappedFat1()
            
            // Change the values based on multiplier
            priceCal2 = getUnwrappedPrice2() * multiplier
            proteinsCal2 = getUnwrappedProtein2() * multiplier
            carbsCal2 = getUnwrappedCarb2() * multiplier
            fatsCal2 = getUnwrappedFat2() * multiplier
        } else {
            multiplier = calSolidServSize2() / calSolidServSize1()
            // Change the values based on multiplier
            priceCal1 = getUnwrappedPrice1() * multiplier
            proteinsCal1 = getUnwrappedProtein1() * multiplier
            carbsCal1 = getUnwrappedCarb1() * multiplier
            fatsCal1 = getUnwrappedFat1() * multiplier
            
            // Do Not change any values of 1 as Item 2 is greater than Item 1
            priceCal2 = getUnwrappedPrice2()
            proteinsCal2 = getUnwrappedProtein2()
            carbsCal2 = getUnwrappedCarb2()
            fatsCal2 = getUnwrappedFat2()
        }
    }
    
    // Calculate Liquid Serve Size
    /*
     Equalize the liquid serve size and
     calculate the price, proteins, carbs and fats
     */
    func equalizeLiquidSerSizeMultiplier() {
        
        if calLiquidServSize1() > calLiquidServSize2() {
            multiplier = calLiquidServSize1() / calLiquidServSize2()
            // Do Not change any values of 1 as Item 1 is greater than Item 2
            priceCal1 = getUnwrappedPrice1()
            proteinsCal1 = getUnwrappedProtein1()
            carbsCal1 = getUnwrappedCarb1()
            fatsCal1 = getUnwrappedFat1()
            
            // Change the values based on multiplier
            priceCal2 = getUnwrappedPrice2() * multiplier
            proteinsCal2 = getUnwrappedProtein2() * multiplier
            carbsCal2 = getUnwrappedCarb2() * multiplier
            fatsCal2 = getUnwrappedFat2() * multiplier
            
        } else {
            multiplier = calLiquidServSize2() / calLiquidServSize1()
            // Change the values based on multiplier
            priceCal1 = getUnwrappedPrice1() * multiplier
            proteinsCal1 = getUnwrappedProtein1() * multiplier
            carbsCal1 = getUnwrappedCarb1() * multiplier
            fatsCal1 = getUnwrappedFat1() * multiplier
            
            // Do Not change any values of 1 as Item 2 is greater than Item 1
            priceCal2 = getUnwrappedPrice2()
            proteinsCal2 = getUnwrappedProtein2()
            carbsCal2 = getUnwrappedCarb2()
            fatsCal2 = getUnwrappedFat2()
        }
    }
    
    func resultCalulator() -> [String] {
        var multiplier = 0.0
        
        // If the user has choosen to qualize by Price
        if equalizeUnitList == "Price" {
            if priceCal1 > priceCal2 {
                multiplier = priceCal1 / priceCal2
                // Change the values based on multiplier
                priceCal2 = priceCal2 * multiplier
                proteinsCal2 = proteinsCal2 * multiplier
                carbsCal2 = carbsCal2 * multiplier
                fatsCal2 = fatsCal2 * multiplier
                
            } else if priceCal2 > priceCal1 {
                multiplier = priceCal2 / priceCal1
                // Change the values based on multiplier
                priceCal1 = priceCal1 * multiplier
                proteinsCal1 = proteinsCal1 * multiplier
                carbsCal1 = carbsCal1 * multiplier
                fatsCal1 = fatsCal1 * multiplier
            }
        
        // If the user has choosen to qualize by Protein
        } else if equalizeUnitList == "Protein" {
            if proteinsCal1 > proteinsCal2 {
                multiplier = proteinsCal1 / proteinsCal2
                // Change the values based on multiplier
                priceCal2 = priceCal2 * multiplier
                proteinsCal2 = proteinsCal2 * multiplier
                carbsCal2 = carbsCal2 * multiplier
                fatsCal2 = fatsCal2 * multiplier
                
            } else if proteinsCal2 > proteinsCal1 {
                multiplier = proteinsCal2 / proteinsCal1
                // Change the values based on multiplier
                priceCal1 = priceCal1 * multiplier
                proteinsCal1 = proteinsCal1 * multiplier
                carbsCal1 = carbsCal1 * multiplier
                fatsCal1 = fatsCal1 * multiplier
            }
            
        // If the user has choosen to qualize by Carbs
        } else if equalizeUnitList == "Carbs" {
            if carbsCal1 > carbsCal2 {
                multiplier = carbsCal1 / carbsCal2
                // Change the values based on multiplier
                priceCal2 = priceCal2 * multiplier
                proteinsCal2 = proteinsCal2 * multiplier
                carbsCal2 = carbsCal2 * multiplier
                fatsCal2 = fatsCal2 * multiplier
                
            } else if carbsCal2 > carbsCal1 {
                multiplier = carbsCal2 / carbsCal1
                // Change the values based on multiplier
                priceCal1 = priceCal1 * multiplier
                proteinsCal1 = proteinsCal1 * multiplier
                carbsCal1 = carbsCal1 * multiplier
                fatsCal1 = fatsCal1 * multiplier
            }
            
        // If the user has choosen to qualize by Fats
        } else if equalizeUnitList == "Fats" {
            if fatsCal1 > fatsCal2 {
                multiplier = fatsCal1 / fatsCal2
                // Change the values based on multiplier
                priceCal2 = priceCal2 * multiplier
                proteinsCal2 = proteinsCal2 * multiplier
                carbsCal2 = carbsCal2 * multiplier
                fatsCal2 = fatsCal2 * multiplier
                
            } else if fatsCal2 > fatsCal1 {
                multiplier = fatsCal2 / fatsCal1
                // Change the values based on multiplier
                priceCal1 = priceCal1 * multiplier
                proteinsCal1 = proteinsCal1 * multiplier
                carbsCal1 = carbsCal1 * multiplier
                fatsCal1 = fatsCal1 * multiplier
            }
        }
        
        return [
            String(priceCal1),
            String(priceCal2),
            String(proteinsCal1),
            String(proteinsCal2),
            String(carbsCal1),
            String(carbsCal2),
            String(fatsCal1),
            String(fatsCal2)
        ]
    }
}
