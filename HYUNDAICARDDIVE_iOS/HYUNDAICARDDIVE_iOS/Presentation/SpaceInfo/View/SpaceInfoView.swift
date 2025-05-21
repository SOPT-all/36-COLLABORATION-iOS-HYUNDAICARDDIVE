//
//  SpaceInfoView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class SpaceInfoView: BaseView {
    
    // MARK: - UIComponents
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    let mainImageView = UIImageView()
    
    private let searchBookView = SearchBookView()
    
    let cardInfoView = CardInfoView()
    
    let mapView = MapView()
    
    private let graphView = GraphImageView()
    
    let visitorView = VisitorView()
    
    let questionView = QuestionView()
    
    private let noticeView = NoticeView()
    
    private let reservationButton = UIView()
    private let reservationLabel = UILabel()
    let backButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white2
        }
        
        contentView.do {
            $0.isUserInteractionEnabled = true
        }
        
        mainImageView.do {
            $0.backgroundColor = .white2
        }
        
        reservationButton.do {
            $0.backgroundColor = .black
        }
        
        reservationLabel.do {
            $0.text = "레어북룸 예약"
            $0.font = .custom(.ns_sb_16)
            $0.textColor = .white
        }
        
        backButton.do {
            var config = UIButton.Configuration.filled()
            config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 18)
            config.baseBackgroundColor = .white
            config.cornerStyle = .capsule
            
            let sizeImage = UIImage(resource: .icSpaceDetailChevronLeft).resize(targetSize: CGSize(width: 6, height: 12))
            config.image = sizeImage
            $0.configuration = config

            $0.layer.cornerRadius = 20
            $0.clipsToBounds = false
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func setUI() {
        addSubviews(
            scrollView,
            backButton
        )
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            mainImageView,
            searchBookView,
            cardInfoView,
            mapView,
            graphView,
            visitorView,
            questionView,
            noticeView,
            reservationButton
        )
        
        reservationButton.addSubview(reservationLabel)
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        mainImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(282)
        }
        
        searchBookView.snp.makeConstraints{
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        cardInfoView.snp.makeConstraints{
            $0.top.equalTo(searchBookView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(416)
        }
        
        mapView.snp.makeConstraints{
            $0.top.equalTo(cardInfoView.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(416)
        }
        
        graphView.snp.makeConstraints{
            $0.top.equalTo(mapView.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(282)
        }
        
        visitorView.snp.makeConstraints{
            $0.top.equalTo(graphView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(442)
        }
        
        questionView.snp.makeConstraints{
            $0.top.equalTo(visitorView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(154)
        }
        
        noticeView.snp.makeConstraints{
            $0.top.equalTo(visitorView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(337)
        }
        
        reservationLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        reservationButton.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview()
        }
    }
}

extension SpaceInfoView {
    func dataBind(imageURL: String) {
        let url = URL(string: imageURL)
        self.mainImageView.kf.setImage(with: url)
    }
}
