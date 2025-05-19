//
//  VisitorView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class VisitorView: BaseView {
    
    // MARK: - UIComponents
    
    private let title = UILabel()
    
    private let shareBanner = ShareBannerView()
    
    let visitorListCollectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        title.do {
            $0.text = "방문인증"
            $0.textColor = .black
            $0.font = .custom(.ns_sb_20)
        }
        
        shareBanner.do {
            $0.layer.cornerRadius = 3
        }
        
        visitorListCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.isPagingEnabled = true
            $0.isUserInteractionEnabled = true
            $0.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func setUI() {
        addSubviews(
            title,
            shareBanner,
            visitorListCollectionView
        )
    }
    
    override func setLayout() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        shareBanner.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(50)
        }
        
        visitorListCollectionView.snp.makeConstraints {
            $0.top.equalTo(shareBanner.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(266)
        }
    }
}

#Preview {
    VisitorView()
}
