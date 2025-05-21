import UIKit

enum SectionType: Int, CaseIterable {
    case whatsOn
    case space
    case culture
}

class SpaceCultureCompositionalLayoutFactory: BaseCompositionalLayoutFactory {
    
    func create() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (sectionIndex, _) ->
            NSCollectionLayoutSection? in
            guard let section: SectionType = SectionType(rawValue: sectionIndex) else {
                return nil
            }
            
            switch section {
            case .whatsOn:
                return createWhatsOnSection()
            case .space:
                return createThreeColumnGridSection()
            case .culture:
                return createThreeColumnGridSection()
            }
        }
        layout.configuration.scrollDirection = .vertical
        return layout
    }
}

extension SpaceCultureCompositionalLayoutFactory {
    
    private func createWhatsOnSection() -> NSCollectionLayoutSection {
        let header = createBoundarySupplementaryItem(
            type: .header,
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30),
            alignment: .top
        )
        
        let item = createItem(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(148)
        )
        
        let group =  createGroup(
            items: [item],
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(148)
        )
        
        let section = createSection(
            group: group,
            sectionContentInsets: .init(top: 40, leading: 32, bottom: 12, trailing: 32),
            boundarySupplementaryItems: [header]
        )
        return section
    }
    
    private func createThreeColumnGridSection() -> NSCollectionLayoutSection {
        let header = createBoundarySupplementaryItem(
            type: .header,
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30),
            alignment: .top
        )

        let item = createItem(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .absolute(120),
            contentInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)
        )

        let horizontalGroup = createGroup(
            items: Array(repeating: item, count: 3),
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(123)
        )
        horizontalGroup.interItemSpacing = .fixed(31)

        let verticalGroup = createGroup(
            items: [horizontalGroup],
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(428)
        )
        verticalGroup.contentInsets.bottom = 12

        let section = createSection(
            group: verticalGroup,
            sectionContentInsets: .init(top: 40, leading: 32, bottom: 12, trailing: 32),
            boundarySupplementaryItems: [header]
        )

        return section
    }

}
