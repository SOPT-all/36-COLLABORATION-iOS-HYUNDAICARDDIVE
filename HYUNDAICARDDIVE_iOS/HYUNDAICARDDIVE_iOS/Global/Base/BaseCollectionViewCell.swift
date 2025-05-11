//
//  BaseCollectionViewCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/12/25.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    /// UI 컴포넌트 속성 설정 (do 메서드 관련)
    func setStyle() {}
    
    /// UI 위계 설정 (addSubView 등)
    func setUI() {
        backgroundColor = .white
    }
    
    /// 오토레이아웃 설정 (SnapKit 코드 관련)
    func setLayout() {}
}
