//
//  progressBarview.swift
//  practice
//
//  Created by Wonsang Hwang on 1/20/25.
//

import UIKit

class ProgressBarView: UIView {
    
    var rate: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.black.cgColor]
        
        gradientLayer.locations = [0 ,0.5,1]
        
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.3)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0.3)
//        gradientLayer.cornerRadius = rect.height / 2
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)    
        
        
        gradientLayer.frame = CGRect(x: 0, y: (1 - rate) * rect.height , width: 20, height: rect.height * rate)
        self.layer.addSublayer(gradientLayer)
    }
}


