//
//  RegisterUsernamePasswordViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

final class RegisterUsernamePasswordViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: RegisterUsernamePasswordPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension RegisterUsernamePasswordViewController: PRegisterUsernamePasswordPresenterToView {
    
    func setupViews() {
        tableView.backgroundColor = UIColor.clear
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "Account Info".localized, leftButton: .back, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: CGFloat(15).ws, left: CGFloat(0), bottom: CGFloat(15).ws, right: CGFloat(0))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.registerCell(PrimaryTextFieldTableViewCell.self)
        tableView.registerFooterView(PrimaryButtonFooterTableViewCell.self)
    }
}

extension RegisterUsernamePasswordViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        
        footerButtonCell.configureCell(delegate: self, name: "Next".localized)
        
        return footerButtonCell
    }
}

extension RegisterUsernamePasswordViewController: PrimaryButtonCellDelegate {
    
    func primaryButtonClickAction() {
        guard let usernameTFCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? PrimaryTextFieldTableViewCell, let passwordTFCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? PrimaryTextFieldTableViewCell else {
            debugPrint("<---! TableViewCells are not correct indexPath !--->")
            return
        }
        let registerModel: [String: Any] = ["username": usernameTFCell.getTextFieldText(), "password": passwordTFCell.getTextFieldText()]
        presenter?.navigateToNext(registerModel: registerModel)
    }
}
