//
//  AboutViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class AboutPageViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var visitWebsiteBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        visitWebsiteBtn.greenButton(fontSize: 25)
        imgView.layer.cornerRadius = 10
    }
    
    
    @IBAction func visitWebsiteTapped(_ sender: Any) {
        // change to my site once site is deployed
        if let url = URL(string: "https://www.google.com/") {
            UIApplication.shared.open(url)
        } else {
            print("invalid url")
        }
    }
}
