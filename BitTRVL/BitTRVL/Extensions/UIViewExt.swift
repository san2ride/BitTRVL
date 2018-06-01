//
//  UIViewExt.swift
//  BitTRVL
//
//  Created by Jason Sanchez on 5/31/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}
