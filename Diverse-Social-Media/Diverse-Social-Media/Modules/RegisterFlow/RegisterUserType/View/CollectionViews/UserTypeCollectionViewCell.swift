//
//  UserTypeCollectionViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import UIKit

class UserTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var userTypeCellView: UIView!
    
    @IBOutlet private weak var userTypeImageView: UIImageView!
    @IBOutlet private weak var userTypeNameLabel: UILabel!
    
    //width -> 140
    //height -> 180
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        userTypeNameLabel.text = "Unknown"
        userTypeNameLabel.font = UIFont.titleFont
        userTypeNameLabel.textColor = UIColor.textColour
        
        userTypeImageView.image = UIImage(named: "Unknown")
        
        userTypeCellView.roundCorners(size: CGFloat(10).ws)
        userTypeCellView.setBorder(width: CGFloat(1).ws, color: UIColor.textColour)
        
        userTypeImageView.roundCorners(size: CGFloat(10).ws)
    }
    
    public func configureCell(name:String, image: String) {
        userTypeNameLabel.text = name
        userTypeImageView.image = UIImage(named: image)
    }
    
    public func setSelectedCell() {
        userTypeCellView.setBorder(width: CGFloat(2).ws, color: UIColor.titleColour)
        userTypeNameLabel.textColor = UIColor.titleColour
    }
    
    public func setDeselectedCell() {
        userTypeCellView.setBorder(width: CGFloat(1).ws, color: UIColor.textColour)
        userTypeNameLabel.textColor = UIColor.textColour
    }
}
