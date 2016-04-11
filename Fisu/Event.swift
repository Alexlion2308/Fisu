//
//  Event.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


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
    func switchValue(app : AppDelegate) {
        guard let isChosen = self.chosen else {
            return
        }
        self.chosen = !isChosen.boolValue
        
        app.saveContext()
        
    }

}
