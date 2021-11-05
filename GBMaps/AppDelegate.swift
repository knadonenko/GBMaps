//
//  AppDelegate.swift
//  GBMaps
//
//  Created by Константин Надоненко on 05.11.2021.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyCO7946yhVz6ibVwmu8OW30Nk8aqetVIJo")
        return true
    }

}

