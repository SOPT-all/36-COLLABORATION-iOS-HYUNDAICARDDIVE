//
//  UIStackView+.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by MaengKim on 5/12/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
