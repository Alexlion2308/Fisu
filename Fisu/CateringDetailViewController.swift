//
//  CateringDetailViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit

class CateringDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.myName.text = self.catering.name
        self.myDetail.textContainerInset = self.catering.detail
        self.myCategory.text = self.catering.hasCategory.name

        self.addMarkerOnMap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myCategory: UILabel!
    @IBOutlet weak var myDetail: UITextView!
    @IBOutlet weak var myMapView: MKMapView!
    
    var catering: Catering!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func addMarkerOnMap() {
        let myLocation : Location = self.catering.hasLocation
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLocation.latitude, longitude: myLocation.longitude)
        let myRegion : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: (MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)))

        var mark = MKPointAnnotation()
        mark.coordinate = coordinate
        mark.title = self.catering.name
        mark.subtitle = self.catering.detail

        myMapView.addAnnotation(myLocation)
        myMapView.centerCoordinate = coordinate
        myMapView.setRegion(myRegion, animated: true)
    }

}
