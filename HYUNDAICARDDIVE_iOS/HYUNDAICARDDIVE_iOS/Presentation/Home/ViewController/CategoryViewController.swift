//
//  CategoryViewController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/16/25.
//
//
//  CategoryViewController.swift
//

import UIKit

final class CategoryViewController: BaseViewController {

    // MARK: - Properties

    private let categories = ["전체", "디자인·아트", "건축·인테리어", "여행", "음악", "쿠킹·고메", "스타일", "테크", "스페셜"]
    private var selectedIndex: Int = 0
    private let rootView = CategoryView()

    // MARK: - Lifecycle

    override func loadView() {
        self.view = rootView
    }

    override func setView() {
        view.backgroundColor = .white
    }

    override func setAction() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryChipCell.reuseIdentifier,
            for: indexPath
        ) as? CategoryChipCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: categories[indexPath.item], isSelected: indexPath.item == selectedIndex)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.font = .custom(.ns_sb_12)
        label.text = categories[indexPath.item]
        label.sizeToFit()
        let width = label.frame.width + 32
        return CGSize(width: width, height: 32)
    }
}
