//
//  MainTabBarController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/14/25.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {

    private let customTabBarView = UIView()
    private let topBorder = UIView()
    private let homeButton = UIButton()
    private let cultureButton = UIButton()
    private let profileButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupCustomTabBar()
        setupTabBarButtons()
        selectedIndex = 0
        selectTab(index: 0)
    }

    private func setupViewControllers() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SpaceCultureViewController())

        self.setViewControllers([vc1, vc2], animated: false)
        self.tabBar.isHidden = true
    }

    private func setupCustomTabBar() {
        view.addSubview(customTabBarView)
        customTabBarView.backgroundColor = .white
        customTabBarView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(80)
        }

        customTabBarView.addSubview(topBorder)
        topBorder.backgroundColor = UIColor.gray3
        topBorder.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(0.5)
        }

        customTabBarView.addSubview(homeButton)
        customTabBarView.addSubview(cultureButton)
        customTabBarView.addSubview(profileButton)
    }

    private func setupTabBarButtons() {
        homeButton.setImage(UIImage(named: "ic_navi_home_deact"), for: .normal)
        homeButton.setImage(UIImage(named: "ic_navi_home_act"), for: .selected)
        cultureButton.setImage(UIImage(named: "ic_navi_culture_deact"), for: .normal)
        cultureButton.setImage(UIImage(named: "ic_navi_culture_act"), for: .selected)
        profileButton.setImage(UIImage(named: "ic_navi_profile_deact"), for: .normal)
        
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        cultureButton.addTarget(self, action: #selector(didTapCulture), for: .touchUpInside)
        
        let buttonSize = CGSize(width: 36, height: 36)
        
        homeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview().offset(-122)
            $0.size.equalTo(buttonSize)
        }
        
        cultureButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(buttonSize)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview().offset(122)
            $0.size.equalTo(buttonSize)
        }
    }

    @objc private func didTapHome() {
        selectTab(index: 0)
    }

    @objc private func didTapCulture() {
        selectTab(index: 1)
    }

    private func selectTab(index: Int) {
        selectedIndex = index
        homeButton.isSelected = index == 0
        cultureButton.isSelected = index == 1
    }
}
