//
//  ReminderApp.swift
//  Reminder
//
//  Created by pcpos on 13/01/2025.
//

import SwiftUI

@main
struct MyApp: App {
    init() {
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
//#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
