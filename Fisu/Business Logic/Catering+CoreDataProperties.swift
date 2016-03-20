//
//  Catering+CoreDataProperties.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Catering {

    @NSManaged var detail: String?
    @NSManaged var latitude: Float
    @NSManaged var longitude: Float
    @NSManaged var name: String?
    @NSManaged var picture: NSData?
    @NSManaged var hasCategory: NSManagedObject?

}
