//
//  SpaceInfoService.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/16/25.
//

import Foundation

final class SpaceInfoService {
    func fetchSpaceInfo() async throws -> SpaceInfoResponseDTO {
        return try await APIManager.shared.request(api: .spaceDetail, as: SpaceInfoResponseDTO.self)
    }
}
