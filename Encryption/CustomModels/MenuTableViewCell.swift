//
//  MenuTableViewCell.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/3/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
//    @IBOutlet weak var contentV
    
    func configureCellViews(imageName: String, text: String) {
        cellLbl.text = text
        cellImage.image = UIImage(systemName: imageName)
    }

}
