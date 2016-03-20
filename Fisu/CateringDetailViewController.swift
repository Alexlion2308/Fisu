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
        myName.text = "Hello tout le monde bienvenue au restaurant de la casa de la casa sous casa de blabla ddddddd uuuuuuuuu ffhfhfhfh ryryyreere fhfdjfiuie fff efehfuidheiz fdf fnjezifzef jezifef"
        self.myDetailText.textContainerInset = UIEdgeInsetsZero
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myNavBarTitle: UINavigationItem!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myDetailText: UITextView!
    @IBOutlet weak var myMapView: MKMapView!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
