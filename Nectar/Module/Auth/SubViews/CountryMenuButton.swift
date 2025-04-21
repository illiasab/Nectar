//
//  CountryMenuButton.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/20/25.
//

import UIKit

final class CountryMenuButton: UIButton {
    
    var onSelect: ((Country) -> Void)?

    private var countries: [Country] = []

    init(countries: [Country] = Country.allCases) {
        super.init(frame: .zero)
        self.countries = countries
        setup()
        updateMenu()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.countries = Country.allCases
        setup()
        updateMenu()
    }

    private func setup() {
        setTitle("🇹🇷 +90", for: .normal)
        setTitleColor(.label, for: .normal)
        titleLabel?.applyCustomFont(.gilroy, weight: .medium, size: 18)
        contentHorizontalAlignment = .left
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor

        showsMenuAsPrimaryAction = true
    }

    private func updateMenu() {
        let actions = countries.map { country in
            UIAction(title: "\(country.flag) \(country.code)", handler: { [weak self] _ in
                self?.setTitle("\(country.flag) \(country.code)", for: .normal)
                self?.onSelect?(country)
            })
        }
        menu = UIMenu(title: "", options: .displayInline, children: actions)
    }
}
