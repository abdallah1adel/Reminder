//
//  MyList+CoreDataProperties.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//

import Foundation
import CoreData
import UIKit

extension MyList : Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }
    
    @NSManaged public var name: String
    @NSManaged public var color: UIColor
    @NSManaged public var reminders: NSSet?
}

extension MyList {
    static func createMock(name: String, color: UIColor, context: NSManagedObjectContext) {
        let list = MyList(context: context)
        list.name = name
        list.color = color
    }
}


extension MyList {
    
    @objc(addToRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminder)
    
    @objc(removeToRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: Reminder)
    
    @objc(addReminders:)
    @NSManaged public func addToReminders(_ value: NSSet)
    
    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ value: NSSet)
 
    
}
