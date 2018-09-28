////
////  FirebaseAPIClient.swift
////  MDBSocials
////
////  Created by Vaibhav Gattani on 27/9/18.
////  Copyright © 2018 Vaibhav Gattani. All rights reserved.
////
//
//
//import Firebase
//import UIKit
//import FirebaseStorage
//
//class FirebaseAPIClient {
//
//    static let ref = Database.database().reference()
//    //static let storageRef = Storage.storage().reference()
//
//    static func registerUser(_ name: String, _ username: String, _ email: String, _ password: String, completion: @escaping (User?) -> ()) {
//        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
//            guard error == nil else {
//                completion(nil)
//                return
//            }
//            guard let uid = user?.user.uid else {
//                return
//            }
//
//            let userRef = ref.child("users").child(username)
//            let values = ["name": name, "username": username, "email": email]
//
//            userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
//                if error != nil {
//                    print(error)
//                    completion(nil)
//                } else {
//                    completion(user?.user)
//                }
//            })
//        })
//    }
//
//    static func signIn(_ view: LoginViewController, _ email: String, _ password: String) {
//        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
//            if let error = error {
//                view.loginRegisterButton.isUserInteractionEnabled = true
//                print(error)
//                view.displayAlert(title: "There was an error", message: "Trying to sign you in")
//                return
//            } else {
//                view.ourUserID = user?.user.uid
//                view.performSegue(withIdentifier: "toMainFeed", sender: self)
//            }
//        })
//    }
//
//    static func logOut(completion: @escaping (Bool) -> ()) {
//        do {
//            try Auth.auth().signOut()
//        } catch let error{
//            print(error)
//            completion(false)
//        }
//        completion(true)
//    }
//}
//    /*
//    static func putImage(_ snapImage: SnapImage, completion: @escaping (Bool) -> ()) {
//        let newKey = ref.child("snapImages").childByAutoId().key
//        storageRef.child("images/\(newKey).jpg").putData(UIImagePNGRepresentation(snapImage.image)!, metadata: nil, completion: { (metadata, error) in
//            guard let metadata = metadata else {
//                // Uh-oh, an error occurred!
//                completion(false)
//                return
//            }
//            storageRef.child("images/\(newKey).jpg").downloadURL(completion: { (url, error) in
//                guard let downloadURL = url else {
//                    // Uh-oh, an error occurred!
//                    completion(false)
//                    return
//                }
//                let snapImageDatabase = ["sender": snapImage.sender,
//                                 "sentTo": snapImage.sentTo,
//                                 "opened": snapImage.opened,
//                                 "timeSent" : Constants.dateToString(snapImage.timeSent),
//                                 "image" : downloadURL.absoluteString] as [String : Any]
//                let childUpdates = ["/snapImages/\(newKey)": snapImageDatabase]
//                ref.updateChildValues(childUpdates)
//                completion(true)
//            })
//        })
//    }
//
//    static func getSnapImage(_ withId: String, completion: @escaping (SnapImage?) -> ()) {
//        ref.child("snapImages/\(withId)").observe(.value, with: { (snapshot) in
//            guard var snapImageDict = snapshot.value as? [String: Any] else {
//                completion(nil)
//                return
//            }
//            guard let imageURL = snapImageDict["image"] else {
//                completion(nil)
//                return
//            }
//
//            getImage(withURL: imageURL as! String, finishedGettingPic: { (image) in
//                snapImageDict["image"] = image
//                let snapImage = SnapImage(uid: withId, dict: snapImageDict)
//                completion(snapImage)
//            })
//        })
//    }
//
//    static func getImage(withURL: String, finishedGettingPic: @escaping (UIImage?) -> ()) {
//        let urlRef = Storage.storage().reference(forURL: withURL)
//
//        // Download in memory with a maximum allowed size of 1MB (1 * 2048 * 2048 bytes)
//        urlRef.getData(maxSize: 2048 * 2048) { data, error in
//            if let error = error {
//                // Uh-oh, an error occurred!
//                finishedGettingPic(nil)
//            } else {
//                // Data for image is returned
//                let image = UIImage(data: data!)
//                finishedGettingPic(image)
//            }
//        }
//
//    }
//}*/
