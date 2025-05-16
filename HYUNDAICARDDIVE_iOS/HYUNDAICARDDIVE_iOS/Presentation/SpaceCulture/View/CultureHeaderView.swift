import UIKit
import SnapKit
import Then

class CultureHeaderView: BaseCollectionReusableView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()
    private let divider = UILabel()
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "Culture"
            $0.font = UIFont.custom(.yni_20)
        }
        
        subtitleLabel.do {
            $0.text = "현대카드만의 특별한 문화"
            $0.font = UIFont.custom(.ns_m_12_22)
            $0.textColor = .gray4
        }
        
        titleStackView.do {
            $0.axis = .horizontal
        }
        
        divider.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    override func setUI() {
        backgroundColor = .white
        titleStackView.addSubviews(titleLabel, subtitleLabel)
        addSubviews(titleStackView, divider)
    }
    
    override func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(327)
            $0.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleStackView.snp.leading)
            $0.width.equalTo(75)
            $0.height.equalTo(22)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.centerX.equalTo(titleStackView.snp.centerX)
            $0.width.equalTo(140)
            $0.height.equalTo(22)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(327)
            $0.height.equalTo(1)
        }
    }
}
