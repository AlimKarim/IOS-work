//
//  ViewController.swift
//  Finding The User Location
//
//  Created by Alim on 5/29/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var gmap: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
   
        CLGeocoder().reverseGeocodeLocation(userLocation){
            (placemarks,error) in
            
            if error != nil{
                print(error)
            }
            else{
                if let placemark = placemarks?[0]
                {
                    
                    var subThoroughfare = ""
                    
                    if placemark.subThoroughfare != nil
                    {
                        subThoroughfare = placemark.subThoroughfare!
                    }
                
                    var thoroughfare = ""
                
                    if placemark.thoroughfare != nil
                    {
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil
                    {
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrativeArea = ""
                    
                    if placemark.subAdministrativeArea != nil
                    {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil
                    {
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil
                    {
                        country = placemark.country!
                    }
                    print(subThoroughfare+"\n"+thoroughfare+"\n"+subLocality+"\n"+subAdministrativeArea+"\n"+country)
            
                }
            }
        }
        
        
//        let letDelta: CLLocationDegrees = 0.05
//        let lonDelta: CLLocationDegrees = 0.05
//
//        let span = MKCoordinateSpan(latitudeDelta: letDelta, longitudeDelta: lonDelta)
        
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        gmap.setRegion(region, animated: true)
    }

}




