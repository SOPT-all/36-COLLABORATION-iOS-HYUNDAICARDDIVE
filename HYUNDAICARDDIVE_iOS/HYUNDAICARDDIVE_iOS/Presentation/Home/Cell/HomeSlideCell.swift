//
//  HomeSlideCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class HomeSlideCell: BaseCollectionViewCell {

    // MARK: - UI Components

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }

    private lazy var bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "state=deact"), for: .normal)
        $0.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
    }

    private let categoryLabel = UILabel.paddedLabel(top: 4, left: 16, bottom: 4, right: 16).then {
        $0.font = .custom(.ns_sb_12)
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
    }

    private let titleLabel = UILabel().then {
        $0.font = .custom(.ns_b_32)
        $0.textColor = .white
        $0.numberOfLines = 2
    }

    private let subtitleLabel = UILabel().then {
        $0.font = .custom(.ns_sb_16)
        $0.textColor = .white
    }

    // MARK: - State

    private var isBookmarked: Bool = false {
        didSet {
            let imageName = isBookmarked ? "state=act" : "state=deact"
            bookmarkButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }

    // MARK: - Override

    override func setUI() {
        contentView.addSubviews(
            imageView,
            bookmarkButton,
            categoryLabel,
            titleLabel,
            subtitleLabel
        )
    }

    override func setLayout() {
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        bookmarkButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }

        categoryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.bottom.equalTo(titleLabel.snp.top).offset(-8)
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.lessThanOrEqualToSuperview().inset(24)
            $0.bottom.equalTo(subtitleLabel.snp.top).offset(-8)
        }

        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(29)
        }
    }

    // MARK: - Functions

    private func toggleBookmarkState() {
        isBookmarked.toggle()
    }

    func configure(with model: HomeSlideModel) {
        if let url = URL(string: model.imageUrl), model.imageUrl.hasPrefix("http") {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: model.imageUrl)
        }

        categoryLabel.text = model.category
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        isBookmarked = false
    }

    @objc private func bookmarkButtonTapped() {
        toggleBookmarkState()
    }
}
