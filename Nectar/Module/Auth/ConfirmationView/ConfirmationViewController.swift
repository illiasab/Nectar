//
//  ConfirmationViewController.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/19/25.
//

import UIKit
import SnapKit
final class ConfirmationViewController: UIViewController{
    
    enum Event {
        case onNextTapped
        case back
    }
    var didSendEventHandler: ((Event) -> Void)?

    private lazy var backButton: UIButton = {
        let button = BackButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.didSendEventHandler?(.back)
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var header: UILabel = {
       let label = UILabel()
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 26)
        label.textColor = .customtoolBar
        label.text = Constants.confirmationTitle
        label.numberOfLines = 0
        return label
    }()
    private var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .promptGray
        label.textAlignment = .left
        label.text = Constants.confirmSubtitle
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
        
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.theme.onboarding.description
        textField.placeholder = "- - - -"
        textField.textColor = .black
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        
        return textField
    }()
    
    private lazy var resendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Resend Code", for: .normal)
        button.titleLabel?.applyCustomFont(.gilroy, weight: .medium, size: 18)
        button.setTitleColor(.launchGreen, for: .normal)
        return button
        
    }()
    
    private lazy var nextButton: NextButton = {
        let button = NextButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.didSendEventHandler?(.onNextTapped)
        }), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(backButton)
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().offset(26)
        }
        
        view.addSubview(header)
        header.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(65)
            $0.leading.equalTo(25)
        }
        view.addSubview(subtitle)
        subtitle.snp.makeConstraints{
            $0.top.equalTo(header.snp.bottom).offset(28)
            $0.leading.equalTo(25)
        }
        view.addSubview(textField)
        textField.snp.makeConstraints{
            $0.top.equalTo(subtitle.snp.bottom).offset(10)
            $0.leading.equalTo(29)
        }
        let bottomLine = UIView()
        bottomLine.backgroundColor = .grayDivieder
        view.addSubview(bottomLine)

        bottomLine.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(11)
            $0.leading.equalTo(textField.snp.leading)
            $0.trailing.equalTo(textField.snp.trailing)
            $0.height.equalTo(1)
            $0.width.equalTo(350)
        }
        
        view.addSubview(resendButton)
        resendButton.snp.makeConstraints{
            $0.top.equalTo(bottomLine.snp.bottom).offset(242)
            $0.leading.equalTo(25)
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalTo(bottomLine.snp.bottom).offset(210)
            $0.trailing.equalToSuperview().inset(25)
            $0.width.height.equalTo(67)
        }
    }
    
    func backButtonAction() {
        
    }
}


// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ConfirmationViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController =
        ConfirmationAssembly.configure(dependency)
        Group {
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Light")
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
#endif
