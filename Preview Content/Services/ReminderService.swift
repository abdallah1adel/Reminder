//
//  ReminderService.swift
//  Reminder
//
//  Created by pcpos on 15/01/2025.
//

import Foundation
import CoreData
import UIKit

class ReminderService {
    
    // MARK: - Core Data Context
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    // MARK: - Save Context
    static func save() throws {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
                print("Context saved successfully.")
            } catch {
                print("Error saving context: \(error)")
                throw error
            }
        }
    }
    
    // MARK: - Save a New List
    static func saveMyList(_ name: String, _ color: UIColor) throws {
        print("Attempting to save list: Name = \(name), Color = \(color)")
        
        let myList = MyList(context: viewContext)
        myList.name = name
        myList.color = color
        
        try save() // Simplified call to save context
    }
    
    // MARK: - Fetch All Lists
    static func fetchAllMyLists() -> [MyList] {
        let fetchRequest: NSFetchRequest<MyList> = MyList.fetchRequest()
        
        do {
            let lists = try viewContext.fetch(fetchRequest)
            print("Fetched \(lists.count) lists")
            return lists
        } catch {
            print("Failed to fetch lists: \(error)")
            return []
        }
    }
    
    // MARK: - Delete a List
    static func deleteMyList(myList: MyList) throws {
        viewContext.delete(myList)
        try save()
        print("List deleted successfully.")
    }
    
    static func saveReminderToMyList(myList: MyList,reminderTitle: String) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = reminderTitle
        myList.addToReminders(reminder)
        try save()
    }
}

