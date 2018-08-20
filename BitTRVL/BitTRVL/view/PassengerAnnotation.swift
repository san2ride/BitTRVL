//
//  PassengerAnnotation.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 8/19/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation
import Firebase
import MapKit

class PassengerAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var key: String
    
    init(coordinate: CLLocationCoordinate2D, key: String) {
        self.coordinate = coordinate
        self.key = key
        super.init()
    }
}
