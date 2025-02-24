//
//  BarElement.swift
//  practice
//
//  Created by Wonsang Hwang on 2/23/25.
//

import UIKit

class BarElement: UIView {
    
    private let valueLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.init(red: 129/255, green: 204/255, blue: 240/255, alpha: 1)
        self.addSubview(valueLabel)
        
        valueLabel.layer.cornerRadius = 4
        valueLabel.textAlignment = .center
        valueLabel.font = .systemFont(ofSize: 14)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.5
        valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setPercentValue(value: CGFloat) {
        valueLabel.text = String(format: "%.0f%%", value * 100)
    }

}
