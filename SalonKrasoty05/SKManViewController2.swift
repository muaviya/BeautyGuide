//
//  SKManViewController2.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 30.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class SKManViewController2: UIViewController {
    @IBOutlet weak var SKManVC2Image: UIImageView!

    @IBOutlet weak var SKManVC2AdressLabel: UILabel!
    @IBOutlet weak var SKManVC2PhoneLabel: UILabel!
    @IBOutlet weak var SKManVC2NameLabel: UILabel!
    var skManVC2 :SK!
    
    @IBOutlet weak var myNavigationBarManVC2: UINavigationItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        SKManVC2NameLabel.text = skManVC2.name
        SKManVC2PhoneLabel.text = skManVC2.phoneNumber
        SKManVC2AdressLabel.text = skManVC2.location
        SKManVC2Image.image = UIImage(named: skManVC2.image)
        
        myNavigationBarManVC2.title = skManVC2.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MaP" {
            let destinationVC = segue.destinationViewController as! MapVievController
            destinationVC.sk = skManVC2
        }
    }
    @IBAction func callAction(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://"+skManVC2.phoneNumber)!)
    }


}
