
import UIKit

class SKTableViewController: UITableViewController, UISearchResultsUpdating {

    var mySearchController: UISearchController!
    
    var skArray: [SK] = [
        SK(name: "Лаборатория Красоты", location: "Республика Дагестан, Махачкала г., ул. Дахадаева, 56", phoneNumber: "+7(989)8797997", image: "1.jpg"),
        SK(name: "Жалин", location: "Республика Дагестан, Махачкала г., ул. М. Горького, 37", phoneNumber: "+7(967)4078877", image: "jalin.jpg"),
        SK(name: "Гузель",  location: "Республика Дагестан, Махачкала г., ул. Ярагского, 69", phoneNumber: "+7(988)2656767", image: "guzel.jpg"),
        SK(name: "Supreme", location: "Республика Дагестан, Махачкала ул. М. Ярагского, 35", phoneNumber: "+7(928)9581166", image: "supreme.jpg"),
        SK(name: "Олимп", location: "Республика Дагестан, Махачкала г., ул. Ярагского, 32", phoneNumber: "+7(988)2920358", image: "5.jpg"),
        SK(name: "NOA",  location: "Республика Дагестан, Махачкала г., ул. Ярагского, 32", phoneNumber: "+7(988)7976000", image: "6.jpg"),
        SK(name: "Moda", location: "Республика Дагестан, Избербаш г., ул. Ярагского 32", phoneNumber: "675677", image: "7.jpg"),
        SK(name: "Красотка", location: "Республика Дагестан, Махачкала г., пр. Гамидова 57", phoneNumber: "626920", image: "8.jpg"),
        SK(name: "Зеркало", location: "Республика Дагестан, Махачкала г., ул.Дахадаева, 105", phoneNumber: "+7(988)2242250", image: "9.jpg"),
        SK(name: "Соблазн",  location: "Республика Дагестан, Махачкала г., просп. Акушинского, 78", phoneNumber: "+7(928)0545934", image: "10.jpg"),
        SK(name: "Муталлиевой Сарат",  location: "Республика Дагестан, Махачкала г., просп. Шамиля, 18/а", phoneNumber: "+7(988)2922322", image: "12.jpg"),
        SK(name: "Формула Красоты",  location: "368502, Республика Дагестан, Махачкала г., ул.Казбекова, 176 /г", phoneNumber: "+7(965)4900505", image: "13.jpg"),
        SK(name: "ИЕР",  location: "Республика Дагестан, Махачкала г., ул.И.Шамиля, 18 г", phoneNumber: "+7(928)5588040", image: "ier.jpg"),
        SK(name: "Чайка",  location: "Республика Дагестан, Махачкала г., просп. Петра 1, 55", phoneNumber: "+7(964)0037083", image: "chaika.jpg"),
        SK(name: "Amore",  location: "Республика Дагестан, Махачкала  г., ул.Нахимова, 2", phoneNumber: "+7(960)4089967", image: "amore.jpg"),
        SK(name: "Art & Style",  location: "Республика Дагестан, Махачкала г., ул.Яракского, 74", phoneNumber: "+7(988)2920925", image: "art.jpg"),
        SK(name: "Aza",  location: "Республика Дагестан, Махачкала г., ул. Коркмасова, 52", phoneNumber: "+7(988)2905431", image: "aza.jpg"),
        SK(name: "Basira",  location: "Республика Дагестан, Махачкала г., ул.Г.Далгата, 6", phoneNumber: "+7(928)5905984", image: "basira.jpg"),
        SK(name: "Beaty Room",  location: "Республика Дагестан, Махачкала г., проспект. Петра первого, 29 в", phoneNumber: "+7(988)7817822", image: "beutyRoom.jpg")
    ]
    
    var searchResult: [SK] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySearchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = mySearchController.searchBar
        
        mySearchController.searchResultsUpdater = self
        mySearchController.dimsBackgroundDuringPresentation = false
        mySearchController.searchBar.placeholder = "Поиск салонов красоты"
        
        // Удалить title у кнопки  back
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // Самомасштабирование
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if mySearchController.active {
            return searchResult.count
        } else {
        return skArray.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        let sk = (mySearchController.active) ?  searchResult[indexPath.row] : skArray[indexPath.row]
       
        // Настройка ячейки
        cell.nameLabel.text = sk.name
        cell.thumbnailImageView.image = UIImage(named: sk.image)
        cell.locationLabel.text = sk.location

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if mySearchController.active {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //Social
        let shareAction = UITableViewRowAction(style: .Default, title: "Поделится", handler: { (actin, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.skArray[indexPath.row].name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        //Delete
        let deleteAction = UITableViewRowAction(style: .Default, title: "Удалить", handler: {(actin, indexPath) -> Void in
            self.skArray.removeAtIndex(indexPath.row)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

            })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! SK2ViewController
                destinationController.sk2VC = (mySearchController.active) ? searchResult[indexPath.row] :  skArray[indexPath.row]
                
            }
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = mySearchController.searchBar.text {
            filterContect(searchText)
            tableView.reloadData()
        }
    }
    
    func filterContect(searchText: String) {
        searchResult = skArray.filter({ (sk: SK) -> Bool in
            let nameMatch = sk.name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil)
            let locationMatch = sk.location.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil)
            
            return nameMatch != nil || locationMatch != nil
        })
    }
    
}




//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "Что вы хотите сделать?", preferredStyle: .ActionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//
//        let isVisitedTitle = (restaurants[indexPath.row].isVisited) ? "Я тут не был" : "Я был тут"
//
//        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
//            (action: UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//
//            self.restaurants[indexPath.row].isVisited = (self.restaurants[indexPath.row].isVisited) ? false : true
//
//            cell?.accessoryType = (self.restaurants[indexPath.row].isVisited) ? .Checkmark : .None
//        })
//
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Сервис недоступен", message: "Простите, но сейчас позвонить невозможно. Повторите позже", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
//
//
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(isVisitedAction)
////        self.presentViewController(optionMenu, animated: true, completion: nil)
//
//    }