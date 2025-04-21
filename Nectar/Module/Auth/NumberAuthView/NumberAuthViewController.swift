//
//  Untitled.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 4/20/25.
//
import UIKit
import SnapKit

final class NumberAuthViewController: UIViewController {
    enum Event {
        case onNextTapped
        case back
        case test
    }
    var onCountrySelected: ((Country) -> Void)?
    var didSendEventHandler: ((Event) -> Void)?

    private lazy var backButton: UIButton = {
        let button = BackButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.didSendEventHandler?(.back)
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: NextButton = {
        let button = NextButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.didSendEventHandler?(.onNextTapped)
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var header: UILabel = {
       let label = UILabel()
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 26)
        label.textColor = .customtoolBar
        label.text = Constants.confirmAuth
        label.numberOfLines = 0
        return label
    }()
    private var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .promptGray
        label.textAlignment = .left
        label.text = Constants.confirmSubtitleAuth
        label.applyCustomFont(.gilroy, weight: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
        
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.theme.onboarding.description
        textField.placeholder = "number"
        textField.textColor = .black
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        
        return textField
    }()
    private lazy var countryMenuButton: CountryMenuButton = {
        let button = CountryMenuButton()
        button.onSelect = { [weak self] country in
            self?.onCountrySelected?(country)
        }
        return button
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(backButton)
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().offset(26)
        }
        view.addSubview(header)
        header.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(66)
            $0.leading.trailing.equalTo(25)
        }
        
        view.addSubview(subtitle)
        subtitle.snp.makeConstraints{
            $0.top.equalTo(header.snp.bottom).offset(28)
            $0.leading.trailing.equalTo(25)
        }
        
        let phoneInputStack = UIStackView(arrangedSubviews: [countryMenuButton, textField])
        phoneInputStack.axis = .horizontal
        phoneInputStack.spacing = 8
        phoneInputStack.alignment = .fill
        phoneInputStack.distribution = .fill

        view.addSubview(phoneInputStack)
        phoneInputStack.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom).offset(40)
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
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalTo(bottomLine.snp.bottom).offset(220)
            $0.trailing.equalToSuperview().inset(25)
            $0.width.height.equalTo(67)
        }

        
    }
}


// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct NumberAuthViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController =
        NumberAssembly.configure(dependency)
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
