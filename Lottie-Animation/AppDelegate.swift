//
//  AppDelegate.swift
//  Lottie-Animation
//
//  Created by Cong Le on 10/30/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var navigationController: UINavigationController?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Set up style
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .red
    
    // Setup the view controllers
    let mainVC = ViewController()
    navigationController = UINavigationController(rootViewController: mainVC)
    window?.rootViewController = navigationController
    return true
  }

}

