//
//  CateringViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import CoreData

class CateringViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegate and Datasource of the TableView
        myTableView.dataSource = self
        myTableView.delegate = self
        //Adjust TableView to the top of the screen
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
        self.fetchCaterings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTableView: UITableView!

    var caterings : [Catering] = [Catering]()

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
        let nbElements = self.caterings.count
        return nbElements
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cateringCell", forIndexPath: indexPath) as! CateringTableViewCell
        
        // Configure the cell...
        cell.catering = self.caterings[indexPath.row]
        cell.myTitle.text = cell.catering!.name
        cell.myCategory.text = cell.catering!.hasCategory!.name
        return cell
    }


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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! CateringDetailViewController
        let cateringCell = sender as! CateringTableViewCell
        nextView.catering = cateringCell.catering
    }

    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
}
