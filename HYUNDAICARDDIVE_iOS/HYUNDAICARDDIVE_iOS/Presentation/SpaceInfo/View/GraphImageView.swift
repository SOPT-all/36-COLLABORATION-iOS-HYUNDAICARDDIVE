//
//  GraphImageView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class GraphImageView: BaseView {
    
    // MARK: - UIComponents
    
    private let graphImageView = UIImageView()
    private let title = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        title.do {
            $0.text = "혼잡 시간대"
            $0.font = .custom(.ns_sb_20)
            $0.textColor = .black
        }
        
        graphImageView.do {
            $0.image = .iosGraph
        }
    }
    
    override func setUI() {
        addSubviews(
            title,
            graphImageView
        )
    }
    
    override func setLayout() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        graphImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(226)
            $0.width.equalTo(335)
        }
    }
}
