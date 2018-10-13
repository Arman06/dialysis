//
//  LoginViewController.swift
//  Dyal
//
//  Created by Арман on 5/1/18.
//  Copyright © 2018 Арман. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBoxBottomConstraint: NSLayoutConstraint!
    
    var constraintBottomAfter: CGFloat = 0.0
    
    
    @IBOutlet weak var bottomRegistrationConstraints: NSLayoutConstraint!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBoxSetup()
        loginButtonSetup()
        textFieldsSetup()
        configureTapGesture()
        loginBoxBottomConstraint.constant = view.frame.height / 2.5
        constraintBottomAfter = loginBoxBottomConstraint.constant
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func unwindTo(sender: UIStoryboardSegue) {}
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let info = notification.userInfo {
            let keyboardRect: CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1.5, animations:{
                    self.view.layoutIfNeeded()
                    self.loginBoxBottomConstraint.constant = self.constraintBottomAfter + 60
                    self.bottomRegistrationConstraints.constant = keyboardRect.height
                })
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 1.5, animations:{
            self.view.layoutIfNeeded()
            self.loginBoxBottomConstraint.constant -= 60
            self.bottomRegistrationConstraints.constant = 20
        })
    }
    func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    func loginButtonSetup(){
        loginButton.backgroundColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
        loginButton.layer.cornerRadius = 7
    }
    func textFieldsSetup(){
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    func loginBoxSetup(){
        loginBox.layer.cornerRadius = 10
        loginBox.layer.masksToBounds = true
        loginBox.layer.shadowColor = UIColor.black.cgColor
        loginBox.layer.shadowOffset = CGSize(width: 2, height: 15)
        loginBox.layer.shadowOpacity = 0.1
        loginBox.layer.shadowRadius = 4.0
        loginBox.layer.masksToBounds = false
        loginBox.layer.backgroundColor = UIColor.white.cgColor
    }
    @IBAction func loginTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func registrationTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}