//
//  Extensions.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import Foundation
import SwiftUI

extension Color {
    /// Extension for hex color initialization support
    init(hex: String) {
        if hex == "AccentColor" || hex == "MaximumYellow" || hex == "Green" || hex == "Tangerine" || hex == "SuperPink" || hex == "SkyBlue" || hex == "TartRed" || hex == "ArsenicGray" || hex == "LightGray" {
            self.init(hex)
        } else {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
                case 3: // RGB (12-bit)
                    (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
                case 6: // RGB (24-bit)
                    (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
                case 8: // ARGB (32-bit)
                    (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
                default:
                    (a, r, g, b) = (1, 1, 1, 0)
            }
            
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
        
        
    }
}
