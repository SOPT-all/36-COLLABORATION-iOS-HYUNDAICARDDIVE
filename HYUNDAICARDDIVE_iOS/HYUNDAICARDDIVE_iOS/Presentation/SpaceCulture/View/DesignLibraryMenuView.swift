import UIKit

final class DesignLibraryMenuView: BaseView {
    
    private let divider = UILabel()
    let introduceSpaceButton = UIButton()
    private let introduceSpaceLabel = UILabel()
    private let introduceSpaceStackView = UIStackView()
    private let searchBookButton = UIButton()
    private let searchBookLabel = UILabel()
    private let searchBookStackView = UIStackView()
    private let reserveBookButton = UIButton()
    private let reserveBookLabel = UILabel()
    private let reserveBookStackView = UIStackView()
    private let visitVertificationButton = UIButton()
    private let visitVertificationLabel = UILabel()
    private let visitVertificationStackView = UIStackView()
    private let newBookButton = UIButton()
    private let newBookLabel = UILabel()
    private let newBookStackView = UIStackView()
    private let menuStackView = UIStackView()
    
    override func setStyle() {
        introduceSpaceButton.do {
            $0.setImage(.icSpaceDetailSpace.resize(targetSize: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        introduceSpaceStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
        }
        
        introduceSpaceLabel.do {
            $0.text = "공간소개"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_m_10)
        }
        
        searchBookButton.do {
            $0.setImage(.icSpaceDetailBooksearch.resize(targetSize: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        searchBookLabel.do {
            $0.text = "도서 검색"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_m_10)
        }
        
        searchBookStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
        }
        
        reserveBookButton.do {
            $0.setImage(.icSpaceDetailReservation.resize(targetSize: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        reserveBookLabel.do {
            $0.text = "레어북룸 예약"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_m_10)
        }
        
        reserveBookStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
        }
        
        visitVertificationButton.do {
            $0.setImage(.icSpaceDetailReview.resize(targetSize: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        visitVertificationLabel.do {
            $0.text = "방문 인증"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_m_10)
        }
        
        visitVertificationStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
        }
        
        newBookButton.do {
            $0.setImage(.icSpaceDetailBook.resize(targetSize: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        newBookLabel.do {
            $0.text = "신규 도서"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .custom(.ns_m_10)
        }
        
        newBookStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
        }
        
        menuStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
        
        divider.do {
            $0.backgroundColor = .white2
        }
    }
    
    override func setUI() {
        introduceSpaceStackView.addArrangedSubviews(introduceSpaceButton, introduceSpaceLabel)
        searchBookStackView.addArrangedSubviews(searchBookButton, searchBookLabel)
        reserveBookStackView.addArrangedSubviews(reserveBookButton, reserveBookLabel)
        visitVertificationStackView.addArrangedSubviews(visitVertificationButton, visitVertificationLabel)
        newBookStackView.addArrangedSubviews(newBookButton, newBookLabel)
        menuStackView.addArrangedSubviews(introduceSpaceStackView, searchBookStackView, reserveBookStackView, visitVertificationStackView, newBookStackView)
        addSubviews(divider, menuStackView)
    }
    
    override func setLayout() {
        divider.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        
        introduceSpaceButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        
        introduceSpaceLabel.snp.makeConstraints {
            $0.top.equalTo(introduceSpaceButton.snp.bottom).offset(3)
        }
        
        searchBookButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        
        searchBookLabel.snp.makeConstraints {
            $0.top.equalTo(searchBookButton.snp.bottom).offset(3)
        }
        
        reserveBookButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        
        reserveBookLabel.snp.makeConstraints {
            $0.top.equalTo(reserveBookButton.snp.bottom).offset(3)
        }
        
        visitVertificationButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        
        visitVertificationLabel.snp.makeConstraints {
            $0.top.equalTo(visitVertificationButton.snp.bottom).offset(3)
        }
        
        newBookButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        
        newBookLabel.snp.makeConstraints {
            $0.top.equalTo(newBookButton.snp.bottom).offset(3)
        }
    }
}
