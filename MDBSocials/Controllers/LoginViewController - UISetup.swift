//
//  LoginViewController-UISetup.swift
//  MDBSocials
//
//  Created by Vaibhav Gattani on 27/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    func setupLogo() {
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
    
    func setupLoginRegisterButton() {
        loginRegisterButton = UIButton(frame: CGRect(x: 20, y: view.frame.height - 200, width: view.frame.width - 40, height: 60))
        loginRegisterButton.backgroundColor = UIColor(r: 255, g: 223, b: 86)
        loginRegisterButton.setTitle("Login", for: UIControl.State())
        loginRegisterButton.setTitleColor(UIColor.white, for: UIControl.State())
        loginRegisterButton.layer.cornerRadius = 10
        loginRegisterButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 24.0)
        loginRegisterButton.addTarget(self, action: #selector(moveToMain), for: .touchUpInside)
        view.addSubview(loginRegisterButton)
    }
    
    func setupSignUpButton() {
        signUpButton = UIButton(frame: CGRect(x: 20, y: view.frame.height - 120, width: view.frame.width - 40, height: 40))
        signUpButton.backgroundColor = UIColor(r: 255, g: 223, b: 86)
        signUpButton.setTitle("Don't have an account? Click here", for: UIControl.State())
        signUpButton.setTitleColor(UIColor.white, for: UIControl.State())
        signUpButton.layer.cornerRadius = 10
        signUpButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 16.0)
        signUpButton.addTarget(self, action: #selector(moveToSignUp), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    func setupTextFields() {
        usernameTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2, width: view.frame.width - 20, height: 40))
        usernameTextField.placeholder = "Username"
        usernameTextField.layer.cornerRadius = 20
        usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: usernameTextField.frame.height))
        usernameTextField.leftViewMode = .always
        usernameTextField.backgroundColor = .white
        view.addSubview(usernameTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 50, width: view.frame.width - 20, height: 40))
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        view.addSubview(passwordTextField)

    }
    
    
}
