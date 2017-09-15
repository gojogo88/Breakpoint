//
//  UserCell.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/13.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    //used to toggle the checkmark
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //adding showing gives us a variable that can be toggled on and off (selected or not)
        if selected {
            if showing == false {
                checkImage.isHidden = false
                showing = true
            } else {
                checkImage.isHidden = true
                showing = false
            }
        }
    }
    
    func configureCell(profileImage image: UIImage, email: String, isSlected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        
        if isSlected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }

}
