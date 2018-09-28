//
//  SignUpViewController - UISetup.swift
//  MDBSocials
//
//  Created by Vaibhav Gattani on 27/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension SignUpViewController {

    func setUpLogo() {
        logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        logoImageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 4)
        logoImageView.image = UIImage(named: "mdb_textonly_gold")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        
        socialLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        socialLabel.center = CGPoint(x: view.frame.width/2, y: logoImageView.frame.maxY - 20)
        socialLabel.text = "SOCIALS"
        socialLabel.font = UIFont(name: "AvenirNext-Bold", size: 48.0)
        socialLabel.textAlignment = .center
        socialLabel.textColor = UIColor(r: 255, g: 223, b: 86)
        view.addSubview(socialLabel)
    }
    
    func setupTextFields() {
        nameTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2, width: view.frame.width - 20, height: 40))
        nameTextField.layer.cornerRadius = 20
        nameTextField.placeholder = "Full Name"
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: nameTextField.frame.height))
        nameTextField.leftViewMode = .always
        nameTextField.backgroundColor = .white
        view.addSubview(nameTextField)
        
        emailTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 50, width: view.frame.width - 20, height: 40))
        emailTextField.placeholder = "Email Address"
        emailTextField.layer.cornerRadius = 20
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.backgroundColor = .white
        view.addSubview(emailTextField)
        
        usernameTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 100, width: view.frame.width - 20, height: 40))
        usernameTextField.layer.cornerRadius = 20
        usernameTextField.placeholder = "Username"
        usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: usernameTextField.frame.height))
        usernameTextField.leftViewMode = .always
        usernameTextField.backgroundColor = .white
        view.addSubview(usernameTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 150, width: view.frame.width - 20, height: 40))
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = .white
        view.addSubview(passwordTextField)
        
        }
    
    func setupSignUpButton() {
        signUpButton = UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 60))
        signUpButton.backgroundColor = UIColor(r: 255, g: 223, b: 86)
        signUpButton.setTitle("Sign Up!", for: UIControl.State())
        signUpButton.setTitleColor(UIColor.white, for: UIControl.State())
        signUpButton.layer.cornerRadius = 10
        signUpButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 16.0)
        signUpButton.addTarget(self, action: #selector(registerNewUser), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
}
