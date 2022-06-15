//
//  LocalNotificationManager.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/05.
//

import Foundation
import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class LocalNotificationManager {
    var notifications = [Notification]()
    
    func requestPermission(onComplete: @escaping (() -> Void)) {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .provisional, .sound]) { isGranted, error in
                print(isGranted, error)
                onComplete()
            }
    }
    
    func addNoti(title: String) {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }
    
    func scheduleNoti() {
        notifications.forEach { noti in
            let content = UNMutableNotificationContent()
            content.title = noti.title
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
            let request = UNNotificationRequest(identifier: noti.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { err in
                if let err = err {
                    print("ERROR", err)
                    return
                }
                print("SCHDULE NOTI")
            }
        }
    }
    
}
