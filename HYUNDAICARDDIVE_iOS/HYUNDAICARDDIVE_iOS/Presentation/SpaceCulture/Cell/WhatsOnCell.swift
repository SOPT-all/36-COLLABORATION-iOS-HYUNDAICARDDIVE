import UIKit

final class WhatsOnCell: BaseCollectionViewCell, DataBindableCell {
    
    typealias DataType = WhatsOn
        
    private let dotView = UIImageView()
    private let timeLineView = UIView()
    private let timeLineStackView = UIStackView()
    private let dateLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stageLabel = UILabel()
    private let stageLocationDivideLine = UILabel()
    private let locationLabel = UILabel()
    private let locationReservationDivideLine = UILabel()
    private let reservationLabel = UILabel()
    private let locationAndReservationStackView = UIStackView()
    private let informationView = UIView()
    private let programImageView = UIImageView()
    
    override func setStyle() {
        dotView.do {
            $0.layer.cornerRadius = 3.5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.clear.cgColor
            $0.backgroundColor = .black
            $0.clipsToBounds = true
        }
        
        timeLineView.do { $0.backgroundColor = .black10 }
        timeLineStackView.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .center
        }
        dateLabel.do { $0.font = .custom(.ns_m_11) }
        titleLabel.do { $0.font = .custom(.ns_b_14) }
        
        descriptionLabel.do {
            $0.font = .custom(.ns_m_12_18)
            $0.textColor = .gray4
            $0.numberOfLines = 2
        }
        
        stageLabel.do {
            $0.font = .custom(.ns_m_10)
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
        stageLocationDivideLine.do { $0.backgroundColor = .gray4 }
        
        locationLabel.do {
            $0.font = .custom(.ns_m_10)
            $0.textColor = .gray4
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
        
        locationReservationDivideLine.do { $0.backgroundColor = .gray4 }
        
        reservationLabel.do {
            $0.font = .custom(.ns_m_10)
            $0.textColor = .pointGreen
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
        
        locationAndReservationStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        programImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 10
        }
    }
    
    override func setUI() {
        timeLineStackView.addArrangedSubviews(dotView, timeLineView)
        locationAndReservationStackView.addArrangedSubviews(stageLabel, stageLocationDivideLine, locationLabel, locationReservationDivideLine, reservationLabel)
        informationView.addSubviews(dateLabel, titleLabel, descriptionLabel, locationAndReservationStackView, programImageView)
        addSubviews(timeLineStackView, informationView)
    }
    
    override func setLayout() {        
        dotView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.height.equalTo(7)
        }
        
        timeLineView.snp.makeConstraints {
            $0.top.equalTo(dotView.snp.bottom)
            $0.width.equalTo(1)
            $0.height.equalTo(141)
        }
        
        timeLineStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.height.equalTo(148)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(135)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.width.equalTo(185)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        locationAndReservationStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        stageLocationDivideLine.snp.makeConstraints {
            $0.height.equalTo(11)
            $0.width.equalTo(1)
        }
        
        locationReservationDivideLine.snp.makeConstraints {
            $0.height.equalTo(11)
            $0.width.equalTo(1)
        }
        
        informationView.snp.makeConstraints {
            $0.leading.equalTo(timeLineStackView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(108)
        }
        
        programImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(90)
            $0.centerY.equalToSuperview()
        }
    }
    
    func dataBind(item: WhatsOn) {
        dateLabel.text = item.date
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        stageLabel.text = item.stage
        locationLabel.text = item.location
        
        if item.reservation {
            reservationLabel.text = "예매"
        } else {
            locationReservationDivideLine.isHidden = true
            reservationLabel.isHidden = true
        }
        
        let url = URL(string: item.image)
        programImageView.kf.setImage(with: url)
    }
}
