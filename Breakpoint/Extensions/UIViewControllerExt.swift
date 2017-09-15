//
//  UIViewControllerExt.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/15.
//  Copyright © 2017 Appdelight. All rights reserved.
//

//swift file
import UIKit

extension UIViewController {
    func presentDetail(_ viewControllToPresent: UIViewController) {
        let transition = CATransition()  //constant to hold the custom transition/animation
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
    
        present(viewControllToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()  //constant to hold the custom transition/animation
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
