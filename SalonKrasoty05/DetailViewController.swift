//
//  detailViewController.swift
//  Restaraunts
//
//  Created by Игорь on 27.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView:UITableView!
    var skDet: SK!
    
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Дополнительные действия после загрузки view
        restaurantImageView.image = UIImage(named: skDet.image)
        
        // Сменить цвет TableView
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        // Убрать разделители пустых ячеек
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // Сменить цвет разделителей
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // Сменить title в navigationBar
        title = skDet.name
        
        // Самомасштабирование
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Data Source Protocol
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SKDetailCell
        
        // Настройка ячейки
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Салон красоты"
            cell.valueLabel.text = skDet.name
        case 1:
            cell.fieldLabel.text = "Адрсесс"
            cell.valueLabel.text = skDet.location
        case 2:
            cell.fieldLabel.text = "Номер"
            cell.valueLabel.text = skDet.phoneNumber
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        
        
        cell.backgroundColor = UIColor.clearColor()
        
        return (cell)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationVC = segue.destinationViewController as! MapVievController
            destinationVC.sk = skDet
        }
    }
}
