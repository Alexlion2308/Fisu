//
//  MyActivitiesViewController.swift
//  Fisu
//
//  Created by vm mac on 21/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import CoreData

class MyActivitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //Adjust TableView to the top of the screen
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.myActivities = Event.fetchMyActivities()
        self.myTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTableView: UITableView!

    var myActivities: [Event] = [Event]()
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myActivities.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myActivityCell", forIndexPath: indexPath) as! MyActivityTableViewCell
        cell.activity = self.myActivities[indexPath.row]
        cell.myTitle.text = cell.activity.name
        var temp : String = ""
        if let _=cell.activity.beginDate {
            temp = MyActivitiesViewController.hourFormatter.stringFromDate(cell.activity.beginDate!)
        }
        if let _=cell.activity.endDate {
            temp = temp + "-"
            temp = temp + MyActivitiesViewController.hourFormatter.stringFromDate(cell.activity.endDate!)
        }
        cell.myDate.text = temp
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ActivityDetailViewController
        let activityCell = sender as! MyActivityTableViewCell
        nextView.activity = activityCell.activity
    }

    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }

}
