//
//  ViewController.swift
//  PostLocalNotification
//
//  Created by Sudipta Kumar Bhattacharjee on 30/01/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postLocalNotifcation()
    }
    
    func postLocalNotifcation() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.body = "Hey man, How are you"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.2, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    func printTextSomething() {
        print("something")
    }


}

