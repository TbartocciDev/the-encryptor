//
//  HowToUseViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/27/23.
//

import UIKit

class HowToUseViewController: UIViewController {
    @IBOutlet weak var stepImg: UIImageView!
    @IBOutlet weak var stepTitleLbl: UILabel!
    @IBOutlet weak var stepInstructionsLbl: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var backBtn: UIView!
    @IBOutlet weak var forwardBtn: UIView!
    @IBOutlet weak var restartBtn: UIView!
    
    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    
    var currentStep = 1
    
    var steps: [InstructionalStep] = []

    var mode = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .dark {
            mode = "light"
        } else {
            mode = "dark"
        }
        progressBar.layer.cornerRadius = 4
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        steps = [InstructionalStep(title: "Encrypt a Message", instructions: "Navigate over to The Encryptor, enter a message you would like to send to someone. Make sure the app is in encryption mode and use the process request button to recieve your secret message.", imgName: "1\(mode)"),
               InstructionalStep(title: "Send to a Friend!", instructions: "Your secret message should now be copied to your clipboard and ready to paste. Use whichever messenger app you so choose, and send it to someone.", imgName: "2\(mode)"),
               InstructionalStep(title: "Decrypt a Message", instructions: "Who ever is recieving the message should now copy the text to their clipboard. Navigate back to The Encryptor, make sure the app is in decryption mode, and use that process request button again!", imgName: "3\(mode)"),
               InstructionalStep(title: "The Secrets Out!", instructions: "The hard part is over, and the fun part begins. You are now able to write and read the secret messages!", imgName: "4\(mode)"),
               InstructionalStep(title: "Rinse and Repeat", instructions: "You are now fully capable of mass destruction in your friend groups. Use this technology wisely as anyone with the app can read your encrypted messages and text!", imgName: "5\(mode)")]
        
        updateUI()
    }
    
    @IBAction func nextStepTapped(_ sender: UIButton) {
        currentStep += 1
        updateUI()
    }
    
    @IBAction func previousStepTapped(_ sender: UIButton) {
        currentStep -= 1
        updateUI()
    }
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        currentStep = 1
        updateUI()
    }
    
    
    func updateUI(){
        if currentStep > 1 {
            backBtn.isHidden = false
            forwardBtn.isHidden = false
            restartBtn.isHidden = true
        } else {
            forwardBtn.isHidden = false
            restartBtn.isHidden = true
            backBtn.isHidden = true
        }
        
        if currentStep == steps.count {
            restartBtn.isHidden = false
            forwardBtn.isHidden = true
        }
        
        if currentStep < steps.count + 1 {
            DispatchQueue.main.async { [self] in
                UIView.animate(withDuration: 0.5) { [self] in
                    progressBarWidth.constant = stepImg.frame.width * (CGFloat(currentStep) / CGFloat(steps.count))
                    view.layoutIfNeeded()
                }
                stepImg.image = UIImage(named: steps[currentStep - 1].imgName)
                stepTitleLbl.text = steps[currentStep - 1].title
                stepInstructionsLbl.text = steps[currentStep - 1].instructions
            }
        }
    }
}
