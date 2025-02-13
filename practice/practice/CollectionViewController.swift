//
//  CollectionViewController.swift
//  practice
//
//  Created by Wonsang Hwang on 2/12/25.
//

import UIKit

private let reuseIdentifier = "Cell"

// 콜렉션뷰의 한계 -> 앞의 셀 재사용성으로 인해서 z축이 앞으로 튀어나옴
class CollectionViewController: UICollectionViewController {
    private let imageNames: [String]
    
    private var itemSize: CGFloat = 0
    
    init(imageNames: [String]) {
        self.imageNames = imageNames
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.view.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(ImageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        itemSize =  self.collectionView.bounds.height
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: itemSize, height: itemSize)
            layout.minimumLineSpacing = -(itemSize / 2)
            layout.scrollDirection = .horizontal
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
    
        // Configure the cell
    
        return cell
    }

}
