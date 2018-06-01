//
//  HomeVC.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 5/28/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView

class HomeVC: UIViewController,  MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    var delegate: CenterVCDelegate?
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true, withMessage: nil)
    }
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
}
