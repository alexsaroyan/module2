//
//  SceneDelegate.swift
//  work 6
//
//  Created by Alex Saroyan on 14.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // Check if the user has seen the Onboarding page before
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "HasSeenOnboarding")
        
        // Set the root view controller based on whether the user has seen Onboarding or not
        if hasSeenOnboarding {
            // User has seen Onboarding before, show MainPageViewController
            let mainPageVC = MainPageViewController() // Assuming MainPageViewController is compatible with being a root view controller
            
            // Embed MainPageViewController inside a UINavigationController
            let navController = UINavigationController(rootViewController: mainPageVC)
            window?.rootViewController = navController
        } else {
            // User hasn't seen Onboarding yet, show OnboardingViewController
            let onboardingVC = OnboardingViewController()
            window?.rootViewController = onboardingVC
        }
        
        window?.makeKeyAndVisible()
    }
}
