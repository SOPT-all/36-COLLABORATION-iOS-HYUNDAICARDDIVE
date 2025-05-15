//
//  Environment.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/14/25.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
