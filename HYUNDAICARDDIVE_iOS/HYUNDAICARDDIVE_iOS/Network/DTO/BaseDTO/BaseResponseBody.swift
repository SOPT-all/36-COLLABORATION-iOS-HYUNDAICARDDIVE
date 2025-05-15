//
//  BaseResponse.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/15/25.
//

import Foundation

struct BaseResponseBody<T: Decodable>: Decodable {
    let code: String
    let message: String?
    let data: T?
}
