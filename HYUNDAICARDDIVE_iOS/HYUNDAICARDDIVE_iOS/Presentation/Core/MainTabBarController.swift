//
//  TabBar.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/14/25.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
        let tabBarVC = UITabBarController()

        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()

        vc1.title = "home"
        vc2.title = "space&culture"
        vc3.title = "profile"

        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white

        if let items = tabBarVC.tabBar.items {
            items[0].image = UIImage(named: "ic_navi_home_deact")
            items[1].image = UIImage(named: "ic_navi_culture_deact")
            items[2].image = UIImage(named: "ic_navi_profile_deact")
        }

        present(tabBarVC, animated: false)
    }
}

#Preview {
    TabBar()
}
