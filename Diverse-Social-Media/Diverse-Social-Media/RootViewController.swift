//
//  RootViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet var topSafeArea: UIView!
    @IBOutlet var bottomSafeArea: UIView!
    @IBOutlet var activeView: UIView!
    
    private var activeNC:UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let guestNC = appDelegate.theStoryboard.instantiateViewController(withIdentifier: "GuestNC") as? UINavigationController {
            activeNC?.view.removeFromSuperview()
            activeView.addSubview(guestNC.view!)
            
            activeNC = guestNC
            
            activeNC?.interactivePopGestureRecognizer?.delegate = self
        }
    }
}

extension RootViewController: UIGestureRecognizerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        activeNC?.interactivePopGestureRecognizer?.isEnabled = true
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
