//
//  MessageCell.swift
//  JungleChat
//
//  Created by Theodora on 4/2/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        messageView.layer.cornerRadius = 20
        leftImage.layer.cornerRadius = 15
        rightImage.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
}
