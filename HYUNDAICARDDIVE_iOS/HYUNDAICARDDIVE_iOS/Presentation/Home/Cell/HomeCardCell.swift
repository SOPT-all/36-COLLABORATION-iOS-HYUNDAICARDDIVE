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
        categoryLabel.layer.cornerRadius = 10
        
        titleLabel.font = .custom(.ns_b_16)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        subtitleLabel.font = .custom(.ns_sb_9)
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 2
        subtitleLabel.lineBreakMode = .byWordWrapping
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
            $0.width.lessThanOrEqualTo(60)
        }
    }
    
    // MARK: - Functions
    
    func configure(with card: HomeCard) {
        if let url = URL(string: card.imageUrl), card.imageUrl.hasPrefix("http") {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: card.imageUrl)
        }
        
        categoryLabel.text = card.displayCardCategory
        titleLabel.text = card.title
        subtitleLabel.text = card.hashTag
    }
}

// MARK: - Extensions

extension HomeCard {
    var displayCardCategory: String {
        return [
            "design": "디자인·아트",
            "building": "건축·인테리어",
            "trip": "여행",
            "music": "음악",
            "cooking": "쿠킹·고메",
            "style": "스타일",
            "tech": "테크",
            "special": "스페셜",
            "total": "전체"
        ][category] ?? category
    }
}
