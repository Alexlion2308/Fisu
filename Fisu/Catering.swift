//
//  Catering.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Catering: NSManagedObject {
    
    
    
    static func fetchCaterings() -> [Catering] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Catering")
        do {
            let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Catering]
            return result! // si ça ne marche pas, mettre les attributs un par un
        } catch {
            fatalError("There was an error fetching the caterings! \(error)")
        }
    }
}
