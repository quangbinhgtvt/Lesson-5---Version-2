//
//  ViewController.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/18/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    //outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotpasswordButton: UIButton!
    //vars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customizeLoginView()
        
        
    }

    // actions
    
    @IBAction func clickSignUp(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    
    
    // custome function
    
    private func customizeLoginView()
    {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username / email", attributes: attributes)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: attributes)
//        forgotpasswordButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
    }
}

