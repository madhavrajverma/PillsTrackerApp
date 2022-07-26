//
//  History+Extension.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation
import CoreData

extension History {
    
    static func save() {
        do {
            try CoreDataManager.shared.viewContext.save()
        }catch let error {
            print("error : \(error)")
        }
    }
    
    
    static func getAllHistory() -> [History] {
        let request :NSFetchRequest<History> = History.fetchRequest()
       request.sortDescriptors  = [NSSortDescriptor(key: "date", ascending: false)]
        
        
        do {
            return  try CoreDataManager.shared.viewContext.fetch(request)
        }catch {
            print("Unable To fetch movies form databse")
            return []
        }
        
    }
    
    static func historyById(id:NSManagedObjectID) -> History? {
        do {
            return try CoreDataManager.shared.viewContext.existingObject(with: id) as? History
        }catch {
            return nil
        }
    }
    
    static func delete(history:History) {
             CoreDataManager.shared.viewContext.delete(history)
    }
    
    
}
