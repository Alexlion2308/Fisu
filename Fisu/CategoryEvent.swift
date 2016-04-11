//
//  CategoryEvent.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


class CategoryEvent: NSManagedObject {

    func setCategoryEvent(name:  String?) -> CategoryEvent {
        self.name = name
        return self
    }
    
    func setCategoryEvent(name:  String?, events : NSSet?) -> CategoryEvent {
        self.name = name
        self.hasEvents = events
        return self
    }

// Insert code here to add functionality to your managed object subclass

}
