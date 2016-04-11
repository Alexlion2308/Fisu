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
    
    func setCatering(detail : String?, name : String?) -> Catering {
        self.detail = detail
        self.name = name
        return self
    }
    
    func setCatering(detail : String?, name : String?, category : CategoryCatering?, location : Location?) -> Catering {
        self.detail = detail
        self.name = name
        self.hasCategory = category
        self.hasLocation = location
        return self
    }
    
    static func fetchCaterings() -> [Catering] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Catering")
        do {
            let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Catering]
            return result!
        } catch {
            fatalError("There was an error fetching the caterings! \(error)")
        }
    }
}
