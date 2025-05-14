//
//  HomeViewController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/14/25.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Property

    private let rootView = HomeView()

    // MARK: - LifeCycle

    override func loadView() {
        view = rootView
    }

    override func setView() {
        view.backgroundColor = .white
    }
}

#Preview {
    HomeViewController()
}
