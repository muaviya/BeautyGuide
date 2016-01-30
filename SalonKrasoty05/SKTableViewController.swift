
import UIKit

class SKTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var skArray: [SK] = [
        SK(name: "Лаборатория Красоты", location: "Республика Дагестан, Махачкала г., ул. Дахадаева, 56", phoneNumber: "+7(989)8797997", image: "1.jpg"),
        SK(name: "Жалин", location: "Республика Дагестан, Махачкала г., ул. М. Горького, 37", phoneNumber: "+7(967)4078877", image: "2.jpg"),
        SK(name: "Гузель",  location: "Республика Дагестан, Махачкала г., ул. Ярагского, 69", phoneNumber: "+7(988)265-67-67", image: "3.jpg"),
        SK(name: "Supreme", location: "Республика Дагестан, Махачкала ул. М. Ярагского, 35", phoneNumber: "+7(928)958-11-66", image: "11.jpg"),
        SK(name: "Олимп", location: "Республика Дагестан, Махачкала г., ул. Ярагского, 32", phoneNumber: "+7(988)292-03-58", image: "5.jpg"),
        SK(name: "NOA",  location: "Республика Дагестан, Махачкала г., ул. Ярагского, 32", phoneNumber: "+7(988)797-60-00", image: "6.jpg"),
        SK(name: "Moda", location: "Республика Дагестан, Избербаш г., ул. Ярагского 32", phoneNumber: "675677", image: "7.jpg"),
        SK(name: "Красотка", location: "Республика Дагестан, Махачкала г., пр. Гамидова 57", phoneNumber: "626920", image: "8.jpg"),
        SK(name: "Зеркало", location: "Республика Дагестан, Махачкала г., ул.Дахадаева, 105", phoneNumber: "+7(988)224-22-50", image: "9.jpg"),
        SK(name: "Соблазн",  location: "Республика Дагестан, Махачкала г., просп. Акушинского, 78", phoneNumber: "+7(928)054-59-34", image: "10.jpg"),
        SK(name: "Муталлиевой Сарат",  location: "Республика Дагестан, Махачкала г., просп. Шамиля, 18/а", phoneNumber: "+7(988)292-23-22", image: "12.jpg"),
        SK(name: "Формула Красоты",  location: "368502, Республика Дагестан, Махачкала г., ул.Казбекова, 176 /г", phoneNumber: "+7(965)490-05-05", image: "13.jpg"),
        SK(name: "ИЕР",  location: "Республика Дагестан, Махачкала г., ул.И.Шамиля, 18 г", phoneNumber: "+7(928)558-80-40", image: "grahamavenuemeats.jpg"),
        SK(name: "Чайка",  location: "Республика Дагестан, Махачкала г., просп. Петра 1, 55", phoneNumber: "+7(964)003-70-83", image: "wafflewolf.jpg"),
        SK(name: "Amore",  location: "Республика Дагестан, Махачкала  г., ул.Нахимова, 2", phoneNumber: "+7(960)408-99-67", image: "fiveleaves.jpg"),
        SK(name: "Art & Style",  location: "Республика Дагестан, Махачкала г., ул.Яракского, 74", phoneNumber: "+7(988)292-09-25", image: "cafelore.jpg"),
        SK(name: "Aza",  location: "Республика Дагестан, Махачкала г., ул. Коркмасова, 52", phoneNumber: "+7(988)290-54-31", image: "confessional.jpg"),
        SK(name: "Basira",  location: "Республика Дагестан, Махачкала г., ул.Г.Далгата, 6", phoneNumber: "+7(928)590-59-84", image: "barrafina.jpg"),
        SK(name: "Beaty Room",  location: "Республика Дагестан, Махачкала г., проспект. Петра первого, 29 в", phoneNumber: "+7(988)781-78-22", image: "donostia.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return skArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
       
        // Настройка ячейки
        cell.nameLabel.text = skArray[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: skArray[indexPath.row].image)
        cell.locationLabel.text = skArray[indexPath.row].location

        return cell
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
                destinationController.sk2VC = skArray[indexPath.row]
            }
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden()
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