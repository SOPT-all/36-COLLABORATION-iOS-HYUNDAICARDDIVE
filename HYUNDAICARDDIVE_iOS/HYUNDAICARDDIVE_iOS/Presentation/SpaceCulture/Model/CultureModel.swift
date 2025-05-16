import UIKit

struct CultureModel {
    let image: UIImage
    let description: String
    
    static func makeData() -> [Self] {
        return [
            CultureModel(
                image: .logoSuper,
                description: "레전드 아티스트의\n독보적 무대"
            ),
            CultureModel(
                image: .logoCulture,
                description: "이 시대의\n컬쳐 아이콘"
            ),
            CultureModel(
                image: .logoDavinci,
                description: "지성과 감성의\n컬래버레이션"
            ),
            CultureModel(
                image: .logoOver,
                description: "프로들의\n실전 특강"
            ),
            CultureModel(
                image: .logoFan,
                description: "팬들이 직접 만드는\n랜선 LIVE"
            ),
            CultureModel(
                image: .logoLimited,
                description: "한정판 바이닐을\n가장 먼저 만나는 곳"
            )
        ]
    }
}
