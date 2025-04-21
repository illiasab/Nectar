//
//  SignInViewController.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/24/25.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController{
    private var email: String = ""
    private var password: String = ""
    
    enum Event {
        case forgot
        case signUp
    }
    var didSendEventHandler: ((SignInViewController.Event) -> Void)?
    
    
    private lazy  var headerView: UIView = {
        let carrotIcon = UIImageView(image: UIImage(named: ImageName.mainIcon))
        carrotIcon.contentMode = .scaleAspectFit
        carrotIcon.clipsToBounds = true
        return carrotIcon
    }()
    private lazy var backgroundView: UIView = {
        let back = UIImageView(image: UIImage(named: ImageName.authBackgroundImage))
        back.contentMode = .scaleAspectFill
        back.clipsToBounds = true
        back.layer.frame = CGRect(x: 0, y: 0, width: 415, height: 303)
        return back
    }()
    
    private lazy var bottomView: UIView = {
        let back = UIImageView(image: UIImage(named: ImageName.authBottom))
        back.contentMode = .scaleAspectFill
        back.clipsToBounds = true
        back.layer.frame = CGRect(x: 0, y: 0, width: 414, height: 303)
        return back
    }()
    
    private let titleText : UILabel = {
        let label  = UILabel()
        label.textColor = .customtoolBar
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 26)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = Constants.logInTitle
        return label
        
    }()
    
    private let subtitleText : UILabel = {
        let label  = UILabel()
        label.textColor = .promptGray
        label.applyCustomFont(.gilroy, weight: .medium, size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = Constants.logSubTitle
        return label
    }()
    
    private  var emailLabel: UILabel = {
        let textFieldLabel = UILabel()
        textFieldLabel.textColor = .promptGray
        textFieldLabel.applyCustomFont(.gilroy, weight: .semiBold, size: 16)
        textFieldLabel.textAlignment = .left
        textFieldLabel.numberOfLines = 0
        textFieldLabel.text = Constants.email
        return textFieldLabel
        
    }()
    
    private  var PasswordLabel: UILabel = {
        let textFieldLabel = UILabel()
        textFieldLabel.textColor = .promptGray
        textFieldLabel.applyCustomFont(.gilroy, weight: .semiBold, size: 16)
        textFieldLabel.textAlignment = .left
        textFieldLabel.numberOfLines = 0
        textFieldLabel.text = Constants.password
        return textFieldLabel
        
    }()
    
    
    private lazy  var ForgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.customtoolBar, for: .normal)
        button.titleLabel?.applyCustomFont(.gilroy, weight: .medium, size: 14)
        button.setTitle(Constants.forgotPassword, for: .normal)
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    private lazy var SignInButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.applyCustomFont(.gilroy, weight: .semiBold, size: 18)
        button.backgroundColor = .launchGreen
        button.layer.cornerRadius = 19
        button.snp.makeConstraints{
            $0.height.equalTo(67)
            $0.width.equalTo(364)
        }
        button.setTitle(Constants.logIn, for: .normal)
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.launchGreen, for: .normal)
        button.titleLabel?.applyCustomFont(.gilroy, weight: .medium, size: 14)
        button.setTitle(Constants.signUpButton, for: .normal)
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        let label = UILabel()
        label.textColor = .customtoolBar
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 14)
        label.textAlignment = .center
        label.text = Constants.noAccount
        
        button.addSubview(label)
        label.snp.makeConstraints{
            $0.trailing.equalTo(button.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
        }
        return button
    }()
    
    //MARK: - Textfield
    private lazy var textField: UITextField = {
        
        let textField = UITextField()
        textField.font = UIFont.theme.onboarding.buttonTitle
        textField.textColor = .customtoolBar
        textField.textAlignment = .left
        textField.placeholder = "email Adress"
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .grayDivieder
        textField.addSubview(bottomLine)
        bottomLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().offset(-2)
            $0.bottom.equalToSuperview().offset(10)
            $0.width.equalTo(355)
        }
        
        return textField
    }()
    
    private lazy var SecureField: UITextField = {
        
        let textField = UITextField()
        textField.font = UIFont.theme.onboarding.buttonTitle
        textField.textColor = .customtoolBar
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        textField.rightView = UIImageView(image: UIImage(systemName: "eye.slash"))
        
        let toggleButton = UIButton(type: .system)
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        toggleButton.tintColor = .gray
        toggleButton.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.width.equalTo(30)
        }
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightView = toggleButton
        textField.rightViewMode = .always
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .grayDivieder
        textField.addSubview(bottomLine)
        bottomLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().offset(-2)
            $0.bottom.equalToSuperview().offset(10)
            $0.width.equalTo(355)
        }
        
        return textField
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let backView = backgroundView
        view.addSubview(backView)
        
        let  blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backView.frame
        backView.addSubview(blurEffectView)
        
        backView.addSubview(headerView)
        headerView.snp.makeConstraints{
            $0.height.equalTo(56)
            $0.width.equalTo(48)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(85)
        }
        
        
        let headerStack = UIStackView(arrangedSubviews: [titleText, subtitleText])
        headerStack.axis = .vertical
        headerStack.alignment = .leading
        headerStack.spacing = 26
        headerStack.distribution = .fill
        backView.addSubview(headerStack)
        headerStack.snp.makeConstraints{
            $0.bottom.equalTo(backView.snp.bottom).offset(-12)
            $0.left.equalToSuperview().offset(26)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(27)
        }
        view.addSubview(textField)
        textField.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(27)
            
        }
        
        view.addSubview(PasswordLabel)
        PasswordLabel.snp.makeConstraints{
            $0.top.equalTo(textField.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(27)
        }
        view.addSubview(SecureField)
        SecureField.snp.makeConstraints{
            $0.top.equalTo(PasswordLabel.snp.bottom).offset(30)
            
            $0.leading.equalToSuperview().offset(27)
        }
        view.addSubview(ForgotPasswordButton)
        ForgotPasswordButton.snp.makeConstraints{
            $0.top.equalTo(SecureField.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().offset(-20)
            
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            
        }
        let  blurBottom = UIBlurEffect(style: .light)
        let blurBottomView = UIVisualEffectView(effect: blurBottom)
        blurBottomView.frame = bottomView.frame
        bottomView.addSubview(blurBottomView)
        
        bottomView.addSubview(SignInButton)
        SignInButton.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(-5)
            $0.top.equalTo(ForgotPasswordButton.snp.bottom).offset(30)
        }
        
        bottomView.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.snp.makeConstraints{
            $0.top.equalTo(SignInButton.snp.bottom).offset(25)
            $0.trailing.equalToSuperview().offset(-100)
        }

        
    }
    
    @objc private func togglePasswordVisibility() {
        SecureField.isSecureTextEntry.toggle()
        
        if let button = SecureField.rightView as? UIButton {
            let imageName = SecureField.isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    
    @objc  private func forgotTapped() {
        didSendEventHandler?(.forgot)
    }
    @objc  private func signUpTapped() {
        // signUp action
        DispatchQueue.main.async {
            self.didSendEventHandler?(.signUp)
        }
    }
    
    
}


// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SignInViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController = LogInAssembly.configure(dependency)
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
