//
//  PickerDataTableViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

final class PickerDataTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(pickerData: String) {
        containerView.backgroundColor = UIColor.navbarBGColour
        dataLabel.text = pickerData
        dataLabel.font = UIFont.titleFont
        dataLabel.textColor = UIColor.navbarTitleColour
    }
}
