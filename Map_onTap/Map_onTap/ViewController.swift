//
//  ViewController.swift
//  Map_onTap
//
//  Created by MacStudent on 2018-07-25.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var previousPoint: CLLocation?
    private var totalMovementDistance = CLLocationDistance(0)
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var horizontalAccuracyLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var verticalAccuracyLabel: UILabel!
    @IBOutlet var distanceTraveledLabel: UILabel!
    @IBOutlet var mapView:MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchPoint = touch.location(in: self.mapView)
            let location = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
            print ("\(location.latitude), \(location.longitude)")
            let latitudeString = String(format: "%g\u{00B0}",
                                        location.latitude)
            latitudeLabel.text = latitudeString
            
            let longitudeString = String(format: "%g\u{00B0}",
                                         location.longitude)
            longitudeLabel.text = longitudeString
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authorization status changed to \(status.rawValue)")
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: NSError) {
        let errorType = error.code == CLError.denied.rawValue
            ? "Access Denied": "Error \(error.code)"
        let alertController = UIAlertController(title: "Location Manager Error",
            message: errorType, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel,
                                     handler: { action in })
        alertController.addAction(okAction)
        present(alertController, animated: true,
                completion: nil)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations
        locations: [CLLocation]) {
        if let newLocation = locations.last {
            let latitudeString = String(format: "%g\u{00B0}",
                                        newLocation.coordinate.latitude)
            latitudeLabel.text = latitudeString
            let longitudeString = String(format: "%g\u{00B0}",
                                         newLocation.coordinate.longitude)
            longitudeLabel.text = longitudeString
            let horizontalAccuracyString = String(format:"%gm",
                                                  newLocation.horizontalAccuracy)
            horizontalAccuracyLabel.text = horizontalAccuracyString
            let altitudeString = String(format:"%gm", newLocation.altitude)
            altitudeLabel.text = altitudeString
            let verticalAccuracyString = String(format:"%gm",
                                                newLocation.verticalAccuracy)
            verticalAccuracyLabel.text = verticalAccuracyString
            if newLocation.horizontalAccuracy < 0 {
                // invalid accuracy
                return
            }
            if newLocation.horizontalAccuracy > 100 ||
                newLocation.verticalAccuracy > 50 {
                // accuracy radius is so large, we don't want to use it
                return
            }
            if previousPoint == nil {
                totalMovementDistance = 0
                let start = Place(title:"Start Point",
                                  subtitle:"This is where we started",
                                  coordinate:newLocation.coordinate)
                mapView.addAnnotation(start)
                let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate,
                                                                100, 100)
                mapView.setRegion(region, animated: true)
            } else {
                print("movement distance: " +
                    "\(newLocation.distance(from: previousPoint!))")
                totalMovementDistance +=
                    newLocation.distance(from: previousPoint!)
            }
            previousPoint = newLocation
            let distanceString = String(format:"%gm", totalMovementDistance)
            distanceTraveledLabel.text = distanceString
        }
    }
}

