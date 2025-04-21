//
//  OnboardingViewController.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/23/25.
//


import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    enum Event {
        case onboardingComplete
    }
    var didSendEventHandler: ((OnboardingViewController.Event) -> Void)?
    private lazy var imageYOffset: CGFloat = Support.isIphoneSEFirstGeneration ? -128 : -138
    
    private lazy var appearAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    private lazy var dismissAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 0.1, curve: .linear)
    }()
    
    private lazy var backgroundImageView: UIImageView = {
          let imageView = UIImageView(image: UIImage(named: ImageName.onboardingImageSecond))
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
    
    private lazy var iconView:UIView = {
        let imageView = UIImageView(image: UIImage(named: ImageName.onboardingImageFirst))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
      
      private lazy var nextButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle(Constants.getStartedText, for: .normal)
          button.titleLabel?.font = UIFont.theme.onboarding.buttonTitle
          button.titleLabel?.textAlignment = .right
          button.setTitleColor(UIColor.white, for: .normal)
          button.backgroundColor = .launchGreen
          button.layer.cornerRadius = 20
          button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
          return button
      }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimator.startAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    private func setupUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { $0.edges.equalToSuperview()
            $0.bottom.edges.equalToSuperview().dividedBy(2)
            $0.centerX.edges.equalToSuperview()
        }
        
        view.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60 * 6.6)
            $0.centerX.equalToSuperview()
        }
        
        let textStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStack.axis = .vertical
        textStack.alignment = .center
        textStack.spacing = 8
        view.addSubview(textStack)
        
        textStack.snp.makeConstraints {
            $0.top.equalTo(iconView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
    }
    
       @objc private func nextButtonTapped() {
           animateTransition()
       }
       
       private func animateTransition() {
           UIView.animate(withDuration: 0.5, animations: {
               self.backgroundImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
               self.nextButton.alpha = 0
           }) { _ in
               self.dismiss()
           }
       }
       
       func dismiss() {
           didSendEventHandler?(.onboardingComplete)
       }
}

// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct OnboardingViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController = OnboardingAssembly.configure(dependency)
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
