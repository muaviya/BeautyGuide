//
//  SKManMainTableViewController.swift
//  SalonKrasoty05
//
//  Created by Muaviya on 30.01.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class SKManMainTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var mySearchController: UISearchController!

    var skManArray: [SK] = [
        SK(name: "Аристократ", location: "Республика Дагестан, Махачкала г., ул. Ушакова, 5/а", phoneNumber: "+7(9722)781616", image: "ar.jpg"),
        SK(name: "Афродита", location: "Республика Дагестан, Махачкала г., ул.Советская, 18", phoneNumber: "+7(989)8807938", image: "af.jpg"),
        SK(name: "Тонус",  location: "Республика Дагестан, Махачкала г., ул. Ярагского, 69", phoneNumber: "+7(988)4503000", image: "to.jpg"),
        SK(name: "Elit", location: "Республика Дагестан, Махачкала ул. Аскерханова, 22", phoneNumber: "+7(988)2677770", image: "el.jpg")
    ]
    
    var searchResult: [SK] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        mySearchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = mySearchController.searchBar
        
        mySearchController.searchResultsUpdater = self
        mySearchController.dimsBackgroundDuringPresentation = false
        mySearchController.searchBar.placeholder = "Поиск мужских салонов"
        
        // Самомасштабирование
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySearchController.active {
            return searchResult.count
        } else {
            return skManArray.count
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if mySearchController.active {
            return false
        } else {
            return true
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCellWithIdentifier("CellMan", forIndexPath: indexPath) as! SKManTableViewCell
        let sk = (mySearchController.active) ?  searchResult[indexPath.row] : skManArray[indexPath.row]
        
        // Настройка ячейки
        cell2.SKManNameLabel.text = sk.name
        cell2.SKManImage.image = UIImage(named: sk.image)
        cell2.SKManLocationLabel.text = sk.location
        
        return cell2
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //Social
        let shareAction = UITableViewRowAction(style: .Default, title: "Поделится", handler: { (actin, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.skManArray[indexPath.row].name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        //Delete
        let deleteAction = UITableViewRowAction(style: .Default, title: "Удалить", handler: {(actin, indexPath) -> Void in
            self.skManArray.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMan" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! SKManViewController2
                destinationController.skManVC2 = (mySearchController.active) ? searchResult[indexPath.row] :  skManArray[indexPath.row]
            }
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = mySearchController.searchBar.text {
            filterContect(searchText)
            tableView.reloadData()
        }
    }
    
    func filterContect(searchText: String) {
        searchResult = skManArray.filter({ (sk: SK) -> Bool in
            let nameMatch = sk.name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil)
            let locationMatch = sk.location.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil)
            
            return nameMatch != nil || locationMatch != nil
        })
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden()
    }

}
