//
//  MapView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class MapView: BaseView {
    
    // MARK: - UIComponents
    
    private let titleLabel = UILabel()
    let addressLabel = UILabel()
    private let findButton = UIButton()
    private let mapImageView = UIImageView()
    private var configuration = UIButton.Configuration.filled()
    private let kakaoMapButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        titleLabel.do {
            $0.text = "오시는 길"
            $0.font = .custom(.ns_sb_20)
            $0.textColor = .black
        }
        
        addressLabel.do {
            $0.text = "저쩌고"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
        }
        
        mapImageView.do {
            $0.image = .iosImgMap
        }
        
        kakaoMapButton.do {
            $0.backgroundColor = .white
            $0.setTitle("카카오맵으로 열기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .custom(.ns_sb_16)
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 3
        }
        
        var config = UIButton.Configuration.filled()
        config.title = "길찾기"
        config.baseBackgroundColor = .pointYellow
        config.cornerStyle = .capsule
        config.image = .imgIntroduceKakaomap
        config.imagePlacement = .leading
        
        findButton.configuration = config
        findButton.titleLabel?.font = .custom(.ns_r_11)
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            addressLabel,
            findButton,
            mapImageView,
            kakaoMapButton
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        addressLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        findButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(78)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(66)
            $0.height.equalTo(24)
        }
        
        mapImageView.snp.makeConstraints{
            $0.top.equalTo(addressLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(190)
        }
        
        kakaoMapButton.snp.makeConstraints{
            $0.top.equalTo(mapImageView.snp.bottom).offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(56)
            $0.centerX.equalToSuperview()
        }
    }
}
