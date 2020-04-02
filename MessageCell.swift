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
        
        leftImage.layer.borderWidth = 3
        leftImage.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        leftImage.layer.cornerRadius = leftImage.frame.height/2
        leftImage.clipsToBounds = true
        
        rightImage.layer.borderWidth = 3
        rightImage.layer.borderColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        rightImage.layer.cornerRadius = leftImage.frame.height/2
        rightImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
}
