//
//  APIManager.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/15/25.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func request<T: Decodable>(
        api: APIType,
        as type: T.Type
    ) async throws -> T {
        guard let url = api.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NetworkLogger.logRequest(request)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseDecodingError
        }
        
        NetworkLogger.logResponse(httpResponse, data)
        
        do {
            let decoded = try JSONDecoder().decode(BaseResponse<T>.self, from: data)
            
            guard decoded.code == "success" else {
                throw NetworkError.serverMessage(decoded.message ?? "서버 오류 발생")
            }
            
            guard let result = decoded.data else {
                throw NetworkError.noData
            }
            
            return result
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
