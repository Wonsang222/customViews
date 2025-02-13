//
//  CollectionViewCell.swift
//  practice
//
//  Created by Wonsang Hwang on 2/12/25.
//

import UIKit

class ImageCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = bounds.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
