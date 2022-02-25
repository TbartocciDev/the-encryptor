//
//  HowToViewController.swift
//  Encryption
//
//  Created by Tommy Bartocci on 10/31/21.
//

import UIKit
import AVKit
import AVFoundation

class HowToViewController: UIViewController {
    @IBOutlet weak var playBtn: UIButton!
    
    let instructionArr = ["Type or paste your own message into the encrpytion tab", "Ok now try that", "Ok now lastly do this dude"]
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        playBtn.layer.cornerRadius = playBtn.bounds.width / 10
        playBtn.setTitle("", for: .normal)
        playBtn.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        
        playBtn.layer.borderWidth = 1
        playBtn.layer.borderColor = UIColor.init(named: "EncryptionUITextColor")?.cgColor
        
    }
    @objc
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "Encryptor-Video3", ofType: "mp4") else {
            debugPrint("Encryptor-Video2.mp4 not found.")
            return
        }
        
        let videoPath = URL(fileURLWithPath: path)
        player = AVPlayer(url: videoPath)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
        
    }
    
    
    
}
