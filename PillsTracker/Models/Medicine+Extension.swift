//
//  Medicine+Extension.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import Foundation
import CoreData

extension Medicine {
    
    var medicineType: MedicineType {
        get { return MedicineType.init(rawValue: String(type ?? "")) ?? .tablet}
        set { type = String(newValue.rawValue) }
    }
    
    var frequency: Frequency {
        get { return Frequency.init(rawValue: String(freq ?? "")) ?? .once}
        set { freq = String(newValue.rawValue) }
    }
    
    static func medicineById(id:NSManagedObjectID) -> Medicine? {
        do {
            return try CoreDataManager.shared.viewContext.existingObject(with: id) as? Medicine
        }catch {
            return nil
        }
    }
    
    static func save() {
        do {
            try CoreDataManager.shared.viewContext.save()
        }catch let error {
            print("error : \(error)")
        }
    }
    
    static func delete(medicine:Medicine) {
             CoreDataManager.shared.viewContext.delete(medicine)
    }
    
     
    static func save(completion: @escaping () -> Void) {
        do {
            try CoreDataManager.shared.viewContext.save()
             completion()
        }catch let error {
            print("error : \(error)")
        }
    }
    
    
    static func getAllMedicines() -> [Medicine] {
        let request :NSFetchRequest<Medicine> = Medicine.fetchRequest()
        //        request.sortDescriptors  = [NSSortDescriptor(key: "time", ascending: false)]
        
        
        do {
            return  try CoreDataManager.shared.viewContext.fetch(request)
        }catch {
            print("Unable To fetch movies form databse")
            return []
        }
        
    }
    
    
}
