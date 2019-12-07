//
//  AppDelegate.swift
//  firebase-auth-ios
//
//  Created by yu on 2019/12/06.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        do {
            //try Auth.auth().signOut()
        } catch let signOutError as NSError {
            // TODO
        }
        

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        var vc: UIViewController?
        if Auth.auth().currentUser == nil {
            vc = UIStoryboard.login().instantiateInitialViewController()
        } else {
            vc = UIStoryboard.main().instantiateInitialViewController()
        }

        self.window?.rootViewController = UINavigationController(rootViewController: vc!)
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

