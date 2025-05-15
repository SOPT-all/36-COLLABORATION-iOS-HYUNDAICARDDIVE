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

    private let suggestionButton = UIButton().then {
        $0.setTitle("추천", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .custom(.ns_eb_22)
        $0.contentMode = .scaleAspectFit
    }

    private let recentButton = UIButton().then {
        $0.setTitle("최신", for: .normal)
        $0.setTitleColor(.gray5, for: .normal)
        $0.titleLabel?.font = .custom(.ns_eb_22)
        $0.contentMode = .scaleAspectFit
    }

    private let divider = UIView().then {
        $0.backgroundColor = .gray3
    }

    private func searchIcon(named: String) -> UIImageView {
        let imageView = UIImageView()
        if let image = UIImage(named: named) {
            imageView.image = image.resize(targetSize: CGSize(width: 40, height: 40))
        }
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    private let spacing25_1 = UIView()
    private let spacing25_2 = UIView()
    private let spacer = UIView()

    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .center
    }

    let categoryView = CategoryView()

    // MARK: - Setup

    override func setUI() {
        addSubview(stackView)
        addSubview(categoryView)

        stackView.addArrangedSubviews(
            suggestionButton,
            spacing25_1,
            divider,
            spacing25_2,
            recentButton,
            spacer,
            searchIcon(named: "ic_home_search")
        )
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }

        spacing25_1.snp.makeConstraints {
            $0.width.equalTo(25)
        }

        divider.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(18)
        }

        spacing25_2.snp.makeConstraints {
            $0.width.equalTo(25)
        }

        spacer.snp.makeConstraints {
            $0.width.equalTo(152)
        }

        categoryView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(36)
        }
    }
}

#Preview {
    HomeView()
}
