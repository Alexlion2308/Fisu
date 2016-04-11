//
//  Event.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Event: NSManagedObject {

    func setEvent(beginDate : NSDate?, chosen : Bool?, detail : String?, endDate : NSDate?, name : String?) -> Event {
        self.beginDate = beginDate
        self.chosen = chosen
        self.detail = detail
        self.endDate = endDate
        self.name = name
        return self
    }
    
    func setEvent(beginDate : NSDate?, chosen : Bool?, detail : String?, endDate : NSDate?, name : String?, category : CategoryEvent?, location : Location?, speakers : NSSet?) -> Event {
        self.beginDate = beginDate
        self.chosen = chosen
        self.detail = detail
        self.endDate = endDate
        self.name = name
        self.hasCategory = category
        self.hasLocation = location
        self.hasSpeakers = speakers
        return self
    }
    
    
// Insert code here to add functionality to your managed object subclass
    func switchValue() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        guard let isChosen = self.chosen else {
            return
        }
        self.chosen = !isChosen.boolValue
        
        app.saveContext()
        
    }
    
    static func fetchActivities() -> [Event] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Event")
        do {
            let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Event]
            return result! // si ça ne marche pas, mettre les attributs un par un
        } catch {
            fatalError("There was an error fetching the activities! \(error)")
        }
    }
    
    
    static func fetchMyActivities() -> [Event] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Event")
        fetchRequest.predicate = NSPredicate(format : "chosen == true")
        do {
            let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Event]
            return result! // si ça ne marche pas, mettre les attributs un par un
        } catch {
            fatalError("There was an error fetching my activities! \(error)")
        }
    }
}
