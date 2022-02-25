//
//  ViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    enum VisibleView: Int {
        case encryptor
        case howTo
        case about
    }
    
    @IBOutlet weak var encryptView: UIView!
    @IBOutlet weak var adjustView: UIView!
    @IBOutlet weak var howToView: UIView!
    @IBOutlet weak var aboutView: UIView!
    
    var encryptIsPresenting: Bool = false
    var adjustIsPresenting: Bool = false
    var visibleViewInt = 0
    
    let slideInTranstion = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func transitionToNewView(_ btnType: MenuButtonType) {
        switch btnType {
        case .home:
            encryptView.isHidden = false
            adjustView.isHidden = true
            howToView.isHidden = true
            aboutView.isHidden = true
            
        case .howTo:
            encryptView.isHidden = true
            adjustView.isHidden = true
            howToView.isHidden = false
            aboutView.isHidden = true
            
        case .about:
            encryptView.isHidden = true
            adjustView.isHidden = true
            howToView.isHidden = true
            aboutView.isHidden = false
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let visibleView = VisibleView(rawValue: visibleViewInt) else { return }
        if visibleView.rawValue == 0 {
            encryptView.isHidden = false
            adjustView.isHidden = true
        } else if visibleView.rawValue == 1 {
            encryptView.isHidden = true
            adjustView.isHidden = false
        }
        
    }
    
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        guard let menuStoryBoard = storyboard?.instantiateViewController(withIdentifier: "MenuStoryBoard") as? MenuViewController else { return }
        menuStoryBoard.didTapMenuType = { btnType in
            self.transitionToNewView(btnType)
            
        }
        
        menuStoryBoard.modalPresentationStyle = .overCurrentContext
        menuStoryBoard.transitioningDelegate = self
        present(menuStoryBoard, animated: true) {
            
        }
    }
    
    
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideInTranstion.isPresenting = true
        return slideInTranstion
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideInTranstion.isPresenting = false
        return slideInTranstion
    }
}
