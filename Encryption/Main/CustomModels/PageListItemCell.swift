//
//  PageListItemCell.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class PageListItemCell: UITableViewCell {
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    let paddingSize: CGFloat = 8

    func configureCell(title: String, icon: String){
        iconImg.image = UIImage(systemName: icon)
        titleLbl.text = title
        self.contentView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
