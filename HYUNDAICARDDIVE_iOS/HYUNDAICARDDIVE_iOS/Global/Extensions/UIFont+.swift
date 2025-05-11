import UIKit

extension UIFont {
    
    static func custom(_ style: CustomFont) -> UIFont {
        return UIFont(name: style.weight, size: style.size) ?? .systemFont(ofSize: style.size)
    }
    
    enum CustomFont {
        private static let scaleRatio: CGFloat = max(Screen.height(1), Screen.width(1))
        
        case yai_20_22, yai_16_22
        case ns_32_48_b, ns_16_24_b, ns_14_21_b
        case ns_22_33_eb
        case ns_20_30_sb, ns_16_24_sb, ns_14_21_sb, ns_12_18_sb, ns_9_13_sb
        case ns_16_24_r, ns_14_21_r, ns_12_18_r, ns_11_16_r, ns_10_15_r
        case ns_13_20_m, ns_12_22_m, ns_12_18_m, ns_11_16_m, ns_10_15_m, ns_10_10_m
        
        var weight: String {
            switch self {
            case .yai_20_22, .yai_16_22:
                "YouandiModern"
            case .ns_32_48_b, .ns_16_24_b, .ns_14_21_b:
                "NotoSansKR-Bold"
            case .ns_22_33_eb:
                "NotoSansKR-ExtraBold"
            case .ns_20_30_sb, .ns_16_24_sb, .ns_14_21_sb, .ns_12_18_sb, .ns_9_13_sb:
                "NotoSansKR-SemiBold"
            case .ns_16_24_r, .ns_14_21_r, .ns_12_18_r, .ns_11_16_r, .ns_10_15_r:
                "NotoSansKR-Regualr"
            case .ns_13_20_m, .ns_12_22_m, .ns_12_18_m, .ns_11_16_m, .ns_10_15_m, .ns_10_10_m:
                "NotoSansKR-Medium"
            }
        }
        
        var size: CGFloat {
            return defaultSize * CustomFont.scaleRatio
        }
        
        private var defaultSize: CGFloat {
            switch self {
            case .ns_32_48_b: 32
            case .ns_22_33_eb: 22
            case .yai_20_22, .ns_20_30_sb: 20
            case .yai_16_22, .ns_16_24_b, .ns_16_24_sb, .ns_16_24_r: 16
            case .ns_14_21_b, .ns_14_21_sb, .ns_14_21_r: 14
            case .ns_13_20_m: 13
            case .ns_12_18_sb, .ns_12_18_r, .ns_12_22_m, .ns_12_18_m: 12
            case .ns_11_16_r, .ns_11_16_m: 11
            case .ns_10_15_r, .ns_10_15_m, .ns_10_10_m: 10
            case .ns_9_13_sb: 9
            }
        }
        
        var letterSpacing: CGFloat {
            switch self {
            case .ns_32_48_b, .ns_22_33_eb, .ns_16_24_b, .ns_16_24_r, .ns_14_21_r, .ns_13_20_m, .ns_11_16_r, .ns_10_15_m, .ns_9_13_sb:
                CGFloat(0) / 100 * size
            case .ns_12_18_m, .ns_12_18_r:
                CGFloat(-0.1) / 100 * size
            case .ns_16_24_sb:
                CGFloat(-0.2) / 100 * size
            case .yai_20_22, .yai_16_22, .ns_20_30_sb, .ns_14_21_b, .ns_14_21_sb, .ns_12_22_m, .ns_11_16_m, .ns_10_15_r:
                CGFloat(-0.3) / 100 * size
            case .ns_10_10_m:
                CGFloat(-0.5) / 100 * size
            case .ns_12_18_sb:
                CGFloat(-0.6) / 100 * size
            }
        }
        
        var lineHeight: CGFloat {
            switch self {
            case .ns_32_48_b: 48
            case .ns_22_33_eb: 33
            case .ns_20_30_sb: 30
            case .ns_16_24_b, .ns_16_24_sb, .ns_16_24_r: 24
            case .yai_20_22, .yai_16_22, .ns_12_22_m: 22
            case .ns_14_21_b, .ns_14_21_sb, .ns_14_21_r: 21
            case .ns_13_20_m: 20
            case .ns_12_18_sb, .ns_12_18_r, .ns_12_18_m: 18
            case .ns_11_16_r, .ns_11_16_m: 16
            case .ns_10_15_r, .ns_10_15_m: 15
            case .ns_9_13_sb: 13
            case .ns_10_10_m: 10
            }
        }
    }
}
