//
//  ViewController.swift
//  My_App_Firebase
//
//  Created by Taof on 5/28/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet var usernameTF: UITextField!
    
    @IBOutlet var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func signinAction(_ sender: Any) {
        let email = usernameTF.text!
        let password = passwordTF.text!
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
                print(authResult)
            } else {
                print("Login Success")
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC")
                homeVC?.modalPresentationStyle = .fullScreen
                self.present(homeVC!, animated: true, completion: nil)
            }
        }
    }
    
}

