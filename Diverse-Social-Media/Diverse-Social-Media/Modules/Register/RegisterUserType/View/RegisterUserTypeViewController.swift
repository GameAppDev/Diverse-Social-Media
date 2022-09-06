//
//  RegisterUserTypeViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import UIKit

class RegisterUserTypeViewController: BaseViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    public var presenter: RegisterUserTypePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    public func setNavBar() {
        setNavigationBarItems(title: "Select User Type".localized, leftButton: .back, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    public func setupViews() { }
    
    public func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(UserTypeCollectionViewCell.self)
    }
}

extension RegisterUserTypeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.userTypeCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(140).ws, height: CGFloat(180).ws)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(20).ws, left: CGFloat(15).ws, bottom: CGFloat(20).ws, right: CGFloat(15).ws)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20).ws
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let userTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: UserTypeCollectionViewCell.className, for: indexPath) as? UserTypeCollectionViewCell else { return UICollectionViewCell() }
        
        if let userTypes = presenter?.userTypes {
            if let name = userTypes[safe: indexPath.row]?.name, let image = userTypes[safe: indexPath.row]?.image {
                userTypeCell.configureCell(name: name, image: image)
            }
        }
        
        return userTypeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.setCollectionViewUIAndUserType(index: indexPath.row, isSelected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        presenter?.setCollectionViewUIAndUserType(index: indexPath.row, isSelected: false)
    }
}
