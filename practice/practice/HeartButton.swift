//
//  HeartButton.swift
//  practice
//
//  Created by Wonsang Hwang on 1/29/25.
//

import UIKit

class HeartButton: UIButton {
    
    let heartPath = UIBezierPath()
    let heartLayer = CAShapeLayer()
    
    init() {
        super.init(frame: .zero)
        
        addTarget(self, action: #selector(animateScaleDown), for: .touchDown)
        addTarget(self, action: #selector(animateSmallCircle), for: .touchUpInside)
    }
    
    @objc
    private func animateScaleDown() {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 0.85, 1.15, 0.95, 1.05, 1.0]
        bounceAnimation.keyTimes = [0,0.2, 0.4,0.6, 0.8,1]
        bounceAnimation.duration = 0.5
        heartLayer.add(bounceAnimation, forKey: "bounce")
        
        
        UIView.animate(withDuration: 0.3) {
            self.layer.transform = CATransform3DMakeScale(0.9, 0.9, 1)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.3) {
            self.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        let start = CGPoint(x: rect.width / 2, y: rect.height * 0.75)
        let top = CGPoint(x: rect.width / 2, y: rect.height * 0.2)
        let bottom = start
        
        let rightControlPoint1 = CGPoint(x: rect.width, y: rect.height * 0.55)
        let rightControlPoint2 = CGPoint(x: rect.width, y: 0)
        
        let leftControlPoint1 = CGPoint(x: 0, y: rect.height * 0.55)
        let leftControlPoint2 = CGPoint(x: 0, y: 0)
        
        
        heartPath.move(to: start)
        heartPath.addCurve(to: top, controlPoint1: rightControlPoint1, controlPoint2: rightControlPoint2)
        heartPath.addCurve(to: bottom, controlPoint1: leftControlPoint2, controlPoint2: leftControlPoint1)
        
        heartPath.close()
        

        heartLayer.path = heartPath.cgPath
        heartLayer.fillColor = UIColor.orange.withAlphaComponent(0.7).cgColor
        heartLayer.strokeColor = UIColor.gray.cgColor
        heartLayer.lineWidth = 2
        heartLayer.frame = rect
//        heartLayer.position = CGPoint(x: rect.width / 2, y: rect.height / 2)

        layer.addSublayer(heartLayer)
        
       
    }
    
    @objc
    func animateSmallCircle() {
        let smallCircleView = UIView(frame: CGRect(x: bounds.width / 2 - 4, y: bounds.height / 2 - 4, width: 8, height: 8))
        smallCircleView.backgroundColor = .red
        smallCircleView.layer.cornerRadius = 4
        addSubview(smallCircleView)
        
        //랜덤각도
        let angle = CGFloat.random(in: 0..<CGFloat.pi * 2)
        let distance:CGFloat = 50
        
        let locationX = cos(angle) * distance + (bounds.width / 2 - 4)
        let locationY = sin(angle) * distance + (bounds.width / 2 - 4)
        let movedLocation = CGPoint(x: locationX, y: locationY)
        
        UIView.animate(withDuration: 0.5) {
            smallCircleView.center = movedLocation
            smallCircleView.alpha = 0
        } completion: { _ in
            smallCircleView.removeFromSuperview()
        }

    }
}
