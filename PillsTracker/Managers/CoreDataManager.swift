//
//  CoreDataManager.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 25/07/22.
//

import CoreData
import SwiftUI

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "PillsAppModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
          
            if viewContext.hasChanges {
                do {
                    try viewContext.save()
                } catch {
                    // Show some error here
                }
            }
        }
    
}
