//
//  VisitorListCollectionViewCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/19/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

protocol VisitorListCollectionViewCellDelegate: AnyObject {
    func likeButtondDidtap(in cell: VisitorListCollectionViewCell)
}

final class VisitorListCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    weak var delegate: VisitorListCollectionViewCellDelegate?
    
    // MARK: - UIComponents
    private let visitorBackgroundView = UIView()
    private let visitorImageView = UIImageView()
    private let nameLabel = UILabel()
    let likeButton = UIButton()
    private let likeCountLabel = UILabel()
    
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
            $0.clipsToBounds = true
        }
        
        visitorBackgroundView.do {
            $0.backgroundColor = .white2
        }
        
        visitorImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        nameLabel.do {
            $0.font = .custom(.ns_sb_16)
            $0.textColor = .black
        }
        
        likeButton.do {
            $0.setImage(.btnIntroduceLike, for: .normal)
            $0.setImage(.btnIntroduceLikeAct, for: .selected)
        }
        
        likeCountLabel.do {
            $0.font = .custom(.ns_m_12_18)
            $0.textColor = .black
        }
    }
    
    override func setUI() {
        addSubviews(
            visitorBackgroundView,
            nameLabel,
            likeButton,
            likeCountLabel
        )
        visitorBackgroundView.addSubview(visitorImageView)
    }
    
    override func setLayout() {
        visitorBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(214)
        }
        
        visitorImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(312)
            $0.height.equalTo(214)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(visitorImageView.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.trailing.equalTo(likeCountLabel.snp.leading).offset(8)
            $0.size.equalTo(40)
        }
    }
}

// MARK: - Func

extension VisitorListCollectionViewCell {
    func dataBind(_ data: Review) {
        let imageURL = URL(string: data.imageUrl)
        likeButton.isSelected = false
        
        visitorImageView.kf.setImage(with: imageURL)
        nameLabel.text = "\(data.reviewer) 님"
        likeCountLabel.text = "\(data.likeCount)"
        likeButton.isSelected = data.isLiked
    }
    
    func setAction() {
        likeButton.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func likeButtonDidTap() {
        delegate?.likeButtondDidtap(in: self)
    }
}
