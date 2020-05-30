//
//  HomeViewController.swift
//  My_App_Firebase
//
//  Created by Thien Tung on 5/28/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var jobTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
        
        //getData()
    }
    
    func getData() {
        //        db.collection("users").getDocuments() { (querySnapshot, err) in
        //            if let err = err {
        //                print("Error getting documents: \(err)")
        //            } else {
        //                for document in querySnapshot!.documents {
        //                    print("\(document.documentID) => \(document.data())")
        //                }
        //            }
        //        }
        //
        db.collection("person").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error is: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("ID: \(document.documentID)")
                    if let name = document.data()["name"] as? String,
                        let age = document.data()["age"] as? String,
                        let job = document.data()["job"] as? String {
                        
                        let person = Person(name: name, age: age, job: job)
                        print("Person: \(person.name), \(person.age), \(person.job)")
                    }
                }
            }
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
        titleLabel.text = "WELCOME"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 22)
        addButton.backgroundColor = .green
        addButton.layer.cornerRadius = 15.0
        addButton.clipsToBounds = true
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print("Error sign out: %@", signOutError)
        }
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        let person = Person(name: nameTF.text ?? "", age: ageTF.text ?? "", job: jobTF.text ?? "")
        db.collection("person").addDocument(data: person.dictionary)
        
        let alert = UIAlertController(title: "Thông báo", message: "Đã thêm thành công", preferredStyle: .alert)
        let action = UIAlertAction(title: "Xong", style: .default) { (result: UIAlertAction) -> Void in
            //self.db.collection("person").addDocument(data: person.dictionary)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func getDataAction(_ sender: Any) {
        getData()
    }
}
