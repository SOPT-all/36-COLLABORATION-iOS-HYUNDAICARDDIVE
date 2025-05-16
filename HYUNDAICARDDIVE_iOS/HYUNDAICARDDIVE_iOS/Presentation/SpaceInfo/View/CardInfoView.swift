//
//  CardInfoView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class CardInfoView: BaseView {
    
    // MARK: - UIComponents
    
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        titleLabel.do {
            $0.text = "공간소개"
            $0.font = .custom(.ns_sb_20)
            $0.textColor = .black
        }
        
        infoLabel.do {
            $0.text = "어쩌고"
            $0.font = .custom(.ns_r_16)
            $0.textColor = .gray5
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            infoLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
