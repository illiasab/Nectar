//
//  Font.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/17/25.
//

import Foundation
import UIKit


import UIKit

enum FontWeight {
    case light
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
}

enum FontFamily: String {
    case gilroy = "Gilroy"
}

extension UIFont {
    static func customFont(_ family: FontFamily, weight: FontWeight, size: CGFloat) -> UIFont {
        let fontName: String
        
        switch weight {
        case .light:
            fontName = "\(family.rawValue)-Light"
        case .regular:
            fontName = "\(family.rawValue)-Regular"
        case .medium:
            fontName = "\(family.rawValue)-Medium"
        case .semiBold:
            fontName = "\(family.rawValue)-SemiBold"
        case .bold:
            fontName = "\(family.rawValue)-Bold"
        case .extraBold:
            fontName = "\(family.rawValue)-ExtraBold"
        }
        
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

extension UILabel {
    func applyCustomFont(_ family: FontFamily, weight: FontWeight, size: CGFloat) {
        self.font = UIFont.customFont(family, weight: weight, size: size)
    }
}
