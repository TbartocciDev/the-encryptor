//
//  MessageViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 1/17/22.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var msgContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        msgLbl.text = message.capitalized
        msgContainer.layer.cornerRadius = 20
        
    }
    
    
}

extension MessageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > 0 {
            scrollView.contentOffset.x = 0
        } else if scrollView.contentOffset.x < 0 {
            scrollView.contentOffset.x = 0
        }
    }
}
