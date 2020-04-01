//
//  ViewController.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation

class WelcomeVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton! {
        
        didSet {
            registerButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            registerButton.layer.shadowOpacity = 0.5
            registerButton.layer.shadowRadius = 5
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        
        didSet {
            loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            loginButton.layer.shadowOpacity = 0.5
            loginButton.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var time = 0.0
        let title = "🌴JungleChat🌴🐒"
        
        for char in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * time, repeats: false) { (timer) in
                self.titleLabel.text?.append(char)
            }
            time += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist") }
        navBar.isHidden = true
        
        PlayerService.playSound(song: "monkey", loopsCount: 7)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

