//
//  UIViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

extension UIViewController {
    func styleNavBar(title: String, imgName: String, color: UIColor) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: imgName)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: imgName)
        self.navigationController?.navigationBar.tintColor = UIColor.label
    }
}
