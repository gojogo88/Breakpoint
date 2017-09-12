//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Jonathan Go on 2017/09/12.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        if let loginVC = loginVC {
            present(loginVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
    }
    
    @IBAction func fbSignInBtnPressed(_ sender: Any) {
    }
    
}
