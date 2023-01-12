//
//  Picker.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

final class Picker: BaseViewController {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: PPickerViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
