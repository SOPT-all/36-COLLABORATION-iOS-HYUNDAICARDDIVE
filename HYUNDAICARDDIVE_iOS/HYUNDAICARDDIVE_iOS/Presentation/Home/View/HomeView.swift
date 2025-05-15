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

    private let divider = UILabel().then {
        $0.text = "|"
        $0.textColor = .gray5
        $0.font = .custom(.ns_eb_22)
    }

    private func searchIcon(named: String) -> UIImageView {
        let imageView = UIImageView()
        if let image = UIImage(named: named) {
            imageView.image = image.resize(targetSize: CGSize(width: 40, height: 40))
        }
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    private let spacer = UIView()

    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .center
    }

    // MARK: - Setup

    override func setUI() {
        addSubview(stackView)
        stackView.addArrangedSubviews(
            suggestionButton,
            divider,
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

        spacer.snp.makeConstraints {
            $0.width.equalTo(152)
        }
    }
}

#Preview {
    HomeView()
}
