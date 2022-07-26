//
//  Intakes+Extension.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//

import Foundation
import CoreData


extension Intake {
    
    
    static func save() {
        do {
            try CoreDataManager.shared.viewContext.save()
        }catch let error {
            print("error : \(error)")
        }
    }
    
    
    static func getIntakeByMedicineId(medicineId: NSManagedObjectID) -> [Intake] {
        
        let request: NSFetchRequest<Intake> = Intake.fetchRequest()
        request.predicate = NSPredicate(format: "medicine = %@", medicineId)
        
        do {
            return try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
}
