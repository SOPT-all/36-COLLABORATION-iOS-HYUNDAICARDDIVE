import UIKit

enum SupplementaryItemType {
    case header
}

class BaseCompositionalLayoutFactory {
    
    func createSection(
        group: NSCollectionLayoutGroup,
        orthogonalScrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none,
        sectionContentInsets: NSDirectionalEdgeInsets = .zero,
        boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]? = nil
    ) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = orthogonalScrollBehavior
        section.contentInsets = sectionContentInsets
        
        if let supplementaryItems = boundarySupplementaryItems {
            section.boundarySupplementaryItems = supplementaryItems
        }
        return section
    }
    
    func createGroup(
        items: [NSCollectionLayoutItem],
        widthDimension: NSCollectionLayoutDimension,
        heightDimension: NSCollectionLayoutDimension,
        contentInsets: NSDirectionalEdgeInsets = .zero
    ) -> NSCollectionLayoutGroup {
        
        let groupSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: items)
        group.contentInsets = contentInsets
        return group
    }
    
    func createItem(
        widthDimension: NSCollectionLayoutDimension,
        heightDimension: NSCollectionLayoutDimension,
        contentInsets: NSDirectionalEdgeInsets = .zero
    ) -> NSCollectionLayoutItem {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = contentInsets
        return item
    }
    
    func createBoundarySupplementaryItem(
        type: SupplementaryItemType,
        widthDimension: NSCollectionLayoutDimension,
        heightDimension: NSCollectionLayoutDimension,
        alignment: NSRectAlignment = .top
    ) -> NSCollectionLayoutBoundarySupplementaryItem {
        
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: widthDimension, heightDimension: heightDimension), elementKind: UICollectionView.elementKindSectionHeader, alignment: alignment)
    }
        
}
