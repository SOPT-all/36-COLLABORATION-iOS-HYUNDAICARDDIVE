//
//  BaseService.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/15/25.
//

import Foundation

protocol BaseService {
    associatedtype Response: Decodable
    var api: APIType { get }
    
    func fetch() async throws -> Response
}

extension BaseService {
    func fetch() async throws -> Response {
        return try await APIManager.shared.request(api: api, as: Response.self)
    }
}
