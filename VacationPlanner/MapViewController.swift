//
//  MapViewController.swift
//  VacationPlanner
//
//  Created by Brenda Maya on 3/7/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var destinations: [Destination] = []
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateDestinationsArray()
        
        // Show points on map
        //        let destination = Destination(title: "Chicago", name: "Chicago, IL", coordinate: CLLocationCoordinate2D(latitude: 41.881832, longitude: -87.623177))
        for destination in destinations {
            mapView.addAnnotation(destination)
        }
    }
    
    func populateDestinationsArray() {
        destinations.append(Destination(title: "Chicago", name: "Chicago, IL", coordinate: CLLocationCoordinate2D(latitude: 41.881832, longitude: -87.623177)))
        destinations.append(Destination(title: "Tokyo", name: "Tokyo, Japan", coordinate: CLLocationCoordinate2D(latitude: 35.683333, longitude: 139.683333)))
        destinations.append(Destination(title: "London", name: "London, England", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: 0.1275)))
        destinations.append(Destination(title: "New York City", name: "New York City, New York", coordinate: CLLocationCoordinate2D(latitude: 40.7127, longitude: -74.0059)))
        destinations.append(Destination(title: "Hong Kong", name: "Hong Kong, China", coordinate: CLLocationCoordinate2D(latitude: 22.3, longitude: 114.2)))
        destinations.append(Destination(title: "Paris", name: "Paris, France", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)))
        destinations.append(Destination(title: "Singapore", name: "Singapore", coordinate: CLLocationCoordinate2D(latitude: 1.3, longitude: 103.8)))
        destinations.append(Destination(title: "Shanghai", name: "Shanghai, China", coordinate: CLLocationCoordinate2D(latitude: 31.2, longitude: 121.5)))
        destinations.append(Destination(title: "Beijing", name: "Beijing, China", coordinate: CLLocationCoordinate2D(latitude: 39.916667, longitude: 116.383333)))
        destinations.append(Destination(title: "Sydney", name: "Sydney, Australia", coordinate: CLLocationCoordinate2D(latitude: -33.865, longitude: 151.209444)))
        destinations.append(Destination(title: "New Delhi", name: "New Delhi, India", coordinate: CLLocationCoordinate2D(latitude: 28.613889, longitude: 77.208889)))
        destinations.append(Destination(title: "Dubai", name: "Dubai, UAE", coordinate: CLLocationCoordinate2D(latitude: 24.95, longitude: 55.333333)))
    }


}
