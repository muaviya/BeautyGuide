
import UIKit

class SK2ViewController: UIViewController {
    @IBOutlet weak var nameSK2Label: UILabel!

    @IBOutlet weak var phoneSK2Label: UILabel!
    
    @IBOutlet weak var imageSK2VC: UIImageView!
    
    @IBOutlet weak var adressSK2Label: UILabel!
    var sk2VC :SK!
    
    @IBOutlet weak var myNavigationBar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameSK2Label.text = sk2VC.name
        phoneSK2Label.text = sk2VC.phoneNumber
        adressSK2Label.text = sk2VC.location
        
        imageSK2VC.image = UIImage(named: sk2VC.image)
        
        myNavigationBar.title = sk2VC.name

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationVC = segue.destinationViewController as! MapVievController
            destinationVC.sk = sk2VC
        }
    }
    
    @IBAction func callSK(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://"+sk2VC.phoneNumber)!)
    }

}
