//
//  PrimaryTextFieldTableViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

class PrimaryTextFieldTableViewCell: UITableViewCell {

    @IBOutlet private weak var primaryTFTitleLabel: UILabel!
    @IBOutlet private weak var primaryTFView: UIView!
    @IBOutlet private weak var primaryTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }

    private func setupViews() {
        primaryTFTitleLabel.textColor = UIColor.textColour
        primaryTFTitleLabel.font = UIFont.textFont
        
        primaryTFView.roundCorners(size: CGFloat(10).ws)
        primaryTFView.setBorder(width: CGFloat(1).ws, color: UIColor.textColour)
        
        primaryTF.textColor = UIColor.textColour
        primaryTF.font = UIFont.textFont
        primaryTF.tintColor = UIColor.textColour
    }
    
    public func configureCell(title: String, placeholder: String) {
        primaryTFTitleLabel.text = title
        primaryTF.placeholder = placeholder
    }
    
    public func getTextFieldText() -> String {
        return primaryTF.text.orEmpty
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
