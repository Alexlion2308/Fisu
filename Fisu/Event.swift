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

// Insert code here to add functionality to your managed object subclass
    func switchValue(app : AppDelegate) {
        guard let isChosen = self.chosen else {
            return
        }
        self.chosen = !isChosen.boolValue
        
        app.saveContext()
        
    }

}
