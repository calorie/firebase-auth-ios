//
//  LoginViewController.swift
//  firebase-auth-ios
//
//  Created by yu on 2019/12/07.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    var twitterProvider : OAuthProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.twitterProvider = OAuthProvider(providerID:"twitter.com");
    }
    
    @IBAction func tappedSignInWithTwitter(_ sender: Any) {
        self.twitterProvider?.getCredentialWith(_: nil){ (credential, error) in
            if error != nil {
                // Handle error.
            }
            if let credential = credential {
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if error != nil {
                        // Handle error.
                    }
                    
                    Auth.auth().currentUser?.getIDToken(completion: { (token, error) in
                        APIClient.sharedInstance.createUser(token: token!, success: { () in
                            let vc = UIStoryboard.main().instantiateInitialViewController()
                            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController = vc
                        }) {
                        }
                    })
                }
            }
        }
    }
}
