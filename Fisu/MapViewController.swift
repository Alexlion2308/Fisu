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

class MapViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.myMapView.delegate = self
        
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

            let mark = TypedMarker()
            mark.coordinate = coordinate
            mark.title = location.name
            
            
            if location.events!.count != 0 {
                mark.type = "Event"
            } else if location.caterings!.count != 0 {
                mark.type = "Catering"
            } else {
                mark.type = "Other"
            }
            mark.subtitle = mark.type

            myMapView.addAnnotation(mark)
            
            let pin = myMapView.dequeueReusableAnnotationViewWithIdentifier("MyIdentifier") as? MKPinAnnotationView
            pin?.pinTintColor = UIColor.blueColor()
        }
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.621, longitude: 3.872433)
        let myRegion : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: (MKCoordinateSpan(latitudeDelta: 0.07,longitudeDelta: 0.07)))
        myMapView.centerCoordinate = coordinate
        myMapView.setRegion(myRegion, animated: true)
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? TypedMarker{
            var pinView: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            } else {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
            }
            
            pinView.pinTintColor = self.choseColor(annotation.type)
            return pinView
        }
        return nil
    }
    
    func choseColor(type : String) -> UIColor {
        var pinColor : UIColor
        switch type {
            case "Event":
                pinColor = UIColor.redColor()
            case "Catering":
                pinColor = UIColor.blueColor()
            case "Other":
                pinColor = UIColor.greenColor()
            default:
                pinColor = UIColor.greenColor()
        }
        return pinColor
    }
}
