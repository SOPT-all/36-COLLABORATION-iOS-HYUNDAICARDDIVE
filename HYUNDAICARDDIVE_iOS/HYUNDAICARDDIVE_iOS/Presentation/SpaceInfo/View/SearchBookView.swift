//
//  SearchBookView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class SearchBookView: BaseView {
    
    // MARK: - UIComponents
    
    private let searchBookButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        searchBookButton.do {
            $0.backgroundColor = .white
            $0.setTitle("보유 도서 검색하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .custom(.ns_sb_16)
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 3
        }
    }
    
    override func setUI() {
        addSubview(searchBookButton)
    }
    
    override func setLayout() {
        searchBookButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(56)
        }
    }
}
