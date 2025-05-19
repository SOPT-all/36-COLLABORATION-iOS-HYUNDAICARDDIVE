//
//  APIType.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/15/25.
//

import Foundation

enum APIType {
    case home(sortOption: String?, Category: String?)
    case culture
    case spaceDetail
    case space
}

extension APIType {
    var url: URL? {
        switch self {
        case .home(let sortOption, let category):
            var components = URLComponents(string: Environment.baseURL + "/home")
            components?.queryItems = [
                URLQueryItem(name: "sortOption", value: sortOption ?? "recommended"),
                URLQueryItem(name: "category", value: category ?? "total")
            ]
            return components?.url
        case .culture:
            return URL(string: Environment.baseURL + "/culture")
        case .spaceDetail:
            return URL(string: Environment.baseURL + "/space/details")
        case .space:
            return URL(string: Environment.baseURL + "/space")
        }
    }
}
