//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextfield: InsetTextField!
    @IBOutlet weak var passwordTextfield: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    @IBAction func signinBtnPressed(_ sender: Any) {
        if emailTextfield.text != nil && passwordTextfield.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextfield.text!, andPassword: passwordTextfield.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextfield.text!, andPassword: self.passwordTextfield.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextfield.text!, andPassword: self.passwordTextfield.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered User")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

//we need this to better monitor what is happening in the textfield
extension LoginVC: UITextFieldDelegate {
    
}
