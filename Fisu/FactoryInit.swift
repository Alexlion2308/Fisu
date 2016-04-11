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
                
                let categoryCateringR: CategoryCatering = CategoryCatering(entity : categoryCateringEntity!, insertIntoManagedObjectContext: context)
                categoryCateringR.setCategoryCatering("Restaurant")

                // Set CategoryEvent
                let categoryEventSport: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventSport.setCategoryEvent("Sport")
                
                let categoryEventVisit: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventVisit.setCategoryEvent("Visit")
                
                let categoryEventForum: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventForum.setCategoryEvent("Forum")
                
                let categoryEventEat: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventEat.setCategoryEvent("Eat")
                
                let categoryEventPause: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventPause.setCategoryEvent("Pause")
                
                let categoryEventChange: CategoryEvent = CategoryEvent(entity : categoryEventEntity!, insertIntoManagedObjectContext: context)
                categoryEventChange.setCategoryEvent("Exchange")
                
                
                // Set Speakers
                let speaker1: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker1.setSpeaker("Baroness", detail: "Great Britain, Chair of UK Sport", name: "Campbell", surname: "Sue")
                
                let speaker2: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker2.setSpeaker("Professor", detail: "Brussel, Belgium, Vrije Universitet", name: "Wylleman", surname: "Paul")
                
                let speaker3: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker3.setSpeaker("Director", detail: "Autralia, Monash University, Monash Sport", name: "Doulton", surname: "Martin")
                
                let speaker4: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker4.setSpeaker("Professor", detail: "Russia, Russian State University of Physical Education, Sport and Tourism", name: "Matysin", surname: "Oleg")

                let speaker5: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker5.setSpeaker("CEO", detail: "Sweden, World Village of Women Sports", name: "Eggertz-Forsmark", surname: "Malin")
                
                // Speakers Sets Creating
                /*var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet2 : Set<Speaker> = Set<Speaker>()
<<<<<<< HEAD
                var speakersSet3 : Set<Speaker> = Set<Speaker>()
                var speakersSet4 : Set<Speaker> = Set<Speaker>()
                var speakersSet5 : Set<Speaker> = Set<Speaker>()
                var speakersSet6 : Set<Speaker> = Set<Speaker>()
                var speakersSet7 : Set<Speaker> = Set<Speaker>()
                var speakersSet8 : Set<Speaker> = Set<Speaker>()
                var speakersSet9 : Set<Speaker> = Set<Speaker>()
                
                speakersSet1.insert(speaker1)
                speakersSet1.insert(speaker4)
                
                speakersSet2.insert(speaker5)
                
                speakersSet3.insert(speaker2)
                speakersSet3.insert(speaker5)
                speakersSet3.insert(speaker3)
                speakersSet3.insert(speaker4)
                
                speakersSet4.insert(speaker5)
                speakersSet4.insert(speaker4)
                speakersSet4.insert(speaker1)
                
                speakersSet5.insert(speaker1)
                speakersSet5.insert(speaker2)
                speakersSet5.insert(speaker3)
                speakersSet5.insert(speaker4)
                
                speakersSet6.insert(speaker2)
                
                speakersSet7.insert(speaker2)
                speakersSet7.insert(speaker4)
                
                speakersSet8.insert(speaker5)
                speakersSet8.insert(speaker3)
                speakersSet8.insert(speaker4)
                
                speakersSet9.insert(speaker3)
=======
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()
                var speakersSet1 : Set<Speaker> = Set<Speaker>()*/
