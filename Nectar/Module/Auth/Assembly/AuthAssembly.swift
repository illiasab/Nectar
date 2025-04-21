//
//  AlterAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/24/25.
//

import UIKit
final class AuthAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getAuthView()
    }
}
