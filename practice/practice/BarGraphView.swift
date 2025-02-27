//
//  BarGraphView.swift
//  practice
//
//  Created by Wonsang Hwang on 2/23/25.
//

import UIKit




class BarGraphView: UIView {

    private var bars = [BarElement]()
    
    var barPercents = [CGFloat]() {
        didSet {
            setupBars()
        }
    }

    private var barSpacing:CGFloat = 20
    
    init() {
        super.init(frame: .zero)
        setupBars()
        
    }
    
    required init?(coder: NSCoder) {    
        super.init(coder: coder)
        
        setupBars()
    }
    
    private func setupBars() {
        
        let barWidth = (self.bounds.width - barSpacing * CGFloat(barPercents.count + 1)) / CGFloat(barPercents.count)
        
        for barIndex in 0..<barPercents.count {
            let barHeight = barPercents[barIndex] * self.bounds.size.height
            let x = barSpacing * CGFloat(barIndex + 1) + barWidth * CGFloat(barIndex)
            let y = self.bounds.height - barHeight
            
            
            
            if bars.count > barIndex {
                bars[barIndex].frame = CGRect(x: x, y: y, width: barWidth, height: barHeight)
            } else {
                let bar = BarElement(frame: CGRect(x: x, y: y, width: barWidth, height: barHeight))
                bars.append(bar)
                self.addSubview(bar)
                
                // anchor point를 설정하는 경우엔 frame 설정을 나중에 해야한다
                bars[barIndex].anchorPoint = CGPoint(x: 0.5, y: 1)
            }
            
            bars[barIndex].setPercentValue(value: barPercents[barIndex])
            
            addAnimation(barIndex: barIndex, barHeight: barHeight)
        }
        
        
    }
    
    private func addAnimation(barIndex: Int, barHeight: CGFloat) {
        let animation  = CABasicAnimation(keyPath: "bounds.size.height")
        animation.fromValue = 0
        animation.toValue = barHeight
        
        animation.duration = 0.5
        animation.beginTime = CACurrentMediaTime() + 0.3 * CGFloat(barIndex)  // now() + 0.3
        // 애니메이션이 종료되고 마지막 상태를 계속 유지
        // forward - 애니메이션 종료시점 값 유지 isRemovedcompletion이 false여야함
        // backward - 애니메이션 시작전에 값 미리 적용 -> 첨부터 fromvalue 0으로 시작함
        // both- 애니메이션 시작 종료 모두 유지
        animation.fillMode = .backwards
        // 애니메이션 종류 후 애니메이션 객체를 지울지 여부
        animation.isRemovedOnCompletion = true
        
        bars[barIndex].layer.add(animation, forKey: "heightAnimation")
  
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBars()
    }

}
