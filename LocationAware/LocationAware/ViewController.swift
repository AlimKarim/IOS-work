//
//  ViewController.swift
//  LocationAware
//
//  Created by Alim on 5/30/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    @IBOutlet var courseLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var altitudeLabel: UILabel!
    
    
    @IBOutlet var AddressLabel: UILabel!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userlocation: CLLocation = locations[0]
    
        latitudeLabel.text = String(userlocation.coordinate.latitude)
        longitudeLabel.text = String(userlocation.coordinate.longitude)
        courseLabel.text = String(userlocation.course)
        altitudeLabel.text = String(userlocation.altitude)
        speedLabel.text = String(userlocation.speed)
        
        CLGeocoder().reverseGeocodeLocation(userlocation)
        {
            (placemarks,error) in
            
            if error != nil
            {
                print(error)
            }
            else
            {
                if let placemark = placemarks?[0]
                {
                    
                    var address = ""
                    
                    if placemark.subThoroughfare != nil
                    {
                        address += placemark.subThoroughfare!+" "
                    }
                    
                    if placemark.thoroughfare != nil
                    {
                        address += placemark.thoroughfare!+" "
                    }
                    
                    if placemark.subLocality != nil
                    {
                        address += placemark.subLocality!+" "
                    }
                    
                    if placemark.subAdministrativeArea != nil
                    {
                        address += placemark.subAdministrativeArea!+" "
                    }
                    
                    if placemark.postalCode != nil
                    {
                        address += placemark.postalCode!+" "
                    }
                    
                    if placemark.country != nil
                    {
                        address += placemark.country!+" "
                    }
                 
                    self.AddressLabel.text = address
                }
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

