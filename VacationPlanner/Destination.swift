//
//  Destination.swift
//  VacationPlanner
//
//  Created by CJ Willis on 3/14/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import Foundation
import MapKit

class Destination: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, name: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = name
        self.coordinate = coordinate
        
        super.init()
    }
    
    var name: String {
        return locationName
    }
}