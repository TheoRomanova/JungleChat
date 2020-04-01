//
//  LoginVC.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField! 
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        PlayerService.playSound(song: "login", loopsCount: 0)
        
        if let email = emailTextField.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let smthWrong = error {
                    let alert = UIAlertController(title: "\(smthWrong.localizedDescription)", message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Try again 🦧🌴", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    PlayerService.playSound(song: "login", loopsCount: 0)
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
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
