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

                /*
                
                let location: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                location.setLocation(<#T##latitude: Double?##Double?#>, longitude: <#T##Double?#>, name: <#T##String?#>)
                
                let categoryCatering: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCatering.setCategoryCatering(<#T##name: String?##String?#>)
                
                let categoryEvent: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEvent.setCategoryEvent(<#T##name: String?##String?#>)
                
                let speaker: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker.setSpeaker(<#T##designation: String?##String?#>, detail: <#T##String?#>, name: <#T##String?#>, surname: <#T##String?#>)
                
                let event: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event.setEvent(<#T##beginDate: NSDate?##NSDate?#>, chosen: <#T##Bool?#>, detail: <#T##String?#>, endDate: <#T##NSDate?#>, name: <#T##String?#>, category: <#T##CategoryEvent?#>, location: <#T##Location?#>, speakers: <#T##NSSet?#>)
                
                let catering: Catering = Catering(entity : cateringEntity!, insertIntoManagedObjectContext: context)
                catering.setCatering(<#T##detail: String?##String?#>, name: <#T##String?#>, category: <#T##CategoryCatering?#>, location: <#T##Location?#>)
                
                */
                
                // Set Locations
                let locationLawFaculty: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationLawFaculty.setLocation(43.614081, longitude: 3.877185, name: "Law Faculty")
                
                let locationSaintCharles: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationSaintCharles.setLocation(43.616035, longitude: 3.872162, name: "Saint Charles")
                
                let locationRectorat: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationRectorat.setLocation(43.614063, longitude: 3.877104, name: "Rectorat de Montpellier")
                
                let locationTriolet: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationTriolet.setLocation(43.631441, longitude: 3.861163, name: "Triolet")
                
                let locationVeyrassi: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationVeyrassi.setLocation(43.640128, longitude: 3.848479, name: "Veyrassi")
                
                let locationLaGrandeMotte: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationLaGrandeMotte.setLocation(43.561055, longitude: 4.085262, name: "La Grande Motte")
                
                let locationTownHall: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationTownHall.setLocation(43.598568, longitude: 3.896829, name: "Town Hall")
                
                let locationCateringJardin: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationCateringJardin.setLocation(43.619390, longitude: 3.886643, name: "Le Jardin des Sens")
                
                let locationGrillad: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationGrillad.setLocation(43.607508, longitude: 3.880657, name: "Grillad'Oc")
                
                let locationHotelIbis: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationHotelIbis.setLocation(43.609244, longitude: 3.882080, name: "Hotel Ibis")
                
                let locationHotelMercure: Location = Location(entity : locationEntity!, insertIntoManagedObjectContext: context)
                locationHotelMercure.setLocation(43.609169, longitude: 3.894202, name: "Hotel Mercure")
                
                // Set CategoryCatering
                let categoryCateringRU: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCateringRU.setCategoryCatering("Restaurant Universitaire")
                
                let categoryCateringS: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCateringS.setCategoryCatering("Snack")
                
                let categoryCateringPN: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCateringPN.setCategoryCatering("Pique-nique")

                // Set CategoryEvent
                let categoryEventSport: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventSport.setCategoryEvent("Sport")
                
                let categoryEventCongress: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventCongress.setCategoryEvent("Congress")
                
                let categoryEventShow: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventShow.setCategoryEvent("Show")
                
                let categoryEventForum: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventForum.setCategoryEvent("Forum")
                
                let categoryEventSeminar: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventSeminar.setCategoryEvent("Seminar")
                
                // Set Speakers
                let speakerSC: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speakerSC.setSpeaker("Baroness", detail: "Great Britain, Chair of UK Sport", name: "Campbell", surname: "Sue")
                
                let speakerPW: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speakerPW.setSpeaker("Professor", detail: "Brussel, Belgium, Vrije Universitet", name: "Wylleman", surname: "Paul")
                
                let speakerMD: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speakerMD.setSpeaker("Director", detail: "Autralia, Monash University, Monash Sport", name: "Doulton", surname: "Martin")
                
                let speakerOM: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speakerOM.setSpeaker("Professor", detail: "Russia, Russian State University of Physical Education, Sport and Tourism", name: "Matysin", surname: "Oleg")

                let speakerME: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speakerME.setSpeaker("CEO", detail: "Sweden, World Village of Women Sports", name: "Eggertz-Forsmark", surname: "Malin")
                
                // Speakers Sets Creating
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet2 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()



                
                
            }
            if appDelegate.managedObjectContext.hasChanges {
                appDelegate.saveContext()
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            }
        }


    }
    
}
