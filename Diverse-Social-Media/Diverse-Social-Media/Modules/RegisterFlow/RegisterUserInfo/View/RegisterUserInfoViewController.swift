//
//  RegisterUserInfoViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

class RegisterUserInfoViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var presenter: RegisterUserInfoPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    public func setNavBar() {
        setNavigationBarItems(title: "About You".localized, leftButton: .back, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    public func setupViews() {
        tableView.backgroundColor = UIColor.clear
    }
    
    public func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: CGFloat(15).ws, left: CGFloat(0), bottom: CGFloat(15).ws, right: CGFloat(0))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.registerCell(PrimaryTextFieldTableViewCell.self)
        tableView.registerCell(PrimaryTextViewTableViewCell.self)
        tableView.registerFooterView(PrimaryButtonFooterTableViewCell.self)
    }
}

extension RegisterUserInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.tfTitles.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if presenter?.tfTitles[safe: indexPath.row] == "Email" {
            guard let tfCell = tableView.dequeueReusableCell(withIdentifier: PrimaryTextFieldTableViewCell.className, for: indexPath) as? PrimaryTextFieldTableViewCell else { return UITableViewCell() }

            if let tfTitles = presenter?.tfTitles {
                if let title = tfTitles[safe: indexPath.row] {
                    tfCell.configureCell(title: title, placeholder: "")
                }
            }

            return tfCell
        }
        else if presenter?.tfTitles[safe: indexPath.row] == "About You" {
            guard let tvCell = tableView.dequeueReusableCell(withIdentifier: PrimaryTextViewTableViewCell.className, for: indexPath) as? PrimaryTextViewTableViewCell else { return UITableViewCell() }

            if let tfTitles = presenter?.tfTitles {
                if let title = tfTitles[safe: indexPath.row] {
                    tvCell.configureCell(title: title)
                }
            }

            return tvCell
        }
        else { return UITableViewCell() }
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

extension RegisterUserInfoViewController: PrimaryButtonCellDelegate {
    
    func primaryButtonClickAction() {
        guard let emailTFCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? PrimaryTextFieldTableViewCell, let aboutTVCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? PrimaryTextViewTableViewCell else {
            debugPrint("<---! TableViewCells are not correct indexPath !--->")
            return
        }
        let registerModel: [String: Any] = ["email": emailTFCell.getTextFieldText(), "about": aboutTVCell.getTextViewText()]
        presenter?.navigateToNext(registerModel: registerModel)
    }
}
