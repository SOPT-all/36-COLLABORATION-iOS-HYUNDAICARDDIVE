import UIKit

final class SpaceCultureView: BaseCollectionReusableView {
    
    lazy var collectionView: UICollectionView = {
        let layout = SpaceCultureCompositionalLayoutFactory().create()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func setStyle() {
        collectionView.backgroundColor = .white
    }
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
