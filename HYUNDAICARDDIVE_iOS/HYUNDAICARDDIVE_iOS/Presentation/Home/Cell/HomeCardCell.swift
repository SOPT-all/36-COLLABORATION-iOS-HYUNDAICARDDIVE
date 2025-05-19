//
//  HomeCardCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import UIKit
import SnapKit
import Kingfisher

final class HomeCardCell: BaseCollectionViewCell {

    // MARK: - UI Components

    private let imageView = UIImageView()
    private let categoryLabel = UILabel.paddedLabel(top: 2, left: 10, bottom: 2, right: 10)
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let textStack = UIStackView()

    // MARK: - Override

    override func setStyle() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true

        categoryLabel.font = .custom(.ns_sb_9)
        categoryLabel.textColor = .black
        categoryLabel.backgroundColor = .white
        categoryLabel.textAlignment = .center
        categoryLabel.clipsToBounds = true
        categoryLabel.layer.cornerRadius = 13

        titleLabel.font = .custom(.ns_b_16)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center

        subtitleLabel.font = .custom(.ns_sb_9)
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center

        textStack.axis = .vertical
        textStack.alignment = .center
        textStack.spacing = 7
    }

    override func setUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(textStack)
        textStack.addArrangedSubviews(categoryLabel, titleLabel, subtitleLabel)
    }

    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        textStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        categoryLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
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
