//
//  OverlappingStack.swift
//  practice
//
//  Created by Wonsang Hwang on 2/12/25.
//

import UIKit

class OverlappingStack: UIView {
    
    private let stackView = UIStackView()
    private let imageNames: [String]
    
    private var itemSize: CGFloat = 0
    
    init(imageNames: [String], itemSize: CGFloat) {
        self.imageNames = imageNames
        self.itemSize = itemSize
        super.init(frame: .zero)
        
        setupstackview()
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        imageNames.forEach { i in
            let imageView = UIImageView(image: UIImage(named: i))
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 4
            imageView.layer.cornerRadius = self.itemSize / 2
            
            stackView.addArrangedSubview(imageView)
            
        }
    }
    
    func setupstackview() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -(itemSize / 2)
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
    }
}
