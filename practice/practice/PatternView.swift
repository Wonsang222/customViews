//
//  PatternView.swift
//  practice
//
//  Created by Wonsang Hwang on 2/21/25.
//

import UIKit

class PatternView: UIView {
    
    private var dots = [DotView]()
    private var connectedDots = [DotView]()
    private var currentLinelayer: CAShapeLayer?
    private var lineLayer: CAShapeLayer?
    private var linepath: UIBezierPath?
    
    init() {
        super.init(frame: .zero)
        self.setupDots()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupDots()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLinelayer = CAShapeLayer()
        currentLinelayer?.strokeColor = UIColor.blue.cgColor
        currentLinelayer?.lineWidth = 4
        self.layer.addSublayer(currentLinelayer!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        for dot in dots {
            if dot.frame.contains(location) && !connectedDots.contains(where: {$0.index == dot.index}) {
                handleDotSelection(dot: dot)
                
            } else {
                
            }
        }
            
            // 연결된 ㅓㅈㅁ이 없을때는 선표현 x
            if connectedDots.count == 0 {
                return
            }
            
            if let lastDot = connectedDots.last {
                let linePath = UIBezierPath()
                // 마지막으로 연결된 dotview의 가운데서 시작된다
                linePath.move(to: lastDot.center)
                // 손가락 위치까지
                linePath.addLine(to: location)
                
                currentLinelayer?.path = linePath.cgPath
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLinelayer?.removeFromSuperlayer()
        currentLinelayer = nil
    }
    
    private func handleDotSelection(dot: DotView) {
        
        // a마지막으로 연결한 점이 있는지 확인
        
        if let lastDot = connectedDots.last {
            if let intermediateDot = findIntermediateDot(d1: lastDot, d2: dot) {
                connectedDots.append(intermediateDot)
                intermediateDot.isSelected = true
            }
        }
        
        
        connectedDots.append(dot)
        
        dot.isSelected = true
        
        if connectedDots.count == 1 {
            // 선택된 점이 시작
            
            linepath = UIBezierPath()
            linepath?.move(to: dot.center)
            
        } else {
            linepath?.addLine(to: dot.center)
        }
        
        // 현재 경로를 다시 적용해서 그리는 함수
        lineLayer?.removeFromSuperlayer()
        lineLayer = nil
        lineLayer = CAShapeLayer()
        lineLayer?.path = linepath?.cgPath
        lineLayer?.strokeColor = UIColor.black.cgColor
        lineLayer?.fillColor = UIColor.clear.cgColor
        linepath?.lineWidth = 4
        
        layer.addSublayer(lineLayer!)
        
    }
    
    private func findIntermediateDot(d1:  DotView, d2: DotView) -> DotView? {
        let max = max(d1.index, d2.index)
        let indexes = (min(d1.index, d2.index), max)
        
        let pairsWithCenter: [(Int, Int, Int)] = [
            (0,8,4), (1,7,4),(2,6,4), (3,5,4), (0,6,3)
            , (2,8,5), (0,2,1), (6,8,7), (3,5,4), (1,7,4)
        ]
        
        for center in pairsWithCenter {
            if indexes == (center.0, center.1) {
                if connectedDots.contains(where: {$0.index == center.2}) {
                    return dots[center.2]
                }
            }
        }
        
        return nil
    }
    

    
    private func setupDots() {
        let grid = 3
        
        let totalSize = min(self.bounds.width, self.bounds.height)
        let dotSize: CGFloat = 40
        let spacing: CGFloat = (totalSize - dotSize * CGFloat(grid)) / CGFloat((grid - 1))
        
        for row in 0..<grid {
            for col in 0..<grid {
                let x = CGFloat(col) * (dotSize + spacing)
                let y = CGFloat(row) * (dotSize + spacing)
                
                // 뷰의 라이프사이클에 맞춰서 다시 그려야함
                
                let dotIndex = row * grid + col
                
                if dots.count > dotIndex {
                    dots[dotIndex].frame = CGRect(x: x, y: y, width: dotSize, height: dotSize)
                } else {
                    let dot = DotView(frame: CGRect(x: x, y: y, width: dotSize, height: dotSize))
                    dots.append(dot)
                    dot.index = row * grid + col
                    self.addSubview(dot)
                }
            }
        }
    }
}
