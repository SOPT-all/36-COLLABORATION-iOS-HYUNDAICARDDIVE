//
//  HomeSlideView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import UIKit
import SnapKit
import Then

final class HomeSlideView: BaseView, UICollectionViewDelegate {

    // MARK: - Properties

    private var originalSlides: [HomeSlideModel] = []
    private var infiniteSlides: [HomeSlideModel] = []

    // MARK: - UI

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: {
            let layout = CarouselFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 16
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 445)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
            return layout
        }()
    )

    // MARK: - Setup

    override func setStyle() {
        collectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isPagingEnabled = false
            $0.register(HomeSlideCell.self, forCellWithReuseIdentifier: "HomeSlideCell")
            $0.delegate = self
            $0.dataSource = self
        }
    }

    override func setUI() {
        addSubview(collectionView)
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Data Binding

    func setData(_ data: [HomeSlideModel]) {
        originalSlides = data
        infiniteSlides = Array(repeating: data, count: 5).flatMap { $0 }
        collectionView.reloadData()

        DispatchQueue.main.async {
            let middleIndex = self.infiniteSlides.count / 2
            self.collectionView.scrollToItem(at: IndexPath(item: middleIndex, section: 0), at: .top, animated: false)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeSlideView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infiniteSlides.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeSlideCell",
            for: indexPath
        ) as? HomeSlideCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: infiniteSlides[indexPath.item])
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension HomeSlideView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.bounds.size.height

        if offsetY <= 0 {
            let middle = infiniteSlides.count / 2
            collectionView.scrollToItem(at: IndexPath(item: middle, section: 0), at: .top, animated: false)
        } else if offsetY + height >= contentHeight {
            let middle = infiniteSlides.count / 2
            collectionView.scrollToItem(at: IndexPath(item: middle, section: 0), at: .top, animated: false)
        }
    }
}
