//
//  EncryptDecryptViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/4/21.
//

import UIKit

class EncryptDecryptViewController: UIViewController {
    
    @IBOutlet weak var encryption_text_feild: UITextField!
    @IBOutlet weak var process_request_btn: UIButton!
    @IBOutlet weak var segmented_control: CustomSegmentedControl!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var alertMsgLbl: UILabel!
    @IBOutlet weak var alertImgView: UIImageView!
    @IBOutlet weak var dismissBtn: UIButton!
    
    // standard number vals
    let alphE = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let numberVals = ["0","1","2","3","4","5","6","7","8","9"]
    let symbVals = [" ","~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","\\","|",";",":",#"''"#,#"""#,",","<",".",">","/","?"]
    
    let alphG = ["Φ", "Ρ", "Χ", "Ξ", "Τ", "Щ", "Λ", "Δ", "Ω", "Θ", "Σ", "Ν", "Υ", "Β", "Γ", "ङ", "Κ", "Ο", "Η", "Μ", "Α", "Ε", "Ψ", "Ζ", "Π", "Ι"]
    let alphM = ["၃", "၈", "တ", "င", "ဖ", "၇", "၆", "ထ", "ဟ", "က", "အ", "၄", "ဆ", "ၐ", "၅", "၀", "ဩ", "သ", "၂", "၉", "၏", "စ", "မ", "၁", "ပ", "န"]
    let alphR = ["Ж", "Н", "Я", "О", "Л", "А", "Й", "Р", "Ш", "Ч", "Ю", "Г", "К", "З", "Э", "Е", "Ë", "Ц", "Ф", "У", "П", "Х", "Ъ", "Д", "Ы", "В"]
    
    var newNumberVals = ["Б", "ခ", "Ь", "ည", "М", "С", "И", "Т", "လ", "ဘ"]
    var spaceVals = ["ക","ൠ"]
    
    // new values for symbols beyond numbers
    var backTickVals = ["重","人"]
    var tildeVals = ["月","戈"]
    var exclamationVals = ["ഊ","ഏ"]
    var atVals = ["ഠ","ഘ"]
    var hashtagVals = ["ള","ഋ"]
    var moneySignVals = ["ഭ","ഇ"]
    var percentVals = ["ഷ","ഈ"]
    var carrotVals = ["ധ","ഥ"]
    var ampersandVals = ["ഴ","ഞ"]
    var asterikVals = ["ഔ","ശ"]
    var leftParenthesisVals = ["ഢ","റ"]
    var rightParenthesisVals = ["大","中"]
    var dashVals = ["手","金"]
    var underScoreVals = ["竹","心"]
    var plusSignVals = ["弓","木"]
    var equalSignsVals = ["口","土"]
    var curlyLeftVals = ["尸","田"]
    var curlyRightVals = ["廿","卜"]
    var leftBracketsVals = ["山","十"]
    var rightBracketsVals = ["水","日"]
    var backSlackVals = ["火","女"]
    var verticalBarsVals = ["म","₹"]
    var colonVals = ["अ","ष"]
    var semiColonVals = ["र","ज"]
    var frontTickVals = ["न","ल"]
    var quotationVals = ["य","स"]
    var leftArrVals = ["त","क"]
    var commasVals = ["ഖ","ഫ"]
    var rightArrVals = ["ब","ग"]
    var periodVals = ["ണ","ഉ"]
    var forwardSlashVals = ["ह","प"]
    var questionMarkVals = ["എ","ഝ"]
    
    let alphRange = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
    
    let randomAlph = Int.random(in: 1...3)
    
    var alph1 = [String]()
    var alph2 = [String]()
    var alph3 = [String]()
    
    var nextScreenMsg = ""
    
    var validateCharBool: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowView.alpha = 0
        alertView.alpha = 0
        
        encryption_text_feild.layer.cornerRadius = 25
        encryption_text_feild.clipsToBounds = true
        
        configureProeccesBtn()
        dismissBtn.configureGreenBtn()
        segmented_control.selectedSegmentIndex = 0
        
        
        alertView.layer.cornerRadius = 20
        dismissBtn.addTarget(self, action: #selector(hideAlert(button:)), for: .touchUpInside)
        encryption_text_feild.delegate = self
        
        print((process_request_btn.frame.height * process_request_btn.frame.width) / 900)
        print(process_request_btn.frame.height / 2)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dismissBtn.removeTarget(self, action: #selector(showMessage(button:)), for: .touchUpInside)
        dismissBtn.removeTarget(self, action: #selector(hideAlert(button:)), for: .touchUpInside)
        dismissBtn.addTarget(self, action: #selector(hideAlert(button:)), for: .touchUpInside)
        
    }
    
    @IBAction func processBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func dismissCopyTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func customSegmentChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //  encrpyt
            encryption_text_feild.placeholder = "Enter a message to be encrypted here!"
            encryption_text_feild.text = ""
            process_request_btn.removeTarget(self, action: #selector(decrypt_message(button:)), for: .touchUpInside)
            process_request_btn.addTarget(self, action: #selector(encrypt_message(button:)), for: .touchUpInside)
            
        case 1:
            //  decrpyt
            encryption_text_feild.text = ""
            encryption_text_feild.placeholder = "Decrpyt your message here!"
            process_request_btn.removeTarget(self, action: #selector(encrypt_message(button:)), for: .touchUpInside)
            process_request_btn.addTarget(self, action: #selector(decrypt_message(button:)), for: .touchUpInside)
            
        default:
            print("default")
            process_request_btn.addTarget(self, action: #selector(encrypt_message(button:)), for: .touchUpInside)
        }
    }
    
    @objc
    func encrypt_message(button: UIButton) {
        validateCharBool = true
        
        var newLetterPosition = 0
        var newLetter = ""
        var newMessage = ""
        let addedShiftVal = Int.random(in: 0...24)
        
        checkRandomness()
        
        if encryption_text_feild.text != "" {
            //            print("not empty")
            
            if !encryption_text_feild.text!.isBlank {
                //                print("Not blank")
                
                
                var userText = encryption_text_feild.text!.trimmingCharacters(in: .whitespaces)
                var characterNum = 0
                
                print("Text Input: " + userText + "\n")
                print("Added Shift Val: " + String(format: "%02d", addedShiftVal) + "\n")
                userText += String(format: "%02d", addedShiftVal)
                print("Text after transformation: " + userText + "\n")
                
                for char in userText {
                    if alphE.contains(String(char).capitalized){
//                        print("valid character")
                    } else if symbVals.contains(String(char)){
//                        print("valid character")
                    } else if numberVals.contains(String(char)) {
//                        print("valid character")
                    } else {
                        validateCharBool = false
//                        print("Invalid character")
                        displayAlert(imgName: "X-Mark", msg: "Please enter valid text into the textfield!", btnTitle: "Dismiss")
                    }
                }
                
                if validateCharBool == true {
                    for eachChar in userText {
                        characterNum += 1
                        
                        let randomSpaceInt = Int.random(in: 0...1)
                        let randomSymbolInt = Int.random(in: 0...1)
                        
                        for letterPosition in alphRange {
                            
                            if String(eachChar).capitalized == alphE[letterPosition] {
                                
                                if letterPosition - addedShiftVal < 0 {
                                    newLetterPosition = alphE.count + (letterPosition - addedShiftVal)
                                } else {
                                    newLetterPosition = letterPosition - addedShiftVal
                                }
                                
                                if characterNum % 3 == 1 {
                                    newLetter = alph3[newLetterPosition]
                                    
                                } else if characterNum % 3 == 2 {
                                    newLetter = alph1[newLetterPosition]
                                    
                                } else if characterNum % 3 == 0 {
                                    newLetter = alph2[newLetterPosition]
                                    
                                }
                                newMessage += newLetter
                                
                            }
                        }
                        
                        if numberVals.contains(String(eachChar)) {
                            
                            for eachNumber in 0...(numberVals.count - 1) {
                                
                                if String(eachChar) == numberVals[eachNumber] {
                                    
                                    newMessage += newNumberVals[eachNumber]
                                    
                                    //                                print("match to char: " + String(eachChar))
                                }
                            }
                        }
                        if String(eachChar) == " " {
                            newMessage += spaceVals[randomSpaceInt]
                        } else if String(eachChar) == "`" {
                            newMessage += backTickVals[randomSymbolInt]
                        } else if String(eachChar) == "~" {
                            newMessage += tildeVals[randomSymbolInt]
                        } else if String(eachChar) == "!" {
                            newMessage += exclamationVals[randomSymbolInt]
                        } else if String(eachChar) == "@" {
                            newMessage += atVals[randomSymbolInt]
                        } else if String(eachChar) == "#" {
                            newMessage += hashtagVals[randomSymbolInt]
                        } else if String(eachChar) == "$" {
                            newMessage += moneySignVals[randomSymbolInt]
                        } else if String(eachChar) == "%" {
                            newMessage += percentVals[randomSymbolInt]
                        } else if String(eachChar) == "^" {
                            newMessage += carrotVals[randomSymbolInt]
                        } else if String(eachChar) == "&" {
                            newMessage += ampersandVals[randomSymbolInt]
                        } else if String(eachChar) == "*" {
                            newMessage += asterikVals[randomSymbolInt]
                        } else if String(eachChar) == "(" {
                            newMessage += leftParenthesisVals[randomSymbolInt]
                        } else if String(eachChar) == ")" {
                            newMessage += rightParenthesisVals[randomSymbolInt]
                        } else if String(eachChar) == "-" {
                            newMessage += dashVals[randomSymbolInt]
                        } else if String(eachChar) == "_" {
                            newMessage += underScoreVals[randomSymbolInt]
                        } else if String(eachChar) == "+" {
                            newMessage += plusSignVals[randomSymbolInt]
                        } else if String(eachChar) == "=" {
                            newMessage += equalSignsVals[randomSymbolInt]
                        } else if String(eachChar) == "[" {
                            newMessage += leftBracketsVals[randomSymbolInt]
                        } else if String(eachChar) == "{" {
                            newMessage += curlyLeftVals[randomSymbolInt]
                        } else if String(eachChar) == "]" {
                            newMessage += rightBracketsVals[randomSymbolInt]
                        } else if String(eachChar) == "}" {
                            newMessage += curlyRightVals[randomSymbolInt]
                        } else if String(eachChar) == "\\" {
                            newMessage += backSlackVals[randomSymbolInt]
                        } else if String(eachChar) == "|" {
                            newMessage += verticalBarsVals[randomSymbolInt]
                        } else if String(eachChar) == ";" {
                            newMessage += semiColonVals[randomSymbolInt]
                        } else if String(eachChar) == ":" {
                            newMessage += colonVals[randomSymbolInt]
                        } else if String(eachChar) == #"'"# {
                            newMessage += frontTickVals[randomSymbolInt]
                        } else if String(eachChar) == #"""# {
                            newMessage += quotationVals[randomSymbolInt]
                        } else if String(eachChar) == "," {
                            newMessage += commasVals[randomSymbolInt]
                        } else if String(eachChar) == "<" {
                            newMessage += leftArrVals[randomSymbolInt]
                        } else if String(eachChar) == "." {
                            newMessage += periodVals[randomSymbolInt]
                        } else if String(eachChar) == ">" {
                            newMessage += rightArrVals[randomSymbolInt]
                        } else if String(eachChar) == "/" {
                            newMessage += forwardSlashVals[randomSymbolInt]
                        } else if String(eachChar) == "?" {
                            newMessage += questionMarkVals[randomSymbolInt]
                        }
                    }
                    
                    // copy to clipboard and display message
                    UIPasteboard.general.string = newMessage
                    //                print("copied to clipboard.")
                    
                    // close keyboard and erase text
                    encryption_text_feild.text = ""
                    
                    //show copied view
                    displayAlert(imgName: "Check-Mark", msg: "Message copied! Paste and send to another user!", btnTitle: "Dismiss")
                    
                } else {
                    encryption_text_feild.text = ""
                    
                    print("Invalid characters detected")
                    displayAlert(imgName: "X-Mark", msg: "Invalid characters detected, please enter standard english alphabet.", btnTitle: "Dismiss")
                }
                
            } else {
                
                print("This is not valid input")
                
                displayAlert(imgName: "X-Mark", msg: "Please enter valid text into the textfield!", btnTitle: "Dismiss")
                
                encryption_text_feild.text = ""
            }
            
        } else {
            print("There must be text in the textfield to encrypt!")
            
            //show error message
            displayAlert(imgName: "X-Mark", msg: "There must be text in the textfield to encrypt!", btnTitle: "Dismiss")
            
        }
    }
    
    @objc
    func decrypt_message(button: UIButton) {
        if encryption_text_feild.text! != "" {
            
            var newLetter = ""
            
            var newMessage = ""
            
            var encryptedShiftString = ""
            var shiftValStr = ""
            var shiftValStr2 = ""
            var shiftValInt = 0
            
            var encryptedMessage = encryption_text_feild.text!
            
            encryptedShiftString = String(encryptedMessage.last!)
            encryptedMessage.removeLast()
            encryptedShiftString += String(encryptedMessage.last!)
            encryptedMessage.removeLast()
            
            //find shift
            for eachChar in encryptedShiftString {
                if newNumberVals.contains(String(eachChar)) {
                    for number in 0...(numberVals.count - 1) {
                        if String(eachChar) == newNumberVals[number] {
                            shiftValStr += String(numberVals[number])
                        }
                    }
                }
            }
            
            print("Removed Shift Val Str: " + shiftValStr)
            shiftValStr2 = String(shiftValStr.reversed())
            if shiftValStr2.isInt {
                shiftValInt = Int(shiftValStr2)!
            } else {
                displayAlert(imgName: "X-Mark", msg: "Message could not be decrypted. Be sure to enter an encrypted message.", btnTitle: "Dismiss")
            }
            //            print("Str converted to Int: " + String(shiftValInt))
            
            for eachCharacter in encryptedMessage {
                
                if alph1.contains(String(eachCharacter)) {
                    
                    for num in alphRange {
                        
                        if String(eachCharacter) == alph1[num] {
                            if num + shiftValInt > 25 {
                                newLetter = alphE[(num + shiftValInt) - alphE.count]
                            } else {
                                newLetter = alphE[num + shiftValInt]
                            }
                            newMessage += newLetter
                        }
                    }
                } else if alph2.contains(String(eachCharacter)) {
                    
                    for num in alphRange {
                        
                        if String(eachCharacter) == alph2[num] {
                            
                            if num + shiftValInt > 25 {
                                newLetter = alphE[(num + shiftValInt) - alphE.count]
                            } else {
                                newLetter = alphE[num + shiftValInt]
                            }
                            newMessage += newLetter
                        }
                    }
                } else if alph3.contains(String(eachCharacter)) {
                    
                    for num in alphRange {
                        
                        if String(eachCharacter) == alph3[num] {
                            
                            if num + shiftValInt > 25 {
                                newLetter = alphE[(num + shiftValInt) - alphE.count]
                            } else {
                                newLetter = alphE[num + shiftValInt]
                            }
                            newMessage += newLetter
                        }
                    }
                }
                
                if newNumberVals.contains(String(eachCharacter)) {
                    for number in 0...(numberVals.count - 1) {
                        if String(eachCharacter) == newNumberVals[number] {
                            newMessage += numberVals[number]
                        }
                    }
                } else if spaceVals.contains(String(eachCharacter)) {
                    newMessage += " "
                } else if backTickVals.contains(String(eachCharacter)) {
                    newMessage += "`"
                } else if tildeVals.contains(String(eachCharacter)) {
                    newMessage += "~"
                } else if exclamationVals.contains(String(eachCharacter)) {
                    newMessage += "!"
                } else if atVals.contains(String(eachCharacter)) {
                    newMessage += "@"
                } else if hashtagVals.contains(String(eachCharacter)) {
                    newMessage += "#"
                } else if moneySignVals.contains(String(eachCharacter)) {
                    newMessage += "$"
                } else if percentVals.contains(String(eachCharacter)) {
                    newMessage += "%"
                } else if carrotVals.contains(String(eachCharacter)) {
                    newMessage += "^"
                } else if ampersandVals.contains(String(eachCharacter)) {
                    newMessage += "&"
                } else if asterikVals.contains(String(eachCharacter)) {
                    newMessage += "*"
                } else if leftParenthesisVals.contains(String(eachCharacter)) {
                    newMessage += "("
                } else if rightParenthesisVals.contains(String(eachCharacter)) {
                    newMessage += ")"
                } else if dashVals.contains(String(eachCharacter)) {
                    newMessage += "-"
                } else if underScoreVals.contains(String(eachCharacter)) {
                    newMessage += "_"
                } else if plusSignVals.contains(String(eachCharacter)) {
                    newMessage += "+"
                } else if equalSignsVals.contains(String(eachCharacter)) {
                    newMessage += "="
                } else if curlyLeftVals.contains(String(eachCharacter)) {
                    newMessage += "{"
                } else if leftBracketsVals.contains(String(eachCharacter)) {
                    newMessage += "["
                } else if curlyRightVals.contains(String(eachCharacter)) {
                    newMessage += "}"
                } else if rightBracketsVals.contains(String(eachCharacter)) {
                    newMessage += "]"
                } else if backSlackVals.contains(String(eachCharacter)) {
                    newMessage += "\\"
                } else if verticalBarsVals.contains(String(eachCharacter)) {
                    newMessage += "|"
                } else if semiColonVals.contains(String(eachCharacter)) {
                    newMessage += ";"
                } else if colonVals.contains(String(eachCharacter)) {
                    newMessage += ":"
                } else if leftArrVals.contains(String(eachCharacter)) {
                    newMessage += "<"
                } else if commasVals.contains(String(eachCharacter)) {
                    newMessage += ","
                } else if rightArrVals.contains(String(eachCharacter)) {
                    newMessage += ">"
                } else if periodVals.contains(String(eachCharacter)) {
                    newMessage += "."
                } else if questionMarkVals.contains(String(eachCharacter)) {
                    newMessage += "?"
                } else if forwardSlashVals.contains(String(eachCharacter)) {
                    newMessage += "/"
                }
                
            }
            
            if newMessage != "" {
                //                print("Incoming Message: " + newMessage.capitalized)
                nextScreenMsg = newMessage.capitalized
                displayAlert(imgName: "Check-Mark", msg: "Decryption success! Let's see what they said...", btnTitle: "View Message")
                dismissBtn.addTarget(self, action: #selector(showMessage(button:)), for: .touchUpInside)
                
            } else {
                //                print("Message could not be decrypted. Be sure to enter an encrypted message.")
                displayAlert(imgName: "X-Mark", msg: "Message could not be decrypted. Be sure to enter an encrypted message.", btnTitle: "Dismiss")
            }
            
        } else {
            //            print("You must enter a message to be decrypted!")
            displayAlert(imgName: "X-Mark", msg: "You must enter a message to be decrypted!", btnTitle: "Dismiss")
        }
        //clear text field
        encryption_text_feild.text = ""
    }
    
    func displayAlert(imgName: String, msg: String, btnTitle: String) {
        
        DispatchQueue.main.async { [self] in
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut) {
                shadowView.alpha = 1
                alertView.alpha =  1
            }
            
            alertMsgLbl.text = msg.capitalized
            alertImgView.image = UIImage(named: imgName)
            dismissBtn.setTitle(btnTitle, for: .normal)
            
        }
    }
    
    @objc func showMessage(button: UIButton){
        self.performSegue(withIdentifier: "showMessage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessage" {
            let messageVC = segue.destination as! MessageViewController
            messageVC.message = nextScreenMsg
        }
        
    }
    
    @objc func hideAlert(button: UIButton){
        DispatchQueue.main.async { [self] in
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut) {
                shadowView.alpha = 0
                alertView.alpha = 0
            } completion: { _ in
                encryption_text_feild.placeholder = "Enter a message to be encrypted here!"
            }
            
            
        }
    }
    
    func configureProeccesBtn() {
        process_request_btn.configureGreenBtn()
        
        process_request_btn.removeTarget(self, action: #selector(encrypt_message(button:)), for: .touchUpInside)
        process_request_btn.removeTarget(self, action: #selector(decrypt_message(button:)), for: .touchUpInside)
        process_request_btn.addTarget(self, action: #selector(encrypt_message(button:)), for: .touchUpInside)
        
    }
    
    
    func checkRandomness() {
        
        switch randomAlph {
        case 1:
            alph1 = alphM
            alph2 = alphG
            alph3 = alphR
        case 2:
            alph1 = alphG
            alph2 = alphR
            alph3 = alphM
        case 3:
            alph1 = alphM
            alph2 = alphR
            alph3 = alphG
        default:
            print("default random alph")
        }
        
    }
    
}

extension EncryptDecryptViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
