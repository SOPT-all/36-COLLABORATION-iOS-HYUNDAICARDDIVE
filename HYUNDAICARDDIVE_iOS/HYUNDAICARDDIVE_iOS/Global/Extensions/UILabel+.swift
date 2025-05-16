//
//  UILabel+.swift
//  HYUNDAICARDDIVE_iOS
//
//  Created by 조영서 on 5/17/25.
//

import UIKit

extension UILabel {

    static func paddedLabel(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UILabel {
        return PaddedLabel(top: top, left: left, bottom: bottom, right: right)
    }

    private class PaddedLabel: UILabel {
        private var topInset: CGFloat
        private var bottomInset: CGFloat
        private var leftInset: CGFloat
        private var rightInset: CGFloat

        init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
            self.topInset = top
            self.bottomInset = bottom
            self.leftInset = left
            self.rightInset = right
            super.init(frame: .zero)
        }

        required init?(coder: NSCoder) {
            self.topInset = 0
            self.bottomInset = 0
            self.leftInset = 0
            self.rightInset = 0
            super.init(coder: coder)
        }

        override func drawText(in rect: CGRect) {
            let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            super.drawText(in: rect.inset(by: insets))
        }

        override var intrinsicContentSize: CGSize {
            let size = super.intrinsicContentSize
            return CGSize(width: size.width + leftInset + rightInset,
                          height: size.height + topInset + bottomInset)
        }
    }
}
