//
//  ViewController.swift
//  GeoTargeting
//
//  Created by bob on 16/5/12.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .Follow
        
        setupData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.authorizationStatus() == .NotDetermined{
            locationManager.requestAlwaysAuthorization()
        }
        else if CLLocationManager.authorizationStatus() == .Denied{
            
        }
        else if CLLocationManager.authorizationStatus() == .AuthorizedAlways{
            locationManager.startUpdatingLocation()
        }
    }
    
    func setupData(){
        // 1.
        if CLLocationManager.isMonitoringAvailableForClass(CLCircularRegion.self){
            // 2.
            let title = "Lorrenzillo's"
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadius = 300.0
            
            // 3. 設置 region 的相關屬性
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoringForRegion(region)
            
            // 4.
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate
            restaurantAnnotation.title = "\(title)"
            mapView.addAnnotation(restaurantAnnotation)
            
            // 5.
            
            let circle = MKCircle(centerCoordinate: coordinate, radius: regionRadius)
            mapView.addOverlay(circle)

        }else{
            print("System can't track regions")
        }
    }
    
    // 6. 繪製圓圈
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = UIColor.redColor()
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
}

