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
        // Do any additional setup after loading the view.

        guard let category = self.activity.hasCategory else {
            return
        }
        self.myCategory.text = category.name
        self.myDetail.text = self.activity.detail
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
    }
/*    @IBAction func myChosenAction(sender: AnyObject) {
        let app = (UIApplication.sharedApplication().delegate as! AppDelegate)
        self.activity.switchValue(app)
    } */
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
}
