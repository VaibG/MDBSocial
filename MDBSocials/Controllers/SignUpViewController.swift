//
//  SignUpViewController.swift
//  MDBSocials
//
//  Created by Vaibhav Gattani on 27/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    var logoImageView: UIImageView!
    var socialLabel: UILabel!
    
    var nameTextField: UITextField!
    var emailTextField: UITextField!
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    
    var signUpButton: UIButton!
    
    var ourUserID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        view.backgroundColor = UIColor(r: 88, g: 186, b: 247)
        setUpLogo()
        setupTextFields()
        setupSignUpButton()
        
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func registerNewUser() {
        handleRegister()
    }
    
    func handleRegister() {
        var name: String?
        var email: String?
        var username: String?
        var password: String?
        if let newName = nameTextField.text {
            name = newName
        }
        
        if nameTextField.text == "" {
            self.signUpButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Name Entered")
            return
        }
        if let em = emailTextField.text {
            email = em
        }
        if emailTextField.text == "" {
            self.signUpButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Email Entered")
            return
        }
        if let newUser = usernameTextField.text {
            username = newUser
        }
        if usernameTextField.text == "" {
            self.signUpButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Username Entered")
            return
        }
        if let pass = passwordTextField.text {
            password = pass
        }
        if passwordTextField.text == "" {
            self.signUpButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Password Entered")
            return
        }

        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user, error) in
            if let error = error {
                self.signUpButton.isUserInteractionEnabled = true
                print(error)
                self.displayAlert(title: "There was an error", message: "Trying to make you")
                return
            } else {

                guard (user?.user.uid) != nil else {
                    return
                }
                let ref = Database.database().reference()
                let userRef = ref.child("users").child(username!)
                let values = ["Name": name, "Username": username, "Email": email]

                userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    if error != nil {
                        print(error)
                        return
                    } else {
                        self.ourUserID = user?.user.uid
                        self.performSegue(withIdentifier: "toMainFeed", sender: self)
                    }
                })
            }
        })
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainFeed" {
            let destination = segue.destination as! MainViewController
            destination.userID = ourUserID
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
