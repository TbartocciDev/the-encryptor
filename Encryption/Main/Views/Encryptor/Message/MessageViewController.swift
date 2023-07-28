//
//  MessageViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var secretMessageTxt: UITextView!
    
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        secretMessageTxt.layer.cornerRadius = 10
        secretMessageTxt.text = message
        secretMessageTxt.isEditable = false
        self.styleNavBar(title: "", imgName: "chevron.left", color: .black)
    }
    
}
