//
//  UIStoryboardExtensions.swift
//  firebase-auth-ios
//
//  Created by yu on 2019/12/07.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func login() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.Login.rawValue, bundle: nil)
    }
    
    class func main() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.Main.rawValue, bundle: nil)
    }
}
