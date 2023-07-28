//
//  EncryptorFunctions.swift
//  Encryption
//
//  Created by Tommy Bartocci on 6/28/23.
//

import UIKit

extension UIButton {
    
    func encrypt(message: String) -> ProcessAttempt {
        let alphE = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        let numberVals = ["0","1","2","3","4","5","6","7","8","9"]
        let symbVals = [" ","~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","\\","|",";",":",#"''"#,#"""#,",","<",".",">","/","?"]
        
        let alphG = ["Φ", "Ρ", "Χ", "Ξ", "Τ", "Щ", "Λ", "Δ", "Ω", "Θ", "Σ", "Ν", "Υ", "Β", "Γ", "ङ", "Κ", "Ο", "Η", "Μ", "Α", "Ε", "Ψ", "Ζ", "Π", "Ι"]
        let alphM = ["၃", "၈", "တ", "င", "ဖ", "၇", "၆", "ထ", "ဟ", "က", "အ", "၄", "ဆ", "ၐ", "၅", "၀", "ဩ", "သ", "၂", "၉", "၏", "စ", "မ", "၁", "ပ", "န"]
        let alphR = ["Ж", "Н", "Я", "О", "Л", "А", "Й", "Р", "Ш", "Ч", "Ю", "Г", "К", "З", "Э", "Е", "Ë", "Ц", "Ф", "У", "П", "Х", "Ъ", "Д", "Ы", "В"]
        
        let newNumberVals = ["Б", "ခ", "Ь", "ည", "М", "С", "И", "Т", "လ", "ဘ"]
        let spaceVals = ["ക","ൠ"]
        
        // new values for symbols beyond numbers
        let backTickVals = ["重","人"]
        let tildeVals = ["月","戈"]
        let exclamationVals = ["ഊ","ഏ"]
        let atVals = ["ഠ","ഘ"]
        let hashtagVals = ["ള","ഋ"]
        let moneySignVals = ["ഭ","ഇ"]
        let percentVals = ["ഷ","ഈ"]
        let carrotVals = ["ധ","ഥ"]
        let ampersandVals = ["ഴ","ഞ"]
        let asterikVals = ["ഔ","ശ"]
        let leftParenthesisVals = ["ഢ","റ"]
        let rightParenthesisVals = ["大","中"]
        let dashVals = ["手","金"]
        let underScoreVals = ["竹","心"]
        let plusSignVals = ["弓","木"]
        let equalSignsVals = ["口","土"]
        let curlyLeftVals = ["尸","田"]
        let curlyRightVals = ["廿","卜"]
        let leftBracketsVals = ["山","十"]
        let rightBracketsVals = ["水","日"]
        let backSlackVals = ["火","女"]
        let verticalBarsVals = ["म","₹"]
        let colonVals = ["अ","ष"]
        let semiColonVals = ["र","ज"]
        let frontTickVals = ["न","ल"]
        let quotationVals = ["य","स"]
        let leftArrVals = ["त","क"]
        let commasVals = ["ഖ","ഫ"]
        let rightArrVals = ["ब","ग"]
        let periodVals = ["ണ","ഉ"]
        let forwardSlashVals = ["ह","प"]
        let questionMarkVals = ["എ","ഝ"]
        
        let alphRange = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
        
        var randomAlph = 0
        
        var alph1 = [String]()
        var alph2 = [String]()
        var alph3 = [String]()
        
        var validateCharBool: Bool = true

        var newLetterPosition = 0
        var newLetter = ""
        var newMessage = ""
        let addedShiftVal = Int.random(in: 0...24)
        
        randomAlph = Int.random(in: 1...3)
        
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
        
        checkRandomness()
        
        if message != "" {
            if !message.isBlank {
                var userText = message.trimmingCharacters(in: .whitespaces)
                var characterNum = 0
                
//                print("Text Input: " + userText + "\n")
//                print("Added Shift Val: " + String(format: "%02d", addedShiftVal) + "\n")
                userText += String(format: "%02d", addedShiftVal)
                userText += String(randomAlph)
//                print("Text after transformation: " + userText + "\n")
                
                for char in userText {
                    if alphE.contains(String(char).capitalized){
//                        print("valid character")
                    } else if symbVals.contains(String(char)){
//                        print("valid character")
                    } else if numberVals.contains(String(char)) {
//                        print("valid character")
                    } else {
                        validateCharBool = false
                        
                        return ProcessAttempt(type: "Encrypt", status: "fail", message: "Invalid characters detected, make sure your message contains the standard English letters and symbols.", btnTitle: "Try Again")
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
                                    newLetter = alphM[newLetterPosition]
                                } else if characterNum % 3 == 2 {
                                    newLetter = alphG[newLetterPosition]
                                } else if characterNum % 3 == 0 {
                                    newLetter = alphR[newLetterPosition]
                                }
                                newMessage += newLetter
                            }
                        }
                        
                        if numberVals.contains(String(eachChar)) {
                            for eachNumber in 0...(numberVals.count - 1) {
                                if String(eachChar) == numberVals[eachNumber] {
                                    newMessage += newNumberVals[eachNumber]
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
                    UIPasteboard.general.string = newMessage
                    
                    return ProcessAttempt(type: "Encrypt", status: "success", message: "Message copied! Paste and send to a friend!", btnTitle: "Dismiss")
                }
            } else {
                return ProcessAttempt(type: "Encrypt", status: "fail", message: "Please enter valid text into the textfield!", btnTitle: "Try Again")
            }
        } else {
            return ProcessAttempt(type: "Encrypt", status: "fail", message: "There must be text in the textfield to encrypt!", btnTitle: "Try Again")
        }
//
    }
    
    func decrypt(message: String) -> ProcessAttempt {
        
        let alphE = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        let numberVals = ["0","1","2","3","4","5","6","7","8","9"]
//        let symbVals = [" ","~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","\\","|",";",":",#"''"#,#"""#,",","<",".",">","/","?"]
        let alphG = ["Φ", "Ρ", "Χ", "Ξ", "Τ", "Щ", "Λ", "Δ", "Ω", "Θ", "Σ", "Ν", "Υ", "Β", "Γ", "ङ", "Κ", "Ο", "Η", "Μ", "Α", "Ε", "Ψ", "Ζ", "Π", "Ι"]
        let alphM = ["၃", "၈", "တ", "င", "ဖ", "၇", "၆", "ထ", "ဟ", "က", "အ", "၄", "ဆ", "ၐ", "၅", "၀", "ဩ", "သ", "၂", "၉", "၏", "စ", "မ", "၁", "ပ", "န"]
        let alphR = ["Ж", "Н", "Я", "О", "Л", "А", "Й", "Р", "Ш", "Ч", "Ю", "Г", "К", "З", "Э", "Е", "Ë", "Ц", "Ф", "У", "П", "Х", "Ъ", "Д", "Ы", "В"]
        
        let newNumberVals = ["Б", "ခ", "Ь", "ည", "М", "С", "И", "Т", "လ", "ဘ"]
        let spaceVals = ["ക","ൠ"]
        
        // new values for symbols beyond numbers
        let backTickVals = ["重","人"]
        let tildeVals = ["月","戈"]
        let exclamationVals = ["ഊ","ഏ"]
        let atVals = ["ഠ","ഘ"]
        let hashtagVals = ["ള","ഋ"]
        let moneySignVals = ["ഭ","ഇ"]
        let percentVals = ["ഷ","ഈ"]
        let carrotVals = ["ധ","ഥ"]
        let ampersandVals = ["ഴ","ഞ"]
        let asterikVals = ["ഔ","ശ"]
        let leftParenthesisVals = ["ഢ","റ"]
        let rightParenthesisVals = ["大","中"]
        let dashVals = ["手","金"]
        let underScoreVals = ["竹","心"]
        let plusSignVals = ["弓","木"]
        let equalSignsVals = ["口","土"]
        let curlyLeftVals = ["尸","田"]
        let curlyRightVals = ["廿","卜"]
        let leftBracketsVals = ["山","十"]
        let rightBracketsVals = ["水","日"]
        let backSlackVals = ["火","女"]
        let verticalBarsVals = ["म","₹"]
        let colonVals = ["अ","ष"]
        let semiColonVals = ["र","ज"]
//        let frontTickVals = ["न","ल"]
//        let quotationVals = ["य","स"]
        let leftArrVals = ["त","क"]
        let commasVals = ["ഖ","ഫ"]
        let rightArrVals = ["ब","ग"]
        let periodVals = ["ണ","ഉ"]
        let forwardSlashVals = ["ह","प"]
        let questionMarkVals = ["എ","ഝ"]
        
        let alphRange = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
        
//        var randomAlph = 0
        
        var alph1 = [String]()
        var alph2 = [String]()
        var alph3 = [String]()
        
        if message != "" {
            
            var newLetter = ""
            var newMessage = ""
            var encryptedShiftString = ""
            var shiftValStr = ""
            var shiftValStr2 = ""
            var shiftValInt = 0
            var alphNumString = ""
            var encryptedAlphNum = ""
            var encryptedMessage = message
            
            if message.count > 3 {
                encryptedAlphNum = String(encryptedMessage.last!)
                encryptedMessage.removeLast()
                encryptedShiftString = String(encryptedMessage.last!)
                encryptedMessage.removeLast()
                encryptedShiftString += String(encryptedMessage.last!)
                encryptedMessage.removeLast()
            }
            
            //find alphNum
            for eachChar in encryptedAlphNum {
                if newNumberVals.contains(String(eachChar)) {
                    for number in 0...(numberVals.count - 1) {
                        if String(eachChar) == newNumberVals[number] {
                            alphNumString += String(numberVals[number])
                        }
                    }
                }
            }
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
            
            shiftValStr2 = String(shiftValStr.reversed())
            if shiftValStr2.isInt {
                shiftValInt = Int(shiftValStr2)!
            } else {
                return ProcessAttempt(type: "Decrypt", status: "fail", message: "Message could not be decrypted. Make sure the secret message is from this app.", btnTitle: "Try Again")
            }
            
            if alphNumString == "1" {
                alph1 = alphM
                alph2 = alphG
                alph3 = alphR
            } else if alphNumString == "2" {
                alph1 = alphG
                alph2 = alphR
                alph3 = alphM
            } else if alphNumString == "3" {
                alph1 = alphM
                alph2 = alphR
                alph3 = alphG
            }
            
            for eachCharacter in encryptedMessage {
                if alph1.contains(String(eachCharacter)){
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
                return ProcessAttempt(type: "Decrypt", status: "success", message: "Decryption success! Let's see what they said...", btnTitle: "View Message", data: newMessage)
            } else {
                return ProcessAttempt(type: "Decrypt", status: "fail", message: "Message could not be decrypted. Be sure to enter an encrypted message.", btnTitle: "Try Again")
            }
        } else {
            return ProcessAttempt(type: "Decrypt", status: "fail", message: "You must enter something to be decrypted!", btnTitle: "Try Again")
        }
    }
}
