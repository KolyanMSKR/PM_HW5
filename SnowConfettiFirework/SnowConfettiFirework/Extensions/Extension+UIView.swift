//
//  Extension+UIView.swift
//  SnowConfettiFirework
//
//  Created by Mykola Korotun on 28.02.2021.
//

import UIKit

extension UIView {

    func setGradient(with colors: [CGColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = self.layer.frame
        self.layer.insertSublayer(gradient, at: 0)
    }

}
