//
//  NoticeView.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class NoticeView: BaseView {
    
    // MARK: - UIComponents
    
    private let titleLabel = UILabel()
    
    private let closetImageView = UIImageView()
    private let petImageView = UIImageView()
    private let foodImageView = UIImageView()
    private let smokingImageView = UIImageView()
    private let bookImageView = UIImageView()
    private let pictureImageView = UIImageView()
    
    private let closetLabel = UILabel()
    private let petLabel = UILabel()
    private let foodLabel = UILabel()
    private let smokingLabel = UILabel()
    private let bookLabel = UILabel()
    private let pictureLabel = UILabel()
    
    private let pictureInfoLabel = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .white
        }
        
        titleLabel.do {
            $0.text = "입장 시 유의사항"
            $0.font = .custom(.ns_sb_20)
            $0.textColor = .black
        }
        
        closetImageView.do {
            $0.image = .icIntroduceCaution1
        }
        
        petImageView.do {
            $0.image = .icIntroduceCaution2
        }
        
        foodImageView.do {
            $0.image = .icIntroduceCaution3
        }
        
        smokingImageView.do {
            $0.image = .icIntroduceCaution4
        }
        
        bookImageView.do {
            $0.image = .icIntroduceCaution5
        }
        
        pictureImageView.do {
            $0.image = .icIntroduceCaution6
        }
        
        closetLabel.do {
            $0.text = "슬리퍼, 운동복, \n등산복 입장 불가"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        petLabel.do {
            $0.text = "반려 동물 \n입장 불가"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        foodLabel.do {
            $0.text = "외부 음식 \n반입 금지"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        smokingLabel.do {
            $0.text = "금연"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
        }
        
        bookLabel.do {
            $0.text = "도서 대출 및 \n복사 불가"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        pictureLabel.do {
            $0.text = "스마트폰 사진 \n촬영 가능"
            $0.font = .custom(.ns_r_14)
            $0.textColor = .gray5
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        pictureInfoLabel.do {
            $0.text = "카메라 및 촬영 \n전문 장비 사용 불가"
            $0.font = .custom(.ns_r_12)
            $0.textColor = .gray4
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            closetImageView,
            closetLabel,
            petImageView,
            petLabel,
            foodImageView,
            foodLabel,
            smokingImageView,
            smokingLabel,
            bookImageView,
            bookLabel,
            pictureImageView,
            pictureLabel,
            pictureInfoLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        closetImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(53)
            $0.size.equalTo(32)
        }
        
        closetLabel.snp.makeConstraints {
            $0.top.equalTo(closetImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(closetImageView)
        }
        
        petImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(32)
        }
        
        petLabel.snp.makeConstraints {
            $0.top.equalTo(petImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(petImageView)
        }
        
        foodImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.trailing.equalToSuperview().inset(54)
            $0.size.equalTo(32)
        }
        
        foodLabel.snp.makeConstraints {
            $0.top.equalTo(petImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(foodImageView)
        }
        
        smokingImageView.snp.makeConstraints{
            $0.top.equalTo(closetLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(53)
            $0.size.equalTo(32)
        }
        
        smokingLabel.snp.makeConstraints{
            $0.top.equalTo(smokingImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(smokingImageView)
        }
        
        bookImageView.snp.makeConstraints{
            $0.top.equalTo(closetLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(32)
        }
        
        bookLabel.snp.makeConstraints{
            $0.top.equalTo(bookImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(petImageView)
        }
        
        pictureImageView.snp.makeConstraints{
            $0.top.equalTo(closetLabel.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().inset(54)
            $0.size.equalTo(32)
        }
        
        pictureLabel.snp.makeConstraints{
            $0.top.equalTo(pictureImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(pictureImageView)
        }
        
        pictureInfoLabel.snp.makeConstraints{
            $0.top.equalTo(pictureLabel.snp.bottom)
            $0.centerX.equalTo(pictureLabel)
        }
    }
}
