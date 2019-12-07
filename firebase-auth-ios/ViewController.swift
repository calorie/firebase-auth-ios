//
//  ViewController.swift
//  firebase-auth-ios
//
//  Created by yu on 2019/12/06.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    private var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                let vc = UIStoryboard.login().instantiateInitialViewController()
                UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController = vc
            }
        }
    }
}

