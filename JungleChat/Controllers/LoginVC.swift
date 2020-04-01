//
//  LoginVC.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField! 
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    private var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let url = Bundle.main.url(forResource: "login", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
