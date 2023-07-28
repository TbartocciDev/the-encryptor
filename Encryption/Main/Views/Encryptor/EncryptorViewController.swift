//
//  EncryptorViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class EncryptorViewController: UIViewController {
    @IBOutlet weak var instructionLbl: UILabel!
    @IBOutlet weak var userInputTxt: UITextView!
    @IBOutlet weak var processBtn: UIButton!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var alertImg: UIImageView!
    @IBOutlet weak var alertMessageLbl: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    
    var secretMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitalUI()
        checkSegmentVal()
        
    }
    
    @IBAction func controllerValueChanged(_ sender: UISegmentedControl) {
        checkSegmentVal()
    }
    
    @objc
    func showMessage(){
        self.performSegue(withIdentifier: "showMessage", sender: self)
    }
    
    @IBAction func processBtnTapped(_ sender: Any) {
        if segmentedController.selectedSegmentIndex == 0 {
            showAlert(request: processBtn.encrypt(message: userInputTxt.text))
        } else {
            showAlert(request: processBtn.decrypt(message: userInputTxt.text))
        }
        userInputTxt.resignFirstResponder()
    }
    
    func checkSegmentVal() {
        if segmentedController.selectedSegmentIndex == 0 {
            instructionLbl.text = "Write a message!"
        } else {
            instructionLbl.text = "Read a message!"
        }
    }
    
    @objc
    func hideAlertView() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) { [self] in
                alertView.alpha =  0
            }
        }
    }
    
    func showAlert(request: ProcessAttempt) {
        alertBtn.removeTarget(self, action: #selector(showMessage), for: .touchUpInside)
        alertBtn.addTarget(self, action: #selector(hideAlertView), for: .touchUpInside)
        DispatchQueue.main.async { [self] in
            if request.status == "fail" {
                alertImg.image = UIImage(systemName: "xmark.seal.fill")
                alertImg.tintColor = UIColor(named: "EncryptorRed")
            } else {
                alertImg.image = UIImage(systemName: "checkmark.seal.fill")
                alertImg.tintColor = UIColor(named: "EncryptorGreen")
                if request.type == "Decrypt" {
                    secretMessage = request.data!
                    alertBtn.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
                }
            }
            alertMessageLbl.text = request.message
            alertBtn.setTitle(request.btnTitle, for: .normal)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) { [self] in
                alertView.alpha =  1
            }
        }
    }
    
    func setInitalUI(){
        userInputTxt.layer.cornerRadius = 10
        processBtn.greenButton(fontSize: 25)
        segmentedController.setTitleTextAttributes( [
            NSAttributedString.Key.font: UIFont(name: "Avenir Next Condensed Demi Bold", size: 25)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .normal)
        contentView.layer.cornerRadius = 10
        alertBtn.styleBtn(fontSize: 25, btnColor: UIColor(named: "EncryptorGrey")!, tintColor: UIColor(named: "EncryptorText")!)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = alertView!.bounds

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        alertView.addSubview(blurEffectView)
        alertView.bringSubviewToFront(contentView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessage" {
            let destination = segue.destination as! MessageViewController
            destination.message = secretMessage.capitalized
        }
    }
}

extension EncryptorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
