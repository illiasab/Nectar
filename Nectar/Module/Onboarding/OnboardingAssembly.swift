//
//  OnboardingAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/23/25.
//

import UIKit
final class OnboardingAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getOnboardingView()
    }

}
