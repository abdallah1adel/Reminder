//
//  UIColorTransformer.swift
//  Reminder
//
//  Created by pcpos on 15/01/2025.
//

import UIKit

class UIColorTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        do {
            // For modern versions of iOS, use the secure encoding method
            return try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        } catch {
            print("Error archiving color: \(error)")
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do {
            // For modern versions of iOS, ensure reverse transformation is safe
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
        } catch {
            print("Error unarchiving color: \(error)")
            return nil
        }
    }
}

