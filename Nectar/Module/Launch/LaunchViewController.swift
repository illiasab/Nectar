//
//  ViewController.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/17/25.
//

import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    enum Event{
        case launchComplete
    }
var didSendEventHandler:((LaunchViewController.Event)-> Void)?
    var isShowOnboardingBefore: Bool = false
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: ImageName.onboardingImageFirst)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    private lazy var animator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    private lazy var imageYOffset: CGFloat = Support.isIphoneSEFirstGeneration ? 75 : 480
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if isShowOnboardingBefore {
            showLaunchToMainFlowAnimation()
        } else {
            showLaunchToOnboardingAnimation()
        }
        // Do any additional setup after loading the view.
    }
    
    private lazy var stackView: UIStackView = {
        let mainTitle = UILabel()
        let subTitle = UILabel()
        mainTitle.text = Constants.launchTitleText
        subTitle.text  = Constants.launchSubtitleText
        mainTitle.font = UIFont.systemFont(ofSize: 53, weight: .bold)
        mainTitle.textColor = .white
        subTitle.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        
        subTitle.textColor = .white
        let stackView = UIStackView(arrangedSubviews: [mainTitle, subTitle])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = -5
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme.launchColor
        view.addSubview(imageView)
      
        imageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(70)
            
        }
        stackView.snp.makeConstraints{
            $0.width.equalTo(180)
            $0.left.equalTo(imageView.snp.right).offset(-9)
            
        }
    }
    
    private func showLaunchToOnboardingAnimation() {
        animator.addAnimations {
            let transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: -130, y: self.imageYOffset)
                self.imageView.transform = transform
                self.stackView.transform = transform
            }
        animator.addCompletion { position in
            switch position {
            case .end: self.didSendEventHandler?(.launchComplete)
            case .start, .current: break
            @unknown default: break
            }
        }
        animator.startAnimation(afterDelay: 1.0)
    }
    private func showLaunchToMainFlowAnimation() {
        animator.addAnimations {
            let transform  = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: -130, y: self.imageYOffset)
            self.imageView.transform = transform
            self.stackView.transform = transform
            self.imageView.alpha = 0
        }
        animator.addCompletion { position in
            switch position {
            case .end: self.didSendEventHandler?(.launchComplete)
            case .start, .current: break
            @unknown default: break
            }
        }
        animator.startAnimation(afterDelay: 1.0)
    }
    
    

}



// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct LaunchViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = Dependencies()
        let viewController = LaunchAssembly.configure(dependency)
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
