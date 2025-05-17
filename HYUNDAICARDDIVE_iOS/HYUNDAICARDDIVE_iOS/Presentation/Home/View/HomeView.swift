//
//  HomeView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/15/25.
//

import UIKit
import SnapKit
import Then

final class HomeView: BaseView {

    // MARK: - UI Components

    let suggestionButton = UIButton().then {
        $0.setTitle("추천", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .custom(.ns_eb_22)
        $0.contentMode = .scaleAspectFit
    }

    let recentButton = UIButton().then {
        $0.setTitle("최신", for: .normal)
        $0.setTitleColor(.gray4, for: .normal)
        $0.titleLabel?.font = .custom(.ns_eb_22)
        $0.contentMode = .scaleAspectFit
    }

    private let divider = UIView().then {
        $0.backgroundColor = .gray3
    }

    private let spacing25_1 = UIView()
    private let spacing25_2 = UIView()

    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .center
    }

    private let searchImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "ic_home_search")?.resize(targetSize: CGSize(width: 40, height: 40))
    }

    let categoryCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
            return layout
        }()
    ).then {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(CategoryChipCell.self, forCellWithReuseIdentifier: CategoryChipCell.reuseIdentifier)
    }

    let slideView = HomeSlideView()

    // MARK: - Setup

    override func setUI() {
        addSubview(stackView)
        addSubview(searchImageView)
        addSubview(categoryCollectionView)
        addSubview(slideView)

        stackView.addArrangedSubviews(
            suggestionButton,
            spacing25_1,
            divider,
            spacing25_2,
            recentButton
        )
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.lessThanOrEqualTo(searchImageView.snp.leading).offset(-8)
        }

        spacing25_1.snp.makeConstraints { $0.width.equalTo(25) }
        divider.snp.makeConstraints { $0.width.equalTo(1); $0.height.equalTo(18) }
        spacing25_2.snp.makeConstraints { $0.width.equalTo(25) }

        searchImageView.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(40)
        }

        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(36)
        }

        slideView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: - Action Style Update

    func updateButtonStyle(isSuggestionSelected: Bool) {
        suggestionButton.setTitleColor(isSuggestionSelected ? .black : .gray4, for: .normal)
        recentButton.setTitleColor(isSuggestionSelected ? .gray4 : .black, for: .normal)
    }
}

#Preview {
    HomeView()
}
