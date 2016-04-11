//
//  SpeakerDetailViewController.swift
//  Fisu
//
//  Created by vm mac on 20/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit

class SpeakerDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var temp : String = ""
        if let _=self.speaker.name {
            temp = temp + self.speaker.name!
        }
        if let _=self.speaker.surname {
            temp = temp + " "
            temp = temp + self.speaker.surname!
        }
        self.myName.text = temp
        self.myDesignation.text = self.speaker.designation
        self.myDetail.text = self.speaker.detail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myDesignation: UILabel!
    @IBOutlet weak var myDetail: UITextView!

    var speaker : Speaker!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
