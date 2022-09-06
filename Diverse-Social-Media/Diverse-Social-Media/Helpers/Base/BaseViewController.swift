//
//  BaseViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 28.08.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetNavigationBar()
        
        hideKeyboardWhenCicked()
    }
    
    private func resetNavigationBar() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    public func setNavigationBarItems(title: String?, leftButton: NavigationBarButtonType?, rightButton: NavigationBarButtonType?, containerColour: UIColor?) {
        guard let navigationBar = NavigationBar().loadNib() as? NavigationBar else { return }
        
        navigationBar.frame = getNavigationBarFrame()

        navigationBar.title = title
        navigationBar.leftButtonType = leftButton
        navigationBar.rightButtonType = rightButton

        navigationBar.containerBGColour = containerColour

        navigationBar.delegate = self

        setNavigationBarView(navBarView: navigationBar)
    }
    
    private func setNavigationBarView(navBarView: UIView) {
        self.navigationController?.navigationBar.addSubview(navBarView)
    }
}

extension BaseViewController: NavigationBarDelegate {
    
    func handleNavigationBarButton(type: NavigationBarButtonType) {
        switch type {
        case .back:
            self.navigationController?.popViewController(animated: true)
        case .close:
            self.dismiss(animated: true)
        }
    }
}
