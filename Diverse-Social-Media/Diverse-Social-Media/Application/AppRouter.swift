//
//  AppRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

open class AppRouter {
    
    public static let shared = AppRouter()
    
    private var navigationController: UINavigationController?
    
    public static var window: UIWindow {
        return appDelegate.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    public func openApp() {
        UserManager.shared.isLoggedIn ? (navigateToMain()) : (navigateToSplash())
        AppRouter.window.makeKeyAndVisible()
    }
    
    private func navigateToSplash() {
        let rootVC = SplashRouter().returnVC()
        setActiveNavigationController(with: rootVC)
    }
    
    private func navigateToMain() { }
    
    public func changeNavigationController(with rootVC: UIViewController) {
        setActiveNavigationController(with: rootVC)
    }
    
    public func getActiveNavigationController() -> UINavigationController? {
        return navigationController
    }
    
    private func setActiveNavigationController(with rootVC: UIViewController) {
        let navCont = UINavigationController(rootViewController: rootVC)
        
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navCont
        
        AppRouter.window.rootViewController = navCont
    }
}
