//
//  SignInAlternativeViewController.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/24/25.
//

import UIKit
import SnapKit

final class SignInAlternativeViewController: UIViewController {
    enum Event {
        case onNumberVerificationTapped
    }
    var didSendEventHandler: ((SignInAlternativeViewController.Event) -> Void)?
    var onCountrySelected: ((Country) -> Void)?
    
    var contollers: [UIViewController] = []
    var startIndex = 0
    private lazy var imageYOffset: CGFloat = Support.isIphoneSEFirstGeneration ? -128 : -138
    
    private lazy var appearAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    private lazy var dismissAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 0.1, curve: .linear)
    }()
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ImageName.authalterImage))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.theme.onboarding.title
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.onboardingTitleMain
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.theme.onboarding.description
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.onboardingSubtitle
        return label
    }()
    
    private lazy var googleBookAuthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.googleAuth, for: .normal)
        button.titleLabel?.font = UIFont.theme.onboarding.buttonTitle
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .googleButton
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var GoogleIcon: UIView = {
        let googleIcon = UIImageView(image:UIImage(named:ImageName.googleIconImage))
        googleIcon.contentMode = .scaleAspectFit
        googleIcon.clipsToBounds = true
        return googleIcon
    }()
    
    private lazy var faceBookAuthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.facebookAuth, for: .normal)
        button.titleLabel?.font = UIFont.theme.onboarding.buttonTitle
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .facebook
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var mainTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.theme.alter.altermainLabel
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = Constants.alterMainTitle
        return label
    }()
    
    private lazy var facebookIcon: UIView = {
        let facebookImage = UIImageView(image:UIImage(named:ImageName.facebookIConImage))
        facebookImage.contentMode = .scaleAspectFit
        facebookImage.clipsToBounds = true
        return facebookImage
    }()
    
    
    private lazy var socialmediatitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.theme.onboarding.description
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.socialmediaAlter
        return label
    }()
    //MARK: - Toolbar
    private lazy var toolbarTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.theme.onboarding.description
        label.textColor = .customtoolBar
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.launchTitleText
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 1.3)
        return label
    }()
    
    private lazy  var toolbarIcon: UIView = {
        let carrotIcon = UIImageView(image: UIImage(named: ImageName.carrotIcon))
        carrotIcon.contentMode = .scaleAspectFit
        carrotIcon.clipsToBounds = true
        
        return carrotIcon
    }()
    
    
    //MARK: - Textfield
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.theme.onboarding.description
        textField.textColor = .black
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        
        return textField
    }()
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimator.startAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var countryMenuButton: CountryMenuButton = {
        let button = CountryMenuButton()
        button.onSelect = { [weak self] country in
            self?.onCountrySelected?(country)
        }
        return button
    }()

    //MARK: - Setup
    private func setupUI() {
        view.addSubview(topImageView)
        topImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(-190)
            $0.top.equalToSuperview().offset(-150)
            
            $0.bottom.equalToSuperview().offset(-450)
            $0.width.equalTo(10 * 90)
            $0.height.equalTo(500)
        }
        view.addSubview(toolbarTitle)
        toolbarTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview().offset(120)
        }
        view.addSubview(toolbarIcon)
        toolbarIcon.snp.makeConstraints{
            $0.top.equalToSuperview().offset(62)
            $0.centerX.equalTo(toolbarTitle.snp.trailing).offset(6)
            
        }
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints{
            $0.leading.equalTo(25)
            $0.top.equalTo(topImageView.snp.bottom)
        }
        
        let phoneInputStack = UIStackView(arrangedSubviews: [countryMenuButton, textField])
        phoneInputStack.axis = .horizontal
        phoneInputStack.spacing = 8
        phoneInputStack.alignment = .fill
        phoneInputStack.distribution = .fill

        view.addSubview(phoneInputStack)
        phoneInputStack.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(55)
        }

        countryMenuButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.bottom.equalTo(textField.snp.bottom).offset(20)
        }
        let bottomLine = UIView()
        bottomLine.backgroundColor = .grayDivieder
        view.addSubview(bottomLine)

        bottomLine.snp.makeConstraints {
            $0.top.equalTo(phoneInputStack.snp.bottom).offset(8)
            $0.leading.equalTo(phoneInputStack.snp.leading)
            $0.trailing.equalTo(phoneInputStack.snp.trailing)
            $0.height.equalTo(1)
        }


        
        view.addSubview(socialmediatitle)
        socialmediatitle.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textField.snp.bottom).offset(20)
        }
        
        let ButtonStack = UIStackView(arrangedSubviews: [googleBookAuthButton, faceBookAuthButton])
        ButtonStack.axis = .vertical
        ButtonStack.alignment = .center
        ButtonStack.spacing = 20
        ButtonStack.distribution = .fill
        view.addSubview(ButtonStack)
        
        ButtonStack.snp.makeConstraints {
            $0.top.equalTo(socialmediatitle.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        googleBookAuthButton.snp.makeConstraints{
            $0.width.equalTo(367)
            $0.height.equalTo(67)
        }
        faceBookAuthButton.snp.makeConstraints{
            $0.width.equalTo(367)
            $0.height.equalTo(67)
        }
        
        
        
        view.addSubview(GoogleIcon)
        GoogleIcon.snp.makeConstraints{
            $0.height.equalTo(24)
            $0.width.equalTo(22)
            $0.bottom.equalToSuperview().offset(-180)
            $0.centerX.equalToSuperview().offset(-130)
        }
        view.addSubview(facebookIcon)
        facebookIcon.snp.makeConstraints{
            $0.height.equalTo(24)
            $0.width.equalTo(12)
            $0.bottom.equalToSuperview().offset(-90)
            $0.centerX.equalToSuperview().offset(-131)
            
        }
    }
    
    
    @objc private func nextButtonTapped() {
        dismiss()
    }
    
    func dismiss() {
        didSendEventHandler?(.onNumberVerificationTapped)
    }
    
    // MARK: - UIPickerViewDataSource
    
    @objc func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SignInAlternativeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController =
        AuthAssembly.configure(dependency)
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

