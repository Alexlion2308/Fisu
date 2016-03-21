//
//  Event+CoreDataProperties.swift
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

extension Event {

    @NSManaged var beginDate: NSDate?
    @NSManaged var chosen: NSNumber?
    @NSManaged var detail: String?
    @NSManaged var endDate: NSDate?
    @NSManaged var name: String?
    @NSManaged var picture: NSData?
    @NSManaged var hasCategory: CategoryEvent?
    @NSManaged var hasLocation: Location?
    @NSManaged var hasSpeakers: NSSet?

}
