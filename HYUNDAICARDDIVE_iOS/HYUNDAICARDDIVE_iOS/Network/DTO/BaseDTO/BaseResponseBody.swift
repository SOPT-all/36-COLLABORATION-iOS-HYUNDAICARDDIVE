//
//  BaseResponse.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/15/25.
//

import Foundation

struct BaseResponseBody<T: Decodable>: Decodable {
    let message: String?
    let data: T?
    let code: Int
}
