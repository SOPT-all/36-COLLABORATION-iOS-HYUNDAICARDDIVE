//
//  NetworkLogger.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/14/25.
//

import Foundation

enum NetworkLogger {

    static func logRequest(_ request: URLRequest) {
        #if DEBUG
        print("💌 [REQUEST]")
        print("➡️ URL: \(request.url?.absoluteString ?? "없음")")
        print("➡️ Method: \(request.httpMethod ?? "없음")")

        if let headers = request.allHTTPHeaderFields {
            print("➡️ Headers: \(headers)")
        }

        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("➡️ Body: \(bodyString)")
        } else {
            print("➡️ Body: 없음")
        }

        print("────────────────────────────")
        #endif
    }

    static func logResponse(_ response: HTTPURLResponse, _ data: Data) {
        #if DEBUG
        print("💌 [RESPONSE]")
        print("⬅️ Status Code: \(response.statusCode)")

        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
           let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
           let prettyString = String(data: prettyData, encoding: .utf8) {
            print("📄 Response Body:\n\(prettyString)")
        } else if let rawString = String(data: data, encoding: .utf8) {
            print("📄 Raw Body:\n\(rawString)")
        } else {
            print("📄 응답 디코딩 실패")
        }

        print("────────────────────────────")
        #endif
    }

    static func logError(_ error: Error) {
        #if DEBUG
        print("❌ [ERROR]")
        print("💥 \(error.localizedDescription)")
        print("────────────────────────────")
        #endif
    }
}

