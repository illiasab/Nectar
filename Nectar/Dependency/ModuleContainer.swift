//
//  ModuleContainer.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/17/25.
//

import UIKit

protocol IModuleContainer {
    func getLaunchView() -> UIViewController
    func getOnboardingView() -> UIViewController
    func getAuthView() -> UIViewController
    func getSignInView() -> UIViewController
    func getConfirmationView() -> UIViewController
    func getNumberAuthView() -> UIViewController
    
//    func getAllCountryView() -> UIViewController
//    func getMyCountryView() -> UIViewController
//    func getSearchCountryView() -> UIViewController
}

final class ModuleContainer: IModuleContainer {
    private let dependencies: IDependencies
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}

extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchViewController()
    }
}

extension ModuleContainer {
    func getOnboardingView() -> UIViewController {
        return OnboardingViewController()
    }
}

extension ModuleContainer {
    func getAuthView() -> UIViewController {
        let view = SignInAlternativeViewController()
        let numberAuthVC =  NumberAssembly.configure(dependencies)
        let confirmVC =  ConfirmationAssembly.configure(dependencies)
        let logInVC =  LogInAssembly.configure(dependencies)
        view.contollers = [numberAuthVC, confirmVC, logInVC]
        view.startIndex = 0
        return view
    }
}

extension ModuleContainer{
    func getSignInView() -> UIViewController {
        return SignInViewController()
    }
}

extension ModuleContainer {
    func getConfirmationView() -> UIViewController {
        return ConfirmationViewController()
    }
}

extension ModuleContainer{
    func getNumberAuthView() -> UIViewController {
        return NumberAuthViewController()
    }
}
