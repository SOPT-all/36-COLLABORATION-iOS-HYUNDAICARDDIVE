//
//  CategoryChipCell.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class CategoryChipCell: BaseCollectionViewCell {

    static let reuseIdentifier = "CategoryChipCell"

    private let titleLabel = UILabel().then {
        $0.font = .custom(.ns_sb_12)
        $0.textColor = .gray4
        $0.textAlignment = .center
    }

    // MARK: - Override

    override func setStyle() {
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray3.cgColor
    }

    override func setUI() {
        contentView.addSubview(titleLabel)
    }

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12))
        }
    }

    func configure(with title: String, isSelected: Bool) {
        titleLabel.text = title
        contentView.backgroundColor = isSelected ? .black : .white
        titleLabel.textColor = isSelected ? .white : .gray4
        contentView.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.gray2.cgColor
    }

    override var isSelected: Bool {
        didSet {
            configure(with: titleLabel.text ?? "", isSelected: isSelected)
        }
    }
}
