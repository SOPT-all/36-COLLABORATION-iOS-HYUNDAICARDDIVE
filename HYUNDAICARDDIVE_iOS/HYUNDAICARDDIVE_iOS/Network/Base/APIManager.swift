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
            let decoded = try JSONDecoder().decode(BaseResponseBody<T>.self, from: data)
            
            guard decoded.code == 200 else {
                throw NetworkError.serverMessage(decoded.message ?? "서버 오류 발생")
            }
            
            guard let result = decoded.data else {
                throw NetworkError.noData
            }
            
            return result
        } catch {
            print("❌ 디코딩 실패:", error)
            print("📄 응답 본문:", String(data: data, encoding: .utf8) ?? "디코딩 불가")
            throw NetworkError.responseDecodingError
        }
    }
}
