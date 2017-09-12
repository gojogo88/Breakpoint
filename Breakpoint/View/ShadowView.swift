//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//
//cocoatouch class
import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    }


}
