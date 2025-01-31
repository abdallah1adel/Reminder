//
//  PreviewData.swift
//  Reminder
//
//  Created by pcpos on 16/01/2025.
//

import Foundation
import CoreData

class PreviewData {
    
    static var myList: MyList {
        
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyList()
        
    }
    
}
