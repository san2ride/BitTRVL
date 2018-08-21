//
//  LoginVC.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 5/31/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate, Alertable {
    
    @IBOutlet weak var emailField: RoundedCornerTextField!
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authButton: RoundedShadowButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        view.bindToKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func authButtonPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            authButton.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
            
            if let email = emailField.text, let password = passwordField.text {
                Auth.auth().signIn(withEmail: email, password: password,
                    completion: { (authResult, error) in
                    if error == nil {
                        if let user = authResult?.user {
                            if self.segmentedControl.selectedSegmentIndex == 0 {
                                let userData = ["provider": user.providerID ] as [String: Any]
                                DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider": user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: true)
                            }
                        }
                        print("Email user authenticated successfully with Firebase")
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        if let errorCode = AuthErrorCode(rawValue: error!._code) {
                            switch errorCode {
                            case .wrongPassword:
                                self.showAlert("Whoops! That was the wrong password!")
                            default:
                                self.showAlert("An unexpected error occurred. Please try again.")
                            }
                        }
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (authResult, error) in
                            if error != nil {
                                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                                    switch errorCode {
                                    case .invalidEmail:
                                        self.showAlert("That is an invalid email! Please try again.")
                                    default:
                                        self.showAlert("An unexpected error occurred. Please try again.")
                                    }
                                }
                            } else {
                                if let user = authResult?.user {
                                    if self.segmentedControl.selectedSegmentIndex == 0 {
                                        let userData = ["provider": user.providerID] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: false)
                                    } else {
                                        let userData = ["provider": user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: true)
                                    }
                                }
                                print("Successfully created a new user with Firebase")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }
                })
            }
        }
    }
}
