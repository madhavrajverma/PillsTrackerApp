//
//  NotificationManager.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import Foundation
import UserNotifications

class NotificationManager :NSObject {
    
    static let instances = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    
   override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
    func requestAuthroization() {
        
        let options:UNAuthorizationOptions  = [.alert,.sound,.badge]
        
        notificationCenter.requestAuthorization(options: options) { (succes, error) in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print(succes)
            }
            
        }
    }
    
    func isAuthorizeForNotification() async ->  Bool {
        let authorization = await notificationCenter.notificationSettings()
        if authorization.authorizationStatus == .authorized {
            return true
        }else {
            return false
        }
    }
    
    func scheduleNotifications(medicine:Medicine,intakes:[Date],medicineId:String) async {
    
        let content = UNMutableNotificationContent()
        content.title = "Take Pills"
        content.body = "Take \(medicine.name ?? "Medicine")  on time to fit your health"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm.mp3"))
        
        
        for time in intakes {
            
            let components = Calendar.current.dateComponents([.hour,.minute], from:  time)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            let id = UUID().uuidString
            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

            
            // adding Notfication to notification View Model
            
            let notification = NotificationModel(context: CoreDataManager.shared.viewContext)
            notification.medicineId = medicineId
            notification.notificationId = id
            notification.medicine  = medicine
            
            Medicine.save()
             
            try? await notificationCenter.add(request)
        }
        
    }
    
    func getAllPendingNotification() {
        notificationCenter.getPendingNotificationRequests { request in
            print(request)
        }
    }
    func getDeliveredNotification(){
        notificationCenter.getDeliveredNotifications { (notifications) in
            for notification:UNNotification in notifications {
                print(notification.request.identifier)
            }
        }
    }
    
    func removeNotifciationWithId(id:[String]) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: id)
    }
    
    func removeAllPendingNotification() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func removeAllDelviredNotification() {
        notificationCenter.removeAllDeliveredNotifications()
    }
    
}



extension NotificationManager:UNUserNotificationCenterDelegate {
    
    // Foreground Notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.banner,.sound,.badge]
    }
    
    
}
