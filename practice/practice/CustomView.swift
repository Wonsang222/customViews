//
//  CustomView.swift
//  practice
//
//  Created by Wonsang Hwang on 1/17/25.
//

import UIKit

class CustomView: UIView {
    
    var percentages: [CGFloat] = [] {
        didSet {
            setNeedsLayout()
        }
    }
    private func convertPercentToPoint(percentages:[CGFloat]) -> [CGPoint] {
        let percentage:[CGFloat] = percentages
            .map{1 - $0}
            .map{$0 * bounds.height}
        
        let positionX = bounds.width / CGFloat(percentage.count)
        
        var x:[CGFloat] = []
        
        (0...percentages.count - 1).forEach { x.append(positionX * CGFloat($0))  }
        
        return zip(x, percentage).map { CGPoint(x: $0, y: $1 ) }
    }
    
    func drawLine(points: [CGPoint]) {
        self.layer.removeLayer(with: 200)
        let path = UIBezierPath()
        
        for (idx, point) in points.enumerated() {
            if idx == 0 {
                path.move(to: point)
                continue
            }
            path.addLine(to: point)
        }
                
        let lineLayer = TaggedLayer()
        lineLayer.path = path.cgPath
        lineLayer.strokeColor = UIColor.red.cgColor
        lineLayer.lineWidth = 3
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.tag = 200
        addAnimation(layer: lineLayer)
        self.layer.addSublayer(lineLayer)
    }
    
    private func addAnimation(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        
        layer.add(animation, forKey: "lineAnimation")
    }
    
    private func drawDot(points: [CGPoint]) {
      
        self.layer.removeLayer(with: 100)
        
        for (_, point) in points.enumerated() {
            let path = UIBezierPath()
      
            path.addArc(withCenter: point, radius: 5, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            let dotLayer = TaggedLayer()
            dotLayer.path = path.cgPath
            dotLayer.strokeColor = UIColor.clear.cgColor
            dotLayer.lineWidth = 3
            dotLayer.fillColor = UIColor.red.cgColor
            dotLayer.tag = 100
            self.layer.addSublayer(dotLayer)
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard !percentages.isEmpty else { return }
        let points = convertPercentToPoint(percentages: percentages)
        drawLine(points: points)
        drawDot(points: points)
    }
}


class TaggedLayer: CAShapeLayer {
    var tag: Int = 0
}

extension CALayer {
    func removeLayer(with tag: Int) {
        if let subLayers = self.sublayers {
            for subLayer in subLayers {
                if let taggedLayer = subLayer as? TaggedLayer,
                   taggedLayer.tag == tag {
                    taggedLayer.removeFromSuperlayer()
                }
            }
        }
    }
}
