//
//  RegisterVC.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftUI

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField! {
      
        didSet {
            emailTextField.layer.cornerRadius = 20
            emailTextField.clipsToBounds = true
        }
    }
   
    @IBOutlet weak var passwordTextField: UITextField! {
        
        didSet {
            passwordTextField.layer.cornerRadius = 20
            passwordTextField.clipsToBounds = true
        }
    }
    
    private var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func registerTapped(_ sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "register", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }

    // MARK: - Navigation
    
}
