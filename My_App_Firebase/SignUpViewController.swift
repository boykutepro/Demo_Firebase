//
//  SignUpViewController.swift
//  My_App_Firebase
//
//  Created by Thien Tung on 5/28/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        let email = emailTF.text!
        let password = passwordTF.text!
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if error != nil {
//                print(error)
//            } else {
//
//            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
