//
//  DotView.swift
//  practice
//
//  Created by Wonsang Hwang on 2/21/25.
//

import UIKit

class DotView: UIView {
    var index: Int = 0
    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? .blue : .gray
        }
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup(){
        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundColor = .gray
    }

}
