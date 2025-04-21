//
//  NumberAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/20/25.
//

import UIKit
final class NumberAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getNumberAuthView()
    }
}
