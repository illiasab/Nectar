//
//  AuthCoordinator.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/21/25.
//

import UIKit

protocol AuthCoordinatorProtocol: Coordinator {
    func start()
}

final class AuthCoordinator: AuthCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .auth}
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showAlterView()
    }
    
    func showAlterView(){
       let AlterView  = AuthAssembly.configure(dependencies)
        let navVC = UINavigationController(rootViewController: AlterView )
        if let window  = UIApplication.shared.windows.filter({$0.isKeyWindow}).first{
            window.rootViewController = navVC
            UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
            
        } else {
            navVC.modalPresentationStyle = .fullScreen
            navigationController.showDetailViewController(navVC, sender: self)
        }
        
    }
}
