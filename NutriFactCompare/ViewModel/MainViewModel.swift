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

    var servUnit1 = SolidServingSizeUnit.servingSizeUnitList[0].servUnit
    var servUnit2 = SolidServingSizeUnit.servingSizeUnitList[0].servUnit
    @Published var servingSizeUnitType = ServingSizeUnitType.servingSizeUnitList[0].type

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

    // Variables
    var serveSize1 = 0.0
    var serveSize2 = 0.0
    var multiplier = 0.0
    var priceCal1 = 0.0
    var proteinsCal1 = 0.0
    var carbsCal1 = 0.0
    var fatsCal1 = 0.0
    var priceCal2 = 0.0
    var proteinsCal2 = 0.0
    var carbsCal2 = 0.0
    var fatsCal2 = 0.0
    
    /*
     Step 2:
     Check if the item is solid or liquid (servingSizeUnitType)
     
     Step 3:
     If the item is solid then convert Serve Unit 1 to gm
     and if it is in liquid then convert everything to ml
     
     Step 4:
     If the item is solid then convert Serve Unit 2 to gm
     and if it is in liquid then convert everything to ml
     */
    func serveUnit() -> [String] {
        switch servingSizeUnitType {
        case "solid":
            return ["gm", "oz", "mg"]
        case "liquid":
            return ["ml", "fl oz"]
        default:
            return [""]
        }
    }
    
    // Serve Unit 1
    func calculateServingUnit1() -> Double {
        switch servingSizeUnitType {
        case "solid":
            switch servUnit1 {
            case "oz":
                serveSize1 = getUnwrappedSize1() * 28.3495
            case "mg":
                serveSize1 = getUnwrappedSize1() / 1000
            case "gm":
                serveSize1 = getUnwrappedSize1()
            default:
                serveSize1 = 0.0
            }
        case "liquid":
            switch servUnit1 {
            case "fl oz":
                serveSize1 = getUnwrappedSize1() / 29.574
            case "ml":
                serveSize1 = getUnwrappedSize1()
            default:
                serveSize1 = 0.0
            }
        default:
            print("Nothing")
        }
        
        return serveSize1
    }
    
    // Serve Unit 2
    func calculateServingUnit2() -> Double {
        switch servingSizeUnitType {
        case "solid":
            switch servUnit2 {
            case "oz":
                serveSize2 = getUnwrappedSize2() * 28.3495
            case "mg":
                serveSize2 = getUnwrappedSize2() / 1000
            case "gm":
                serveSize2 = getUnwrappedSize2()
            default:
                serveSize2 = 0.0
            }
        case "liquid":
            switch servUnit2 {
            case "fl oz":
                serveSize2 = getUnwrappedSize2() / 29.574
            case "ml":
                serveSize2 = getUnwrappedSize2()
            default:
                serveSize2 = 0.0
            }
        default:
            print("Nothing")
        }
        
        return serveSize2
    }
    
    /*
     Step 5:
     Equalize all the values based on serving size
     */
    func equalizeByServe() -> [String] {
        if calculateServingUnit1() > calculateServingUnit2() {
            // Do Not change any values of 1 as Item 1 is greater than Item 2
            multiplier = calculateServingUnit1() / calculateServingUnit2()
            
            serveSize1 = getUnwrappedSize1()
            priceCal1 = getUnwrappedPrice1()
            proteinsCal1 = getUnwrappedProtein1()
            carbsCal1 = getUnwrappedCarb1()
            fatsCal1 = getUnwrappedFat1()
            
            
            // Change the values based on multiplier
            serveSize2 = multiplier * getUnwrappedSize2()
            priceCal2 = multiplier * getUnwrappedPrice2()
            proteinsCal2 = multiplier * getUnwrappedProtein2()
            carbsCal2 = multiplier * getUnwrappedCarb2()
            fatsCal2 = multiplier * getUnwrappedFat2()
            
        } else if calculateServingUnit2() > calculateServingUnit1() {
            // Do Not change any values of 2 as Item 2 is greater than Item 1
            multiplier = calculateServingUnit2() / calculateServingUnit1()
            
            serveSize2 = getUnwrappedSize2()
            priceCal2 = getUnwrappedPrice2()
            proteinsCal2 = getUnwrappedProtein2()
            carbsCal2 = getUnwrappedCarb2()
            fatsCal2 = getUnwrappedFat2()
            
            // Change the values based on multiplier
            serveSize1 = multiplier * getUnwrappedSize1()
            priceCal1 = multiplier * getUnwrappedPrice1()
            proteinsCal1 = multiplier * getUnwrappedProtein1()
            carbsCal1 = multiplier * getUnwrappedCarb1()
            fatsCal1 = multiplier * getUnwrappedFat1()
            
        } else {
            serveSize1 = getUnwrappedSize1()
            priceCal1 = getUnwrappedPrice1()
            proteinsCal1 = getUnwrappedProtein1()
            carbsCal1 = getUnwrappedCarb1()
            fatsCal1 = getUnwrappedFat1()
            
            serveSize2 = getUnwrappedSize2()
            priceCal2 = getUnwrappedPrice2()
            proteinsCal2 = getUnwrappedProtein2()
            carbsCal2 = getUnwrappedCarb2()
            fatsCal2 = getUnwrappedFat2()
        }
        
        return [
            priceCal1.doubleToString1decimal,      // 0
            priceCal2.doubleToString1decimal,      // 1
            proteinsCal1.doubleToString1decimal,   // 2
            proteinsCal2.doubleToString1decimal,   // 3
            carbsCal1.doubleToString1decimal,      // 4
            carbsCal2.doubleToString1decimal,      // 5
            fatsCal1.doubleToString1decimal,       // 6
            fatsCal2.doubleToString1decimal,       // 7
            serveSize1.doubleToString1decimal,     // 8
            serveSize2.doubleToString1decimal      // 9
        ]
    }
    
    func diffValues() -> [String] {
        var priceDiff = 0.0
        var proteinsDiff = 0.0
        var carbsDiff = 0.0
        var fatsDiff = 0.0
        
        var priceEqual = "false"
        var proteinsEqual = "false"
        var carbsEqual = "false"
        var fatsEqual = "false"
        
        var price1High = "true"
        var proteins1High = "true"
        var carbs1High = "true"
        var fats1High = "true"

        // If price 1 is greater than price 2
        if equalizeByServe()[0].stringToDouble > equalizeByServe()[1].stringToDouble {
            priceDiff = equalizeByServe()[0].stringToDouble - equalizeByServe()[1].stringToDouble
            // If price 2 is bigger than price 1
        } else if equalizeByServe()[1].stringToDouble > equalizeByServe()[0].stringToDouble {
            price1High = "false"
            priceDiff = equalizeByServe()[1].stringToDouble - equalizeByServe()[0].stringToDouble
            // If price 1 is equal to price 2
        } else {
            priceEqual = "true"
        }

        // If proteins 1 is greater than proteins 2
        if equalizeByServe()[2].stringToDouble > equalizeByServe()[3].stringToDouble {
            proteinsDiff = equalizeByServe()[2].stringToDouble - equalizeByServe()[3].stringToDouble
            // If proteins 2 is bigger than proteins 1
        } else if equalizeByServe()[3].stringToDouble > equalizeByServe()[2].stringToDouble {
            proteins1High = "false"
            proteinsDiff = equalizeByServe()[3].stringToDouble - equalizeByServe()[2].stringToDouble
            // If proteins 1 is equal to proteins 2
        } else {
            proteinsEqual = "true"
        }

        // If carbs 1 is greater than carbs 2
        if equalizeByServe()[4].stringToDouble > equalizeByServe()[5].stringToDouble {
            carbsDiff = equalizeByServe()[4].stringToDouble - equalizeByServe()[5].stringToDouble
            // If carbs 2 is bigger than carbs 1
        } else if equalizeByServe()[5].stringToDouble > equalizeByServe()[4].stringToDouble {
            carbs1High = "false"
            carbsDiff = equalizeByServe()[5].stringToDouble - equalizeByServe()[4].stringToDouble
            // If carbs 1 is equal to carbs 2
        } else {
            carbsEqual = "true"
        }
        
        // If fats 1 is greater than fats 2
        if equalizeByServe()[6].stringToDouble > equalizeByServe()[7].stringToDouble {
            fatsDiff = equalizeByServe()[6].stringToDouble - equalizeByServe()[7].stringToDouble
            // If fats 2 is bigger than fats 1
        } else if equalizeByServe()[7].stringToDouble > equalizeByServe()[6].stringToDouble {
            fats1High = "false"
            fatsDiff = equalizeByServe()[7].stringToDouble - equalizeByServe()[6].stringToDouble
            // If fats 1 is equal to fats 2
        } else {
            fatsEqual = "true"
        }


        return [
            priceDiff.doubleToString1decimal,      // 0
            proteinsDiff.doubleToString1decimal,   // 1
            carbsDiff.doubleToString1decimal,      // 2
            fatsDiff.doubleToString1decimal,       // 3
            
            priceEqual,             // 4
            price1High,             // 5
            
            proteinsEqual,          // 6
            proteins1High,          // 7
            
            carbsEqual,             // 8
            carbs1High,             // 9
            
            fatsEqual,              // 10
            fats1High,              // 11
        ]
    }
}
