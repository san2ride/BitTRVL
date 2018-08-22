//
//  RoundMapView.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 8/22/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import MapKit

class RoundMapView: MKMapView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 10.0
    }
}
