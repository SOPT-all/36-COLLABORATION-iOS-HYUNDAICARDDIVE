import UIKit

final class DesignLibraryHeaderView: BaseView {
    
    private let designLibraryImageView = UIImageView()
    private let designLibraryLabel = UILabel()
    private let designLibraryStackView = UIStackView()
    
    private let addressTitleLabel = UILabel()
    private let addressLabel = UILabel()
    private let addressStackView = UIStackView()
    private let operationTimeTitleLabel = UILabel()
    private let operationTimeLabel = UILabel()
    private let operationTimeStackView = UIStackView()
    
    override func setStyle() {
        designLibraryImageView.do {
            $0.image = .logoHdcBlack.resize(targetSize: CGSize(width: 98, height: 60))
            $0.contentMode = .scaleAspectFit
        }
        
        designLibraryLabel.do {
            $0.text = "시대를 초월한 디자인과의 조우"
            $0.textColor = .black
            $0.font = .custom(.ns_sb_14)
        }
        
        designLibraryStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .leading
        }
        
        addressTitleLabel.do {
            $0.text = "주소"
            $0.textColor = .black
            $0.font = .custom(.ns_sb_12)
            $0.textAlignment = .left
        }
        
        addressLabel.do {
            $0.textColor = .black
            $0.font = .custom(.ns_r_12)
            $0.textAlignment = .left
        }
        
        addressStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        operationTimeTitleLabel.do {
            $0.text = "운영시간"
            $0.textColor = .black
            $0.font = .custom(.ns_sb_12)
            $0.textAlignment = .left
        }
        
        operationTimeLabel.do {
            $0.textColor = .black
            $0.font = .custom(.ns_r_12)
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        
        operationTimeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .top
        }
    }
    
    override func setUI() {
        designLibraryStackView.addArrangedSubviews(designLibraryImageView, designLibraryLabel)
        addressStackView.addArrangedSubviews(addressTitleLabel, addressLabel)
        operationTimeStackView.addArrangedSubviews(operationTimeTitleLabel, operationTimeLabel)
        addSubviews(designLibraryStackView, addressStackView, operationTimeStackView)
    }
    
    override func setLayout() {
        designLibraryStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(38)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(89)
        }
        
        designLibraryImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(60)
        }
        
        designLibraryLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(21)
        }
        
        addressStackView.snp.makeConstraints {
            $0.top.equalTo(designLibraryStackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(322)
            $0.height.equalTo(18)
        }
        
        addressTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(18)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        operationTimeStackView.snp.makeConstraints {
            $0.top.equalTo(addressStackView.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(36)
        }
        
        operationTimeTitleLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(18)
        }
        
        operationTimeLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(34)
        }
    }
    
    func dataBind(item: SpaceCultureDetailResponseDto) {
        addressLabel.text = item.address
        let operationTimeText = item.operationTime.replacingOccurrences(of: "연휴 ", with: "연휴\n")
        operationTimeLabel.text = operationTimeText
    }
}
