//
//  ActivitiesViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import CoreData

class ActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //Adjust TableView to the top of the screen
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        
        /*let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entityActivity = NSEntityDescription.entityForName("Event", inManagedObjectContext: moc)
        let entityLocation = NSEntityDescription.entityForName("Location", inManagedObjectContext: moc)
        let activity = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: moc) as! Event
        let location = NSManagedObject(entity: entityLocation!, insertIntoManagedObjectContext: moc) as! Location
        location.setLocation(43.604634, longitude: 3.880842, name: "Gare Montpellier Saint-Roch")
        activity.setEvent(NSDate(), chosen: true, detail: "Ceci est le detail de ce speaker", endDate: NSDate(), name: "MonEvent", category: nil, location: location, speakers: nil)
        
        
        do {
            try moc.save()
        } catch let error as NSError {
            print("Error : \(error)")
        } */
    }
    
    override func viewWillAppear(animated: Bool) {
        self.activities = Event.fetchActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTableView: UITableView!

    var activities: [Event] = [Event]()

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
        return self.activities.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as! ActivityTableViewCell
        cell.activity = self.activities[indexPath.row]
        cell.myTitle.text = cell.activity.name
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ActivityDetailViewController
        let activityCell = sender as! ActivityTableViewCell
        nextView.activity = activityCell.activity
    }

    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }

}
