//
//  CustomZoominoutlayout.swift
//  practice
//
//  Created by Wonsang Hwang on 2/16/25.
//

import UIKit

class CustomZoominoutlayout: UICollectionViewFlowLayout {
    
    // 크기조절 (확대 축소- 가운데서 확대, 가장자리로 가면 축소)
    
    let minScale: CGFloat = 0.4
    let maxScale: CGFloat = 1.0
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let inset = (collectionView.bounds.width - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
    }
    
    // 스크롤할/때ㅑ마다 레이아웃 새로 계산
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // 영역 안에 있는 모든 아이템의 레이아웃 속성값을 반환
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let collectionView = collectionView, let att = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        // 가운데라는 위치
        let centerx = collectionView.contentOffset.x + (collectionView.bounds.width / 2)
        var num = 0
        for attributes in att {
            // 아이템 주앙ㅇ위치과 스크롤 위치의 중앙과 거리를 구한다
            let itemcenterX = attributes.center.x
            let distanceFromCenter = abs(itemcenterX - centerx)
            
            //거리를 백분율로 계산
            let distancePercentage = distanceFromCenter / (collectionView.bounds.width / 2)
            
            // 크기를 계산
            
            let scale = maxScale - (maxScale - minScale) * distancePercentage
            
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
            num += 1
        }
        
        return att
    }
    
    // custom paging
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        let proposedREct = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y, width: collectionView.bounds.width, height: collectionView.bounds.height)
        
        // 스크롤 끝나서 예상되는 컬렉션 뷰의 화면 영역
        guard let layoutAttributes = layoutAttributesForElements(in: proposedREct) else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        
        // 가운데
        let center = collectionView.bounds.width / 2
        // 가장 가까운 곳 속성
        var closeestAttributes: UICollectionViewLayoutAttributes?
        
        // 가운데와의 거리
        var minimumDistance = CGFloat.greatestFiniteMagnitude
        
        for attribute in layoutAttributes {
            let distance = abs(attribute.center.x - proposedContentOffset.x - center)
            if minimumDistance > distance {
                minimumDistance = distance
                closeestAttributes = attribute
            }
        }
            
            guard let finalAttribute = closeestAttributes else {
                return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            }
            
            // 가장 가까운 item을 찾아서 가운데로 이동
            return CGPoint(x: finalAttribute.center.x - center, y: proposedContentOffset.y)
        }
}
