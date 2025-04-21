//
//  NextButton.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/20/25.
//

import UIKit
import SnapKit

final class NextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        setImage(UIImage(systemName: SystemImageName.next), for: .normal)
        tintColor = .white
        backgroundColor = .launchGreen
        layer.cornerRadius = 33.5

        translatesAutoresizingMaskIntoConstraints = false
    }
}
