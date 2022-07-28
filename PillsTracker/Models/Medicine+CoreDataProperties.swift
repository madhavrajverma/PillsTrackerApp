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

    @NSManaged public var count: Int16
    @NSManaged public var days: Int16
    @NSManaged public var desc: String?
    @NSManaged public var dosages:String
    @NSManaged public var freq: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var intakes: NSSet?
    @NSManaged public var notifications: NSSet?
    @NSManaged public var medicineId:String
    

}

// MARK: Generated accessors for intakes
extension Medicine {

    @objc(addIntakesObject:)
    @NSManaged public func addToIntakes(_ value: Intake)

    @objc(removeIntakesObject:)
    @NSManaged public func removeFromIntakes(_ value: Intake)

    @objc(addIntakes:)
    @NSManaged public func addToIntakes(_ values: NSSet)

    @objc(removeIntakes:)
    @NSManaged public func removeFromIntakes(_ values: NSSet)

}

// MARK: Generated accessors for notifications
extension Medicine {

    @objc(addNotificationsObject:)
    @NSManaged public func addToNotifications(_ value: NotificationModel)

    @objc(removeNotificationsObject:)
    @NSManaged public func removeFromNotifications(_ value: NotificationModel)

    @objc(addNotifications:)
    @NSManaged public func addToNotifications(_ values: NSSet)

    @objc(removeNotifications:)
    @NSManaged public func removeFromNotifications(_ values: NSSet)

}

extension Medicine : Identifiable {

}
