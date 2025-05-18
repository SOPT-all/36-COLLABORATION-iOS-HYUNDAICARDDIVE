//
//  HomeViewController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/14/25.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: BaseViewController {

    // MARK: - Properties

    private let rootView = HomeView()
    private let categories = ["전체", "디자인·아트", "건축·인테리어", "여행", "음악", "쿠킹·고메", "스타일", "테크", "스페셜"]
    private var selectedIndex = 0

    private let floatingButton = UIButton().then {
        let resizedImage = UIImage(named: "ic_home_align1")?.resize(targetSize: CGSize(width: 40, height: 40))
        $0.setImage(resizedImage, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 28
        $0.clipsToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = CGSize(width: 1, height: 2)
        $0.layer.shadowRadius = 4
    }

    // MARK: - Lifecycle

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFloatingButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(type: .article)
    }

    override func setView() {
        rootView.slideView.setData(dummySlides)
        rootView.suggestionButton.addTarget(self, action: #selector(didTapSuggestion), for: .touchUpInside)
        rootView.recentButton.addTarget(self, action: #selector(didTapRecent), for: .touchUpInside)
    }

    override func setAction() {
        rootView.categoryCollectionView.delegate = self
        rootView.categoryCollectionView.dataSource = self
    }

    // MARK: - Setup Floating Button

    private func setupFloatingButton() {
        view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints {
            $0.width.height.equalTo(56)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(98)
        }

        floatingButton.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func didTapSuggestion() {
        rootView.updateButtonStyle(isSuggestionSelected: true)
    }

    @objc private func didTapRecent() {
        rootView.updateButtonStyle(isSuggestionSelected: false)
    }

    @objc private func didTapFloatingButton() {
        floatingButton.isSelected.toggle()

        let imageName = floatingButton.isSelected ? "ic_home_align2" : "ic_home_align1"
        let resizedImage = UIImage(named: imageName)?.resize(targetSize: CGSize(width: 40, height: 40))
        floatingButton.setImage(resizedImage, for: .normal)
    }
}

// MARK: - UICollectionViewDelegate, DataSource, FlowLayout

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryChipCell.reuseIdentifier,
            for: indexPath
        ) as? CategoryChipCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: categories[indexPath.item], isSelected: indexPath.item == selectedIndex)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let label = UILabel()
        label.font = .custom(.ns_sb_12)
        label.text = categories[indexPath.item]
        label.sizeToFit()
        let width = label.frame.width + 32
        return CGSize(width: width, height: 32)
    }
}

#Preview {
    HomeViewController()
}

