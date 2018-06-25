//
//  AppDelegate.swift
//  iOS-Test
//
//  Created by Manjeet Singh on 13/2/18.
//  Copyright © 2018 Manjeet Singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router :Router?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        application.statusBarStyle = .lightContent
        
        if let window = window {
            router = Router(window: window)
        }
        
        return true
    }
}

