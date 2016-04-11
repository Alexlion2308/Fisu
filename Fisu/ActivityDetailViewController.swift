//
//  ActivityDetailViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit

class ActivityDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //Adjust TableView to the top of the screen
        self.myDetail.textContainerInset = UIEdgeInsetsZero
        self.automaticallyAdjustsScrollViewInsets = false
        guard let aname = self.activity.name else {
            return
        }
        self.myName.text = aname
        guard let category = self.activity.hasCategory else {
            return
        }
        self.myCategory.text = category.name
        self.myDetail.text = self.activity.detail
        self.addMarkerOnMap()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.myChosenOutlet.setOn(self.activity.chosen as! Bool, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var myChosenOutlet: UISwitch!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myCategory: UILabel!
    @IBOutlet weak var myDetail: UITextView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myMapView: MKMapView!

    var activity: Event!


    @IBAction func myChosenAction(sender: AnyObject) {
        self.activity.switchValue()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let speakers = self.activity.hasSpeakers?.allObjects as! [Speaker]
        return speakers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("speakerCell", forIndexPath: indexPath) as! SpeakerTableViewCell
        cell.speaker = (self.activity.hasSpeakers?.allObjects as! [Speaker])[indexPath.row]
        cell.myTitle.text = cell.speaker.name
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! SpeakerDetailViewController
        let speakerCell = sender as! SpeakerTableViewCell
        nextView.speaker = speakerCell.speaker
    }

    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
    
    
    func addMarkerOnMap() {
        let myLocation : Location = self.activity.hasLocation!
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLocation.latitude as! Double, longitude: myLocation.longitude as! Double)
        let myRegion : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: (MKCoordinateSpan(latitudeDelta: 0.06,longitudeDelta: 0.06)))
        
        let mark = MKPointAnnotation()
        mark.coordinate = coordinate
        mark.title = self.activity.name
        mark.subtitle = self.activity.detail
        
        myMapView.addAnnotation(mark)
        myMapView.centerCoordinate = coordinate
        myMapView.setRegion(myRegion, animated: true)
    }
    

}
