//
//  FactoryInit.swift
//  Fisu
//
//  Created by Alexandre on 11/04/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class FactoryInit {
    
    static func initCoreData() {
        let firstStart: Bool? = NSUserDefaults.standardUserDefaults().objectForKey("firstStart") as? Bool
        
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.managedObjectContext
        
        if firstStart == nil || firstStart == true {
            
            //NSEntityDescriptions Creating
            let locationEntity: NSEntityDescription? = NSEntityDescription.entityForName("Location", inManagedObjectContext: context)
            let categoryCateringEntity: NSEntityDescription? = NSEntityDescription.entityForName("CategoryCatering", inManagedObjectContext: context)
            let categoryEventEntity: NSEntityDescription? = NSEntityDescription.entityForName("CategoryEvent", inManagedObjectContext: context)
            let speakerEntity: NSEntityDescription? = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: context)
            let eventEntity: NSEntityDescription? = NSEntityDescription.entityForName("Event", inManagedObjectContext: context)
            let cateringEntity: NSEntityDescription? = NSEntityDescription.entityForName("Catering", inManagedObjectContext: context)
            
            if locationEntity != nil && categoryCateringEntity != nil && categoryEventEntity != nil && speakerEntity != nil && eventEntity != nil && cateringEntity != nil {
                let location: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                location.setLocation(<#T##latitude: Double?##Double?#>, longitude: <#T##Double?#>, name: <#T##String?#>)
                
                let categoryCatering: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCatering.setCategoyCatering(<#T##name: String?##String?#>)
                
                let categoryEvent: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEvent.setCategoyEvent(<#T##name: String?##String?#>)
                
                let speaker: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker.setCategoyCatering(<#T##designation: String?##String?#>, detail: <#T##String?#>, name: <#T##String?#>, surname: <#T##String?#>)
                
                let event: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                
                let catering: Catering = Catering(entity : cateringEntity!, insertIntoManagedObjectContext: context)
                
            }
            if appDelegate.managedObjectContext.hasChanges {
                appDelegate.saveContext()
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            }
        }


    }
    
}
