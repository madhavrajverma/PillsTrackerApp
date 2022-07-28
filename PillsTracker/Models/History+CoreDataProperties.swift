//
//  History+CoreDataProperties.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var count: Int16
    @NSManaged public var days: Int16
    @NSManaged public var date:Date?
    @NSManaged public var type: String?

}

extension History : Identifiable {

}
