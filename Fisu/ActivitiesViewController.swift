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
    }
    
    override func viewWillAppear(animated: Bool) {
        self.activities = Event.fetchActivities()
        
        for activity in self.activities {
            let date = ActivitiesViewController.dateFormatter.stringFromDate(activity.beginDate!)
            if self.sections.indexForKey(date) == nil {
                self.sections[date] = [activity]
            } else {
                self.sections[date]!.append(activity)
            }
        }
        self.sortedSections = Array(self.sections.keys).sort(<)
        
        self.myTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    var sections = Dictionary<String, [Event]>()
    var sortedSections = [String]()

    var activities: [Event] = [Event]()
    static var hourFormatter : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateFormat = "HH:mm"
        return df
    }()
    
    //PIERRE JE T'AI MIS A DISPOSITION LE DATEFORMATER CI DESSOUS REGARDE COMMENT ON FORMATE 3 fonctions en dessous
    static var dateFormatter : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateFormat = "EEEE, MMMM d, y"
        return df
    }()
    

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
        return self.sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[self.sortedSections[section]]!.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sortedSections[section]
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as! ActivityTableViewCell
        
        let tableSection = self.sections[self.sortedSections[indexPath.section]]
        let tableItem = tableSection![indexPath.row]
        
        cell.activity = tableItem
        cell.myTitle.text = cell.activity.name
        var temp : String = ""
        if let _=cell.activity.beginDate {
            temp = ActivitiesViewController.hourFormatter.stringFromDate(cell.activity.beginDate!)
        }
        if let _=cell.activity.endDate {
            temp = temp + "-"
            temp = temp + ActivitiesViewController.hourFormatter.stringFromDate(cell.activity.endDate!)
        }
        cell.myDate.text = temp
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
