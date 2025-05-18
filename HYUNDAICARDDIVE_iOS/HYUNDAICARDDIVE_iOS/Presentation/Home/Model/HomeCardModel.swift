//
//  HomeCardModel.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import Foundation

struct HomeCardModel: Codable {
    let imageUrl: String
    let category: String
    let title: String
    let subtitle: String

    enum CodingKeys: String, CodingKey {
        case imageUrl
        case category
        case title
        case subtitle = "hashTag"
    }
}

let dummyCards: [HomeCardModel] = [
    HomeCardModel(
        imageUrl: "ios_img_contents_big1",
        category: "쿠킹·고메",
        title: "집밥은 아쉬운\n그런 날 있잖아",
        subtitle: "신상 맛집 #21"
    ),
    HomeCardModel(
        imageUrl: "ios_img_contents_big2",
        category: "여행",
        title: "예술 세계 속으로",
        subtitle: "디깅 투어 #2\n대구·경주 건축 여행"
    ),
    HomeCardModel(
        imageUrl: "ios_img_contents_big3",
        category: "테크",
        title: "집안일 해방일지",
        subtitle: "살림을 도와줄\n스마트 홈 아이템 3"
    ),
    HomeCardModel(
        imageUrl: "ios_img_contents_big4",
        category: "건축·인테리어",
        title: "식탁에도\n새 옷으로",
        subtitle: "멋을 더해 줄 주방 아이템"
    ),
    HomeCardModel(
        imageUrl: "ios_img_contents_big5",
        category: "스타일",
        title: "남다른 쇼핑",
        subtitle: "집처럼 친근한\n브랜드 공간 공간 탐험 3"
    ),
    HomeCardModel(
        imageUrl: "ios_img_contents_big6",
        category: "쿠킹·고메",
        title: "여름 한입",
        subtitle: "[맛집 모음zip]\n지역별 특별한 빙수집 8"
    )
]
