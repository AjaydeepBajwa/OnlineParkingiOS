//
//  parkingLocationVC.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-18.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit
import MapKit

class parkingLocationVC: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    let parkingLocation = CLLocation(latitude: 43.664520, longitude: -79.735816)
    let regionRadius: CLLocationDistance = 300
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Parking Location"

        let coordinateRegion = MKCoordinateRegion(center: parkingLocation.coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        self.myMapView.setRegion(coordinateRegion, animated: true)
        
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(parkingLocation.coordinate.latitude, parkingLocation.coordinate.longitude);
        myAnnotation.title = "Premium Parking"
        myAnnotation.subtitle = "499 Main St S, Brampton, ON L6Y 1N7"
        self.myMapView.addAnnotation(myAnnotation)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sgmMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            myMapView.mapType = MKMapType.standard
        case 1:
            myMapView.mapType = MKMapType.satellite
        case 2:
            myMapView.mapType = MKMapType.hybrid
            
        default:
            myMapView.mapType = MKMapType.standard
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
