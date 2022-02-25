//
//  AboutViewControlelr.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/30/21.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var backgroundRoundView: UIView!
    @IBOutlet weak var appStoreBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundRoundView.layer.cornerRadius = backgroundRoundView.bounds.height / 20
        appStoreBtn.configureGreenBtn()
//        appStoreBtn.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 30)
//        appStoreBtn.titleLabel?.adjustsFontSizeToFitWidth = true
//        appStoreBtn.titleLabel?.numberOfLines = 1
//        appStoreBtn.titleLabel?.minimumScaleFactor = 0.1
//        appStoreBtn.clipsToBounds = true
        
    }
    @IBAction func viewAppTapped(_ sender: Any) {
        //change to my app once delpoyed
//        let appID = "1610639210"
//        if let url = URL(string: "itms-apps://apple.com/app/id839686104") {
//            UIApplication.shared.open(url)
//        }
    }
}
