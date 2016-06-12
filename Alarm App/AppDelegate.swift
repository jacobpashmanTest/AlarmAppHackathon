//
//  AppDelegate.swift
//  Alarm App
//
//  Created by Jacob Pashman on 6/11/16.
//  Copyright © 2016 Jacob-Ari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let notifiactionSettings = UIUserNotificationSettings(forTypes: [.Badge, .Alert, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notifiactionSettings)
        self.createLocalNotification()
        return true
    }

    func createLocalNotification() {
        print("Date \(NSDate())")
        let localNotification = UILocalNotification()
//        let time = defaults.objectForKey("pageDataTimeGlobal") as! [NSDate]!
//        let time2 = time[1]
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        localNotification.applicationIconBadgeNumber = 1
        localNotification.soundName = "sunnyalarm_GUwAcclY2.wav"
        
        localNotification.userInfo = [
            "message" : "Time to wake up!"
        ]
        localNotification.alertBody = "Time to wake up"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
        defaults.setObject(pageAmountGlobal, forKey: "pageAmountGlobal")
        defaults.setObject(pageDataTimeGlobal, forKey: "pageDataTimeGlobal")
    }

    func applicationWillEnterForeground(application: UIApplication) {
    
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

