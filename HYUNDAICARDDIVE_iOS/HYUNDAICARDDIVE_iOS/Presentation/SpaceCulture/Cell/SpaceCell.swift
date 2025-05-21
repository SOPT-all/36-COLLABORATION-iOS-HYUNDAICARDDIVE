import UIKit

final class SpaceCell: BaseCollectionViewCell, DataBindableCell {
    
    typealias DataType = SpaceModel
        
    private let spaceImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let spaceStackView = UIStackView()
    
    override func setStyle() {
        spaceImageView.do {
            $0.contentMode = .center
        }
        
        descriptionLabel.do {
            $0.font = UIFont.custom(.ns_m_10)
            $0.textColor = .gray4
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
    }
    
    override func setUI() {
        addSubviews(spaceImageView, descriptionLabel)
    }
    
    override func setLayout() {
        spaceImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(88)
            $0.height.equalTo(63)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(spaceImageView.snp.bottom)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(95)
            $0.height.equalTo(40)
        }
    }
    
    func dataBind(item: SpaceModel) {
        spaceImageView.image = item.image.resize(targetSize: CGSize(width: 66, height: 26))
        descriptionLabel.text = item.description
    }
}
