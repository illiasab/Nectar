//
//  authAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/24/25.
//

import UIKit

final class LogInAssembly {
  static   func configure( _ dependencies: IDependencies) -> UIViewController {
        dependencies.moduleContainer.getSignInView()
    }
}
