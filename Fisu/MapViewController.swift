//
//  MapViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.locations = Location.fetchLocations()

        self.addMarkersOnMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myMapView: MKMapView!

    var locations : [Location] = [Location]()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func addMarkersOnMap() {
        for location : Location in self.locations {
            let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.latitude as! Double, longitude: location.longitude as! Double)

            let mark = MKPointAnnotation()
            mark.coordinate = coordinate
            mark.title = location.name

            myMapView.addAnnotation(mark)
            
            let pin = myMapView.dequeueReusableAnnotationViewWithIdentifier("MyIdentifier") as? MKPinAnnotationView
            pin?.pinTintColor = UIColor.blueColor()
        }
    }

}
