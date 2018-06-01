//
//  LeftSidePanelVC.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 5/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signupLoginButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        present(loginVC!, animated: true, completion: nil)
    }
}
