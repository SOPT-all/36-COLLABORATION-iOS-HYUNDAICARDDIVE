import UIKit
import SnapKit
import Then

class WhatsOnHeaderView: BaseCollectionReusableView {
    
    private let titleLabel = UILabel()
    private let moreButton = UIButton()
    private let titleStackView = UIStackView()
    private let divider = UILabel()
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "What's on"
            $0.font = UIFont.custom(.yni_20)
        }
        
        moreButton.do {
            $0.setTitle("더보기 >", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = UIFont.custom(.ns_m_13)
        }
        
        titleStackView.do {
            $0.axis = .horizontal
        }
        
        divider.do {
            $0.backgroundColor = .black
        }
    }
    
    override func setUI() {
        backgroundColor = .white
        titleStackView.addSubviews(titleLabel, moreButton)
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
            $0.width.equalTo(110)
            $0.height.equalTo(22)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalTo(titleStackView.snp.trailing)
            $0.width.equalTo(60)
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
