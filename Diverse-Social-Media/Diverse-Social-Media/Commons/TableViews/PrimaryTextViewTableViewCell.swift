//
//  PrimaryTextViewTableViewCell.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

class PrimaryTextViewTableViewCell: UITableViewCell {

    @IBOutlet private weak var primaryTVTitleLabel: UILabel!
    @IBOutlet private weak var primaryTVView: UIView!
    @IBOutlet private weak var primaryTV: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        primaryTVTitleLabel.textColor = UIColor.textColour
        primaryTVTitleLabel.font = UIFont.textFont
        
        primaryTVView.roundCorners(size: CGFloat(10).ws)
        primaryTVView.setBorder(width: CGFloat(1).ws, color: UIColor.textColour)
        
        primaryTV.textColor = UIColor.textColour
        primaryTV.font = UIFont.textFont
        primaryTV.tintColor = UIColor.textColour
    }
    
    public func configureCell(title: String) {
        primaryTVTitleLabel.text = title
    }

    public func getTextViewText() -> String {
        return primaryTV.text.orEmpty
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
