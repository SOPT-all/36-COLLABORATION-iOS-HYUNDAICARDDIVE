//
//  ReuseIdentifiable.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/12/25.
//

import UIKit

protocol ReuseIdentifiable {
    
    static var reuseIdentifier: String { get }
    
}

extension ReuseIdentifiable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
