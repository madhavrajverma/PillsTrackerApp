//
//  Intake+CoreDataProperties.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//
//

import Foundation
import CoreData


extension Intake {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Intake> {
        return NSFetchRequest<Intake>(entityName: "Intake")
    }

    @NSManaged public var time: Date?
    @NSManaged public var medicine: Medicine?

}

extension Intake : Identifiable {

}
