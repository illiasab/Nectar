//
//  Constants.swift
//  Nectar
//
//  Created by Ylyas Abdywahytow on 3/20/25.
//


import Foundation

enum API {
  //
}

enum Constants {
    static let onboardingTitleFirst = "Welcome"
    static let launchTitleText = "nectar"
    static let launchSubtitleText = "online groceriet"
    static let getStartedText = "Get Started"
    static let onboardingTitleMain = "Welcome \n to our store"
    static let onboardingSubtitle = "Get your groceries in as fast as one hour"
    static let googleAuth = "Continue with Google"
    static let facebookAuth = "Continue with Facebook"
    static let socialmediaAlter = "Or connect with social media"
    static let alterMainTitle = "Get your groceries\n with nectar"
    static let logIn = "Log In"
    static let logInTitle = "Loging"
    static let logSubTitle = "Enter your emails and password"
    static let email = "Email"
    static let password = "Password"
    static let forgotPassword = "Forgot Password?"
    static let noAccount = "Don't have an account?"
    static let signUpButton = "Signup"
    static let confirmationTitle = "Enter your 4-digit code"
    static let confirmSubtitle = "Code"
    static let confirmAuth = "Enter your mobile number"
    static let confirmSubtitleAuth = "Mobile Number"
}

enum ImageName {
    static let onboardingImageFirst = "LaunchImage"
    static let onboardingImageSecond = "onboardBackground"
    static let onboardingImageThird = "onboardingThird"
    static let authalterImage = "alternative"
    static let googleIconImage = "googleIcon"
    static let facebookIConImage =  "facebookIcon"
    static let carrotIcon = "carrotIcon"
    static let mainIcon = "main"
    static let authBackgroundImage = "authback"
    static let authBottom = "authBottom"
    static let backButton = "back"
}

enum SystemImageName {
    static let sliderVertical = "slider.vertical.3"
    static let sliderHorizontal = "slider.horizontal.3"
    static let next = "chevron.right"
}

enum UserDefaultsKey {
    static let onboardingComplete = "OnboardingComplete"
    static let myCountry = "MyCountry"
}

enum CoreDataConstant {
    static let summaryContainerName = "SummaryContainer"
    static let summaryEntityName = "SummaryEntity"
    static let worldContainerName: String = "WorldContainer"
    static let worldEntityName: String = "WorldEntity"
    static let detailCountryContainerName: String = "DetailCountryContainer"
    static let detailCountryEntityName: String = "DetailCountryEntity"
}
