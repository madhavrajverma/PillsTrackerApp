//
//  Medicine+CoreDataProperties.swift
//  PillsTracker
//
//  Created by Lakshya  Verma on 26/07/22.
//
//

import Foundation
import CoreData


extension Medicine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicine> {
        return NSFetchRequest<Medicine>(entityName: "Medicine")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var days: Int16
    @NSManaged public var count: Int16
    @NSManaged public var desc: String?
    @NSManaged public var freq: String?
    @NSManaged public var intakes: Array<Intake>?

}

// MARK: Generated accessors for intakes
extension Medicine {

    @objc(addIntakesObject:)
    @NSManaged public func addToIntakes(_ value: Intake)

    @objc(removeIntakesObject:)
    @NSManaged public func removeFromIntakes(_ value: Intake)

    @objc(addIntakes:)
    @NSManaged public func addToIntakes(_ values: Array<Intake>)

    @objc(removeIntakes:)
    @NSManaged public func removeFromIntakes(_ values: Array<Intake>)

}

extension Medicine : Identifiable {

}
