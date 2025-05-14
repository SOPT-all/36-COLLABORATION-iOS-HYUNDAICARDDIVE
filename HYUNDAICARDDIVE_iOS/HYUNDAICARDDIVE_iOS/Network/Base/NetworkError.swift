//
//  NetworkError.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/14/25.
//

import Foundation

enum NetworkError: Error {
    case requestEncodingError
    case responseDecodingError
    case invalidURL
    case noData
    case unknownError
    case serverMessage(String)
    
    var errorDescription: String {
        switch self {
        case .requestEncodingError:
            return "인코딩 에러"
        case .responseDecodingError:
            return "디코딩 에러"
        case .invalidURL:
            return "잘못된 URL."
        case .noData:
            return "데이터 없음"
        case .unknownError:
            return "알 수 없는 에러"
        case .serverMessage(let message):
            return message
        }
    }
}

