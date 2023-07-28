//
//  MainViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var encryptorView: UIView!
    @IBOutlet weak var howToUseView: UIView!
    @IBOutlet weak var aboutView: UIView!
    
    var selectedView = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        showSelectedView()
        self.title = selectedView
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.styleNavBar(title: selectedView, imgName: "line.3.horizontal", color: .black)
    }

    
    func showSelectedView() {
        if selectedView == "Encryptor" {
            encryptorView.isHidden = false
            howToUseView.isHidden = true
            aboutView.isHidden = true
        } else if selectedView == "How To Use" {
            encryptorView.isHidden = true
            howToUseView.isHidden = false
            aboutView.isHidden = true
        } else if selectedView == "About" {
            encryptorView.isHidden = true
            howToUseView.isHidden = true
            aboutView.isHidden = false
        }
    }
}
