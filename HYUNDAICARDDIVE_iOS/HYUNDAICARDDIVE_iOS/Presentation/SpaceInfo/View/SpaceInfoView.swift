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
    
    private let mainImageView = UIImageView()
    
    private let searchBookView = SearchBookView()
    
    private let cardInfoView = CardInfoView()
    
    private let mapView = MapView()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white2
        }
        
        contentView.do {
            $0.isUserInteractionEnabled = true
        }
        
        mainImageView.do {
            $0.image = .iosCardIntroduceBanner
        }
        
        searchBookView.do {
            $0.backgroundColor = .white
        }
        
        cardInfoView.do {
            $0.backgroundColor = .white
        }
        
        mapView.do {
            $0.backgroundColor = .white
        }
    }
    
    override func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            mainImageView,
            searchBookView,
            cardInfoView,
            mapView
        )
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        mainImageView.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(282)
        }
        
        searchBookView.snp.makeConstraints{
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        cardInfoView.snp.makeConstraints{
            $0.top.equalTo(searchBookView.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(447)
        }
        
        mapView.snp.makeConstraints{
            $0.top.equalTo(cardInfoView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(360)
            $0.bottom.equalToSuperview().inset(100)
        }
    }
}
