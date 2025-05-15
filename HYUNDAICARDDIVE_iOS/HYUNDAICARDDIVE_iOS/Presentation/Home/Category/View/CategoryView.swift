//
//  CategoryView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class CategoryView: BaseView {

    // MARK: - UI Components

    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            return layout
        }()
    ).then {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
    }

    // MARK: - Setup

    override func setUI() {
        addSubview(collectionView)
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(36)
        }
    }
}
