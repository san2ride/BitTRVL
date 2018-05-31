//
//  CenterVCDelegate.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 5/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
