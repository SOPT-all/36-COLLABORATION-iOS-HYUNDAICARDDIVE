//
//  HomeCardCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class HomeCardCell: BaseCollectionViewCell {

    // MARK: - UI Components

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    private let categoryLabel = UILabel.paddedLabel(top: 2, left: 10, bottom: 2, right: 10).then {
        $0.font = .custom(.ns_sb_9)
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
    }

    private let titleLabel = UILabel().then {
        $0.font = .custom(.ns_b_16)
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }

    private let subtitleLabel = UILabel().then {
        $0.font = .custom(.ns_sb_9)
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }

    // MARK: - Override

    override func setUI() {
        contentView.addSubviews(
            imageView,
            categoryLabel,
            titleLabel,
            subtitleLabel
        )
    }

    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let textStack = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, subtitleLabel]).then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 7
        }

        contentView.addSubview(textStack)

        textStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().offset(16)
            $0.trailing.lessThanOrEqualToSuperview().offset(-16)
        }

        categoryLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }

        titleLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualToSuperview().offset(-12)
        }

        subtitleLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(18)
        }
    }

    // MARK: - Functions

    func configure(with model: HomeCardModel) {
        if let url = URL(string: model.imageUrl), model.imageUrl.hasPrefix("http") {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: model.imageUrl)
        }

        categoryLabel.text = model.category
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
