//
//  Speaker.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


class Speaker: NSManagedObject {
    
    func setSpeaker(designation : String?, detail : String?, name:  String?, surname : String?) -> Speaker {
        self.designation = designation
        self.detail = detail
        self.name = name
        self.surname = surname
        return self
    }
    
    func setSpeaker(designation : String?, detail : String?, name:  String?, surname : String?, speaksEvents : NSSet?) -> Speaker {
        self.designation = designation
        self.detail = detail
        self.name = name
        self.surname = surname
        self.speaksEvents = speaksEvents
        return self
    }
// Insert code here to add functionality to your managed object subclass

}
