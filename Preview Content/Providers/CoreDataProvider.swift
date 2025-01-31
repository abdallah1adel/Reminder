//
//  CoreDataProvider.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        // Register ValueTransformer for UIColor
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        // Initialize Persistent Container
        persistentContainer = NSPersistentContainer(name: "RemindersModel") // Replace with your .xcdatamodeld file name
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Context saved successfully.")
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}

