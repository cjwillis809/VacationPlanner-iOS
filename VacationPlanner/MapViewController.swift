//
//  MapViewController.swift
//  VacationPlanner
//
//  Created by Brenda Maya on 3/7/16.

//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var destinations: [Destination] = []
    var destinationName: String = ""
    var firstTime: Bool = true
    
    @IBOutlet weak var destinationMapView: MKMapView!
    
    
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
    
    func showIntroPopup() {
        let introSheetController = UIAlertController(title: "Welcome!", message: "Use this map to take a look at some great locations to travel to! Then use the Budget tabs to start saving for your trip!", preferredStyle: .Alert)
        let okayAction = UIAlertAction(title: "Okay!", style: .Destructive, handler: nil)
        introSheetController.addAction(okayAction)
        
        presentViewController(introSheetController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDestinationsArray()
        self.destinationMapView.delegate = self
        
        // Show points on map
        for destination in destinations {
            destinationMapView.addAnnotation(destination)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (firstTime) {
            showIntroPopup()
            firstTime = false
        }
    }
    
    func mapView(_mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        self.destinationName = ((view.annotation?.title)!)!
//        showDestinationConfirmation()
    }
    
//    func showDestinationConfirmation() {
//        let actionSheetController = UIAlertController(title: "Confirm", message: "Do you want to choose \(self.destinationName) as your destination for your budget?", preferredStyle: .ActionSheet)
//        let noAction = UIAlertAction(title: "No", style: .Destructive, handler: nil)
//        let yesAction = UIAlertAction(title: "Yes", style: .Default) {action in
//            self.performSegueWithIdentifier("mapToBudget", sender: nil)
//        }
//        
//        actionSheetController.addAction(noAction)
//        actionSheetController.addAction(yesAction)
//        
//        presentViewController(actionSheetController, animated: true, completion: nil)
//    }
}