>>>>>>> origin/master

                
                // Set Events

                let event1: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event1.setEvent( NSDate(timeIntervalSince1970: 1467615600), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: 1467628200), name: "Opening Ceremony", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet1)

                let event2: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event2.setEvent( NSDate(timeIntervalSince1970: 1467628200), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: 1467632700), name: "Lunch", category: categoryEventEat, location: locationSaintCharles, speakers: speakersSet2)
                
                let event3: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event3.setEvent( NSDate(timeIntervalSince1970: 1467632700), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: 1467635400), name: "UNESCO session", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet3)

                let event4: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event4.setEvent( NSDate(timeIntervalSince1970: 1467634500), chosen: false, detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit", endDate: NSDate(timeIntervalSince1970: 1467638100), name: "Introduction to the week’s aims/methodology", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet4)

                let event5: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event5.setEvent( NSDate(timeIntervalSince1970: 1467638100), chosen: false, detail: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut", endDate: NSDate(timeIntervalSince1970: 1467639000), name: "Coffee break", category: categoryEventPause, location: locationLawFaculty, speakers: speakersSet5)
                
                let event6: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event6.setEvent( NSDate(timeIntervalSince1970: 1467639000), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: 1467642600), name: "Definition of project working groups", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet6)
                
                let event7: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event7.setEvent( NSDate(timeIntervalSince1970: 1467642600), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: 1467644400), name: "Transition to ice-breaking activity", category: categoryEventChange, location: nil, speakers: speakersSet7)
                
                let event8: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event8.setEvent( NSDate(timeIntervalSince1970: 1467644400), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: 1467651600), name: "Boules/pétanque", category: categoryEventSport, location: locationTriolet, speakers: speakersSet8)
                
                let event9: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event9.setEvent( NSDate(timeIntervalSince1970: 1467651600), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: 1467654300), name: "Transition /clothing change", category: categoryEventChange, location: nil, speakers: speakersSet9)
                
                let event10: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event10.setEvent( NSDate(timeIntervalSince1970: 1467654300), chosen: false, detail: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut", endDate: NSDate(timeIntervalSince1970: 1467662400), name: "Official reception/opening dinner", category: categoryEventEat, location: locationRectorat, speakers: speakersSet1)
                
                let event11: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event11.setEvent( NSDate(timeIntervalSince1970: 1467702000), chosen: false, detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", endDate: NSDate(timeIntervalSince1970: 1467705600), name: "Plenary session: Values/Ethics/Integrity", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet2)
                
                let event12: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event12.setEvent( NSDate(timeIntervalSince1970: 1467705600), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: 1467709200), name: "Workshops:  Values/Ethics/Integrity", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet3)
                
                let event13: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event13.setEvent( NSDate(timeIntervalSince1970: 1467710100), chosen: false, detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit", endDate: NSDate(timeIntervalSince1970: 1467711000), name: "Coffee break", category: categoryEventPause, location: locationSaintCharles, speakers: speakersSet4)
/*
                let event14: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event14.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut", endDate: NSDate(timeIntervalSince1970: ), name: "Project working session", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet5)
                
                let event15: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event15.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: ), name: "Lunch", category: categoryEventEat, location: locationSaintCharles, speakers: speakersSet6)
                
                let event16: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event16.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: ), name: "Plenary session: Health/Social Care/Anti-doping", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet7)
                
                let event17: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event17.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit", endDate: NSDate(timeIntervalSince1970: ), name: "Workshops Health/Social Care/Anti-doping", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet8)
                
                let event18: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event18.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", endDate: NSDate(timeIntervalSince1970: ), name: "Coffee break", category: categoryEventPause, location: locationSaintCharles, speakers: speakersSet9)
                
                let event19: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event19.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", endDate: NSDate(timeIntervalSince1970: ), name: "Transition to cultural activity", category: categoryEventChange, location: nil, speakers: speakersSet1)
                
                let event20: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event20.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: ), name: "Visit of Montpellier", category: categoryEventVisit, location: nil, speakers: speakersSet2)
                
                let event21: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event21.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: ), name: "Dinner", category: categoryEventEat, location: locationTriolet, speakers: speakersSet3)
                
                let event22: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event22.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit", endDate: NSDate(timeIntervalSince1970: ), name: "Plenary session: Leadership", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet4)
                
                let event23: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event23.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: ), name:"Workshops : Leadership", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet5)
                
                let event24: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event24.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut", endDate: NSDate(timeIntervalSince1970: ), name: "Coffee break", category: categoryEventPause, location: locationSaintCharles, speakers: speakersSet6)
                
                let event25: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event25.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: ), name: "Project working session", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet7)
                
                let event26: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event26.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", endDate: NSDate(timeIntervalSince1970: ), name: "Lunch", category: categoryEventEat, location: locationSaintCharles, speakers: speakersSet8)
                
                let event27: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event27.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: ), name: "Plenary session: Volunteers", category: categoryEventForum, location: locationLawFaculty, speakers: speakersSet9)
                
                let event28: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event28.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: ), name: "Workshops: Volunteers", category: categoryEventForum, location: locationSaintCharles, speakers: speakersSet1)
                
                let event29: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event29.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut", endDate: NSDate(timeIntervalSince1970: ), name: "Coffee break", category: categoryEventPause, location: nil, speakers: speakersSet2)
                
                let event30: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event30.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit", endDate: NSDate(timeIntervalSince1970: ), name: "Transition to Forum Fair location", category: categoryEventChange, location: nil, speakers: speakersSet3)
                
                let event31: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event31.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Et harum quidem rerum facilis est et expedita distinctio", endDate: NSDate(timeIntervalSince1970: ), name: "Forum Fair setup", category: categoryEventForum, location: locationVeyrassi, speakers: speakersSet4)
                
                let event32: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event32.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium", endDate: NSDate(timeIntervalSince1970: ), name: "Forum Fair", category: categoryEventForum, location: locationVeyrassi, speakers: speakersSet5)
                
                let event33: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event33.setEvent( NSDate(timeIntervalSince1970: ), chosen: false, detail: "Sed ut perspiciatis unde omnis", endDate: NSDate(timeIntervalSince1970: ), name: "Dinner", category: categoryEventEat, location: locationVeyrassi, speakers: speakersSet6)

*/
                
                
            }
            if appDelegate.managedObjectContext.hasChanges {
                appDelegate.saveContext()
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            }
        }


    }
    
}
