//
//  CustomTextView.swift
//  practice
//
//  Created by Wonsang Hwang on 2/10/25.
//

import UIKit

enum TextViewType {
    case textOutsideCircle
    case textinsideCircle
    case imgInsideCircle
}

class CustomTextView: UITextView {
    
    var textViewType = TextViewType.textOutsideCircle
    
    init(textViewType: TextViewType = TextViewType.textOutsideCircle) {
        self.textViewType = textViewType
        super.init(frame: .zero, textContainer: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect) {
        switch textViewType {
        case .textOutsideCircle:
            textOutsidecircle(rect: rect)
        case .textinsideCircle:
            textinsideCircle(rect: rect)
        case .imgInsideCircle:
            imageInsideCircle(rect: rect)
        }
        
    
    }
    
    
    private func textinsideCircle(rect: CGRect) {
        let circleSize: CGFloat = 100
        let rectanglePath = UIBezierPath(rect: rect)
        let circleRectFrame = CGRect(x: rect.width / 2 - 50, y: 50, width: circleSize, height: circleSize)
        let circlePath = UIBezierPath(ovalIn: circleRectFrame)
        
        //사각형 path에서 원 path를 합친다
        
        rectanglePath.append(circlePath)
        rectanglePath.usesEvenOddFillRule = true
        
        self.textContainer.exclusionPaths = [rectanglePath]
        self.text = "dasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdj"
    }
    
    private func imageInsideCircle(rect: CGRect) {
        let circleSize: CGFloat = 100
        let circleRectFrame = CGRect(x: rect.width / 2 - 50, y: 50, width: circleSize, height: circleSize)
        let circleBounds = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
        
        let circlePath = UIBezierPath(ovalIn: circleBounds)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        
        // img layer
        
        let imageLayer = CAShapeLayer()
        imageLayer.contents = UIImage(systemName: "pencil")?.cgImage
        imageLayer.frame = circleRectFrame
        imageLayer.mask = circleLayer
        
        self.layer.addSublayer(imageLayer)
        
        self.text = "dasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdj"
    }
    
    private func textOutsidecircle(rect: CGRect){
        let circleRect = CGRect(x: rect.width / 2 - 50, y: 50, width: 100, height: 100)
        
        let circlePath = UIBezierPath(ovalIn: circleRect)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.lightGray.cgColor
        
        self.layer.addSublayer(circleLayer)
        
        self.textContainer.exclusionPaths = [circlePath]
        self.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        self.textContainer.lineFragmentPadding = 20
        
        self.text = "dasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdjdasfklasdklfsdz;alfksadlkjflsa;dkjfl;kdsajfklsd;ajfklasdj"
    }
}
