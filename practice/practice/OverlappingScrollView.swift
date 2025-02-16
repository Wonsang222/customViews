//
//  OverlappingScrollView.swift
//  practice
//
//  Created by Wonsang Hwang on 2/13/25.
//

import UIKit

// 스크롤뷰에 뭔갈 담을땐 뷰에다가 담고 스크롤뷰에 넣어라. 스택뷰에 하면 손이 많이감..

class OverlappingScrollView: UIScrollView {
    
    private let imageNames: [String]
    private var itemSize: CGFloat
    
    private var imageContainerView = UIView()
    
    init(imageNames: [String] ,itemSize: CGFloat) {
        self.imageNames = imageNames
        self.itemSize = itemSize
        super.init(frame: .zero)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        
        for (idx, imageName) in imageNames.enumerated() {
            let imageView = UIImageView(image: UIImage(named: imageName))
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = itemSize / 2
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 4
            
            imageContainerView.addSubview(imageView)
            imageContainerView.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: itemSize).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: itemSize).isActive = true
            let leadingConstant = (itemSize / 2) * CGFloat(idx)
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: leadingConstant).isActive = true
            
            if idx == imageName.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor).isActive = true
            }
            
            imageView.layer.zPosition = CGFloat(imageName.count - idx)
        }
        
        self.addSubview(imageContainerView)
        
        self.frameLayoutGuide.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        self.frameLayoutGuide.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        
        self.contentLayoutGuide.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor).isActive = true
        self.contentLayoutGuide.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor).isActive = true
    }
    
    

}
