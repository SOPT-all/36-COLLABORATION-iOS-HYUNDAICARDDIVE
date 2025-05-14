import Foundation
import UIKit
import SnapKit

enum NavigationBarType {
    case article
    case spaceAndCulture
    case backButton
}

extension NavigationBarType {
    
    static func makeAppearance(type: Self) -> UINavigationBarAppearance {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .white
        barAppearance.backgroundImageContentMode = .scaleAspectFit
        
        switch type {
        case .article :
            return customTitleImageBarAppearance(
                appearance: barAppearance,
                image: .logoArticle,
                width: 66,
                height: 16
            )
            
        case .spaceAndCulture :
            return customTitleImageBarAppearance(
                appearance: barAppearance,
                image: .logoSpaceCulture,
                width: 146,
                height: 24
            )
            
        default :
            return barAppearance
        }
    }
    
    static func makeBackButtonImage() -> UIImage {
        return .icSpaceDetailChevronLeft.resize(targetSize: CGSize(width: 28, height: 28))
            .withRenderingMode(.alwaysTemplate)
    }
    
    private static func customTitleImageBarAppearance(appearance: UINavigationBarAppearance, image: UIImage, width: CGFloat, height: CGFloat) -> UINavigationBarAppearance {
        
            appearance.backgroundImage = image.resize(targetSize: CGSize(width: width, height: height))
            appearance.backgroundImageContentMode = .bottom
            return appearance
    }
}
