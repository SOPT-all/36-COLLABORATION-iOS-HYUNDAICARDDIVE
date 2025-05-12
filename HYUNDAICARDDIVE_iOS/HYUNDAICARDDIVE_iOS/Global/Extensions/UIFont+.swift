import UIKit

extension UIFont {
    
    static func custom(_ style: CustomFont) -> UIFont {
        return UIFont(name: style.weight, size: style.size) ?? .systemFont(ofSize: style.size)
    }
    
    enum CustomFont {
        private static let scaleRatio: CGFloat = max(Screen.height(1), Screen.width(1))
        
        case yni_20, yni_16
        case ns_b_32, ns_b_16, ns_b_14
        case ns_eb_22
        case ns_sb_20, ns_sb_16, ns_sb_14, ns_sb_12, ns_sb_9
        case ns_r_16, ns_r_14, ns_r_12, ns_r_11, ns_r_10
        case ns_m_13, ns_m_12_22, ns_m_12_18, ns_m_11, ns_10_15_m, ns_m_10
        
        var weight: String {
            switch self {
            case .yni_20, .yni_16:
                "YouandiModern"
            case .ns_b_32, .ns_b_16, .ns_b_14:
                "NotoSansKR-Bold"
            case .ns_eb_22:
                "NotoSansKR-ExtraBold"
            case .ns_sb_20, .ns_sb_16, .ns_sb_14, .ns_sb_12, .ns_sb_9:
                "NotoSansKR-SemiBold"
            case .ns_r_16, .ns_r_14, .ns_r_12, .ns_r_11, .ns_r_10:
                "NotoSansKR-Regualr"
            case .ns_m_13, .ns_m_12_22, .ns_m_12_18, .ns_m_11, .ns_10_15_m, .ns_m_10:
                "NotoSansKR-Medium"
            }
        }
        
        var size: CGFloat {
            return defaultSize * CustomFont.scaleRatio
        }
        
        private var defaultSize: CGFloat {
            switch self {
            case .ns_b_32: 32
            case .ns_eb_22: 22
            case .yni_20, .ns_sb_20: 20
            case .yni_16, .ns_b_16, .ns_sb_16, .ns_r_16: 16
            case .ns_b_14, .ns_sb_14, .ns_r_14: 14
            case .ns_m_13: 13
            case .ns_sb_12, .ns_r_12, .ns_m_12_22, .ns_m_12_18: 12
            case .ns_r_11, .ns_m_11: 11
            case .ns_r_10, .ns_10_15_m, .ns_m_10: 10
            case .ns_sb_9: 9
            }
        }
        
        var letterSpacing: CGFloat {
            switch self {
            case .ns_b_32, .ns_eb_22, .ns_b_16, .ns_r_16, .ns_r_14, .ns_m_13, .ns_r_11, .ns_10_15_m, .ns_sb_9:
                CGFloat(0) / 100 * size
            case .ns_m_12_18, .ns_r_12:
                CGFloat(-0.1) / 100 * size
            case .ns_sb_16:
                CGFloat(-0.2) / 100 * size
            case .yni_20, .yni_16, .ns_sb_20, .ns_b_14, .ns_sb_14, .ns_m_12_22, .ns_m_11, .ns_r_10:
                CGFloat(-0.3) / 100 * size
            case .ns_m_10:
                CGFloat(-0.5) / 100 * size
            case .ns_sb_12:
                CGFloat(-0.6) / 100 * size
            }
        }
        
        var lineHeight: CGFloat {
            switch self {
            case .ns_b_32: 48
            case .ns_eb_22: 33
            case .ns_sb_20: 30
            case .ns_b_16, .ns_sb_16, .ns_r_16: 24
            case .yni_20, .yni_16, .ns_m_12_22: 22
            case .ns_b_14, .ns_sb_14, .ns_r_14: 21
            case .ns_m_13: 20
            case .ns_sb_12, .ns_r_12, .ns_m_12_18: 18
            case .ns_r_11, .ns_m_11: 16
            case .ns_r_10, .ns_10_15_m: 15
            case .ns_sb_9: 13
            case .ns_m_10: 10
            }
        }
    }
}
