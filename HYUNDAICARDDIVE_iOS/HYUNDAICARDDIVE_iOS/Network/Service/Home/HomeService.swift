//
//  HomeService.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/21/25.
//

import Foundation

final class HomeService {
    func fetchHome(
        sortOption: String? = nil,
        category: String? = nil
    ) async throws -> HomeResponseDTO {
        let api = APIType.home(sortOption: sortOption, Category: category)
        return try await APIManager.shared.request(api: api, as: HomeResponseDTO.self)
    }
}
