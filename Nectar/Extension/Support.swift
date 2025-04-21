//
//  Support.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/20/25.
//

import UIKit

enum Support {
    static let isIphoneSEFirstGeneration: Bool = {
        return UIDevice.current.userInterfaceIdiom == .phone &&
        max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) == 568
    }()
}
