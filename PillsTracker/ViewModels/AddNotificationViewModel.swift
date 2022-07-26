//
//  AddNotificationViewModel.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 27/07/22.
//

import Foundation


class AddNotificationViewModel :ObservableObject {
    
    func saveNotification(med:MedicineViewModel) {
        
        let notification = NotificationModel(context: CoreDataManager.shared.viewContext)
       
    }
    
}
