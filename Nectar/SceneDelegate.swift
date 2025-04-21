//
//  SceneDelegate.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/17/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var dependencies: IDependencies = Dependencies()
    private var coordinator: AppCoordinatorProtocol?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configureScene(windowScene)
        dependencies.analyticsReporterService.reportEvent(with: "Launch Event", parameters: nil)
    }
    
    private func configureScene(_ windowScene: UIWindowScene) {
        let navController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        coordinator = AppCoordinator(navController, dependencies: dependencies)
        coordinator?.start()
    }

}

