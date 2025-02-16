//
//  PagingCollectionViewCell.swift
//  practice
//
//  Created by Wonsang Hwang on 2/15/25.
//

import UIKit

class PagingCollectionViewCell: UICollectionViewCell {
    
    let bgImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    let visualEffectView: UIVisualEffectView = {
        let eff = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        eff.translatesAutoresizingMaskIntoConstraints = false
        return eff
    }()
    
    let imageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    var imageTitleText: String? {
        didSet {
            imageTitle.text = imageTitleText
        }
    }
    
    var bgImage: UIImage? {
        didSet {
            self.bgImageView.image = bgImage
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(visualEffectView)
        self.contentView.addSubview(imageTitle)
        
        NSLayoutConstraint.activate([
            bgImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            visualEffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            visualEffectView.heightAnchor.constraint(equalToConstant: 50),
            
            imageTitle.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor),
            imageTitle.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor),
            imageTitle.topAnchor.constraint(equalTo: visualEffectView.topAnchor),
            imageTitle.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
