//
//  ViewController.swift
//  Maps
//
//  Created by Alim on 5/27/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    
    @IBOutlet var googlem: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 27.1
        let longitude: CLLocationDegrees = 78.0
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta
            , longitudeDelta: lonDelta)
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        googlem.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "one day I'll go there"
        annotation.coordinate = coordinate
        googlem.addAnnotation(annotation)
        
        let uil = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uil.minimumPressDuration = 2
        googlem.addGestureRecognizer(uil)
    }

    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.googlem)
        let coordinate = googlem.convert(touchPoint, toCoordinateFrom: self.googlem)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "new location"
        annotation.subtitle = "this is new loc"
        
        googlem.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

