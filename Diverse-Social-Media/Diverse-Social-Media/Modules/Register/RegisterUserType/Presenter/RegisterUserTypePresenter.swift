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
    
    //Register Items
    public var userTypes: [UserTypeItems] = []
    public var userTypeCount: Int = 0
    
    init(view: RegisterUserTypeViewController, interactor: RegisterUserTypeInteractor, router: RegisterUserTypeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func resetUserTypes() {
        for (index, _) in userTypes.enumerated() {
            userTypes[index].isSelected = false
        }
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
    
    func setUserTypeAndReloadCollectionView(index: Int, isSelected: Bool) {
        guard userTypes[safe: index]?.isSelected != nil else {
            debugPrint("<---! userTypes out of index. Index: \(index) !--->")
            return
        }
        
        resetUserTypes()
        userTypes[index].isSelected = isSelected
        
        view?.collectionView.reloadData()
    }
    
    func navigateToNext() {
        guard let type = userTypes.first(where: {$0.isSelected == true}) else {
            router?.showPopup(message: "Please select an user type".localized)
            return
        }
        router?.openNextVC(userType: type)
    }
}
