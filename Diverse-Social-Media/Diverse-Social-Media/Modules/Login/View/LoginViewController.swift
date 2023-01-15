//
//  LoginViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - Outlets
    
    var presenter: PLoginViewToPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension LoginViewController: PLoginPresenterToView {
    
    // MARK: - NavBar
    func setNavBar(title: String) {
        setNavigationBarItems(title: title,
                              leftButton: .back,
                              rightButton: nil)
    }
    
    func showWarningPopup(content: String) {
        showPopup(identifier: nil,
                  title: "Warning".localized,
                  content: content,
                  image: "",
                  buttonType: .single,
                  leftButtonText: "OK".localized,
                  rightButtonText: nil,
                  rightButtonAction: nil,
                  parentVC: self)
    }
}

/*
extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.tfTitles.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tfCell = tableView.dequeueReusableCell(withIdentifier: PrimaryTextFieldTableViewCell.className, for: indexPath) as? PrimaryTextFieldTableViewCell else { return UITableViewCell() }
        
        if let tfTitles = presenter?.tfTitles {
            if let title = tfTitles[safe: indexPath.row] {
                tfCell.configureCell(title: title, placeholder: "")
            }
        }
        
        return tfCell
    }
    
    //Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerButtonCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: PrimaryButtonFooterTableViewCell.className) as? PrimaryButtonFooterTableViewCell else { return UIView()}
        
        footerButtonCell.configureCell(delegate: self, name: "Login".localized)
        
        return footerButtonCell
    }
}

extension LoginViewController: PrimaryButtonCellDelegate {
    
    func primaryButtonClickAction() {
        guard let usernameTFCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? PrimaryTextFieldTableViewCell, let passwordTFCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? PrimaryTextFieldTableViewCell else {
            debugPrint("<---! TableViewCells are not correct indexPath !--->")
            return
        }
        let loginModel: [String: Any] = ["username": usernameTFCell.getTextFieldText(), "password": passwordTFCell.getTextFieldText()]
        presenter?.startLoginProcess(loginModel: loginModel)
        debugPrint("<--- Login Model: \(loginModel) --->")
    }
}
*/
