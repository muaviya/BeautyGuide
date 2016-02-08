

import UIKit
import MapKit

class MapVievController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var sk:SK!
    
    let locationManager = CLLocationManager()
    var currentPlacemark:CLPlacemark?
    
    var currentTransportType = MKDirectionsTransportType.Automobile
    var currentRoute:MKRoute?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        
        mapView.delegate = self
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(sk.location, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                self.currentPlacemark = placemark
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.sk.name
                annotation.subtitle = "Салон красоты"
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: sk.image)!
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        // Pin color customization
//        annotationView?.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegueWithIdentifier("showSteps", sender: view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showDirection(sender: AnyObject) {
        
        // Get the selected transport type
//        switch segmentedControl.selectedSegmentIndex {
//        case 0: currentTransportType = MKDirectionsTransportType.Automobile
//        case 1: currentTransportType = MKDirectionsTransportType.Walking
//        default: break
//        }
//        
//        segmentedControl.hidden = false
        
        guard let currentPlacemark = currentPlacemark else {
            return
        }
        
        let directionRequest = MKDirectionsRequest()
        
        // Set the source and destination of the route
        directionRequest.source = MKMapItem.mapItemForCurrentLocation()
        let destinationPlacemark = MKPlacemark(placemark: currentPlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = currentTransportType
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        directions.calculateDirectionsWithCompletionHandler { (routeResponse, routeError) -> Void in
            
            guard let routeResponse = routeResponse else {
                if let routeError = routeError {
                    print("Error: \(routeError)")
                }
                
                return
            }
            
            let route = routeResponse.routes[0]
            self.currentRoute = route
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.AboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        
        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = (currentTransportType == .Automobile) ? UIColor.blueColor() : UIColor.orangeColor()
        renderer.lineWidth = 3.0
        
        return renderer
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "showSteps" {
//            let routeTableViewController = segue.destinationViewController as! RouteTableViewController
//            if let steps = currentRoute?.steps {
//                routeTableViewController.routeSteps = steps
//            }
//        }
//    }
//    
    

}


/*    var restourant :SK!

override func viewDidLoad() {
super.viewDidLoad()

mapView.delegate = self

let initialLocation = CLLocation(latitude: 42.56955, longitude: 47.86447)
centerMapOnLocation(initialLocation)


let geoCoder = CLGeocoder()
geoCoder.geocodeAddressString(restourant.location, completionHandler: { placemarks, error in

if error != nil {
print(error)
return
}

if let placemarks  = placemarks {
let placemark = placemarks[0]

let anotation  = MKPointAnnotation()
anotation.title = self.restourant.name

if let location = placemark.location {
anotation.coordinate = location.coordinate

self.mapView.showAnnotations([anotation], animated: true)
self.mapView.selectAnnotation(anotation, animated: true)
}
}

})
}

let regionRadius: CLLocationDistance = 1500
func centerMapOnLocation(location: CLLocation) {
let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
regionRadius * 2.0, regionRadius * 2.0)
mapView.setRegion(coordinateRegion, animated: true)
}

func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
let identifier = "MyPin"

if annotation.isKindOfClass(MKUserLocation) {
return nil
}

var anotationView :MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView

if anotationView == nil  {
anotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
anotationView?.canShowCallout = true
}

let letIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
letIconView.image = UIImage(named: restourant.image)
anotationView?.leftCalloutAccessoryView = letIconView

return anotationView
}

*/