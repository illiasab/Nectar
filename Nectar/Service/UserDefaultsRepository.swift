//
//  UserDefaultsRepository.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/23/25.
//

import Foundation

protocol IUserDefaultsRepository {
    var isOnboardingCompleteBefore: Bool { get }
    func setOnboardingComplete()
}

struct UserDefaultsRepository: IUserDefaultsRepository {
    private let container: UserDefaults
    
    init(container: UserDefaults) {
        self.container = container
    }
    
    var isOnboardingCompleteBefore: Bool {
        return container.bool(forKey: UserDefaultsKey.onboardingComplete)
    }
    
    var isSetMyCountry: Bool {
        return container.value(forKey: UserDefaultsKey.myCountry).debugDescription.isEmpty
    }
    
    func setOnboardingComplete() {
        container.set(true, forKey: UserDefaultsKey.onboardingComplete)
    }
}
