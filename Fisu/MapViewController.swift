//
//  MapViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fetchCaterings()
        self.fetchActivities()

        self.addMarkersOnMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myMapView: MKMapView!

    var caterings : [Catering] = [Catering]()
    var activities : [Event] = [Event]()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    func fetchCaterings() {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else {
            return
        }
        let fetchRequest = NSFetchRequest(entityName: "Catering")
        do {
            if let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Catering] {
                self.caterings = result // si ça ne marche pas, mettre les attributs un par un
            }
        } catch {
            fatalError("There was an error fetching the caterings! \(error)")
        }
    }
    
    
    func fetchActivities() {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else {
            return
        }
        let fetchRequest = NSFetchRequest(entityName: "Event")
        do {
            if let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [Event] {
                self.activities = result // si ça ne marche pas, mettre les attributs un par un
            }
        } catch {
            fatalError("There was an error fetching the activities! \(error)")
        }
    }

    func addMarkersOnMap() {
        for catering : Catering in self.caterings {
            let myLocation : Location = self.catering.hasLocation
            let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLocation.latitude, longitude: myLocation.longitude)

            var mark = MKPointAnnotation()
            mark.coordinate = coordinate
            mark.title = catering.name
            mark.subtitle = catering.detail

            myMapView.addAnnotation(myLocation)
        }

        for activity : Event in self.activities {
            let myLocation : Location = self.activity.hasLocation
            let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLocation.latitude, longitude: myLocation.longitude)

            var mark = MKPointAnnotation()
            mark.coordinate = coordinate
            mark.title = activity.name
            mark.subtitle = activity.detail

            myMapView.addAnnotation(myLocation)
        }
    }

}
