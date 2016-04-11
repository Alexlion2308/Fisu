//
//  Location.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


class Location: NSManagedObject {
    
    func setLocation(latitude : Double?, longitude : Double?, name:  String?) -> Location {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        return self
    }
    
    func setLocation(latitude : Double?, longitude : Double?, name:  String?, caterings : NSSet?, events : NSSet?) -> Location {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.caterings = caterings
        self.events = events
        return self
    }

// Insert code here to add functionality to your managed object subclass

}
