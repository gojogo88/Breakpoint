//
//  InsetTextField.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//

//cocoatouch file
import UIKit

class InsetTextField: UITextField {

    //private var textRectOffset: CGFloat = 20  //CGFloat is what is required to modify the view. offset that tells us how far we want to shift the rectangle
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)  //what it should look like on the rectangle itself
    
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])  //sets the forground color to white
        
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }
    
    //when we are just looking at the rect (where the text is held)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)  //bounds is the default rectangle of the textfield
        
    }
    
    //when we are typing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    //for the placeholder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
//    func setupView() {    we're only calling it once so no need for this. we can put it directly in awakefromnib.
//
//    }
}
