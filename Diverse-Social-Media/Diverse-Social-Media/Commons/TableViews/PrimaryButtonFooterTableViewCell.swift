//
//  PrimaryButtonFooterTableViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

class PrimaryButtonFooterTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet private weak var primaryButton: UIButton!
    
    private weak var delegate: PrimaryButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.viewBGColour
        primaryButton.setTitle("".localized, for: .normal)
        primaryButton.titleLabel?.font = UIFont.buttonTitleFont
        primaryButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        primaryButton.backgroundColor = UIColor.buttonBGColour
        primaryButton.roundCorners(size: CGFloat(10).ws)
    }
    
    public func configureCell(delegate: PrimaryButtonCellDelegate, name:String) {
        primaryButton.setTitle(name, for: .normal)
        primaryButton.titleLabel?.font = UIFont.buttonTitleFont
        
        self.delegate = delegate
    }
    
    @IBAction private func primaryButtonClicked(_ sender: UIButton) {
        delegate?.primaryButtonClickAction()
    }
}
