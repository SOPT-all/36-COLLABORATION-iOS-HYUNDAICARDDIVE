//
//  HomeCardView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/19/25.
//

import UIKit
import SnapKit
import Then

final class HomeCardView: BaseView {

    // MARK: - Properties

    private var cards: [HomeCardModel] = []

    // MARK: - UI

    private lazy var layout = UICollectionViewFlowLayout().then {
        let spacing: CGFloat = 9
        let horizontalInset: CGFloat = 30
        let totalSpacing = spacing + horizontalInset * 2
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / 2
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 12
        $0.minimumInteritemSpacing = spacing
        $0.itemSize = CGSize(width: itemWidth, height: 248)
        $0.sectionInset = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
    ).then {
        $0.showsVerticalScrollIndicator = false
        $0.isPagingEnabled = false
        $0.register(HomeCardCell.self, forCellWithReuseIdentifier: "HomeCardCell")
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
    }

    // MARK: - Setup

    override func setUI() {
        addSubview(collectionView)
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(96)
        }
    }

    // MARK: - Data Binding

    func setData(_ data: [HomeCardModel]) {
        cards = data
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension HomeCardView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeCardCell",
            for: indexPath
        ) as? HomeCardCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: cards[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeCardView: UICollectionViewDelegateFlowLayout {}
