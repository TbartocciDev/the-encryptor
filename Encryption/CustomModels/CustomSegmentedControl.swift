//
//  CustomSegmentedControl.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/1/21.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    
    var buttonsList = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0

    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var titleStringsSeperatedWithDash: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .red {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        buttonsList.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = titleStringsSeperatedWithDash.components(separatedBy: "-")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
//            button.setAttributedTitle(, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttonsList.append(button)
            button.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 30)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.numberOfLines = 1
            button.titleLabel?.minimumScaleFactor = 0.1
            button.clipsToBounds = true
        }
        
        buttonsList[0].setTitleColor(selectorTextColor, for: .normal)
        let selectorWidth = frame.width / 2
        let selectorHeight = frame.height
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth , height: selectorHeight ))
//        selector.layer.cornerRadius = frame.height / 5
        selector.backgroundColor = selectorColor
        
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttonsList)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        clipsToBounds = true
        
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }

    @objc
    func buttonTapped(button: UIButton) {
        for (btnIndex, btn) in buttonsList.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                
                selectedSegmentIndex = btnIndex
                let selectorStartPosition = frame.width / CGFloat(buttonsList.count) * CGFloat(btnIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
}
