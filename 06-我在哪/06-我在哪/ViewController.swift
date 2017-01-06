//
//  ViewController.swift
//  06-我在哪
//
//  Created by Richy Li on 16/12/20.
//  Copyright © 2016年 richyli. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
    
        return UIStatusBarStyle.lightContent
    }
    
    @IBOutlet weak var myLocationLabel: UILabel!
    
    
    
    @IBAction func findMyLocation(_ sender: UIButton) {
    
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.myLocationLabel.text = "Error" + error.localizedDescription
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if (error != nil){
            
                self.myLocationLabel.text = "failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
            
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            }else {
            
                self.myLocationLabel.text = "the data"
            
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark{
        locationManager.stopUpdatingLocation()
        
            let locatity = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.myLocationLabel.text = "\(locatity! + postalCode! + administrativeArea! + country!)"
    
        }
    }

}

