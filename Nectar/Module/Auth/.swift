//
//  CustomPickerView.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/18/25.
//

import UIKit

class CountryPickerViewController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var onCountrySelected: ((Country) -> Void)?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupScrollView()
        setupCountryButtons()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])

        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
    }

    private func setupCountryButtons() {
        for country in Country.allCases {
            let button = UIButton(type: .system)
            button.setTitle(country.displayName, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.contentHorizontalAlignment = .left
            button.backgroundColor = UIColor(white: 0.95, alpha: 1)
            button.layer.cornerRadius = 8
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true

            button.addAction(UIAction(handler: { [weak self] _ in
                self?.onCountrySelected?(country)
            }), for: .touchUpInside)
            button.isUserInteractionEnabled = true

            stackView.addArrangedSubview(button)
        }
    }
}
