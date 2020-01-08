//
//  MapViewController.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 12/6/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var currentlocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.findLocation()
    }
    
    func findLocation(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authorizationStatus == .denied || authorizationStatus == .restricted{
            self.reportLocationServiceDeniedError()
        }
    }
    
    func reportLocationServiceDeniedError(){
        let alert = UIAlertController(title: "Location Service Disabled", message: "Go to Settings> Privancy enable location services for this app.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}
