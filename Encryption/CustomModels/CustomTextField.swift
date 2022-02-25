//
//  CustomTextField.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/1/21.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable
    var placeHolderColor: UIColor = UIColor(named: "EncryptionUITextColor")! {
        didSet {
            updateView()
        }
    }
    
    
    
    
    func updateView() {
        attributedPlaceholder = NSAttributedString(string: "Enter a message to be encrypted here!", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor, NSAttributedString.Key.font: UIFont(name: "Avenir Heavy", size: 20)!])
        
    }
    
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 10
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
