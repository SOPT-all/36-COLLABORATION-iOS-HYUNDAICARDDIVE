//
//  HomeResponseDTO.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/21/25.
//

import Foundation

struct HomeResponseDTO: Decodable {
    let cardList: [HomeCard]
}

struct HomeCard: Decodable {
    let title: String
    let category: String
    let hashTag: String
    let imageUrl: String
}
