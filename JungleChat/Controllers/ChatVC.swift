//
//  ChatVC.swift
//  JungleChat
//
//  Created by Theodora on 3/31/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        messageTextField.layer.cornerRadius = 20
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.4156862745, green: 0.5490196078, blue: 0.6862745098, alpha: 1)
        loadMessages()
    }

    func loadMessages() {
        db.collection("messages").order(by: "data").addSnapshotListener { (querySnapshot, error) in

            self.messages = []

            if let e = error {
                print("There was an error data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)

                            DispatchQueue.main.async {
                                self.tableView.reloadData()

                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        PlayerService.playSound(song: "message", loopsCount: 0)
        
        if let messageSender = Auth.auth().currentUser?.email, let messageBody = messageTextField.text {
            db.collection("messages").addDocument(data: ["sender": messageSender, "body": messageBody, "data": Date().timeIntervalSince1970])
            { (error) in
                if let e = error {
                    print("Error adding document!: \(e)")
                } else {
                    print("Successfully saved data!")
                    
                    DispatchQueue.main.async {
                        self.messageTextField.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        do {
            try Auth.auth().signOut()
        } catch  let signOutError as NSError {
            print("error signing out \(signOutError)")
        }
    }
}

//MARK: - UITableViewDataSource

extension ChatVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageCell
        cell.myLabel.text = message.body
        cell.backgroundColor = .clear
        
        //This is a message from a current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
            cell.messageView.backgroundColor = #colorLiteral(red: 0.9456761479, green: 0.9753252864, blue: 0.7938107848, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0.4156862745, green: 0.5490196078, blue: 0.6862745098, alpha: 1)
        } else {
            //This is a message from another sender
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
            cell.messageView.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.9137254902, blue: 0.6862745098, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.4873478413, blue: 0.4774361849, alpha: 1)
        }
        return cell
    }
}



