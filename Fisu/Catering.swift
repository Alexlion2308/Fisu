//
//  Catering.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


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

// Insert code here to add functionality to your managed object subclass

}
