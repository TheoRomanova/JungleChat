//
//  RegisterVC.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        PlayerService.playSound(song: "register", loopsCount: 0)
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let  smthWrong = error {
                    let alert = UIAlertController(title: "\(smthWrong.localizedDescription)", message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Try again 🦧🌴", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion:nil)
                    
                } else {
                    PlayerService.getPlayer().stop()
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    // MARK: - Navigation
    
}
