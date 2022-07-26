//
//  NotificationModel+Extension.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation
import CoreData

extension NotificationModel {
    
    static func fetchAllNotifications(id:NSManagedObjectID) -> [NotificationModel] {
        
        let medicine = Medicine.medicineById(id: id)
        guard let id = medicine?.medicineId else {
            return []
        }
        
        let request :NSFetchRequest<NotificationModel> =  NotificationModel.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@",#keyPath(Medicine.medicineId),id)
        
        do {
            return  try CoreDataManager.shared.viewContext.fetch(request)
        }catch {
            print("Unable To fetch movies form databse")
            return []
        }
        
    }
    
}
