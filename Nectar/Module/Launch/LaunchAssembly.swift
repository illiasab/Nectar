//
//  LaunchAssembly.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/20/25.
//
import UIKit

final class LaunchAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getLaunchView()
    }
}
