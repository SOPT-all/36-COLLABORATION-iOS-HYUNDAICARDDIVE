//
//  SpaceInfoResponseDTO.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import Foundation

struct SpaceInfoResponseDTO: Decodable {
    let banner: String
    let introduction: String
    let address: String
    let reviewList: [Review]
    let telephone: String
    let email: String
}

struct Review: Decodable {
    let imageUrl: String
    let reviewer: String
    var likeCount: Int
    var isLiked: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl
        case reviewer
        case likeCount
    }
}
