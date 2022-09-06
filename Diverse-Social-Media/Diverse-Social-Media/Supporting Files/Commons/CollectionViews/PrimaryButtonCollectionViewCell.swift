//
//  PrimaryButtonCollectionViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import UIKit

protocol PrimaryButtonCellDelegate: AnyObject {
    func primaryButtonClickAction()
}

class PrimaryButtonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var primaryButton: UIButton!
    
    private weak var delegate: PrimaryButtonCellDelegate?
    
    //width -> 320
    //height -> 60
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
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
        self.delegate?.primaryButtonClickAction()
    }
}
