//
//  CarouselFlowLayout.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/19/25.
//

import UIKit

final class CarouselFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        scrollDirection = .vertical
        minimumLineSpacing = 16
        sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 80, right: 30)
        itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 445)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect),
              let collectionView = collectionView else {
            return nil
        }

        let centerY = collectionView.contentOffset.y + collectionView.bounds.height / 2

        for attr in attributes {
            let distance = abs(attr.center.y - centerY)
            let normalized = distance / collectionView.bounds.height
            let scale = 1 - (normalized * 0.2)

            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
            attr.zIndex = Int((1 - normalized) * 10)
        }

        return attributes
    }
}
