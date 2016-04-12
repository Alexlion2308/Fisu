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
        self.myDetail.text = self.catering.detail
        self.myCategory.text = self.catering.hasCategory!.name
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

        guard let myLocation = self.catering.hasLocation else {
            return
        }
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLocation.latitude as! Double, longitude: myLocation.longitude as! Double)
        let myRegion : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: (MKCoordinateSpan(latitudeDelta: 0.06,longitudeDelta: 0.06)))

        let mark = MKPointAnnotation()
        mark.coordinate = coordinate
        mark.title = self.catering.name
        if let theCategory = self.catering.hasCategory {
            if let theName = theCategory.name {
                mark.subtitle = theName
            }
        }

        myMapView.addAnnotation(mark)
        myMapView.centerCoordinate = coordinate
        myMapView.setRegion(myRegion, animated: true)
    }

}
