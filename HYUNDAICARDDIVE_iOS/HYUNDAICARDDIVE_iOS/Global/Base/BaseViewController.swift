//
//  BaseViewController.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/12/25.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAction()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    /// 네비게이션 바 등 추가적으로 UI와 관련한 작업
    func setView() {}
    
    /// RootView로부터 액션 설정 (addTarget)
    func setAction() {}
    
    /// RootView 또는 ViewController 자체로부터 Delegate, DateSource 등 설정
    func setDelegate() {}
}

extension BaseViewController {
    
    func setNavigationBar(type: NavigationBarType) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let navigationBarAppearance = NavigationBarType.makeAppearance(type: type)
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        if type == .backButton {
            let backButtonImage = NavigationBarType.makeBackButtonImage()
            let barButtonItem = UIBarButtonItem(
                image: backButtonImage,
                style: .done,
                target: self,
                action: #selector(backButtonDidTap)
            )
            barButtonItem.tintColor = .black
            self.navigationItem.leftBarButtonItem = barButtonItem
        } 
    }
    
    @objc
    func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BaseViewController: UIGestureRecognizerDelegate {
    
    /// 뒤로가기 제스쳐 삽입
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }
}
