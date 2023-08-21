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
            presentScreen(screen: encryptorView)
        } else if selectedView == "How To Use" {
            presentScreen(screen: howToUseView)
        } else if selectedView == "About" {
            presentScreen(screen: aboutView)
        }
    }
    
    func presentScreen(screen: UIView) {
        let screens = [encryptorView, howToUseView, aboutView]
        for eachScreen in screens {
            eachScreen?.isHidden = true
            if eachScreen == screen {
                screen.isHidden = false
            }
        }
    }
}
