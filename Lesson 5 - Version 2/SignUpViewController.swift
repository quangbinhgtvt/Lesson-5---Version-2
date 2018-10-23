//
//  SignUpViewController.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/18/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeSignUpView()
    }
    

    //actions
    @IBAction func clickSignUpButton(_ sender: Any) {
        //check username
        if (usernameTextField.text?.isEmpty)! {
            alert(title: "UserName", message: "Ten nguoi dung khogn duoc de trong")
        }
        
        //check email
        if !(emailTextField.text?.isEmpty)! {
            
            if !isValidEmail(testStr: emailTextField.text!)
                
            {
                alert(title: "Email", message: "Hay nhap dung dinh dang email abc@xyz.com")
            }
       
        } else
        {
            alert(title: "OK", message: "email khong duoc de trong")
        }
        
        //check phone number
        let phoneNumber = phoneTextField.text
        if (phoneNumber?.isEmpty)! {
            alert(title: "Empty Phone Number", message: "So dien thoai khong duoc de trong")
        }
        else {
            if !validatePhone(phoneNumber: phoneNumber!){
                alert(title: "Invalid Phone Number", message: "Nhập số điện thoại có 10 hoặc 11 số với định dạng 0084 + số điện thoại")
            }
            
        }
        
        // check password
        if (passwordTextField.text!.count < 6 ){
            alert(title: "Password", message: "Pass phải có ít nhất 6 ký tự")
        }else {
            if validatePass(pass: passwordTextField.text!){
                alert(title: "Invalid pass", message: "Nhập pass có ít nhất 1 ký tự hoa, 1 ký tự đặc biêt")
            }
        }
        
       //self.dismiss(animated: true, completion: nil)
    }
    
    //customize signup view
    private func customizeSignUpView()
    {

        setPaddingWithImage(image: UIImage(named: "ic_user"), textField: usernameTextField)
        setPaddingWithImage(image: UIImage(named: "ic_mail"), textField: emailTextField)
        setPaddingWithImage(image: UIImage(named: "Phone Icon"), textField: phoneTextField)
        setPaddingWithImage(image: UIImage(named: "ic_lock"), textField: passwordTextField)
    }
    
    private func setPaddingWithImage(image: UIImage?, textField: UITextField){
        // create icon view
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 5, y: 5, width: 20.0, height: 20.0)

        textField.addSubview(imageView)
        textField.leftViewMode = .always
        //set padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: textField.frame.height))
        textField.leftView = paddingView
        
        //set bottom border
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor.white.cgColor
        
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
    }
    
    // custom function for validate
    private func alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in})
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    private func validatePhone(phoneNumber: String) -> Bool {
        let phoneRegex = "^((\\+)|(00))[0-9]{11,12}$";
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
    
    private func validatePass(pass: String) -> Bool{
            let passRegex = "^.*(?=.{6,})(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*\\d)|(?=.*[!#$%&?]).*$"
            let passTest = NSPredicate(format:"SELF MATCHES %@", passRegex)
            return passTest.evaluate(with: pass)
    }
    
}
