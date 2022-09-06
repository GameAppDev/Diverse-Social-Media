//
//  RegisterUserTypePresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation

final class RegisterUserTypePresenter {
    
    private var view: RegisterUserTypeViewController?
    private var interactor: RegisterUserTypeInteractor?
    private var router: RegisterUserTypeRouter?
    
    public var userTypes: [UserTypeItems] = []
    public var userTypeCount: Int = 0
    
    init(view: RegisterUserTypeViewController, interactor: RegisterUserTypeInteractor, router: RegisterUserTypeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension RegisterUserTypePresenter: PRegisterUserTypeViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupCollectionView()
        
        userTypes = UserTypeConfig().getUserTypes()
        userTypeCount = UserTypeConfig().getUserTypeCount()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func setCollectionViewUIAndUserType(index: Int, isSelected: Bool) {
        guard let userTypeCell = view?.collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? UserTypeCollectionViewCell else { return }
        
        userTypes[index].isSelected = isSelected
        
        isSelected ? (userTypeCell.setSelectedCell()) : (userTypeCell.setDeselectedCell())
    }
    
    func navigateToNext() { }
}
