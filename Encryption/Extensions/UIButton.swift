//
//  UIButton.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/30/21.
//

import UIKit

extension UIButton {
    func configureGreenBtn(){
        let height = self.frame.height
        let width = self.frame.width
        self.backgroundColor = UIColor.init(named: "EncryptionGreen")
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(named: "EncryptionUITextColor")?.cgColor
        let hw = height * width
//        self.layer.cornerRadius = self.frame.height / 2
        self.layer.cornerRadius = hw / 900
        self.tintColor = .white
        self.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 30)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.minimumScaleFactor = 0.1
        self.clipsToBounds = true
    }
}
