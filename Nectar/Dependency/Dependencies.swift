//
//  Dependencies.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/17/25.
//

import Foundation

protocol IDependencies {
    var moduleContainer: IModuleContainer { get }
    var userDefaultsRepository: IUserDefaultsRepository  {get}
    var analyticsReporterService: IAnalyticsReporterService { get }
    
}

final class Dependencies: IDependencies {
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository  = UserDefaultsRepository(container: UserDefaults.standard)
    lazy var analyticsReporterService: IAnalyticsReporterService = AnalyticsReporterService()
}
