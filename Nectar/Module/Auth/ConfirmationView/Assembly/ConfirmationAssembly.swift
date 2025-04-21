//
//  ConfirmationAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/19/25.
//

import UIKit
final class ConfirmationAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getConfirmationView()
    }
}
