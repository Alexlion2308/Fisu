//
//  CategoryCatering.swift
//  Fisu
//
//  Created by Alexandre on 22/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData


class CategoryCatering: NSManagedObject {
    
    func setCategoryCatering(name : String?) -> CategoryCatering {
        self.name = name
        return self
    }
    
    func setCategoryCatering(name : String?, caterings : NSSet?) -> CategoryCatering {
        self.name = name
        self.hasCaterings = caterings
        return self
    }
// Insert code here to add functionality to your managed object subclass

}
