//
//  BackButton.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/20/25.
//

import UIKit
import SnapKit

final class BackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        setImage(UIImage(named:ImageName.backButton), for: .normal)
        tintColor = .customtoolBar

        translatesAutoresizingMaskIntoConstraints = false
    }
}
