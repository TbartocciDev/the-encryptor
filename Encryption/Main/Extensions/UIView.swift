//
//  UIView.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

extension UIView {
    func flash(duration: Double) {
        let flash = CABasicAnimation(keyPath: "opacity")
                   flash.duration = duration
                   flash.fromValue = 0
                   flash.toValue = duration
                   flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                   flash.autoreverses = true
                   layer.add(flash, forKey: nil)
    }
}
