//
//  Theme.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/20/25.
//

import UIKit

extension UIColor {
    static let theme = ColorTheme()
}
extension UIFont {
    static let theme = FontTheme()
}

struct ColorTheme {
    let launchColor = UIColor(named: "LaunchGreen")!
    
}

struct FontTheme {
    let onboarding = OnboardingFont()
    let statistic = StatisticViewFont()
    let alter = alterVCFont()
    let searchCountry = SearchCountryVCFont()
    let allCountry = AllCountryVCFont()
}
extension FontTheme {
    struct OnboardingFont {
        static let titleFontSize: CGFloat = Support.isIphoneSEFirstGeneration ? 40 : 48
        static let descriptionFontSize: CGFloat = Support.isIphoneSEFirstGeneration ? 16 : 16
        let title = UIFont.systemFont(ofSize: titleFontSize, weight: .heavy)
        let description = UIFont.systemFont(ofSize: descriptionFontSize, weight: .semibold)
        let buttonTitle = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }

    struct StatisticViewFont {

    }

    struct AllCountryVCFont {
        let section = UIFont.systemFont(ofSize: 20, weight: .heavy)
    }

    struct alterVCFont {
        let altermainLabel = UIFont.systemFont(ofSize: 26, weight: .heavy)
    }
    struct SearchCountryVCFont {
        let topLabel = UIFont.systemFont(ofSize: 16, weight: .semibold)
        let notFoundLabel = UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
}
