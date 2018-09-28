//
//  LoginViewController.swift
//  MDBSocials
//
//  Created by Vaibhav Gattani on 27/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    var logoImageView: UIImageView!
    var socialLabel: UILabel!
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    
    var signUpButton: UIButton!
    var loginRegisterButton: UIButton!
    
    var ourUserID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 88, g: 186, b: 247)
        setupLogo()
        setupLoginRegisterButton()
        setupSignUpButton()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        loginRegisterButton.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func handleLogin() {
        var username: String?
        var password: String?
        if let usern = usernameTextField.text {
            username = usern
        }
        if usernameTextField.text == "" {
            self.loginRegisterButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Email Entered")
            return
        }
        if let pass = passwordTextField.text {
            password = pass
        }
        if passwordTextField.text == "" {
            self.loginRegisterButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Password Entered")
            return
        }
        
        /*let ref = Database.database().reference()
        let userRef = ref.child("users").child(username!)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let email = value?["email"] as? String ?? ""
            
            debugPrint("Got Email: " + email)
            self.callFunc(email, password!)
        }) { (error) in
            print(error.localizedDescription)
        }
     */
        Auth.auth().signIn(withEmail: username!, password: password!, completion: { (user, error) in
            if let error = error {
                self.loginRegisterButton.isUserInteractionEnabled = true
                print(error)
                self.displayAlert(title: "There was an error", message: "Trying to sign you in")
                return
            } else {
                self.ourUserID = user?.user.uid
                self.performSegue(withIdentifier: "toMainFeed", sender: self)
            }
        })
    }
    
    func callFunc(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                self.loginRegisterButton.isUserInteractionEnabled = true
                print(error)
                self.displayAlert(title: "There was an error", message: "Trying to sign you in")
                return
            } else {
                self.ourUserID = user?.user.uid
                self.performSegue(withIdentifier: "toMainFeed", sender: self)
            }
        })
    }

    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func moveToSignUp() {
        performSegue(withIdentifier: "signUp", sender: nil)
    }

    @objc func moveToMain() {
        handleLogin()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainFeed" {
            let destination = segue.destination as! UINavigationController
            let targetController = destination.topViewController as! MainViewController
            targetController.userID = ourUserID
        }
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    

}

