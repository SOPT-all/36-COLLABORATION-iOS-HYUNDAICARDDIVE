import UIKit

final class CultureCell: BaseCollectionViewCell, DataBindableCell {
    
    typealias DataType = CultureModel
        
    private let cultureImageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    override func setStyle() {
        cultureImageView.do {
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
        addSubviews(cultureImageView, descriptionLabel)
    }
    
    override func setLayout() {
        cultureImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(88)
            $0.height.equalTo(63)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(cultureImageView.snp.bottom).offset(15)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(88)
            $0.height.equalTo(40)
        }
    }
    
    func dataBind(item: CultureModel) {
        cultureImageView.image = item.image.resize(targetSize: CGSize(width: 64, height: 40))
        descriptionLabel.text = item.description
    }
}
