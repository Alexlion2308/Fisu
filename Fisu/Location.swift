//
//  Location.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Location: NSManagedObject {
    
    static func fetchLocations() -> [Location] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Location")
        do {
            let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Location]
            return result!
        } catch {
            fatalError("There was an error fetching the activities! \(error)")
        }
    }
}
