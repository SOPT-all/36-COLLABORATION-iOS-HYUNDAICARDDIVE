//
//  ShareBannerView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class ShareBannerView: BaseView {
    
    // MARK: -  UIComponents
    
    private let bubbleImageView = UIImageView()
    private let titleLabel = UILabel()
    private let nextButton = UIButton()
    
    // MARK: -  UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white2
        }
        
        bubbleImageView.do {
            $0.image = .icIntroduceReview
        }
        
        titleLabel.do {
            $0.text = "방문 경험을 공유해주세요."
            $0.font = .custom(.ns_r_14)
            $0.textColor = .black
        }
        
        nextButton.do {
            $0.setImage(.icNext, for: .normal)
        }
    }
    
    override func setUI() {
        addSubviews(
            bubbleImageView,
            titleLabel,
            nextButton
        )
    }
    
    override func setLayout() {
        bubbleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(22)
            $0.width.equalTo(12)
            $0.height.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(bubbleImageView.snp.centerY)
            $0.leading.equalTo(bubbleImageView.snp.trailing).offset(16)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(5)
            $0.height.equalTo(12)
        }
    }
}
