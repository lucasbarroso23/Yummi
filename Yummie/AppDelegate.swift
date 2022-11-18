//
//  AppDelegate.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 11/11/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // storyboard and controllers instanciations
        self.window = UIWindow()            
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let onboarding = sb.instantiateViewController(withIdentifier: "Onboarding")
        let home = sb.instantiateViewController(withIdentifier: "HomeNC")
       
        // setting the default key to persist the first use info
        let firstLaunch = UserDefaults.standard.bool(forKey: "FIRST-LAUNCH")
        // using the firstLaunch info the set the root view controller
        let rootViewController = !firstLaunch ?
            onboarding : home
       
        // setting the root view controller and making visible
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        
        // navigation bar style customizations
        UINavigationBar.appearance()
            .setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .black
        
        return true
    }



}

