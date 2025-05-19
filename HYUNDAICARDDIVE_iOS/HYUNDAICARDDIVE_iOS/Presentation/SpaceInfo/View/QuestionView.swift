//
//  QuestionView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class QuestionView:BaseView {
    
    // MARK: - UIComponents
    
    private let titleLabel = UILabel()
    private let telephoneLabel = UILabel()
    private let userTelephoneLabel = UILabel()
    private let emailLabel = UILabel()
    private let userEmailLabel = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        titleLabel.do {
            $0.text = "기타 문의"
            $0.font = .custom(.ns_sb_20)
            $0.textColor = .black
        }
        
        telephoneLabel.do {
            $0.text = "Tel."
            $0.font = .custom(.ns_sb_16)
            $0.textColor = .black
        }
        
        userTelephoneLabel.do {
            $0.font = .custom(.ns_r_16)
            $0.textColor = .black
        }
        
        emailLabel.do {
            $0.text = "E-mail."
            $0.font = .custom(.ns_sb_16)
            $0.textColor = .black
        }
        
        userEmailLabel.do {
            $0.font = .custom(.ns_r_16)
            $0.textColor = .black
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            telephoneLabel,
            userTelephoneLabel,
            emailLabel,
            userEmailLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        telephoneLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        userTelephoneLabel.snp.makeConstraints {
            $0.centerY.equalTo(telephoneLabel.snp.centerY)
            $0.leading.equalTo(telephoneLabel.snp.trailing).offset(16)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(telephoneLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.centerY.equalTo(emailLabel.snp.centerY)
            $0.leading.equalTo(emailLabel.snp.trailing).offset(16)
        }
    }
}

// MARK: - Func

extension QuestionView {
    func dataBind(telephone: String, email: String) {
        userTelephoneLabel.text = telephone
        userEmailLabel.text = email
    }
}
