//
//  RegisterUserTypeViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

final class RegisterUserTypeViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var presenter: RegisterUserTypePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension RegisterUserTypeViewController: PRegisterUserTypePresenterToView {
    
    func setupViews() {
        collectionView.backgroundColor = UIColor.clear
    }
    
    func setNavBar(title: String) {
        setNavigationBarItems(title: "Select User Type".localized, leftButton: .back, rightButton: nil)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(UserTypeCollectionViewCell.self)
        collectionView.registerFooterCell(PrimaryButtonCollectionViewCell.self)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

extension RegisterUserTypeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.userTypeCount ?? 0)
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
            if let name = userTypes[safe: indexPath.row]?.name, let image = userTypes[safe: indexPath.row]?.image, let isSelected = userTypes[safe: indexPath.row]?.isSelected {
                userTypeCell.configureCell(name: name, image: image)
                isSelected ? (userTypeCell.setSelectedCell()) : (userTypeCell.setDeselectedCell())
            }
        }
        
        return userTypeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.setUserTypeAndReloadCollectionView(index: indexPath.row, isSelected: true)
    }
    
    //Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: CGFloat(320).ws, height: CGFloat(60).ws)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            guard let customButtonCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PrimaryButtonCollectionViewCell.className, for: indexPath) as? PrimaryButtonCollectionViewCell else { return UICollectionViewCell()}
            
            customButtonCell.configureCell(delegate: self, name: "Next".localized)
            
            return customButtonCell
        default: return UICollectionViewCell()
        }
    }
}

extension RegisterUserTypeViewController: PrimaryButtonCellDelegate {
    
    func primaryButtonClickAction() {
        presenter?.navigateToNext()
    }
}
