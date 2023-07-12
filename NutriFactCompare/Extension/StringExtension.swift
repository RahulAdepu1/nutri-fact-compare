//
//  StringExtension.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/11/23.
//

import SwiftUI

extension String {
    var stringToDouble: Double {
        return (Double(self) ?? 0.0)
    }
}
